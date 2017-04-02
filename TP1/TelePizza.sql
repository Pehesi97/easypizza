create database TelePizza;
use TelePizza;

insert into CRUD_produto(id, description, price, type) values(1, 'Pizza Grande de Calabresa'
	, 28.00, 0);
insert into CRUD_produto(id, description, price, type) values(2, 'Pizza Grande de Frango'
	, 27.50, 0);
insert into CRUD_produto(id, description, price, type) values(3, 'Coca-Cola 2L'
	, 8.00, 1);
insert into CRUD_produto(id, description, price, type) values(4, 'Guaraná Jesus 2L'
	, 7.50, 1);

insert into CRUD_cliente(id, tel, name, address, call_count, created_at, updated_at, preference_id) values(1, '31993811533', 'Pedro Henrique'
	, 'Rua Rio Grande, 520 - Centro', 0, now(), now(), null);
insert into CRUD_cliente(id, tel, name, address, call_count, created_at, updated_at, preference_id) values(2, '31999999999', 'Cláudia Ribeiro'
	, 'Avenida Continente, 1200 - Alto da Siriema', 0, now(), now(), null);

insert into CRUD_motoqueiro(id, name, rg, cpf, salary, service_count, hired_at, updated_at) values (1, 'Jackson Five Motoboy', 'SP11222333', '10020030040', 900.00, 0, now(), now());
insert into CRUD_motoqueiro(id, name, rg, cpf, salary, service_count, hired_at, updated_at) values (2, 'Nips Hell Angel', 'TX11222333', '20030040050', 990.00, 0, now(), now());

insert into CRUD_atendente values (1, 'eugenio', 'Eugênio Silva', 'MG18000600', '30040050060', 990.00, 0, now(), now());
insert into CRUD_atendente values (2, 'fernanda', 'Fernanda das Graças', 'MG28100500', '40050060070', 990.00, 0, now(), now());

insert into CRUD_preferencia values(1, now(), now());
insert into CRUD_preferencia values(2, now(), now());

update CRUD_cliente set preference_id = 1 where id=1;
update CRUD_cliente set preference_id = 2 where id=2;

insert into CRUD_preferencia_products values(1, 1, 1);
insert into CRUD_preferencia_products values(2, 1, 3);

insert into CRUD_preferencia_products values(3, 2, 2);
insert into CRUD_preferencia_products values(4, 2, 4);

insert into CRUD_pedido(id, status, asked_at, delivered_at, deliver_prediction, client_id, deliveryman_id, attendant_id) values(1, 1, now(), now(), now(), 1, 1, 1);
insert into CRUD_pedido(id, status, asked_at, delivered_at, deliver_prediction, client_id, deliveryman_id, attendant_id) values(2, 0, now(), null, now(), 2, 2, 2);

insert into CRUD_pedido_products values(1, 1, 1);
insert into CRUD_pedido_products values(2, 1, 3);

insert into CRUD_pedido_products values(3, 2, 2);
insert into CRUD_pedido_products values(4, 2, 4);
