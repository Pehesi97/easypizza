use TelePizza;

insert into CRUD_produto(id, description, price, type) values(1, 'Pizza Grande de Calabresa'
	, 28.00, 0);
insert into CRUD_produto(id, description, price, type) values(2, 'Pizza Grande de Frango'
	, 27.50, 0);
insert into CRUD_produto(id, description, price, type) values(3, 'Coca-Cola 2L'
	, 8.00, 1);
insert into CRUD_produto(id, description, price, type) values(4, 'Guaraná Jesus 2L'
	, 7.50, 1);

insert into CRUD_cliente(id, name, address, call_count, created_at, updated_at, preference_id, password) values(1, 'Pedro Henrique', 'Rua Rio Grande, 520 - Centro', 1, now(), now(), null, '6C565134008CB92C9CCF6B2CB1ED0522BEC9E4D46A9E08CEDD36CA0C224362DD2E58E7172B3492ACE3E1F6F3945D5B7E1924E56BCC34C6933449DE3DAC217F5E');
insert into CRUD_cliente(id, name, address, call_count, created_at, updated_at, preference_id, password) values(2, 'Cláudia Ribeiro', 'Avenida Continente, 1200 - Alto da Siriema', 1, now(), now(), null, '89583B9AF8A28CDB88E72434CFBA321F8CBDB51E687BF87BEFB33E6550CF19ABF46A3BD9DA3461D74CD82922C318FDC9712CABE093B751FE7F64800245DACDF2');

insert into CRUD_telefone(id, cliente_id, tel) values(1, 1, '31993811533');
insert into CRUD_telefone(id, cliente_id, tel) values(2, 2, '31999999999');
insert into CRUD_telefone(id, cliente_id, tel) values(3, 1, '31996688459');

insert into CRUD_motoqueiro(id, name, rg, cpf, salary, service_count, hired_at, updated_at) values (1, 'Jackson Five Motoboy', 'SP11222333', '10020030040', 500.00, 1, now(), now());
insert into CRUD_motoqueiro(id, name, rg, cpf, salary, service_count, hired_at, updated_at) values (2, 'Nips Hell Angel', 'TX11222333', '20030040050', 600.00, 0, now(), now());

insert into CRUD_usuario values (1, 'eugenio', 'Eugênio Silva', 'MG18000600', '30040050060', 800.00, 1, 0, now(), now());
insert into CRUD_usuario values (2, 'fernanda', 'Fernanda das Graças', 'MG28100500', '40050060070', 800.00, 1, 0, now(), now());
insert into CRUD_usuario values (3, 'judite', 'Judite Silberchatz', 'MG28100501', '40090070090', 990.00, 0, 1, now(), now());

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
