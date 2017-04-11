# Easy Pizza
Este readme serve para a instalação do ambiente de visualização de persistência do EasyPizza, criado pelo grupo [Felipe Freitas, Guilherme Medeiros, Luan Tafarel, Lucas Viana, Pedro Henrique, Vitor Balbo e Túlio Mitre].

# Requerimentos
* Python 3 instalado na máquina;
* MySQL instalado na máquina;
* Banco de dados MySQL criado com o nome de "TelePizza".

# Instalação
Criar banco de dados MySQL chamado "TelePizza";

    mysql -u root -p
    create database TelePizza;
    exit
    
Executar os seguintes comandos:

    pip3 install -r requirements.txt
    source tpenv/bin/activate
    cd TelePizza
    python3 manage.py migrate

Rodar o script ../TP1/TelePizza_Inserts.sql no banco de dados;

    mysql -u root -p < ../TP1/TelePizza_Inserts.sql
    exit

Iniciar o servidor Django

    python3 manage.py runserver

# Acesso à interface
Entrar no endereço localhost:8000 pelo navegador.
