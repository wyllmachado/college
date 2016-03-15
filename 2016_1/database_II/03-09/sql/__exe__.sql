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
 AUTO INCREMENTE SAMPLE
 INSERT INTO ex_multa(cnh, velocidadeApurada, velocidadeCalculada, pontos, valor) values('123ab', 100.10, 10.10, 10, 300.00)
*/
CREATE OR REPLACE FUNCTION processCalc(p_cnh CHAR(5), velocidadeApurada DECIMAL(5,2))
RETURNS VARCHAR(100) AS $$
    DECLARE
    _motorista ex_motorista % ROWTYPE;
    _msg VARCHAR(100);
    _velocidadeApurada DECIMAL(5,2);
    
    BEGIN
        SELECT * INTO _motorista FROM ex_motorista
        WHERE ex_motorista.cnh = p_cnh;

        _velocidadeApurada := (velocidadeApurada * 90) / 100;
        
        IF _velocidadeApurada > 80.00 AND _velocidadeApurada < 110.01 THEN
            INSERT INTO ex_multa(cnh, _velocidadeApurada, _velocidadeApurada, pontos, valor) VALUES(p_cnh, velocidadeApurada, _velocidadeApurada, 20);
        ELSEIF _velocidadeApurada > 120.00 AND _velocidadeApurada < 140.01 THEN
            INSERT INTO ex_multa(cnh, _velocidadeApurada, _velocidadeApurada, pontos, valor) VALUES(p_cnh, velocidadeApurada, _velocidadeApurada, 40);
        ELSEIF _velocidadeApurada > 140.00 THEN
            INSERT INTO ex_multa(cnh, _velocidadeApurada, _velocidadeApurada, pontos, valor) VALUES(p_cnh, velocidadeApurada, _velocidadeApurada, 60);
        ELSE
            _msg := 'Velocidade apurada de ' || _motorista.nome || ' à ' || _velocidadeApurada ||'km/h está dentro da lei';
        END IF;
    
        RETURN _msg;
    END;
$$ LANGUAGE plpgsql;

SELECT * FROM processCalc('123AB', 70.00);

/*
    • Escreva um outro procedimento que atualize o campo totalMultas da
    tabela ex_motorista a partir dos totais apurados para cada
    motorista autuado na tabela ex_multa.
    
    • OBS1: motorista sem multa deverão possuir
    valor 0.00 no campo total multa;
    
    • OBS2:cuidado para não duplicar valores na coluna totalMultas para
    os casos em que a rotina for disparada mais de uma vez.
*/
