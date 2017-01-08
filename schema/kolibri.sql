-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-01-2017 a las 21:04:54
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `kolibri`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activity`
--

CREATE TABLE `activity` (
  `id` int(11) NOT NULL,
  `class` varchar(100) NOT NULL,
  `module` varchar(100) DEFAULT '',
  `object_model` varchar(100) DEFAULT '',
  `object_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `activity`
--

INSERT INTO `activity` (`id`, `class`, `module`, `object_model`, `object_id`) VALUES
(1, 'humhub\\modules\\space\\activities\\Created', 'space', 'humhub\\modules\\space\\models\\Space', 1),
(2, 'humhub\\modules\\content\\activities\\ContentCreated', 'content', 'humhub\\modules\\post\\models\\Post', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `message` text,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `guid` varchar(45) NOT NULL,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `visibility` tinyint(4) DEFAULT NULL,
  `sticked` tinyint(4) DEFAULT NULL,
  `archived` tinytext,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `content`
--

INSERT INTO `content` (`id`, `guid`, `object_model`, `object_id`, `visibility`, `sticked`, `archived`, `created_at`, `created_by`, `updated_at`, `updated_by`, `contentcontainer_id`) VALUES
(1, 'e6d74134-3262-4874-91eb-7252faa054b1', 'humhub\\modules\\activity\\models\\Activity', 1, 1, 0, '0', '2017-01-08 13:00:36', 1, '2017-01-08 13:00:36', 1, 2),
(2, 'c24136fc-c55f-42f6-a6dc-64ed7c7644f5', 'humhub\\modules\\post\\models\\Post', 1, 1, 0, '0', '2017-01-08 13:00:36', 1, '2017-01-08 13:00:36', 1, 2),
(3, '8c27ccce-4ac7-4ecb-bcdd-f8e04bb39960', 'humhub\\modules\\activity\\models\\Activity', 2, 1, 0, '0', '2017-01-08 13:00:36', 1, '2017-01-08 13:00:36', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contentcontainer`
--

CREATE TABLE `contentcontainer` (
  `id` int(11) NOT NULL,
  `guid` varchar(255) DEFAULT NULL,
  `class` varchar(255) DEFAULT NULL,
  `pk` int(11) DEFAULT NULL,
  `owner_user_id` int(11) DEFAULT NULL,
  `wall_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `contentcontainer`
--

INSERT INTO `contentcontainer` (`id`, `guid`, `class`, `pk`, `owner_user_id`, `wall_id`) VALUES
(1, '33469b80-5abd-4039-be55-fadcc62ddc68', 'humhub\\modules\\user\\models\\User', 1, 1, 1),
(2, '9aaa2538-02df-4f8f-9aac-ccfd2be6b7e7', 'humhub\\modules\\space\\models\\Space', 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contentcontainer_permission`
--

CREATE TABLE `contentcontainer_permission` (
  `permission_id` varchar(150) NOT NULL,
  `contentcontainer_id` int(11) NOT NULL,
  `group_id` varchar(50) NOT NULL,
  `module_id` varchar(50) NOT NULL,
  `class` varchar(255) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contentcontainer_setting`
--

CREATE TABLE `contentcontainer_setting` (
  `id` int(11) NOT NULL,
  `module_id` varchar(50) NOT NULL,
  `contentcontainer_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `contentcontainer_setting`
--

INSERT INTO `contentcontainer_setting` (`id`, `module_id`, `contentcontainer_id`, `name`, `value`) VALUES
(1, 'tour', 1, 'welcome', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `file`
--

CREATE TABLE `file` (
  `id` int(11) NOT NULL,
  `guid` varchar(45) DEFAULT NULL,
  `object_model` varchar(100) DEFAULT '',
  `object_id` varchar(100) DEFAULT '',
  `file_name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `mime_type` varchar(150) DEFAULT NULL,
  `size` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group`
--

CREATE TABLE `group` (
  `id` int(11) NOT NULL,
  `space_id` int(10) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_dn` varchar(255) DEFAULT NULL,
  `is_admin_group` tinyint(1) NOT NULL DEFAULT '0',
  `show_at_registration` tinyint(1) NOT NULL DEFAULT '1',
  `show_at_directory` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `group`
--

INSERT INTO `group` (`id`, `space_id`, `name`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`, `ldap_dn`, `is_admin_group`, `show_at_registration`, `show_at_directory`) VALUES
(1, NULL, 'Administrator', 'Administrator Group', '2017-01-08 12:58:18', NULL, NULL, NULL, NULL, 1, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group_permission`
--

CREATE TABLE `group_permission` (
  `permission_id` varchar(150) NOT NULL,
  `group_id` int(11) NOT NULL,
  `module_id` varchar(50) NOT NULL,
  `class` varchar(255) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group_user`
--

CREATE TABLE `group_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `is_group_manager` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `group_user`
--

INSERT INTO `group_user` (`id`, `user_id`, `group_id`, `is_group_manager`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 1, 1, 0, '2017-01-08 13:00:34', NULL, '2017-01-08 13:00:34', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `like`
--

CREATE TABLE `like` (
  `id` int(11) NOT NULL,
  `target_user_id` int(11) DEFAULT NULL,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE `log` (
  `id` bigint(20) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_time` double DEFAULT NULL,
  `prefix` text COLLATE utf8_unicode_ci,
  `message` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `log`
--

INSERT INTO `log` (`id`, `level`, `category`, `log_time`, `prefix`, `message`) VALUES
(1, 1, 'yii\\base\\ErrorException:1', 1483905548.7541, '[::1][-][im7t3tqhkm80qg1fgdujbd70r4]', 'exception ''yii\\base\\ErrorException'' with message ''Maximum execution time of 30 seconds exceeded'' in C:\\xampp\\htdocs\\Kolibri\\protected\\vendor\\yiisoft\\yii2\\db\\Command.php:845\nStack trace:\n#0 [internal function]: yii\\base\\ErrorHandler->handleFatalError()\n#1 {main}'),
(2, 4, 'application', 1483905517.9874, '[::1][-][im7t3tqhkm80qg1fgdujbd70r4]', '$_GET = [\n    ''r'' => ''installer/config/index''\n]\n\n$_SERVER = [\n    ''MIBDIRS'' => ''C:/xampp/php/extras/mibs''\n    ''MYSQL_HOME'' => ''\\\\xampp\\\\mysql\\\\bin''\n    ''OPENSSL_CONF'' => ''C:/xampp/apache/bin/openssl.cnf''\n    ''PHP_PEAR_SYSCONF_DIR'' => ''\\\\xampp\\\\php''\n    ''PHPRC'' => ''\\\\xampp\\\\php''\n    ''TMP'' => ''\\\\xampp\\\\tmp''\n    ''HTTP_HOST'' => ''localhost''\n    ''HTTP_CONNECTION'' => ''keep-alive''\n    ''HTTP_CACHE_CONTROL'' => ''max-age=0''\n    ''HTTP_UPGRADE_INSECURE_REQUESTS'' => ''1''\n    ''HTTP_USER_AGENT'' => ''Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36''\n    ''HTTP_ACCEPT'' => ''text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8''\n    ''HTTP_REFERER'' => ''http://localhost/Kolibri/index.php?r=installer%2Fsetup%2Fdatabase''\n    ''HTTP_ACCEPT_ENCODING'' => ''gzip, deflate, sdch, br''\n    ''HTTP_ACCEPT_LANGUAGE'' => ''es-419,es;q=0.8,en;q=0.6''\n    ''HTTP_COOKIE'' => ''pm_getting-started-panel=expanded; PHPSESSID=im7t3tqhkm80qg1fgdujbd70r4; _identity=1a4e18c94870a330d8306e771390cedebab5e09b8eca9eac2319697de647ba1ba%3A2%3A%7Bi%3A0%3Bs%3A9%3A%22_identity%22%3Bi%3A1%3Bs%3A50%3A%22%5B1%2C%2281c0dc8b-b386-4144-87a7-b05b8a390301%22%2C2592000%5D%22%3B%7D; _csrf=e39bf036088ac1b1bf2081d0f5bd1e8befd1ec47ed18d28251a677f48b4d902ba%3A2%3A%7Bi%3A0%3Bs%3A5%3A%22_csrf%22%3Bi%3A1%3Bs%3A32%3A%22Lpjao0vUg-eNEpGvJsS3zWmbwabNm6Yx%22%3B%7D''\n    ''PATH'' => ''C:\\\\WINDOWS\\\\system32;C:\\\\WINDOWS;C:\\\\WINDOWS\\\\System32\\\\Wbem;C:\\\\WINDOWS\\\\System32\\\\WindowsPowerShell\\\\v1.0\\\\;C:\\\\Program Files (x86)\\\\Skype\\\\Phone\\\\;C:\\\\WINDOWS\\\\system32\\\\config\\\\systemprofile\\\\AppData\\\\Local\\\\Microsoft\\\\WindowsApps''\n    ''SystemRoot'' => ''C:\\\\WINDOWS''\n    ''COMSPEC'' => ''C:\\\\WINDOWS\\\\system32\\\\cmd.exe''\n    ''PATHEXT'' => ''.COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC''\n    ''WINDIR'' => ''C:\\\\WINDOWS''\n    ''SERVER_SIGNATURE'' => ''<address>Apache/2.4.23 (Win32) OpenSSL/1.0.2h PHP/5.6.28 Server at localhost Port 80</address>\n''\n    ''SERVER_SOFTWARE'' => ''Apache/2.4.23 (Win32) OpenSSL/1.0.2h PHP/5.6.28''\n    ''SERVER_NAME'' => ''localhost''\n    ''SERVER_ADDR'' => ''::1''\n    ''SERVER_PORT'' => ''80''\n    ''REMOTE_ADDR'' => ''::1''\n    ''DOCUMENT_ROOT'' => ''C:/xampp/htdocs''\n    ''REQUEST_SCHEME'' => ''http''\n    ''CONTEXT_PREFIX'' => ''''\n    ''CONTEXT_DOCUMENT_ROOT'' => ''C:/xampp/htdocs''\n    ''SERVER_ADMIN'' => ''postmaster@localhost''\n    ''SCRIPT_FILENAME'' => ''C:/xampp/htdocs/Kolibri/index.php''\n    ''REMOTE_PORT'' => ''65035''\n    ''GATEWAY_INTERFACE'' => ''CGI/1.1''\n    ''SERVER_PROTOCOL'' => ''HTTP/1.1''\n    ''REQUEST_METHOD'' => ''GET''\n    ''QUERY_STRING'' => ''r=installer%2Fconfig%2Findex''\n    ''REQUEST_URI'' => ''/Kolibri/index.php?r=installer%2Fconfig%2Findex''\n    ''SCRIPT_NAME'' => ''/Kolibri/index.php''\n    ''PHP_SELF'' => ''/Kolibri/index.php''\n    ''REQUEST_TIME_FLOAT'' => 1483905517.98\n    ''REQUEST_TIME'' => 1483905517\n]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1483905360),
('m131023_164513_initial', 1483905368),
('m131023_165411_initial', 1483905371),
('m131023_165625_initial', 1483905372),
('m131023_165755_initial', 1483905373),
('m131023_165835_initial', 1483905374),
('m131023_170033_initial', 1483905374),
('m131023_170135_initial', 1483905375),
('m131023_170159_initial', 1483905375),
('m131023_170253_initial', 1483905376),
('m131023_170339_initial', 1483905376),
('m131203_110444_oembed', 1483905377),
('m131213_165552_user_optimize', 1483905380),
('m140226_111945_ldap', 1483905383),
('m140303_125031_password', 1483905385),
('m140304_142711_memberautoadd', 1483905386),
('m140321_000917_content', 1483905387),
('m140324_170617_membership', 1483905388),
('m140507_150421_create_settings_table', 1483905389),
('m140507_171527_create_settings_table', 1483905390),
('m140512_141414_i18n_profilefields', 1483905392),
('m140513_180317_createlogging', 1483905392),
('m140701_000611_profile_genderfield', 1483905392),
('m140701_074404_protect_default_profilefields', 1483905393),
('m140702_143912_notify_notification_unify', 1483905393),
('m140703_104527_profile_birthdayfield', 1483905393),
('m140704_080659_installationid', 1483905393),
('m140705_065525_emailing_settings', 1483905396),
('m140706_135210_lastlogin', 1483905398),
('m140829_122906_delete', 1483905400),
('m140830_145504_following', 1483905401),
('m140901_080147_indizies', 1483905402),
('m140901_080432_indices', 1483905402),
('m140901_112246_addState', 1483905405),
('m140901_153403_addState', 1483905410),
('m140901_170329_group_create_space', 1483905412),
('m140902_091234_session_key_length', 1483905414),
('m140907_140822_zip_field_to_text', 1483905414),
('m140930_205511_fix_default', 1483905416),
('m140930_205859_fix_default', 1483905417),
('m140930_210142_fix_default', 1483905419),
('m140930_210635_fix_default', 1483905422),
('m140930_212528_fix_default', 1483905423),
('m141015_173305_follow_notifications', 1483905424),
('m141019_093319_mentioning', 1483905425),
('m141020_162639_fix_default', 1483905431),
('m141020_193920_rm_alsocreated', 1483905431),
('m141020_193931_rm_alsoliked', 1483905431),
('m141021_162639_oembed_setting', 1483905431),
('m141022_094635_addDefaults', 1483905431),
('m141106_185632_log_init', 1483905433),
('m150204_103433_html5_notified', 1483905433),
('m150210_190006_user_invite_lang', 1483905434),
('m150302_114347_add_visibility', 1483905435),
('m150322_194403_remove_type_field', 1483905436),
('m150322_195619_allowedExt2Text', 1483905436),
('m150429_223856_optimize', 1483905437),
('m150510_102900_update', 1483905438),
('m150629_220311_change', 1483905439),
('m150703_012735_typelength', 1483905440),
('m150703_024635_activityTypes', 1483905440),
('m150703_033650_namespace', 1483905441),
('m150703_130157_migrate', 1483905441),
('m150704_005338_namespace', 1483905442),
('m150704_005418_namespace', 1483905442),
('m150704_005434_namespace', 1483905442),
('m150704_005452_namespace', 1483905442),
('m150704_005504_namespace', 1483905443),
('m150713_054441_timezone', 1483905444),
('m150714_093525_activity', 1483905446),
('m150714_100355_cleanup', 1483905453),
('m150831_061628_notifications', 1483905453),
('m150910_223305_fix_user_follow', 1483905453),
('m150924_133344_update_notification_fix', 1483905453),
('m150924_154635_user_invite_add_first_lastname', 1483905455),
('m150927_190830_create_contentcontainer', 1483905458),
('m150928_103711_permissions', 1483905460),
('m150928_134934_groups', 1483905464),
('m150928_140718_setColorVariables', 1483905465),
('m151010_124437_group_permissions', 1483905468),
('m151010_175000_default_visibility', 1483905468),
('m151013_223814_include_dashboard', 1483905469),
('m151022_131128_module_fix', 1483905470),
('m151106_090948_addColor', 1483905471),
('m151223_171310_fix_notifications', 1483905471),
('m151226_164234_authclient', 1483905473),
('m160125_053702_stored_filename', 1483905473),
('m160216_160119_initial', 1483905476),
('m160217_161220_addCanLeaveFlag', 1483905478),
('m160220_013525_contentcontainer_id', 1483905487),
('m160221_222312_public_permission_change', 1483905487),
('m160225_180229_remove_website', 1483905488),
('m160227_073020_birthday_date', 1483905488),
('m160229_162959_multiusergroups', 1483905500),
('m160309_141222_longerUserName', 1483905501),
('m160408_100725_rename_groupadmin_to_manager', 1483905502),
('m160501_220850_activity_pk_int', 1483905503),
('m160507_202611_settings', 1483905506),
('m160508_005740_settings_cleanup', 1483905512),
('m160509_214811_spaceurl', 1483905514),
('m160517_132535_group', 1483905516),
('m160523_105732_profile_searchable', 1483905517),
('m160714_142827_remove_space_id', 1483905517);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `module_enabled`
--

CREATE TABLE `module_enabled` (
  `module_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `class` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seen` tinyint(4) DEFAULT NULL,
  `source_class` varchar(100) DEFAULT NULL,
  `source_pk` int(11) DEFAULT NULL,
  `space_id` int(11) DEFAULT NULL,
  `emailed` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `desktop_notified` tinyint(1) DEFAULT '0',
  `originator_user_id` int(11) DEFAULT NULL,
  `module` varchar(100) DEFAULT '',
  `group_key` varchar(75) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `message_2trash` text,
  `message` text,
  `url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `post`
--

INSERT INTO `post` (`id`, `message_2trash`, `message`, `url`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, NULL, 'Yay! I''ve just installed HumHub ;Cool;', NULL, '2017-01-08 13:00:36', 1, '2017-01-08 13:00:36', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile`
--

CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `birthday_hide_year` int(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `about` text,
  `phone_private` varchar(255) DEFAULT NULL,
  `phone_work` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `im_skype` varchar(255) DEFAULT NULL,
  `im_msn` varchar(255) DEFAULT NULL,
  `im_xmpp` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `url_facebook` varchar(255) DEFAULT NULL,
  `url_linkedin` varchar(255) DEFAULT NULL,
  `url_xing` varchar(255) DEFAULT NULL,
  `url_youtube` varchar(255) DEFAULT NULL,
  `url_vimeo` varchar(255) DEFAULT NULL,
  `url_flickr` varchar(255) DEFAULT NULL,
  `url_myspace` varchar(255) DEFAULT NULL,
  `url_googleplus` varchar(255) DEFAULT NULL,
  `url_twitter` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profile`
--

INSERT INTO `profile` (`user_id`, `firstname`, `lastname`, `title`, `gender`, `street`, `zip`, `city`, `country`, `state`, `birthday_hide_year`, `birthday`, `about`, `phone_private`, `phone_work`, `mobile`, `fax`, `im_skype`, `im_msn`, `im_xmpp`, `url`, `url_facebook`, `url_linkedin`, `url_xing`, `url_youtube`, `url_vimeo`, `url_flickr`, `url_myspace`, `url_googleplus`, `url_twitter`) VALUES
(1, 'Rafael', 'Zúñiga', 'System Administration', NULL, NULL, NULL, NULL, NULL, NULL, 0, '1992-11-27', NULL, NULL, NULL, '6623412123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile_field`
--

CREATE TABLE `profile_field` (
  `id` int(11) NOT NULL,
  `profile_field_category_id` int(11) NOT NULL,
  `module_id` varchar(255) DEFAULT NULL,
  `field_type_class` varchar(255) NOT NULL,
  `field_type_config` text,
  `internal_name` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `sort_order` int(11) NOT NULL DEFAULT '100',
  `required` tinyint(4) DEFAULT NULL,
  `show_at_registration` tinyint(4) DEFAULT NULL,
  `editable` tinyint(4) NOT NULL DEFAULT '1',
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_attribute` varchar(255) DEFAULT NULL,
  `translation_category` varchar(255) DEFAULT NULL,
  `is_system` int(1) DEFAULT NULL,
  `searchable` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profile_field`
--

INSERT INTO `profile_field` (`id`, `profile_field_category_id`, `module_id`, `field_type_class`, `field_type_config`, `internal_name`, `title`, `description`, `sort_order`, `required`, `show_at_registration`, `editable`, `visible`, `created_at`, `created_by`, `updated_at`, `updated_by`, `ldap_attribute`, `translation_category`, `is_system`, `searchable`) VALUES
(1, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":20,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'firstname', 'First name', NULL, 100, 1, 1, 1, 1, '2017-01-08 12:58:41', NULL, '2017-01-08 12:58:42', NULL, 'givenName', NULL, 1, 1),
(2, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":30,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'lastname', 'Last name', NULL, 200, 1, 1, 1, 1, '2017-01-08 12:58:42', NULL, '2017-01-08 12:58:43', NULL, 'sn', NULL, 1, 1),
(3, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":50,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'title', 'Title', NULL, 300, NULL, NULL, 1, 1, '2017-01-08 12:58:43', NULL, '2017-01-08 12:58:44', NULL, 'title', NULL, 1, 1),
(4, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Select', '{"options":"male=>Male\\nfemale=>Female\\ncustom=>Custom","fieldTypes":[]}', 'gender', 'Gender', NULL, 300, NULL, NULL, 1, 1, '2017-01-08 12:58:44', NULL, '2017-01-08 12:58:45', NULL, NULL, NULL, 1, 1),
(5, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":150,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'street', 'Street', NULL, 400, NULL, NULL, 1, 1, '2017-01-08 12:58:45', NULL, '2017-01-08 12:58:46', NULL, NULL, NULL, 1, 1),
(6, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":10,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'zip', 'Zip', NULL, 500, NULL, NULL, 1, 1, '2017-01-08 12:58:46', NULL, '2017-01-08 12:58:47', NULL, NULL, NULL, 1, 1),
(7, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":100,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'city', 'City', NULL, 600, NULL, NULL, 1, 1, '2017-01-08 12:58:47', NULL, '2017-01-08 12:58:48', NULL, NULL, NULL, 1, 1),
(8, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\CountrySelect', '{"options":null,"fieldTypes":[]}', 'country', 'Country', NULL, 700, NULL, NULL, 1, 1, '2017-01-08 12:58:48', NULL, '2017-01-08 12:58:49', NULL, NULL, NULL, 1, 1),
(9, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":100,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'state', 'State', NULL, 800, NULL, NULL, 1, 1, '2017-01-08 12:58:49', NULL, '2017-01-08 12:58:50', NULL, NULL, NULL, 1, 1),
(10, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Birthday', '{"defaultHideAge":false,"fieldTypes":[]}', 'birthday', 'Birthday', NULL, 900, NULL, NULL, 1, 1, '2017-01-08 12:58:51', NULL, '2017-01-08 12:58:52', NULL, NULL, NULL, 1, 1),
(11, 1, NULL, 'humhub\\modules\\user\\models\\fieldtype\\TextArea', '{"fieldTypes":[]}', 'about', 'About', NULL, 900, NULL, NULL, 1, 1, '2017-01-08 12:58:53', NULL, '2017-01-08 12:58:53', NULL, NULL, NULL, 1, 1),
(12, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":100,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'phone_private', 'Phone Private', NULL, 100, NULL, NULL, 1, 1, '2017-01-08 12:58:53', NULL, '2017-01-08 12:58:54', NULL, NULL, NULL, 1, 1),
(13, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":100,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'phone_work', 'Phone Work', NULL, 200, NULL, NULL, 1, 1, '2017-01-08 12:58:54', NULL, '2017-01-08 12:58:55', NULL, NULL, NULL, 1, 1),
(14, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":100,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'mobile', 'Mobile', NULL, 300, NULL, NULL, 1, 1, '2017-01-08 12:58:55', NULL, '2017-01-08 12:58:56', NULL, NULL, NULL, 1, 1),
(15, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":100,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'fax', 'Fax', NULL, 400, NULL, NULL, 1, 1, '2017-01-08 12:58:56', NULL, '2017-01-08 12:58:57', NULL, NULL, NULL, 1, 1),
(16, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":100,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'im_skype', 'Skype Nickname', NULL, 500, NULL, NULL, 1, 1, '2017-01-08 12:58:57', NULL, '2017-01-08 12:58:58', NULL, NULL, NULL, 1, 1),
(17, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":100,"validator":null,"default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'im_msn', 'MSN', NULL, 600, NULL, NULL, 1, 1, '2017-01-08 12:58:58', NULL, '2017-01-08 12:58:59', NULL, NULL, NULL, 1, 1),
(18, 2, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":255,"validator":"email","default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'im_xmpp', 'XMPP Jabber Address', NULL, 800, NULL, NULL, 1, 1, '2017-01-08 12:58:59', NULL, '2017-01-08 12:58:59', NULL, NULL, NULL, 1, 1),
(19, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'url', 'Url', NULL, 100, NULL, NULL, 1, 1, '2017-01-08 12:59:00', NULL, '2017-01-08 12:59:00', NULL, NULL, NULL, 1, 1),
(20, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'url_facebook', 'Facebook URL', NULL, 200, NULL, NULL, 1, 1, '2017-01-08 12:59:00', NULL, '2017-01-08 12:59:01', NULL, NULL, NULL, 1, 1),
(21, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'url_linkedin', 'LinkedIn URL', NULL, 300, NULL, NULL, 1, 1, '2017-01-08 12:59:01', NULL, '2017-01-08 12:59:02', NULL, NULL, NULL, 1, 1),
(22, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'url_xing', 'Xing URL', NULL, 400, NULL, NULL, 1, 1, '2017-01-08 12:59:02', NULL, '2017-01-08 12:59:03', NULL, NULL, NULL, 1, 1),
(23, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'url_youtube', 'Youtube URL', NULL, 500, NULL, NULL, 1, 1, '2017-01-08 12:59:03', NULL, '2017-01-08 12:59:04', NULL, NULL, NULL, 1, 1),
(24, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'url_vimeo', 'Vimeo URL', NULL, 600, NULL, NULL, 1, 1, '2017-01-08 12:59:04', NULL, '2017-01-08 12:59:05', NULL, NULL, NULL, 1, 1),
(25, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'url_flickr', 'Flickr URL', NULL, 700, NULL, NULL, 1, 1, '2017-01-08 12:59:05', NULL, '2017-01-08 12:59:06', NULL, NULL, NULL, 1, 1),
(26, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'url_myspace', 'MySpace URL', NULL, 800, NULL, NULL, 1, 1, '2017-01-08 12:59:06', NULL, '2017-01-08 12:59:07', NULL, NULL, NULL, 1, 1),
(27, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', '{"minLength":null,"maxLength":255,"validator":"url","default":null,"regexp":null,"regexpErrorMessage":null,"fieldTypes":[]}', 'url_googleplus', 'Google+ URL', NULL, 900, NULL, NULL, 1, 1, '2017-01-08 12:59:07', NULL, '2017-01-08 12:59:07', NULL, NULL, NULL, 1, 1),
(28, 3, NULL, 'humhub\\modules\\user\\models\\fieldtype\\Text', NULL, 'url_twitter', 'Twitter URL', NULL, 1000, NULL, NULL, 1, 1, '2017-01-08 12:59:07', NULL, '2017-01-08 12:59:07', NULL, NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile_field_category`
--

CREATE TABLE `profile_field_category` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '100',
  `module_id` int(11) DEFAULT NULL,
  `visibility` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `translation_category` varchar(255) DEFAULT NULL,
  `is_system` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profile_field_category`
--

INSERT INTO `profile_field_category` (`id`, `title`, `description`, `sort_order`, `module_id`, `visibility`, `created_at`, `created_by`, `updated_at`, `updated_by`, `translation_category`, `is_system`) VALUES
(1, 'General', '', 100, NULL, 1, '2017-01-08 12:58:40', NULL, '2017-01-08 12:58:40', NULL, NULL, 1),
(2, 'Communication', '', 200, NULL, 1, '2017-01-08 12:58:40', NULL, '2017-01-08 12:58:40', NULL, NULL, 1),
(3, 'Social bookmarks', '', 300, NULL, 1, '2017-01-08 12:58:40', NULL, '2017-01-08 12:58:40', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text,
  `module_id` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `setting`
--

INSERT INTO `setting` (`id`, `name`, `value`, `module_id`) VALUES
(1, 'oembedProviders', '{"vimeo.com":"http:\\/\\/vimeo.com\\/api\\/oembed.json?scheme=https&url=%url%&format=json&maxwidth=450","youtube.com":"http:\\/\\/www.youtube.com\\/oembed?scheme=https&url=%url%&format=json&maxwidth=450","youtu.be":"http:\\/\\/www.youtube.com\\/oembed?scheme=https&url=%url%&format=json&maxwidth=450","soundcloud.com":"https:\\/\\/soundcloud.com\\/oembed?url=%url%&format=json&maxwidth=450","slideshare.net":"https:\\/\\/www.slideshare.net\\/api\\/oembed\\/2?url=%url%&format=json&maxwidth=450"}', 'base'),
(2, 'defaultVisibility', '1', 'space'),
(3, 'defaultJoinPolicy', '1', 'space'),
(4, 'colorDefault', '#ededed', 'base'),
(5, 'colorPrimary', '#708fa0', 'base'),
(6, 'colorInfo', '#6fdbe8', 'base'),
(7, 'colorSuccess', '#97d271', 'base'),
(8, 'colorWarning', '#fdd198', 'base'),
(9, 'colorDanger', '#ff8989', 'base'),
(10, 'name', 'Kolibri', 'base'),
(11, 'baseUrl', 'http://localhost/Kolibri', 'base'),
(12, 'paginationSize', '10', 'base'),
(13, 'displayNameFormat', '{profile.firstname} {profile.lastname}', 'base'),
(14, 'horImageScrollOnMobile', '1', 'base'),
(15, 'auth.ldap.refreshUsers', '1', 'user'),
(16, 'auth.needApproval', '0', 'user'),
(17, 'auth.anonymousRegistration', '0', 'user'),
(18, 'auth.internalUsersCanInvite', '0', 'user'),
(19, 'mailer.transportType', 'php', 'base'),
(20, 'mailer.systemEmailAddress', 'social@example.com', 'base'),
(21, 'mailer.systemEmailName', 'Kolibri', 'base'),
(22, 'receive_email_activities', '1', 'activity'),
(23, 'receive_email_notifications', '2', 'notification'),
(24, 'maxFileSize', '5242880', 'file'),
(25, 'maxPreviewImageWidth', '200', 'file'),
(26, 'maxPreviewImageHeight', '200', 'file'),
(27, 'hideImageFileInfo', '0', 'file'),
(28, 'cache.class', 'yii\\caching\\FileCache', 'base'),
(29, 'cache.expireTime', '3600', 'base'),
(30, 'installationId', 'f356bd8851430158b3c475aa765b8d5e', 'admin'),
(31, 'theme', 'HumHub', 'base'),
(32, 'spaceOrder', '0', 'space'),
(33, 'enable', '1', 'tour'),
(34, 'defaultLanguage', 'es', 'base'),
(35, 'enable_html5_desktop_notifications', '0', 'notification'),
(36, 'useCase', 'intranet', 'base'),
(37, 'auth.allowGuestAccess', '0', 'user'),
(38, 'enable', '0', 'friendship'),
(39, 'sampleData', '0', 'installer'),
(40, 'secret', 'e56547d7-942d-4232-9283-4897a949afc1', 'base'),
(41, 'timeZone', 'Europe/Berlin', 'base');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `space`
--

CREATE TABLE `space` (
  `id` int(11) NOT NULL,
  `guid` varchar(45) DEFAULT NULL,
  `wall_id` int(11) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `description` text,
  `join_policy` tinyint(4) DEFAULT NULL,
  `visibility` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `tags` text,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `ldap_dn` varchar(255) DEFAULT NULL,
  `auto_add_new_members` int(4) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL,
  `default_content_visibility` tinyint(1) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `members_can_leave` int(11) DEFAULT '1',
  `url` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `space`
--

INSERT INTO `space` (`id`, `guid`, `wall_id`, `name`, `description`, `join_policy`, `visibility`, `status`, `tags`, `created_at`, `created_by`, `updated_at`, `updated_by`, `ldap_dn`, `auto_add_new_members`, `contentcontainer_id`, `default_content_visibility`, `color`, `members_can_leave`, `url`) VALUES
(1, '9aaa2538-02df-4f8f-9aac-ccfd2be6b7e7', 2, 'Welcome Space', 'Your first sample space to discover the platform.', 2, 2, 1, NULL, '2017-01-08 13:00:34', 1, '2017-01-08 13:00:34', 1, NULL, 1, 2, NULL, '#6fdbe8', 1, 'welcome-space');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `space_membership`
--

CREATE TABLE `space_membership` (
  `space_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `originator_user_id` varchar(45) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `request_message` text,
  `last_visit` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `group_id` varchar(255) DEFAULT 'member',
  `show_at_dashboard` tinyint(1) DEFAULT '1',
  `can_cancel_membership` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `space_membership`
--

INSERT INTO `space_membership` (`space_id`, `user_id`, `originator_user_id`, `status`, `request_message`, `last_visit`, `created_at`, `created_by`, `updated_at`, `updated_by`, `group_id`, `show_at_dashboard`, `can_cancel_membership`) VALUES
(1, 1, NULL, 3, NULL, '2017-01-08 13:01:48', '2017-01-08 13:00:35', 1, '2017-01-08 13:00:35', 1, 'admin', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `space_module`
--

CREATE TABLE `space_module` (
  `id` int(11) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `space_id` int(11) NOT NULL,
  `state` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `url_oembed`
--

CREATE TABLE `url_oembed` (
  `url` varchar(255) NOT NULL,
  `preview` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `guid` varchar(45) DEFAULT NULL,
  `wall_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `auth_mode` varchar(10) NOT NULL,
  `tags` text,
  `language` varchar(5) DEFAULT NULL,
  `last_activity_email` datetime NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `visibility` int(1) DEFAULT '1',
  `time_zone` varchar(100) DEFAULT NULL,
  `contentcontainer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `guid`, `wall_id`, `status`, `username`, `email`, `auth_mode`, `tags`, `language`, `last_activity_email`, `created_at`, `created_by`, `updated_at`, `updated_by`, `last_login`, `visibility`, `time_zone`, `contentcontainer_id`) VALUES
(1, '33469b80-5abd-4039-be55-fadcc62ddc68', 1, 1, 'tatuy', 'tatuyzc@gmail.com', 'local', 'Administration, Support', '', '2017-01-08 13:00:31', '2017-01-08 13:00:31', NULL, '2017-01-08 13:01:30', 1, '2017-01-08 13:00:57', 1, 'Europe/Berlin', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_auth`
--

CREATE TABLE `user_auth` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `source` varchar(255) NOT NULL,
  `source_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_follow`
--

CREATE TABLE `user_follow` (
  `id` int(11) NOT NULL,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `send_notifications` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user_follow`
--

INSERT INTO `user_follow` (`id`, `object_model`, `object_id`, `user_id`, `send_notifications`) VALUES
(1, 'humhub\\modules\\post\\models\\Post', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_friendship`
--

CREATE TABLE `user_friendship` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `friend_user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_http_session`
--

CREATE TABLE `user_http_session` (
  `id` char(255) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data` longblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user_http_session`
--

INSERT INTO `user_http_session` (`id`, `expire`, `user_id`, `data`) VALUES
('a1ngmp5md5j6euqjhtph6iv8c1', 1483907170, NULL, 0x5f5f666c6173687c613a303a7b7d5f5f72657475726e55726c7c733a31383a222f4b6f6c696272692f696e6465782e706870223b);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_invite`
--

CREATE TABLE `user_invite` (
  `id` int(11) NOT NULL,
  `user_originator_id` int(11) DEFAULT NULL,
  `space_invite_id` int(11) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `source` varchar(45) DEFAULT NULL,
  `token` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_mentioning`
--

CREATE TABLE `user_mentioning` (
  `id` int(11) NOT NULL,
  `object_model` varchar(100) NOT NULL,
  `object_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_module`
--

CREATE TABLE `user_module` (
  `id` int(11) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `state` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_password`
--

CREATE TABLE `user_password` (
  `id` int(11) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `algorithm` varchar(20) DEFAULT NULL,
  `password` text,
  `salt` text,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user_password`
--

INSERT INTO `user_password` (`id`, `user_id`, `algorithm`, `password`, `salt`, `created_at`) VALUES
(1, 1, 'sha512whirlpool', '54b39934d683599751def07b5416f1d6de7e49c733a48b85a2a2602fb5297084817c1150c43634ad1f56256e2a141c8a3a5b03b0dbbc6dcf43edb8423a33e593', 'f60ae58c-3cc3-45f6-92c7-e12c58af2c71', '2017-01-08 13:00:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wall`
--

CREATE TABLE `wall` (
  `id` int(11) NOT NULL,
  `object_model` varchar(50) NOT NULL,
  `object_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `wall`
--

INSERT INTO `wall` (`id`, `object_model`, `object_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'humhub\\modules\\user\\models\\User', 1, '2017-01-08 13:00:33', NULL, '2017-01-08 13:00:33', NULL),
(2, 'humhub\\modules\\space\\models\\Space', 1, '2017-01-08 13:00:35', 1, '2017-01-08 13:00:35', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `wall_entry`
--

CREATE TABLE `wall_entry` (
  `id` int(11) NOT NULL,
  `wall_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `wall_entry`
--

INSERT INTO `wall_entry` (`id`, `wall_id`, `content_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 2, 1, '2017-01-08 13:00:36', 1, '2017-01-08 13:00:36', 1),
(2, 2, 3, '2017-01-08 13:00:36', 1, '2017-01-08 13:00:36', 1),
(3, 2, 2, '2017-01-08 13:00:37', 1, '2017-01-08 13:00:37', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_object_model` (`object_model`,`object_id`),
  ADD UNIQUE KEY `index_guid` (`guid`),
  ADD KEY `fk-contentcontainer` (`contentcontainer_id`),
  ADD KEY `fk-create-user` (`created_by`),
  ADD KEY `fk-update-user` (`updated_by`);

--
-- Indices de la tabla `contentcontainer`
--
ALTER TABLE `contentcontainer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_target` (`class`,`pk`),
  ADD UNIQUE KEY `unique_guid` (`guid`);

--
-- Indices de la tabla `contentcontainer_permission`
--
ALTER TABLE `contentcontainer_permission`
  ADD PRIMARY KEY (`permission_id`,`group_id`,`module_id`,`contentcontainer_id`);

--
-- Indices de la tabla `contentcontainer_setting`
--
ALTER TABLE `contentcontainer_setting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings-unique` (`module_id`,`contentcontainer_id`,`name`),
  ADD KEY `fk-contentcontainerx` (`contentcontainer_id`);

--
-- Indices de la tabla `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_object` (`object_model`,`object_id`);

--
-- Indices de la tabla `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `group_permission`
--
ALTER TABLE `group_permission`
  ADD PRIMARY KEY (`permission_id`,`group_id`,`module_id`);

--
-- Indices de la tabla `group_user`
--
ALTER TABLE `group_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx-group_user` (`user_id`,`group_id`),
  ADD KEY `fk-group-group` (`group_id`);

--
-- Indices de la tabla `like`
--
ALTER TABLE `like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_object` (`object_model`,`object_id`);

--
-- Indices de la tabla `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_log_level` (`level`),
  ADD KEY `idx_log_category` (`category`);

--
-- Indices de la tabla `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `module_enabled`
--
ALTER TABLE `module_enabled`
  ADD PRIMARY KEY (`module_id`);

--
-- Indices de la tabla `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_user_id` (`user_id`),
  ADD KEY `index_seen` (`seen`),
  ADD KEY `index_desktop_notified` (`desktop_notified`),
  ADD KEY `index_desktop_emailed` (`emailed`),
  ADD KEY `index_groupuser` (`user_id`,`class`,`group_key`);

--
-- Indices de la tabla `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `profile_field`
--
ALTER TABLE `profile_field`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_profile_field_category` (`profile_field_category_id`);

--
-- Indices de la tabla `profile_field_category`
--
ALTER TABLE `profile_field_category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unique-setting` (`name`,`module_id`);

--
-- Indices de la tabla `space`
--
ALTER TABLE `space`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url-unique` (`url`);

--
-- Indices de la tabla `space_membership`
--
ALTER TABLE `space_membership`
  ADD PRIMARY KEY (`space_id`,`user_id`),
  ADD KEY `index_status` (`status`);

--
-- Indices de la tabla `space_module`
--
ALTER TABLE `space_module`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `url_oembed`
--
ALTER TABLE `url_oembed`
  ADD PRIMARY KEY (`url`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`),
  ADD UNIQUE KEY `unique_username` (`username`),
  ADD UNIQUE KEY `unique_guid` (`guid`),
  ADD UNIQUE KEY `unique_wall_id` (`wall_id`);

--
-- Indices de la tabla `user_auth`
--
ALTER TABLE `user_auth`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_id` (`user_id`);

--
-- Indices de la tabla `user_follow`
--
ALTER TABLE `user_follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_user` (`user_id`),
  ADD KEY `index_object` (`object_model`,`object_id`);

--
-- Indices de la tabla `user_friendship`
--
ALTER TABLE `user_friendship`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx-friends` (`user_id`,`friend_user_id`),
  ADD KEY `fk-friend` (`friend_user_id`);

--
-- Indices de la tabla `user_http_session`
--
ALTER TABLE `user_http_session`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user_invite`
--
ALTER TABLE `user_invite`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_email` (`email`),
  ADD UNIQUE KEY `unique_token` (`token`);

--
-- Indices de la tabla `user_mentioning`
--
ALTER TABLE `user_mentioning`
  ADD PRIMARY KEY (`id`),
  ADD KEY `i_user` (`user_id`),
  ADD KEY `i_object` (`object_model`,`object_id`);

--
-- Indices de la tabla `user_module`
--
ALTER TABLE `user_module`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_user_module` (`user_id`,`module_id`);

--
-- Indices de la tabla `user_password`
--
ALTER TABLE `user_password`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indices de la tabla `wall`
--
ALTER TABLE `wall`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `wall_entry`
--
ALTER TABLE `wall_entry`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `contentcontainer`
--
ALTER TABLE `contentcontainer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `contentcontainer_setting`
--
ALTER TABLE `contentcontainer_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `file`
--
ALTER TABLE `file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `group`
--
ALTER TABLE `group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `group_user`
--
ALTER TABLE `group_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `like`
--
ALTER TABLE `like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `log`
--
ALTER TABLE `log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `profile_field`
--
ALTER TABLE `profile_field`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT de la tabla `profile_field_category`
--
ALTER TABLE `profile_field_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT de la tabla `space`
--
ALTER TABLE `space`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `space_module`
--
ALTER TABLE `space_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `user_auth`
--
ALTER TABLE `user_auth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `user_follow`
--
ALTER TABLE `user_follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `user_friendship`
--
ALTER TABLE `user_friendship`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `user_invite`
--
ALTER TABLE `user_invite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `user_mentioning`
--
ALTER TABLE `user_mentioning`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `user_module`
--
ALTER TABLE `user_module`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `user_password`
--
ALTER TABLE `user_password`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `wall`
--
ALTER TABLE `wall`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `wall_entry`
--
ALTER TABLE `wall_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `fk-contentcontainer` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk-create-user` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk-update-user` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `contentcontainer_setting`
--
ALTER TABLE `contentcontainer_setting`
  ADD CONSTRAINT `fk-contentcontainerx` FOREIGN KEY (`contentcontainer_id`) REFERENCES `contentcontainer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `group_user`
--
ALTER TABLE `group_user`
  ADD CONSTRAINT `fk-group-group` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-user-group` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_auth`
--
ALTER TABLE `user_auth`
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user_friendship`
--
ALTER TABLE `user_friendship`
  ADD CONSTRAINT `fk-friend` FOREIGN KEY (`friend_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk-user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
