-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mariadb:3306
-- Tempo de geração: 27/07/2024 às 13:32
-- Versão do servidor: 10.6.18-MariaDB-ubu2004
-- Versão do PHP: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `Base`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `Atividade`
--

CREATE TABLE `Atividade` (
  `AtividadeID` int(11) NOT NULL,
  `Atividade` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Baixa`
--

CREATE TABLE `Baixa` (
  `Nota` int(11) NOT NULL,
  `TipoID` int(11) NOT NULL,
  `Parcelas` int(11) NOT NULL,
  `OperacaoID` int(11) NOT NULL,
  `MovimentoID` int(11) NOT NULL,
  `Valorliquido` decimal(15,2) DEFAULT NULL,
  `Valormulta` decimal(15,2) DEFAULT NULL,
  `Valorjuros` decimal(15,2) DEFAULT NULL,
  `Valorencargos` decimal(15,2) GENERATED ALWAYS AS (`Valorjuros` + `Valormulta`) STORED,
  `Valordesconto` decimal(15,2) DEFAULT NULL,
  `Valorquitado` decimal(15,2) GENERATED ALWAYS AS (`Valorliquido` + `Valordesconto`) STORED,
  `Valorpago` decimal(15,2) GENERATED ALWAYS AS (`Valorliquido` + `Valorjuros` + `Valormulta` - `Valordesconto`) STORED,
  `Item` int(11) DEFAULT NULL,
  `PessoaID` int(11) DEFAULT NULL,
  `Nome` varchar(30) DEFAULT NULL,
  `Pagamento` date DEFAULT NULL,
  `Descricao` blob DEFAULT NULL,
  `Obs` blob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------


--
-- Estrutura para tabela `Caixa`
--

CREATE TABLE `Caixa` (
  `MovimentoID` int(11) NOT NULL,
  `OperacaoID` int(11) NOT NULL,
  `Pagamento` date DEFAULT NULL,
  `Valor` decimal(15,2) DEFAULT NULL,
  `StatusID` int(11) DEFAULT NULL,
  `Descricao` varchar(50) DEFAULT NULL,
  `PessoaID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Cedente`
--

CREATE TABLE `Cedente` (
  `Id` int(11) NOT NULL,
  `Agencia` varchar(20) DEFAULT NULL,
  `Codigoagencia` int(11) DEFAULT NULL,
  `Bairro` varchar(50) DEFAULT NULL,
  `Titulo` varchar(20) DEFAULT NULL,
  `Cep` varchar(20) DEFAULT NULL,
  `Cidade` varchar(50) DEFAULT NULL,
  `Cnpjcpf` varchar(20) DEFAULT NULL,
  `Codigocedente` int(11) DEFAULT NULL,
  `Codigotransmissao` int(11) DEFAULT NULL,
  `Complemento` varchar(50) DEFAULT NULL,
  `Conta` varchar(30) DEFAULT NULL,
  `Digitoconta` int(11) DEFAULT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Telefone` varchar(30) DEFAULT NULL,
  `Tipodoc` int(11) DEFAULT NULL,
  `Tipoinscricao` int(11) DEFAULT NULL,
  `Uf` varchar(4) DEFAULT NULL,
  `Logradouro` varchar(50) DEFAULT NULL,
  `Banco` varchar(40) DEFAULT NULL,
  `Carteira` varchar(20) DEFAULT NULL,
  `Nossonumero` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Centrocusto`
--

CREATE TABLE `CentroCusto` (
  `CentroID` int(11) NOT NULL,
  `CentroCusto` varchar(50) DEFAULT NULL,
  `Nivel` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Cidade`
--

CREATE TABLE `Cidade` (
  `CidadeID` int(11) NOT NULL,
  `Codcidade` varchar(20) DEFAULT NULL,
  `Cidade` varchar(50) DEFAULT NULL,
  `Codestado` int(11) DEFAULT NULL,
  `Sigla` varchar(2) DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Empresa`
--

CREATE TABLE `Empresa` (
  `PessoaID` int(11) NOT NULL,
  `TipoID` int(11) DEFAULT NULL,
  `GrupoID` int(11) DEFAULT NULL,
  `AtividadeID` int(11) DEFAULT NULL,
  `Nome` varchar(80) DEFAULT NULL,
  `Fantasia` varchar(50) DEFAULT NULL,
  `Documento` varchar(20) DEFAULT NULL,
  `IE` varchar(14) DEFAULT NULL,
  `IM` varchar(30) DEFAULT NULL,
  `Contato` varchar(30) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `Endereco` varchar(80) DEFAULT NULL,
  `Numero` varchar(10) DEFAULT NULL,
  `CEP` varchar(15) DEFAULT NULL,
  `Bairro` varchar(30) DEFAULT NULL,
  `CidadeID` int(11) DEFAULT NULL,
  `Tel1` varchar(20) DEFAULT NULL,
  `Tel2` varchar(20) DEFAULT NULL,
  `Web` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Obs` varchar(80) DEFAULT NULL,
  `CNAE` varchar(10) DEFAULT NULL,
  `Regime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Equipamento`
--

CREATE TABLE `Equipamento` (
  `EquipamentoID` int(11) NOT NULL,
  `Equipamento` varchar(40) DEFAULT NULL,
  `Identificacao` varchar(50) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `Marca` varchar(40) DEFAULT NULL,
  `Modelo` varchar(40) DEFAULT NULL,
  `Ano` int(11) DEFAULT NULL,
  `Cor` varchar(30) DEFAULT NULL,
  `Caracteristica` varchar(30) DEFAULT NULL,
  `PessoaID` int(11) DEFAULT NULL,
  `Serie` varchar(30) DEFAULT NULL,
  `Referencia` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Financeiro`
--

CREATE TABLE `Financeiro` (
  `Nota` int(11) NOT NULL,
  `TipoID` int(11) NOT NULL,
  `Parcelas` smallint(6) NOT NULL,
  `Fatura` varchar(10) DEFAULT NULL,
  `Emissao` date DEFAULT NULL,
  `Mescompetencia` char(6) DEFAULT NULL,
  `Vencimento` date DEFAULT NULL,
  `Lancamento` date DEFAULT NULL,
  `Valor` decimal(15,2) DEFAULT NULL,
  `StatusID` int(11) DEFAULT NULL,
  `Impresso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Grade`
--

CREATE TABLE `Grade` (
  `GradeID` int(11) NOT NULL,
  `ProdutoID` int(11) NOT NULL,
  `Produto` varchar(50) DEFAULT NULL,
  `Qtd` float DEFAULT NULL,
  `Valor` float DEFAULT NULL,
  `Indice` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Grupo`
--

CREATE TABLE `Grupo` (
  `GrupoID` int(11) NOT NULL,
  `Grupo` varchar(50) DEFAULT NULL,
  `Grade` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Lancamento`
--

CREATE TABLE `Lancamento` (
  `NOTA` int(11) NOT NULL,
  `TIPOID` int(11) NOT NULL,
  `DATA` date DEFAULT NULL,
  `PRODUTOID` int(11) DEFAULT NULL,
  `PESSOAID` int(11) DEFAULT NULL,
  `FATOR` float DEFAULT NULL,
  `QUANTIDADE` float DEFAULT NULL,
  `UNIDADE` varchar(4) DEFAULT NULL,
  `UNITARIO` float DEFAULT NULL,
  `PRECO` float DEFAULT NULL,
  `DESCONTO` float DEFAULT NULL,
  `NCM` varchar(10) DEFAULT NULL,
  `CFOP` varchar(4) DEFAULT NULL,
  `DESCRICAO` varchar(150) DEFAULT NULL,
  `TOTAL` float GENERATED ALWAYS AS (`UNITARIO` * `QUANTIDADE` * `FATOR`) STORED,
  `TOTALDESCONTO` float GENERATED ALWAYS AS (`UNITARIO` * `QUANTIDADE` * `FATOR` * `DESCONTO` / 100) STORED,
  `LIQUIDO` float GENERATED ALWAYS AS (`QUANTIDADE` * (`UNITARIO` - `UNITARIO` * `DESCONTO` / 100)) STORED,
  `DESCONTADO` float GENERATED ALWAYS AS (`QUANTIDADE` * `UNITARIO` - (`QUANTIDADE` * `UNITARIO` - `UNITARIO` * `DESCONTO` / 100)) STORED,
  `TOTALITEM` float DEFAULT NULL,
  `BARRAS` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------




--
-- Estrutura para tabela `Linha`
--

CREATE TABLE `Linha` (
  `LinhaID` int(11) NOT NULL,
  `Linha` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Localizacao`
--

CREATE TABLE `Localizacao` (
  `LocalizacaoID` int(11) NOT NULL,
  `Localizacao` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Manutencao`
--

CREATE TABLE `Manutencao` (
  `Nota` int(11) NOT NULL,
  `TipoID` int(11) NOT NULL,
  `Item` int(11) DEFAULT NULL,
  `ServicoID` int(11) DEFAULT NULL,
  `Fator` float DEFAULT NULL,
  `Quantidade` float DEFAULT NULL,
  `Desconto` float DEFAULT NULL,
  `Unitario` float DEFAULT NULL,
  `Iss` float DEFAULT NULL,
  `Descricao` varchar(150) DEFAULT NULL,
  `Liquido` float GENERATED ALWAYS AS (`Quantidade` * (`Unitario` - `Unitario` * `Desconto` / 100)) VIRTUAL,
  `Descontado` float GENERATED ALWAYS AS (`Quantidade` * `Unitario` - (`Quantidade` * `Unitario` - `Unitario` * `Desconto` / 100)) VIRTUAL,
  `Total` float GENERATED ALWAYS AS (`Unitario` * `Quantidade` * `Fator`) VIRTUAL,
  `Totaldesconto` float GENERATED ALWAYS AS (`Unitario` * `Quantidade` * `Fator` * `Desconto` / 100) VIRTUAL,
  `Comissao` float DEFAULT NULL,
  `Totalcomissao` float GENERATED ALWAYS AS (`Liquido` * `Comissao` / 100) VIRTUAL,
  `Totaliss` float GENERATED ALWAYS AS (`Liquido` * `Iss` / 100) VIRTUAL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Moeda`
--

CREATE TABLE `Moeda` (
  `Numero` int(11) NOT NULL,
  `Emissao` date DEFAULT NULL,
  `Tipo` int(11) DEFAULT NULL,
  `Codcliente` int(11) DEFAULT NULL,
  `Cliente` varchar(80) DEFAULT NULL,
  `Documento` varchar(18) DEFAULT NULL,
  `Subtotal` float DEFAULT NULL,
  `Desconto` float DEFAULT NULL,
  `Acrescimo` float DEFAULT NULL,
  `Total` float DEFAULT NULL,
  `Dinheiro` float DEFAULT NULL,
  `Cheque` float DEFAULT NULL,
  `Cartao` float DEFAULT NULL,
  `Outros` float DEFAULT NULL,
  `Nota` int(11) NOT NULL,
  `TipoID` int(11) NOT NULL,
  `Forma` varchar(40) DEFAULT NULL,
  `Taxa` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Movimento`
--

CREATE TABLE `Movimento` (
  `Nota` int(11) NOT NULL,
  `TipoID` int(11) NOT NULL,
  `Movimento` date NOT NULL,
  `Emissao` date NOT NULL,
  `PessoaID` int(11) NOT NULL,
  `StatusID` int(11) NOT NULL,
  `Descricao` varchar(50) DEFAULT NULL,
  `Saldo` float NOT NULL DEFAULT 0,
  `Total` float NOT NULL,
  `PagamentoID` int(11) DEFAULT NULL,
  `OperacaoID` smallint(6) DEFAULT NULL,
  `Pedido` int(11) DEFAULT NULL,
  `Chave` varchar(10) DEFAULT NULL,
  `Faturado` float DEFAULT NULL,
  `Documento` varchar(20) DEFAULT NULL,
  `CentroCustoID` int(11) DEFAULT NULL,
  `Frete` float DEFAULT 0,
  `Outros` float DEFAULT 0,
  `Desconto` float DEFAULT NULL,
  `Modelo` int(11) DEFAULT NULL,
  `Serie` int(11) DEFAULT NULL,
  `Nome` varchar(80) DEFAULT NULL,
  `Obs` varchar(100) DEFAULT NULL,
  `Volume` float DEFAULT NULL,
  `Usuario` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Operacao`
--

CREATE TABLE `Operacao` (
  `TipoID` int(11) NOT NULL,
  `Tipo` varchar(20) NOT NULL,
  `NaturezaID` int(11) NOT NULL,
  `Sigla` char(3) NOT NULL,
  `Estoque` int(11) NOT NULL,
  `Financeiro` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Ordem`
--

CREATE TABLE `Ordem` (
  `Nota` int(11) DEFAULT NULL,
  `TipoID` int(11) DEFAULT NULL,
  `PessoaID` int(11) DEFAULT NULL,
  `Chegada` date DEFAULT NULL,
  `Horachegada` date DEFAULT NULL,
  `Saida` date DEFAULT NULL,
  `Horasaida` date DEFAULT NULL,
  `Garantia` date DEFAULT NULL,
  `EquipamentoID` int(11) DEFAULT NULL,
  `Acessorio` varchar(50) DEFAULT NULL,
  `Reclamado` varchar(50) DEFAULT NULL,
  `Apresentado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Pagamento`
--

CREATE TABLE `Pagamento` (
  `PagamentoID` int(11) NOT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Parcela` int(11) DEFAULT NULL,
  `Taxa` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Pedido`
--

CREATE TABLE `Pedido` (
  `Nota` int(11) NOT NULL,
  `TipoID` int(11) NOT NULL,
  `FornecedorID` int(11) DEFAULT NULL,
  `VendedorID` int(11) DEFAULT NULL,
  `TransportadorID` int(11) DEFAULT NULL,
  `Comissao` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Pessoa`
--

CREATE TABLE `Pessoa` (
  `PessoaID` int(11) NOT NULL,
  `TipoID` int(11) DEFAULT NULL,
  `NaturezaID` int(11) DEFAULT NULL,
  `AtividadeID` int(11) DEFAULT NULL,
  `Nome` varchar(80) DEFAULT NULL,
  `Fantasia` varchar(50) DEFAULT NULL,
  `Documento` varchar(20) DEFAULT NULL,
  `Ie` varchar(14) DEFAULT NULL,
  `Im` varchar(30) DEFAULT NULL,
  `Contato` varchar(30) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `Nascimento` date DEFAULT NULL,
  `Endereco` varchar(80) DEFAULT NULL,
  `Numero` varchar(10) DEFAULT NULL,
  `Cep` varchar(15) DEFAULT NULL,
  `Bairro` varchar(30) DEFAULT NULL,
  `CidadeID` int(11) DEFAULT NULL,
  `Cel` varchar(20) DEFAULT NULL,
  `Tel` varchar(20) DEFAULT NULL,
  `Web` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Obs` varchar(80) DEFAULT NULL,
  `Codcidade` int(11) DEFAULT NULL,
  `Codestado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Produto`
--

CREATE TABLE `Produto` (
  `ProdutoID` int(11) NOT NULL,
  `Digito` varchar(20) DEFAULT NULL,
  `Barras` varchar(20) DEFAULT NULL,
  `Ncm` varchar(10) DEFAULT NULL,
  `Cfop` varchar(10) DEFAULT NULL,
  `Produto` varchar(50) DEFAULT NULL,
  `Referencia` varchar(20) DEFAULT NULL,
  `PessoaID` int(11) DEFAULT NULL,
  `LinhaID` int(11) DEFAULT NULL,
  `GrupoID` int(11) DEFAULT NULL,
  `TipoID` int(11) DEFAULT NULL,
  `Psliquido` float DEFAULT NULL,
  `Psbruto` float DEFAULT NULL,
  `Estminimo` float DEFAULT NULL,
  `Estmaximo` float DEFAULT NULL,
  `LocalizacaoID` int(11) DEFAULT NULL,
  `Estoque` float DEFAULT 0,
  `Saldo` float DEFAULT NULL,
  `Status` smallint(6) DEFAULT 0,
  `Unidade` varchar(4) DEFAULT NULL,
  `Fabricante` varchar(20) DEFAULT NULL,
  `Serie` int(11) DEFAULT NULL,
  `Custo` float DEFAULT NULL,
  `Marca` varchar(40) DEFAULT NULL,
  `Lote` varchar(20) DEFAULT NULL,
  `Lucro` float DEFAULT NULL,
  `Pcompra` float DEFAULT NULL,
  `Pvenda` float DEFAULT NULL,
  `Margem` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Saldo`
--

CREATE TABLE `Saldo` (
  `Nota` int(11) DEFAULT NULL,
  `TipoID` int(11) DEFAULT NULL,
  `Nf` int(11) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `Valor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Servico`
--

CREATE TABLE `Servico` (
  `ServicoID` int(11) NOT NULL,
  `Servico` varchar(50) DEFAULT NULL,
  `Unitario` float DEFAULT NULL,
  `Iss` float DEFAULT NULL,
  `Comissao` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Status`
--

CREATE TABLE `Status` (
  `StatusID` int(11) NOT NULL,
  `Status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `UCLog`
--

CREATE TABLE `UCLog` (
  `APPLICATIONID` varchar(250) DEFAULT NULL,
  `IDUSER` int(11) DEFAULT NULL,
  `MSG` varchar(250) DEFAULT NULL,
  `DATA` varchar(14) DEFAULT NULL,
  `NIVEL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `UCTabRights`
--

CREATE TABLE `UCTabRights` (
  `UCIdUser` int(11) DEFAULT NULL,
  `UCModule` varchar(50) DEFAULT NULL,
  `UCCompName` varchar(50) DEFAULT NULL,
  `UCKey` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `UCTabRightsEX`
--

CREATE TABLE `UCTabRightsEX` (
  `UCIdUser` int(11) DEFAULT NULL,
  `UCModule` varchar(50) DEFAULT NULL,
  `UCCompName` varchar(50) DEFAULT NULL,
  `UCFormName` varchar(50) DEFAULT NULL,
  `UCKey` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `UCTabUsers`
--

CREATE TABLE `UCTabUsers` (
  `UCIdUser` int(11) DEFAULT NULL,
  `UCUserName` varchar(30) DEFAULT NULL,
  `UCLogin` varchar(30) DEFAULT NULL,
  `UCPassword` varchar(250) DEFAULT NULL,
  `UCPASSEXPIRED` char(10) DEFAULT NULL,
  `UCUserExpired` int(11) DEFAULT NULL,
  `UCUserDaysSun` int(11) DEFAULT NULL,
  `UCEmail` varchar(150) DEFAULT NULL,
  `UCPrivileged` int(11) DEFAULT NULL,
  `UCTypeRec` char(1) DEFAULT NULL,
  `UCProfile` int(11) DEFAULT NULL,
  `UCKey` varchar(250) DEFAULT NULL,
  `UCInative` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `UCTabUsersLogged`
--

CREATE TABLE `UCTabUsersLogged` (
  `UCIdLogon` char(38) DEFAULT NULL,
  `UCIdUser` int(11) DEFAULT NULL,
  `UCApplicationId` varchar(50) DEFAULT NULL,
  `UCMachineName` varchar(50) DEFAULT NULL,
  `UCData` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------


-- Índices de tabela `Atividade`
--
ALTER TABLE `Atividade`
  ADD PRIMARY KEY (`AtividadeID`);

--
-- Índices de tabela `Baixa`
--
ALTER TABLE `Baixa`
  ADD PRIMARY KEY (`Nota`,`TipoID`,`Parcelas`,`OperacaoID`,`MovimentoID`),
  ADD KEY `FK_BAIXA` (`MovimentoID`,`OperacaoID`);



--
-- Índices de tabela `Caixa`
--
ALTER TABLE `Caixa`
  ADD PRIMARY KEY (`MovimentoID`,`OperacaoID`);

--
-- Índices de tabela `Cedente`
--
ALTER TABLE `Cedente`
  ADD PRIMARY KEY (`Id`);

--
-- Índices de tabela `Centrocusto`
--
ALTER TABLE `CentroCusto`
  ADD PRIMARY KEY (`CentroID`);

--
-- Índices de tabela `Cidade`
--
ALTER TABLE `Cidade`
  ADD PRIMARY KEY (`CidadeID`);

--
-- Índices de tabela `Empresa`
--
ALTER TABLE `Empresa`
  ADD PRIMARY KEY (`PessoaID`);

--
-- Índices de tabela `Equipamento`
--
ALTER TABLE `Equipamento`
  ADD PRIMARY KEY (`EquipamentoID`);

--
-- Índices de tabela `Financeiro`
--
ALTER TABLE `Financeiro`
  ADD PRIMARY KEY (`Nota`,`TipoID`,`Parcelas`);



--
-- Índices de tabela `Grade`
--
ALTER TABLE `Grade`
  ADD PRIMARY KEY (`GradeID`,`ProdutoID`);

--
-- Índices de tabela `Grupo`
--
ALTER TABLE `Grupo`
  ADD PRIMARY KEY (`GrupoID`);

--
-- Índices de tabela `Lancamento`
--
ALTER TABLE `Lancamento`
  ADD KEY `FK_LANCAMENTO` (`NOTA`,`TIPOID`);




--
-- Índices de tabela `Linha`
--
ALTER TABLE `Linha`
  ADD PRIMARY KEY (`LinhaID`);

--
-- Índices de tabela `Localizacao`
--
ALTER TABLE `Localizacao`
  ADD PRIMARY KEY (`LocalizacaoID`);

--
-- Índices de tabela `Manutencao`
--
ALTER TABLE `Manutencao`
  ADD KEY `FK_MANUTENCAO` (`Nota`,`TipoID`);

--
-- Índices de tabela `Moeda`
--
ALTER TABLE `Moeda`
  ADD PRIMARY KEY (`Nota`,`TipoID`);

--
-- Índices de tabela `Movimento`
--
ALTER TABLE `Movimento`
  ADD PRIMARY KEY (`Nota`,`TipoID`);

--
-- Índices de tabela `Operacao`
--
ALTER TABLE `Operacao`
  ADD PRIMARY KEY (`TipoID`);

--
-- Índices de tabela `Ordem`
--
ALTER TABLE `Ordem`
  ADD KEY `FK_ORDEM` (`Nota`,`TipoID`);

--
-- Índices de tabela `Pagamento`
--
ALTER TABLE `Pagamento`
  ADD PRIMARY KEY (`PagamentoID`);

--
-- Índices de tabela `Pedido`
--
ALTER TABLE `Pedido`
  ADD PRIMARY KEY (`Nota`,`TipoID`);

--
-- Índices de tabela `Pessoa`
--
ALTER TABLE `Pessoa`
  ADD PRIMARY KEY (`PessoaID`);

--
-- Índices de tabela `Produto`
--
ALTER TABLE `Produto`
  ADD PRIMARY KEY (`ProdutoID`);

--
-- Índices de tabela `Saldo`
--
ALTER TABLE `Saldo`
  ADD KEY `FK_SALDO` (`Nota`,`TipoID`);

--
-- Índices de tabela `Servico`
--
ALTER TABLE `Servico`
  ADD PRIMARY KEY (`ServicoID`);

--
-- Índices de tabela `Status`
--
ALTER TABLE `Status`
  ADD PRIMARY KEY (`StatusID`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `Baixa`
--
ALTER TABLE `Baixa`
  ADD CONSTRAINT `FK_BAIXA` FOREIGN KEY (`MovimentoID`,`OperacaoID`) REFERENCES `Caixa` (`MovimentoID`, `OperacaoID`) ON DELETE CASCADE;


-- Restrições para tabelas `Financeiro`
--
ALTER TABLE `Financeiro`
  ADD CONSTRAINT `FK_FINANCEIRO` FOREIGN KEY (`Nota`,`TipoID`) REFERENCES `Movimento` (`Nota`, `TipoID`) ON DELETE CASCADE;

--
-- Restrições para tabelas `Lancamento`
--
ALTER TABLE `Lancamento`
  ADD CONSTRAINT `FK_LANCAMENTO` FOREIGN KEY (`NOTA`,`TIPOID`) REFERENCES `Movimento` (`Nota`, `TipoID`) ON DELETE CASCADE;



--
-- Restrições para tabelas `Manutencao`
--
ALTER TABLE `Manutencao`
  ADD CONSTRAINT `FK_MANUTENCAO` FOREIGN KEY (`Nota`,`TipoID`) REFERENCES `Movimento` (`Nota`, `TipoID`) ON DELETE CASCADE;

--
-- Restrições para tabelas `Moeda`
--
ALTER TABLE `Moeda`
  ADD CONSTRAINT `FK_MOEDA` FOREIGN KEY (`Nota`,`TipoID`) REFERENCES `Movimento` (`Nota`, `TipoID`) ON DELETE CASCADE;

--
-- Restrições para tabelas `Ordem`
--
ALTER TABLE `Ordem`
  ADD CONSTRAINT `FK_ORDEM` FOREIGN KEY (`Nota`,`TipoID`) REFERENCES `Movimento` (`Nota`, `TipoID`) ON DELETE CASCADE;

--
-- Restrições para tabelas `Pedido`
--
ALTER TABLE `Pedido`
  ADD CONSTRAINT `FK_PEDIDO` FOREIGN KEY (`Nota`,`TipoID`) REFERENCES `Movimento` (`Nota`, `TipoID`) ON DELETE CASCADE;

--
-- Restrições para tabelas `Saldo`
--
ALTER TABLE `Saldo`
  ADD CONSTRAINT `FK_SALDO` FOREIGN KEY (`Nota`,`TipoID`) REFERENCES `Movimento` (`Nota`, `TipoID`) ON DELETE CASCADE;
COMMIT;



--
-- Estrutura stand-in para view `VW_CLIENTE`
-- (Veja abaixo para a visão atual)
--
CREATE VIEW VW_Cliente
AS
SELECT
       Pessoa.PessoaID,Pessoa.NaturezaID, Pessoa.Nome, 1 as Tipo,
       Pessoa.Documento, Pessoa.IE, Pessoa.Data,
       Pessoa.Fantasia, Pessoa.Contato,
       Pessoa.Tel, Pessoa.Cel, Pessoa.EMail, Pessoa.Web,
       Pessoa.CEP, Pessoa.Endereco,Pessoa.Numero,  Pessoa.Bairro,
       Cidade.Cidade, Cidade.Sigla, Cidade.Codcidade, Cidade.CodEstado

FROM Pessoa
  LEFT JOIN Cidade
    ON Pessoa.CidadeID = Cidade.CidadeID

WHERE NATUREZAID =  1

order by  Pessoa.Nome
;

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `VW_ESTOQUE`
-- (Veja abaixo para a visão atual)
--
CREATE  VIEW VW_Estoque
AS
Select                          
    
    Produto.ProdutoID,
    Sum((Lancamento.Quantidade * Lancamento.Fator) 
         * Operacao.Estoque 
         * Case 
             when Movimento.StatusID = 0  then 0
             when Movimento.StatusID = 1  then 1
             else 0
           end ) Disponivel,

    Sum((Lancamento.Quantidade * Lancamento.Fator)
        * Operacao.Estoque 
        * Case
             when Movimento.StatusID = 0  then 0
             when Movimento.StatusID = 1  then 1
             else 0

          end)Fisico,

    Count(Lancamento.ProdutoID) Movimentos
  From Produto
    inner join Lancamento
      ON  Lancamento.ProdutoID = Produto.ProdutoID
    inner join Movimento
      ON  Lancamento.TipoID   = Movimento.TipoID
     AND  Lancamento.Nota     = Movimento.Nota   
    inner JOIN Operacao
      ON Operacao.TipoID = Movimento.TipoID   
  Where  Movimento.StatusID <= 3
Group BY  Produto.ProdutoID, Produto.Estoque
;

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `VW_FINANCEIRO`
-- (Veja abaixo para a visão atual)
--
CREATE  VIEW VW_Financeiro
AS
Select  Financeiro.nota, Financeiro.tipoid, Financeiro.parcelas, Financeiro.fatura,
        Financeiro.emissao, Financeiro.mescompetencia, Financeiro.vencimento, Financeiro.lancamento,
        Financeiro.valor, Financeiro.statusid, Financeiro.impresso,Sigla,
     case
        when Baixa.ValorLiquido is not null then
             Baixa.ValorLiquido
        else 0.00
     end   quitado,

     case
        when Baixa.ValorLiquido is not null then
             Financeiro.valor - Baixa.ValorLiquido
        else Financeiro.valor
     end   aberto

 From Financeiro
 LEFT Join Baixa
    On Baixa.TipoID      =  Financeiro.TipoID
   And  Baixa.Nota       =  Financeiro.Nota
   And  Baixa.Parcelas   =  Financeiro.Parcelas
 INNER Join  Operacao
    On Operacao.TipoID  =  Financeiro.TipoID
;

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `VW_FORNECEDOR`
-- (Veja abaixo para a visão atual)
--
CREATE  VIEW VW_Fornecedor
AS
SELECT
       Pessoa.PessoaID,Pessoa.NaturezaID, Pessoa.Nome, 1 as Tipo,
       Pessoa.Documento, Pessoa.IE, Pessoa.Data,
       Pessoa.Fantasia, Pessoa.Contato,
       Pessoa.Tel, Pessoa.Cel, Pessoa.EMail, Pessoa.Web,
       Pessoa.CEP, Pessoa.Endereco,Pessoa.Numero,  Pessoa.Bairro,
       Cidade.Cidade, Cidade.Sigla, Cidade.Codcidade, Cidade.CodEstado

FROM Pessoa
  LEFT JOIN Cidade
    ON Pessoa.CidadeID = Cidade.CidadeID

WHERE NATUREZAID =  0


order by  Pessoa.Nome
;

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `VW_OUTROS`
-- (Veja abaixo para a visão atual)
--
CREATE  VIEW VW_Outros
AS
SELECT
       Pessoa.PessoaID,Pessoa.NaturezaID, Pessoa.Nome, 1 as Tipo,
       Pessoa.Documento, Pessoa.IE, Pessoa.Data,
       Pessoa.Fantasia, Pessoa.Contato,
       Pessoa.Tel, Pessoa.Cel, Pessoa.EMail, Pessoa.Web,
       Pessoa.CEP, Pessoa.Endereco,Pessoa.Numero,  Pessoa.Bairro,
       Cidade.Cidade, Cidade.Sigla, Cidade.Codcidade, Cidade.CodEstado

FROM Pessoa
  LEFT JOIN Cidade
    ON Pessoa.CidadeID = Cidade.CidadeID

WHERE NATUREZAID =  4
order by  Pessoa.Nome
;

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `VW_PESSOAS`
-- (Veja abaixo para a visão atual)
--
CREATE  VIEW VW_Pessoas
AS
SELECT
       Pessoa.PessoaID,Pessoa.NaturezaID, Pessoa.Nome, 1 as Tipo,
       Pessoa.Documento, Pessoa.IE, Pessoa.Data,
       Pessoa.Fantasia, Pessoa.Contato,
       Pessoa.Tel, Pessoa.Cel, Pessoa.EMail, Pessoa.Web,
       Pessoa.CEP, Pessoa.Endereco,Pessoa.Numero,  Pessoa.Bairro,
       Cidade.Cidade, Cidade.Sigla, Cidade.Codcidade, Cidade.CodEstado

FROM Pessoa
  LEFT JOIN Cidade
    ON Pessoa.CidadeID = Cidade.CidadeID
;

-- --------------------------------------------------------

--
-- Estrutura stand-in para view `VW_TRANSPORTADOR`
-- (Veja abaixo para a visão atual)
--
CREATE VIEW VW_Transportador
AS
SELECT
       Pessoa.PessoaID,Pessoa.NaturezaID, Pessoa.Nome, 1 as Tipo,
       Pessoa.Documento, Pessoa.IE, Pessoa.Data,
       Pessoa.Fantasia, Pessoa.Contato,
       Pessoa.Tel, Pessoa.Cel, Pessoa.EMail, Pessoa.Web,
       Pessoa.CEP, Pessoa.Endereco,Pessoa.Numero,  Pessoa.Bairro,
       Cidade.Cidade, Cidade.Sigla, Cidade.Codcidade, Cidade.CodEstado

FROM Pessoa
  LEFT JOIN Cidade
    ON Pessoa.CidadeID = Cidade.CidadeID

WHERE NATUREZAID =  2
;
-- --------------------------------------------------------

--
-- Estrutura stand-in para view `VW_VENDEDOR`
-- (Veja abaixo para a visão atual)
--
CREATE VIEW VW_Vendedor
AS
SELECT
       Pessoa.PessoaID,Pessoa.NaturezaID, Pessoa.Nome, 1 as Tipo,
       Pessoa.Documento, Pessoa.IE, Pessoa.Data,
       Pessoa.Fantasia, Pessoa.Contato,
       Pessoa.Tel, Pessoa.Cel, Pessoa.EMail, Pessoa.Web,
       Pessoa.CEP, Pessoa.Endereco,Pessoa.Numero,  Pessoa.Bairro,
       Cidade.Cidade, Cidade.Sigla, Cidade.Codcidade, Cidade.CodEstado

FROM Pessoa
  LEFT JOIN Cidade
    ON Pessoa.CidadeID = Cidade.CidadeID

WHERE NATUREZAID =  3
order by  Pessoa.Nome
;
-- --------------------------------------------------------


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



DELIMITER $$

CREATE PROCEDURE SP_SaldoProduto  ( in IDPRODUTO int)


BEGIN
  DECLARE v_finished INTEGER DEFAULT 0;
  DECLARE VMOVIMENTO date;
  DECLARE VTIPO      int;
  DECLARE VPEDIDO    int;
  DECLARE VENTRADA   float;
  DECLARE VSAIDA     float;
  DECLARE VDESCRICAO varchar(50);
  DECLARE VSALDO     float; 

 -- declare cursor for employee email
 DECLARE C CURSOR FOR( 
   select Movimento.Movimento, Movimento.TipoID, Movimento.Nota, Lancamento.Quantidade * Operacao.Estoque *
           case
             when (Operacao.Estoque = 1 and Operacao.TipoID in (0, 1, 2, 6)) then 1
             when (Operacao.Estoque = -1 and Operacao.TipoID in (7)) then 1

             else 0
           end ENTRADA,

          Lancamento.Quantidade * Operacao.Estoque  *
           case
             when (Operacao.Estoque  = -1 and Operacao.TipoID in (0, 1, 2, 6)) then -1
             when (Operacao.Estoque  = 1 and Operacao.TipoID in (7)) then -1

             else 0
           end SAIDA,

           Movimento.Descricao

    from Produto
    inner join Lancamento on Lancamento.ProdutoID = Produto.ProdutoID
    inner join Movimento on Lancamento.TipoID = Movimento.TipoID and
          Lancamento.Nota = Movimento.Nota
    inner join Operacao on Operacao.TipoID = Movimento.TipoID

    where Movimento.StatusID <= 2 and
          -- Operacao.TipoID > 0 and
          Lancamento.ProdutoID = IDPRODUTO
    order by Movimento.Movimento asc);

 DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET v_finished = 1;


CREATE TEMPORARY TABLE IF NOT EXISTS SaldoProduto( Data date, TipoID int, Pedido int, Descricao varchar(30), Entrada float, Saida float, Saldo float);

OPEN c;
     
      SET  VSALDO = 0;

      while( v_finished != 1) do
                FETCH C INTO VMOVIMENTO,  VTIPO, VPEDIDO, VENTRADA, VSAIDA, VDESCRICAO;
                              
                SET VSALDO   = VSALDO + VENTRADA - VSAIDA;
                
                if v_finished != 1 then
                  INSERT INTO SaldoProduto VALUES(VMOVIMENTO,  VTIPO, VPEDIDO, VDESCRICAO, VENTRADA, VSAIDA, VSALDO);
                end if ;       
               
            end while;
    
CLOSE C;
 
SELECT DISTINCT * FROM SaldoProduto;                              
               
DROP TEMPORARY TABLE if EXISTS SaldoProduto;

END$$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE SP_CompraCliente  (
    FORNECEDORID integer,
    DATAINI date,
    DATAFIM date,
    IDPESSOA integer,
    TIPOID integer
)


BEGIN

   if (TIPOID = 0) then    
        select  VW_Cliente.PessoaID, VW_Cliente.Nome,  VW_Fornecedor.Nome,  Sum(Movimento.Total)
         From
          Movimento
           inner join VW_Cliente
              on VW_Cliente.PessoaID = Movimento.PessoaID
           inner join Pedido
              on Pedido.Nota   = Movimento.Nota
             and Pedido.TipoID = Movimento.TipoID
           inner join VW_Fornecedor
              on VW_Fornecedor.PessoaID= Pedido.FornecedorID
          and ( FORNECEDORID Is Null Or Pedido.FornecedorID    = FORNECEDORID)
          and ( IDPESSOA Is Null Or Movimento.PessoaID         = IDPESSOA)
          and ( DATAINI <= Movimento.Movimento and  DATAFIM >= Movimento.Movimento )
          group by  VW_Cliente.PessoaID, VW_Cliente.Nome,VW_Fornecedor.Nome;
           
       else            
           select  VW_Cliente.PessoaID, VW_Cliente.Nome,   Sum(Movimento.Total)
             From
              Movimento
               inner join VW_Cliente
                  on VW_Cliente.PessoaID= Movimento.PessoaID
               inner join Pedido
                  on Pedido.Nota = Movimento.Nota
                 and Pedido.TipoID = Movimento.TipoID
                 and ( DATAINI <= Movimento.Movimento and DATAFIM >= Movimento.Movimento )
                 group by  VW_Cliente.PessoaID, VW_Cliente.Nome;
         end if;        
  
END$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE SP_Estoque (
    DATAINI date,
    DATAFIM date,
    PROD integer
)


BEGIN

    Select    
       Produto.ProdutoID,
          Sum((Lancamento.Quantidade * Lancamento.Fator) 
           * Operacao.Estoque 
           * Case 
             when Movimento.StatusID = 0  then 0
             when Movimento.StatusID = 1  then 1
             else 0
           end )  Disponivel,

    Sum((Lancamento.Quantidade * Lancamento.Fator)
        * Operacao.Estoque 
        * Case
            when Movimento.StatusID = 0  then 0
             when Movimento.StatusID = 1  then 1
        end)Fisico,
                  
    Count(Lancamento.ProdutoID) Movimentos

  From Produto
    left join Lancamento
      ON  Lancamento.ProdutoID = Produto.ProdutoID
    left join Movimento
      ON  Lancamento.TipoID   = Movimento.TipoID
     AND  Lancamento.Nota     = Movimento.Nota   
    left JOIN Operacao
      ON Operacao.TipoID = Movimento.TipoID   
   Where
         ( Lancamento.TIPOID   is null or Lancamento.TIPOID in (0 , 1, 2, 6)   )
     and ( DATAINI             is null or  Movimento.Movimento >= (DATAINI) )
     and ( DATAFIM             IS Null or  Movimento.Movimento <= (DATAFIM) )
     and ( PROD                Is Null Or  Produto.ProdutoID  = PROD)
     Group BY  Produto.ProdutoID, Produto.Estoque;


END$$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE SP_Financeiro (
    PESSOAID integer,
    INIVEN date,
    FINVEN date,
    FINANCEIROID integer,
    TITULO integer
)

BEGIN

   Select Financeiro.Notaota, Financeiro.TipoID, Financeiro.Parcelas, Financeiro.Fatura,
              Financeiro.Emissao, Financeiro.Mescompetencia, Financeiro.Vencimento, Financeiro.Lancamento,
              Financeiro.Valor, Financeiro.StatusID, Financeiro.Impresso ,Sigla,
       case
        when Baixa.ValorLiquido is not null then
             Baixa.ValorLiquido
        else 0.00
     end   quitado,

     case
        when Baixa.ValorLiquido is not null then
             Financeiro.Valor - Baixa.ValorLiquido
        else financeiro.Valor

     end   aberto,

     VW_Pessoas.Nome, VW_Pessoas.PessoaID, Movimento.Descricao 

 From financeiro
 LEFT Join Baixa
    On  Baixa.TipoID         =  financeiro.TipoID
   And  Baixa.Nota           =  financeiro.Nota
   And  Baixa.Parcelas       =  financeiro.Parcelas
 INNER Join  Operacaoperacao
    On operacao.TipoID       =  Financeiro.TipoID
 INNER JOIN movimento
    On  Mvimento.Nota       =  Fnanceiro.Nota
   And  Mvimento.TipoID     =  Financeiro.TipoID
 INNER Join VW_Pessoas
    On VW_Pessoas.PessoaID   =  Movimento.PessoaID
Where
      Operacao.Financeiro     = FINANCEIUROID
    And  Baixa.ValorLiquido  is null
    And (PESSOAID    Is null Or  Movimento.PessoaID      =  PESSOAID)
    And (INIVEN      Is null Or  Fnanceiro.Vencimento  >= INIVEN)
    And (FINVEN      Is null Or  Financeiroanceiro.Vencimento  <= FINVEN)
    And (TITULO      Is null Or  Movimento.Nota         = TITULO)
order by Financeiro.vencimento;

END$$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE SP_Pessoa(
      IDPESSOA integer
)

BEGIN

   Select VW_Pessoas.PessoaID,Nome, Documento, IE, Endereco, Bairro, Cep,Tel, Cidade,
     VW_Pessoas.Sigla
     From VW_Pessoas
   Where VW_Pessoas.NaturezaID = IDPESSOA;


END$$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE SP_Rel_Cliente(
       CIDADEID integer
)

BEGIN
    Select Cidade.cidade, Nome, Documento, Endereco, Bairro, Tel
  From Pessoa
  inner Join Cidade
    On  Cidade.CidadeID = Pessoa.CidadeID 
   Where NaturezaID =1
    And (CIDADEID IS NULL OR Pessoa.CidadeID = CIDADEID)
    group by Cidade, Nome, Documento, Endereco, Bairro, Tel;

END$$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE SP_Rel_Comissao(
    DATAINI date,
    DATAFIM date,
    VENDEDORID integer,
    FORNECEDORID integer
)

BEGIN
   select Movimento.Emissao, Movimento.Movimento, NOTA, SALDO.DATA, VW_CLIENTE.NOME, VW_VENDEDOR.NOME,
           VW_FORNECEDOR.NOME, TOTAL, ((TOTAL * COMISSAO) / 100) as COMISSAO,
           case STATUSID
              when 0 then 'Aberto'
              when 1 then 'Faturado'
              when 2 then 'Saldo'
              when 3 then 'Cancelado'
           end STATUS 

    from MOVIMENTO
    inner join PEDIDO on
          PEDIDO.NOTA   = MOVIMENTO.NOTA
     and  PEDIDO.TIPOID = MOVIMENTO.TIPOID

    inner join VW_VENDEDOR on VW_VENDEDOR.PESSOAID = PEDIDO.VENDEDORID
    inner join VW_CLIENTE on VW_CLIENTE.PESSOAID = MOVIMENTO.PESSOAID
    inner join VW_FORNECEDOR on VW_FORNECEDOR.PESSOAID = PEDIDO.FORNECEDORID
    left join SALDO on SALDO.NOTA = MOVIMENTO.NOTA and SALDO.TIPOID = MOVIMENTO.TIPOID
    where (VENDEDORID is null or VW_VENDEDOR.PESSOAID = VENDEDORID) and
          (FORNECEDORID is null or VW_FORNECEDOR.PESSOAID = FORNECEDORID) and
          (DATAINI   is null or  MOVIMENTO.EMISSAO  >=  DATAINI )and
          (DATAFIM   is null or  MOVIMENTO.EMISSAO  <= DATAFIM )and
          (STATUSID < 3)

  ORDER BY   vw_fornecedor.nome, Movimento.Movimento;
  
END$$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE SP_Rel_Compra(
    DATAINI date,
    DATAFIM date,
    STATUSID integer,
    PESSOAID integer
)

BEGIN
  Select
         Status.Status,  Movimento,  NOTA, vw_fornecedor.nome, Total
  From Movimento
    Inner Join Lancamento
      On Lancamento.Nota  = Movimento.Nota
     And Lancamento.TipoID =Movimento.TipoID
    Inner Join Status
      On Status.StatusID = Movimento.StatusID
    Inner Join vw_fornecedor
      On vw_fornecedor.PessoaID  = Movimento.PessoaID

Where 

      ( STATUSID     Is Null or   Movimento.StatusID        = STATUSID)
  and ( PESSOAID     Is Null or   VW_Fornecedor.PessoaID    = PESSOAID)
  and ( DATAINI      Is Null or   Movimento.Movimento      >= DATAINI )
  and ( DATAFIM      Is Null or   Movimento.Movimento      <= DATAFIM )

group by
         Movimento.Movimento, Status.Status,  Movimento.Nota,  vw_fornecedor.Nome, Movimento.Total

ORDER BY  vw_fornecedor.Nome, Movimento.Movimento;

  
END$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE SP_Rel_Equipamento(
    DATAINI date,
    DATAFIM date,
    PESSOAID integer,
    EQUIPAMENTOID integer
)

BEGIN
 Select  Equipamento.equipamentoid,   Equipamento.equipamento,Equipamento.identificacao, Equipamento.marca,
               Equipamento.modelo,  movimento.nota, movimento.movimento,  vw_cliente.nome, servico.servico,
               produto.produto,  manutencao.total,  lancamento.total

  From Equipamento
    Inner join ordem
      ON  ordem.equipamentoid = equipamento.equipamentoid
    inner join Movimento
      ON  ordem.TipoID   = Movimento.TipoID
     AND  ordem.Nota     = Movimento.Nota
    inner join vw_cliente
      ON vw_cliente.pessoaid = movimento.pessoaid
    left join manutencao
      ON manutencao.tipoid = Movimento.TipoID
      AND manutencao.nota   = Movimento.nota
    inner join servico
      ON servico.servicoid  = manutencao.servicoid
    left join lancamento
      ON  lancamento.tipoid  = Movimento.TipoID
      And lancamento.nota    = Movimento.nota
    left join produto
      ON produto.produtoid = lancamento.produtoid


Where
     ( DataIni        is null or  Movimento.movimento >= (dataini) )
 and ( datafim        IS Null or  Movimento.movimento <= (datafim) )
 and ( pessoaid       IS Null or  vw_cliente.pessoaid =  pessoaid )
 and ( equipamentoid  Is Null Or equipamento.equipamentoid = equipamentoid)

Group BY       Equipamento.equipamentoid,   Equipamento.equipamento,  Equipamento.identificacao,
               Equipamento.marca,  Equipamento.modelo, movimento.nota, movimento.movimento,
               vw_cliente.nome, servico.servico,  produto.produto,  manutencao.total,  lancamento.total;

  
END$$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE SP_Rel_MovCaixa(
      DATAINI date,
      DATAFIM date
)

BEGIN
       select
          TOTAL,
          sum(
                   case
                     when (MOEDA.DINHEIRO > 0) and ((MOEDA.TOTAL)) <= (MOEDA.DINHEIRO ) then TOTAL
                     when (MOEDA.DINHEIRO > 0) and ((MOEDA.TOTAL)) > (MOEDA.DINHEIRO) then DINHEIRO
                     else 0
                   end) DINHEIRO,

                   sum(
                   case
                     when (MOEDA.CHEQUE > 0) and ((MOEDA.SUBTOTAL)) <= ((MOEDA.CHEQUE)) then TOTAL
                     when (MOEDA.CHEQUE > 0) and ((MOEDA.SUBTOTAL)) > ((MOEDA.CHEQUE )) then CHEQUE
                     else 0
                   end) CHEQUE,

                   sum(
                   case
                     when (MOEDA.CARTAO > 0) and ((MOEDA.SUBTOTAL )) <= (MOEDA.CARTAO) then SUBTOTAL
                     when (MOEDA.CARTAO > 0) and ((MOEDA.SUBTOTAL)) > (MOEDA.CARTAO) then CARTAO
                     else 0
                   end) CARTAO,

                   sum(
                   case
                     when (MOEDA.OUTROS > 0) and ((MOEDA.SUBTOTAL)) <= (MOEDA.OUTROS) then SUBTOTAL
                     when (MOEDA.OUTROS > 0) and ((MOEDA.SUBTOTAL)) > (MOEDA.OUTROS) then OUTROS
                     else 0
                   end) OUTROS,

           EMISSAO, OPERACAO.TIPO, TAXA, FORMA, NOTA
            from MOEDA
             inner join OPERACAO
               on  OPERACAO.TIPOID = MOEDA.TIPOID
            where
                  (DATAINI   is null or  MOEDA.EMISSAO  >= DATAINI )and
                  (DATAFIM   is null or  MOEDA.EMISSAO  <= DATAFIM )
           group by EMISSAO, TIPO, TAXA, FORMA, NOTA, TOTAL;


  
END$$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE SP_Rel_Pedido(
    DATAINI date,
    DATAFIM date,
    PEDIDOID integer,
    STATUSID integer,
    FORNECEDORID integer,
    PESSOAID integer,
    VENDEDORID integer
)

BEGIN
     
 Select
            Movimento.Nota,
            Status.Status,
            Movimento,
            vw_cliente.nome,
            vw_fornecedor.nome,
            vw_vendedor.nome,
            Total


  From Movimento

    Inner Join Pedido
      On Pedido.Nota  = Movimento.Nota
     And Pedido.TipoID =Movimento.TipoID
    Inner Join Status
      On Status.StatusID = Movimento.StatusID
    Inner Join VW_Cliente
      On VW_Cliente.PessoaID  = Movimento.PessoaID
    Inner Join VW_Rornecedor
      On VW_Fornecedor.PessoaID  = Pedido.FornecedorID
    Inner Join VW_Vendedor
      On VW_Vendedor.PessoaID  = Pedido.vendedorid

Where 
      ( PedidoID     Is Null Or Movimento.Nota              = PedidoID)
  and ( StatusID     Is Null Or Movimento.StatusID          = StatusID)
  and ( FornecedorID Is Null Or VW_Fornecedor.PessoaID      = FornecedorID)
  and ( vendedorid   Is Null Or VW_vendedor.PessoaID        = vendedorid)
  and ( pessoaid     Is Null Or VW_Cliente.pessoaid         = pessoaid)
  and ( DataIni      Is Null or   Movimento.Movimento      >= DataIni )
  and ( Datafim      Is Null or   Movimento.Movimento      <= DataFim )

group by vw_Fornecedor.Nome, Movimento.Nota,Status.Status,
         Movimento.Movimento,vw_Cliente.Nome, vw_vendedor.nome,Movimento.Total

ORDER BY  Movimento.Nota  , Movimento.Movimento,  vw_fornecedor.nome;



  
END$$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE SP_Rel_RankProduto(
    DATAINI date,
    DATAFIM date
)

BEGIN
     
 Select
   
    Movimento.Movimento ,

    sum(lancamento.Quantidade * Lancamento.Fator
         * Operacao.Estoque 
         * Case 
             when Operacao.Estoque = - 1 then -1
             else 0
           end )saida, produto

  From Produto
     inner join Lancamento
      ON  Lancamento.ProdutoID = Produto.ProdutoID
    inner join Movimento
      ON  Lancamento.TipoID    = Movimento.TipoID
     AND Lancamento.Nota       = Movimento.Nota
    inner JOIN Operacao
      ON Operacao.TipoID = Movimento.TipoID   
  Where  Movimento.StatusID <= 2
    And  operacao.Tipoid =2
    And (DataIni   Is null or   Movimento.movimento >= DataIni)
    And (datafim   Is null or   Movimento.movimento <= datafim)

    group by produto, Movimento.Movimento

  order by 2 desc;

  
END$$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE SP_Rel_TituloAbertos(
    PESSOAID integer,
    INIVEN date,
    FINVEN date,
    FINANCEIROID integer,
    TITULO integer
)

BEGIN
     
  Select Financeiro.Nota, Financeiro.TipoID, Financeiro.Parcelas, Financeiro.Fatura,
              Financeiro.Emissao, Financeiro.Mescompetencia, Financeiro.Vencimento, Financeiro.Lancamento,
              Financeiro.Valor, Financeiro.StatusID, Financeiro.Impresso , Operacao.Sigla,
       case
        when Baixa.ValorLiquido is not null then
             Baixa.ValorLiquido
        else 0.00
     end   quitado,

     case
        when Baixa.ValorLiquido is not null then
             Financeiro.Valor - Baixa.ValorLiquido
        else Financeiro.Valor

     end   aberto,

     VW_Pessoas.Nome, VW_Pessoas.PessoaID, Movimento.Descricao
  
 From Financeiro

 LEFT Join Baixa
    On  Baixa.TipoID         =  Financeiro.TipoID
   And  Baixa.Nota           =  Financeiro.Nota
   And  Baixa.Parcelas       =  Financeiro.Parcelas

 INNER Join  Operacao
    On Operacao.TipoID       =  Financeiro.TipoID
 INNER JOIN Movimento
    On  Movimento.Nota       =  Financeiro.Nota
   And  Movimento.TipoID     =  Financeiro.TipoID
 INNER Join VW_Pessoas
    On VW_Pessoas.PessoaID   =  Movimento.PessoaID
Where Operacao.Financeiro    = Financeiroid
    And  Baixa.ValorLiquido  is null
    And (PessoaID           Is null Or  Movimento.PessoaID      = PessoaID)
    And (IniVen             Is null Or  Financeiro.Vencimento  >= IniVen)
    And (FinVen             Is null Or  Financeiro.Vencimento  <= FinVen)
    And (titulo             Is null Or  Movimento.Nota          = titulo);

  
END$$

DELIMITER ;



DELIMITER $$

CREATE PROCEDURE SP_Rel_TituloPagos(
    PESSOAID integer,
    INIVEN date,
    FINVEN date,
    FINANCEIROID integer,
    TITULO integer
)

BEGIN
     
 select  Financeiro.Nota, Financeiro.Tipoid, Financeiro.Parcelas, Financeiro.Fatura,
              Financeiro.Emissao, Financeiro.Mescompetencia, Financeiro.Vencimento, Financeiro.Lancamento,
              Financeiro.Valor, Financeiro.Statusid, Financeiro.Impresso ,Sigla,
       case
        when Baixa.ValorLiquido is not null then
             Baixa.ValorLiquido
        else 0.00
     end   quitado,

     case
        when Baixa.ValorLiquido is not null then
             Financeiro.valor - Baixa.ValorLiquido
        else Financeiro.valor

     end   aberto, VW_Pessoas.Nome, Movimento.Descricao,  Caixa.Pagamento
  
 From Financeiro

 Inner Join Baixa
    On  Baixa.TipoID         =  Financeiro.TipoID
   And  Baixa.Nota           =  Financeiro.Nota
   And  Baixa.Parcelas       =  Financeiro.Parcelas
  Inner Join Caixa
    On  Caixa.Movimentoid    =  Baixa.Movimentoid
   And  Caixa.Operacaoid     =  Baixa.Operacaoid
 INNER Join  operacao
    On operacao.TipoID       =  Financeiro.TipoID
 INNER JOIN Movimento
    On  Movimento.Nota       =  Financeiro.Nota
   And  Movimento.TipoID     =  Financeiro.TipoID
 Inner Join VW_Pessoas
    On VW_Pessoas.PessoaID = Movimento.PessoaID

Where operacao.financeiro     = Financeiroid
  --  And  Baixa.ValorLiquido  is null
    And (PessoaID Is null Or  Movimento.PessoaID     = PessoaID)
    And (IniVen   Is null Or  Caixa.pagamento        >= IniVen)
    And (FinVen   Is null Or  Caixa.pagamento        <= FinVen)
    And (titulo   Is null Or  Movimento.nota         = titulo);

  
END$$

DELIMITER ;



DELIMITER $$


create procedure SP_Rel_Manutencao(
    DATAINI date,
    DATAFIM date,
    PESSOAID integer,
    SERVICOID integer)
    
BEGIN

Select
      Movimento.Nota, Movimento.Movimento, VW_Cliente.nome, Servico.Servico,  Manutencao.Total
  From MANUTENCAO
    Inner join Ordem
      ON  Ordem.TIPOID = MANUTENCAO.TIPOID
     AND  Ordem.NOTA = MANUTENCAO.NOTA
    inner join Movimento
      ON  Movimento.TipoID   = Ordem.TipoID
     AND  Movimento.Nota     = Ordem.Nota
    inner join vw_cliente
      ON VW_Cliente.pessoaid = Movimento.Pessoaid
    inner join Servico        ON Servico.Servicoid  = Manutencao.Servicoid
Where
     ( DataIni            IS null or  Movimento.movimento >= (dataini) )
 and ( datafim            IS Null or  Movimento.movimento <= (datafim) )
 and ( pessoaid           IS Null or  VW_Cliente.pessoaid  = pessoaid )
 and ( servicoid          Is Null or  Manutencao.Servicoid  = servicoid)

Group BY       Servico.Servico,
               Movimento.Nota,
               Movimento.Movimento,
               VW_Cliente.Nome,
               Manutencao.Total

order BY  Servico.Servico;

END$$

DELIMITER ;





DELIMITER $$


create procedure SP_Rel_Inventario (
    PROD integer,
    GRUPOID integer,
    LOCALIZACAOID integer,
    LINHAID integer,
    ORDEMID integer)
    
BEGIN

if (ORDEMID = 0) then  

   Select Produto.ProdutoID, Produto.Produto, Produto.Referencia,
           Produto.pvenda,  Estoque,  Estoque,
           grupo.grupo, Localizacao.Localizacao, Linha.Linha,
           Estoque * Produto.Pvenda As PrecoEstoque

From Produto
   LEFT Join Grupo
     On Grupo.GrupoID  = Produto.GrupoID
   LEFT Join Localizacao
    On localizacao.LocalizacaoID = Produto.LocalizacaoID
   LEFT Join Linha
    On Linha.Linhaid = Produto.Linhaid
Where 

      ( grupoID        Is Null Or Grupo.GrupoID             = grupoid )
  And ( localizacaoid  Is Null Or Localizacao.LocalizacaoID = localizacaoid )
  And ( linhaid        Is Null Or Linha.LinhaID             = linhaid )
  And ( Prod           Is Null Or Produto.Produtoid         = Prod)

   order by ProdutoID;

ELSEIF (ORDEMID = 1) then  
  
      Select Produto.ProdutoID, Produto.Produto, Produto.Referencia,
           Produto.pvenda,  Estoque,  Estoque,
           grupo.grupo, Localizacao.Localizacao, Linha.Linha,
           Estoque * Produto.Pvenda As PrecoEstoque

From produto
   LEFT Join grupo
     On grupo.GrupoID  = produto.GrupoID
   LEFT Join localizacao
    On localizacao.LocalizacaoID = produto.LocalizacaoID
   LEFT Join linha
    On linha.linhaid = produto.linhaid
Where 

 
      ( grupoID        Is Null Or Grupo.GrupoID             = grupoid )
  And ( localizacaoid  Is Null Or Localizacao.LocalizacaoID = localizacaoid )
  And ( linhaid        Is Null Or Linha.LinhaID             = linhaid )
  And ( Prod           Is Null Or Produto.Produtoid         = Prod)

  order by produto;

ELSEIF (ORDEMID = 2) then  

     Select Produto.ProdutoID, Produto.Produto, Produto.Referencia,
           Produto.pvenda,  Estoque,  Estoque,
           grupo.grupo, Localizacao.Localizacao, Linha.Linha,
           Estoque * Produto.Pvenda As PrecoEstoque

From produto
   LEFT Join grupo
     On grupo.GrupoID  = produto.GrupoID
   LEFT Join localizacao
    On localizacao.LocalizacaoID = produto.LocalizacaoID
   LEFT Join linha
    On linha.linhaid = produto.linhaid
Where 

     
      ( grupoID        Is Null Or Grupo.GrupoID             = grupoid )
  And ( localizacaoid  Is Null Or Localizacao.LocalizacaoID = localizacaoid )
  And ( linhaid        Is Null Or Linha.LinhaID             = linhaid )
  And ( Prod           Is Null Or Produto.Produtoid         = Prod)

 order by Grupo;


ELSEIF (ORDEMID = 3) then  
  
    Select produto.ProdutoID, produto.Produto, produto.Referencia,
           produto.pvenda,  Estoque,  Estoque,
           grupo.grupo, Localizacao.localizacao,linha.linha,
           Estoque * produto.pvenda As PrecoEstoque

From produto
   LEFT Join grupo
     On grupo.GrupoID  = produto.GrupoID
   LEFT Join localizacao
    On localizacao.LocalizacaoID = produto.LocalizacaoID
   LEFT Join linha
    On linha.linhaid = produto.linhaid
Where 
     
      ( grupoID        Is Null Or Grupo.GrupoID             = grupoid )
  And ( localizacaoid  Is Null Or Localizacao.LocalizacaoID = localizacaoid )
  And ( linhaid        Is Null Or Linha.LinhaID             = linhaid )
  And ( Prod           Is Null Or Produto.Produtoid         = Prod)
  order by Linha;

end if;


END$$

DELIMITER ;




DELIMITER $

CREATE TRIGGER TG_Esoque_Insert AFTER INSERT
ON Lancamento
FOR EACH ROW
BEGIN
  update Produto set Produto.Estoque = Produto.Estoque - new.Quantidade
         where Produto.Produtoid = new.Produtoid;
  
END$


DELIMITER ;




DELIMITER $

CREATE TRIGGER TG_Esoque_Update AFTER UPDATE
ON Lancamento
FOR EACH ROW
BEGIN
   update Produto set Produto.estoque = (Produto.Estoque + old.Quantidade) -  new.Quantidade
            where Produto.Produtoid = old.Produtoid;
  
END$


DELIMITER ;



DELIMITER $

CREATE TRIGGER TG_Esoque_Delete AFTER DELETE
ON Lancamento
FOR EACH ROW
BEGIN
 update Produto set Produto.estoque = Produto.estoque + old.Quantidade
     where Produto.Produtoid = old.Produtoid;
  
END$


DELIMITER ;
