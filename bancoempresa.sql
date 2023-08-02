-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02/08/2023 às 02:16
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bancoempresa`
--
CREATE DATABASE IF NOT EXISTS `bancoempresa` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bancoempresa`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add vaga', 7, 'add_vaga'),
(26, 'Can change vaga', 7, 'change_vaga'),
(27, 'Can delete vaga', 7, 'delete_vaga'),
(28, 'Can view vaga', 7, 'view_vaga'),
(29, 'Can add candidato', 8, 'add_candidato'),
(30, 'Can change candidato', 8, 'change_candidato'),
(31, 'Can delete candidato', 8, 'delete_candidato'),
(32, 'Can view candidato', 8, 'view_candidato'),
(33, 'Can add vaga_candidato', 9, 'add_vaga_candidato'),
(34, 'Can change vaga_candidato', 9, 'change_vaga_candidato'),
(35, 'Can delete vaga_candidato', 9, 'delete_vaga_candidato'),
(36, 'Can view vaga_candidato', 9, 'view_vaga_candidato'),
(37, 'Can add empresa', 10, 'add_empresa'),
(38, 'Can change empresa', 10, 'change_empresa'),
(39, 'Can delete empresa', 10, 'delete_empresa'),
(40, 'Can view empresa', 10, 'view_empresa');

-- --------------------------------------------------------

--
-- Estrutura para tabela `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$600000$1lI5p7x5NEc16z4EECScIY$mIkZ4QqHMFnxUA2Ns0JTMDUtZx2QgGwUs4xvlfnNcP4=', '2023-07-29 15:37:14.215477', 1, 'SuperUser', '', '', 'SuperUser@gmail.com', 1, 1, '2023-07-29 15:36:43.928451');

-- --------------------------------------------------------

--
-- Estrutura para tabela `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `core_candidato`
--

