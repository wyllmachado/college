/*
    a) Recuperar os nomes de clientes que não voaram para o Rio de Janeiro no dia 20/09/02.

    NOME
    -------------------
    Luis
*/
SELECT cp.nome
FROM cliente_p cp
WHERE NOT EXISTS (
    SELECT *
    FROM voo v, execucao_voo ev, passagem p
    WHERE ev.num_voo = v.num_voo    
    AND v.cidade_cheg = 'Rio de Janeiro'
    AND p.num_voo = ev.num_voo
    AND p.data = '20-sep-02'
    AND cp.cod_cli = p.cod_cli
)

/*
    b) Para cada vôo que o piloto Paulo tenha comandado, recuperar a cidade de partida e a data do vôo,
    bem como o número de passagens marcadas. Mostrar somente os vôos com menos de 500
    passagens.

    CIDADE_PART             DATA        COUNT(COD_CLI)
    --------------------    --------    --------------
    Sao Paulo               18/06/02    1
    Sao Paulo               20/09/02    1
    Porto Alegre            10/08/02    2
    Porto Alegre            11/11/02    1
*/

/*
    c) Obter a cidade de partida e a data do último vôo que o piloto Paulo tenha comandado.

    CIDADE_PART             DATA
    --------------------    --------
    Porto Alegre            11/11/02
*/

/*
    d) Recuperar o código e nome de clientes que marcaram passagem em pelo menos todos os vôos
    comandados pelo piloto Ronaldo, que saíram de Porto Alegre.

    COD_CLI     NOME
    ----------  ------------------------------
    c3          Carlos
*/

/*
    e) Recuperar o código e nome de clientes que marcaram passagem em pelo menos todos os vôos
    comandados pelo piloto Ronaldo, que saíram de Porto Alegre. Selecionar somente aqueles clientes
    que tenham mais de uma passagem marcada até o final do ano em vôos ainda não executados.

    COD_CLI     NOME
    ----------  --------------------------
    c3          Carlos
*/
