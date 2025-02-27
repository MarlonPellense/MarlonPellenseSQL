-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27/02/2025 às 21:05
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sa_lojaderoupa`
--
CREATE DATABASE IF NOT EXISTS `sa_lojaderoupa` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sa_lojaderoupa`;

DELIMITER $$
--
-- Procedimentos
--
DROP PROCEDURE IF EXISTS `mySp_buscaClienteVenda`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_buscaClienteVenda` (`v_id_cliente` INT)   BEGIN
SELECT cliente.id_cliente AS 'ID Cliente', cliente.nome AS 'Nome', venda.id_venda AS 'ID Venda', produto.descricao AS 'Produto' FROM venda INNER JOIN cliente ON venda.cliente_id_cliente = cliente.id_cliente INNER JOIN itemvenda ON venda.itemVenda_id_itemVenda = itemvenda.id_itemVenda INNER JOIN produto ON itemvenda.produto_id_produto = produto.id_produto WHERE v_id_cliente = cliente.id_cliente;
END$$

DROP PROCEDURE IF EXISTS `mySp_buscaFuncionarioCliente`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_buscaFuncionarioCliente` (`v_id_cliente` INT, `v_id_funcionario` INT)   BEGIN
SELECT funcionario.id_funcionario AS 'ID Funcionario', funcionario.nome AS 'Nome Funcionario', cliente.id_cliente AS 'ID Cliente', cliente.nome AS 'Nome Cliente', venda.id_venda AS 'ID Venda', produto.descricao AS 'Produto' FROM venda INNER JOIN funcionario ON venda.funcionario_id_funcionario = funcionario.id_funcionario INNER JOIN itemvenda ON venda.itemVenda_id_itemVenda = itemvenda.id_itemVenda INNER JOIN produto ON itemvenda.produto_id_produto = produto.id_produto INNER JOIN cliente ON venda.cliente_id_cliente = cliente.id_cliente WHERE v_id_funcionario = funcionario.id_funcionario AND v_id_cliente = cliente.id_cliente;
END$$

DROP PROCEDURE IF EXISTS `mySp_buscaFuncionarioVenda`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_buscaFuncionarioVenda` (`v_id_funcionario` INT)   BEGIN
SELECT funcionario.id_funcionario AS 'ID Funcionario', funcionario.nome AS 'Nome', venda.id_venda AS 'ID Venda', produto.descricao AS 'Produto' FROM venda INNER JOIN funcionario ON venda.funcionario_id_funcionario = funcionario.id_funcionario INNER JOIN itemvenda ON venda.itemVenda_id_itemVenda = itemvenda.id_itemVenda INNER JOIN produto ON itemvenda.produto_id_produto = produto.id_produto WHERE v_id_funcionario = funcionario.id_funcionario;
END$$

DROP PROCEDURE IF EXISTS `mySp_clienteDelete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_clienteDelete` (`v_id` INT)   BEGIN
    IF (v_id > 0) THEN
        DELETE FROM cliente 
        WHERE id_cliente = v_id;
    ELSE
        SELECT 'ID não informado!' AS Msg;
    END IF;
END$$

DROP PROCEDURE IF EXISTS `mySp_clienteInsert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_clienteInsert` (`v_nome` VARCHAR(45), `v_nasc` VARCHAR(10), `v_sexo` VARCHAR(9), `v_endereco` VARCHAR(45), `v_telefone` VARCHAR(15))   BEGIN
    IF (v_nome != '' and v_nasc != '') THEN
        INSERT INTO cliente(nome, dt_nasc, sexo, endereco, telefone) VALUES
        (v_nome, v_nasc, v_sexo, v_endereco, v_telefone);
    ELSE
        SELECT 'Valores não informados!' AS Msg;
    END IF;
END$$

DROP PROCEDURE IF EXISTS `mySp_clienteUpdate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_clienteUpdate` (`v_id` INT, `v_nome` VARCHAR(45), `v_nasc` VARCHAR(10), `v_sexo` VARCHAR(9), `v_endereco` VARCHAR(45), `v_telefone` VARCHAR(15))   begin
if v_id > 0 then
update cliente set nome = v_nome, dt_nasc = v_nasc, sexo = v_sexo, endereco = v_endereco, telefone = v_telefone where v_id = id_cliente;
else select 'ID não válido!' as Msg;
end if;
END$$

DROP PROCEDURE IF EXISTS `mySp_funcionarioDelete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_funcionarioDelete` (`v_id` INT)   BEGIN
    IF (v_id > 0) THEN
        DELETE FROM funcionario 
        WHERE id_funcionario = v_id;
    ELSE
        SELECT 'ID não informado!' AS Msg;
    END IF;
END$$

DROP PROCEDURE IF EXISTS `mySp_funcionarioInsert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_funcionarioInsert` (`v_nome` VARCHAR(45), `v_admiss` VARCHAR(10), `v_cpf` VARCHAR(13), `v_salario` DECIMAL(10,2), `v_cargo` VARCHAR(45))   BEGIN
    IF (v_nome != '' and v_admiss != '') THEN
        INSERT INTO funcionario(nome, dt_admissao, cpf, salario, cargo) VALUES
        (v_nome, v_admiss, v_cpf, v_salario, v_cargo);
    ELSE
        SELECT 'Valores não informados!' AS Msg;
    END IF;
END$$

DROP PROCEDURE IF EXISTS `mySp_funcionarioUpdate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_funcionarioUpdate` (`v_id` INT, `v_nome` VARCHAR(45), `v_admiss` VARCHAR(11), `v_cpf` VARCHAR(13), `v_salario` DECIMAL(10,2), `v_cargo` VARCHAR(45))   begin
if v_id > 0 then
update cliente set nome = v_nome, dt_admissao = v_admiss, cpf = v_cpf, salario = v_salario, cargo = v_cargo where v_id = id_funcionario;
else select 'ID não válido!' as Msg;
end if;
END$$

DROP PROCEDURE IF EXISTS `mySp_vendaDelete`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_vendaDelete` (`v_id` INT)   BEGIN
    IF (v_id > 0) THEN
        DELETE FROM venda 
        WHERE id_venda = v_id;
    ELSE
        SELECT 'ID não informado!' AS Msg;
    END IF;
