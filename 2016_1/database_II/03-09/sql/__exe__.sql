/*
    • Conforme as tabelas abaixo escreva um procedimento que atenda ao solicitado:
        
        – O procedimento deve receber dois valores por parâmetro
        CNH do motorista e velocidadeApurada do veículo por ele conduzido;
        
        – O procedimento deve retornar um texto com a seguinte mensagem:
            • 'O motorista [nome] soma [X] pontos em em multas ‘;

    ------------------------------------------------------------------------------

    • O cálculo da pontuação do motorista é efetuado da seguinte forma:
    
        – Se a velocidade estiver entre 80.01 e 110 então o
        motorista deve ser multado em 120,00 e receber 20 pontos
    
        – Se a velocidade estiver entre 110.01 e 140 então o
        motorista deve ser multado em 350 e receber 40 pontos
    
        – Se a velocidade estiver eacima de 140 então o motorista
        deve ser multado em 680 e receber 60 pontos
    
    • O sistema deve considerar somente 90% da
    velocidade apurada para o cálculo da multa.

    • Após o cálculo o sistema deve incluir a multa na
    tabela ex_multa (se o contribuinte foi multado)

    • Então retornar o total acumulado de multas para o motorista.
*/

-- SQL's PARA PODER DESENVOLVER OS EXERCÍCIOS

CREATE TABLE ex_motorista(
    cnh CHAR(5) PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    totalMultas DECIMAL(9, 2)
);

CREATE TABLE ex_multa(
    id SERIAL PRIMARY KEY,
    cnh CHAR(5) REFERENCES ex_motorista(cnh) NOT NULL,
    velocidadeApurada DECIMAL(5, 2) NOT NULL,
    velocidadeCalculada DECIMAL(5, 2),
    pontos INTEGER NOT NULL,
    valor DECIMAL(9, 2) NOT NULL
);

-- insert into ex_motorista values ('123AB', 'Carlo');

/*
    • Escreva um outro procedimento que atualize o campo totalMultas da
    tabela ex_motorista a partir dos totais apurados para cada
    motorista autuado na tabela ex_multa.
    
    • OBS1: motorista sem multa deverão possuir
    valor 0.00 no campo total multa;
    
    • OBS2:cuidado para não duplicar valores na coluna totalMultas para
    os casos em que a rotina for disparada mais de uma vez.
*/

-- SOLUCAO DO EXERCICIO DAQUI PARA BAIXO
CREATE OR REPLACE FUNCTION updateTableExMulta(cnhParam VARCHAR(5))
RETURNS VARCHAR(100) AS $$
    DECLARE
        _name VARCHAR(50);
        _pontos DECIMAL(8,2);
        _qtdMultas DECIMAL(8,2);
        _totalMultas DECIMAL(8,2);
    
    BEGIN
        _name := (SELECT ex_motorista.nome FROM ex_motorista WHERE ex_motorista.cnh = cnhParam);    
        _qtdMultas := (SELECT COUNT(ex_multa.cnh) FROM ex_multa WHERE ex_multa.cnh = cnhParam);
        _pontos  := (SELECT SUM(ex_multa.pontos) FROM ex_multa WHERE ex_multa.cnh = cnhParam);

        IF _qtdMultas > 0 THEN
            _totalMultas := _qtdMultas;
        ELSE
            IF _pontos IS NULL THEN
                _pontos := 0.00;
                    _totalMultas := 0.00;
            END IF;
        END IF;

        UPDATE ex_motorista SET totalMultas = _totalMultas WHERE ex_motorista.cnh = cnhParam;
    
        RETURN 'O motorista ' || _name || ' soma ' || _pontos || ' pontos em em multas.';
    END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION multaProcess(
    cnhParam CHAR(5),
    velocidadeApurada DECIMAL(5,2)
) RETURNS VOID AS $$
    DECLARE
        _motorista ex_motorista % ROWTYPE;
        _velocidadeApurada DECIMAL(5,2);
        _updateTableExMulta VARCHAR(100);
        
    BEGIN
        SELECT * INTO _motorista FROM ex_motorista WHERE ex_motorista.cnh = cnhParam;

        IF _motorista.nome is NULL THEN
            RAISE NOTICE '# ERROR/CONSULT TABLE: Motorista inexistente';
        ELSE
            _velocidadeApurada := (velocidadeApurada * 90) / 100;

            IF _velocidadeApurada > 80.00 AND _velocidadeApurada < 110.01 THEN
                INSERT INTO ex_multa(cnh, velocidadeApurada, velocidadeCalculada, pontos, valor)
                VALUES(cnhParam, velocidadeApurada, _velocidadeApurada, 20, 120.00);               
            ELSEIF _velocidadeApurada > 120.00 AND _velocidadeApurada < 140.01 THEN
                INSERT INTO ex_multa(cnh, velocidadeApurada, velocidadeCalculada, pontos, valor)
                VALUES(cnhParam, velocidadeApurada, _velocidadeApurada, 40, 350.00);    
            ELSEIF _velocidadeApurada > 140.00 THEN
                INSERT INTO ex_multa(cnh, velocidadeApurada, velocidadeCalculada, pontos, valor)
                VALUES(cnhParam, velocidadeApurada, _velocidadeApurada, 60, 680.00);    
            END IF;
            
            _updateTableExMulta := updateTableExMulta(cnhParam);
            
            RAISE NOTICE '# %', _updateTableExMulta;
        END IF;

        EXCEPTION WHEN OTHERS THEN
            -- ROLLBACK;
            RAISE NOTICE '# ERROR: multaProcess EXCEPTION';

        -- COMMIT;        
    END;
$$ LANGUAGE 'plpgsql';

-- PRECISA DESSE INSERT, CASO PROCURADO ALGUEM NAO EXISTENTE, IRÁ DAR UM AVISO.
-- insert into ex_motorista values ('123AB', 'Carlo');

DO $$
    DECLARE
        _exec VARCHAR(100);
        
    BEGIN
       _exec := multaProcess('123AB', 110.00);
    END 
$$

