
#
# TABLE STRUCTURE FOR: produtos
#

DROP TABLE IF EXISTS `produtos`;

CREATE TABLE `produtos` (
  `id_prod` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `qtd_estoque` int(11) NOT NULL DEFAULT 0,
  `preco` decimal(10,2) NOT NULL,
  `importado` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_prod`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('1', 'fkor', 'Dolore et magni a quae et cupiditate ut.', 4, '2631100.97', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('2', 'eooj', 'Aperiam est qui cupiditate inventore.', 5, '0.85', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('3', 'kgoy', 'Aut ut dolores est eos ut officia sit quod.', 1, '54558458.10', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('4', 'sddq', 'Aliquam qui odio sunt repellendus quis dolorem.', 2, '37105234.89', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('5', 'lnml', 'Et a ad molestiae ab explicabo ullam modi.', 5, '58694897.12', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('6', 'uenm', 'Reprehenderit voluptas voluptate reprehenderit aspernatur.', 8, '1.11', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('7', 'efsd', 'Ut qui sit rerum blanditiis illo.', 5, '77824.48', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('8', 'hjbw', 'Et eos neque recusandae repellat consequatur molestiae mollitia.', 5, '6596.76', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('9', 'fbtk', 'Eos numquam quibusdam ullam dicta rerum.', 8, '472898.85', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('10', 'polt', 'Fuga quis ratione facere.', 6, '66516.80', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('11', 'eutp', 'Tempora cupiditate aut quos itaque quo deserunt beatae.', 2, '625.00', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('12', 'elhc', 'Impedit nulla neque itaque vitae.', 4, '41.37', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('13', 'nubm', 'Laudantium mollitia quia omnis minima.', 7, '0.79', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('14', 'eykk', 'Qui nemo odit ut et sapiente culpa.', 9, '0.00', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('15', 'kqem', 'Voluptatem ducimus assumenda ab explicabo accusantium.', 6, '829.26', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('16', 'reob', 'Quisquam neque similique consequatur molestiae sed.', 9, '2863.69', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('17', 'mgoa', 'Ut et qui accusamus possimus ipsa cum.', 8, '647.50', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('18', 'ujju', 'Vitae dolorum nihil magnam neque.', 2, '1693.84', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('19', 'dpyp', 'Earum maxime eum temporibus quas dolor.', 4, '0.00', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('20', 'oyye', 'Nesciunt doloribus quia tenetur omnis.', 7, '0.77', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('21', 'xcfz', 'Non corporis fuga nihil quae aliquam modi et doloremque.', 4, '99999999.99', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('22', 'aigm', 'Saepe corporis qui eligendi nulla qui non ab.', 3, '99999999.99', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('23', 'asfd', 'Mollitia et nihil nulla et eveniet quia.', 9, '49628.92', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('24', 'iiyn', 'Ea perferendis occaecati qui vero magnam qui.', 4, '23378339.00', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('25', 'nche', 'Voluptatibus perferendis vel corporis.', 5, '6.00', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('26', 'zxao', 'Omnis doloribus temporibus fugiat.', 4, '249.00', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('27', 'elgg', 'Architecto doloribus aut quis hic.', 6, '2.14', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('28', 'nxci', 'Autem magni laboriosam modi.', 1, '7.36', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('29', 'yifm', 'Dignissimos laudantium ab voluptatem similique veniam et dolorem.', 9, '27332.69', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('30', 'labl', 'Nulla voluptates dolores repellendus rerum voluptatum vero sit.', 4, '85.48', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('31', 'zicp', 'Nihil vitae voluptas esse eligendi accusamus.', 9, '4.43', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('32', 'lpsj', 'Sapiente nulla voluptas nisi quia veniam commodi.', 7, '480947.60', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('33', 'kgqr', 'Reprehenderit asperiores quidem eaque delectus quo tempora et.', 8, '0.00', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('34', 'ipdc', 'Quis facere mollitia fugit culpa dicta.', 8, '37919823.09', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('35', 'gtpf', 'Eligendi rerum ex repellat nihil omnis quasi.', 4, '0.44', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('36', 'hmbh', 'Beatae tenetur officiis et enim modi ducimus non sunt.', 6, '99999999.99', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('37', 'xpad', 'Numquam fugit quo ipsam explicabo aut molestiae id corrupti.', 7, '55.98', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('38', 'ybbx', 'Fugiat dolorum minus exercitationem sint.', 3, '1141.60', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('39', 'igcb', 'Tempore beatae porro ullam qui corrupti.', 6, '478224.91', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('40', 'jhgp', 'Minus dolorem ratione dolores debitis illo ut necessitatibus molestias.', 7, '0.00', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('41', 'ohff', 'Delectus molestiae veniam quam aut eum.', 1, '2.85', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('42', 'lqzu', 'Atque qui sapiente dolor modi.', 4, '45459.49', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('43', 'btbu', 'Nam vero quisquam explicabo cumque tempora enim nam.', 5, '12376765.00', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('44', 'osis', 'Consequatur aut molestiae nobis similique.', 1, '343616.00', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('45', 'adtd', 'Possimus iste repudiandae accusantium quam iusto exercitationem.', 9, '5284738.69', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('46', 'mjxa', 'Id adipisci nam saepe magnam explicabo nam.', 4, '55722972.80', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('47', 'htbl', 'Minima eius quia odio architecto labore porro culpa.', 9, '481.79', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('48', 'jkpw', 'Doloremque non ut pariatur sint alias aut accusamus.', 9, '625739.24', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('49', 'ajmo', 'Error magnam quaerat eligendi quis nobis possimus autem.', 9, '99999999.99', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('50', 'mwyl', 'Quia ipsam quis non nemo et delectus.', 3, '5034925.86', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('51', 'xldc', 'Provident praesentium eos qui aperiam nemo repellat.', 2, '43177801.88', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('52', 'axeh', 'Illo voluptatem dolor deleniti laborum sunt ea temporibus.', 2, '847771.44', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('53', 'jpdi', 'Et sed ea officiis ab.', 1, '10056.20', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('54', 'rwyx', 'Quam ut cupiditate sit amet sed.', 1, '3292.28', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('55', 'uvoq', 'Dicta voluptatem et tempora totam.', 1, '0.74', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('56', 'gljf', 'Aspernatur officia voluptatem ratione laudantium.', 4, '6126.46', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('57', 'yffa', 'Tempore voluptatibus neque quia nemo.', 4, '23085.40', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('58', 'grjg', 'Officia et dolores aspernatur rerum cumque ut dolore sequi.', 7, '117.57', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('59', 'kzkp', 'Sit et ut asperiores consequuntur necessitatibus et.', 6, '341.96', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('60', 'iuwv', 'Rerum est officia dolorem molestiae.', 7, '2.10', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('61', 'zpaf', 'Dolores praesentium quos natus molestiae nam aut eos.', 2, '29009.08', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('62', 'kdpv', 'Vel qui et dolorem.', 1, '13356572.61', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('63', 'pzbz', 'Praesentium et tenetur quia expedita voluptate odit.', 5, '1313.24', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('64', 'nsqy', 'Amet hic voluptatibus aut impedit et.', 1, '10815481.57', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('65', 'klfj', 'Qui qui placeat ut laborum et ut excepturi voluptatibus.', 5, '1167.68', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('66', 'dbow', 'Non iste ullam veniam nostrum impedit at delectus.', 9, '39693163.77', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('67', 'ssmh', 'Qui veniam sed sit vel harum.', 7, '5.09', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('68', 'bhmz', 'Sit corporis natus id doloremque reprehenderit sequi.', 3, '298.48', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('69', 'tzvx', 'Atque provident expedita qui vero ipsa.', 4, '4292.55', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('70', 'hmzm', 'Optio vero quo rerum.', 3, '399545.12', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('71', 'dazy', 'Et quaerat quam voluptas sit accusantium rem asperiores eligendi.', 5, '0.00', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('72', 'avyu', 'Sit nesciunt amet amet ut.', 1, '99999999.99', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('73', 'ijru', 'Vel consequuntur est et odit accusamus.', 8, '32809249.41', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('74', 'cfcf', 'Ratione nemo dolores delectus labore.', 6, '107732.22', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('75', 'ehtl', 'Illo dolor optio ut doloribus aperiam illum.', 8, '243.07', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('76', 'mgnh', 'Velit magnam quo enim quibusdam deserunt.', 3, '14535490.48', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('77', 'payc', 'Eos veritatis id tempora incidunt quidem nesciunt.', 4, '465935.29', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('78', 'tjsy', 'Molestiae minima vitae aut autem.', 9, '7154652.90', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('79', 'hjna', 'Mollitia ratione voluptas ut qui atque.', 8, '11266.57', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('80', 'esxe', 'Eveniet totam minima excepturi consequatur blanditiis.', 7, '99999999.99', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('81', 'qfmo', 'Repellat facere et sed magni facilis ducimus modi.', 3, '1.34', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('82', 'oxoj', 'Quo facilis distinctio nostrum blanditiis.', 9, '37538423.18', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('83', 'ytgu', 'Dolor dolorum saepe alias vero.', 2, '0.00', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('84', 'nwoe', 'Totam nesciunt dignissimos libero rerum nihil quo id.', 8, '0.00', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('85', 'apgr', 'Libero deleniti hic distinctio et.', 9, '0.00', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('86', 'bacd', 'Sunt fugiat cupiditate dolorum voluptatem provident velit ut optio.', 6, '207825.00', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('87', 'mqix', 'Delectus sunt quo eius a.', 1, '0.00', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('88', 'qxht', 'Itaque consequatur alias sunt et.', 7, '86255.98', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('89', 'itgy', 'Laboriosam expedita sint iste voluptatibus.', 6, '20316.56', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('90', 'anqg', 'Enim totam est aut qui.', 9, '21.35', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('91', 'fcst', 'Aspernatur molestiae et dignissimos debitis quas et tempora.', 6, '470033.50', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('92', 'iptk', 'Tempora quia suscipit quibusdam molestias voluptas nostrum.', 8, '2257.03', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('93', 'sztx', 'Qui est ipsum repudiandae est enim magnam consequatur.', 2, '2471424.07', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('94', 'agmz', 'Qui et et dolor sapiente.', 9, '30072.39', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('95', 'fiwo', 'Animi modi sapiente sed ducimus.', 6, '36568727.99', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('96', 'tybg', 'Delectus fugiat dolorem aut quidem aut laboriosam.', 6, '0.00', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('97', 'rusg', 'Error ab incidunt quasi culpa quidem nulla iste.', 7, '4830.01', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('98', 'oxjx', 'Qui ad minima aliquam quam praesentium debitis.', 6, '105.85', 1);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('99', 'cfmm', 'Rem ab omnis et saepe quae illo illo.', 9, '3584177.00', 0);
INSERT INTO `produtos` (`id_prod`, `nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) VALUES ('100', 'uwtd', 'Dolores molestiae quis similique numquam autem.', 5, '7.69', 1);

