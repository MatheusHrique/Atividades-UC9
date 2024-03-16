
CREATE DATABASE IF NOT EXISTS Exercicio1;

CREATE TABLE IF NOT EXISTS Clientes(
id INT AUTO_INCREMENT KEY UNIQUE NOT NULL,
nome VARCHAR(100) NOT NULL,
cidade VARCHAR(100) NOT NULL,
tipo VARCHAR(100) NOT NULL

-- PRIMARY KEY(id). Não precisa declarar se já for declarado ali no atributo id
);

CREATE TABLE IF NOT EXISTS Vendedor(
id INT AUTO_INCREMENT KEY UNIQUE NOT NULL,
nome VARCHAR(100) NOT NULL,
idade INT NOT NULL,
salario DECIMAL(6,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS Pedido(
id INT AUTO_INCREMENT KEY UNIQUE NOT NULL,
idVendedor INT NOT NULL,
idCliente INT NOT NULL,
quantidade_itens INT NOT NULL,
valor_total DECIMAL(6,2) NOT NULL,

FOREIGN KEY(idVendedor) REFERENCES Vendedor(id),
FOREIGN KEY(idCliente) REFERENCES Clientes(id)
);

-- Inserções na tabela Clientes
INSERT INTO Clientes (nome, cidade, tipo) VALUES 
('Cliente1', 'Cidade1', 'Tipo1'),
('Cliente2', 'Cidade2', 'Tipo2'),
('Cliente3', 'Cidade3', 'Indústria'),
('Cliente4', 'Cidade4', 'Tipo4'),
('Cliente5', 'Cidade5', 'Tipo5');

-- Inserções na tabela Vendedor
INSERT INTO Vendedor (nome, idade, salario) VALUES 
('Vendedor1', 30, 1000.00),
('Vendedor2', 35, 8500.00),
('João', 40, 4000.00),
('Vendedor4', 45, 4500.00),
('Vendedor5', 50, 5000.00);

-- Inserções na tabela Pedido
INSERT INTO Pedido (idVendedor, idCliente, quantidade_itens, valor_total) VALUES 
(1, 1, 10, 100.00),
(2, 2, 20, 9000.00),
(3, 3, 30, 7000.00),
(4, 4, 40, 7000.00),
(5, 5, 50, 500.00);

SELECT Clientes.id, Clientes.nome, Clientes.cidade, Clientes.tipo, Pedido.quantidade_itens, Pedido.valor_total, Vendedor.id, Vendedor.nome, Vendedor.idade, Vendedor.salario FROM Clientes INNER JOIN Pedido ON Clientes.id=Pedido.idCliente 
JOIN Vendedor ON Vendedor.id=Pedido.idVendedor;
-- Vai fazer conectar o id de "Clientes" para o de idClientes em "Pedido" funcionar além de fazer a utilização do select

-- 1.1)
SELECT Clientes.nome FROM Clientes INNER JOIN Pedido ON Clientes.id=Pedido.idCliente 
JOIN Vendedor ON Vendedor.id=Pedido.idVendedor;

-- 1.2)
SELECT DISTINCT idVendedor FROM Pedido;

-- 1.3)
SELECT Vendedor.id FROM vendedor
LEFT JOIN Pedido ON Vendedor.id = Pedido.idVendedor
WHERE Pedido.idVendedor IS NULL;

-- 1.4)
SELECT Vendedor.nome AS Vendedores FROM Clientes INNER JOIN Pedido ON Clientes.id=Pedido.idCliente 
JOIN Vendedor ON Vendedor.id=Pedido.idVendedor
WHERE Clientes.tipo LIKE '%Indústria%';

-- 1.5)
SELECT Clientes.nome AS Cliente, Vendedor.nome AS Vendedor FROM Clientes INNER JOIN Pedido ON Clientes.id=Pedido.idCliente 
JOIN Vendedor ON Vendedor.id=Pedido.idVendedor
WHERE Vendedor.nome LIKE 'João%';

