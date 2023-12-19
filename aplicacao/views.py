from django.shortcuts import get_object_or_404, render, redirect
from django.http import HttpResponse, HttpResponseRedirect
from aplicacao.emails import enviar_email
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

import cx_Oracle

from aplicacao.models import Query
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
    # Connect to the Oracle database
    """ connection = cx_Oracle.connect(
        user="SINC_INADIPLENTES",
        password="AN4LISYS_IN4D1",
        dsn="192.168.1.46:1521/piramide.intranet.copergas.com.br"
    )

    # Create a cursor
    cursor = connection.cursor()

    # Execute a sample query (replace with your actual query)
    query = "SELECT NUMPEDC, CODPROD FROM ITENS_PED_COMPRA FETCH FIRST 10 ROWS ONLY"
    cursor.execute(query)

    # Fetch all rows
    rows = cursor.fetchall()

    # Close the cursor and connection
    cursor.close()
    connection.close() """
    
    rows = faturas_proximas_vencer()
    
    cliente = rows[0]
    print("pouco antes do envio de e-mail, no método de teste na view")
    logger.info('pouco antes do envio de e-mail, no método de teste na view')
    enviar_email(2,'igor.oliveira@copergas.com.br','',cliente)

    return render(request, 'pages/teste.html', {'data': rows})

    #['pablo.logiquesistemas@copergas.com.br']