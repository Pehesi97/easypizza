from django.shortcuts import render, redirect
from django.contrib import messages

from CRUD.models import Produto, Cliente, Usuario, Motoqueiro, Pedido, Telefone

# Create your views here.
def index(request):
    return render(request, 'index.html')

def clientes(request):
    activeTab = 'clientes'
    clientes = Cliente.objects.all()
    telefones = Telefone.objects.all()
    return render(request, 'clientes.html', {'clientes' : clientes, 'activeTab' : activeTab, 'telefones' : telefones})

def cliente_detalhes(request, cliente_id):
    activeTab = 'clientes'
    cliente = Cliente.objects.get(id=cliente_id)
    produtos = cliente.preference.products.all()
    telefones = Telefone.objects.get(cliente_id=cliente.id)
    return render(request, 'cliente_detalhes.html', {'cliente' : cliente, 'activeTab' : activeTab, 'produtos' : produtos, 'telefones' : telefones})

def usuarios(request):
    activeTab = 'usuarios'
    usuarios = Usuario.objects.all()
    for usuario in usuarios:
        if usuario.type == 0:
            usuario.type = 'Atendente'
        else:
            usuario.type = 'Departamento de Vendas'
    return render(request, 'usuarios.html', {'usuarios' : usuarios, 'activeTab' : activeTab})

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