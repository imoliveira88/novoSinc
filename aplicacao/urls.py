from django.urls import path
from aplicacao.views import deleta_query, edita_query, inclui_query, lista_queries, app_view, sobre, exibe_query, query_oracle_database, logout_view

urlpatterns = [
    path('aplicacao/', app_view),
    #path('', lista_queries),
    path('aplicacao/inclui_query', inclui_query, name="inclui_query"),
    path('aplicacao/lista_queries', lista_queries, name="queries"),
    path('aplicacao/edita_query/<int:id>/', edita_query, name="edita_query"),
    path('aplicacao/deleta_query/<int:id>/', deleta_query, name='deleta_query'),
    path('aplicacao/exibe_query/<int:id>/', exibe_query, name='exibe_query'),
    path('aplicacao/teste', query_oracle_database, name="teste"),
    path('aplicacao/logout', logout_view, name='logout'),
    path('aplicacao/sobre', sobre, name='sobre'),
    #path('login', LoginView.as_view(), name="login"),
    #path('register', RegisterView.as_view(), name="register")
]