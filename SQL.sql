/*Estudo de comandos SQL*/

CREATE DATABASE COMERCIO;

USE COMERCIO;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('COM','RES','CEL'),
	NUMERO VARCHAR(10),
	ID_CLIENTE INT,
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE,
	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

INSERT INTO CLIENTE VALUES(NULL,'JOAO','M','JOAO@IG.COM','98547-6');
INSERT INTO CLIENTE VALUES(NULL,'CARLOS','M','CARLOS@TERA.COM','86664-7');
INSERT INTO CLIENTE VALUES(NULL,'ANA','F','ANA@GLOBO.COM','75658-5');
INSERT INTO CLIENTE VALUES(NULL,'JORGE','M','JORGE@IG.COM','88657-5');
INSERT INTO CLIENTE VALUES(NULL,'CLARA','M',NULL,'99754-7');
INSERT INTO CLIENTE VALUES(NULL,'CELIA','F','JOAO@TERRA.COM','77558-5');

SELECT * FROM CLIENTE;

INSERT INTO ENDERECO VALUES(NULL,'RUA A','CENTRO','B. HORIZONTE','MG',4);
INSERT INTO ENDERECO VALUES(NULL,'RUA B','CENTRO','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDERECO VALUES(NULL,'RUA C','JARDINS','SAO PAULO','SP',3);
INSERT INTO ENDERECO VALUES(NULL,'RUA B','ESTACIO','RIO DE JANEIRO','RJ',8);
INSERT INTO ENDERECO VALUES(NULL,'RUA Z','CRUZEIRO','B. HORIZONTE','MG',2);
INSERT INTO ENDERECO VALUES(NULL,'RUA X','FLAMENGO','RIO DE JANEIRO','RJ',7);
INSERT INTO ENDERECO VALUES(NULL,'RUA Z','CRUZEIRO','B. HORIZONTE','MG',5);
INSERT INTO ENDERECO VALUES(NULL,'RUA X','CENTRO','NITERÓI','RJ',6);

SELECT * FROM ENDERECO;

INSERT INTO TELEFONE VALUES(NULL,'CEL','9955331',1);
INSERT INTO TELEFONE VALUES(NULL,'COM','6574565',3);
INSERT INTO TELEFONE VALUES(NULL,'CEL','8864566',2);
INSERT INTO TELEFONE VALUES(NULL,'CEL','5557798',7);
INSERT INTO TELEFONE VALUES(NULL,'COM','6765768',1);
INSERT INTO TELEFONE VALUES(NULL,'RES','5676765',6);
INSERT INTO TELEFONE VALUES(NULL,'CEL','5765547',1);
INSERT INTO TELEFONE VALUES(NULL,'CEL','8865645',7);
INSERT INTO TELEFONE VALUES(NULL,'RES','7555446',7);
INSERT INTO TELEFONE VALUES(NULL,'CEL','5788654',3);
INSERT INTO TELEFONE VALUES(NULL,'CEL','7865644',6);
INSERT INTO TELEFONE VALUES(NULL,'RES','5754644',6);

SELECT * FROM TELEFONE;

SELECT * FROM CLIENTE;
SELECT * FROM ENDERECO;
SELECT * FROM TELEFONE;

----------------------------------------------------

SELECT NOW() AS "DATA";

SELECT NOME, NOW() AS "DATA"
FROM CLIENTE

SELECT NOME, SEXO
FROM CLIENTE;

SELECT NOME, SEXO
FROM CLIENTE
WHERE SEXO = 'M'; /*SELEÇÃO*/

UPDATE CLIENTE
SET SEXO = 'F'
WHERE  IDCLIENTE = 5; /*SELEÇÃO*/

/*NOME, SEXO, BAIRRO, CIDADE, DATA */

SELECT NOME, SEXO, BAIRRO, CIDADE, NOW() AS "DATA"
FROM CLIENTE, ENDERECO
WHERE IDCLIENTE = ID_CLIENTE
AND BAIRRO = 'CENTRO';

/*ESQUECER WHERE PARA FAZER JOIN *********IMPORTANTE**********/ 

SELECT NOME, SEXO, BAIRRO, CIDADE /*PROJEÇAÕ*/
FROM CLIENTE 
INNER JOIN ENDERECO                 /*JUNÇAO*/
ON IDCLIENTE = ID_CLIENTE         
WHERE BAIRRO = 'CENTRO';            /*SELEÇAO*/

SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE,
 TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE
INNER JOIN ENDERECO
ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
INNER JOIN TELEFONE
ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE,
 T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE,
 T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'M';

/*TESTAR POR PARTES, PARA EVITAR ERRO, SEMPRE QUEBRAR AS QUERRY PARA MELHOR ANALISALAS*/

