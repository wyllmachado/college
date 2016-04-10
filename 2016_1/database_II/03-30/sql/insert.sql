/* Dados da tabela Construtora */
INSERT INTO construtora VALUES('c1', '12365423512489','Encol');
INSERT INTO construtora VALUES('c2','78874529890133','Goldzstein');
INSERT INTO construtora VALUES('c3', '89083484166739','A3');
INSERT INTO construtora VALUES('c4', '87294592979871','Metaplan');

/* Dados da tabela Engenheiro */
INSERT INTO engenheiro VALUES('e1','5637279211','Luis Silva','Edificacao');
INSERT INTO engenheiro VALUES('e2','73941939815','Carlos Alvarez','Pontes/Viadutos');
INSERT INTO engenheiro VALUES('e3','89058348193','Maria Souza','Pontes/Viadutos');
INSERT INTO engenheiro VALUES('e4','83489347851','Jose Silva','Edificacao');

/* Dados da tabela Obra */
INSERT INTO obra VALUES(01,'Boqueirao','BR 116, Km 25','Viaduto','c4','e2');
INSERT INTO obra VALUES(02,'Solar Firenze','Rua Mariland, 512 - Porto Alegre','Edificio','c1','e1');
INSERT INTO obra VALUES(03,'Serraria','Rua Sarandi, 600 - Porto Alegre','Ponte','c4','e3');
INSERT INTO obra VALUES(04,'Venezia','Av. Carlos Soares, 890 - Canoas','Edificio','c3','e4');
INSERT INTO obra VALUES(05,'Guaiba','Av. Praia de Belas, 1200 - Porto Alegre','Edificio','c2','e1');
INSERT INTO obra VALUES(06,'particular','Rua Ipanema, 310 - Porto Alegre','Casa','c3','e3');

/* Dados da tabela Operario */
insert into operario values ('op030','Joao Souza','Rua Lima, 89 - Porto Alegre','249-9087');
insert into operario values ('op010','Paulo Castro','Av. Protasio Alves, 23/101 - Porto Alegre',NULL);
insert into operario values ('op876','Luis Padilha','Av. Salgado Filho, 345 - Canoas','472-9083');
insert into operario values ('op452','Marcos Freitas','Travessa do Canto, 67/304 - Porto Alegre','331-7838');

/* Dados da tabela obra_operario */
insert into obra_operario values (03,'op010',to_date('15/06/1997','dd/mm/yyyy'),'preparacao da base');
insert into obra_operario values (01,'op030',to_date('18/06/1997','dd/mm/yyyy'),'preparacao e colocacao de ferros');
insert into obra_operario values (01,'op010',to_date('02/08/1997','dd/mm/yyyy'),NULL);
insert into obra_operario values (02,'op876',to_date('20/08/1997','dd/mm/yyyy'),'pintura aberturas do 2o. andar');
insert into obra_operario values (02,'op030',to_date('12/08/1997','dd/mm/yyyy'),'colocacao aberturas 20. andar');
insert into obra_operario values (04,'op010',to_date('03/03/1997','dd/mm/yyyy'),'colocacao telhado');

/* Dados da tabela operario_construtora */
insert into operario_construtora values ('op010','c4');
insert into operario_construtora values ('op030','c4');
insert into operario_construtora values ('op030','c1');
insert into operario_construtora values ('op010','c3');
insert into operario_construtora values ('op876','c1');
