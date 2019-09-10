-- Generation time: Sun, 08 Sep 2019 04:16:05 +0000
-- Host: mysql.hostinger.ro
-- DB name: u574849695_24
/*!40030 SET NAMES UTF8 */;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

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

INSERT INTO `produtos` VALUES ('1','fkor','Dolore et magni a quae et cupiditate ut.','4','2631100.97','0'),
('2','eooj','Aperiam est qui cupiditate inventore.','5','0.85','0'),
('3','kgoy','Aut ut dolores est eos ut officia sit quod.','1','54558458.10','1'),
('4','sddq','Aliquam qui odio sunt repellendus quis dolorem.','2','37105234.89','1'),
('5','lnml','Et a ad molestiae ab explicabo ullam modi.','5','58694897.12','1'),
('6','uenm','Reprehenderit voluptas voluptate reprehenderit aspernatur.','8','1.11','0'),
('7','efsd','Ut qui sit rerum blanditiis illo.','5','77824.48','1'),
('8','hjbw','Et eos neque recusandae repellat consequatur molestiae mollitia.','5','6596.76','0'),
('9','fbtk','Eos numquam quibusdam ullam dicta rerum.','8','472898.85','0'),
('10','polt','Fuga quis ratione facere.','6','66516.80','1'),
('11','eutp','Tempora cupiditate aut quos itaque quo deserunt beatae.','2','625.00','1'),
('12','elhc','Impedit nulla neque itaque vitae.','4','41.37','1'),
('13','nubm','Laudantium mollitia quia omnis minima.','7','0.79','1'),
('14','eykk','Qui nemo odit ut et sapiente culpa.','9','0.00','1'),
('15','kqem','Voluptatem ducimus assumenda ab explicabo accusantium.','6','829.26','1'),
('16','reob','Quisquam neque similique consequatur molestiae sed.','9','2863.69','0'),
('17','mgoa','Ut et qui accusamus possimus ipsa cum.','8','647.50','0'),
('18','ujju','Vitae dolorum nihil magnam neque.','2','1693.84','0'),
('19','dpyp','Earum maxime eum temporibus quas dolor.','4','0.00','0'),
('20','oyye','Nesciunt doloribus quia tenetur omnis.','7','0.77','1'),
('21','xcfz','Non corporis fuga nihil quae aliquam modi et doloremque.','4','99999999.99','0'),
('22','aigm','Saepe corporis qui eligendi nulla qui non ab.','3','99999999.99','1'),
('23','asfd','Mollitia et nihil nulla et eveniet quia.','9','49628.92','1'),
('24','iiyn','Ea perferendis occaecati qui vero magnam qui.','4','23378339.00','0'),
('25','nche','Voluptatibus perferendis vel corporis.','5','6.00','1'),
('26','zxao','Omnis doloribus temporibus fugiat.','4','249.00','1'),
('27','elgg','Architecto doloribus aut quis hic.','6','2.14','1'),
('28','nxci','Autem magni laboriosam modi.','1','7.36','1'),
('29','yifm','Dignissimos laudantium ab voluptatem similique veniam et dolorem.','9','27332.69','0'),
('30','labl','Nulla voluptates dolores repellendus rerum voluptatum vero sit.','4','85.48','1'),
('31','zicp','Nihil vitae voluptas esse eligendi accusamus.','9','4.43','0'),
('32','lpsj','Sapiente nulla voluptas nisi quia veniam commodi.','7','480947.60','0'),
('33','kgqr','Reprehenderit asperiores quidem eaque delectus quo tempora et.','8','0.00','1'),
('34','ipdc','Quis facere mollitia fugit culpa dicta.','8','37919823.09','0'),
('35','gtpf','Eligendi rerum ex repellat nihil omnis quasi.','4','0.44','0'),
('36','hmbh','Beatae tenetur officiis et enim modi ducimus non sunt.','6','99999999.99','1'),
('37','xpad','Numquam fugit quo ipsam explicabo aut molestiae id corrupti.','7','55.98','0'),
('38','ybbx','Fugiat dolorum minus exercitationem sint.','3','1141.60','1'),
('39','igcb','Tempore beatae porro ullam qui corrupti.','6','478224.91','0'),
('40','jhgp','Minus dolorem ratione dolores debitis illo ut necessitatibus molestias.','7','0.00','0'),
('41','ohff','Delectus molestiae veniam quam aut eum.','1','2.85','0'),
('42','lqzu','Atque qui sapiente dolor modi.','4','45459.49','1'),
('43','btbu','Nam vero quisquam explicabo cumque tempora enim nam.','5','12376765.00','1'),
('44','osis','Consequatur aut molestiae nobis similique.','1','343616.00','1'),
('45','adtd','Possimus iste repudiandae accusantium quam iusto exercitationem.','9','5284738.69','0'),
('46','mjxa','Id adipisci nam saepe magnam explicabo nam.','4','55722972.80','0'),
('47','htbl','Minima eius quia odio architecto labore porro culpa.','9','481.79','1'),
('48','jkpw','Doloremque non ut pariatur sint alias aut accusamus.','9','625739.24','1'),
('49','ajmo','Error magnam quaerat eligendi quis nobis possimus autem.','9','99999999.99','0'),
('50','mwyl','Quia ipsam quis non nemo et delectus.','3','5034925.86','0'),
('51','xldc','Provident praesentium eos qui aperiam nemo repellat.','2','43177801.88','1'),
('52','axeh','Illo voluptatem dolor deleniti laborum sunt ea temporibus.','2','847771.44','1'),
('53','jpdi','Et sed ea officiis ab.','1','10056.20','1'),
('54','rwyx','Quam ut cupiditate sit amet sed.','1','3292.28','1'),
('55','uvoq','Dicta voluptatem et tempora totam.','1','0.74','1'),
('56','gljf','Aspernatur officia voluptatem ratione laudantium.','4','6126.46','1'),
('57','yffa','Tempore voluptatibus neque quia nemo.','4','23085.40','0'),
('58','grjg','Officia et dolores aspernatur rerum cumque ut dolore sequi.','7','117.57','1'),
('59','kzkp','Sit et ut asperiores consequuntur necessitatibus et.','6','341.96','0'),
('60','iuwv','Rerum est officia dolorem molestiae.','7','2.10','0'),
('61','zpaf','Dolores praesentium quos natus molestiae nam aut eos.','2','29009.08','1'),
('62','kdpv','Vel qui et dolorem.','1','13356572.61','0'),
('63','pzbz','Praesentium et tenetur quia expedita voluptate odit.','5','1313.24','1'),
('64','nsqy','Amet hic voluptatibus aut impedit et.','1','10815481.57','0'),
('65','klfj','Qui qui placeat ut laborum et ut excepturi voluptatibus.','5','1167.68','1'),
('66','dbow','Non iste ullam veniam nostrum impedit at delectus.','9','39693163.77','1'),
('67','ssmh','Qui veniam sed sit vel harum.','7','5.09','1'),
('68','bhmz','Sit corporis natus id doloremque reprehenderit sequi.','3','298.48','1'),
('69','tzvx','Atque provident expedita qui vero ipsa.','4','4292.55','0'),
('70','hmzm','Optio vero quo rerum.','3','399545.12','1'),
('71','dazy','Et quaerat quam voluptas sit accusantium rem asperiores eligendi.','5','0.00','0'),
('72','avyu','Sit nesciunt amet amet ut.','1','99999999.99','0'),
('73','ijru','Vel consequuntur est et odit accusamus.','8','32809249.41','1'),
('74','cfcf','Ratione nemo dolores delectus labore.','6','107732.22','1'),
('75','ehtl','Illo dolor optio ut doloribus aperiam illum.','8','243.07','0'),
('76','mgnh','Velit magnam quo enim quibusdam deserunt.','3','14535490.48','1'),
('77','payc','Eos veritatis id tempora incidunt quidem nesciunt.','4','465935.29','1'),
('78','tjsy','Molestiae minima vitae aut autem.','9','7154652.90','0'),
('79','hjna','Mollitia ratione voluptas ut qui atque.','8','11266.57','1'),
('80','esxe','Eveniet totam minima excepturi consequatur blanditiis.','7','99999999.99','1'),
('81','qfmo','Repellat facere et sed magni facilis ducimus modi.','3','1.34','0'),
('82','oxoj','Quo facilis distinctio nostrum blanditiis.','9','37538423.18','0'),
('83','ytgu','Dolor dolorum saepe alias vero.','2','0.00','0'),
('84','nwoe','Totam nesciunt dignissimos libero rerum nihil quo id.','8','0.00','0'),
('85','apgr','Libero deleniti hic distinctio et.','9','0.00','0'),
('86','bacd','Sunt fugiat cupiditate dolorum voluptatem provident velit ut optio.','6','207825.00','1'),
('87','mqix','Delectus sunt quo eius a.','1','0.00','0'),
('88','qxht','Itaque consequatur alias sunt et.','7','86255.98','1'),
('89','itgy','Laboriosam expedita sint iste voluptatibus.','6','20316.56','0'),
('90','anqg','Enim totam est aut qui.','9','21.35','1'),
('91','fcst','Aspernatur molestiae et dignissimos debitis quas et tempora.','6','470033.50','0'),
('92','iptk','Tempora quia suscipit quibusdam molestias voluptas nostrum.','8','2257.03','1'),
('93','sztx','Qui est ipsum repudiandae est enim magnam consequatur.','2','2471424.07','1'),
('94','agmz','Qui et et dolor sapiente.','9','30072.39','0'),
('95','fiwo','Animi modi sapiente sed ducimus.','6','36568727.99','1'),
('96','tybg','Delectus fugiat dolorem aut quidem aut laboriosam.','6','0.00','0'),
('97','rusg','Error ab incidunt quasi culpa quidem nulla iste.','7','4830.01','0'),
('98','oxjx','Qui ad minima aliquam quam praesentium debitis.','6','105.85','1'),
('99','cfmm','Rem ab omnis et saepe quae illo illo.','9','3584177.00','0'),
('100','uwtd','Dolores molestiae quis similique numquam autem.','5','7.69','1'); 




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

