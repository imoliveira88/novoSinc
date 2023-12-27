from django.urls import path
from django.conf.urls import handler404
from aplicacao.views import custom_404, deleta_query, edita_modelo, lista_queries, app_view, sobre, testa_envio, logout_view, testa_envio_todos, proximas_a_vencer, vencidas, status, historico_logins, modelos

handler404 = custom_404

urlpatterns = [
    path('aplicacao/', app_view),
    #path('', lista_queries),
    path('aplicacao/lista_queries', lista_queries, name="queries"),
    path('aplicacao/edita_modelo/<int:id>/', edita_modelo, name="edita_modelo"),
    path('aplicacao/deleta_query/<int:id>/', deleta_query, name='deleta_query'),
    path('aplicacao/teste', testa_envio, name="teste"),
    path('aplicacao/teste_envio_todos', testa_envio_todos, name="teste_todos"),
    path('aplicacao/relatorio_proximas', proximas_a_vencer, name="relatorio_proximas"),
    path('aplicacao/relatorio_vencidas', vencidas, name="relatorio_vencidas"),
    path('aplicacao/historico_logins', historico_logins, name='historico_logins'),
    path('aplicacao/modelos', modelos, name='modelos'),
    path('aplicacao/logout', logout_view, name='logout'),
    path('aplicacao/sobre', sobre, name='sobre'),
    path('aplicacao/status',status, name='status'),
    #path('login', LoginView.as_view(), name="login"),
    #path('register', RegisterView.as_view(), name="register")
]