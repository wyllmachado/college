/*
*
* EXERCÍCIO 01
*
*/
select sum(xi.qtde), xc.cliente
from Xitensvenda xi, Xvenda xv, Xcliente xc
where exists (	select *
		from  Xitensvenda xi2
		where xi2.codproduto = 1
		and xi.nnf = xi2.nnf
		and xi.dtvenda = xi2.dtvenda
	     )
and xi.nnf = xv.nnf
and xi.dtvenda = xv.dtvenda
and xv.codcliente = xc.codcliente
group by xc.cliente 
order by xc.cliente


/*
*
* EXERCÍCIO 02
*
*/
select xc.cliente, sum(xv.vlvenda)
from Xcliente xc, Xvenda xv
where xv.codcliente = xc.codcliente
group by xc.cliente	


/*
*
* EXERCÍCIO 03
*
*/
select xp.descricaoproduto, max(xp.preco)
from Xproduto xp, Xitensvenda xi
where xp.codproduto = xi.codproduto
group by xp.descricaoproduto, xp.preco
order by xp.preco desc


/*
*
* EXERCÍCIO 04
*
*/
select c.cliente, tp.descricaotppagamento
from Xcliente c, Xtipospagamento tp, Xvenda x
where c.codcliente = x.codcliente
and x.codtppagamento = tp.codtppagamento

/*
*
* EXERCÍCIO 05
*
*/
select c.cliente, v.nnf, v.dtvenda, tp.descricaotppagamento, p.descricaoproduto, iv.qtde
from Xcliente c, Xvenda v, Xitensvenda iV, Xproduto p, Xtipospagamento tp
where c.codcliente = v.codcliente
and v.nnf = iv.nnf
and v.dtvenda = iV.dtvenda
and p.codproduto = iv.codproduto 
and v.codtppagamento = tp.codtppagamento


/*
*
* EXERCÍCIO 06
*
*/
select avg(p.preco)
from Xitensvenda iv, Xproduto p
where p.codproduto = p.codproduto


/*
*
* EXERCÍCIO 07
*
*/
select distinct(c.cliente), p.descricaoproduto
from Xcliente c, Xproduto p, Xvenda v, Xitensvenda iv
where c.codcliente = v.codcliente
and v.nnf = iv.nnf
and p.codproduto = iv.codproduto
and v.dtvenda = iv.dtvenda

/*
*
* EXERCÍCIO 08
*
*/
select tp.descricaotppagamento, max(v.dtvenda)
from Xtipospagamento tp, Xvenda v
where v.codtppagamento = tp.codtppagamento
group by tp.descricaotppagamento


/*'
*
* EXERCÍCIO 09
*
*/
select v.dtvenda, avg(iv.qtde)
from Xvenda v, Xitensvenda iv, Xproduto p
where v.nnf = iv.nnf
and v.dtvenda = iv.dtvenda
and iv.codproduto = p.codproduto
group by v.dtvenda
order by v.dtvenda desc


/*
*
* EXERCÍCIO 10
*
*/

select p.descricaoproduto, avg(iv.qtde)
from Xproduto p, Xitensvenda iv
where iv.codproduto = p.codproduto
group by p.descricaoproduto
having avg(iv.qtde) > 4