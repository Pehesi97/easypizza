from django.shortcuts import render, redirect
from django.contrib import messages

from CRUD.models import Produto, Cliente, Atendente, Motoqueiro, Pedido

# Create your views here.
def index(request):
    return render(request, 'index.html')

def clientes(request):
    activeTab = 'clientes'
    clientes = Cliente.objects.all()
    return render(request, 'clientes.html', {'clientes' : clientes, 'activeTab' : activeTab})

def atendentes(request):
    activeTab = 'atendentes'
    atendentes = Atendente.objects.all()
    return render(request, 'atendentes.html', {'atendentes' : atendentes, 'activeTab' : activeTab})

def motoqueiros(request):
    activeTab = 'motoqueiros'
    motoqueiros = Motoqueiro.objects.all()
    return render(request, 'motoqueiros.html', {'motoqueiros' : motoqueiros, 'activeTab' : activeTab})

def pedidos(request):
    activeTab = 'pedidos'    
    pedidos = Pedido.objects.all()
    for pedido in pedidos:
        if pedido.status == 0:
            pedido.status = 'Em preparo'
        elif pedido.status == 1:
            pedido.status = 'Entregue'
        elif pedido.status == 2:
            pedido.status = 'Aguardando entrega'                                        

    return render(request, 'pedidos.html', {'pedidos' : pedidos, 'activeTab' : activeTab})

def cardapio(request):
    activeTab = 'cardapio'
    produtos = Produto.objects.all()
    for produto in produtos:
        if produto.type == 0:
            produto.type = "Pizza"
        else:
            produto.type = "Bebida"

    return render(request, 'cardapio.html', {'produtos' : produtos, 'activeTab' : activeTab})