/*
SAMPLE 01
*/

CREATE or REPLACE FUNCTION fn_exemplo_a()
RETURNS integer AS $$

<<bloco_externo>> -- bloco nomeado
DECLARE
    _qtd integer := 30;
BEGIN
    RAISE NOTICE 'Quantidade aqui vale: %', _qtd; -- 30
    _qtd := 50;

    /*
     SUB BLOCK
    */
    DECLARE
        _qtd integer := 80;
    BEGIN
        RAISE NOTICE 'Quantidade (interno) aqui vale: %', _qtd; -- 80
        RAISE NOTICE 'Quantidade (externo) aqui vale: %', bloco_externo._qtd; -- 50
    END;

    RAISE NOTICE 'Quantidade (externo) aqui vale: %', _qtd; -- 50
    RETURN _qtd;
END;
$$ LANGUAGE plpgsql;

/*
EXEC
*/
select * from fn_exemplo_a()


/*
SAMPLE 02
*/
CREATE OR REPLACE FUNCTION fn_exemploTipos(p_cod_cli CHAR(10))
RETURNS VARCHAR(50) AS $$

DECLARE
    _cliente cliente_p%rowtype; -- registro do tipo cliente (possui todos as colunas da tabela cliente e irá armazenar uma linha
    _cod_cli cliente_p.cod_cli%type;
    _msg varchar(80);
BEGIN
    SELECT * INTO _cliente FROM cliente_p WHERE cod_cli = p_cod_cli;
        
    RAISE NOTICE '%', 'Atribui um valor a variável do tipo type';
        
    _cod_cli := 'c1';
        
    IF _cod_cli = _cliente.cod_cli THEN
        RAISE NOTICE '%', 'Se cliente for igual a c3 listar o nome do cliente c1';
        _msg := 'Cliente já existe : ';
            
        SELECT * INTO _cliente FROM cliente_p WHERE cod_cli = _cod_cli;
    END IF; 
        
    RETURN _msg || _cliente.nome;
END;
$$ LANGUAGE 'plpgsql';

/*
EXEC
*/
SELECT * FROM fn_exemploTipos('c1')