-- 1.6)
SELECT Clientes.nome AS Cliente, Vendedor.nome AS Vendedor, Pedido.valor_total AS Preço FROM Clientes INNER JOIN Pedido ON Clientes.id=Pedido.idCliente 
JOIN Vendedor ON Vendedor.id=Pedido.idVendedor
WHERE Pedido.valor_total > '5000';


-- EXERCICIO 2 A PARTIR DAQUI


CREATE DATABASE IF NOT EXISTS Exercicio2;

CREATE TABLE IF NOT EXISTS Aluno(
id INT NOT NULL AUTO_INCREMENT KEY UNIQUE,
nome VARCHAR(100) NOT NULL,
curso VARCHAR(100),
nivel INT,
idade INT
);

CREATE TABLE IF NOT EXISTS Turma(
id INT NOT NULL AUTO_INCREMENT KEY UNIQUE,
nome VARCHAR(100),
sala INT,
horario datetime
);

CREATE TABLE IF NOT EXISTS Matricula(
id INT NOT NULL AUTO_INCREMENT KEY UNIQUE,
id_aluno INT NOT NULL,
id_turma INT NOT NULL,
nota_1 DECIMAL(4,2),
nota_2 DECIMAL(4,2),
nota_3 DECIMAL(4,2),
nota_final DECIMAL(4,2),
qnt_faltas INT,

FOREIGN KEY(id_aluno) REFERENCES Aluno(id),
FOREIGN KEY(id_turma) REFERENCES Turma(id)
);

-- Inserções na tabela Aluno
INSERT INTO Aluno (nome, curso, nivel, idade) VALUES 
('João', 'Engenharia', 1, 20),
('Maria', 'Medicina', 2, 22),
('Pedro', 'Direito', 3, 21),
('Ana', 'Administração', 1, 19),
('Carlos', 'Economia', 2, 23),
('MEDINHO', 'NAAA', 1, 29);

-- Inserções na tabela Turma
INSERT INTO Turma (nome, sala, horario) VALUES 
('Turma A', 101, '2024-02-22 08:00:00'),
('Turma B', 102, '2024-02-22 10:00:00'),
('Turma C', 103, '2024-02-22 14:00:00'),
('Turma D', 104, '2024-02-23 08:00:00'),
('Turma E', 105, '2024-02-23 10:00:00'),
('Turma F', 30, '2025-02-23 11:00:00');

-- Inserções na tabela Matricula
INSERT INTO Matricula (id_aluno, id_turma, nota_1, nota_2, nota_3, nota_final, qnt_faltas) VALUES 
(1, 1, 7.5, 8.0, 7.0, 7.5, 2),
(2, 2, 8.0, 8.5, 9.0, 8.5, 1),
(3, 3, 6.5, 7.0, 8.0, 7.0, 3),
(4, 4, 9.0, 9.5, 9.0, 9.0, 0),
(5, 5, 7.0, 6.5, 7.5, 7.0, 2),
(6, 6, 10, 10, 10, 10, 4);

INSERT INTO Aluno (nome, curso, nivel, idade) VALUES 
('Pedron', 'NA', 1, 27);

SELECT * FROM Aluno INNER JOIN Matricula ON Aluno.id=Matricula.id_aluno
INNER JOIN Turma ON Turma.id=Matricula.id_turma;

-- 2.1)
SELECT Aluno.nome AS Alunos FROM Aluno INNER JOIN Matricula ON Aluno.id=Matricula.id_aluno
JOIN Turma ON Turma.id=Matricula.id_turma;

-- 2.2)
SELECT Aluno.nome As Alunos, Matricula.id_aluno AS 'ID Aluno', Matricula.id AS 'ID Matricula' FROM Aluno INNER JOIN Matricula ON Aluno.id=Matricula.id_aluno
JOIN Turma ON Turma.id=Matricula.id_turma;

-- 2.3)
SELECT Aluno.nome AS 'Alunos sem matricula' FROM Aluno LEFT JOIN Matricula ON Aluno.id=Matricula.id_aluno
LEFT JOIN Turma ON Turma.id=Matricula.id_turma
WHERE matricula.id_aluno IS NULL;

