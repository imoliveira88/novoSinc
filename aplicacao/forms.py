from django.forms import ModelForm
from django import forms
from aplicacao.models import Modelo

class ModeloForm(forms.ModelForm):
    class Meta:
        model = Modelo
        fields = '__all__'
