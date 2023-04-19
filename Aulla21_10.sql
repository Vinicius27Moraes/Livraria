        /*drop database livraria;*/
CREATE DATABASE LIVRARIA;
USE LIVRARIA;

CREATE TABLE Editora (
codeditora decimal(10),
nome varchar(100) NOT NULL,
CONSTRAINT edi_codeditora_pk PRIMARY KEY(codeditora)

);

CREATE TABLE Assunto (
sigla char(1),
assunto varchar(100) NOT NULL,
CONSTRAINT ass_sigla_pk PRIMARY KEY(sigla)

);

CREATE TABLE Livro (
titulo varchar(50) NOT NULL,
datapublicacao Date,
codlivro decimal(10),
numpags decimal(4),
preco decimal(6,2),
codeditora decimal(10)NOT NULL,
sigla char(1)NOT NULL,
CONSTRAINT liv_codlivro_pk PRIMARY KEY(codlivro),
CONSTRAINT liv_edi__codeditora_fk FOREIGN KEY(codeditora) REFERENCES EDITORA(codeditora),
CONSTRAINT liv_ass_sigla_fk FOREIGN KEY(sigla) REFERENCES ASSUNTO(sigla)

);


CREATE TABLE Autor (
CPF decimal(10) NOT NULL,
datanasc date,
nome varchar(150) NOT NULL,
nacionalidade varchar(100),
matricula decimal(10),
CONSTRAINT aut_matricula_pk PRIMARY KEY(matricula),
CONSTRAINT aut_cpf_uk UNIQUE(cpf)

);



CREATE TABLE Livro_autoria (
codlivro decimal(10) NOT NULL,
matricula decimal(10) NOT NULL,
CONSTRAINT livaut_liv_codlivro_fk FOREIGN KEY(codlivro) REFERENCES LIVRO(codlivro),
CONSTRAINT livaut_aut_matricula_fk FOREIGN KEY(matricula) REFERENCES AUTOR(matricula)

);



CREATE TABLE Loja (
CNPJ decimal(10),
nome varchar(150) NOT NULL,
CONSTRAINT loj_cnpj_pk PRIMARY KEY(cnpj)

);




CREATE TABLE CARTAO(
        codcartao decimal(10),
        tipocartao varchar(20),
        CONSTRAINT car_codcar_pk primary key(codcartao)

);



CREATE TABLE Cliente (
CPF decimal(10),
datanasc date,
nome varchar(150) NOT NULL,
nacionalidade varchar(100),
codcartao decimal(10),
CONSTRAINT aut_cpf_pk PRIMARY KEY(cpf),
CONSTRAINT car_cli_codcart_fk FOREIGN KEY(codcartao) REFERENCES CARTÃO(codcartao)


);




CREATE TABLE Venda (
idvenda decimal(10),
quantidade decimal(5) NOT NULL,
total decimal(6,2),
datavenda date,
CNPJ decimal(10) NOT NULL,
codlivro decimal(10),
cpf decimal(10) NOT NULL,
CONSTRAINT ven_codlivro_pk PRIMARY KEY(idvenda, codlivro),
CONSTRAINT ven_liv_codlivro_fk FOREIGN KEY(codlivro) REFERENCES LIVRO(codlivro),
CONSTRAINT ven_loj_cnpj_fk FOREIGN KEY(cnpj) REFERENCES LOJA(cnpj),
CONSTRAINT ven_cli_cpf_fk FOREIGN KEY(cpf) REFERENCES CLIENTE(cpf)

);

CREATE TABLE EDITORAAUX(
CODEDITORA CHAR(10),
NOME VARCHAR(100),
CONSTRAINT edi_codeditora2_pk primary key(codeditora)

);

CREATE TABLE LOG(usuario varchar(100), datahora varchar(25));

CREATE TABLE AUDITORIA(
                      codlivro decimal(10),
                      precoantigo decimal(6,2),
                      preconovo decimal(6,2),
                      datahora varchar(25)
                      );







-- COMANDOS DML - POPULANDO O BANCO DE DADOS

-- TABELA EDITORA

INSERT INTO EDITORA(codeditora, nome) VALUES(1,'MIRANDELA EDITORA');
INSERT INTO EDITORA(codeditora, nome) VALUES(2,'EDITORA VIA-NORTE');
INSERT INTO EDITORA(codeditora, nome) VALUES(3,'EDITORA ILHAS TIJUCA');
INSERT INTO EDITORA(codeditora, nome) VALUES(4,'MARIA JOSÉ EDITORA');

-- TABELA ASSUNTO

INSERT INTO ASSUNTO(sigla, assunto)  VALUES('B','banco de dados');
INSERT INTO ASSUNTO(sigla, assunto)  VALUES('P', 'programação');
INSERT INTO ASSUNTO(sigla, assunto)  VALUES('R', 'redes');
INSERT INTO ASSUNTO(sigla, assunto)  VALUES('S', 'sistemas operacionais');


