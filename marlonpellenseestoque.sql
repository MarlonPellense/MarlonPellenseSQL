-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Fev-2025 às 18:09
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `marlonpellenseestoque`
--
CREATE DATABASE IF NOT EXISTS `marlonpellenseestoque` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `marlonpellenseestoque`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `Cod_Cliente` int(11) NOT NULL COMMENT 'Campo responsável pelo código de identificação do cliente, Chave Primária.',
  `Nome_Cliente` varchar(50) NOT NULL COMMENT 'Campo responsável pelo nome do cliente.',
  `Endereco` varchar(50) NOT NULL COMMENT 'Campo responsável pelo endereço do cliente.',
  `Cidade` varchar(50) NOT NULL COMMENT 'Campo responsável pela cidade que o cliente habita.',
  `CEP` varchar(10) NOT NULL COMMENT 'Campo responsável pelo CEP do cliente.',
  `CNPJ` varchar(30) NOT NULL COMMENT 'Campo responsável pelo CNPJ do cliente.',
  `UF` char(2) NOT NULL COMMENT 'Campo responsável pelo UF do cliente.',
  `IE` int(10) NOT NULL COMMENT 'Campo responsável pelo IE do cliente.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`Cod_Cliente`, `Nome_Cliente`, `Endereco`, `Cidade`, `CEP`, `CNPJ`, `UF`, `IE`) VALUES
(20, 'Beth', 'Av Climério n. 45', 'São Paulo', '25679-300', '32485126/7326-08', 'SP', 9280),
(110, 'Jorge', 'Rua Caiapó 13', 'Curitiba', '30078-500', '14512764/9834-09', 'PR', 3485),
(130, 'Edmar', 'Rua da Prais 564', 'Salvador', '30079-300', '23463284/2349-04', 'BA', 7121),
(157, 'Paulo', 'Av. Moraes c/3', 'Londrina', '30127-580', '32848223/3242-06', 'PR', 1923),
(180, 'Livio', 'Av. Beira Mar n.1256', 'Florianópolis', '30077-500', '12736571/2347-04', 'SC', 7324),
(222, 'Lúcia', 'Rua Itabira 123 loja 09', 'Belo Horizonte', '22124-391', '28315213/9348-08', 'MG', 2985),
(234, 'José', 'Quadra 3 bl. 3 sl 1003', 'Brasilia', '22841-650', '21763576/1232-03', 'DF', 2931),
(260, 'Susana', 'Rua Lopes Mendes 12', 'Niterói', '30046-500', '21763571/2329-08', 'RJ', 2530),
(290, 'Renato', 'Rua Meireles n. 123 bl.2 sl.345', 'São Paulo', '30225-900', '13276571/1231-04', 'SP', 1820),
(390, 'Sebastião', 'Rua Olegário Maciel n. 230', 'Uberaba', '30438-700', '32176547/2133-09', 'MG', 9071),
(410, 'Rodolfo', 'Largo da Lapa 27 sobrado', 'Rio de Janeiro', '30078-900', '12835128/2346-09', 'RJ', 7431),
(720, 'Ana', 'Rua 17 n. 19', 'Niteroi', '24358-310', '12113231/0001-34', 'RJ', 2134),
(830, 'Mauricio', 'Av Paulista 1236 sl/2345', 'São Paulo', '30126-183', '32816985/7465-06', 'SP', 9343),
(870, 'Flavio', 'Av. Pres Vargas 10', 'São Paulo', '22763-931', '22534126/9387-09', 'SP', 4631);

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_de_pedido`
--

CREATE TABLE `item_de_pedido` (
  `Num_Pedido` int(11) NOT NULL COMMENT 'Campo responsável pelo Número de Identificação do Pedido, Chave Estrangeira.',
  `Cod_Produto` int(11) NOT NULL COMMENT 'Campo responsável pelo Código de Identificação do Produto, Chave Estrageira.',
  `Quantidade` int(11) NOT NULL COMMENT 'Campo responsável pela Quantidade de Produtos no Pedido.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `item_de_pedido`
--

INSERT INTO `item_de_pedido` (`Num_Pedido`, `Cod_Produto`, `Quantidade`) VALUES
(121, 25, 10),
(121, 31, 35),
(97, 77, 20),
(101, 31, 9),
(148, 45, 8),
(148, 31, 7),
(148, 77, 3),
(148, 25, 10),
(148, 78, 30),
(104, 53, 32),
(203, 31, 6),
(189, 78, 45),
(143, 31, 20),
(105, 78, 10),
(111, 25, 10),
(111, 78, 70),
(103, 53, 37),
(91, 77, 40),
(138, 22, 10),
(138, 77, 35),
(138, 53, 18),
(108, 13, 17),
(119, 77, 40),
(119, 13, 6),
(119, 22, 10),
(119, 53, 43),
(137, 13, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `Num_Pedido` int(11) NOT NULL COMMENT 'Campo responsável pelo Número de Identificação do Pedido, Chave Primária.',
  `Cod_Cliente` int(11) NOT NULL COMMENT 'Campo responsável pelo Código de Identificação do Cliente, Chave Estrangeira.',
  `Cod_Vendedor` int(11) NOT NULL COMMENT 'Campo responsável pelo Código de Identificação do Vendedor, Chave Estrangeira.',
  `Prazo_Entrega` int(10) DEFAULT NULL COMMENT 'Campo responsável pelo Prazo de Entrega.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `pedido` (`Num_Pedido`, `Cod_Cliente`, `Cod_Vendedor`, `Prazo_Entrega`) VALUES
(91, 260, 11, 20),
(97, 720, 101, 20),
(98, 410, 209, 20),
(101, 720, 101, 15),
(103, 260, 11, 20),
(104, 110, 101, 30),
(105, 180, 240, 15),
(108, 290, 310, 15),
(111, 260, 240, 20),
(119, 390, 250, 30),
(121, 410, 209, 20),
(127, 410, 11, 10),
(137, 720, 720, 20),
(138, 260, 11, 20),
(143, 20, 111, 30),
(148, 720, 101, 20),
(189, 870, 213, 15),
(203, 830, 250, 30);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `Cod_Produto` int(11) NOT NULL COMMENT 'Campo responsável pelo Código de Identificação do Produto, Chave Primária.',
  `Unid_Produto` varchar(10) NOT NULL COMMENT 'Campo responsável pelo método de mensurar a quantidade de um produto (pacotes, garrafas, metros).',
  `Desc_Produto` varchar(50) NOT NULL COMMENT 'Campo responsável pela Descrição do Produto.',
  `Valor_Unit` decimal(15,2) NOT NULL COMMENT 'Campo responsável pelo Valor por Unidade do Produto.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`Cod_Produto`, `Unid_Produto`, `Desc_Produto`, `Valor_Unit`) VALUES
(13, 'G', 'Ouro', '6.18'),
(22, 'M', 'Linho', '0.11'),
(25, 'Kg', 'Queijo', '0.97'),
(30, 'SAC', 'Açucar', '0.30'),
(31, 'Bar', 'Chocolate', '0.87'),
(45, 'M', 'Madeira', '0.25'),
(53, 'M', 'Linha', '1.80'),
(77, 'M', 'Papel', '1.05'),
(78, 'L', 'Vinho', '2.00'),
(87, 'M', 'Cano', '1.97');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedor`
--

