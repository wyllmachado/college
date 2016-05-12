/*
Nome: Chayene Bernstein, Robson Junior
Turma: ADS [Quarta/noite]
*/

/*
    1 – Criar uma view com o nome de cursosanalista, que contém o nome do curso, nome do
    analista e salário do analista com um aumento de 10%.
*/
DROP VIEW cursoanalista;

CREATE VIEW cursoanalista AS
	SELECT c.curso, a.analista, (a.salario + a.salario * 0.1)
	FROM analista a
	INNER JOIN curso c
	ON a.codcurso = c.codcurso

SELECT * FROM cursoanalista;

/*
    2 – Montar um cursor que mostra o nome do programador e a quantidade de dias de férias.
    Caso o programador tenha idade:

    de 20 a 24 anos     18 dias
    de 25 a 35 anos     21 dias
    acima de 35 anos    25 dias
*/
CREATE OR REPLACE FUNCTION progCursor() RETURNS VOID AS $$
	DECLARE
		rr CURSOR FOR SELECT p.programador, p.idade FROM programador p;
		progrowtype programador%ROWTYPE;
	BEGIN		
		OPEN rr;

		LOOP
			FETCH rr INTO progrowtype;
			
			IF rr.idade >= 20 AND rr.idade < 25 THEN
				RAISE NOTICE 'str1';
			ELSIF rr.idade >= 25 AND rr.idade < 36 THEN
				RAISE NOTICE 'str2';
			ELSIF rr.idade >= 36 THEN
				RAISE NOTICE 'str3';
			END IF;

			EXIT WHEN rr%NOTFOUND;
		END LOOP;

		CLOSE rr;
		RETURN;
	END;
$$ LANGUAGE plpgsql;x	

SELECT * FROM progCursor();

/*
    3 – Criar uma view com o nome de ativanalista, contendo o nome do analista e a
    quantidade de atividades de análise que ele realizou.
*/
DROP VIEW ativanalista;
 
CREATE VIEW ativanalista AS
    SELECT a.analista, COUNT(aa.codanalista)
	FROM analista a
	INNER JOIN atividadesanalise aa
	ON a.codanalista = aa.codanalista
	GROUP BY a.analista, aa.codanalista

SELECT * FROM ativanalista;

/*
    4 – Montar um cursor atualiza o salário dos analistas a partir da quantidade de atividades de
    análise realizadas.

    1 atividade             5%
    2 atividades            10%
    3 atividades ou mais    15%
*/
CREATE OR REPLACE FUNCTION ATUALIZA_SALARIO_TEMP_TABLE() RETURNS VOID AS
$$
DECLARE
	_CURSOR_ANALISTA REFCURSOR;
	_codanalista FLOAT;
	_analista varchar(50);
	_COUNTANALISTA FLOAT;
	_salario FLOAT;
	_AUMENTO FLOAT;
BEGIN
	OPEN _CURSOR_ANALISTA FOR
	SELECT aa.codanalista, analista, COUNT(aa.codanalista), salario
	FROM atividadesanalise aa
	JOIN analista a 
	ON a.codanalista = aa.codanalista
	GROUP BY aa.codanalista, analista , salario;

	FETCH _CURSOR_ANALISTA INTO _codanalista, _analista, _salario, _COUNTANALISTA;
	
	WHILE FOUND 
		LOOP
			IF(_codanalista = 1) THEN
				_AUMENTO := _salario + (_salario * 0.05);
			ELSIF(_COUNTANALISTA = 2) THEN
				_AUMENTO := _salario + (_salario * 0.10);
			ELSE
				_AUMENTO := _salario + (_salario * 0.15);
			END IF;

			RAISE NOTICE '%',_analista || ' ' || _AUMENTO;

			UPDATE analista set salario = _AUMENTO where codanalista = _codanalista;
			
			FETCH _CURSOR_ANALISTA INTO _codanalista, _analista, _countanalista, _salario;
		END LOOP;
	CLOSE _CURSOR_ANALISTA;
END;
$$ LANGUAGE PLPGSQL;

SELECT * FROM ATUALIZA_SALARIO_TEMP_TABLE();

/*
    5 – Monte uma consulta para mostrar o nome do(s) analista(s) e o nome de seu respectivo
    curso, o(s) qual(is) nunca tive(ram) atividades realizadas com o programador o qual tenha
    em seu nome a palavra “Jefer”.
*/
SELECT 	analista.analista AS nomeanalista, curso.curso AS nomecurso
FROM analista AS analista,curso AS curso
WHERE curso.codcurso = analista.codcurso
AND analista.codanalista NOT IN (
	SELECT ativanalise.codanalista
	FROM atividadesprog AS ativprog, atividadesanalise AS ativanalise
	WHERE ativprog.codprogramador NOT IN (
		SELECT prog.codprogramador from programador AS prog WHERE prog.programador LIKE '%Jefer%'
	)
	AND ativprog.codatividadeanalise = ativanalise.codatividadeanalise
)