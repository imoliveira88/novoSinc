from django.forms import ModelForm
from django import forms
from aplicacao.models import Query

class QueryForm(ModelForm):
    query = forms.CharField(widget=forms.Textarea(attrs={"rows":"5", "cols":"600",'class':'form-control','placeholder': 'Query'}))
    descricao = forms.CharField(widget=forms.Textarea(attrs={"rows":"2", "cols":"100",'class':'form-control','placeholder': 'Descrição'}))
    class Meta:
        model = Query
        fields = '__all__'
