INSERT INTO curso VALUES(1, 'Oracle 8i', 360, to_date('01/03/2009','dd/mm/yyyy'));
INSERT INTO curso VALUES(2, 'Delphi', 300, to_date('30/05/2009','dd/mm/yyyy'));
INSERT INTO curso VALUES(3, 'Windows 98', 20, to_date('28/04/2009','dd/mm/yyyy'));
INSERT INTO curso VALUES(4, 'Linux', 35, to_date('06/06/2009','dd/mm/yyyy'));
INSERT INTO curso VALUES(5, 'Visual Basic', 120, to_date('28/04/2009','dd/mm/yyyy'));
INSERT INTO curso VALUES(6, 'Office', 15, to_date('30/05/2009','dd/mm/yyyy'));

INSERT INTO analista VALUES (1, 'João', 20, 'Av. Carlos Gomes, 200', 1, 2300);
INSERT INTO analista VALUES (2, 'Joice', 24, 'Av. Independência, 10', 1, 2245);
INSERT INTO analista VALUES (3, 'Pedro', 32, 'Av. Carlos Gomes, 100', 2, 2145);
INSERT INTO analista VALUES (4, 'Maria', 28, 'Dom Pedro II, 10 ', 6, 1890);
INSERT INTO analista VALUES (5, 'Rafael', 39, 'Av. Nilo Peçanha, 40 ', 2, 2800);

INSERT INTO programador VALUES(10, 'Jeferson', 34, 'Av. Ipiranga, 10', 1000);
INSERT INTO programador VALUES(20, 'Andrea', 25, 'Souza Reis, 200', 1200);
INSERT INTO programador VALUES(30, 'Ana Paula', 23, 'Av. Carlos Gomes, 100', 1450);
INSERT INTO programador VALUES(40, 'Fernando', 20, 'Av. Ipiranga, 20', 1600);
INSERT INTO programador VALUES(50, 'Susana', 40, 'Av. Assis Brasil, 200', 1180);
    
INSERT INTO atividadesanalise VALUES (10, to_date('01/01/2009','dd/mm/yyyy'), to_date('30/01/2009','dd/mm/yyyy'), 'Processo de venda', 2);
INSERT INTO atividadesanalise VALUES (20, to_date('03/02/2009','dd/mm/yyyy'), to_date('28/02/2009','dd/mm/yyyy'), 'Pedido de Compra', 2);
INSERT INTO atividadesanalise VALUES (30, to_date('05/04/2009','dd/mm/yyyy'), to_date('20/06/2009','dd/mm/yyyy'), 'Cadastro Fornecedor', 1);
INSERT INTO atividadesanalise VALUES (40, to_date('06/06/2009','dd/mm/yyyy'), to_date('30/07/2009','dd/mm/yyyy'), 'Cadastro Produto', 4);

INSERT INTO atividadesprog VALUES(100, to_date('05/01/2009','dd/mm/yyyy'), to_date('07/01/2009','dd/mm/yyyy'), 'Tela 105', 10, 10);
INSERT INTO atividadesprog VALUES(101, to_date('05/02/2009','dd/mm/yyyy'), to_date('10/02/2009','dd/mm/yyyy'), 'Relatorio 12', 10, 20);
INSERT INTO atividadesprog VALUES(102, to_date('05/02/2009','dd/mm/yyyy'), to_date('15/02/2009','dd/mm/yyyy'), 'Procedure 75', 20, 20);
INSERT INTO atividadesprog VALUES(103, to_date('06/04/2009','dd/mm/yyyy'), to_date('10/04/2009','dd/mm/yyyy'), 'Tela 165', 10, 30);
INSERT INTO atividadesprog VALUES(104, to_date('09/06/2009','dd/mm/yyyy'), to_date('15/06/2009','dd/mm/yyyy'), 'Relatório 16', 30, 30);
