from django.core.management.base import BaseCommand
from django.shortcuts import get_object_or_404, render, redirect
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from aplicacao.emails import enviar_email,notificar_clientes_teste
from aplicacao.forms import QueryForm, ModeloForm
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
from datetime import datetime, timedelta
from background_task.models import Task
from django.utils import timezone
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.decorators import login_required

import cx_Oracle

from aplicacao.models import Query, Envio, Historico, Modelo
from aplicacao.queries import faturas_vencidas, faturas_proximas_vencer

from celery import shared_task
from celery.utils.log import get_task_logger
import logging

logger = get_task_logger(__name__)

"""
<h2>Schedule a Background Task</h2>
    <form method="post" action="{% url 'schedule_task' %}">
        {% csrf_token %}
        <label for="desired_time">Desired Time (HH:MM):</label>
        <input type="text" id="desired_time" name="desired_time" placeholder="HH:MM" pattern="[0-9]{2}:[0-9]{2}" title="Please enter a valid time in the format HH:MM" required>
        <br>
        <input type="submit" value="Schedule Task">
    </form> """

# Create your views here.
def app_view(request):
    return render(request, 'pages/queries.html')

def custom_404(request, exception):
    return render(request, 'login.html', status=404)

@login_required
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

@login_required
def edita_modelo(request, id):
    modelo = Modelo.objects.get(id=id)
    if request.method == 'GET':
        context = {'form' : ModeloForm(instance=modelo), 'id':id}
        return render(request,'pages/edita_modelo.html',context)
    elif request.method == 'POST':
        form = ModeloForm(request.POST or None)
        context = {'form': form}
        modelo.nome = form["nome"].data
        modelo.conteudo = form["conteudo"].data
        modelo.save()
        modelos = Modelo.objects.all
        context = {'modelos': modelos}
        return render(request, 'pages/modelos.html',context)

@login_required
def sobre(request):
    return render(request, "pages/sobre.html")

@login_required
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
        return render(request, 'pages/relatorio_proximas.html') #TODO: dashboard
        #return redirect("aplicacao/teste.html")

    return render(request, 'login.html', context)

@login_required
def logout_view(request):
    logout(request)
    return redirect("/")

@login_required
def testa_envio(request):

    rows = faturas_proximas_vencer()

    cliente = rows[0]
    print("pouco antes do envio de e-mail, no método de teste na view")
    logger.info('pouco antes do envio de e-mail, no método de teste na view')
    enviar_email(2,'igor.oliveira@copergas.com.br','',cliente)

    return render(request, 'pages/teste.html', {'data': rows})

    #['pablo.logiquesistemas@copergas.com.br']

@login_required
def testa_envio_todos(request):
    print("Antes da captura de todos os clientes na condição de faturas próximas ao vencimento")
    clientes = faturas_proximas_vencer()
    print("Dicionário de clientes setado")
    notificar_clientes_teste(2,clientes)
    print("Após envio dos e-mails")

    return render(request, 'pages/teste.html', {'clientes': clientes})

@login_required
def historico_logins(request):
    historico = Historico.objects.all().order_by('-data_login')

    return render(request, 'pages/historico_logins.html', {'historico': historico})

@login_required
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

        print(f'Data 1 {date_string1} Data 2 {date_string2}')
        if date_string1 == '':
            date_string1 = '01/01/1900'
        date_object1 = datetime.strptime(date_string1, '%d/%m/%Y')
        d1s = date_object1 - timedelta(days=1)
        if date_string2 == '':
            date_string2 = '31/12/3000'
        date_object2 = datetime.strptime(date_string2, '%d/%m/%Y')
        d2s = date_object2 + timedelta(days=1)

        # Convert the datetime object to the desired format
        data1 = d1s.strftime('%Y-%m-%d')
        data2 = d2s.strftime('%Y-%m-%d')

        clientes = Envio.objects.filter(tipo_envio = "Próximas a vencer").filter(data_envio__gt=data1, data_envio__lt=data2).order_by('id')
        total = clientes.count()
        total_enviados = clientes.filter(status_envio='Enviado').count()
        nao_enviados = total - total_enviados
        context = {'clientes': clientes, 'total': total, 'total_enviados': total_enviados, 'nao_enviados': nao_enviados}

        return render(request, 'pages/relatorio_proximas.html', context)

@login_required
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

        print(f'Data 1 {date_string1} Data 2 {date_string2}')
        if date_string1 == '':
            date_string1 = '01/01/1900'
        date_object1 = datetime.strptime(date_string1, '%d/%m/%Y')
        d1s = date_object1 - timedelta(days=1)
        if date_string2 == '':
            date_string2 = '31/12/3000'
        date_object2 = datetime.strptime(date_string2, '%d/%m/%Y')
        d2s = date_object2 + timedelta(days=1)

        # Convert the datetime object to the desired format
        data1 = d1s.strftime('%Y-%m-%d')
        data2 = d2s.strftime('%Y-%m-%d')

        clientes = Envio.objects.filter(tipo_envio = "Vencidas").filter(data_envio__gt=data1, data_envio__lt=data2).order_by('id')
        total = clientes.count()
        total_enviados = clientes.filter(status_envio='Enviado').count()
        nao_enviados = total - total_enviados
        context = {'clientes': clientes, 'total': total, 'total_enviados': total_enviados, 'nao_enviados': nao_enviados}

        return render(request, 'pages/relatorio_vencidas.html', context)

def update_html_content(request, name):
    html_content = get_object_or_404(Modelo, name=name)
    if request.method == 'POST':
        form = ModeloForm(request.POST, instance=html_content)
        if form.is_valid():
            form.save()
            return redirect('success_page')  # Redirect to a success page
    else:
        form = ModeloForm(instance=html_content)
    return render(request, 'update_html_content.html', {'form': form})

def modelos(request):
    modelos = Modelo.objects.all
    context = {'modelos': modelos}
    return render(request, 'pages/modelos.html',context)
    """ html_content = get_object_or_404(HTMLContent, name=name)
    if request.method == 'POST':
        form = HTMLContentForm(request.POST, instance=html_content)
        if form.is_valid():
            form.save()
            return redirect('success_page')  # Redirect to a success page
    else:
        form = HTMLContentForm(instance=html_content)
    return render(request, 'update_html_content.html', {'form': form}) """

# Método destinado a retornar com "ativo" caso o Novo Sinc esteja rodando. Útil para o Zabbix
def status(request):
    return JsonResponse({'status': 'ativo', 'message': 'O Novo SINC está rodando!'})


""" <h2>Update HTML Content</h2>
<form method="post" action="">
    {% csrf_token %}
    {{ form.as_p }}
    <button type="submit">Update Content</button>
</form> """