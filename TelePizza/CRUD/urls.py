from django.conf.urls import url
from .views import index, clientes, pedidos, motoqueiros, atendentes, cardapio

urlpatterns = [
    url(r'^$', index, name="index"),
    url(r'^clientes/$', clientes, name="clientes"),
    url(r'^pedidos/$', pedidos, name="pedidos"),
    url(r'^atendentes/$', atendentes, name="atendentes"),
    url(r'^motoqueiros/$', motoqueiros, name="motoqueiros"),
    url(r'^cardapio/$', cardapio, name="cardapio"),
]