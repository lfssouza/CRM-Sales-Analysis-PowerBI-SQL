create database IF not exists crm_sales;
use crm_sales;

create table sales_teams(
	sales_agent varchar(50) primary key,
    manager varchar(50) not null,
    regional_office varchar(20) not null
);

create table products(
	product varchar(20) primary key,
    series varchar(5) not null,
    sales_price decimal(12, 2)
);

create table accounts(
	account varchar(50) primary key,
    sector varchar(20) not null,
    year_established year not null,
    revenue decimal(12, 2) not null,
    employees int not null,
    office_location varchar(25) not null,
    subsidiary_of varchar(30)
);

create table sales_pipeline(
	opportunity_id char(8) primary key,
    sales_agent varchar(50) not null,
    product varchar(20) not null,
    account varchar(50),
    deal_stage varchar(15) not null,
    engage_date date,
    close_date date, 
    close_value decimal(12, 2),
    constraint fk_sales_agents foreign key (sales_agent) references sales_teams(sales_agent),
	constraint fk_product foreign key (product) references products(product),
	constraint fk_accounts foreign key (account) references accounts(account)
);

-- PRIMEIRA PERGUNTA --
-- How is each sales team performing compared to the rest? / Como cada equipe de vendas está performando em comparação às outras? --

select e.manager, sum(s.close_value) as total_ganho, count(*) as total_vendas_ganha, sum(s.close_value)/count(*) as media from sales_pipeline as s inner join sales_teams as e on s.sales_agent = e.sales_agent where s.deal_stage = 'Won' group by e.manager order by media DESC;

-- SEGUNDA PERGUNTA --
-- Are any sales agents lagging behind? / Algum representante de vendas está ficando para trás?

select sales_agent, sum(close_value) as total_vendido_vendedor, count(*) as vendas_confirmadas, sum(close_value) / count(*) as media_vendedor from sales_pipeline where deal_stage = 'Won' group by sales_agent order by media_vendedor desc;

    SELECT
    sub.sales_agent,
    sub.vendas_confirmadas,
    sub.media_vendedor,
    geral.media_vendas_por_vendedor,
    geral2.media
FROM
    (select sales_agent, count(*) as vendas_confirmadas, sum(close_value)/count(*) as media_vendedor from sales_pipeline where deal_stage = 'Won' group by sales_agent) sub
CROSS JOIN
    (select avg(sub2.vendas_confirmadas) AS media_vendas_por_vendedor FROM (SELECT
    sales_agent,
    COUNT(*) AS vendas_confirmadas
FROM sales_pipeline
WHERE deal_stage = 'Won'
GROUP BY sales_agent) sub2) geral
cross join
(select sum(close_value) as total_valor, sum(close_value)/count(*) as media from sales_pipeline where deal_stage = 'Won') geral2
WHERE
    sub.vendas_confirmadas < geral.media_vendas_por_vendedor
    AND sub.media_vendedor < geral2.media;
    
-- TERCEIRA PERGUNTA --
-- Are there any quarter-over-quarter trends? / Existem tendências de um trimestre para o outro?

select quarter(close_date) as trimestre, year(close_date) as ano, count(*) as total_de_vendas, sum(close_value) as total_valor_vendido from sales_pipeline where deal_stage = 'Won' and close_date is not null group by ano, trimestre order by trimestre;

select sub2.trimestre, sub2.ano, sub2.total_valor_vendido, sub2.valor_trimestre_anterior,
((sub2.total_valor_vendido - sub2.valor_trimestre_anterior)/ sub2.valor_trimestre_anterior) * 100 as variacao_qoq
from 
( (select sub.trimestre, sub.ano, sub.total_valor_vendido, 
LAG(sub.total_valor_vendido) OVER (ORDER BY trimestre) AS valor_trimestre_anterior
from 
(select quarter(close_date) as trimestre, 
year(close_date) as ano, 
count(*) as total_de_vendas, 
sum(close_value) as total_valor_vendido
from sales_pipeline 
where deal_stage = 'Won' and close_date is not null 
group by ano, trimestre order by trimestre)sub)) sub2;

-- QUARTA PERGUNTA --
-- Do any products have better win rates? / Algum produto apresenta taxas de vitória melhores?

select product, count( case when deal_stage = 'Won' then 1 end) product_won, count(case when deal_stage = 'Lost' then 1 end) product_lost from sales_pipeline Where deal_stage in ('Won', 'Lost') group by product order by product_won, product_lost;

select sub.product, sub.product_won, sub.product_lost, 
round((sub.product_won/(sub.product_won + sub.product_lost)) * 100, 2) as win_rate
from ( select product, 
count( case when deal_stage = 'Won' then 1 end) product_won, 
count(case when deal_stage = 'Lost' then 1 end) product_lost 
from sales_pipeline 
Where deal_stage in ('Won', 'Lost') 
group by product) sub order by win_rate desc;


