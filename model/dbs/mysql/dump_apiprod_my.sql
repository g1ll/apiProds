-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 21-Set-2019 às 20:58
-- Versão do servidor: 5.7.27-0ubuntu0.18.04.1
-- PHP Version: 7.2.19-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apiprod`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `descontos`
--

CREATE TABLE `descontos` (
  `id_desc` bigint(20) UNSIGNED NOT NULL,
  `descricao` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `taxa` decimal(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `descontos`
--

INSERT INTO `descontos` (`id_desc`, `descricao`, `taxa`) VALUES
(1, '10% a vista no Débito.', '10.00'),
(2, '20% a vista no Débito', '20.00'),
(3, 'Brinde para pagamento a vista.', '0.00'),
(4, 'Até 3x sem juros no crédito.', '0.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `extras`
--

CREATE TABLE `extras` (
  `id_ext` bigint(20) UNSIGNED NOT NULL,
  `descricao` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `extras`
--

INSERT INTO `extras` (`id_ext`, `descricao`) VALUES
(1, 'cumque'),
(2, 'accusamus'),
(3, 'veniam'),
(4, 'sint');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_prod` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `qtd_estoque` int(11) NOT NULL DEFAULT '0',
  `preco` decimal(10,2) NOT NULL,
  `importado` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES
