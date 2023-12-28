from django.forms import ModelForm
from django import forms
from aplicacao.models import Modelo

class ModeloForm(forms.ModelForm):
    class Meta:
        model = Modelo
        fields = '__all__'

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['conteudo'].widget = forms.Textarea(attrs={'class': 'your-custom-class'})