-- 2.4)
SELECT Matricula.id_aluno AS 'IDs Alunos' FROM Aluno INNER JOIN Matricula ON Aluno.id=Matricula.id_aluno
INNER JOIN Turma ON Turma.id=Matricula.id_turma
WHERE Turma.sala = 30;

-- 2.5)
SELECT Turma.horario AS 'Horario do aluno MEDINHO' FROM turma INNER JOIN matricula ON
matricula.id_turma=turma.id
INNER JOIN aluno ON matricula.id_aluno=aluno.id
WHERE aluno.nome LIKE '%MEDINHO%';

-- 2.6)
SELECT aluno.nome AS 'Nome dos alunos da sala 30' FROM Aluno INNER JOIN Matricula ON Aluno.id=Matricula.id_aluno
INNER JOIN Turma ON Turma.id=Matricula.id_turma
WHERE Turma.sala = 30;

-- 2.7)
SELECT aluno.nome AS 'Nome dos não-alunos da sala 30' FROM Aluno INNER JOIN Matricula ON Aluno.id=Matricula.id_aluno
INNER JOIN Turma ON Turma.id=Matricula.id_turma
WHERE Turma.sala != 30;

-- 2.8)
SELECT turma.nome AS 'Nome das turmas dos alunos com nota maior que 8' FROM Aluno INNER JOIN Matricula ON Aluno.id=Matricula.id_aluno
INNER JOIN Turma ON Turma.id=Matricula.id_turma
WHERE matricula.nota_final > 8;




-- EXERCICIO 3 A PARTIR DAQUI

CREATE DATABASE IF NOT EXISTS Exercicio3;

CREATE TABLE IF NOT EXISTS Gerente(
id INT NOT NULL AUTO_INCREMENT KEY UNIQUE,
nome VARCHAR(100),
aniversario date,
endereco VARCHAR(100),
sexo enum('Homem', 'Mulher'),
salario DECIMAL(5,2) -- Oopsi, agora o salario dos gerentes são menos que mil ;p
);

CREATE TABLE IF NOT EXISTS Departamento(
id INT NOT NULL AUTO_INCREMENT KEY UNIQUE,
nome VARCHAR(100),
idGerente INT,
horario time,

FOREIGN KEY(idGerente) REFERENCES Gerente(id) 
);

CREATE TABLE IF NOT EXISTS Empregado(
id INT NOT NULL AUTO_INCREMENT KEY UNIQUE,
nome VARCHAR(100),
aniversario date,
endereco VARCHAR(100),
sexo enum('Homem', 'Mulher'),
salario DECIMAL(5,2),
idDepartamento INT,

FOREIGN KEY(idDepartamento) REFERENCES Departamento(id)
);

CREATE TABLE IF NOT EXISTS Localização(
localizacao VARCHAR(100),
idDepartamento INT,

FOREIGN KEY(idDepartamento) REFERENCES Departamento(id)
);

CREATE TABLE IF NOT EXISTS Projeto(
id INT NOT NULL AUTO_INCREMENT KEY UNIQUE,
nome VARCHAR(100),
idDepartamento INT,

FOREIGN KEY(idDepartamento) REFERENCES Departamento(id)
);

CREATE TABLE IF NOT EXISTS TRABALHA_EM(
idEmpregado INT,
idProjeto INT,
horas time,

FOREIGN KEY(idEmpregado) REFERENCES Empregado(id),
FOREIGN KEY(idProjeto) REFERENCES Projeto(id)
);

CREATE TABLE IF NOT EXISTS Dependente(
id INT NOT NULL AUTO_INCREMENT KEY UNIQUE,
idEmpregado INT,
nome VARCHAR(100),
sexo enum('Homem', 'Mulher'),
aniversario date,
parentesco VARCHAR(100),

FOREIGN KEY(idEmpregado) REFERENCES Empregado(id)
);

