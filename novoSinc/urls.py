from django.contrib import admin
from django.urls import path, include
from aplicacao.views import login_view

urlpatterns = [
    #path('admin/', admin.site.urls),
    path('', login_view, name= "Login"),
    path('', include('aplicacao.urls')),
]