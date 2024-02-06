from django.db import models
from django.contrib.auth.models import AbstractUser, UserManager
from django.conf import settings
from django.db.models.signals import post_save
from django.dispatch import receiver
from rest_framework.authtoken.models import Token

class Usuario(AbstractUser):
    username = models.CharField('Login', unique=True, max_length=40, blank=False)

    def __str__(self):
        return self.username

    USERNAME_FIELD = 'username'
    objects = UserManager()

    class Meta:
        verbose_name = 'Usuario'
        verbose_name_plural = 'Usuarios'
        ordering = ['username']

@receiver(post_save, sender=settings.AUTH_USER_MODEL)
def create_auth_token(sender, instance=None, created=False, **kwargs):
    if created:
        Token.objects.create(user=instance)

class Envio(models.Model):
    contrato = models.CharField('Contrato', max_length=10, blank=False)
    email = models.CharField('E-mail', max_length=50)
    titulo = models.CharField('Titulo', max_length=20)
    data_envio = models.DateTimeField('Data')
    tipo_envio = models.CharField('Tipo', max_length=20)
    status_envio = models.CharField('Status',max_length=20)
    data_vencimento = models.CharField('Data_Vencimento',max_length=20)

    class Meta:
        verbose_name = 'Envio'
        verbose_name_plural = 'Envios'
        ordering = ['contrato']

class Historico(models.Model):
    usuario = models.ForeignKey('Usuario', verbose_name='Historico', db_column='usuario_id', on_delete=models.PROTECT)
    data_login = models.DateTimeField('Data')
    acao = models.CharField('Acao', max_length=100)

class Modelo(models.Model):
    nome = models.CharField(max_length=30, unique=True)
    conteudo= models.TextField()
    emails = models.CharField(max_length=200, unique=False)
    #Campo emails: campo que armazenará endereços de e-mail que receberão relatório resumido

    def __str__(self):
        return self.name

class Query(models.Model):
    nome = models.CharField('Nome', unique=True, max_length=100, blank=False)
    sql = models.CharField('SQL', unique=True, max_length=5000, blank=False)

    def __str__(self):
        return self.nome

    class Meta:
        verbose_name = 'Query'
        verbose_name_plural = 'Queries'
        ordering = ['nome']