-- EMPREGADO (idemp, nomeemp, aniversario, enderecoemp, sexoemp,salarioemp, nrdep)
-- DEPARTAMENTO (nrdep, nomedep, idgerente, horario)
-- LOCALIZAÇÃO (localizacao , nrdep)
-- TRABALHA_EM (idemp, nrprojeto, horas)
-- PROJETO (nrproj, nomeproj, nrdep)
-- DEPENDENTE (iddepende, idemp, nomedep, sexodep, aniversariodep,parentesco)

-- Inserts para a tabela Gerente
INSERT INTO Gerente (nome, aniversario, endereco, sexo, salario) VALUES 
('João Silva', '1980-05-15', 'Rua das Flores, 123', 'Homem', 500.00),
('Maria Oliveira', '1975-10-20', 'Avenida Principal, 456', 'Mulher', 550.00),
('Carlos Santos', '1982-03-08', 'Rua dos Girassóis, 789', 'Homem', 520.00),
('Ana Costa', '1978-07-25', 'Travessa das Palmeiras, 321', 'Mulher', 530.00),
('Pedro Almeida', '1984-12-12', 'Alameda dos Pinheiros, 654', 'Homem', 500.00),
('Sofia Rodrigues', '1987-09-30', 'Praça Central, 987', 'Mulher', 500.00);

-- Inserts para a tabela Departamento
INSERT INTO Departamento (nome, idGerente, horario) VALUES 
('Vendas', 1, '08:00:00'),
('Compras', 2, '09:00:00'),
('Financeiro', 3, '08:30:00'),
('RH', 4, '10:00:00'),
('TI', 5, '07:00:00'),
('Produção', 6, '08:00:00');

-- Inserts para a tabela Empregado
INSERT INTO Empregado (nome, aniversario, endereco, sexo, salario, idDepartamento) VALUES 
('Fernanda Lima', '1990-02-18', 'Rua dos Coqueiros, 147', 'Mulher', 300.00, 1),
('Ricardo Santos', '1988-07-10', 'Avenida dos Ipês, 258', 'Homem', 320.00, 2),
('Juliana Pereira', '1993-11-22', 'Travessa das Acácias, 369', 'Mulher', 310.00, 3),
('Luiz Oliveira João', '1985-09-05', 'Alameda das Mangueiras, 741', 'Homem', 330.00, 4),
('Mariana Costa', '1992-04-30', 'Praça das Palmeiras, 852', 'Mulher', 310.00, 5),
('João Almeida', '1987-12-25', 'Avenida das Rosas, 963', 'Homem', 320.00, 6);

-- Inserts para a tabela Localização
INSERT INTO Localização (localizacao, idDepartamento) VALUES 
('São Paulo', 1),
('Rio de Janeiro', 2),
('Brasília', 3),
('Salvador', 4),
('Curitiba', 5),
('Fortaleza', 6);

-- Inserts para a tabela Projeto
INSERT INTO Projeto (nome, idDepartamento) VALUES 
('Projeto A', 1),
('Projeto B', 2),
('Projeto C', 3),
('Projeto D', 4),
('Projeto E', 5),
('Projeto F', 6);

-- Inserts para a tabela TRABALHA_EM
INSERT INTO TRABALHA_EM (idEmpregado, idProjeto, horas) VALUES 
(1, 1, '40:00:00'),
(2, 2, '42:30:00'),
(3, 3, '38:45:00'),
(4, 4, '41:15:00'),
(5, 5, '39:20:00'),
(6, 6, '37:55:00');

-- Inserts para a tabela Dependente
INSERT INTO Dependente (idEmpregado, nome, sexo, aniversario, parentesco) VALUES 
(1, 'Maria Lima', 'Mulher', '2010-08-05', 'Filha'),
(2, 'Pedro Santos', 'Homem', '2012-03-10', 'Filho'),
(3, 'Camila Pereira', 'Mulher', '2008-11-15', 'Filha'),
(4, 'Lucas Oliveira', 'Homem', '2015-07-20', 'Filho'),
-- (5, 'Ana Costa', 'Mulher', '2013-04-25', 'Filha'),
(6, 'Mateus Almeida', 'Homem', '2011-12-30', 'Filho');

