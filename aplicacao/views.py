from django.shortcuts import get_object_or_404, render, redirect
from django.http import HttpResponse, HttpResponseRedirect
from aplicacao.emails import enviar_email,notificar_clientes_teste
from aplicacao.forms import QueryForm
from django.urls import reverse
from django.contrib import messages
from aplicacao.filters import QueryFilter
from django.template.loader import get_template
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from rest_framework import generics, permissions
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework import status
from rest_framework.views import APIView
from django.contrib.auth import authenticate, login, logout
from datetime import datetime

import cx_Oracle

from aplicacao.models import Query, Envio
from aplicacao.queries import faturas_vencidas, faturas_proximas_vencer

import logging

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)

# Create your views here.
def app_view(request):
    return render(request, 'pages/queries.html')

def lista_queries(request):
    query_list = Query.objects.all()

    paginator = Paginator(query_list, 10)  # Show 10 queries per page
    page = request.GET.get('page')  # Fix the parameter name

    try:
        queries = paginator.page(page)
    except PageNotAnInteger:
        # If page is not an integer, deliver the first page.
        queries = paginator.page(1)
    except EmptyPage:
        # If the page is out of range, deliver the last page of results.
        queries = paginator.page(paginator.num_pages)

    return render(request, 'pages/queries.html', {'queries': queries})

    #context = {'queries': query}
    #return render(request, "pages/queries.html", context)

def edita_query(request, id):
    query = Query.objects.get(id=id)
    if request.method == 'GET':
        context = {'form' : QueryForm(instance=query), 'id':id}
        return render(request,'pages/edita_query.html',context)
    #usar strip
    elif request.method == 'POST':
        form = QueryForm(request.POST or None)
        context = {'form': form}
        query.nome = form["nome"].data
        query.query = form["query"].data
        query.descricao = form["descricao"].data
        query.save()
        query = Query.objects.all
        context = {'queries': query}
        return render(request, 'pages/queries.html',context)

def sobre(request):
    return render(request, "pages/sobre.html")

def exibe_query(request, id):
    query = Query.objects.get(id=id)
    context = {'query': query}
    return render(request, "pages/exibe_query.html", context)

def inclui_query(request):
    context = {}
    form = QueryForm(request.POST or None)
    if form.is_valid():
        form.save()

    context = {'form': form}
    if request.POST:
        return HttpResponseRedirect('lista_queries')
    else:
        return render(request, 'pages/inclui_query.html',context)

def deleta_query(request, id):

    try:
        obj = get_object_or_404(Query, id=id)
        obj.delete()
        messages.info(request, "Query excluída com sucesso!")
    except Exception:
        messages.error(request, "Erro na tentativa de exclusão da query!")

    return HttpResponseRedirect('/aplicacao/lista_queries')

def login_view(request, *args):    
    context={}

    if request.method == "POST":
        username = request.POST['login']
        password = request.POST['senha']
        user = authenticate(username=username, password=password)
        if user is not None:
            login(request, user)
        else:
            return render(request, 'login.html', {'aviso':'Usuário ou senha incorretos'})
        

    if request.user.is_authenticated:
        return render(request, 'pages/teste.html')
        #return redirect("aplicacao/teste.html")    

    return render(request, 'login.html', context)
    

def logout_view(request):
    logout(request)
    return redirect("/")

def testa_envio(request):
  
    rows = faturas_proximas_vencer()
    
    cliente = rows[0]
    print("pouco antes do envio de e-mail, no método de teste na view")
    logger.info('pouco antes do envio de e-mail, no método de teste na view')
    enviar_email(2,'igor.oliveira@copergas.com.br','',cliente)

    return render(request, 'pages/teste.html', {'data': rows})

    #['pablo.logiquesistemas@copergas.com.br']

def testa_envio_todos(request):
    print("Antes da captura de todos os clientes na condição de faturas próximas ao vencimento")
    clientes = faturas_proximas_vencer()
    print("Dicionário de clientes setado")
    notificar_clientes_teste(2,clientes)
    print("Após envio dos e-mails")

    return render(request, 'pages/teste.html', {'clientes': clientes})

def proximas_a_vencer(request):
    context = {}
    if request.method == 'GET':
        clientes = Envio.objects.all().filter(tipo_envio = "Próximas a vencer").order_by('id')
        total = clientes.count()
        total_enviados = clientes.filter(status_envio = 'Enviado').count()
        nao_enviados = total - total_enviados

        context = {'clientes': clientes, 'total': total, 'total_enviados': total_enviados, 'nao_enviados': nao_enviados}

        return render(request, 'pages/relatorio_proximas.html', context)
    elif request.method == 'POST':
        date_string1 = request.POST['data1']
        date_string2 = request.POST['data2']

        date_object1 = datetime.strptime(date_string1, '%d/%m/%Y')
        date_object2 = datetime.strptime(date_string2, '%d/%m/%Y')

        # Convert the datetime object to the desired format
        data1 = date_object1.strftime('%Y-%m-%d %H:%M:%S')
        data2 = date_object2.strftime('%Y-%m-%d %H:%M:%S')

        clientes = Envio.objects.filter(tipo_envio = "Próximas a vencer").filter(data_envio__gt=data1, data_envio__lt=data2).order_by('id')
        total = clientes.count()
        total_enviados = clientes.filter(status_envio='Enviado').count()
        nao_enviados = total - total_enviados
        context = {'clientes': clientes, 'total': total, 'total_enviados': total_enviados, 'nao_enviados': nao_enviados}

        return render(request, 'pages/relatorio_proximas.html', context)

def vencidas(request):
    context = {}
    if request.method == 'GET':
        clientes = Envio.objects.all().filter(tipo_envio = "Vencidas").order_by('id')
        total = clientes.count()
        total_enviados = clientes.filter(status_envio = 'Enviado').count()
        nao_enviados = total - total_enviados

        context = {'clientes': clientes, 'total': total, 'total_enviados': total_enviados, 'nao_enviados': nao_enviados}

        return render(request, 'pages/relatorio_vencidas.html', context)
    elif request.method == 'POST':
        date_string1 = request.POST['data1']
        date_string2 = request.POST['data2']

        date_object1 = datetime.strptime(date_string1, '%d/%m/%Y')
        date_object2 = datetime.strptime(date_string2, '%d/%m/%Y')

        # Convert the datetime object to the desired format
        data1 = date_object1.strftime('%Y-%m-%d %H:%M:%S')
        data2 = date_object2.strftime('%Y-%m-%d %H:%M:%S')

        clientes = Envio.objects.filter(tipo_envio = "Vencidas").filter(data_envio__gt=data1, data_envio__lt=data2).order_by('id')
        total = clientes.count()
        total_enviados = clientes.filter(status_envio='Enviado').count()
        nao_enviados = total - total_enviados
        context = {'clientes': clientes, 'total': total, 'total_enviados': total_enviados, 'nao_enviados': nao_enviados}

        return render(request, 'pages/relatorio_vencidas.html', context)