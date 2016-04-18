/*
	-- 1) Recuperar os nomes de todos os engenheiros, que projetaram obras
	nas quais o operário João Souza tenha trabalhado em junho de 97

	NOME_ENG
	------------------------------
	Carlos Alvarez
*/
SELECT eng.nome_eng
FROM engenheiro eng, obra ob, obra_operario obp, operario op
WHERE obp.data
BETWEEN '1997-06-01' AND '1997-06-30'
AND op.nomeop = 'Joao Souza'
AND eng.crea = ob.cod_eng_resp
AND ob.cod_obra = obp.cod_obra
AND obp.cart_trab = op.cart_trab

/*
	-- 2) Recuperar os nomes dos operários que trabalharam em obras de
	pelo menos todos os engenheiros da area de Pontes/Viadutos.
	
	NOMEOP
	------------------------------
	Paulo Castro
*/
SELECT op.nomeop
FROM operario op, engenheiro eng, obra ob, obra_operario obp
WHERE op.cart_trab = obp.cart_trab
AND obp.cod_obra = ob.cod_obra
AND ob.cod_eng_resp = eng.crea
AND eng.area_atuacao = 'Pontes/Viadutos'
GROUP BY op.nomeop
HAVING COUNT(op.nomeop) = (
	SELECT COUNT(eng2.area_atuacao)
	FROM engenheiro eng2
	WHERE eng2.area_atuacao = 'Pontes/Viadutos'
)

/*
	-- 3) Para cada operário que trabalha para mais de uma construtora,
	recuperar o seu nome e os nomes das construtoras.
	
	NOMEOP				NOME_CONST
	----------------------------- ------------------------------
	Paulo Castro			A3
	Paulo Castro			Metaplan
	Joao Souza			Encol
	Joao Souza			Metaplan
*/
SELECT op.nomeop, const.nome_const
FROM operario op, construtora const, operario_construtora op_const, obra ob
WHERE op.cart_trab = op_const.cart_trab
AND const.cod_const = op_const.cod_const
AND ob.cod_const = op_const.cod_const
AND ob.cod_const = const.cod_const
GROUP BY op.nomeop, const.nome_const
HAVING COUNT(op_const.cart_trab) > 1

/*
	-- 4) Recuperar os nomes dos operários que trabalham em somente uma 
	construtora.

	NOMEOP
	------------------------------
	Luis Padilha
*/
SELECT op.nomeop
FROM operario op, construtora const, operario_construtora op_const, obra ob
WHERE op.cart_trab = op_const.cart_trab
AND const.cod_const = op_const.cod_const
AND ob.cod_const = op_const.cod_const
AND ob.cod_const = const.cod_const
GROUP BY op.nomeop
HAVING COUNT(op_const.cart_trab) = 1

/*
	-- 5) Recuperar os nomes dos engenheiros que atuam
	em alguma construtora além da Encol.

	NOME_ENG
	------------------------------
	Luis Silva
*/
SELECT eng.nome_eng
FROM engenheiro eng, obra ob, construtora const
WHERE eng.crea = ob.cod_eng_resp
AND ob.cod_const = const.cod_const
GROUP BY eng.nome_eng
HAVING COUNT(ob.cod_eng_resp) > 1
INTERSECT
SELECT eng.nome_eng
FROM engenheiro eng, obra ob, construtora const
WHERE eng.crea = ob.cod_eng_resp
AND ob.cod_const = const.cod_const
AND const.nome_const = 'Encol'

/*
	-- 6) Para cada construtora, recuperar o nome da construtora e o
	número de engenheiros da área de Edificação.

	NOME_CONST			Qtde de Engenheiros
	------------------------------ ---------------------------
	A3				1
	Encol				1
	Goldzstein			1
*/
SELECT const.nome_const, COUNT(DISTINCT ob.cod_eng_resp)
FROM construtora const, obra ob, engenheiro eng
WHERE const.cod_const = ob.cod_const
AND ob.tipo = 'Edificio'
AND eng.area_atuacao = 'Edificacao'
GROUP BY const.nome_const, ob.cod_eng_resp
ORDER BY const.nome_const ASC

/*
	-- 7) Para cada operário da construtora Encol, recuperar o seu numero
	de carteira de trabalho, nome e o numero de obras (mesmo não sendo da
	construtora Encol) nas quais trabalhou no primeiro semestre de 97.

	CART_TRAB	NOMEOP				Qtde de Obras
	--------------- ------------------------------ -----------------------
	op030		Joao Souza			1
*/