SELECT * FROM Dependente;

-- 3.1) Recuperar o nome e o endereço de todos os empregados que trabalham para o Departamento de Compras.
SELECT Empregado.nome AS 'Empregados', Empregado.endereco AS 'Endereco' FROM Empregado INNER JOIN Departamento ON Empregado.idDepartamento=Departamento.id
INNER JOIN Gerente ON Departamento.idGerente=Gerente.id;

-- 3.2) Para cada projeto localizado no ‘Rio de Janeiro’, exibir o número do projeto, o número do departamento que o controla e a identidade de seu gerente, seu endereço e a data de seu aniversário.
SELECT Projeto.id AS 'ID do projeto', Departamento.id AS 'ID do departamento', Gerente.nome AS 'Nome do gerente', Gerente.sexo AS 'Sexo', Gerente.aniversario AS 'Aniversário/Data de nascimento', Gerente.endereco AS 'Endereço' FROM Empregado INNER JOIN Departamento ON Empregado.idDepartamento=Departamento.id
INNER JOIN Gerente ON Departamento.idGerente=Gerente.id
INNER JOIN Localização ON Localização.idDepartamento=Departamento.id
INNER JOIN Projeto ON Projeto.idDepartamento=Departamento.id
INNER JOIN TRABALHA_EM ON TRABALHA_EM.idEmpregado=Empregado.id AND TRABALHA_EM.idProjeto=Projeto.id
WHERE Localização.localizacao='Rio De Janeiro';

-- 3.3) Descobrir os nomes dos projetos onde trabalham empregados com o nome ‘João’.
SELECT Projeto.nome AS 'Nome dos projetos' FROM Empregado INNER JOIN Departamento ON Empregado.idDepartamento=Departamento.id
INNER JOIN Gerente ON Departamento.idGerente=Gerente.id
INNER JOIN Localização ON Localização.idDepartamento=Departamento.id
INNER JOIN Projeto ON Projeto.idDepartamento=Departamento.id
INNER JOIN TRABALHA_EM ON TRABALHA_EM.idEmpregado=Empregado.id AND TRABALHA_EM.idProjeto=Projeto.id
WHERE Empregado.nome LIKE '%João%';

-- 3.4) Listar os nomes dos empregados que não têm dependentes.
SELECT Empregado.nome AS 'Empregados sem dependentes' FROM Empregado LEFT JOIN Departamento ON Empregado.idDepartamento=Departamento.id
LEFT JOIN Gerente ON Departamento.idGerente=Gerente.id
LEFT JOIN Localização ON Localização.idDepartamento=Departamento.id
LEFT JOIN Projeto ON Projeto.idDepartamento=Departamento.id
LEFT JOIN TRABALHA_EM ON TRABALHA_EM.idEmpregado=Empregado.id AND TRABALHA_EM.idProjeto=Projeto.id
LEFT JOIN Dependente ON Dependente.idEmpregado=Empregado.id
WHERE Dependente.idEmpregado IS NULL;

-- Exercicio 4 a partir daqui

CREATE DATABASE exercicio4;

CREATE TABLE Disciplina(
Id INT UNIQUE PRIMARY KEY,
nomeDisciplina VARCHAR(100)
);

CREATE TABLE Turma(
Id INT UNIQUE PRIMARY KEY,
IdDisciplina INT,
siglaTurma VARCHAR(10),
anoSemestre VARCHAR(20),

FOREIGN KEY (IdDisciplina) REFERENCES Disciplina(Id)
);

CREATE TABLE Aluno(
Id INT UNIQUE PRIMARY KEY,
IdTurma INT,
nomeAluno VARCHAR(100),
FOREIGN KEY (IdTurma) REFERENCES Turma(Id)
);

CREATE TABLE Prova(
Id INT UNIQUE PRIMARY KEY,
IdTurma INT,
IdAluno INT,
numeroProva INT,
dataProva DATE,
notaAluno DECIMAL(5, 2),
FOREIGN KEY (IdTurma) REFERENCES Turma(Id),
FOREIGN KEY (IdAluno) REFERENCES Aluno(Id)
);

