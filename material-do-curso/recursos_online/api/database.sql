DROP DATABASE IF EXISTS `ajax_api`;
CREATE DATABASE IF NOT EXISTS `ajax_api`;
USE `ajax_api`;

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `comments` (`id`, `id_user`, `comment`, `created_at`) VALUES
	(1, 1, 'Este é o meu primeiro comentário nesta rede social!', '2023-03-03 00:02:25'),
	(2, 2, 'Está aí alguém?', '2023-03-03 00:02:39'),
	(3, 1, 'Eu estou aqui. Mais alguém na rede?', '2023-03-03 00:02:44'),
	(4, 4, 'Olá a todos. Qual é o assunto do dia?', '2023-03-03 00:02:49'),
	(5, 5, 'Olá amigos. O que estamos a discutir?', '2023-03-03 00:02:58'),
	(6, 1, 'O assunto de hoje é JavaScript e Ajax.', '2023-03-03 00:03:05'),
	(7, 2, 'Opa! Aí está um assunto que eu não domino.', '2023-03-03 00:03:12'),
	(8, 2, 'Eu já fiz alguns testes com Ajax, mas ainda não entendo muito bem.', '2023-03-03 00:03:19'),
	(9, 3, 'Não é muito complicado. É preciso perceber como funciona o JavaScript assíncrono.', '2023-03-03 00:03:25'),
	(10, 2, 'JavaScript assíncrono? O que é isso?', '2023-03-03 00:03:31'),
	(11, 3, 'Podes usar o JS com Promises.', '2023-03-03 00:03:45'),
	(12, 2, 'Já não estou a perceber nada.', '2023-03-03 00:04:14'),
	(13, 6, 'Boas, pessoal. Tudo bem?', '2023-03-03 00:04:32'),
	(14, 7, 'Olá.', '2023-03-03 00:04:45'),
	(15, 7, 'JavaScript é comigo mesmo.', '2023-03-03 00:05:00'),
	(16, 6, 'Também percebo umas coisas disso.', '2023-03-03 00:05:18');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `users` (`id`, `username`, `email`, `created_at`) VALUES
	(1, 'João Ribeiro', 'joao.ribeiro@gmail.com', '2023-03-01 09:30:15'),
	(2, 'Ana Santos', 'ana.santos@gmail.com', '2023-03-01 09:35:23'),
	(3, 'Carlos Oliveira', 'carlos.oliveira@gmail.com', '2023-03-01 11:32:05'),
	(4, 'Sandra Castro', 'sandra.castro@gmail.com', '2023-03-01 12:46:41'),
	(5, 'António Silva', 'antonio.silva@gmail.com', '2023-03-01 16:20:10'),
	(6, 'Isabel Guerreiro', 'isabel.guerreiro@gmail.com', '2023-03-01 17:10:06'),
	(7, 'Fernando Batista', 'fernando.batista@gmail.com', '2023-03-01 18:17:23'),
	(8, 'Márcia Costa', 'marcia.costa@gmail.com', '2023-03-01 18:25:02'),
	(9, 'Rui Marques', 'rui.marques@gmail.com', '2023-03-01 19:12:11'),
	(10, 'Marisa Gomes', 'marisa.gomes@gmail.com', '2023-03-01 20:36:18');