END$$

DROP PROCEDURE IF EXISTS `mySp_vendaInsert`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_vendaInsert` (`v_id_cliente` INT, `v_id_funcionario` INT, `v_id_itemVenda` INT)   BEGIN
    IF (v_id_cliente != '' and v_id_funcionario != '') THEN
        INSERT INTO venda(id_venda, cliente_id_cliente, funcionario_id_funcionario, itemVenda_id_itemVenda) VALUES
        (v_id_cliente, v_id_funcionario, v_id_itemVenda);
    ELSE
        SELECT 'Valores não informados!' AS Msg;
    END IF;
END$$

DROP PROCEDURE IF EXISTS `mySp_vendaUpdate`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mySp_vendaUpdate` (`v_id_venda` INT, `v_id_cliente` INT, `v_id_func` INT, `v_id_itemVenda` INT)   begin
if v_id_venda > 0 then
update venda set cliente_id_cliente = v_id_cliente, funcionario_id_funcionario = v_id_func, itemVenda_id_itemVenda = v_id_itemVenda where v_id_venda = id_venda;
else select 'ID não válido!' as Msg;
end IF;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `dt_nasc` varchar(10) NOT NULL,
  `sexo` varchar(9) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  `telefone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome`, `dt_nasc`, `sexo`, `endereco`, `telefone`) VALUES
