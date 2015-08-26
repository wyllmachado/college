/**
Nome: Robson Gomes de Araújo Júnior
Matrícula: 181200690
Matéria/Professor: Banco de Dados / Gastão
**/

/**
1 - Recuperar os nomes de todos os engenheiros, 
que projetaram obras nas quais o operário João Souza tenha trabalhado em junho de 97
**/

SELECT DISTINCT engenheiro.nome_eng from operario,obra_operario,obra,engenheiro 
where operario.nomeop = 'Joao Souza' and 
obra_operario.data between '01-06-1997' and 
'30-06-1997' and 
obra_operario.cart_trab = operario.cart_trab and 
obra.cod_obra = obra_operario.cod_obra and 
engenheiro.crea = obra.cod_eng_resp

select engenheiro.nome_eng from engenheiro, obra, operario, obra_operario
where engenheiro.crea = obra.cod_eng_resp --joins
and obra.cod_obra = obra_operario.cod_obra 
and obra_operario.cart_trab = operario.cart_trab 
and operario.nomeop = 'Joao Souza' -- validações
and obra_operario.data >= '1997-06-01' 
and obra_operario.data <= '1997-06-30'


/**
2 - Recuperar os nomes dos operários que trabalharam em obras de pelo menos todos os engenheiros da área de Pontes/Viadutos.
**/

SELECT operario.NOMEOP from engenheiro,obra,obra_operario,operario where
engenheiro.crea = obra.cod_eng_resp and 
obra_operario.cod_obra = obra.cod_obra and
operario.cart_trab = obra_operario.cart_trab and
not engenheiro.area_atuacao = 'Edificacao'
group by operario.NOMEOP 
having count(distinct obra.cod_eng_resp) > 1 

----

select nomeop from operario, engenheiro, obra, obra_operario
where engenheiro.crea = obra.cod_eng_resp -- joins
and obra.cod_obra = obra_operario.cod_obra 
and obra_operario.cart_trab = operario.cart_trab 
and engenheiro.area_atuacao = 'Pontes/Viadutos' -- Validação
group by nomeop having count(engenheiro.area_atuacao) = 2


/*
3 - Para cada operário que trabalha para mais de uma construtora, 
recuperar o seu nome e os nomes das construtoras.
NOMEOP NOME_CONST
**/

SELECT operario.nomeop, construtora.nome_const
FROM construtora, operario_construtora, operario
WHERE operario_construtora.cod_const = construtora.cod_const AND
operario.cart_trab = operario_construtora.cart_trab AND 
operario.nomeop in ( SELECT operario.nomeop FROM construtora,operario_construtora, operario
WHERE operario_construtora.cod_const = construtora.cod_const AND
operario.cart_trab = operario_construtora.cart_trab
GROUP BY operario.cart_trab
HAVING count(*) > 1)


/*
4 - Recuperar os nomes dos operários que trabalham em somente uma construtora.
**/

SELECT operario.nomeop
FROM operario, construtora, operario_construtora
WHERE construtora.cod_const = operario_construtora.cod_const AND
operario.cart_trab = operario_construtora.cart_trab 
group by operario.nomeop
having count(construtora.cod_const) = 1




/**
5 - Recuperar os nomes dos engenheiros que atuam em alguma construtora além da Encol.
**/

SELECT engenheiro.nome_eng 
FROM engenheiro, construtora, operario, obra, operario_construtora, obra_operario
WHERE engenheiro.crea = obra.cod_eng_resp AND
obra.cod_const = construtora.cod_const AND
operario.cart_trab = operario_construtora.cart_trab AND
obra_operario.cod_obra = obra.cod_obra AND
operario.cart_trab = obra_operario.cart_trab
group by engenheiro.nome_eng
having count(operario.cart_trab) = 3




/**
6 - Para cada construtora, recuperar o nome da construtora
 e o número de engenheiros da área de Edificação.
NOME_CONST Qtde de Engenheiros
**/

SELECT construtora.nome_const, count(*) 
FROM  obra, construtora, engenheiro
WHERE engenheiro.area_atuacao = 'Edificacao' AND
obra.cod_const = construtora.cod_const AND
obra.cod_eng_resp = engenheiro.crea
GROUP BY construtora.nome_const


/**
7 - Para cada operário da construtora Encol, 
recuperar o seu numero de carteira de trabalho, nome e o numero de obras 
(mesmo não sendo da construtora Encol) nas quais trabalhou no primeiro semestre de 97.
CART_TRAB NOMEOP Qtde de Obras - observar a exceção 1° sem de 97
**/


SELECT operario.cart_trab, operario.nomeop, count(*)
FROM operario, operario_construtora, obra_operario, construtora
WHERE operario.cart_trab = operario_construtora.cart_trab AND
operario_construtora.cod_const = construtora.cod_const AND 
obra_operario.cart_trab = operario.cart_trab AND
nome_const like '%Encol%' AND
data >= '01/01/1997' 
AND data < '01/07/1997'
GROUP BY operario.cart_trab
 











