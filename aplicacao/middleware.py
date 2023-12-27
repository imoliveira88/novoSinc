from django.shortcuts import render, redirect
from django.contrib import messages
from django.http import Http404, HttpResponseForbidden
from aplicacao.models import Historico
from django.utils import timezone
from datetime import datetime

class Custom404Middleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        try:
            response = self.get_response(request)
        except Http404:
            # If a 404 error occurs, add a warning message and redirect to the login page
            messages.warning(request, "The page you tried to access does not exist.")
            return redirect('login')  # Assuming 'login' is the name of your login URL
        except HttpResponseForbidden:
            # If a forbidden (403) error occurs, add a warning message and redirect to the login page
            messages.warning(request, "You don't have permission to access this page.")
            return redirect('login')  # Assuming 'login' is the name of your login URL

        return response

class URLLoggingMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        response = self.get_response(request)

        if request.user.is_authenticated:
            # Log the URL visited by the authenticated user
            url = request.path
            usuario = request.user
            data_login = timezone.now()
            if url == '/':
                acao = 'Login'
            elif "/aplicacao/" in url:
                acao = url.replace("/aplicacao/", "")
            else:
                acao = f"{url}"

            Historico.objects.create(usuario=usuario, data_login=data_login, acao=acao)

        return response