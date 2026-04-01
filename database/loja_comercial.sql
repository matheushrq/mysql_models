create database loja_comercial;
use loja_comercial;

create table clientes(
	id_cliente int auto_increment primary key,
    nome varchar(100) not null,
    email varchar(100),
    telefone varchar(20),
    cidade varchar(50),
    estado varchar(50)
);

create table vendedores (
	id_vendedor int auto_increment primary key,
    nome varchar(100) not null,
    comissao decimal(5,2)
);

create table produtos (
	id_produto int auto_increment primary key,
    nome_produto varchar(100) not null,
    categoria varchar(50),
    preco decimal(10,2) not null,
    estoque int not null
);

create table pedidos (
	id_pedido int auto_increment primary key,
    id_cliente int,
    id_vendedor int,
    data_pedido date not null,
    valor_total decimal(10,2),
    foreign key (id_cliente) references clientes(id_cliente),
    foreign key (id_vendedor) references vendedores(id_vendedor)
);

create table itens_pedido (
	id_item int auto_increment primary key,
    id_pedido int,
    id_produto int,
    quantidade int not null,
    preco_unitario decimal(10,2) not null,
    subtotal decimal(10,2),
    foreign key (id_pedido) references pedidos(id_pedido),
    foreign key (id_produto) references produtos(id_produto)
);

insert into clientes (nome, email, telefone, cidade, estado) values
('Carlos Silva','carlos.silva@email.com','51999990001','Porto Alegre','RS'),
('Ana Souza','ana.souza@email.com','51999990002','Novo Hamburgo','RS'),
('Marcos Oliveira','marcos.oliveira@email.com','51999990003','Canoas','RS'),
('Juliana Pereira','juliana.pereira@email.com','51999990004','São Leopoldo','RS'),
('Fernando Costa','fernando.costa@email.com','51999990005','Gravatai','RS'),
('Patricia Gomes','patricia.gomes@email.com','51999990006','Sapucaia','RS'),
('Ricardo Mendes','ricardo.mendes@email.com','51999990007','Esteio','RS'),
('Camila Rocha','camila.rocha@email.com','51999990008','Campo Bom','RS'),
('Lucas Martins','lucas.martins@email.com','51999990009','Parobé','RS'),
('Beatriz Alves','beatriz.alves@email.com','51999990010','Taquara','RS');

insert into vendedores (nome, comissao) values
('João Ferreira', 5.00),
('Maria Santos', 6.50),
('Pedro Lima', 4.00),
('Larissa Teixeira', 7.00);

insert into produtos (nome_produto, categoria, preco, estoque) values
('Notebook Dell', 'Eletrônicos', 3500.00, 15),
('Mouse Logitech', 'Acessórios', 120.00, 50),
('Teclado Mecânico', 'Acessórios', 320.00, 30),
('Monitor LG 24', 'Eletrônicos', 900.00, 20),
('Headset Gamer', 'Acessórios', 250.00, 40),
('SSD 1 TB', 'Hardware', 600.00, 25),
('HD Externo 2 TB', 'Hardware', 550.00, 18),
('Webcam Full HD', 'Acessórios', 180.00, 35),
('Cadeira Gamer', 'Móveis', 1200.00, 10),
('Mesa Escritório', 'Móveis', 750.00, 12);

insert into pedidos (id_cliente, id_vendedor, data_pedido, valor_total) values
(1, 1, '2025-01-10', 3620.00),
(2, 2, '2025-01-12', 1020.00),
(3, 1, '2025-01-15', 600.00),
(4, 3, '2025-02-02', 1380.00),
(5, 2, '2025-02-05', 900.00),
(6, 4, '2025-02-10', 180.00),
(7, 1, '2025-02-12', 600.00),
(8, 3, '2025-03-01', 1200.00),
(9, 4, '2025-03-05', 750.00),
(10, 2, '2025-03-10', 320.00);

insert into itens_pedido (id_pedido, id_produto, quantidade, preco_unitario, subtotal) values
(1, 1, 1, 3500.00, 3500.00),
(1, 2, 1, 120.00, 120.00),
(2, 4, 1, 900.00, 900.00),
(2, 2, 1, 120.00, 120.00),
(3, 6, 1, 600.00, 600.00),
(4, 9, 1, 1200.00, 1200.00),
(4, 8, 1, 180.00, 180.00),
(5, 4, 1, 900.00, 900.00),
(6, 8, 1, 180.00, 180.00),
(7, 6, 1, 600.00, 600.00),
(8, 9, 1, 1200.00, 1200.00),
(9, 10, 1, 750.00, 750.00),
(10, 3, 1, 320.00, 320.00);