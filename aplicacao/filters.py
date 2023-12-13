import django_filters
from django_filters import CharFilter, ModelChoiceFilter
from aplicacao.models import Query
from django import forms

class QueryFilter(django_filters.FilterSet):
    filtro_descricao = CharFilter(field_name="descricao",label="Descrição contém", lookup_expr="icontains") #Outras opções "iexact"

    #query = forms.CharField(widget=forms.Textarea(attrs={"rows":"5", "cols":"600"}))
    #descricao = forms.CharField(widget=forms.Textarea(attrs={"rows":"2", "cols":"100"}))

    class Meta:
        model = Query
        fields = ['filtro_descricao']
