from django.conf.urls import url
from .views import index, clientes, cliente_detalhes, pedidos, motoqueiros, usuarios, cardapio

urlpatterns = [
    url(r'^$', index, name="index"),    
    url(r'^clientes/$', clientes, name="clientes"),
    url(r'^clientes/(?P<cliente_id>\w{0,50})/$', cliente_detalhes, name="clientes_detalhes"),
    url(r'^pedidos/$', pedidos, name="pedidos"),
    url(r'^usuarios/$', usuarios, name="usuarios"),
    url(r'^motoqueiros/$', motoqueiros, name="motoqueiros"),
    url(r'^cardapio/$', cardapio, name="cardapio"),
]