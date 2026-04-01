select	*
from	produtos
where	preco < 500;

select	c.nome, sum(p.valor_total) total
from	clientes c
join	pedidos p
on		p.id_cliente = c.id_cliente
group	by c.nome
order	by total desc;

select	date_format(data_pedido, '%d/%m/%y') data_pedido
from	pedidos;

/* --------------------------------------------------------------------------------- */

-- 1 - Qual foi o faturamento total da empresa?
select	sum(valor_total) total_faturamento
from	pedidos;

-- 2 - Quais são os 5 produtos com o maior faturamento?
select	distinct
		pr.nome_produto,
		sum(ip.subtotal) total_faturamento
from	itens_pedido ip
join	pedidos pe
on		pe.id_pedido = ip.id_pedido
join	produtos pr
on		pr.id_produto = ip.id_produto
group	by pr.nome_produto
order	by total_faturamento desc
limit 	5;

-- 3 - Quais produtos tiveram maior volume de unidades vendidas?
select	pr.nome_produto,
		sum(ip.quantidade) quantidade
from	itens_pedido ip
join	pedidos pe
on		pe.id_pedido = ip.id_pedido
join	produtos pr
on		pr.id_produto = ip.id_produto
group 	by pr.nome_produto
order	by quantidade desc;

-- 4 - Qual vendedor gerou mais receita em vendas?
select	v.nome,
		count(p.id_pedido) total_pedidos,
        sum(p.valor_total) faturamento_vendedor
from	vendedores v
join	pedidos p
on		p.id_vendedor = v.id_vendedor
group	by v.nome
order	by faturamento_vendedor desc;

-- 5 - Quais clientes mais compraram em valor total?
select	c.nome,
		c.cidade,
		c.estado,
		sum(p.valor_total) valor_total
from	clientes c
join	pedidos p
on		p.id_cliente = c.id_cliente
group	by c.nome, c.cidade, c.estado
order	by valor_total desc;

-- 6 - Qual categoria de produto gera mais faturamento?
select	categoria,
		sum(pe.valor_total) faturamento
from	produtos pr
join	itens_pedido ip
on		ip.id_produto = pr.id_produto
join	pedidos pe
on		pe.id_pedido = ip.id_pedido
group	by categoria
order	by faturamento desc;

-- 7 - Qual o ticket médio dos pedidos?
select	round(avg(valor_total), 2) ticket_medio
from	pedidos;

-- 8 - Quais produtos estão com estoque baixo?
with estoque_baixo as(
	select	row_number() over(order by preco desc) id_seq,
			nome_produto,
			preco,
			estoque
	from	produtos
	where	estoque < 20
)
select	*
from	estoque_baixo;

-- 9 - Quantos pedidos cada vendedor atendeu?
with pedidos_vendedor as (
	select	v.nome,
			count(p.id_pedido) quantidade
	from	pedidos p
	left 	join vendedores v
	on		v.id_vendedor = p.id_pedido
	group	by v.nome
	order	by quantidade
)    
select	*
from	pedidos_vendedor;

-- 10 - Qual o faturamento por mês?
with faturamento as (
	select	row_number() over(order by sum(valor_total) desc) id_seq,
			date_format(data_pedido, '%m/%y') mes,
			sum(valor_total) faturamento_mensal
	from	pedidos
	group 	by mes
    order	by mes
)
select	*
from	faturamento;

/* ------------------------------------------ */

select 	date_format(curdate(), '%d/%m/%y') data_hoje from dual; -- buscando a data de hoje
select	year(curdate()) ano_atual; -- ano atual

select	c.nome,
		c.email,
		p.data_pedido,
        p.valor_total
from	pedidos p
join	clientes c
on		c.id_cliente = p.id_cliente
limit 	10;

/* ------------------------------------------ */

select	distinct
		row_number() over(order by ci.population desc) id,
		c.name,
        c.continent,
        ci.Name,
        ci.Population
from	country c
join	city ci
on		ci.CountryCode = c.code
where	c.name = 'Brazil'
order	by ci.Population desc
limit	5;