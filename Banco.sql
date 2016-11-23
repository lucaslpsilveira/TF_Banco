--Cada produto é caracterizado por um código, nome do produto, categoria (ex. detergente,
--sabão em pó, sabonete, etc), e seu preço. A categoria é uma classificação criada pela
--própria empresa. 

create table Produtos_TF (
 cod_produto     number unique not null,
 nome_produto    varchar2(50)  not null,
 descricao       varchar2(100), 
 categoria       varchar2(50)  not null,
 preco           decimal(10,2) not null,
 constraint produtos_pk primary key(cod_produto,categoria)
);

insert into produtos_tf  values (100,'Vassoura gaúcha','ideal para limpeza de ambientes','geral',5.50);
insert into produtos_tf  values (400,'Vassoura de guanxuma','ideal para limpeza de ambientes','geral',5.50);
insert into produtos_tf  values (200,'bombril','lã de aço','lã de aço',2.50);
insert into produtos_tf  values (300,'assolan','lã de aço','lã de aço',2.30);
insert into produtos_tf  values (500,'brisa tropical','sabonete para banho','sabonete',2.69);
insert into produtos_tf  values (600,'protex','limpeza profunda','sabonete',3.14);
insert into produtos_tf  values (700,'ypê','limpeza que vem da natureza','detergente',1.65);
insert into produtos_tf  values (800,'minuano','marine liquido','detergente',1.40);
insert into produtos_tf  values (900,'balde spin','com centrifugador inox com esfregão','geral',179.90);
insert into produtos_tf  values (1000,'pure water','ionizador de piscina de até 105lts','geral',500.00);

--A empresa possui informações sobre todos seus clientes. Cada cliente é identificado por
--um código, nome, endereço, telefone, status ("Vip", "Superior", "Regular") e o seu limite
--de crédito em Reais.

create table clientes_tf (
 cli_cod  number unique not null,
 nome_cli varchar2(50)  not null,
 endereco varchar2(100) not null,
 telefone varchar2(10)  not null,
 status   varchar2(10)  not null,
 limite   decimal(10,2) not null,
 constraint clientes_pk primary key(cli_cod,status)
);

insert into clientes_tf values (1,'Carlos Augusto','Avenida Bento Gonçalves número 520 porto alegre','99853502','Regular',300.00);
insert into clientes_tf values (2,'Pedro Santos','Rua Doze numero 30 gravatai','34752635','Regular',500.00);
insert into clientes_tf values (3,'Mercado Lux','Avenida Flores da cunha numero 1450 cachoeirinha',30302050,'Superior',1000.00);
insert into clientes_tf values (4,'Padaria Manoel','Rua Bento Manuel 500 itaqui','91553250','Superior',1500.00);
insert into clientes_tf values (5,'Instituto Ronaldinho','Avenida Edgar Pires de Castro 120 porto alegre','91788700','VIP',5000.00);
insert into clientes_tf values (6,'Sport Club Internacional','Avenida Padre Cacique número 81 porto alegre','32304600','VIP',100000.00);

--Armazena-se também a informação dos pedidos feitos pelos clientes. Cada pedido possui
--um número e a data de criação. Cada pedido envolve somente um produto e, para cada
--pedido, indica-se a quantidade vendida (número de unidades) e o valor total.

create table pedidos_tf (
 num_pedido    number  unique not null,
 cli_cod       number  not null,     
 data_pedido   date    not null,
 cod_produto   number  not null,
 quantidade    int     not null,
 valor_pedido  decimal(10,2) not null,
 
 constraint FK_produtos foreign key (cod_produto) REFERENCES produtos_tf (cod_produto),
 constraint FK_clientes foreign key (cli_cod) REFERENCES clientes_tf(cli_cod),
 constraint PK_pedidos  primary key (num_pedido,data_pedido)
);

--1. Listagem de todos os produtos, em ordem alfabética.

select * from produtos_tf 
order by produtos.nome_produto asc;

--2. Busca de um cliente ou produto por nome ou descrição.

select * from clientes_tf 
where clientes.nome_cli = '%Carlos';

select * from produtos_tf 
where produtos.descricao    = '%bombril' 
or    produtos.nome_produto = '%bombril';

--3. Fazer um novo pedido (inserção de um registro de pedido).

insert into pedidos_tf  values(1,1,'14/10/2016',100,50,(50*5.50));

--4. Relatório de pedidos (qual cliente comprou qual produto, em que data e qual o valor
--do pedido), ordenado pela data.

select clientes_tf.cli_nome,produtos_tf.nome_produto,pedidos_tf.data_pedido,pedidos_tf.valor_pedido from clientes_tf
join pedidos_tf
on clientes_tf.cli_cod = pedidos_tf.cli_cod
join produtos_tf
on produtos_tf.cod_produto = pedidos_tf.cod_produto
order by pedidos_tf.data_pedido asc;

--5. Visualizar a quantidade de pedidos de um determinado produto e a quantidade total e
--o valor total vendido correspondente (e eventuais descontos).

select count(*) from produtos_tf
join pedidos_tf
on produtos_tf.cod_produto = pedidos_tf.cod_produto;

--tem que ser terminado.

--6. Listar os clientes, o número de pedidos e o valor total dos pedidos para o cliente.
--Ordenar pelo valor total dos pedidos, do maior para o menor.

select * from clientes_tf 
join pedidos_tf
on clientes_tf.cli_cod = pedidos_tf.cli_cod
order by pedidos_tf.valor_pedido desc;

-- tem que ser terminado.

--7. [Uma consulta à escolha do grupo (deve envolver pelo menos uma subconsulta)] 

select * from produtos_tf
join pedidos_tf
on produtos_tf.cod_produto = pedidos_tf.cod_produto
where pedidos_tf.data_pedido > 2010;

--O sistema deverá incluir um cadastro de produtos, de clientes e dos pedidos efetuados.
--Durante o procedimento de venda, deverá ser verificado se o valor do pedido não é
--superior ao limite de crédito do cliente, caso contrário não deverá ser aceito o pedido.
--Clientes do tipo "Vip" têm direito a 10% de desconto no valor do pedido. 

--será implementado no código java.