(2, 'Ana Souza', '1985-06-15', 'F', 'Rua das Flores, 123', '(11) 98765-4321'),
(3, 'Carlos Silva', '1990-09-23', 'M', 'Avenida Paulista, 456', '(11) 99876-5432'),
(4, 'Maria Oliveira', '1995-12-05', 'F', 'Rua 25 de Março, 789', '(11) 94567-8910'),
(5, 'João Santos', '1982-03-12', 'M', 'Rua dos Três Irmãos, 321', '(21) 99845-1122'),
(6, 'Fernanda Lima', '2000-07-18', 'F', 'Rua das Acácias, 101', '(21) 97765-4433'),
(7, 'Lucas Almeida', '1992-11-09', 'M', 'Avenida Brasil, 2020', '(31) 91234-5678'),
(8, 'Juliana Costa', '1987-04-30', 'F', 'Rua da Liberdade, 456', '(31) 92345-6789'),
(9, 'Roberto Martins', '1993-10-14', 'M', 'Rua Rio de Janeiro, 789', '(41) 93456-7890'),
(10, 'Patrícia Rocha', '1988-05-25', 'F', 'Rua das Palmeiras, 111', '(41) 96345-1234'),
(11, 'Marcos Pereira', '1991-02-28', 'M', 'Avenida do Contorno, 456', '(51) 97654-3210'),
(12, 'Beatriz Fernandes', '1997-08-12', 'F', 'Rua dos Jasmins, 321', '(51) 98876-5432'),
(13, 'Gabriel Rocha', '1989-06-10', 'M', 'Rua 15 de Novembro, 202', '(61) 96123-4567'),
(14, 'Larissa Almeida', '1994-09-02', 'F', 'Rua do Sol, 987', '(61) 98854-3210'),
(15, 'Fernando Costa', '1983-12-21', 'M', 'Rua do Comércio, 654', '(71) 97654-8765'),
(16, 'Sandra Souza', '1985-11-11', 'F', 'Avenida do Parque, 333', '(71) 99234-1234'),
(17, 'Vinícius Lima', '1996-04-06', 'M', 'Rua São João, 234', '(81) 97543-6789'),
(18, 'Mariana Silva', '1992-01-13', 'F', 'Rua dos Sabiás, 456', '(81) 99123-4567'),
(19, 'Ricardo Barbosa', '1986-07-19', 'M', 'Rua do Mercado, 111', '(85) 98876-5432'),
(20, 'Tatiane Ferreira', '1993-02-23', 'F', 'Rua do Limoeiro, 789', '(85) 99123-4567'),
(21, 'Robson Dias', '1980-10-10', 'M', 'Avenida Presidente, 321', '(41) 92876-5432'),
(22, 'Eliane Mendes', '1999-05-17', 'F', 'Rua Maria Clara, 654', '(47) 99876-4321'),
(23, 'Rafael Santos', '1995-01-04', 'M', 'Avenida Central, 123', '(47) 96543-8765'),
(24, 'Letícia Nascimento', '1991-08-30', 'F', 'Rua do Horizonte, 987', '(62) 97456-1234'),
(25, 'Joana Pinto', '1984-03-22', 'F', 'Rua da Serra, 100', '(62) 98123-4567'),
(26, 'Thiago Rodrigues', '1987-11-18', 'M', 'Avenida dos Girassóis, 222', '(71) 98765-4321'),
(27, 'Fernanda Almeida', '1990-06-02', 'F', 'Rua das Amendoeiras, 333', '(71) 97643-2109'),
(28, 'Fábio Oliveira', '1985-09-30', 'M', 'Rua João Pessoa, 555', '(81) 95342-6789'),
(29, 'Carla Souza', '1994-04-25', 'F', 'Avenida São Paulo, 777', '(81) 93210-6543'),
(30, 'Paulo Costa', '1992-02-14', 'M', 'Rua do Lago, 456', '(11) 92345-6789'),
(31, 'Cláudia Martins', '1986-07-08', 'F', 'Avenida Copacabana, 123', '(11) 98765-8765'),
(32, 'Eduardo Pinto', '1981-10-01', 'M', 'Rua Tiradentes, 234', '(31) 93765-1234'),
(33, 'Sílvia Oliveira', '1989-11-14', 'F', 'Avenida dos Andes, 555', '(31) 92345-5678'),
(34, 'Gilberto Ferreira', '1990-03-21', 'M', 'Rua das Margaridas, 777', '(41) 95321-4321'),
(35, 'Raquel Costa', '1997-02-16', 'F', 'Avenida do Rio, 111', '(41) 92034-8765'),
(36, 'Vinícius Pereira', '1998-09-11', 'M', 'Rua São Cristóvão, 345', '(51) 98673-2345');

-- --------------------------------------------------------

--
-- Estrutura para tabela `estoque`
--