CREATE TABLE `vendedor` (
  `Cod_Vendedor` int(11) NOT NULL COMMENT 'Campo responsável pelo Código de Identificação do Vendedor, Chave Primária.',
  `Nome_Vendedor` varchar(50) NOT NULL COMMENT 'Campo responsável pelo nome do vendedor.',
  `Sal_Fixo` decimal(15,2) NOT NULL COMMENT 'Campo responsável pelo Salário Fixo do Vendedor.',
  `Faixa_Comissao` char(2) NOT NULL COMMENT 'Campo responsável pela faixa de Comissão do vendedor.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `vendedor`
--

INSERT INTO `vendedor` (`Cod_Vendedor`, `Nome_Vendedor`, `Sal_Fixo`, `Faixa_Comissao`) VALUES
(11, 'João', '2780.00', 'C'),
(101, 'João', '2650.32', 'C'),
(111, 'Carlos', '2490.00', 'A'),
(209, 'José', '1800.00', 'C'),
(213, 'Jonas', '2300.50', 'A'),
(240, 'Antonio', '9500.00', 'C'),
(250, 'Mauricío', '2930.00', 'B'),
(310, 'Josias', '870.00', 'B'),
(720, 'Felipe', '4600.00', 'A');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Cod_Cliente`);

--
-- Índices para tabela `item_de_pedido`
--
ALTER TABLE `item_de_pedido`
  ADD KEY `FK_Num_Pedido` (`Num_Pedido`),
  ADD KEY `FK_Cod_Produto` (`Cod_Produto`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`Num_Pedido`),
  ADD KEY `FK_CLIENTE_COD_CLIENTE` (`Cod_Cliente`),
  ADD KEY `FK_VENDEDOR_COD_VENDEDOR` (`Cod_Vendedor`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`Cod_Produto`);

--
-- Índices para tabela `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`Cod_Vendedor`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `item_de_pedido`
--
ALTER TABLE `item_de_pedido`
  ADD CONSTRAINT `FK_Cod_Produto` FOREIGN KEY (`Cod_Produto`) REFERENCES `produto` (`Cod_Produto`),
  ADD CONSTRAINT `FK_Num_Pedido` FOREIGN KEY (`Num_Pedido`) REFERENCES `pedido` (`Num_Pedido`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK_CLIENTE_COD_CLIENTE` FOREIGN KEY (`Cod_Cliente`) REFERENCES `cliente` (`Cod_Cliente`),
  ADD CONSTRAINT `FK_VENDEDOR_COD_VENDEDOR` FOREIGN KEY (`Cod_Vendedor`) REFERENCES `vendedor` (`Cod_Vendedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