(29, 'yifm ', 'Dignissimos laudantium ab voluptatem similique veniam et dolorem.', 9, '27332.69', 0),
(37, 'xpad', 'Numquam fugit quo ipsam explicabo aut molestiae id corrupti.', 7, '55.98', 0),
(38, 'ybbx', 'Fugiat dolorum minus exercitationem sint.', 3, '1141.60', 1),
(39, 'igcb', 'Tempore beatae porro ullam qui corrupti.', 6, '478224.91', 0),
(40, 'jhgp', 'Minus dolorem ratione dolores debitis illo ut necessitatibus molestias.', 7, '0.00', 0),
(42, 'lqzu', 'Atque qui sapiente dolor modi.', 4, '45459.49', 1),
(43, 'btbu', 'Nam vero quisquam explicabo cumque tempora enim nam.', 5, '12376765.00', 1),
(44, 'osis', 'Consequatur aut molestiae nobis similique.', 1, '343616.00', 1),
(45, 'adtd', 'Possimus iste repudiandae accusantium quam iusto exercitationem.', 9, '5284738.69', 0),
(46, 'mjxa', 'Id adipisci nam saepe magnam explicabo nam.', 4, '55722972.80', 0),
(47, 'htbl', 'Minima eius quia odio architecto labore porro culpa.', 9, '481.79', 1),
(48, 'jkpw', 'Doloremque non ut pariatur sint alias aut accusamus.', 9, '625739.24', 1),
(49, 'ajmo', 'Error magnam quaerat eligendi quis nobis possimus autem.', 9, '99999999.99', 0),
(50, 'mwyl editado', 'Quia ipsam quis non nemo et delectus.', 3, '5034925.86', 0),
(51, 'xldc', 'Provident praesentium eos qui aperiam nemo repellat.', 2, '43177801.88', 1),
(52, 'axeh', 'Illo voluptatem dolor deleniti laborum sunt ea temporibus.', 2, '847771.44', 1),
(53, 'jpdi', 'Et sed ea officiis ab.', 1, '10056.20', 1),
(54, 'rwyx', 'Quam ut cupiditate sit amet sed.', 1, '3292.28', 1),
(55, 'uvoq', 'Dicta voluptatem et tempora totam.', 1, '0.74', 1),
(56, 'gljf', 'Aspernatur officia voluptatem ratione laudantium.', 4, '6126.46', 1),
(57, 'yffa', 'Tempore voluptatibus neque quia nemo.', 4, '23085.40', 0),
(58, 'grjg', 'Officia et dolores aspernatur rerum cumque ut dolore sequi.', 7, '117.57', 1),
(59, 'kzkp', 'Sit et ut asperiores consequuntur necessitatibus et.', 6, '341.96', 0),
(60, 'iuwv', 'Rerum est officia dolorem molestiae.', 7, '2.10', 0),
(61, 'zpaf', 'Dolores praesentium quos natus molestiae nam aut eos.', 2, '29009.08', 1),
(62, 'kdpv', 'Vel qui et dolorem.', 1, '13356572.61', 0),
(63, 'pzbz', 'Praesentium et tenetur quia expedita voluptate odit.', 5, '1313.24', 1),
(64, 'nsqy', 'Amet hic voluptatibus aut impedit et.', 1, '10815481.57', 0),
(65, 'klfj', 'Qui qui placeat ut laborum et ut excepturi voluptatibus.', 5, '1167.68', 1),
(66, 'dbow', 'Non iste ullam veniam nostrum impedit at delectus.', 9, '39693163.77', 1),
(67, 'ssmh', 'Qui veniam sed sit vel harum.', 7, '5.09', 1),
(68, 'bhmz', 'Sit corporis natus id doloremque reprehenderit sequi.', 3, '298.48', 1),
(69, 'tzvx', 'Atque provident expedita qui vero ipsa.', 4, '4292.55', 0),
(70, 'hmzm', 'Optio vero quo rerum.', 3, '399545.12', 1),
(71, 'dazy', 'Et quaerat quam voluptas sit accusantium rem asperiores eligendi.', 5, '0.00', 0),
(72, 'avyu', 'Sit nesciunt amet amet ut.', 1, '99999999.99', 0),
(73, 'ijru', 'Vel consequuntur est et odit accusamus.', 8, '32809249.41', 1),
(74, 'cfcf', 'Ratione nemo dolores delectus labore.', 6, '107732.22', 1),
(75, 'ehtl', 'Illo dolor optio ut doloribus aperiam illum.', 8, '243.07', 0),
(76, 'mgnh', 'Velit magnam quo enim quibusdam deserunt.', 3, '14535490.48', 1),
(77, 'payc', 'Eos veritatis id tempora incidunt quidem nesciunt.', 4, '465935.29', 1),
(78, 'tjsy', 'Molestiae minima vitae aut autem.', 9, '7154652.90', 0),
(79, 'hjna', 'Mollitia ratione voluptas ut qui atque.', 8, '11266.57', 1),
(80, 'esxe', 'Eveniet totam minima excepturi consequatur blanditiis.', 7, '99999999.99', 1),
(81, 'qfmo', 'Repellat facere et sed magni facilis ducimus modi.', 3, '1.34', 0),
(82, 'oxoj', 'Quo facilis distinctio nostrum blanditiis.', 9, '37538423.18', 0),
(83, 'ytgu', 'Dolor dolorum saepe alias vero.', 2, '0.00', 0),
(84, 'nwoe', 'Totam nesciunt dignissimos libero rerum nihil quo id.', 8, '0.00', 0),
(85, 'apgr', 'Libero deleniti hic distinctio et.', 9, '0.00', 0),
(86, 'bacd', 'Sunt fugiat cupiditate dolorum voluptatem provident velit ut optio.', 6, '207825.00', 1),
(87, 'mqix', 'Delectus sunt quo eius a.', 1, '0.00', 0),
(88, 'qxht', 'Itaque consequatur alias sunt et.', 7, '86255.98', 1),
(89, 'itgy', 'Laboriosam expedita sint iste voluptatibus.', 6, '20316.56', 0),
(90, 'anqg', 'Enim totam est aut qui.', 9, '21.35', 1),
(91, 'fcst', 'Aspernatur molestiae et dignissimos debitis quas et tempora.', 6, '470033.50', 0),
(92, 'iptk', 'Tempora quia suscipit quibusdam molestias voluptas nostrum.', 8, '2257.03', 1),
(93, 'sztx', 'Qui est ipsum repudiandae est enim magnam consequatur.', 2, '2471424.07', 1),
(94, 'agmz', 'Qui et et dolor sapiente.', 9, '30072.39', 0),
(95, 'fiwo', 'Animi modi sapiente sed ducimus.', 6, '36568727.99', 1),
(96, 'tybg', 'Delectus fugiat dolorem aut quidem aut laboriosam.', 6, '0.00', 0),
(97, 'rusg', 'Error ab incidunt quasi culpa quidem nulla iste.', 7, '4830.01', 0),
(98, 'oxjx', 'Qui ad minima aliquam quam praesentium debitis.', 6, '105.85', 1),
(99, 'cfmm', 'Rem ab omnis et saepe quae illo illo.', 9, '3584177.00', 0),
(100, 'uwtd', 'Dolores molestiae quis similique numquam autem.', 5, '7.69', 1),
(101, 'asdf', 'asdf', 87, '87.00', 0),
(102, 'asdfas', 'asdf', 213, '321.00', 0),
(103, 'asdf', 'asdf', 654, '321.00', 0),
(104, 'asdfas', 'asdf', 564, '54.00', 0),
(105, 'pppp', 'asdf', 87, '87.00', 0),
(106, 'asdf', 'asdf', 54, '54.00', 0),
(107, 'asdf', 'asd', 654, '654.00', 1),
(108, 'asdf', 'asdf', 321, '321.00', 0),
(109, 'asdf', 'asf', 654, '65.00', 0),
(110, 'asdf', 'asfd', 654, '54.00', 0),
(111, 'asdf', 'sdf', 87, '987.00', 0),
(112, 'asdf', 'asdf', 64, '654.00', 0),
(113, 'lkjlkj', 'lkj', 89, '87.00', 0),
(114, 'asdf', 'asdf', 213, '123.00', 0),
(115, 'asfd', 'sad', 654, '654.00', 0),
(116, 'asdfasdf', 'asdf', 65, '54.00', 0),
(117, 'TESTANDO NOVO PRODUTO', 'TESTANDO NOVO PRODUTO', 999, '8889.00', 0),
(118, 'TESTANDO NOVO PRODUTO', 'TESTANDO NOVO PRODUTO', 999, '8999.00', 0),
(119, 'NOVO PRODUTO', 'NOVO', 90, '999.00', 1),
(120, 'NOVOPROD', 'DENOVO', 90, '9901.00', 0),
(121, 'CADASTRANDONOVO', 'NOVOOOOO', 999, '9965.00', 0),
(122, 'asdfas', 'asdf', 123, '123.00', 0),
(123, 'asdf', 'asdf', 44, '44.00', 0),
(124, 'asdf', 'asdf', 345, '345.00', 0),
(125, 'asdf', 'sdf', 22, '22.00', 0),
(126, 'asdfas', 'sadf', 123, '213.00', 0),
(127, 'asdfas', 'asdf', 213, '123.00', 0),
(128, 'kjlkj', 'lkj', 65, '65.00', 1),
(129, 'asdfas', 'asdf', 213, '123.00', 0),
(130, 'kjhljh', 'khlkjh', 555, '102535.00', 1),
(131, 'kjhkjh', 'kjhjkh', 321, '23154.00', 1),
(132, 'asdf', 'asd', 123, '213.00', 0),
(133, 'asdfas', 'asdf', 12, '123.00', 0),
(134, 'asdf', 'asdd', 6654, '123.00', 0),
(135, 'kljlkj', 'lkjlkj', 987, '32154.00', 1),
(136, 'TESTANDO ADICIONAR', 'ADICIONANDO PRODUTO NOVO', 123, '65498.00', 1),
(137, 'ASDFASD', 'ASDF', 987, '12368.00', 0),
(138, 'AFASD', 'ASDF', 321, '987.21', 0),
(139, 'ASDF', 'ASDF', 123, '897.99', 0),
(140, 'ASDF', 'ASDF', 123, '23.00', 0),
(141, 'asdf', 'asdf', 213, '123.00', 0),
(142, 'asdf', 'sfd', 213, '34.00', 1),
(143, 'asdf', 'asdf', 123, '123.00', 0),
(144, 'asf', 'asdf', 123, '123.00', 0),
(145, 'adsf', 'asdf', 123, '213.00', 1),
(146, 'asdf', 'asdf', 213, '12.00', 0),
(147, 'ASDFASD', 'ASDF', 1, '0.01', 0),
(148, 'asdfas', 'asf', 1, '1.00', 0),
(149, 'asf', 'asdf', 2, '2.00', 1),
(150, 'asdf', 'asf', 897, '987.00', 0),
(151, 'asdf', 'asfd', 987, '54.00', 0),
(152, 'asdf', 'asfd', 654, '987.00', 0),
(153, 'asdf', 'asdf', 654, '654.00', 0),
(154, 'asdf', 'asdfa', 87, '87.00', 0),
(155, 'asdf', 'asdf', 87, '87.00', 0),
(156, 'adsfasdf', 'asdf', 654, '654.00', 0),
(157, 'asdfasdf', 'awdf', 654, '564.44', 1),
(158, 'testecurl', 'asdf', 1, '1.00', 1),
(159, '1', '1', 1, '1.00', 1),
(160, '1', '1', 1, '1.00', 1),
(161, '1', '1', 1, '1.00', 1),
(162, '0', '0', 0, '0.00', 0),
(163, '0', '0', 0, '0.00', 0),
(164, '0', '0', 0, '0.00', 0),
(165, '0', '0', 0, '0.00', 0),
(166, '0', '0', 0, '0.00', 0),
(167, '0', '0', 0, '0.00', 0),
(168, '0', '0', 0, '0.00', 0),
(169, '0', '0', 0, '0.00', 0),
(170, 'asdfasdf', 'asdfasd', 654, '654.00', 0),
(171, 'asdf', 'asdf', 654, '87.00', 0),
(172, 'asdfas', 'asdf', 231321, '321.00', 0),
(173, 'asfas', 'asdf', 321, '21.00', 0),
(174, 'asdf', 'asdf', 987, '987.00', 0),
(175, 'asdfasdf', 'asdf', 321, '321.00', 0),
(180, 'asdfasdf', 'asdfasdf', 0, '0.00', 0),
(182, 'dsfasdf', 'asfd', 654, '564.00', 0),
(183, 'asdf', 'asdf', 321, '321.00', 0),
(184, 'SDFASDF', 'ASFD', 2131, '123.00', 0),
(185, 'adsfasf EDITADO', 'asdf', 123, '123.00', 0),
(186, 'novo', 'novo', 666, '666.00', 0),
(187, 'ASDFAS editado', 'SADF', 123, '123.00', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `prod_desc`
--

CREATE TABLE `prod_desc` (
  `id_prod` bigint(20) UNSIGNED NOT NULL,
  `id_desc` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `prod_ext`
--

CREATE TABLE `prod_ext` (
  `id_prod` bigint(20) UNSIGNED NOT NULL,
  `id_ext` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `descontos`
--
ALTER TABLE `descontos`
  ADD PRIMARY KEY (`id_desc`);

--
-- Indexes for table `extras`
--
ALTER TABLE `extras`
  ADD PRIMARY KEY (`id_ext`);

--
-- Indexes for table `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_prod`);

--
-- Indexes for table `prod_desc`
--
ALTER TABLE `prod_desc`
  ADD PRIMARY KEY (`id_prod`,`id_desc`),
  ADD KEY `id_desc` (`id_desc`);

--
-- Indexes for table `prod_ext`
--
ALTER TABLE `prod_ext`
  ADD PRIMARY KEY (`id_prod`,`id_ext`),
  ADD KEY `id_ext` (`id_ext`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `descontos`
--
ALTER TABLE `descontos`
  MODIFY `id_desc` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `extras`
--
ALTER TABLE `extras`
  MODIFY `id_ext` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_prod` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `prod_desc`
--
ALTER TABLE `prod_desc`
  ADD CONSTRAINT `prod_desc_ibfk_1` FOREIGN KEY (`id_prod`) REFERENCES `produtos` (`id_prod`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prod_desc_ibfk_2` FOREIGN KEY (`id_desc`) REFERENCES `descontos` (`id_desc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `prod_ext`
--
ALTER TABLE `prod_ext`
  ADD CONSTRAINT `prod_ext_ibfk_1` FOREIGN KEY (`id_prod`) REFERENCES `produtos` (`id_prod`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prod_ext_ibfk_2` FOREIGN KEY (`id_ext`) REFERENCES `extras` (`id_ext`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
