from django.db import models

# Create your models here.
class Produto(models.Model):
    description = models.CharField(max_length=50)
    price = models.DecimalField(max_digits=4, decimal_places=2)
    type = models.IntegerField()

class Preferencia(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    products = models.ManyToManyField(Produto)

class Cliente(models.Model):
    tel = models.CharField(max_length=11)
    name = models.CharField(max_length=50)
    address = models.CharField(max_length=100)
    call_count = models.IntegerField()    

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    preference = models.ForeignKey(Preferencia, on_delete=models.SET_NULL, blank=True, null=True)

class Motoqueiro(models.Model):
    name = models.CharField(max_length=50)
    rg = models.CharField(max_length=11)
    cpf = models.CharField(max_length=11)
    salary = models.DecimalField(max_digits=5, decimal_places=2)
    service_count = models.IntegerField()

    hired_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class Atendente(models.Model):
    username = models.CharField(max_length=20)
    name = models.CharField(max_length=50)
    rg = models.CharField(max_length=11)
    cpf = models.CharField(max_length=11)
    salary = models.DecimalField(max_digits=5, decimal_places=2)
    service_count = models.IntegerField()

    hired_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

class Pedido(models.Model):    
    status = models.IntegerField()

    client = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    deliveryman = models.ForeignKey(Motoqueiro, on_delete=models.CASCADE)
    attendant = models.ForeignKey(Atendente, on_delete=models.CASCADE)

    asked_at = models.DateTimeField(auto_now_add=True)    
    delivered_at = models.DateTimeField(null=True, blank=True, auto_now=True)
    deliver_prediction = models.DateTimeField(null=True, blank=True)

    products = models.ManyToManyField(Produto)