-- TABELA LIVRO
select * from livro where codlivro = 1;
INSERT INTO LIVRO(codlivro, preco, numpags, titulo, datapublicacao, codeditora, sigla) VALUES (1, 31.25, 55, 'BANCO DE DADOS PARA A WEB', '2022-01-05', 1, 'B');
INSERT INTO LIVRO(codlivro, preco, numpags, titulo, datapublicacao, codeditora, sigla) VALUES (2, 30.55, 47, 'PROGRAMANDO EM LINGUAGEM C', '2021-10-01', 1, 'P');
INSERT INTO LIVRO(codlivro, preco, numpags, titulo, datapublicacao, codeditora, sigla) VALUES (3, 111.52, 103, 'PROGRAMANDO EM LINGUAGEM C++', '2022-05-10', 3, 'P');
INSERT INTO LIVRO(codlivro, preco, numpags, titulo, datapublicacao, codeditora, sigla) VALUES (4, 48.99, 66, 'BANCO DE DADOS NA BIOINFORMATICA','2020-08-10', 2, 'B');
INSERT INTO LIVRO(codlivro, preco, numpags, titulo, datapublicacao, codeditora, sigla) VALUES (5, 42.20, 93, 'REDES DE COMPUTADORES', '2022-10-01', 2, 'R');


-- TABELA AUTOR

INSERT INTO AUTOR(matricula, cpf, datanasc, nome, nacionalidade) VALUES(111, 890001, '1978-08-08', 'Luciano Blomberg', 'Brasileira');
INSERT INTO AUTOR(matricula, cpf, datanasc, nome, nacionalidade) VALUES(112, 780002, '1959-03-23', 'Carlos Padilha', 'Brasileira');
INSERT INTO AUTOR(matricula, cpf, datanasc, nome, nacionalidade) VALUES(113, 920003, '1951-09-16', 'Ana Silveira Escobar', 'Colombiana');
INSERT INTO AUTOR(matricula, cpf, datanasc, nome, nacionalidade) VALUES(114, 810004, '1963-01-13', 'César Oliveira', 'Brasileira');
INSERT INTO AUTOR(matricula, cpf, datanasc, nome, nacionalidade) VALUES(115, 820005, '1965-01-20', 'Marcos Andrade', 'Brasileira');
INSERT INTO AUTOR(matricula, cpf, datanasc, nome, nacionalidade) VALUES(116, 890006, '1979-10-05', 'Carla Maldonado Silva', 'Brasileira');
INSERT INTO AUTOR(matricula, cpf, datanasc, nome, nacionalidade) VALUES(117, 780007, '1959-06-12', 'Carlos Tenório', 'Equatoriana');
INSERT INTO AUTOR(matricula, cpf, datanasc, nome, nacionalidade) VALUES(118, 770008, '1982-10-07', 'Maria Fonseca', 'Brasileira');



-- TABELA LIVRO_AUTORIA

INSERT INTO LIVRO_AUTORIA(codlivro, matricula) VALUES(1,111);
INSERT INTO LIVRO_AUTORIA(codlivro, matricula) VALUES(1,112);
INSERT INTO LIVRO_AUTORIA(codlivro, matricula) VALUES(1,113);
INSERT INTO LIVRO_AUTORIA(codlivro, matricula) VALUES(2,114);
INSERT INTO LIVRO_AUTORIA(codlivro, matricula) VALUES(3,114);
INSERT INTO LIVRO_AUTORIA(codlivro, matricula) VALUES(3,115);
INSERT INTO LIVRO_AUTORIA(codlivro, matricula) VALUES(4,111);
INSERT INTO LIVRO_AUTORIA(codlivro, matricula) VALUES(4,116);
INSERT INTO LIVRO_AUTORIA(codlivro, matricula) VALUES(5,117);
INSERT INTO LIVRO_AUTORIA(codlivro, matricula) VALUES(5,118);



-- TABELA CARTÃO

INSERT INTO CARTÃO(codcartao, tipocartao) VALUES(1, 'SPECIAL');
INSERT INTO CARTÃO(codcartao, tipocartao) VALUES(2, 'PREMIUM');
INSERT INTO CARTÃO(codcartao, tipocartao) VALUES(3, 'GOLD');
INSERT INTO CARTÃO(codcartao, tipocartao) VALUES(4, 'GOLD PLUS');





-- TABELA CLIENTE


INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade,codcartao) VALUES(920003, '1990-01-05', 'Ana Escobar', 'Colombiana',1);          
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade,codcartao) VALUES(890006, '2020-01-11', 'Carla Silva', 'Brasileira',1);         
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade,codcartao) VALUES(890106, '2001-01-11', 'João Inácio Magalhães', 'Brasileira',2);    
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade,codcartao) VALUES(890206, '2003-08-12', 'César Gonçalves', 'Brasileira',2);           
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade,codcartao) VALUES(890306, '1999-10-01', 'Flávio Aguiar Fonseca', 'Brasileira',2);        
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade,codcartao) VALUES(890406, '1969-08-26', 'Henrique Meirelles', 'Brasileira',2);     
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade,codcartao) VALUES(890506, '1985-01-15', 'Cleide Castanheira', 'Brasileira',2);
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade,codcartao) VALUES(890606, '2005-12-01', 'Júlio Siqueira', 'Brasileira',2);
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade,codcartao) VALUES(890706, '1985-10-05', 'Elza Saldanha Prado', 'Brasileira',2);
INSERT INTO CLIENTE(cpf, datanasc, nome, nacionalidade,codcartao) VALUES(890806, '2005-01-01', 'Marco Antônio Rossi', 'Brasileira',2);




-- TABELA LOJA

INSERT INTO LOJA(cnpj, nome) VALUES(99991, 'Tabajara 1');
INSERT INTO LOJA(cnpj, nome) VALUES(99992, 'Tabajara 2');


-- TABELA VENDA

INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(1,1,31.20,'2020-05-10',99991,1,890406);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(1,1,48.00,'2020-05-10',99991,4,890406);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(2,3,126.00,'2022-09-07',99991,5,890406);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(3,2,334.50,'2021-05-01',99991,3,890506);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(3,1,42.00,'2021-05-01',99991,5,890506);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(4,1,31.20,'2022-08-26',99991,1,890306);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(4,1,42.00,'2022-08-26',99991,5,890306);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(4,1,111.50,'2022-08-26',99991,3,890306);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(5,2,62.40,'2022-07-01',99991,1,890506);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(5,1,48.00,'2022-07-01',99991,4,890506);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(6,3,334.50,'2001-11-01',99991,3,890206);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(7,1,111.50,'2005-10-10',99991,3,920003);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(7,1,48.00,'2005-10-10',99991,4,920003);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(7,1,42.00,'2005-10-10',99991,5,920003);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(8,2,84.00,'2005-10-10',99991,5,890206);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(9,1,31.20,'2005-10-10',99991,1,890206);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(9,1,48.00,'2005-10-10',99991,4,890206);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(10,5,156.00,'2021-05-09',99991,1,890606);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(11,2,96.00,'2021-05-09',99991,4,890606);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(11,2,84.00,'2021-05-09',99991,5,890606);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(12,1,42.00,'2021-05-09',99991,4,890706);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(13,1,30.00,'2021-06-09',99992,2,890606);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(13,1,111.50,'2021-06-09',99992,3,890606);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(14,1,31.20,'2021-06-09',99992,1,890806);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(15,8,'','2022-10-12',99992,5,890106);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(15,5,150.00,'2022-10-12',99992,2,890106);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(15,4,446.00,'2022-10-12',99992,3,890106);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(16,1,31.20,'2022-03-10',99992,1,890106);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(17,1,31.20,'2022-10-12',99992,1,890006);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(17,1,30.00,'2022-10-12',99992,2,890006);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(17,1,111.50,'2022-10-12',99992,3,890006);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(17,1,'','2022-10-12',99992,5,890006);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(18,1,30.00,'2022-10-12',99992,2,890506);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(19,2,60.00,'2022-10-14',99992,2,890806);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(19,2,84.00,'2022-10-14',99992,4,890806);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(20,1,111.50,'2022-10-14',99992,3,890706);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(21,1,30.00,'2021-08-26',99992,2,890706);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(21,1,'','2021-08-26',99992,5,890706);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(22,2,62.40,'2021-10-12',99992,1,890706);
INSERT INTO VENDA(idvenda, quantidade, total, datavenda, cnpj, codlivro, cpf) VALUES(23,1,30.00,'2021-10-12',99992,2,890206);


-- TABELA EDITORAAUX


INSERT INTO EDITORAAUX(codeditora, nome) VALUES(6, 'EDITORA MACEDO');
INSERT INTO EDITORAAUX(codeditora, nome) VALUES(7, 'EDITORA SILVA');
INSERT INTO EDITORAAUX(codeditora, nome) VALUES(8, 'GLOBO');
INSERT INTO EDITORAAUX(codeditora, nome) VALUES(9, 'EDIPUCRS');

COMMIT;



-- 4) 
select a.nome, l.titulo 
	from livro_autoria la 
		inner join autor a on la.matricula = a.matricula 
		inner join livro l on la.codlivro = l.codlivro;


-- 3)
select l.codlivro, l.titulo, a.assunto
from livro l inner join assunto a on l.sigla = a.sigla;


-- 2)
select l.codlivro, l.titulo, e.codeditora 
from livro l inner join editora e on l.codeditora = e.codeditora;

-- 6)

select v.* 
from venda v inner join cliente c on v.cpf = c.cpf
			  inner join cartão cs on c.codcartao = cs.codcartao 
where cs.tipocartao = 'Special';

-- 7)
select l.titulo, sum(v.total) total_vendas
from livro l inner join venda v on l.codlivro = v.codlivro
group by l.titulo;
              
              
		






