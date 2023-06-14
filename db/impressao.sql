CREATE TABLE impressao(
	id serial not null,
	nome varchar(50),
	serial varchar(8),
	data DATE,
	pendente boolean,
	codigobarra NUMERIC(13,0),
	constraint pk_impressao primary key (id)
	
);


SELECT * FROM IMPRESSAO order by id desc;

-- Pesquisa por vários campos
SELECT * FROM IMPRESSAO WHERE UPPER(NOME) LIKE UPPER('%mouse%') or UPPER(SERIAL) LIKE UPPER('%mouse%')


-- TODO: Adicionar novo INSERT para testes com todos os campos (falta codigobarra)
INSERT INTO impressao (nome, serial, data, pendente) VALUES ('Smartphone Samsung Galaxy S21', 'A1234567', '2023-01-01', true);
INSERT INTO impressao (nome, serial, data, pendente) VALUES ('Notebook Dell XPS 13', 'B9876543', '2023-01-02', false);
INSERT INTO impressao (nome, serial, data, pendente) VALUES ('Smart TV LG OLED CX', 'C5432167', '2023-01-03', true);
INSERT INTO impressao (nome, serial, data, pendente) VALUES ('Tablet Apple iPad Pro', 'D7890123', '2023-01-04', false);
INSERT INTO impressao (nome, serial, data, pendente) VALUES ('Câmera Canon EOS R5', 'E2468135', '2023-01-05', true);
INSERT INTO impressao (nome, serial, data, pendente) VALUES ('Fone de Ouvido Sony WH-1000XM4', 'F1357924', '2023-01-06', false);
INSERT INTO impressao (nome, serial, data, pendente) VALUES ('Smartwatch Apple Watch Series 6', 'G2468135', '2023-01-07', true);
INSERT INTO impressao (nome, serial, data, pendente) VALUES ('Monitor Dell UltraSharp U2720Q', 'H3579246', '2023-01-08', false);
INSERT INTO impressao (nome, serial, data, pendente) VALUES ('Roteador TP-Link Archer C7', 'I5792468', '2023-01-09', true);
INSERT INTO impressao (nome, serial, data, pendente) VALUES ('Mouse Logitech MX Master 3', 'J1357924', '2023-01-10', false);
INSERT INTO impressao (nome, serial, data, pendente) VALUES ('Teclado Corsair K70 RGB', 'K5792468', '2023-01-11', true);
INSERT INTO impressao (nome, serial, data, pendente) VALUES ('HD Externo Seagate Backup Plus', 'L3579246', '2023-01-12', false);
INSERT INTO impressao (nome, serial, data, pendente) VALUES ('Impressora HP OfficeJet Pro 9025', 'M5792468', '2023-01-13', true);
INSERT INTO impressao (nome, serial, data, pendente) VALUES ('Caixa de Som Bluetooth JBL Flip 5', 'N3579246', '2023-01-14', false);
INSERT INTO impressao (nome, serial, data, pendente) VALUES ('Câmera de Segurança Arlo Pro 3', 'O5792468', '2023-01-15', true);
INSERT INTO impressao (nome, serial, data, pendente) VALUES ('Impressora Epson WorkForce WF-2750', 'P3579246', '2023-01-16', false);
INSERT INTO impressao (nome, serial, data, pendente) VALUES ('Monitor Gaming ASUS ROG Swift PG279Q', 'Q5792468', '2023-01-17', true);