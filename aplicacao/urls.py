from django.urls import path
from django.conf.urls import handler404
from aplicacao.views import custom_404, deleta_modelo, edita_modelo, exibe_modelo, inclui_modelo, sobre
from aplicacao.views import testa_envio, logout_view, testa_envio_todos, proximas_a_vencer, vencidas, status, historico_logins, modelos, home

handler404 = custom_404

urlpatterns = [
    path('aplicacao/', home),
    path('aplicacao/edita_modelo/<int:id>/', edita_modelo, name="edita_modelo"),
    path('aplicacao/exibe_modelo/<int:id>/', exibe_modelo, name="exibe_modelo"),
    path('aplicacao/inclui_modelo', inclui_modelo, name="inclui_modelo"),
    path('aplicacao/deleta_modelo/<int:id>/', deleta_modelo, name='deleta_modelo'),
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