-- Exercicio 5 a partir daqui

CREATE DATABASE exercicio5;

CREATE TABLE Professores(
ID INT AUTO_INCREMENT PRIMARY KEY,
CPF VARCHAR(14),
Nome VARCHAR(100),
DataNascimento DATE,
Titulacao VARCHAR(100),
Telefone VARCHAR(50)
);

CREATE TABLE Cursos(
ID INT AUTO_INCREMENT PRIMARY KEY,
TipoCurso VARCHAR(100)
);

CREATE TABLE Turmas(
ID INT AUTO_INCREMENT PRIMARY KEY,
QuantidadeAlunos INT,
HorarioAula TIME,
DataInicial DATE,
DataFinal DATE,
TipoCurso INT,
IdProfessor VARCHAR(11),
FOREIGN KEY (TipoCurso) REFERENCES Cursos(ID),
FOREIGN KEY (IdProfessor) REFERENCES Professores(ID)
);

CREATE TABLE Alunos(
Matricula INT PRIMARY KEY,
DataMatricula DATE,
Nome VARCHAR(100),
Endereco VARCHAR(200),
Telefone VARCHAR(15),
DataNascimento DATE,
Altura DECIMAL(5,2),
Peso DECIMAL(5,2),
TurmaMonitor INT,
FOREIGN KEY (TurmaMonitor) REFERENCES Turmas(ID)
);

CREATE TABLE Matriculas(
AlunoMatricula INT,
TurmaID INT,
Ausencias INT,
PRIMARY KEY (AlunoMatricula, TurmaID),
FOREIGN KEY (AlunoMatricula) REFERENCES Alunos(Matricula),
FOREIGN KEY (TurmaID) REFERENCES Turmas(ID)
);

-- Exercicio 6 a partir daqui

CREATE DATABASE exercicio6;

CREATE TABLE IF NOT EXISTS Professores(
-- ID INT AUTO_INCREMENT PRIMARY KEY,
CPF VARCHAR(14) UNIQUE NOT NULL PRIMARY KEY,
Nome VARCHAR(100) NOT NULL,
DataNascimento DATE NOT NULL,
Titulacao VARCHAR(100) NOT NULL,
Telefone VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Cursos(
ID INT AUTO_INCREMENT PRIMARY KEY NOT NULL UNIQUE,
TipoCurso VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Turmas(
ID INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
QuantidadeAlunos INT NOT NULL,
HorarioAula TIME NOT NULL,
DuracaoAula TIME NOT NULL,
DataInicial DATE NOT NULL,
DataFinal DATE NOT NULL,
TipoCurso INT NOT NULL,
ProfessorCPF VARCHAR(14) NOT NULL,
FOREIGN KEY (TipoCurso) REFERENCES Cursos(ID),
FOREIGN KEY (ProfessorCPF) REFERENCES Professores(CPF)
);

CREATE TABLE IF NOT EXISTS Alunos(
Matricula INT PRIMARY KEY UNIQUE NOT NULL,
DataMatricula DATE NOT NULL,
Nome VARCHAR(100) NOT NULL,
Endereco VARCHAR(200) NOT NULL,
Telefone VARCHAR(15) NOT NULL,
DataNascimento DATE NOT NULL,
Altura DECIMAL(5,2) NOT NULL,
Peso DECIMAL(5,2) NOT NULL,
TurmaMonitor INT,
FOREIGN KEY (TurmaMonitor) REFERENCES Turmas(ID)
);

CREATE TABLE IF NOT EXISTS Matriculas(
AlunoMatricula INT NOT NULL,
TurmaID INT NOT NULL,
Ausencias INT NOT NULL,
PRIMARY KEY (AlunoMatricula, TurmaID),
FOREIGN KEY (AlunoMatricula) REFERENCES Alunos(Matricula),
FOREIGN KEY (TurmaID) REFERENCES Turmas(ID)
);

-- Inserções para a tabela Professores
INSERT INTO Professores (CPF, Nome, DataNascimento, Titulacao, Telefone) VALUES 
('123.456.789-10', 'João Silva', '1980-05-15', 'Doutorado em Engenharia', '(11) 98765-4321'),
('987.654.321-10', 'Maria Souza', '1975-10-20', 'Mestrado em Biologia', '(11) 91234-5678');

-- Inserções para a tabela Cursos
INSERT INTO Cursos (TipoCurso) VALUES 
('Matemática'),
('Biologia');

-- Inserções para a tabela Turmas
INSERT INTO Turmas (QuantidadeAlunos, HorarioAula, DuracaoAula, DataInicial, DataFinal, TipoCurso, ProfessorCPF) VALUES 
(20, '08:00:00', '02:00:00', '2024-04-01', '2024-07-01', 1, '123.456.789-10'),
(15, '14:00:00', '01:30:00', '2024-04-15', '2024-06-15', 2, '987.654.321-10');

-- Inserções para a tabela Alunos
INSERT INTO Alunos (Matricula, DataMatricula, Nome, Endereco, Telefone, DataNascimento, Altura, Peso, TurmaMonitor) VALUES 
(1001, '2024-03-01', 'Pedro Oliveira', 'Rua A, 123', '(11) 99999-9999', '2000-01-10', 1.75, 70.5, NULL),
(1002, '2024-03-05', 'Ana Santos', 'Av. B, 456', '(11) 88888-8888', '2001-05-20', 1.60, 55.0, 1);

-- Inserções para a tabela Matriculas
INSERT INTO Matriculas (AlunoMatricula, TurmaID, Ausencias) VALUES 
(1001, 1, 2),
(1002, 2, 0);

-- 2.1)
SELECT * FROM Alunos;

-- 2.2)
SELECT A.*, T.ID as TurmaID FROM Alunos A
JOIN Matriculas M ON A.Matricula = M.AlunoMatricula
JOIN Turmas T ON M.TurmaID = T.ID;

