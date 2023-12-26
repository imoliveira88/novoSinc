from django.shortcuts import render, redirect
from django.contrib import messages
from django.http import Http404, HttpResponseForbidden

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