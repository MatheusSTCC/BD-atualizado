USE master IF EXISTS(select * from sys.databases where name='bd_sosmecanico') 
DROP DATABASE bd_sosmecanico
GO 
-- CRIAR UM BANCO DE DADOS
CREATE DATABASE bd_sosmecanico
GO
-- ACESSAR O BANCO DE DADOS
USE bd_sosmecanico
GO

CREATE TABLE Usuario
( 
   id            INT			IDENTITY,
   nome          VARCHAR(100)	NOT NULL,
   email         VARCHAR(100)	UNIQUE NOT NULL,
   senha         VARCHAR(100)	NOT NULL,
   nivelAcesso   VARCHAR(10)    NULL, -- CLIENTE
   foto			 VARBINARY(MAX) NULL,
   dataCadastro	 SMALLDATETIME	NOT NULL,
   statusUsuario VARCHAR(20)    NOT NULL, -- ATIVO ou INATIVO ou TROCAR_SENHA

   PRIMARY KEY (id)
)
GO

alter table usuario
drop column dataCadastro

select * from usuario

INSERT Usuario (nome, email, senha, nivelAcesso, foto, dataCadastro, statusUsuario)
VALUES ('Fulano da Silva', 'fulano@email.com.br', '12345678', 'ADMIN', NULL, GETDATE(), 'ATIVO')
INSERT Usuario (nome, email, senha, nivelAcesso, foto, dataCadastro, statusUsuario)
VALUES ('Beltrano de Sá', 'beltrano@email.com.br', 'MTIzNDU2Nzg=', 'MECANICO', NULL, GETDATE(), 'ATIVO')
INSERT Usuario (nome, email, senha, nivelAcesso, foto, dataCadastro, statusUsuario)
VALUES ('Sicrana de Oliveira', 'sicrana@email.com.br', 'MTIzNDU2Nzg=', 'CLIENTE', NULL, GETDATE(), 'ATIVO')
INSERT Usuario (nome, email, senha, nivelAcesso, foto, dataCadastro, statusUsuario)
VALUES ('Ordnael Zurc', 'ordnael@email.com.br', 'MTIzNDU2Nzg=', 'CLIENTE', NULL, GETDATE(), 'ATIVO')
GO

CREATE TABLE Mecanico
(
	id				INT		     IDENTITY,
	nome			VARCHAR(100) NOT NULL,
	telefone		VARCHAR(20)	 NOT NULL,
	cpf				VARCHAR(14)	 NOT NULL,
	cidade		    VARCHAR(400) NOT NULL,
	descricao       VARCHAR(250) NOT NULL,
	usuario_id		INT			 NOT NULL,
	statusMecanico	VARCHAR(10)	 NOT NULL, -- ATIVO ou INATIVO
 

	PRIMARY KEY (id),
	FOREIGN KEY (usuario_id) REFERENCES Usuario (id)
)
GO
INSERT Mecanico (nome, telefone, cpf, cidade, descricao, usuario_id, statusMecanico)
VALUES ('Beltrano de Sá Oficina', '11 98765-4321', '30040050060', 'Barueri', 'Amo carros', 2, 'ATIVO')

CREATE TABLE AvalMecanico
(
	id			   INT		     IDENTITY,
	dataCadastro   SMALLDATETIME NOT NULL,
	usuario_id     INT			 NOT NULL,
	mecanico_id    INT			 NOT NULL,
	nota		   DECIMAL(5,2)	 NOT NULL,
	statusAval     INT    NOT NULL, -- 1 = ATIVO ou 0 = INATIVO

	PRIMARY KEY (id),
	FOREIGN KEY (usuario_id) REFERENCES Usuario (id),
	FOREIGN KEY (mecanico_id) REFERENCES Mecanico (id)
)

INSERT AvalMecanico (dataCadastro, usuario_id, mecanico_id, nota, statusAval)
VALUES (GETDATE(), 3, 1, 4, 1)

CREATE TABLE Mensagem
(
	id	            INT			  IDENTITY,
	dataMensagem    SMALLDATETIME NOT NULL,
	emissorMensagem VARCHAR(100)  NOT NULL,
	email 	        VARCHAR(100)  NOT NULL,
	telefone	    VARCHAR(20)       NULL,
	texto 	        VARCHAR(400)  NOT NULL,
	statusMensagem  VARCHAR(10)   NOT NULL, -- ATIVO ou INATIVO

	PRIMARY KEY (id)
)
GO
INSERT Mensagem (dataMensagem, emissorMensagem, email, telefone, texto, statusMensagem) 
VALUES (GETDATE(), 'Ordnael Zurc', 'ordnael@email.com', '(11) 98765-4123', 'Mensagem de teste', 'ATIVO')
INSERT Mensagem (dataMensagem, emissorMensagem, email, telefone, texto, statusMensagem) 
VALUES (GETDATE(), 'Maria Onete', 'maria@email.com', null, 'Segunda mensagem de teste', 'ATIVO')
GO

CREATE TABLE UsuarioMob
( 
   id_mob            INT			IDENTITY,
   nome          VARCHAR(100)	NOT NULL,
   email         VARCHAR(100)	UNIQUE NOT NULL,
   senha         VARCHAR(100)	NOT NULL,
   nivelAcesso   VARCHAR(10)    NULL, -- CLIENTE
   foto			 VARBINARY(MAX) NULL,
   statusUsuario VARCHAR(20)    NOT NULL, -- ATIVO ou INATIVO ou TROCAR_SENHA

   PRIMARY KEY (id_mob)
)

GO

alter table usuarioMob
drop column dataCadastro

select * from usuario

SELECT * FROM Usuario
SELECT * FROM Mensagem
SELECT * FROM Mecanico
SELECT * FROM AvalMecanico
SELECT * FROM UsuarioMob





