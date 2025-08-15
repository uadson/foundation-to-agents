select * from cliente order by idcliente asc;

select nome, data_nascimento as "Data de Nascimento" from cliente;

select cpf, rg from cliente;

-- Concatenação de campos
select 'CPF: ' || cpf || 'RG: ' || rg as "CPF e RG" from cliente;

-- Filtro por quantidade de linhas
select * from cliente limit 5;

-- Filtro com base em condições específicas
select nome, data_nascimento from cliente where data_nascimento >= '2000-01-01';

select nome from cliente where nome like 'C%';

select nome from cliente where nome like '%c%';

select nome, data_nascimento from cliente where data_nascimento between '1990-01-01' and '1998-01-01';

select nome, rg from cliente where rg is null;

select nome from cliente order by nome asc;

select nome from cliente order by nome desc;