-- 2.3)
SELECT A.*, M.Ausencias FROM Alunos A
JOIN Matriculas M ON A.Matricula = M.AlunoMatricula
WHERE M.Ausencias = 0;

-- 2.4)
SELECT P.*, COUNT(T.ID) as QuantidadeTurmas FROM Professores P
JOIN Turmas T ON P.CPF = T.ProfessorCPF
GROUP BY P.CPF;

-- 2.5)
SELECT P.Nome as NomeProfessor, P.Telefone as TelefoneProfessor, T.ID as TurmaID, T.DataInicial, T.DataFinal, T.HorarioAula, C.TipoCurso, A.Nome as NomeAluno
FROM Professores P
JOIN Turmas T ON P.CPF = T.ProfessorCPF
JOIN Cursos C ON T.TipoCurso = C.ID
JOIN Matriculas M ON T.ID = M.TurmaID
JOIN Alunos A ON M.AlunoMatricula = A.Matricula
ORDER BY P.Nome, T.ID, A.Nome;

-- 2.6) 

-- 2.7) 

-- 2.8) Listar a quantidade média de alunos por curso
SELECT C.TipoCurso, AVG(T.QuantidadeAlunos) as MediaAlunos
FROM Cursos C
JOIN Turmas T ON C.ID = T.TipoCurso
GROUP BY C.ID;

-- 3.1) Alterar o nome de todos os professores para maiúsculo


-- 3.2) Colocar o nome de todos os alunos que estão na turma com o maior número de alunos 
-- em maiúsculo
UPDATE Alunos
SET Nome = UPPER(Nome)
WHERE Matricula IN (
    SELECT AlunoMatricula FROM Matriculas
    WHERE TurmaID = (
        SELECT ID FROM Turmas
        ORDER BY QuantidadeAlunos DESC
        LIMIT 1
    )
);

-- 4) Excluir as ausências dos alunos nas turmas que estes são monitores
UPDATE Matriculas
SET Ausencias = 0
WHERE AlunoMatricula IN (
    SELECT Matricula FROM Alunos
    WHERE TurmaMonitor IS NOT NULL
);