CREATE TABLE `core_candidato` (
  `id` bigint(20) NOT NULL,
  `data_criado` date NOT NULL,
  `data_modificado` date NOT NULL,
  `nome_candidato` varchar(100) NOT NULL,
  `experiencia_candidato` varchar(10000) NOT NULL,
  `email_candidato` varchar(254) NOT NULL,
  `senha_candidato` varchar(100) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  `pretensao_salarial` varchar(14) NOT NULL,
  `escolaridade` varchar(17) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `core_candidato`
--

INSERT INTO `core_candidato` (`id`, `data_criado`, `data_modificado`, `nome_candidato`, `experiencia_candidato`, `email_candidato`, `senha_candidato`, `last_login`, `password`, `pretensao_salarial`, `escolaridade`) VALUES
(8, '2023-08-01', '2023-08-01', 'João Vitor Carvalho Silva', 'Free-Lancer durante 6 meses', 'joao@gmail.com', 'joao', '2023-08-01 22:47:26.491359', '', '1000_a_2000', 'ensino_superior');

-- --------------------------------------------------------

--
-- Estrutura para tabela `core_empresa`
--

CREATE TABLE `core_empresa` (
  `id` bigint(20) NOT NULL,
  `data_criado` date NOT NULL,
  `data_modificado` date NOT NULL,
  `nome_empresa` varchar(100) NOT NULL,
  `email_empresa` varchar(254) NOT NULL,
  `senha_empresa` varchar(100) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `core_empresa`
--

INSERT INTO `core_empresa` (`id`, `data_criado`, `data_modificado`, `nome_empresa`, `email_empresa`, `senha_empresa`, `last_login`, `password`) VALUES
(1, '2023-07-29', '2023-07-29', 'JobConvo', 'no-reply@jobConvoDominio.com.br', '123', '2023-08-01 22:48:01.851967', '1');

-- --------------------------------------------------------

--
-- Estrutura para tabela `core_vaga`
--

CREATE TABLE `core_vaga` (
  `id` bigint(20) NOT NULL,
  `data_criado` date NOT NULL,
  `data_modificado` date NOT NULL,
  `nome_vaga` varchar(200) NOT NULL,
  `faixa_salarial` varchar(14) NOT NULL,
  `requisitos` varchar(10000) NOT NULL,
  `escolaridade` varchar(17) NOT NULL,
  `empresa_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `core_vaga`
--

INSERT INTO `core_vaga` (`id`, `data_criado`, `data_modificado`, `nome_vaga`, `faixa_salarial`, `requisitos`, `escolaridade`, `empresa_id`) VALUES
(1, '2023-07-12', '2023-07-31', 'Estágio básico', '1000_a_2000', 'Tudo', 'ensino_superior', 1),
(5, '2023-07-31', '2023-07-31', 'Estagiário de TI', '1000_a_2000', 'Curso técnico, sem experiência Lorem ipsum dolor, sit amet consectetur adipisicing elit. Temporibus, expedita iusto veniam atque, magni tempora mollitia dolorum consequatur nulla, neque debitis eos reprehenderit quasi ab ipsum nisi dolorem modi. Quos?', 'tecnologo', 1),
(6, '2023-08-01', '2023-08-01', 'Programador', 'até_1000', 'Nenhum', 'tecnologo', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `core_vaga_candidato`
--

CREATE TABLE `core_vaga_candidato` (
  `id` bigint(20) NOT NULL,
  `data_criado` date NOT NULL,
  `data_modificado` date NOT NULL,
  `candidato_id` bigint(20) NOT NULL,
  `vaga_id` bigint(20) NOT NULL,
  `pontos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `core_vaga_candidato`
--

INSERT INTO `core_vaga_candidato` (`id`, `data_criado`, `data_modificado`, `candidato_id`, `vaga_id`, `pontos`) VALUES
(47, '2023-08-01', '2023-08-01', 8, 5, 1),
(48, '2023-08-01', '2023-08-01', 8, 6, 0),
(50, '2023-08-01', '2023-08-01', 8, 1, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-07-29 15:37:49.800800', '1', 'JobConvo', 1, '[{\"added\": {}}]', 10, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'core', 'candidato'),
(10, 'core', 'empresa'),
(7, 'core', 'vaga'),
(9, 'core', 'vaga_candidato'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estrutura para tabela `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-07-28 17:44:27.989713'),
(2, 'auth', '0001_initial', '2023-07-28 17:44:29.116562'),
(3, 'admin', '0001_initial', '2023-07-28 17:44:29.415765'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-07-28 17:44:29.429557'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-07-28 17:44:29.444518'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-07-28 17:44:29.876278'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-07-28 17:44:30.231329'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-07-28 17:44:30.372516'),
(9, 'auth', '0004_alter_user_username_opts', '2023-07-28 17:44:30.442450'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-07-28 17:44:30.783090'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-07-28 17:44:30.836512'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-07-28 17:44:30.875400'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-07-28 17:44:30.989404'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-07-28 17:44:31.121067'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-07-28 17:44:31.244684'),
(16, 'auth', '0011_update_proxy_permissions', '2023-07-28 17:44:31.294445'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-07-28 17:44:31.403436'),
(18, 'sessions', '0001_initial', '2023-07-28 17:44:31.568434'),
(19, 'core', '0001_initial', '2023-07-28 18:39:50.499044'),
(20, 'core', '0002_remove_candidato_data_ativo_and_more', '2023-07-28 18:41:00.389214'),
(21, 'core', '0003_alter_vaga_escolaridade_alter_vaga_faixa_salarial', '2023-07-29 15:50:09.307358'),
(22, 'core', '0004_alter_candidato_email_candidato_and_more', '2023-07-30 21:17:12.649814'),
(23, 'core', '0005_empresa_last_login_empresa_password', '2023-07-31 17:32:00.261234'),
(24, 'core', '0006_remove_empresa_last_login_remove_empresa_password', '2023-07-31 17:35:25.073266'),
(25, 'core', '0007_empresa_last_login_empresa_password', '2023-07-31 17:36:48.769775'),
(26, 'core', '0008_candidato_last_login_candidato_password', '2023-08-01 01:20:55.214805'),
(27, 'core', '0009_alter_vaga_candidato_unique_together', '2023-08-01 01:49:54.939237'),
(28, 'core', '0010_vaga_candidato_pontos', '2023-08-01 02:55:59.199046'),
(29, 'core', '0011_candidato_pretensao_salarial', '2023-08-01 03:02:19.314978'),
(30, 'core', '0012_candidato_escolaridade', '2023-08-01 03:02:19.363699'),
(31, 'core', '0013_alter_candidato_pretensao_salarial', '2023-08-01 19:44:56.550515');

-- --------------------------------------------------------

--
-- Estrutura para tabela `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('3noja6eji77casaknw5w5rc0amy08dac', 'e30:1qQe65:cS-2V1S46D1BmUZCqqGDxiNLTKykWTh-4FWkdZp7GWw', '2023-08-15 01:22:49.497947'),
('9rot9nyk82fjkp4rh2b5b6t4m3w77flw', 'e30:1qQe7A:cIraLoqDMZBf2VhpHqcRGrRb9Tx-jflgtr3A4JWPvPQ', '2023-08-15 01:23:56.199648'),
('cw424nvuq4kxpc1i0hcep60is28k6iiv', 'e30:1qQe8Q:UIrFbxxqtyab4HERR9ToWDGaYawSIPgKijS73d49_Gc', '2023-08-15 01:25:14.672917'),
('eb7stdsw6nzd8w24n03j9lysviihsfah', 'e30:1qQWgP:QsNunHHnwW-sxT6oQAnCURpPOOgfrgu58PU8VjLMGE8', '2023-08-14 17:27:49.644093'),
('okzedvtmusiafjehqtn0h0zjelaibbc0', 'e30:1qQWh3:IAFkpqVGgOclyslNOu50eOz6Mb7Vm8FF49O8QuSiKtU', '2023-08-14 17:28:29.866004');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Índices de tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Índices de tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Índices de tabela `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Índices de tabela `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Índices de tabela `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Índices de tabela `core_candidato`
--
ALTER TABLE `core_candidato`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `core_candidato_email_candidato_946bfb97_uniq` (`email_candidato`);

--
-- Índices de tabela `core_empresa`
--
ALTER TABLE `core_empresa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `core_empresa_email_empresa_7b6f7db6_uniq` (`email_empresa`);

--
-- Índices de tabela `core_vaga`
--
ALTER TABLE `core_vaga`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_vaga_empresa_id_a18f3fbe_fk_core_empresa_id` (`empresa_id`);

--
-- Índices de tabela `core_vaga_candidato`
--
ALTER TABLE `core_vaga_candidato`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `core_vaga_candidato_vaga_id_candidato_id_f62a8fca_uniq` (`vaga_id`,`candidato_id`),
  ADD KEY `core_vaga_candidato_candidato_id_d7c8bfd3_fk_core_candidato_id` (`candidato_id`);

--
-- Índices de tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Índices de tabela `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Índices de tabela `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `core_candidato`
--
ALTER TABLE `core_candidato`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `core_empresa`
--
ALTER TABLE `core_empresa`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `core_vaga`
--
ALTER TABLE `core_vaga`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `core_vaga_candidato`
--
ALTER TABLE `core_vaga_candidato`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de tabela `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Restrições para tabelas `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Restrições para tabelas `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Restrições para tabelas `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Restrições para tabelas `core_vaga`
--
ALTER TABLE `core_vaga`
  ADD CONSTRAINT `core_vaga_empresa_id_a18f3fbe_fk_core_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `core_empresa` (`id`);

--
-- Restrições para tabelas `core_vaga_candidato`
--
ALTER TABLE `core_vaga_candidato`
  ADD CONSTRAINT `core_vaga_candidato_candidato_id_d7c8bfd3_fk_core_candidato_id` FOREIGN KEY (`candidato_id`) REFERENCES `core_candidato` (`id`),
  ADD CONSTRAINT `core_vaga_candidato_vaga_id_407bf01b_fk_core_vaga_id` FOREIGN KEY (`vaga_id`) REFERENCES `core_vaga` (`id`);

--
-- Restrições para tabelas `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