#
# TABLE STRUCTURE FOR: descontos
#

DROP TABLE IF EXISTS `descontos`;

CREATE TABLE `descontos` (
  `id_desc` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `taxa` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `descontos` (`id_desc`, `descricao`, `taxa`) VALUES ('1', 'esse', '0.00');
INSERT INTO `descontos` (`id_desc`, `descricao`, `taxa`) VALUES ('2', 'velit', '0.00');
INSERT INTO `descontos` (`id_desc`, `descricao`, `taxa`) VALUES ('3', 'hic', '0.00');
INSERT INTO `descontos` (`id_desc`, `descricao`, `taxa`) VALUES ('4', 'qui', '0.00');


#
# TABLE STRUCTURE FOR: extras
#

DROP TABLE IF EXISTS `extras`;

CREATE TABLE `extras` (
  `id_ext` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_ext`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `extras` (`id_ext`, `descricao`) VALUES ('1', 'cumque');
INSERT INTO `extras` (`id_ext`, `descricao`) VALUES ('2', 'accusamus');
INSERT INTO `extras` (`id_ext`, `descricao`) VALUES ('3', 'veniam');
INSERT INTO `extras` (`id_ext`, `descricao`) VALUES ('4', 'sint');


#
# TABLE STRUCTURE FOR: prod_desc
#

DROP TABLE IF EXISTS `prod_desc`;

CREATE TABLE `prod_desc` (
  `id_prod` bigint(20) unsigned NOT NULL,
  `id_desc` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_prod`,`id_desc`),
  KEY `id_desc` (`id_desc`),
  CONSTRAINT `prod_desc_ibfk_1` FOREIGN KEY (`id_prod`) REFERENCES `produtos` (`id_prod`),
  CONSTRAINT `prod_desc_ibfk_2` FOREIGN KEY (`id_desc`) REFERENCES `descontos` (`id_desc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('1', '1');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('1', '2');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('1', '3');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('1', '4');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('2', '1');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('2', '2');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('2', '4');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('3', '1');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('3', '3');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('3', '4');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('4', '2');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('4', '3');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('4', '4');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('5', '1');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('5', '3');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('6', '1');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('6', '2');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('6', '3');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('6', '4');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('7', '1');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('7', '2');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('7', '3');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('8', '1');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('8', '2');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('8', '4');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('9', '2');
INSERT INTO `prod_desc` (`id_prod`, `id_desc`) VALUES ('9', '4');


#
# TABLE STRUCTURE FOR: prod_ext
#

DROP TABLE IF EXISTS `prod_ext`;

CREATE TABLE `prod_ext` (
  `id_prod` bigint(20) unsigned NOT NULL,
  `id_ext` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id_prod`,`id_ext`),
  KEY `id_ext` (`id_ext`),
  CONSTRAINT `prod_ext_ibfk_1` FOREIGN KEY (`id_prod`) REFERENCES `produtos` (`id_prod`),
  CONSTRAINT `prod_ext_ibfk_2` FOREIGN KEY (`id_ext`) REFERENCES `extras` (`id_ext`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `prod_ext` (`id_prod`, `id_ext`) VALUES ('1', '2');
INSERT INTO `prod_ext` (`id_prod`, `id_ext`) VALUES ('1', '3');
INSERT INTO `prod_ext` (`id_prod`, `id_ext`) VALUES ('2', '2');
INSERT INTO `prod_ext` (`id_prod`, `id_ext`) VALUES ('2', '3');
INSERT INTO `prod_ext` (`id_prod`, `id_ext`) VALUES ('2', '4');
INSERT INTO `prod_ext` (`id_prod`, `id_ext`) VALUES ('3', '1');
INSERT INTO `prod_ext` (`id_prod`, `id_ext`) VALUES ('3', '2');
INSERT INTO `prod_ext` (`id_prod`, `id_ext`) VALUES ('3', '3');
INSERT INTO `prod_ext` (`id_prod`, `id_ext`) VALUES ('4', '3');
INSERT INTO `prod_ext` (`id_prod`, `id_ext`) VALUES ('4', '4');
INSERT INTO `prod_ext` (`id_prod`, `id_ext`) VALUES ('5', '1');
INSERT INTO `prod_ext` (`id_prod`, `id_ext`) VALUES ('5', '2');
INSERT INTO `prod_ext` (`id_prod`, `id_ext`) VALUES ('6', '2');
INSERT INTO `prod_ext` (`id_prod`, `id_ext`) VALUES ('6', '3');
INSERT INTO `prod_ext` (`id_prod`, `id_ext`) VALUES ('6', '4');
INSERT INTO `prod_ext` (`id_prod`, `id_ext`) VALUES ('7', '2');
INSERT INTO `prod_ext` (`id_prod`, `id_ext`) VALUES ('7', '3');
INSERT INTO `prod_ext` (`id_prod`, `id_ext`) VALUES ('7', '4');
INSERT INTO `prod_ext` (`id_prod`, `id_ext`) VALUES ('8', '2');
INSERT INTO `prod_ext` (`id_prod`, `id_ext`) VALUES ('8', '4');
INSERT INTO `prod_ext` (`id_prod`, `id_ext`) VALUES ('9', '1');
INSERT INTO `prod_ext` (`id_prod`, `id_ext`) VALUES ('9', '2');
INSERT INTO `prod_ext` (`id_prod`, `id_ext`) VALUES ('9', '4');