DROP TABLE IF EXISTS `estoque`;
CREATE TABLE `estoque` (
  `produto_id_produto` int(11) NOT NULL,
  `fornecedor_id_fornecedor` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `data_entrada` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
CREATE TABLE `fornecedor` (
  `id_fornecedor` int(11) NOT NULL,
  `cnpj` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `fornecedor`
--

INSERT INTO `fornecedor` (`id_fornecedor`, `cnpj`, `telefone`, `marca`) VALUES
(1, '12.345.678/0001-99', '(11) 98765-4321', 'Nike'),
(2, '98.765.432/0001-88', '(21) 12345-6789', 'Adidas'),
(3, '56.789.012/0001-77', '(31) 99876-5432', 'Puma'),
(4, '34.567.890/0001-66', '(41) 45678-1234', 'Reebok'),
(5, '21.234.567/0001-55', '(51) 56789-4321', 'Under Armour'),
(6, '34.678.901/0001-44', '(61) 98765-9876', 'Columbia'),
(7, '78.345.678/0001-33', '(11) 23456-7890', 'New Balance'),
(8, '12.987.654/0001-22', '(21) 87654-3210', 'Vans'),
(9, '54.123.456/0001-11', '(41) 11223-4455', 'Levi\'s'),
(10, '65.432.109/0001-00', '(31) 99877-6655', 'Tommy Hilfiger'),
(11, '23.456.789/0001-99', '(61) 11322-5544', 'Calvin Klein'),
(12, '87.654.321/0001-88', '(71) 44332-2211', 'Fila'),
(13, '65.678.901/0001-77', '(81) 33555-6677', 'Lacoste'),
(14, '32.567.890/0001-66', '(51) 65444-3333', 'H&M'),
(15, '14.345.678/0001-55', '(43) 22233-4455', 'Zara'),
(16, '87.321.654/0001-44', '(62) 99888-7766', 'Burberry'),
(17, '23.765.432/0001-33', '(11) 54321-9876', 'Armani'),
(18, '56.987.654/0001-22', '(21) 66432-1234', 'Diesel'),
(19, '43.456.789/0001-11', '(31) 77899-9988', 'Gucci'),
(20, '65.123.987/0001-00', '(41) 88977-1122', 'Prada'),
(21, '21.234.987/0001-99', '(51) 77222-3344', 'Ralph Lauren'),
(22, '98.765.432/0001-77', '(61) 33333-4444', 'Hollister'),
(23, '34.123.876/0001-66', '(71) 11122-3344', 'Abercrombie & Fitch'),
(24, '12.345.890/0001-55', '(81) 76543-2112', 'Superdry'),
(25, '76.543.210/0001-44', '(51) 12233-4455', 'Tommy Jeans'),
(26, '98.321.654/0001-33', '(62) 12345-6789', 'Forever 21'),
(27, '23.456.890/0001-22', '(11) 99888-5544', 'Mango'),
(28, '65.765.432/0001-11', '(21) 88765-6677', 'Bershka'),
(29, '21.432.987/0001-00', '(41) 66554-7766', 'Pull&Bear'),
(30, '54.321.098/0001-99', '(51) 55533-2211', 'Stradivarius');

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE `funcionario` (
  `id_funcionario` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `dt_admissao` varchar(11) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `cargo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `funcionario`
--

INSERT INTO `funcionario` (`id_funcionario`, `nome`, `dt_admissao`, `cpf`, `salario`, `cargo`) VALUES
(1, 'André Moreira', '2020-06-15', '123.456.789-00', 2500.00, 'Vendedora'),
(2, 'Bruna Costa', '2019-09-23', '987.654.321-00', 3500.00, 'Gerente'),
(3, 'Cláudio Rocha', '2021-12-05', '456.123.789-01', 2000.00, 'Caixa'),
(4, 'Débora Santos', '2018-03-12', '321.654.987-00', 4000.00, 'Supervisor'),
(5, 'Evelyn Oliveira', '2020-07-18', '159.753.486-22', 2200.00, 'Vendedora'),
(6, 'Felipe Almeida', '2020-11-09', '753.159.486-33', 3000.00, 'Caixa'),
(7, 'Gabriela Lima', '2020-11-09', '753.159.486-44', 2700.00, 'Vendedora'),
(8, 'Heitor Martins', '2017-04-30', '159.753.852-44', 5000.00, 'Gerente'),
(9, 'Isabela Pereira', '2020-05-25', '741.852.963-66', 2300.00, 'Vendedora'),
(10, 'Jorge Silva', '2021-02-28', '963.741.852-77', 3200.00, 'Caixa'),
(11, 'Karen Barbosa', '2022-08-12', '852.963.741-88', 2500.00, 'Vendedora'),
(12, 'Leonardo Costa', '2019-06-10', '654.987.123-99', 3500.00, 'Supervisor'),
(13, 'Mariana Silva', '2021-09-02', '741.963.852-00', 2800.00, 'Caixa'),
(14, 'Nicolas Rocha', '2016-12-21', '123.987.654-11', 5500.00, 'Gerente'),
(15, 'Olga Souza', '2017-11-11', '159.753.258-22', 2300.00, 'Vendedora'),
(16, 'Paula Lima', '2018-04-06', '987.654.321-33', 3000.00, 'Caixa'),
(17, 'Quiteria Fernandes', '2020-01-13', '741.852.963-44', 3500.00, 'Vendedora'),
(18, 'Rafael Souza', '2015-07-19', '258.147.963-55', 5000.00, 'Supervisor'),
(19, 'Sofia Almeida', '2021-02-23', '852.369.147-66', 2200.00, 'Caixa'),
(20, 'Thiago Costa', '2019-10-10', '741.852.963-77', 3700.00, 'Gerente'),
(21, 'Ursula Martins', '2020-05-17', '963.741.852-88', 2400.00, 'Vendedora'),
(22, 'Vinícius Pereira', '2017-01-04', '321.654.987-99', 3200.00, 'Caixa'),
(23, 'Wanderson Oliveira', '2019-08-30', '753.159.486-11', 2600.00, 'Vendedora'),
(24, 'Ximena Pinto', '2016-03-22', '963.852.741-22', 4200.00, 'Supervisor'),
(25, 'Yasmin Ferreira', '2020-11-18', '741.963.258-33', 3500.00, 'Caixa'),
(26, 'Zeca Oliveira', '2018-06-02', '159.753.258-44', 2200.00, 'Vendedora'),
(27, 'Aline Costa', '2021-09-30', '852.963.741-55', 3000.00, 'Caixa'),
(28, 'Bárbara Pinto', '2022-04-25', '654.987.321-66', 2700.00, 'Vendedora'),
(29, 'Cauã Almeida', '2020-02-14', '321.987.654-77', 3800.00, 'Supervisor'),
(30, 'Daniela Rocha', '2021-09-11', '159.753.258-33', 3100.00, 'Caixa'),
(31, 'Eduardo Silva', '2020-07-08', '963.741.852-44', 3500.00, 'Gerente'),
(32, 'Fabiana Lima', '2017-07-08', '963.741.852-77', 4200.00, 'Supervisor');

-- --------------------------------------------------------

--
-- Estrutura para tabela `itemvenda`
--

DROP TABLE IF EXISTS `itemvenda`;
CREATE TABLE `itemvenda` (
  `id_itemVenda` int(11) NOT NULL,
  `qntd_venda` int(11) NOT NULL,
  `produto_id_produto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL,
  `tamanho` varchar(45) NOT NULL,
  `preco` decimal(4,2) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda`
--

DROP TABLE IF EXISTS `venda`;
CREATE TABLE `venda` (
  `id_venda` int(11) NOT NULL,
  `cliente_id_cliente` int(11) NOT NULL,
  `funcionario_id_funcionario` int(11) NOT NULL,
  `itemVenda_id_itemVenda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices de tabela `estoque`
--
ALTER TABLE `estoque`
  ADD KEY `fk_estoque_produto1` (`produto_id_produto`),
  ADD KEY `fk_estoque_fornecedor1` (`fornecedor_id_fornecedor`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`id_fornecedor`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id_funcionario`);

--
-- Índices de tabela `itemvenda`
--
ALTER TABLE `itemvenda`
  ADD PRIMARY KEY (`id_itemVenda`),
  ADD KEY `fk_itemVenda_produto1` (`produto_id_produto`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`);

--
-- Índices de tabela `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`id_venda`),
  ADD KEY `fk_venda_cliente` (`cliente_id_cliente`),
  ADD KEY `fk_venda_funcionario1` (`funcionario_id_funcionario`),
  ADD KEY `fk_venda_itemVenda1` (`itemVenda_id_itemVenda`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `id_fornecedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id_funcionario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `venda`
--
ALTER TABLE `venda`
  MODIFY `id_venda` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `estoque`
--
ALTER TABLE `estoque`
  ADD CONSTRAINT `fk_estoque_fornecedor1` FOREIGN KEY (`fornecedor_id_fornecedor`) REFERENCES `fornecedor` (`id_fornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estoque_produto1` FOREIGN KEY (`produto_id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `itemvenda`
--
ALTER TABLE `itemvenda`
  ADD CONSTRAINT `fk_itemVenda_produto1` FOREIGN KEY (`produto_id_produto`) REFERENCES `produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_venda_cliente` FOREIGN KEY (`cliente_id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venda_funcionario1` FOREIGN KEY (`funcionario_id_funcionario`) REFERENCES `funcionario` (`id_funcionario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venda_itemVenda1` FOREIGN KEY (`itemVenda_id_itemVenda`) REFERENCES `itemvenda` (`id_itemVenda`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
