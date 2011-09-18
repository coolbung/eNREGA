-- phpMyAdmin SQL Dump
-- version 3.4.3.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 19, 2011 at 02:07 AM
-- Server version: 5.5.14
-- PHP Version: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dev_enrega`
--

-- --------------------------------------------------------

--
-- Table structure for table `rega_admintools_acl`
--

CREATE TABLE IF NOT EXISTS `rega_admintools_acl` (
  `user_id` bigint(20) unsigned NOT NULL,
  `permissions` mediumtext,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rega_admintools_adminiplist`
--

CREATE TABLE IF NOT EXISTS `rega_admintools_adminiplist` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rega_admintools_badwords`
--

CREATE TABLE IF NOT EXISTS `rega_admintools_badwords` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rega_admintools_customperms`
--

CREATE TABLE IF NOT EXISTS `rega_admintools_customperms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `perms` varchar(4) DEFAULT '0644',
  UNIQUE KEY `id` (`id`),
  KEY `path` (`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rega_admintools_ipautoban`
--

CREATE TABLE IF NOT EXISTS `rega_admintools_ipautoban` (
  `ip` varchar(255) NOT NULL,
  `reason` varchar(255) DEFAULT 'other',
  `until` datetime DEFAULT NULL,
  UNIQUE KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rega_admintools_ipblock`
--

CREATE TABLE IF NOT EXISTS `rega_admintools_ipblock` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rega_admintools_log`
--

CREATE TABLE IF NOT EXISTS `rega_admintools_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `logdate` datetime NOT NULL,
  `ip` varchar(40) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT 'other',
  `extradata` mediumtext,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rega_admintools_redirects`
--

CREATE TABLE IF NOT EXISTS `rega_admintools_redirects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(255) DEFAULT NULL,
  `dest` varchar(255) DEFAULT NULL,
  `ordering` bigint(20) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rega_admintools_storage`
--

CREATE TABLE IF NOT EXISTS `rega_admintools_storage` (
  `key` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rega_admintools_storage`
--

INSERT INTO `rega_admintools_storage` (`key`, `value`) VALUES
('cparams', '{"latestjversion":"{\\"version\\":\\"1.7.0\\",\\"updates\\":{\\"1.6.5\\":\\"http:\\\\\\/\\\\\\/joomlacode.org\\\\\\/gf\\\\\\/download\\\\\\/frsrelease\\\\\\/15279\\\\\\/66552\\\\\\/Joomla_1.6.5_to_1.7.0_Package.zip\\"},\\"full\\":\\"http:\\\\\\/\\\\\\/joomlacode.org\\\\\\/gf\\\\\\/download\\\\\\/frsrelease\\\\\\/15278\\\\\\/66555\\\\\\/Joomla_1.7.0-Stable-Full_Package.zip\\"}","lastjupdatecheck":1314456911}');

-- --------------------------------------------------------

--
-- Table structure for table `rega_admintools_wafexceptions`
--

CREATE TABLE IF NOT EXISTS `rega_admintools_wafexceptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option` varchar(255) DEFAULT NULL,
  `view` varchar(255) DEFAULT NULL,
  `query` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rega_ak_acl`
--

CREATE TABLE IF NOT EXISTS `rega_ak_acl` (
  `user_id` bigint(20) unsigned NOT NULL,
  `permissions` mediumtext,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rega_ak_profiles`
--

CREATE TABLE IF NOT EXISTS `rega_ak_profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `configuration` longtext,
  `filters` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `rega_ak_profiles`
--

INSERT INTO `rega_ak_profiles` (`id`, `description`, `configuration`, `filters`) VALUES
(1, 'Default Backup Profile', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `rega_ak_stats`
--

CREATE TABLE IF NOT EXISTS `rega_ak_stats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `comment` longtext,
  `backupstart` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `backupend` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('run','fail','complete') NOT NULL DEFAULT 'run',
  `origin` varchar(30) NOT NULL DEFAULT 'backend',
  `type` varchar(30) NOT NULL DEFAULT 'full',
  `profile_id` bigint(20) NOT NULL DEFAULT '1',
  `archivename` longtext,
  `absolute_path` longtext,
  `multipart` int(11) NOT NULL DEFAULT '0',
  `tag` varchar(255) DEFAULT NULL,
  `filesexist` tinyint(3) NOT NULL DEFAULT '1',
  `remote_filename` varchar(1000) DEFAULT NULL,
  `total_size` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fullstatus` (`filesexist`,`status`),
  KEY `idx_stale` (`status`,`origin`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rega_assets`
--

CREATE TABLE IF NOT EXISTS `rega_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `rega_assets`
--

INSERT INTO `rega_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 1, 422, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":[],"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 17, 22, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 23, 24, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 25, 26, 1, 'com_installer', 'com_installer', '{"core.admin":{"7":1},"core.manage":{"7":1},"core.delete":[],"core.edit.state":[]}'),
(11, 1, 27, 28, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 29, 30, 1, 'com_login', 'com_login', '{}'),
(13, 1, 31, 32, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 33, 34, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 35, 36, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 37, 38, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 39, 40, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 41, 42, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 43, 46, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 47, 48, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 49, 50, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 51, 52, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 53, 54, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 55, 56, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.own":{"6":1},"core.edit.state":[]}'),
(25, 1, 57, 60, 1, 'com_weblinks', 'com_weblinks', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(26, 1, 61, 62, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 21, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 44, 45, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(31, 25, 58, 59, 2, 'com_weblinks.category.6', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 1, 416, 417, 1, 'com_admintools', 'admintools', '{}'),
(33, 1, 418, 419, 1, 'com_akeeba', 'akeeba', '{}'),
(34, 27, 19, 20, 3, 'com_content.article.1', 'eNREGA Quick Access Portal', '{"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(35, 1, 420, 421, 1, 'com_rsform', 'rsform', '{}');

-- --------------------------------------------------------

--
-- Table structure for table `rega_associations`
--

CREATE TABLE IF NOT EXISTS `rega_associations` (
  `id` varchar(50) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rega_banners`
--

CREATE TABLE IF NOT EXISTS `rega_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rega_banner_clients`
--

CREATE TABLE IF NOT EXISTS `rega_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rega_banner_tracks`
--

CREATE TABLE IF NOT EXISTS `rega_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rega_categories`
--

CREATE TABLE IF NOT EXISTS `rega_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(5120) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `rega_categories`
--

INSERT INTO `rega_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`) VALUES
(1, 0, 0, 0, 11, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '', 0, '2009-10-18 16:07:09', 0, '0000-00-00 00:00:00', 0, '*'),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:26:37', 0, '0000-00-00 00:00:00', 0, '*'),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":"","foobar":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:27:35', 0, '0000-00-00 00:00:00', 0, '*'),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:27:57', 0, '0000-00-00 00:00:00', 0, '*'),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:28:15', 0, '0000-00-00 00:00:00', 0, '*'),
(6, 31, 1, 9, 10, 1, 'uncategorised', 'com_weblinks', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:28:33', 0, '0000-00-00 00:00:00', 0, '*');

-- --------------------------------------------------------

--
-- Table structure for table `rega_contact_details`
--

CREATE TABLE IF NOT EXISTS `rega_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rega_content`
--

CREATE TABLE IF NOT EXISTS `rega_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `title_alias` varchar(255) NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(10) unsigned NOT NULL DEFAULT '0',
  `mask` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `rega_content`
--

INSERT INTO `rega_content` (`id`, `asset_id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(1, 34, 'eNREGA Quick Access Portal', 'enrega-quick-access-portal', '', '<p>The quick access portal is the brainchild of PD. Based on a early mobile based prototype. blah!</p>', '', 1, 0, 0, 2, '2011-08-20 12:22:36', 39, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2011-08-20 12:22:36', '0000-00-00 00:00:00', '', '', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","alternative_readmore":"","article_layout":""}', 1, 0, 0, '', '', 1, 86, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');

-- --------------------------------------------------------

--
-- Table structure for table `rega_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `rega_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rega_content_rating`
--

CREATE TABLE IF NOT EXISTS `rega_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rega_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `rega_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rega_enrega_blockexpensearchive`
--

CREATE TABLE IF NOT EXISTS `rega_enrega_blockexpensearchive` (
  `BlockUniqueId` int(11) NOT NULL COMMENT 'Foreign Key from blocks table ',
  `Year` varchar(20) DEFAULT NULL,
  `NoOfWorks` int(11) NOT NULL DEFAULT '0',
  `LabourExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `MaterialExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `CreatedOn` datetime NOT NULL,
  `PageHTML` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=': This table will store the Versions of Expenses information';

-- --------------------------------------------------------

--
-- Table structure for table `rega_enrega_blockexpenses`
--

CREATE TABLE IF NOT EXISTS `rega_enrega_blockexpenses` (
  `UniqueId` int(11) NOT NULL AUTO_INCREMENT,
  `BlockUniqueId` int(11) NOT NULL COMMENT 'Foreign Key from Blocks Table',
  `Year` varchar(20) DEFAULT NULL,
  `NoOfWorks` int(11) NOT NULL DEFAULT '0',
  `LabourExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `MaterialExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Link` varchar(400) DEFAULT NULL,
  `Html_hash` varchar(400) NOT NULL COMMENT 'Hash of the HTML contents of the district page (i.e. the one that has a list of panchayats)\r\n',
  PRIMARY KEY (`UniqueId`),
  KEY `BlockUniqueId` (`BlockUniqueId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table will store the Expenses information of Block for ' AUTO_INCREMENT=356 ;

--
-- Dumping data for table `rega_enrega_blockexpenses`
--

INSERT INTO `rega_enrega_blockexpenses` (`UniqueId`, `BlockUniqueId`, `Year`, `NoOfWorks`, `LabourExpenditures`, `MaterialExpenditures`, `CreatedOn`, `ModifiedOn`, `Link`, `Html_hash`) VALUES
(1, 1831003, '2011', 840, 71047925, 6472594, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(2, 1831003, '2011', 840, 71047925, 6472594, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(3, 1831006, '2011', 490, 7175126, 66336, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(4, 1831002, '2011', 940, 84359546, 138478, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(5, 1831007, '2011', 611, 13028310, 362658, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(6, 1831005, '2011', 452, 9219070, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(7, 1831004, '2011', 235, 5158737, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(8, 1813002, '2011', 147, 2607468, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(9, 1813007, '2011', 91, 3355346, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(10, 1813004, '2011', 49, 2132092, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(11, 1813001, '2011', 93, 3392699, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(12, 1813010, '2011', 87, 2616858, 52625, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(13, 1813009, '2011', 154, 3070533, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(14, 1813003, '2011', 73, 2018403, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(15, 1813005, '2011', 30, 1906549, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(16, 1813008, '2011', 83, 2003793, 263469, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(17, 1813011, '2011', 153, 4459609, 40060, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(18, 1813006, '2011', 78, 1565504, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(19, 1829003, '2011', 224, 2553961, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(20, 1829011, '2011', 178, 2300595, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(21, 1829016, '2011', 115, 2930033, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(22, 1829010, '2011', 188, 622717, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(23, 1829012, '2011', 94, 1513298, 1216, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(24, 1829015, '2011', 32, 129741, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(25, 1829004, '2011', 282, 10434011, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(26, 1829006, '2011', 220, 1345867, 262582, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(27, 1829001, '2011', 54, 548946, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(28, 1829009, '2011', 311, 4210659, 18213, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(29, 1829005, '2011', 257, 10575378, 395085, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(30, 1829008, '2011', 186, 4529950, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(31, 1829013, '2011', 82, 342252, 5324, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(32, 1829002, '2011', 239, 4557016, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(33, 1829014, '2011', 321, 13170560, 565476, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(34, 1824009, '2011', 566, 1656816, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(35, 1824015, '2011', 218, 2733817, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(36, 1824007, '2011', 289, 1063919, 7949, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(37, 1824006, '2011', 1925, 13967168, 250391, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(38, 1824003, '2011', 483, 1150298, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(39, 1824002, '2011', 972, 16655203, 1064851, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(40, 1824008, '2011', 428, 2135588, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(41, 1824013, '2011', 695, 3504872, 325050, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(42, 1824016, '2011', 428, 613349, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(43, 1824014, '2011', 1273, 10285355, 1481430, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(44, 1824011, '2011', 9086, 34273904, 2173419, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(45, 1824005, '2011', 629, 1033564, 284549, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(46, 1824004, '2011', 645, 2582188, 214173, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(47, 1824010, '2011', 3504, 16076791, 990000, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(48, 1806005, '2011', 16, 347253, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(49, 1806013, '2011', 48, 556082, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(50, 1806007, '2011', 13, 120741, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(51, 1806012, '2011', 7, 117916, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(52, 1806006, '2011', 7, 24927, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(53, 1806004, '2011', 53, 559305, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(54, 1806010, '2011', 30, 858397, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(55, 1806015, '2011', 110, 3515454, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(56, 1806014, '2011', 10, 255924, 3304, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(57, 1806002, '2011', 507, 10702669, 155024, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(58, 1806009, '2011', 28, 1919863, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(59, 1806001, '2011', 63, 900490, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(60, 1806008, '2011', 167, 3221151, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(61, 1806003, '2011', 17, 404422, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(62, 1806011, '2011', 4, 0, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(63, 1807010, '2011', 101, 251334, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(64, 1807001, '2011', 437, 17634991, 2669247, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(65, 1807009, '2011', 171, 1433519, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(66, 1807002, '2011', 263, 15379402, 137440, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(67, 1803015, '2011', 129, 2227030, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(68, 1803013, '2011', 157, 862146, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(69, 1803008, '2011', 180, 3883307, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(70, 1803002, '2011', 63, 569770, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(71, 1803007, '2011', 53, 705546, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(72, 1803006, '2011', 181, 2452505, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(73, 1803012, '2011', 112, 721020, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(74, 1803010, '2011', 300, 1793983, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(75, 1803003, '2011', 289, 3367516, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(76, 1803014, '2011', 69, 475862, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(77, 1803009, '2011', 229, 1448789, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(78, 1803004, '2011', 124, 1789999, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(79, 1803001, '2011', 148, 1712452, 19794, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(80, 1803005, '2011', 131, 715034, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(81, 1803011, '2011', 138, 876571, 28464, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(82, 1810002, '2011', 54, 53068, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(83, 1810001, '2011', 0, 0, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(84, 1810014, '2011', 88, 396308, 4445, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(85, 1810009, '2011', 74, 864834, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(86, 1810012, '2011', 53, 1231201, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(87, 1810007, '2011', 76, 437852, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(88, 1810008, '2011', 57, 413857, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(89, 1810005, '2011', 104, 510945, 3500, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(90, 1810013, '2011', 29, 180837, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(91, 1810010, '2011', 60, 939461, 102903, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(92, 1810004, '2011', 67, 561053, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(93, 1810006, '2011', 32, 202944, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(94, 1810011, '2011', 67, 1757279, 6178, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(95, 1810003, '2011', 72, 376758, 75947, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(96, 1830005, '2011', 613, 5803584, 3221305, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(97, 1830012, '2011', 198, 2388854, 636436, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(98, 1830002, '2011', 444, 23011714, 1784420, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(99, 1830001, '2011', 193, 4319366, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(100, 1830008, '2011', 447, 5646251, 70575, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(101, 1830004, '2011', 508, 14054475, 92528, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(102, 1830003, '2011', 645, 6619334, 19656, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(103, 1830010, '2011', 326, 7206542, 6402917, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(104, 1830007, '2011', 162, 1543036, 106122, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(105, 1830009, '2011', 180, 3332186, 71541, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(106, 1830011, '2011', 266, 5769732, 2927730, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(107, 1830006, '2011', 143, 1016001, 656436, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(108, 1827006, '2011', 12, 451598, 798, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(109, 1827010, '2011', 47, 621650, 15721, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(110, 1827005, '2011', 63, 431980, 11697, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(111, 1827004, '2011', 37, 1411806, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(112, 1827012, '2011', 47, 849119, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(113, 1827007, '2011', 75, 2056397, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(114, 1827014, '2011', 36, 1519793, 480057, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(115, 1827008, '2011', 66, 768376, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(116, 1827009, '2011', 91, 1101645, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(117, 1827003, '2011', 3, 44808, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(118, 1827011, '2011', 21, 226984, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(119, 1827013, '2011', 14, 727676, 4069, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(120, 1827002, '2011', 64, 523809, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(121, 1826003, '2011', 182, 2266265, 303786, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(122, 1826006, '2011', 194, 2203472, 225677, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(123, 1826004, '2011', 187, 2670394, 460825, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(124, 1826008, '2011', 115, 2469915, 652558, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(125, 1826001, '2011', 173, 1287159, 138234, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(126, 1826007, '2011', 127, 3606899, 333853, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(127, 1826005, '2011', 176, 841804, 123229, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(128, 1826002, '2011', 204, 1215895, 398934, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(129, 1809013, '2011', 203, 5301356, 3870100, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(130, 1809002, '2011', 39, 460672, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(131, 1809007, '2011', 253, 2272629, 620360, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(132, 1809009, '2011', 149, 1879695, 271915, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(133, 1809014, '2011', 136, 2052699, 78020, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(134, 1809008, '2011', 127, 1841323, 119670, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(135, 1809004, '2011', 33, 508168, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(136, 1809003, '2011', 37, 310691, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(137, 1809010, '2011', 271, 6724678, 1926281, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(138, 1809001, '2011', 190, 1809669, 91432, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(139, 1809012, '2011', 314, 4905037, 539125, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(140, 1809005, '2011', 149, 2081594, 278995, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(141, 1809006, '2011', 318, 9807861, 278288, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(142, 1809011, '2011', 741, 17055280, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(143, 1812007, '2011', 175, 5359690, 265506, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(144, 1812002, '2011', 255, 11439603, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(145, 1812009, '2011', 188, 5226056, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(146, 1812001, '2011', 201, 6194277, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(147, 1812004, '2011', 323, 12612039, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(148, 1812010, '2011', 277, 5442457, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(149, 1812005, '2011', 470, 16312807, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(150, 1812006, '2011', 229, 6582829, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(151, 1812003, '2011', 223, 6569887, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(152, 1812008, '2011', 145, 1842418, 41074, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(153, 1819008, '2011', 1291, 42645529, 2345897, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(154, 1819014, '2011', 164, 2529552, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(155, 1819006, '2011', 490, 13759834, 2874805, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(156, 1819016, '2011', 1067, 15621613, 3291533, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(157, 1819003, '2011', 1175, 23659593, 103423, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(158, 1819007, '2011', 1066, 78654114, 13442952, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(159, 1819009, '2011', 231, 1691844, 1086975, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(160, 1819013, '2011', 105, 722399, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(161, 1819004, '2011', 746, 29539746, 271562, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(162, 1819005, '2011', 335, 10625033, 85796, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(163, 1819001, '2011', 219, 1542321, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(164, 1819015, '2011', 236, 3124889, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(165, 1819012, '2011', 575, 29872757, 909650, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(166, 1819011, '2011', 279, 3100732, 19970, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(167, 1819010, '2011', 1955, 47314188, 4862934, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(168, 1819002, '2011', 853, 14443777, 776824, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(169, 1822006, '2011', 215, 2004146, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(170, 1822007, '2011', 275, 1566205, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(171, 1822012, '2011', 542, 1268591, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(172, 1822008, '2011', 819, 7414212, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(173, 1822010, '2011', 595, 2894920, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(174, 1822002, '2011', 959, 2319953, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(175, 1822003, '2011', 229, 1830117, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(176, 1822013, '2011', 907, 1066364, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(177, 1822011, '2011', 851, 4473894, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(178, 1822009, '2011', 742, 2231166, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(179, 1822005, '2011', 537, 3567512, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(180, 1822001, '2011', 857, 1614197, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(181, 1822004, '2011', 356, 271991, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(182, 1834006, '2011', 190, 4828256, 127778, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(183, 1834009, '2011', 734, 1776007, 24736, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(184, 1834010, '2011', 195, 4098286, 784680, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(185, 1834008, '2011', 315, 2736429, 85951, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(186, 1834007, '2011', 35, 2438503, 1375328, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(187, 1828021, '2011', 341, 5848022, 423302, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(188, 1828025, '2011', 247, 4014356, 217708, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(189, 1828027, '2011', 562, 38308734, 1907954, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(190, 1828024, '2011', 368, 13094864, 768409, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(191, 1828022, '2011', 234, 2371526, 44862, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(192, 1828026, '2011', 198, 3771763, 60150, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(193, 1828023, '2011', 358, 5511357, 225318, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(194, 1804001, '2011', 60, 364365, 35590, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(195, 1804009, '2011', 108, 500174, 97901, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(196, 1804007, '2011', 82, 663929, 30827, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(197, 1804003, '2011', 118, 338103, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(198, 1804002, '2011', 70, 601091, 14748, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(199, 1804006, '2011', 94, 2697946, 751809, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(200, 1804005, '2011', 111, 405157, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(201, 1804004, '2011', 61, 212997, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(202, 1804008, '2011', 55, 184894, 32980, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(203, 1808001, '2011', 118, 2141751, 9577, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(204, 1808004, '2011', 62, 1387630, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(205, 1808012, '2011', 70, 1760620, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(206, 1808003, '2011', 47, 756495, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(207, 1808007, '2011', 77, 1643402, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(208, 1808010, '2011', 83, 4360143, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(209, 1808009, '2011', 115, 2490737, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(210, 1808006, '2011', 85, 2792435, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(211, 1808011, '2011', 88, 1231089, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(212, 1808002, '2011', 66, 1642589, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(213, 1808016, '2011', 47, 1148181, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(214, 1808015, '2011', 59, 996324, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(215, 1808013, '2011', 82, 1580689, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(216, 1808008, '2011', 53, 906651, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(217, 1808014, '2011', 96, 2511517, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(218, 1802008, '2011', 651, 223736, 67045, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(219, 1802002, '2011', 3, 0, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(220, 1802011, '2011', 151, 93696, 67308, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(221, 1802014, '2011', 1248, 1057701, 181169, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(222, 1802012, '2011', 23, 42181, 56364, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(223, 1802001, '2011', 0, 0, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(224, 1802003, '2011', 433, 181048, 51183, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(225, 1802004, '2011', 1017, 0, 109527, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(226, 1802006, '2011', 3254, 23162570, 10054306, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(227, 1802007, '2011', 1664, 887437, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(228, 1802015, '2011', 2, 0, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(229, 1802010, '2011', 527, 3242845, 421797, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(230, 1802009, '2011', 534, 0, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(231, 1802013, '2011', 0, 0, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(232, 1802005, '2011', 240, 0, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(233, 1805003, '2011', 82, 381968, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(234, 1805004, '2011', 86, 175539, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(235, 1805006, '2011', 148, 418031, 21012, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(236, 1805005, '2011', 67, 438591, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(237, 1805001, '2011', 88, 291835, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(238, 1805007, '2011', 63, 319721, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(239, 1805002, '2011', 87, 223140, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(240, 1805008, '2011', 37, 150212, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(241, 1833008, '2011', 1106, 18138907, 41300, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', '');
INSERT INTO `rega_enrega_blockexpenses` (`UniqueId`, `BlockUniqueId`, `Year`, `NoOfWorks`, `LabourExpenditures`, `MaterialExpenditures`, `CreatedOn`, `ModifiedOn`, `Link`, `Html_hash`) VALUES
(242, 1833001, '2011', 937, 11490612, 115413, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(243, 1833005, '2011', 482, 4443609, 10287, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(244, 1833003, '2011', 620, 3989660, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(245, 1833002, '2011', 939, 26494562, 845720, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(246, 1833007, '2011', 520, 9024625, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(247, 1833006, '2011', 757, 7806536, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(248, 1833004, '2011', 637, 6399295, 16330, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(249, 1817013, '2011', 7, 26924, 13479, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(250, 1817016, '2011', 56, 298406, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(251, 1817014, '2011', 75, 296431, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(252, 1817015, '2011', 260, 3881400, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(253, 1817012, '2011', 58, 383938, 237727, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(254, 1817008, '2011', 76, 1670206, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(255, 1817009, '2011', 1, 65415, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(256, 1817011, '2011', 51, 327221, 193407, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(257, 1817010, '2011', 130, 1679203, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(258, 1825004, '2011', 65, 274200, 642, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(259, 1825003, '2011', 281, 5550738, 29833, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(260, 1825009, '2011', 212, 3278506, 60000, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(261, 1825012, '2011', 161, 1960251, 72717, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(262, 1825014, '2011', 187, 201529, 118675, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(263, 1825018, '2011', 64, 1242821, 469380, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(264, 1825006, '2011', 73, 0, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(265, 1825016, '2011', 89, 22291351, 870634, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(266, 1825017, '2011', 170, 1963258, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(267, 1825010, '2011', 167, 785948, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(268, 1825007, '2011', 220, 25613831, 1543645, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(269, 1825002, '2011', 503, 43784766, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(270, 1825013, '2011', 185, 503637, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(271, 1825015, '2011', 408, 4344508, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(272, 1825008, '2011', 157, 4264610, 457381, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(273, 1825011, '2011', 263, 108394, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(274, 1815003, '2011', 481, 3841871, 9817645, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(275, 1815009, '2011', 552, 3173262, 15553378, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(276, 1815004, '2011', 102, 292968, 200167, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(277, 1815008, '2011', 1198, 6146695, 144347, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(278, 1815002, '2011', 463, 13648116, 251538, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(279, 1815006, '2011', 509, 1042210, 6122, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(280, 1815007, '2011', 466, 2221177, 36301, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(281, 1815005, '2011', 919, 18991656, 23696494, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(282, 1815001, '2011', 220, 1678121, 25753, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(283, 1823004, '2011', 471, 467674, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(284, 1823015, '2011', 362, 703445, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(285, 1823003, '2011', 800, 419880, 50500, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(286, 1823014, '2011', 130, 205403, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(287, 1823011, '2011', 1022, 333423, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(288, 1823001, '2011', 323, 75985, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(289, 1823002, '2011', 202, 59979, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(290, 1811001, '2011', 71, 1217985, 4995, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(291, 1811010, '2011', 62, 266690, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(292, 1811008, '2011', 59, 742813, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(293, 1811002, '2011', 35, 34778, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(294, 1811003, '2011', 3, 45220, 25526, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(295, 1811004, '2011', 14, 100198, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(296, 1811011, '2011', 45, 213699, 13685, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(297, 1811009, '2011', 82, 1138853, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(298, 1811005, '2011', 68, 1566149, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(299, 1811007, '2011', 11, 583819, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(300, 1811006, '2011', 22, 537946, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(301, 1820037, '2011', 148, 2894079, 125798, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(302, 1820034, '2011', 341, 3346858, 50465, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(303, 1820036, '2011', 293, 6199476, 114146, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(304, 1820031, '2011', 180, 2641700, 1463, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(305, 1820033, '2011', 166, 1809050, 788089, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(306, 1820032, '2011', 118, 2989376, 1858, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(307, 1820035, '2011', 190, 1959161, 93254, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(308, 1820038, '2011', 266, 1576313, 24625, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(309, 1818011, '2011', 59, 181041, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(310, 1818001, '2011', 306, 6872916, 2385536, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(311, 1818002, '2011', 82, 142542, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(312, 1818009, '2011', 108, 1982735, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(313, 1818007, '2011', 166, 557860, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(314, 1818005, '2011', 520, 1974487, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(315, 1818008, '2011', 232, 2230393, 27000, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(316, 1818012, '2011', 152, 129768, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(317, 1818006, '2011', 499, 4052042, 811775, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(318, 1818003, '2011', 96, 1449204, 12000, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(319, 1818010, '2011', 69, 2136286, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(320, 1832002, '2011', 498, 331709, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(321, 1832005, '2011', 335, 3013478, 23644, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(322, 1832008, '2011', 400, 3518286, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(323, 1832001, '2011', 271, 319931, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(324, 1832003, '2011', 443, 185388, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(325, 1832007, '2011', 288, 219802, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(326, 1816003, '2011', 118, 1558217, 428220, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(327, 1816004, '2011', 101, 5114614, 1067128, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(328, 1816007, '2011', 119, 3887679, 370941, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(329, 1816005, '2011', 160, 3624640, 2288213, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(330, 1816001, '2011', 185, 3539046, 40327, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(331, 1816006, '2011', 58, 749606, 563590, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(332, 1816002, '2011', 186, 5116439, 4123225, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(333, 1816008, '2011', 136, 8666518, 1793534, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(334, 1821007, '2011', 299, 14685747, 744308, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(335, 1821008, '2011', 262, 13519025, 708776, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(336, 1821006, '2011', 235, 9731470, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(337, 1821009, '2011', 250, 9036082, 1183011, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(338, 1821002, '2011', 356, 10678001, 691941, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(339, 1821003, '2011', 590, 16063324, 1629889, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(340, 1821004, '2011', 589, 17654669, 1796201, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(341, 1821005, '2011', 668, 19716217, 3718214, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(342, 1821010, '2011', 201, 11034865, 2625329, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(343, 1821001, '2011', 306, 16179318, 39371, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(344, 1814011, '2011', 81, 1992331, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(345, 1814007, '2011', 118, 2712506, 1353751, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(346, 1814003, '2011', 52, 1528465, 52866, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(347, 1814006, '2011', 145, 3675783, 103684, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(348, 1814002, '2011', 197, 3895804, 172661, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(349, 1814001, '2011', 312, 18583041, 4911728, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(350, 1814010, '2011', 150, 3730130, 574893, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(351, 1814004, '2011', 102, 1510958, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(352, 1814009, '2011', 86, 1899366, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(353, 1814012, '2011', 110, 2335399, 728257, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(354, 1814008, '2011', 104, 1503214, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(355, 1814005, '2011', 89, 2414877, 0, '0000-00-00 00:00:00', '2011-09-18 19:51:11', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', '');

-- --------------------------------------------------------

--
-- Table structure for table `rega_enrega_blockexpensesappendix`
--

CREATE TABLE IF NOT EXISTS `rega_enrega_blockexpensesappendix` (
  `UniqueId` int(11) NOT NULL,
  `BlockExpenseUniqueId` int(11) NOT NULL COMMENT 'Foreign Key from blockexpenses Table',
  `WorkTypeUniqueId` int(11) NOT NULL COMMENT 'Foreign_Key',
  `NoOfWorks` int(11) NOT NULL DEFAULT '0',
  `LabourExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `MaterialExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` datetime NOT NULL,
  `Link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UniqueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table will store the work-type wise expenditures for Bl';

-- --------------------------------------------------------

--
-- Table structure for table `rega_enrega_blocks`
--

CREATE TABLE IF NOT EXISTS `rega_enrega_blocks` (
  `UniqueId` int(10) NOT NULL,
  `BlockCode` varchar(10) DEFAULT NULL,
  `DistrictUniqueId` int(10) NOT NULL COMMENT 'Foreign Key from Districts Table',
  `BlockName_Mr` varchar(100) DEFAULT NULL,
  `BlockName_En` varchar(100) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` datetime NOT NULL,
  PRIMARY KEY (`UniqueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rega_enrega_blocks`
--

INSERT INTO `rega_enrega_blocks` (`UniqueId`, `BlockCode`, `DistrictUniqueId`, `BlockName_Mr`, `BlockName_En`, `CreatedOn`, `ModifiedOn`) VALUES
(1, '1809011', 1809, 'अकोले', 'AKOLA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '1809007', 1809, 'जामखेड', 'JAMKHED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '1809008', 1809, 'कर्जत', 'KARJAT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, '1809013', 1809, 'कोपरगाव', 'KOPARGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, '1809001', 1809, 'नगर', 'NAGAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, '1809004', 1809, 'नेवासा', 'NEVASA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, '1809010', 1809, 'पारनेर', 'PARNER', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, '1809006', 1809, 'पाथर्डी', 'PATHARDI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, '1809014', 1809, 'राहाता', 'RAHATA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, '1809002', 1809, 'राहुरी', 'RAHURI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, '1809012', 1809, 'संगमनेर', 'SANGAMNER', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, '1809005', 1809, 'शेवगाव', 'SHEVGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, '1809009', 1809, 'श्रीगोंदा', 'SHRIGONDA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, '1809003', 1809, 'श्रीरामपूर', 'SHRIRAMPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, '1823001', 1823, 'अकोला', 'AKOLA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, '1823002', 1823, 'अकोट', 'AKOT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, '1823015', 1823, 'बाळापूर', 'BALAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, '1823004', 1823, 'बार्शीटाकळी', 'BARSHITAKLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, '1823003', 1823, 'मुर्तिजापूर', 'MURTIJAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, '1823011', 1823, 'पातूर', 'PATUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, '1823014', 1823, 'तेल्हारा', 'telhara', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, '1824014', 1824, 'अचलपूर', 'ACHALPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, '1824016', 1824, 'अमरावती', 'AMRAVATI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, '1824009', 1824, 'अंजनगाव सुर्जी', 'ANJANGAON SURJI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, '1824007', 1824, 'भातकुली', 'BHATKULI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, '1824005', 1824, 'चांदूर रेल्वे', 'CHANDUR RAILWAY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, '1824013', 1824, 'चांदुर बाजार', 'CHANDURBAZAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, '1824011', 1824, 'चिखलदरा', 'CHIKHALDARA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, '1824008', 1824, 'दर्यापूर', 'DARYAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, '1824015', 1824, 'धामणगाव रेल्वे', 'DHAMANGAON RAILWAY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, '1824010', 1824, 'धरणी', 'DHARNI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, '1824002', 1824, 'मोर्शी', 'MORSHI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, '1824006', 1824, 'नांदगाव खंडेश्वर', 'NANDGAON KHANDESHWAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, '1824004', 1824, 'तिवसा', 'TEOSA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, '1824003', 1824, 'वरुड', 'WARUD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, '1815001', 1815, 'औरंगाबाद', 'AURANGABAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, '1815007', 1815, 'गंगापूर', 'GANAGAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, '1815003', 1815, 'कन्नड', 'KANNAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, '1815002', 1815, 'खुलताबाद', 'KHULDABAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, '1815006', 1815, 'पैठण', 'PAITHAN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, '1815009', 1815, 'फुलंब्री', 'PHULAMBRI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, '1815005', 1815, 'सिल्लोड', 'SILLOD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, '1815004', 1815, 'सोयगाव', 'SOEGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, '1815008', 1815, 'वैजापूर', 'VAIJAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, '1818012', 1818, 'अंबाजोगाई', 'AMBAJOGAI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, '1818007', 1818, 'आष्टी', 'ASHTI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, '1818001', 1818, 'बीड', 'BID', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, '1818010', 1818, 'धारूर', 'DHARUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, '1818002', 1818, 'गेवराई', 'GEORAI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, '1818005', 1818, 'केज', 'KAIJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, '1818003', 1818, 'माजलगाव', 'MANJLEGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, '1818011', 1818, 'परळी-वैद्यनाथ ', 'PARLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, '1818006', 1818, 'पाटोदा', 'PATODA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, '1818008', 1818, 'शिरूर', 'SHIRUR KASAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, '1818009', 1818, 'वडवणी', 'WADWANI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, '1828026', 1828, 'भंडारा', 'BHANDARA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, '1828025', 1828, 'लाखांदूर', 'LAKHANDUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, '1828023', 1828, 'लाखनी', 'LAKHANI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, '1828027', 1828, 'मोहाडी', 'MOHADI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, '1828022', 1828, 'पवनी', 'PAUNI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, '1828024', 1828, 'साकोली', 'SAKOLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, '1828021', 1828, 'तुमसर', 'TUMSAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, '1822001', 1822, 'बुलढाणा', 'BULDANA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, '1822009', 1822, 'चिखली', 'CHIKHLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, '1822013', 1822, 'देऊळगाव राजा', 'DEULGAON RAJA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, '1822005', 1822, 'जळगाव जामोद', 'JALGAON (JAMOD)', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, '1822008', 1822, 'खामगाव', 'KHAMGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, '1822011', 1822, 'लोणार', 'LONAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, '1822003', 1822, 'मलकापूर', 'MALKAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, '1822010', 1822, 'मेहकर', 'MEHKAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, '1822002', 1822, 'मोताळा', 'MOTALA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, '1822004', 1822, 'नांदुरा', 'NANDURA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, '1822006', 1822, 'संग्रामपूर', 'SANGRAMPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, '1822007', 1822, 'शेगाव', 'SHEGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, '1822012', 1822, 'सिंदखेडराजा', 'SINDKHED RAJA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, '1829012', 1829, 'बल्लारपूर', 'BALLARPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, '1829002', 1829, 'भद्रावती', 'BHADRAVATI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, '1829006', 1829, 'ब्रह्मपुरी', 'BRAHMAPURI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, '1829001', 1829, 'चंद्रपूर', 'CHANDRAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, '1829004', 1829, 'चिमूर', 'CHIMUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, '1829009', 1829, 'गोंडपिंपरी', 'GONDPIPRI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, '1829015', 1829, 'जिवती', 'JIVTI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, '1829013', 1829, 'कोरपना', 'KORPANA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, '1829008', 1829, 'मूल', 'MUL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, '1829005', 1829, 'नागभीड', 'NAGBHIR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, '1829016', 1829, 'पोंभुर्णा', 'POMBHURNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, '1829010', 1829, 'राजुरा', 'RAJURA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, '1829011', 1829, 'सावली', 'SAOLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, '1829014', 1829, 'सिंदेवाही', 'SINDEWAHI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, '1829003', 1829, 'वरोरा', 'WARORA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, '1807001', 1807, 'धुळे', 'DHULE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, '1807002', 1807, 'साक्री', 'SAKRI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, '1807010', 1807, 'शिंदखेडा', 'SHINDKHEDE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, '1807009', 1807, 'शिरपूर', 'SHIRPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, '1830007', 1830, 'अहेरी', 'AHERI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, '1830002', 1830, 'आरमोरी', 'ARMORI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, '1830012', 1830, 'भामरागड', 'BHAMARAGAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, '1830008', 1830, 'चामोर्शी', 'CHAMORSHI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, '1830011', 1830, 'देसाईगंज', 'DESAIGANJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, '1830004', 1830, 'धानोरा', 'DHANORA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, '1830005', 1830, 'एटापल्ली', 'ETAPALLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, '1830001', 1830, 'गडचिरोली', 'GADCHIROLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, '1830010', 1830, 'कोरची', 'KORCHI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, '1830003', 1830, 'कुरखेडा', 'KURKHEDA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, '1830009', 1830, 'मुलचेरा', 'MULCHERA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, '1830006', 1830, 'सिरोंचा', 'SIRONCHA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, '1833004', 1833, 'आमगाव', 'Amgaon', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, '1833007', 1833, 'अर्जुनी मोरगाव', 'Arjuni Morgaon', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, '1833008', 1833, 'देवरी', 'Deori', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, '1833001', 1833, 'गोंदिया', 'Gondia', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, '1833003', 1833, 'गोरेगाव', 'Goregaon', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, '1833006', 1833, 'सडक अर्जुनी ', 'Sadak Arjuni', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, '1833005', 1833, 'सालेकसा', 'Salekasa', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, '1833002', 1833, 'तिरोडा', 'Tiroda', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, '1834008', 1834, 'औंढा', 'AUNDHA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, '1834007', 1834, 'बासमत', 'BASMATH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, '1834010', 1834, 'हिंगोली', 'HINGOLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, '1834006', 1834, 'कळमनुरी', 'KALAMNURI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, '1834009', 1834, 'सेनगाव', 'SENGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, '1808013', 1808, 'अमळनेर', 'AMALNER', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, '1808010', 1808, 'भडगाव', 'BHADGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, '1808006', 1808, 'भुसावळ', 'BHUSAWAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, '1808014', 1808, 'बोदवड', 'BODWAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, '1808009', 1808, 'चाळीसगाव', 'CHALISGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, '1808002', 1808, 'चोपडा', 'CHOPDA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, '1808015', 1808, 'धारगाव', 'DHARANGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, '1808012', 1808, 'एरंडोल', 'ERANDOL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, '1808001', 1808, 'जळगाव', 'JALGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, '1808007', 1808, 'जामनेर', 'JAMNER', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, '1808016', 1808, 'मुक्ताईनगर', 'MUKTAINAGAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, '1808008', 1808, 'पाचोरा', 'PACHORA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, '1808011', 1808, 'पारोळा', 'PAROLA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, '1808004', 1808, 'रावेर', 'RAVER', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, '1808003', 1808, 'यावल', 'YAWAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, '1816005', 1816, 'अंबड', 'AMBAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, '1816006', 1816, 'बदनापूर', 'BADNAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, '1816002', 1816, 'भोकरदन', 'BHOKARDAN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, '1816007', 1816, 'घणसवंगी', 'GHANSAVANGI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, '1816003', 1816, 'जाफराबाद', 'JAFRABAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, '1816001', 1816, 'जालना', 'JALNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, '1816008', 1816, 'मंठा', 'MANTHA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, '1816004', 1816, 'परतूर', 'PARTUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, '1814008', 1814, 'आजरा', 'AJRA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, '1814011', 1814, 'बावडा', 'BAVDA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, '1814009', 1814, 'भुदरगड', 'BHUDARGAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, '1814007', 1814, 'चंदगड', 'CHANDGAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, '1814006', 1814, 'गडहिंग्लज', 'GADHINGLAJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, '1814003', 1814, 'हातकणंगले', 'HATKANANGALE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, '1814005', 1814, 'कागल', 'KAGAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, '1814001', 1814, 'करवीर', 'KARVIR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, '1814002', 1814, 'पन्हाळा', 'PANHALA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, '1814010', 1814, 'राधानगरी', 'RADHANAGARI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, '1814012', 1814, 'शाहूवाडी', 'SHAHUWADI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, '1814004', 1814, 'शिरोळ', 'SHIROL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, '1821002', 1821, 'अहमदपूर', 'AHMADPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, '1821005', 1821, 'औसा', 'AUSA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, '1821007', 1821, 'चाकूर', 'CHAKUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, '1821010', 1821, 'देवणी', 'DEONI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, '1821009', 1821, 'जाळकोट', 'JALKOT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, '1821001', 1821, 'लातूर', 'LATUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, '1821004', 1821, 'निलंगा', 'NILANGA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, '1821006', 1821, 'रेणापूर', 'RENAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, '1821008', 1821, 'शिरूर अनंतपाळ', 'SHIRUR ANANTPAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, '1821003', 1821, 'उदगीर', 'UDGIR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, '1827008', 1827, 'भिवापूर', 'BHIWAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, '1827011', 1827, 'हिंगणा', 'HINGNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, '1827014', 1827, 'कळमेश्वर', 'KALAMESHWAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, '1827006', 1827, 'कामठी', 'KAMPTEE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, '1827012', 1827, 'काटोल', 'KATOL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, '1827007', 1827, 'कुही', 'KUHI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, '1827005', 1827, 'मौदा', 'MOUDA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, '1827010', 1827, 'नागपूर ग्रामीण', 'NAGPUR (RURAL)', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, '1827013', 1827, 'नरखेड', 'NARKHED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, '1827003', 1827, 'पारशिवनी', 'PARSEONI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, '1827004', 1827, 'रामटेक', 'RAMTEK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, '1827002', 1827, 'सावनेर', 'SAVNER', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, '1827009', 1827, 'उमरेड', 'UMRED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, '1819011', 1819, 'अर्धापूर', 'ARDHAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, '1819004', 1819, 'भोकर', 'BHOKAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, '1819005', 1819, 'बिलोली', 'BILOLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, '1819006', 1819, 'देगलूर', 'DEGLUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, '1819013', 1819, 'धर्माबाद', 'DHARMABAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, '1819002', 1819, 'हदगाव', 'HADGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, '1819015', 1819, 'हिमायतनगर', 'HIMAYATNAGAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, '1819008', 1819, 'कंधार', 'KANDHAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, '1819003', 1819, 'किनवट', 'KINWAT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, '1819010', 1819, 'लोहा', 'LOHA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, '1819016', 1819, 'माहूर', 'MAHUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, '1819009', 1819, 'मुदखेड', 'MUDKHED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, '1819007', 1819, 'मुखेड', 'MUKHED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, '1819012', 1819, 'नायगाव ', 'NAIGAON (KH)', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, '1819001', 1819, 'नांदेड', 'NANDED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, '1819014', 1819, 'उमरी', 'UMRI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, '1831002', 1831, 'अक्कलकुवा', 'Akkalkuwa', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, '1831003', 1831, 'अक्राणी', 'Akrani', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, '1831006', 1831, 'नंदुरबार', 'Nandurbar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, '1831007', 1831, 'नवापूर', 'Navapur', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, '1831005', 1831, 'शहादा', 'Shahada', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, '1831004', 1831, 'तळोदा', 'Taloda', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, '1806006', 1806, 'बागलाण', 'BAGLAN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, '1806008', 1806, 'चांदवड', 'CHANDVAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, '1806014', 1806, 'देवला', 'DEOLA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, '1806003', 1806, 'दिंडोरी', 'DINDORI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, '1806013', 1806, 'इगतपुरी', 'IGATPURI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, '1806005', 1806, 'कळवण', 'KALWAN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, '1806007', 1806, 'मालेगाव', 'MALEGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, '1806009', 1806, 'नांदगाव', 'NANDGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, '1806001', 1806, 'नाशिक', 'NASHIK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, '1806011', 1806, 'निफाड', 'NIPHAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, '1806002', 1806, 'पेठ', 'PEINT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, '1806012', 1806, 'सिन्नर', 'SINNAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, '1806004', 1806, 'सुरगाणा', 'SURGANA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, '1806015', 1806, 'त्र्यंबकेश्वर', 'TRIMBAKESHWAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, '1806010', 1806, 'येवला', 'YEVLA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, '1820031', 1820, 'भूम', 'Bhoom', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, '1820034', 1820, 'कळंब', 'KALAMB', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, '1820032', 1820, 'लोहारा', 'LOHARA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, '1820035', 1820, 'उमरगा', 'OMERGA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, '1820037', 1820, 'उस्मानाबाद', 'OSMANABAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, '1820033', 1820, 'परांडा', 'PARANDA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, '1820036', 1820, 'तुळजापूर', 'TULJAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, '1820038', 1820, 'वाशी', 'WASHI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, '1817014', 1817, 'गंगाखेड', 'GANGAKHED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, '1817015', 1817, 'जिंतूर', 'JINTUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, '1817012', 1817, 'मानवत', 'Manwath', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, '1817010', 1817, 'पालम', 'Palam', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, '1817016', 1817, 'परभणी', 'PARBHANI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, '1817013', 1817, 'पाथरी', 'PATHRI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, '1817008', 1817, 'पूर्णा', 'Purna', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, '1817011', 1817, 'सेलू', 'Selu', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, '1817009', 1817, 'सोनपेठ', 'Sonpeth', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, '1810004', 1810, 'आंबेगाव', 'AMBEGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, '1810009', 1810, 'बारामती', 'BARAMATI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, '1810011', 1810, 'भोर', 'BHOR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, '1810007', 1810, 'दौंड', 'DAUND', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, '1810002', 1810, 'हवेली', 'HAVELI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, '1810008', 1810, 'इंदापूर', 'INDAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, '1810005', 1810, 'जुन्नर', 'JUNNAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, '1810003', 1810, 'खेड', 'KHED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, '1810014', 1810, 'मावळ', 'MAWAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, '1810013', 1810, 'मुळशी', 'MULSHI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, '1810010', 1810, 'पुरंदर', 'PURANDHAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, '1810006', 1810, 'शिरूर', 'SHIRUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, '1810012', 1810, 'वेल्हे', 'VELHE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, '1803001', 1803, 'अलिबाग', 'ALIBAG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, '1803004', 1803, 'कर्जत', 'KARJAT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, '1803005', 1803, 'खालापूर', 'KHALAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, '1803010', 1803, 'महाड', 'MAHAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, '1803009', 1803, 'माणगाव', 'MANGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, '1803012', 1803, 'म्हसळा', 'MHASLA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, '1803014', 1803, 'मुरुड', 'MURUD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, '1803003', 1803, 'पनवेल', 'PANVEL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, '1803006', 1803, 'पेण', 'PEN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, '1803011', 1803, 'पोलादपूर', 'POLADPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, '1803008', 1803, 'रोहा', 'ROHA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, '1803013', 1803, 'श्रीवर्धन', 'SHRIWARDHAN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, '1803007', 1803, 'सुधागड', 'SUDHAGAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, '1803015', 1803, 'तळा', 'TALA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, '1803002', 1803, 'उरण', 'URAN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, '1804006', 1804, 'चिपळून', 'CHIPLUN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, '1804003', 1804, 'दापोली', 'DAPOLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, '1804002', 1804, 'गुहागर', 'GUHAGAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, '1804005', 1804, 'खेड', 'KHED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, '1804008', 1804, 'लांजा', 'LANJA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, '1804004', 1804, 'मंडणगड', 'MANDANGAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, '1804009', 1804, 'राजापूर', 'RAJAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, '1804001', 1804, 'रत्नागिरी', 'RATNAGIRI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, '1804007', 1804, 'संगमेश्वर', 'SANGAMESHWAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, '1812004', 1812, 'आटपाडी', 'ATPADI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, '1812005', 1812, 'जत', 'JATH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, '1812010', 1812, 'कडेगाव', 'KADEGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, '1812006', 1812, 'कवठेमहांकळ', 'KAVATHE-MAHANKAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, '1812003', 1812, 'खानापूर', 'KHANAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, '1812001', 1812, 'मिरज', 'MIRAJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, '1812009', 1812, 'पलुस', 'PALUS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, '1812008', 1812, 'शिराळा', 'SHIRALA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, '1812002', 1812, 'तासगाव', 'TASGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, '1812007', 1812, 'वाळवा', 'WALWA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, '1811010', 1811, 'जावळी', 'JAOLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, '1811008', 1811, 'कराड', 'KARAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, '1811003', 1811, 'खंडाला', 'KHANDALA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, '1811007', 1811, 'खटाव', 'KHATAV', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, '1811004', 1811, 'कोरेगाव', 'KOREGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, '1811011', 1811, 'महाबळेश्वर', 'MAHABALESHWAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, '1811006', 1811, 'माण', 'MAN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, '1811009', 1811, 'पाटण', 'PATAN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, '1811005', 1811, 'फलटण', 'PHALTAN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, '1811001', 1811, 'सातारा', 'SATARA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, '1811002', 1811, 'वाई', 'WAI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, '1805003', 1805, 'देवगड', 'DEVGAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, '1805008', 1805, 'दोडामार्ग', 'DODAMARG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, '1805005', 1805, 'कणकवली', 'KANKAVALI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, '1805001', 1805, 'कुडाळ', 'KUDAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, '1805002', 1805, 'मालवण', 'MALWAN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, '1805006', 1805, 'सावंतवाडी', 'SAWANTWADI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, '1805004', 1805, 'वैभववाडी', 'VAIBHAVVADI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, '1805007', 1805, 'वेंगुर्ला', 'VENGURLA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, '1813003', 1813, 'अक्कलकोट', 'AKKALKOT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, '1813002', 1813, 'बार्शी', 'BARSHI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, '1813010', 1813, 'करमाळा', 'KARMALA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, '1813011', 1813, 'मढा', 'MADHA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, '1813009', 1813, 'माळशिरस', 'MALSHIRAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, '1813006', 1813, 'मंगळवेढा', 'MANGALVEDHE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, '1813005', 1813, 'मोहोळ', 'MOHOL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, '1813007', 1813, 'पंढरपूर', 'PANDHARPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, '1813008', 1813, 'सांगोला', 'SANGOLE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, '1813001', 1813, 'उत्तर सोलापूर', 'SOLAPUR NORTH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, '1813004', 1813, 'दक्षिण सोलापूर', 'SOLAPUR SOUTH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(309, '1802015', 1802, 'अंबरनाथ', 'AMBERNATH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, '1802009', 1802, 'भिवंडी', 'BHIWANDI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(311, '1802004', 1802, 'डहाणू', 'DAHANU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, '1802006', 1802, 'जव्हार', 'JAWHAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, '1802012', 1802, 'कल्याण', 'KALYAN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, '1802007', 1802, 'मोखाडा', 'MOKHADA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(315, '1802011', 1802, 'मुरबाड', 'MURBAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, '1802003', 1802, 'पालघर', 'PALGHAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, '1802010', 1802, 'शहापूर', 'SHAHAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, '1802005', 1802, 'तलासरी', 'TALASARI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, '1802002', 1802, 'वसई', 'VASAI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, '1802014', 1802, 'विक्रमगड', 'VIKRAMGAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(321, '1802008', 1802, 'वाडा', 'WADA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(322, '1826006', 1826, 'आर्वी', 'ARVI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(323, '1826007', 1826, 'आष्टी', 'ASHTI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(324, '1826005', 1826, 'देवळी', 'DEOLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(325, '1826004', 1826, 'हिंगणघाट', 'HINGANGHAT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, '1826008', 1826, 'कारंजा', 'KARANJA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, '1826003', 1826, 'समुद्रपूर', 'SAMUDRAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(328, '1826002', 1826, 'सेलू', 'SELOO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(329, '1826001', 1826, 'वर्धा', 'WARDHA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(330, '1832008', 1832, 'कारंजा', 'KARANJA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(331, '1832002', 1832, 'मालेगाव', 'MALEGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(332, '1832005', 1832, 'मंगरूळपीर', 'MANGRULPIR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(333, '1832007', 1832, 'मनोरा', 'MANORA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(334, '1832003', 1832, 'रिसोड', 'RISOD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(335, '1832001', 1832, 'वाशिम', 'WASHIM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(336, '1825015', 1825, 'आर्णी', 'ARNI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(337, '1825002', 1825, 'बाभुळगाव', 'BABULGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(338, '1825013', 1825, 'दारव्हा', 'DARWHA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(339, '1825012', 1825, 'दिग्रस', 'DIGRAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(340, '1825008', 1825, 'घाटंजी', 'GHATANJI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(341, '1825003', 1825, 'कळंब', 'KALAMB', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(342, '1825007', 1825, 'केळापूर', 'KELAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(343, '1825010', 1825, 'महागाव', 'MAHAGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(344, '1825018', 1825, 'मारेगाव', 'MAREGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(345, '1825014', 1825, 'नेर', 'NER', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(346, '1825011', 1825, 'पुसद', 'PUSAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(347, '1825004', 1825, 'राळेगाव', 'RALEGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(348, '1825009', 1825, 'उमरखेड', 'UMARKHED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(349, '1825006', 1825, 'वणी', 'WANI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(350, '1825017', 1825, 'यवतमाळ', 'YAVATMAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(351, '1825016', 1825, 'झारी जामणी', 'ZARI JAMNI', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `rega_enrega_blocks_bak`
--

CREATE TABLE IF NOT EXISTS `rega_enrega_blocks_bak` (
  `UniqueId` int(10) NOT NULL,
  `BlockCode` varchar(10) DEFAULT NULL,
  `DistrictUniqueId` int(10) NOT NULL COMMENT 'Foreign Key from Districts Table',
  `BlockName_Mr` varchar(100) DEFAULT NULL,
  `BlockName_En` varchar(100) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` datetime NOT NULL,
  PRIMARY KEY (`UniqueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rega_enrega_blocks_bak`
--

INSERT INTO `rega_enrega_blocks_bak` (`UniqueId`, `BlockCode`, `DistrictUniqueId`, `BlockName_Mr`, `BlockName_En`, `CreatedOn`, `ModifiedOn`) VALUES
(1, '1809011', 1809, 'AKOLA', 'AKOLA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '1809007', 1809, 'JAMKHED', 'JAMKHED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '1809008', 1809, 'KARJAT', 'KARJAT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, '1809013', 1809, 'KOPARGAON', 'KOPARGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, '1809001', 1809, 'NAGAR', 'NAGAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, '1809004', 1809, 'NEVASA', 'NEVASA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, '1809010', 1809, 'PARNER', 'PARNER', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, '1809006', 1809, 'PATHARDI', 'PATHARDI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, '1809014', 1809, 'RAHATA', 'RAHATA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, '1809002', 1809, 'RAHURI', 'RAHURI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, '1809012', 1809, 'SANGAMNER', 'SANGAMNER', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, '1809005', 1809, 'SHEVGAON', 'SHEVGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, '1809009', 1809, 'SHRIGONDA', 'SHRIGONDA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, '1809003', 1809, 'SHRIRAMPUR', 'SHRIRAMPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, '1823001', 1823, 'AKOLA', 'AKOLA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, '1823002', 1823, 'AKOT', 'AKOT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, '1823015', 1823, 'BALAPUR', 'BALAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, '1823004', 1823, 'BARSHITAKLI', 'BARSHITAKLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, '1823003', 1823, 'MURTIJAPUR', 'MURTIJAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, '1823011', 1823, 'PATUR', 'PATUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, '1823014', 1823, 'telhara', 'telhara', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, '1824014', 1824, 'ACHALPUR', 'ACHALPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, '1824016', 1824, 'AMRAVATI', 'AMRAVATI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, '1824009', 1824, 'ANJANGAON SURJI', 'ANJANGAON SURJI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, '1824007', 1824, 'BHATKULI', 'BHATKULI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, '1824005', 1824, 'CHANDUR RAILWAY', 'CHANDUR RAILWAY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, '1824013', 1824, 'CHANDURBAZAR', 'CHANDURBAZAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, '1824011', 1824, 'CHIKHALDARA', 'CHIKHALDARA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, '1824008', 1824, 'DARYAPUR', 'DARYAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, '1824015', 1824, 'DHAMANGAON RAILWAY', 'DHAMANGAON RAILWAY', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, '1824010', 1824, 'DHARNI', 'DHARNI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, '1824002', 1824, 'MORSHI', 'MORSHI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, '1824006', 1824, 'NANDGAON KHANDESHWAR', 'NANDGAON KHANDESHWAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, '1824004', 1824, 'TEOSA', 'TEOSA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, '1824003', 1824, 'WARUD', 'WARUD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, '1815001', 1815, 'AURANGABAD', 'AURANGABAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, '1815007', 1815, 'GANAGAPUR', 'GANAGAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, '1815003', 1815, 'KANNAD', 'KANNAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, '1815002', 1815, 'KHULDABAD', 'KHULDABAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, '1815006', 1815, 'PAITHAN', 'PAITHAN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, '1815009', 1815, 'PHULAMBRI', 'PHULAMBRI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, '1815005', 1815, 'SILLOD', 'SILLOD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, '1815004', 1815, 'SOEGAON', 'SOEGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, '1815008', 1815, 'VAIJAPUR', 'VAIJAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, '1818012', 1818, 'AMBAJOGAI', 'AMBAJOGAI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, '1818007', 1818, 'ASHTI', 'ASHTI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, '1818001', 1818, 'BID', 'BID', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, '1818010', 1818, 'DHARUR', 'DHARUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, '1818002', 1818, 'GEORAI', 'GEORAI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, '1818005', 1818, 'KAIJ', 'KAIJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, '1818003', 1818, 'MANJLEGAON', 'MANJLEGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, '1818011', 1818, 'PARLI', 'PARLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, '1818006', 1818, 'PATODA', 'PATODA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, '1818008', 1818, 'SHIRUR KASAR', 'SHIRUR KASAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, '1818009', 1818, 'WADWANI', 'WADWANI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, '1828026', 1828, 'BHANDARA', 'BHANDARA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, '1828025', 1828, 'LAKHANDUR', 'LAKHANDUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, '1828023', 1828, 'LAKHANI', 'LAKHANI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, '1828027', 1828, 'MOHADI', 'MOHADI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, '1828022', 1828, 'PAUNI', 'PAUNI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, '1828024', 1828, 'SAKOLI', 'SAKOLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, '1828021', 1828, 'TUMSAR', 'TUMSAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, '1822001', 1822, 'BULDANA', 'BULDANA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, '1822009', 1822, 'CHIKHLI', 'CHIKHLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, '1822013', 1822, 'DEULGAON RAJA', 'DEULGAON RAJA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, '1822005', 1822, 'JALGAON (JAMOD)', 'JALGAON (JAMOD)', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, '1822008', 1822, 'KHAMGAON', 'KHAMGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, '1822011', 1822, 'LONAR', 'LONAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, '1822003', 1822, 'MALKAPUR', 'MALKAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, '1822010', 1822, 'MEHKAR', 'MEHKAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, '1822002', 1822, 'MOTALA', 'MOTALA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, '1822004', 1822, 'NANDURA', 'NANDURA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, '1822006', 1822, 'SANGRAMPUR', 'SANGRAMPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, '1822007', 1822, 'SHEGAON', 'SHEGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, '1822012', 1822, 'SINDKHED RAJA', 'SINDKHED RAJA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, '1829012', 1829, 'BALLARPUR', 'BALLARPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, '1829002', 1829, 'BHADRAVATI', 'BHADRAVATI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, '1829006', 1829, 'BRAHMAPURI', 'BRAHMAPURI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, '1829001', 1829, 'CHANDRAPUR', 'CHANDRAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, '1829004', 1829, 'CHIMUR', 'CHIMUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, '1829009', 1829, 'GONDPIPRI', 'GONDPIPRI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, '1829015', 1829, 'JIVTI', 'JIVTI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, '1829013', 1829, 'KORPANA', 'KORPANA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, '1829008', 1829, 'MUL', 'MUL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, '1829005', 1829, 'NAGBHIR', 'NAGBHIR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, '1829016', 1829, 'POMBHURNA', 'POMBHURNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, '1829010', 1829, 'RAJURA', 'RAJURA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, '1829011', 1829, 'SAOLI', 'SAOLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, '1829014', 1829, 'SINDEWAHI', 'SINDEWAHI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, '1829003', 1829, 'WARORA', 'WARORA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, '1807001', 1807, 'DHULE', 'DHULE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, '1807002', 1807, 'SAKRI', 'SAKRI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, '1807010', 1807, 'SHINDKHEDE', 'SHINDKHEDE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, '1807009', 1807, 'SHIRPUR', 'SHIRPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, '1830007', 1830, 'AHERI', 'AHERI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, '1830002', 1830, 'ARMORI', 'ARMORI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, '1830012', 1830, 'BHAMARAGAD', 'BHAMARAGAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, '1830008', 1830, 'CHAMORSHI', 'CHAMORSHI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, '1830011', 1830, 'DESAIGANJ', 'DESAIGANJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, '1830004', 1830, 'DHANORA', 'DHANORA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, '1830005', 1830, 'ETAPALLI', 'ETAPALLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, '1830001', 1830, 'GADCHIROLI', 'GADCHIROLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, '1830010', 1830, 'KORCHI', 'KORCHI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, '1830003', 1830, 'KURKHEDA', 'KURKHEDA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, '1830009', 1830, 'MULCHERA', 'MULCHERA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, '1830006', 1830, 'SIRONCHA', 'SIRONCHA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, '1833004', 1833, 'Amgaon', 'Amgaon', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, '1833007', 1833, 'Arjuni Morgaon', 'Arjuni Morgaon', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, '1833008', 1833, 'Deori', 'Deori', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, '1833001', 1833, 'Gondia', 'Gondia', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, '1833003', 1833, 'Goregaon', 'Goregaon', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, '1833006', 1833, 'Sadak Arjuni', 'Sadak Arjuni', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, '1833005', 1833, 'Salekasa', 'Salekasa', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, '1833002', 1833, 'Tiroda', 'Tiroda', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, '1834008', 1834, 'AUNDHA', 'AUNDHA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, '1834007', 1834, 'BASMATH', 'BASMATH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, '1834010', 1834, 'HINGOLI', 'HINGOLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, '1834006', 1834, 'KALAMNURI', 'KALAMNURI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, '1834009', 1834, 'SENGAON', 'SENGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, '1808013', 1808, 'AMALNER', 'AMALNER', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, '1808010', 1808, 'BHADGAON', 'BHADGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, '1808006', 1808, 'BHUSAWAL', 'BHUSAWAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, '1808014', 1808, 'BODWAD', 'BODWAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, '1808009', 1808, 'CHALISGAON', 'CHALISGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, '1808002', 1808, 'CHOPDA', 'CHOPDA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, '1808015', 1808, 'DHARANGAON', 'DHARANGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, '1808012', 1808, 'ERANDOL', 'ERANDOL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, '1808001', 1808, 'JALGAON', 'JALGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, '1808007', 1808, 'JAMNER', 'JAMNER', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, '1808016', 1808, 'MUKTAINAGAR', 'MUKTAINAGAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, '1808008', 1808, 'PACHORA', 'PACHORA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, '1808011', 1808, 'PAROLA', 'PAROLA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, '1808004', 1808, 'RAVER', 'RAVER', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, '1808003', 1808, 'YAWAL', 'YAWAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, '1816005', 1816, 'AMBAD', 'AMBAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, '1816006', 1816, 'BADNAPUR', 'BADNAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, '1816002', 1816, 'BHOKARDAN', 'BHOKARDAN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, '1816007', 1816, 'GHANSAVANGI', 'GHANSAVANGI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, '1816003', 1816, 'JAFRABAD', 'JAFRABAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, '1816001', 1816, 'JALNA', 'JALNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, '1816008', 1816, 'MANTHA', 'MANTHA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, '1816004', 1816, 'PARTUR', 'PARTUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, '1814008', 1814, 'AJRA', 'AJRA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, '1814011', 1814, 'BAVDA', 'BAVDA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, '1814009', 1814, 'BHUDARGAD', 'BHUDARGAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, '1814007', 1814, 'CHANDGAD', 'CHANDGAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, '1814006', 1814, 'GADHINGLAJ', 'GADHINGLAJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, '1814003', 1814, 'HATKANANGALE', 'HATKANANGALE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, '1814005', 1814, 'KAGAL', 'KAGAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, '1814001', 1814, 'KARVIR', 'KARVIR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, '1814002', 1814, 'PANHALA', 'PANHALA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, '1814010', 1814, 'RADHANAGARI', 'RADHANAGARI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, '1814012', 1814, 'SHAHUWADI', 'SHAHUWADI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, '1814004', 1814, 'SHIROL', 'SHIROL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, '1821002', 1821, 'AHMADPUR', 'AHMADPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, '1821005', 1821, 'AUSA', 'AUSA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, '1821007', 1821, 'CHAKUR', 'CHAKUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, '1821010', 1821, 'DEONI', 'DEONI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, '1821009', 1821, 'JALKOT', 'JALKOT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, '1821001', 1821, 'LATUR', 'LATUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, '1821004', 1821, 'NILANGA', 'NILANGA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, '1821006', 1821, 'RENAPUR', 'RENAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, '1821008', 1821, 'SHIRUR ANANTPAL', 'SHIRUR ANANTPAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, '1821003', 1821, 'UDGIR', 'UDGIR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, '1827008', 1827, 'BHIWAPUR', 'BHIWAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, '1827011', 1827, 'HINGNA', 'HINGNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, '1827014', 1827, 'KALAMESHWAR', 'KALAMESHWAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, '1827006', 1827, 'KAMPTEE', 'KAMPTEE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, '1827012', 1827, 'KATOL', 'KATOL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, '1827007', 1827, 'KUHI', 'KUHI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, '1827005', 1827, 'MOUDA', 'MOUDA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, '1827010', 1827, 'NAGPUR (RURAL)', 'NAGPUR (RURAL)', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, '1827013', 1827, 'NARKHED', 'NARKHED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, '1827003', 1827, 'PARSEONI', 'PARSEONI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, '1827004', 1827, 'RAMTEK', 'RAMTEK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, '1827002', 1827, 'SAVNER', 'SAVNER', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, '1827009', 1827, 'UMRED', 'UMRED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, '1819011', 1819, 'ARDHAPUR', 'ARDHAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, '1819004', 1819, 'BHOKAR', 'BHOKAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, '1819005', 1819, 'BILOLI', 'BILOLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, '1819006', 1819, 'DEGLUR', 'DEGLUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, '1819013', 1819, 'DHARMABAD', 'DHARMABAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, '1819002', 1819, 'HADGAON', 'HADGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, '1819015', 1819, 'HIMAYATNAGAR', 'HIMAYATNAGAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, '1819008', 1819, 'KANDHAR', 'KANDHAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, '1819003', 1819, 'KINWAT', 'KINWAT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, '1819010', 1819, 'LOHA', 'LOHA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, '1819016', 1819, 'MAHUR', 'MAHUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, '1819009', 1819, 'MUDKHED', 'MUDKHED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, '1819007', 1819, 'MUKHED', 'MUKHED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, '1819012', 1819, 'NAIGAON (KH)', 'NAIGAON (KH)', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, '1819001', 1819, 'NANDED', 'NANDED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, '1819014', 1819, 'UMRI', 'UMRI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, '1831002', 1831, 'Akkalkuwa', 'Akkalkuwa', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, '1831003', 1831, 'Akrani', 'Akrani', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, '1831006', 1831, 'Nandurbar', 'Nandurbar', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, '1831007', 1831, 'Navapur', 'Navapur', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, '1831005', 1831, 'Shahada', 'Shahada', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, '1831004', 1831, 'Taloda', 'Taloda', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, '1806006', 1806, 'BAGLAN', 'BAGLAN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, '1806008', 1806, 'CHANDVAD', 'CHANDVAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, '1806014', 1806, 'DEOLA', 'DEOLA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, '1806003', 1806, 'DINDORI', 'DINDORI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, '1806013', 1806, 'IGATPURI', 'IGATPURI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, '1806005', 1806, 'KALWAN', 'KALWAN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, '1806007', 1806, 'MALEGAON', 'MALEGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, '1806009', 1806, 'NANDGAON', 'NANDGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, '1806001', 1806, 'NASHIK', 'NASHIK', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, '1806011', 1806, 'NIPHAD', 'NIPHAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, '1806002', 1806, 'PEINT', 'PEINT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, '1806012', 1806, 'SINNAR', 'SINNAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, '1806004', 1806, 'SURGANA', 'SURGANA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, '1806015', 1806, 'TRIMBAKESHWAR', 'TRIMBAKESHWAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, '1806010', 1806, 'YEVLA', 'YEVLA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, '1820031', 1820, 'Bhoom', 'Bhoom', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, '1820034', 1820, 'KALAMB', 'KALAMB', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, '1820032', 1820, 'LOHARA', 'LOHARA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, '1820035', 1820, 'OMERGA', 'OMERGA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, '1820037', 1820, 'OSMANABAD', 'OSMANABAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, '1820033', 1820, 'PARANDA', 'PARANDA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, '1820036', 1820, 'TULJAPUR', 'TULJAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, '1820038', 1820, 'WASHI', 'WASHI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, '1817014', 1817, 'GANGAKHED', 'GANGAKHED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, '1817015', 1817, 'JINTUR', 'JINTUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, '1817012', 1817, 'Manwath', 'Manwath', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, '1817010', 1817, 'Palam', 'Palam', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, '1817016', 1817, 'PARBHANI', 'PARBHANI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, '1817013', 1817, 'PATHRI', 'PATHRI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, '1817008', 1817, 'Purna', 'Purna', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, '1817011', 1817, 'Selu', 'Selu', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, '1817009', 1817, 'Sonpeth', 'Sonpeth', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, '1810004', 1810, 'AMBEGAON', 'AMBEGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, '1810009', 1810, 'BARAMATI', 'BARAMATI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, '1810011', 1810, 'BHOR', 'BHOR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, '1810007', 1810, 'DAUND', 'DAUND', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, '1810002', 1810, 'HAVELI', 'HAVELI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, '1810008', 1810, 'INDAPUR', 'INDAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, '1810005', 1810, 'JUNNAR', 'JUNNAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, '1810003', 1810, 'KHED', 'KHED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, '1810014', 1810, 'MAWAL', 'MAWAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, '1810013', 1810, 'MULSHI', 'MULSHI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, '1810010', 1810, 'PURANDHAR', 'PURANDHAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, '1810006', 1810, 'SHIRUR', 'SHIRUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, '1810012', 1810, 'VELHE', 'VELHE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, '1803001', 1803, 'ALIBAG', 'ALIBAG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, '1803004', 1803, 'KARJAT', 'KARJAT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, '1803005', 1803, 'KHALAPUR', 'KHALAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, '1803010', 1803, 'MAHAD', 'MAHAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, '1803009', 1803, 'MANGAON', 'MANGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, '1803012', 1803, 'MHASLA', 'MHASLA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, '1803014', 1803, 'MURUD', 'MURUD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, '1803003', 1803, 'PANVEL', 'PANVEL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, '1803006', 1803, 'PEN', 'PEN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, '1803011', 1803, 'POLADPUR', 'POLADPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, '1803008', 1803, 'ROHA', 'ROHA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, '1803013', 1803, 'SHRIWARDHAN', 'SHRIWARDHAN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, '1803007', 1803, 'SUDHAGAD', 'SUDHAGAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, '1803015', 1803, 'TALA', 'TALA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, '1803002', 1803, 'URAN', 'URAN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, '1804006', 1804, 'CHIPLUN', 'CHIPLUN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, '1804003', 1804, 'DAPOLI', 'DAPOLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, '1804002', 1804, 'GUHAGAR', 'GUHAGAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, '1804005', 1804, 'KHED', 'KHED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, '1804008', 1804, 'LANJA', 'LANJA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, '1804004', 1804, 'MANDANGAD', 'MANDANGAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, '1804009', 1804, 'RAJAPUR', 'RAJAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, '1804001', 1804, 'RATNAGIRI', 'RATNAGIRI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, '1804007', 1804, 'SANGAMESHWAR', 'SANGAMESHWAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, '1812004', 1812, 'ATPADI', 'ATPADI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, '1812005', 1812, 'JATH', 'JATH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, '1812010', 1812, 'KADEGAON', 'KADEGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, '1812006', 1812, 'KAVATHE-MAHANKAL', 'KAVATHE-MAHANKAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, '1812003', 1812, 'KHANAPUR', 'KHANAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, '1812001', 1812, 'MIRAJ', 'MIRAJ', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, '1812009', 1812, 'PALUS', 'PALUS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, '1812008', 1812, 'SHIRALA', 'SHIRALA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, '1812002', 1812, 'TASGAON', 'TASGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, '1812007', 1812, 'WALWA', 'WALWA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, '1811010', 1811, 'JAOLI', 'JAOLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, '1811008', 1811, 'KARAD', 'KARAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, '1811003', 1811, 'KHANDALA', 'KHANDALA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, '1811007', 1811, 'KHATAV', 'KHATAV', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, '1811004', 1811, 'KOREGAON', 'KOREGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, '1811011', 1811, 'MAHABALESHWAR', 'MAHABALESHWAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, '1811006', 1811, 'MAN', 'MAN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, '1811009', 1811, 'PATAN', 'PATAN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, '1811005', 1811, 'PHALTAN', 'PHALTAN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, '1811001', 1811, 'SATARA', 'SATARA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, '1811002', 1811, 'WAI', 'WAI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, '1805003', 1805, 'DEVGAD', 'DEVGAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, '1805008', 1805, 'DODAMARG', 'DODAMARG', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, '1805005', 1805, 'KANKAVALI', 'KANKAVALI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, '1805001', 1805, 'KUDAL', 'KUDAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, '1805002', 1805, 'MALWAN', 'MALWAN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, '1805006', 1805, 'SAWANTWADI', 'SAWANTWADI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, '1805004', 1805, 'VAIBHAVVADI', 'VAIBHAVVADI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, '1805007', 1805, 'VENGURLA', 'VENGURLA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, '1813003', 1813, 'AKKALKOT', 'AKKALKOT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, '1813002', 1813, 'BARSHI', 'BARSHI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, '1813010', 1813, 'KARMALA', 'KARMALA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, '1813011', 1813, 'MADHA', 'MADHA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, '1813009', 1813, 'MALSHIRAS', 'MALSHIRAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, '1813006', 1813, 'MANGALVEDHE', 'MANGALVEDHE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, '1813005', 1813, 'MOHOL', 'MOHOL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, '1813007', 1813, 'PANDHARPUR', 'PANDHARPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, '1813008', 1813, 'SANGOLE', 'SANGOLE', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, '1813001', 1813, 'SOLAPUR NORTH', 'SOLAPUR NORTH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, '1813004', 1813, 'SOLAPUR SOUTH', 'SOLAPUR SOUTH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(309, '1802015', 1802, 'AMBERNATH', 'AMBERNATH', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, '1802009', 1802, 'BHIWANDI', 'BHIWANDI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(311, '1802004', 1802, 'DAHANU', 'DAHANU', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, '1802006', 1802, 'JAWHAR', 'JAWHAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, '1802012', 1802, 'KALYAN', 'KALYAN', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, '1802007', 1802, 'MOKHADA', 'MOKHADA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(315, '1802011', 1802, 'MURBAD', 'MURBAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, '1802003', 1802, 'PALGHAR', 'PALGHAR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, '1802010', 1802, 'SHAHAPUR', 'SHAHAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, '1802005', 1802, 'TALASARI', 'TALASARI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, '1802002', 1802, 'VASAI', 'VASAI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, '1802014', 1802, 'VIKRAMGAD', 'VIKRAMGAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(321, '1802008', 1802, 'WADA', 'WADA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(322, '1826006', 1826, 'ARVI', 'ARVI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(323, '1826007', 1826, 'ASHTI', 'ASHTI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(324, '1826005', 1826, 'DEOLI', 'DEOLI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(325, '1826004', 1826, 'HINGANGHAT', 'HINGANGHAT', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, '1826008', 1826, 'KARANJA', 'KARANJA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, '1826003', 1826, 'SAMUDRAPUR', 'SAMUDRAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(328, '1826002', 1826, 'SELOO', 'SELOO', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(329, '1826001', 1826, 'WARDHA', 'WARDHA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(330, '1832008', 1832, 'KARANJA', 'KARANJA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(331, '1832002', 1832, 'MALEGAON', 'MALEGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(332, '1832005', 1832, 'MANGRULPIR', 'MANGRULPIR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(333, '1832007', 1832, 'MANORA', 'MANORA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(334, '1832003', 1832, 'RISOD', 'RISOD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(335, '1832001', 1832, 'WASHIM', 'WASHIM', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(336, '1825015', 1825, 'ARNI', 'ARNI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(337, '1825002', 1825, 'BABULGAON', 'BABULGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(338, '1825013', 1825, 'DARWHA', 'DARWHA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(339, '1825012', 1825, 'DIGRAS', 'DIGRAS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(340, '1825008', 1825, 'GHATANJI', 'GHATANJI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(341, '1825003', 1825, 'KALAMB', 'KALAMB', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(342, '1825007', 1825, 'KELAPUR', 'KELAPUR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(343, '1825010', 1825, 'MAHAGAON', 'MAHAGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(344, '1825018', 1825, 'MAREGAON', 'MAREGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(345, '1825014', 1825, 'NER', 'NER', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(346, '1825011', 1825, 'PUSAD', 'PUSAD', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(347, '1825004', 1825, 'RALEGAON', 'RALEGAON', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(348, '1825009', 1825, 'UMARKHED', 'UMARKHED', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(349, '1825006', 1825, 'WANI', 'WANI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(350, '1825017', 1825, 'YAVATMAL', 'YAVATMAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(351, '1825016', 1825, 'ZARI JAMNI', 'ZARI JAMNI', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `rega_enrega_districtexpensearchive`
--

CREATE TABLE IF NOT EXISTS `rega_enrega_districtexpensearchive` (
  `DistrictUniqueId` int(11) NOT NULL,
  `Year` varchar(20) DEFAULT NULL,
  `NoOfWorks` int(11) NOT NULL DEFAULT '0',
  `LabourExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `MaterialExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `CreatedOn` datetime NOT NULL,
  `PageHTML` text,
  PRIMARY KEY (`DistrictUniqueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To Store the html of the page.';

-- --------------------------------------------------------

--
-- Table structure for table `rega_enrega_districtexpenses`
--

CREATE TABLE IF NOT EXISTS `rega_enrega_districtexpenses` (
  `UniqueId` int(10) NOT NULL AUTO_INCREMENT,
  `districtuniqueid` int(10) NOT NULL COMMENT 'Foreign Key From  District Table ',
  `Year` year(4) NOT NULL,
  `NoOfWorks` int(10) NOT NULL DEFAULT '0',
  `LabourExpenditures` int(11) NOT NULL DEFAULT '0' COMMENT 'Rupees Only',
  `MaterialExpenditures` int(11) NOT NULL DEFAULT '0' COMMENT 'Rupees Only',
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Link` varchar(400) DEFAULT NULL,
  `Html_hash` varchar(400) NOT NULL COMMENT 'Hash of the HTML contents of the district page (i.e. the one that has a list of talukas)',
  PRIMARY KEY (`UniqueId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `rega_enrega_districtexpenses`
--

INSERT INTO `rega_enrega_districtexpenses` (`UniqueId`, `districtuniqueid`, `Year`, `NoOfWorks`, `LabourExpenditures`, `MaterialExpenditures`, `CreatedOn`, `ModifiedOn`, `Link`, `Html_hash`) VALUES
(1, 1831, 2011, 3567, 186883044, 7040066, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(2, 1813, 2011, 980, 27168799, 324271, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(3, 1829, 2011, 2779, 59278351, 1247896, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(4, 1824, 2011, 21083, 105597314, 6174654, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(5, 1806, 2011, 1071, 23135301, 158328, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(6, 1807, 2011, 967, 33080844, 2806687, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(7, 1803, 2011, 2301, 23591214, 40358, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(8, 1810, 2011, 827, 7894610, 192973, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(9, 1830, 2011, 4125, 80711078, 15989668, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(10, 1827, 2011, 576, 10732066, 512342, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(11, 1826, 2011, 1358, 16561803, 2637096, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(12, 1809, 2011, 2925, 55634570, 8074186, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(13, 1812, 2011, 2481, 77297607, 306580, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(14, 1819, 2011, 10780, 317592383, 29949948, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(15, 1822, 2011, 7882, 31878082, 0, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(16, 1834, 2011, 1466, 15395297, 2391721, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(17, 1828, 2011, 2307, 72814001, 3647703, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(18, 1804, 2011, 757, 5952594, 949107, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(19, 1808, 2011, 1111, 26049405, 9577, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(20, 1802, 2011, 9816, 27297968, 10938177, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(21, 1805, 2011, 655, 2352851, 21012, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(22, 1833, 2011, 5995, 86868353, 1029051, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(23, 1817, 2011, 714, 8629144, 365808, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(24, 1825, 2011, 3199, 115796252, 3504231, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(25, 1815, 2011, 4901, 49963574, 49728342, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(26, 1823, 2011, 3271, 1864910, 50500, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(27, 1811, 2011, 428, 6362016, 44206, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(28, 1820, 2011, 1686, 22887111, 1098930, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(29, 1818, 2011, 2268, 20493651, 3236311, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(30, 1832, 2011, 2235, 7527251, 23644, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(31, 1816, 2011, 1051, 31838254, 10391669, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(32, 1821, 2011, 3713, 136087927, 13137039, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', ''),
(33, 1814, 2011, 1533, 45275256, 7821524, '0000-00-00 00:00:00', '2011-09-18 19:50:33', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_name=à¤®à¤¹à¤¾à¤°', '');

-- --------------------------------------------------------

--
-- Table structure for table `rega_enrega_districtexpensesappendix`
--

CREATE TABLE IF NOT EXISTS `rega_enrega_districtexpensesappendix` (
  `UniqueId` int(11) NOT NULL,
  `DistrictExpenseUniqueId` int(11) NOT NULL COMMENT 'Foreign Key from districtexpenses Table',
  `WorkTypeUniqueId` int(11) NOT NULL COMMENT 'Foreign Key from worktypes table',
  `NoOfWorks` int(11) NOT NULL DEFAULT '0',
  `LabourExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `MaterialExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` datetime NOT NULL,
  `Link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UniqueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table will store the work-type wise expenditures for Di';

-- --------------------------------------------------------

--
-- Table structure for table `rega_enrega_districts`
--

CREATE TABLE IF NOT EXISTS `rega_enrega_districts` (
  `UniqueId` int(10) NOT NULL AUTO_INCREMENT,
  `districtid` varchar(10) DEFAULT NULL,
  `StateUniqueId` int(10) NOT NULL COMMENT 'Foreign Key from States Table',
  `DistrictName_Mr` varchar(100) DEFAULT NULL,
  `DistrictName_En` varchar(100) DEFAULT NULL,
  `DistrictCode` varchar(10) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` datetime NOT NULL,
  KEY `UniqueId` (`UniqueId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `rega_enrega_districts`
--

INSERT INTO `rega_enrega_districts` (`UniqueId`, `districtid`, `StateUniqueId`, `DistrictName_Mr`, `DistrictName_En`, `DistrictCode`, `CreatedOn`, `ModifiedOn`) VALUES
(1, '1809', 18, 'अहमदनगर', 'AHMEDNAGAR', '1809', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '1823', 18, 'अकोला', 'AKOLA', '1823', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '1824', 18, 'अमरावती', 'AMRAVATI', '1824', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, '1815', 18, 'औरंगाबाद', 'AURANGABAD', '1815', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, '1818', 18, 'बीड', 'BEED', '1818', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, '1828', 18, 'भंडारा', 'BHANDARA', '1828', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, '1822', 18, 'बुलढाणा', 'BULDHANA', '1822', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, '1829', 18, 'चंद्रपूर', 'CHANDRAPUR', '1829', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, '1807', 18, 'धुळे', 'DHULE', '1807', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, '1830', 18, 'गडचिरोली', 'GADCHIROLI', '1830', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, '1833', 18, 'गोंदिया', 'GONDIA', '1833', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, '1834', 18, 'हिंगोली', 'HINGOLI', '1834', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, '1808', 18, 'जळगाव', 'JALGAON', '1808', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, '1816', 18, 'जालना', 'JALNA', '1816', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, '1814', 18, 'कोल्हापूर', 'KOLHAPUR', '1814', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, '1821', 18, 'लातूर', 'LATUR', '1821', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, '1827', 18, 'नागपूर', 'NAGPUR', '1827', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, '1819', 18, 'नांदेड', 'NANDED', '1819', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, '1831', 18, 'नंदुरबार', 'NANDURBAR', '1831', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, '1806', 18, 'नाशिक', 'NASHIK', '1806', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, '1820', 18, 'उस्मानाबाद', 'OSMANABAD', '1820', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, '1817', 18, 'परभणी', 'PARBHANI', '1817', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, '1810', 18, 'पुणे', 'PUNE', '1810', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, '1803', 18, 'रायगड', 'RAIGAD', '1803', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, '1804', 18, 'रत्नागिरी', 'RATNAGIRI', '1804', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, '1812', 18, 'सांगली', 'SANGLI', '1812', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, '1811', 18, 'सातारा', 'SATARA', '1811', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, '1805', 18, 'सिंधुदुर्ग', 'SINDHUDURG', '1805', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, '1813', 18, 'सोलापूर', 'SOLAPUR', '1813', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, '1802', 18, 'ठाणे', 'THANE', '1802', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, '1826', 18, 'वर्धा', 'WARDHA', '1826', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, '1832', 18, 'वाशिम', 'WASHIM', '1832', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, '1825', 18, 'यवतमाळ', 'YAVATMAL', '1825', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `rega_enrega_districts_bak`
--

CREATE TABLE IF NOT EXISTS `rega_enrega_districts_bak` (
  `UniqueId` int(10) NOT NULL AUTO_INCREMENT,
  `districtid` varchar(10) DEFAULT NULL,
  `StateUniqueId` int(10) NOT NULL COMMENT 'Foreign Key from States Table',
  `DistrictName_Mr` varchar(100) DEFAULT NULL,
  `DistrictName_En` varchar(100) DEFAULT NULL,
  `DistrictCode` varchar(10) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` datetime NOT NULL,
  KEY `UniqueId` (`UniqueId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `rega_enrega_districts_bak`
--

INSERT INTO `rega_enrega_districts_bak` (`UniqueId`, `districtid`, `StateUniqueId`, `DistrictName_Mr`, `DistrictName_En`, `DistrictCode`, `CreatedOn`, `ModifiedOn`) VALUES
(1, '1809', 18, 'अहमदनगर', 'AHMEDNAGAR', '1809', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '1823', 18, 'अकोला', 'AKOLA', '1823', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '1824', 18, 'अमरावती', 'AMRAVATI', '1824', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, '1815', 18, '', 'AURANGABAD', '1815', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, '1818', 18, '', 'BEED', '1818', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, '1828', 18, '', 'BHANDARA', '1828', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, '1822', 18, '', 'BULDHANA', '1822', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, '1829', 18, '', 'CHANDRAPUR', '1829', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, '1807', 18, '', 'DHULE', '1807', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, '1830', 18, '', 'GADCHIROLI', '1830', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, '1833', 18, '', 'GONDIA', '1833', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, '1834', 18, '', 'HINGOLI', '1834', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, '1808', 18, '', 'JALGAON', '1808', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, '1816', 18, '', 'JALNA', '1816', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, '1814', 18, '', 'KOLHAPUR', '1814', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, '1821', 18, '', 'LATUR', '1821', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, '1827', 18, '', 'NAGPUR', '1827', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, '1819', 18, '', 'NANDED', '1819', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, '1831', 18, '', 'NANDURBAR', '1831', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, '1806', 18, '', 'NASHIK', '1806', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, '1820', 18, '', 'OSMANABAD', '1820', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, '1817', 18, '', 'PARBHANI', '1817', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, '1810', 18, '', 'PUNE', '1810', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, '1803', 18, '', 'RAIGAD', '1803', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, '1804', 18, '', 'RATNAGIRI', '1804', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, '1812', 18, '', 'SANGLI', '1812', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, '1811', 18, '', 'SATARA', '1811', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, '1805', 18, '', 'SINDHUDURG', '1805', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, '1813', 18, '', 'SOLAPUR', '1813', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, '1802', 18, '', 'THANE', '1802', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, '1826', 18, 'वर्धा', 'WARDHA', '1826', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, '1832', 18, 'वाशिम', 'WASHIM', '1832', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, '1825', 18, 'यवतमाळ', 'YAVATMAL', '1825', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `rega_enrega_grampanchayatexpenses`
--

CREATE TABLE IF NOT EXISTS `rega_enrega_grampanchayatexpenses` (
  `UniqueId` int(11) NOT NULL,
  `GramPanchayatUniqueId` int(11) NOT NULL COMMENT 'Foreign Key from GramPanchayats Table',
  `Year` varchar(20) DEFAULT NULL,
  `NoOfWorks` int(11) NOT NULL DEFAULT '0',
  `LabourExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `MaterialExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Link` varchar(100) DEFAULT NULL,
  `Html_hash` varchar(400) NOT NULL,
  PRIMARY KEY (`UniqueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table will store the Expenses information of Block for ';

-- --------------------------------------------------------

--
-- Table structure for table `rega_enrega_grampanchayatexpensesappendix`
--

CREATE TABLE IF NOT EXISTS `rega_enrega_grampanchayatexpensesappendix` (
  `UniqueId` int(11) NOT NULL,
  `GramPanchayatExpensesUniqueId` int(11) NOT NULL COMMENT 'Foreign_Key “GramPanchayatExpense” table',
  `WorkTypeUniqueId` int(11) NOT NULL COMMENT 'Foreign_Key from worktypes table',
  `NoOfWorks` int(11) NOT NULL DEFAULT '0',
  `LabourExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `MaterialExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` datetime NOT NULL,
  `Link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UniqueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table will store the work-type wise expenditures for Gr';

-- --------------------------------------------------------

--
-- Table structure for table `rega_enrega_grampanchayatexpensesarchive`
--

CREATE TABLE IF NOT EXISTS `rega_enrega_grampanchayatexpensesarchive` (
  `GramPanchayatUniqueId` int(11) NOT NULL COMMENT 'Foreign Key from grampanchayat table',
  `Year` varchar(20) DEFAULT NULL,
  `NoOfWorks` int(11) NOT NULL DEFAULT '0',
  `LabourExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `MaterialExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `CreatedOn` datetime NOT NULL,
  `PageHTML` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table will store the Versions of Expenses information o';

-- --------------------------------------------------------

--
-- Table structure for table `rega_enrega_grampanchayats`
--

CREATE TABLE IF NOT EXISTS `rega_enrega_grampanchayats` (
  `UniqueId` int(10) NOT NULL,
  `GramPanchayatCode` varchar(10) DEFAULT NULL,
  `BlockUniqueId` int(10) NOT NULL COMMENT 'Foreign Key from Blocks Table',
  `GramPanchayatName_Mr` varchar(100) DEFAULT NULL,
  `GramPanchayatName_En` varchar(100) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` datetime NOT NULL,
  PRIMARY KEY (`UniqueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rega_enrega_languageresourcestrings`
--

CREATE TABLE IF NOT EXISTS `rega_enrega_languageresourcestrings` (
  `UniqueId` int(11) NOT NULL,
  `ResourceString` varchar(50) DEFAULT NULL,
  `Value_Mr` varchar(100) DEFAULT NULL,
  `Value_En` varchar(100) DEFAULT NULL,
  `Value_Kn` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UniqueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rega_enrega_stateexpensearchive`
--

CREATE TABLE IF NOT EXISTS `rega_enrega_stateexpensearchive` (
  `StateUniqueId` int(11) NOT NULL COMMENT 'Foreign Key from StatesTable',
  `Year` varchar(20) DEFAULT NULL,
  `NoOfWorks` int(11) NOT NULL DEFAULT '0',
  `LabourExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `MaterialExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `PageHTML` text,
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`StateUniqueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table will store the versions of Expenses information o';

-- --------------------------------------------------------

--
-- Table structure for table `rega_enrega_stateexpenses`
--

CREATE TABLE IF NOT EXISTS `rega_enrega_stateexpenses` (
  `UniqueId` int(11) NOT NULL AUTO_INCREMENT,
  `StateUniqueId` int(11) NOT NULL COMMENT 'Foreign Key from States Table',
  `Year` varchar(50) DEFAULT NULL,
  `NoOfWorks` int(11) NOT NULL DEFAULT '0',
  `LabourExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `MaterialExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` datetime NOT NULL,
  `Link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UniqueId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `rega_enrega_stateexpenses`
--

INSERT INTO `rega_enrega_stateexpenses` (`UniqueId`, `StateUniqueId`, `Year`, `NoOfWorks`, `LabourExpenditures`, `MaterialExpenditures`, `CreatedOn`, `ModifiedOn`, `Link`) VALUES
(1, 18, '2011', 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=local&state_code=18&state_nam');

-- --------------------------------------------------------

--
-- Table structure for table `rega_enrega_stateexpensesappendix`
--

CREATE TABLE IF NOT EXISTS `rega_enrega_stateexpensesappendix` (
  `UniqueId` int(11) NOT NULL,
  `StateExpenseUniqueId` int(11) NOT NULL COMMENT 'Foreign Key from State Expenses Table',
  `WorkTypeUniqueId` int(11) NOT NULL COMMENT 'Foreign Key from WorkTypes Table',
  `NoOfWorks` int(11) NOT NULL DEFAULT '0',
  `LabourExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `MaterialExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` datetime NOT NULL,
  `Link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UniqueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table will store the work-type wise expenditures for st';

-- --------------------------------------------------------

--
-- Table structure for table `rega_enrega_states`
--

CREATE TABLE IF NOT EXISTS `rega_enrega_states` (
  `UniqueId` int(11) NOT NULL,
  `StateId` varchar(10) DEFAULT NULL,
  `StateName_Mr` varchar(100) DEFAULT NULL,
  `StateName_En` varchar(100) DEFAULT NULL,
  `StateCode` char(10) NOT NULL,
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` datetime NOT NULL,
  PRIMARY KEY (`UniqueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rega_enrega_states`
--

INSERT INTO `rega_enrega_states` (`UniqueId`, `StateId`, `StateName_Mr`, `StateName_En`, `StateCode`, `CreatedOn`, `ModifiedOn`) VALUES
(0, '18', 'महाराष्ट्र', 'Maharashtra', 'MH', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `rega_enrega_worktypes`
--

CREATE TABLE IF NOT EXISTS `rega_enrega_worktypes` (
  `UniqueId` int(11) NOT NULL AUTO_INCREMENT,
  `WorkTypeCode` varchar(20) DEFAULT NULL,
  `WorkTypeName` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`UniqueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table will store the work-types' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rega_extensions`
--

CREATE TABLE IF NOT EXISTS `rega_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10020 ;

--
-- Dumping data for table `rega_extensions`
--

INSERT INTO `rega_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"legacy":false,"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_MAILTO_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"legacy":false,"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_BANNERS_XML_DESCRIPTION","group":""}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_checkin","type":"component","creationDate":"Unknown","author":"Joomla! Project","copyright":"(C) 2005 - 2008 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_CONTACT_XML_DESCRIPTION","group":""}', '{"show_contact_category":"hide","show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_languages","type":"component","creationDate":"2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"en-GB","site":"en-GB"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_MEDIA_XML_DESCRIPTION","group":""}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html","enable_flash":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_word_count":"0","show_headings":"1","show_name":"1","show_articles":"0","show_link":"1","show_description":"1","show_description_image":"1","display_num":"","show_pagination_limit":"1","show_pagination":"1","show_pagination_results":"1","show_cat_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_SEARCH_XML_DESCRIPTION","group":""}', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{"template_positions_display":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(21, 'com_weblinks', 'component', 'com_weblinks', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_weblinks","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_WEBLINKS_XML_DESCRIPTION","group":""}', '{"show_comp_description":"1","comp_description":"","show_link_hits":"1","show_link_description":"1","show_other_cats":"0","show_headings":"0","show_numbers":"0","show_report":"1","count_clicks":"1","target":"0","link_icons":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_CONTENT_XML_DESCRIPTION","group":""}', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","show_category":"1","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_author":"1","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"1","show_item_navigation":"1","show_vote":"0","show_readmore":"1","show_readmore_title":"1","readmore_limit":"100","show_icons":"1","show_print_icon":"1","show_email_icon":"1","show_hits":"1","show_noauth":"0","category_layout":"_:blog","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1","feed_summary":"0","filters":{"1":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"2":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"10":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"12":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"BL","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"COM_USERS_XML_DESCRIPTION","group":""}', '{"allowUserRegistration":"1","new_usertype":"2","useractivation":"1","frontend_userparams":"1","mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(100, 'PHPMailer', 'library', 'phpmailer', '', 0, 1, 1, 1, '{"legacy":false,"name":"PHPMailer","type":"library","creationDate":"2008","author":"PHPMailer","copyright":"Copyright (C) PHPMailer.","authorEmail":"","authorUrl":"http:\\/\\/phpmailer.codeworxtech.com\\/","version":"1.7.0","description":"Classes for sending email","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(101, 'SimplePie', 'library', 'simplepie', '', 0, 1, 1, 1, '{"legacy":false,"name":"SimplePie","type":"library","creationDate":"2008","author":"SimplePie","copyright":"Copyright (C) 2008 SimplePie","authorEmail":"","authorUrl":"http:\\/\\/simplepie.org\\/","version":"1.0.1","description":"A PHP-Based RSS and Atom Feed Framework.","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"legacy":false,"name":"phputf8","type":"library","creationDate":"2008","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"1.7.0","description":"Classes for UTF8","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Web Application Framework', 'library', 'joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"Joomla! Web Application Framework","type":"library","creationDate":"2008","author":"Joomla","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"1.7.0","description":"The Joomla! Web Application Framework is the Core of the Joomla! Content Management System","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters.\\n\\t\\tAll rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_RELATED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_STATS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(217, 'mod_weblinks', 'module', 'mod_weblinks', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_weblinks","type":"module","creationDate":"July 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_WEBLINKS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters.\\n\\t\\tAll rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\\n\\t","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(306, 'mod_online', 'module', 'mod_online', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_STATUS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_TITLE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_unread', 'module', 'mod_unread', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"legacy":false,"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":""}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"legacy":false,"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"legacy":false,"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_LDAP_XML_DESCRIPTION","group":""}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":""}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(405, 'plg_content_geshi', 'plugin', 'geshi', 'content', 0, 0, 1, 0, '{"legacy":false,"name":"plg_content_geshi","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"","authorUrl":"qbnz.com\\/highlighter","version":"1.7.0","description":"PLG_CONTENT_GESHI_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":""}', '{"style":"none"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":""}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":""}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_VOTE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"1.0","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":""}', '{"linenumbers":"0","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_none","type":"plugin","creationDate":"August 2004","author":"Unknown","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"1.7.0","description":"PLG_NONE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2011","author":"Moxiecode Systems AB","copyright":"Moxiecode Systems AB","authorEmail":"N\\/A","authorUrl":"tinymce.moxiecode.com\\/","version":"3.4.3.2","description":"PLG_TINY_XML_DESCRIPTION","group":""}', '{"mode":"1","skin":"0","compressed":"0","cleanup_startup":"0","cleanup_save":"2","entity_encoding":"raw","lang_mode":"0","lang_code":"en","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":"","toolbar":"top","toolbar_align":"left","html_height":"550","html_width":"750","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","format_date":"%Y-%m-%d","inserttime":"1","format_time":"%H:%M:%S","colors":"1","table":"1","smilies":"1","media":"1","hr":"1","directionality":"1","fullscreen":"1","style":"1","layer":"1","xhtmlxtras":"1","visualchars":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advimage":"1","advlink":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","safari":"0","custom_plugin":"","custom_button":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_READMORE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(421, 'plg_search_weblinks', 'plugin', 'weblinks', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_weblinks","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_SEARCH_WEBLINKS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":""}', '{"detect_browser":"1","automatic_change":"1","menu_associations":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_P3P_XML_DESCRIPTION","group":""}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"legacy":false,"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_CACHE_XML_DESCRIPTION","group":""}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":""}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_LOG_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_SEF_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 1, '{"legacy":false,"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":""}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"legacy":false,"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2009 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":""}', '{"autoregister":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0);
INSERT INTO `rega_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 1, '{"legacy":false,"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":""}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"legacy":false,"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(500, 'atomic', 'template', 'atomic', '', 0, 1, 1, 0, '{"legacy":false,"name":"atomic","type":"template","creationDate":"10\\/10\\/09","author":"Ron Severdia","copyright":"Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.","authorEmail":"contact@kontentdesign.com","authorUrl":"http:\\/\\/www.kontentdesign.com","version":"1.7.0","description":"TPL_ATOMIC_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(502, 'bluestork', 'template', 'bluestork', '', 1, 1, 1, 0, '{"legacy":false,"name":"bluestork","type":"template","creationDate":"07\\/02\\/09","author":"Ron Severdia","copyright":"Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.","authorEmail":"contact@kontentdesign.com","authorUrl":"http:\\/\\/www.kontentdesign.com","version":"1.7.0","description":"TPL_BLUESTORK_XML_DESCRIPTION","group":""}', '{"useRoundedCorners":"1","showSiteName":"0","textBig":"0","highContrast":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(503, 'beez_20', 'template', 'beez_20', '', 0, 1, 1, 0, '{"legacy":false,"name":"beez_20","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"1.7.0","description":"TPL_BEEZ2_XML_DESCRIPTION","group":""}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"legacy":false,"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.","authorEmail":"hathor@tarrconsulting.com","authorUrl":"http:\\/\\/www.tarrconsulting.com","version":"1.7.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":""}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(505, 'beez5', 'template', 'beez5', '', 0, 1, 1, 0, '{"legacy":false,"name":"beez5","type":"template","creationDate":"21 May 2010","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"1.7.0","description":"TPL_BEEZ5_XML_DESCRIPTION","group":""}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","html5":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (United Kingdom)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"legacy":false,"name":"English (United Kingdom)","type":"language","creationDate":"2008-03-15","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (United Kingdom)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"legacy":false,"name":"English (United Kingdom)","type":"language","creationDate":"2008-03-15","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"files_joomla","type":"file","creationDate":"July 2011","author":"Joomla!","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.7.0","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10000, 'admintools', 'component', 'com_admintools', '', 1, 1, 0, 0, '{"legacy":true,"name":"Admintools","type":"component","creationDate":"2011-07-28","author":"Nicholas K. Dionysopoulos","copyright":"Copyright (c)2010 Nicholas K. Dionysopoulos","authorEmail":"nicholas@akeebabackup.com","authorUrl":"http:\\/\\/www.akeebabackup.com","version":"2.1.5","description":"Security and utilitarian tools for Joomla! site administrators","group":""}', '{"latestjversion":null,"lastjupdatecheck":null}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10001, 'Admin Tools Joomla! Upgrade Notification', 'module', 'mod_atjupgrade', '', 1, 1, 2, 0, '{"legacy":true,"name":"Admin Tools Joomla! Upgrade Notification","type":"module","creationDate":"2011-07-28","author":"Nicholas K. Dionysopoulos","copyright":"Copyright (c)2010 Nicholas K. Dionysopoulos","authorEmail":"nicholas@dionysopoulos.me","authorUrl":"http:\\/\\/www.akeebabackup.com","version":"svn371","description":"","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10002, 'System - Admin Tools', 'plugin', 'admintools', 'system', 0, 1, 1, 0, '{"legacy":true,"name":"System - Admin Tools","type":"plugin","creationDate":"2011-07-28","author":"Nicholas K. Dionysopoulos","copyright":"Copyright (c)2010 Nicholas K. Dionysopoulos","authorEmail":"nicholas@akeebabackup.com","authorUrl":"http:\\/\\/www.akeebabackup.com","version":"2.1.5","description":"\\n\\t\\tHandles all the system-wide features provided by Admin Tools Core\\n\\t","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', -30000, 0),
(10003, 'akeeba', 'component', 'com_akeeba', '', 1, 1, 0, 0, '{"legacy":true,"name":"Akeeba","type":"component","creationDate":"2011-04-17","author":"Nicholas K. Dionysopoulos","copyright":"Copyright (c)2006-2010 Nicholas K. Dionysopoulos","authorEmail":"nicholas@dionysopoulos.me","authorUrl":"http:\\/\\/www.akeebabackup.com","version":"3.2.7","description":"Akeeba Backup Core (formerly JoomlaPack) - Full Joomla! site backup solution, Core Edition. Making backup as simple as ABC!","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10004, 'Akeeba Backup Notification Module', 'module', 'mod_akadmin', '', 1, 1, 2, 0, '{"legacy":true,"name":"Akeeba Backup Notification Module","type":"module","creationDate":"2011-04-17","author":"Nicholas K. Dionysopoulos","copyright":"Copyright (c)2009-2010 Nicholas K. Dionysopoulos","authorEmail":"nicholas@dionysopoulos.me","authorUrl":"http:\\/\\/www.akeebabackup.com","version":"3.2.7","description":"\\n\\t<h1>Akeeba Backup Notification Module<\\/h1>\\n\\t<p>This is a handy  module to display a Akeeba icon on your administrator\\n\\tback-end''s Control Panel page. The icon displays a warning site if the last\\n\\tbackup is failed, or if you haven''t backed up your site for a period of time\\n\\t(user-defined). Clicking it brings you to the Akeeba Backup &quot;Backup Now&quot;\\n\\tpage.<\\/p>\\n\\t","group":""}', '[]', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10005, 'Akeeba Backup Lazy Scheduling', 'plugin', 'aklazy', 'system', 0, 0, 1, 0, '{"legacy":true,"name":"Akeeba Backup Lazy Scheduling","type":"plugin","creationDate":"2011-04-17","author":"Nicholas K. Dionysopoulos","copyright":"Copyright (c)2010 Nicholas K. Dionysopoulos","authorEmail":"nicholas@dionysopoulos.me","authorUrl":"http:\\/\\/www.akeebabackup.com","version":"3.2.7","description":"\\n\\t\\tAutomate your Akeeba Backup installation without using CRON, taking\\n\\t\\tadvantage of your site''s visitor activity. Important: Read the\\n\\t\\tdocumentation before proceeding.\\n\\t","group":""}', '{"daysfreq":"1","backuptime":"00:00","profile":"1","@spacer":"","test":"0","resetpw":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10006, 'Minima', 'template', 'minima', '', 1, 1, 1, 0, '{"legacy":true,"name":"Minima","type":"template","creationDate":"July 2010","author":"Marco Barbosa","copyright":"Copyright (C) 2010 Marco Barbosa. All rights reserved.","authorEmail":"iam@marcobarbosa.com","authorUrl":"http:\\/\\/minimatemplate.com","version":"0.9","description":"TPL_MINIMA_XML_DESCRIPTION","group":""}', '{"templateColor":"#2A94C8","darkerColor":"#247eaa"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10007, 'Minima myPanel', 'module', 'mod_mypanel', '', 1, 1, 2, 0, '{"legacy":true,"name":"Minima myPanel","type":"module","creationDate":"October 2010","author":"Marco Barbosa","copyright":"Copyright (C) 2010 Marco Barbosa. All rights reserved.","authorEmail":"iam@marcobarbosa.com","authorUrl":"http:\\/\\/marcobarbosa.com","version":"0.9","description":"This module provides a panel for the minima template.","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10008, 'Minima myShortcuts', 'module', 'mod_myshortcuts', '', 1, 1, 2, 0, '{"legacy":true,"name":"Minima myShortcuts","type":"module","creationDate":"May 2010","author":"Marco Barbosa","copyright":"Copyright (C) 2010 Marco Barbosa. All rights reserved.","authorEmail":"iam@marcobarbosa.com","authorUrl":"http:\\/\\/marcobarbosa.com","version":"0.9","description":"This module provides a shortcuts bar for the minima template.","group":""}', '{"show_add_link":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10009, 'Minima', 'package', 'pkg_Minima', '', 0, 1, 1, 0, '{"legacy":true,"name":"Minima","type":"package","creationDate":"Unknown","author":"Unknown","copyright":"","authorEmail":"","authorUrl":"","version":"0.8","description":"Minima template package.","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10010, 'Nooku Framework', 'plugin', 'koowa', 'system', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10011, 'mod_default', 'module', 'mod_default', '', 0, 1, 1, 0, 'false', '', '', '', 0, '0000-00-00 00:00:00', 0, -1),
(10012, 'mod_default', 'module', 'mod_default', '', 1, 1, 1, 0, 'false', '', '', '', 0, '0000-00-00 00:00:00', 0, -1),
(10013, 'com_enrega', 'component', 'com_enrega', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10014, 'Joomla! Content Management System', 'package', 'pkg_joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"Joomla! Content Management System","type":"package","creationDate":"2006","author":"Joomla!","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"1.7.0","description":"The Joomla! Content Management System is one of the most popular content management system''s available today.","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10015, 'ja_cloris', 'template', 'ja_cloris', '', 0, 1, 1, 0, '{"legacy":false,"name":"ja_cloris","type":"template","creationDate":"August 2011","author":"JoomlArt.com","copyright":"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights Reserved.","authorEmail":"webmaster@joomlart.com","authorUrl":"http:\\/\\/www.joomlart.com","version":"1.2.0","description":"JA Cloris For Joomla 1.7","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10016, 'JA_Portfolio', 'template', 'ja_portfolio', '', 0, 1, 1, 0, '{"legacy":false,"name":"JA_Portfolio","type":"template","creationDate":"July 2011","author":"JoomlArt.com","copyright":"J.O.O.M. Solutions Ltd.","authorEmail":"webmaster@joomlart.com","authorUrl":"http:\\/\\/www.joomlart.com","version":"1.1.1","description":"Template JA Portfolio for Joomla 1.6","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10017, 'JA T3 Framework', 'plugin', 'jat3', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"JA T3 Framework","type":"plugin","creationDate":"15 July 2011","author":"www.JoomlArt.com","copyright":"Copyright (C), J.O.O.M Solutions Co., Ltd. All Rights Reserved.","authorEmail":"webmaster@joomlart.com","authorUrl":"http:\\/\\/www.joomlart.com","version":"1.3.0 Beta","description":"T3 Framework - JoomlArt Template Framework for Joomla 1.6","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1000, 0),
(10018, 'TCPDF', 'library', 'tcpdf', '', 0, 1, 1, 0, '{"legacy":true,"name":"TCPDF","type":"library","creationDate":"28 January 2011","author":"Nicola Asuni","copyright":"http:\\/\\/www.tcpdf.org","authorEmail":"","authorUrl":"http:\\/\\/www.tcpdf.org","version":"2.5.0","description":"Class for generating PDF files on-the-fly without requiring external extensions.","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10019, 'rsform', 'component', 'com_rsform', '', 1, 1, 0, 0, '{"legacy":true,"name":"RSForm","type":"component","creationDate":"05\\/08\\/2010","author":"RSJoomla!","copyright":"(C) 2007-2011 www.rsjoomla.com","authorEmail":"support@rsjoomla.com","authorUrl":"www.rsjoomla.com","version":"1.4.0 R40","description":"With RSForm!Pro you can quickly add forms to your Joomla! website.","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rega_languages`
--

CREATE TABLE IF NOT EXISTS `rega_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `published` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `rega_languages`
--

INSERT INTO `rega_languages` (`lang_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `published`, `ordering`) VALUES
(1, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', 1, 0),
(2, 'mr-IN', 'Marathi', 'Marathi', 'mr', 'mr', '', '', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rega_menu`
--

CREATE TABLE IF NOT EXISTS `rega_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'The relative ordering of the menu item in the tree.',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias` (`client_id`,`parent_id`,`alias`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(333)),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=115 ;

--
-- Dumping data for table `rega_menu`
--

INSERT INTO `rega_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `ordering`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 63, 0, '*', 0),
(2, 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 1, 10, 0, '*', 1),
(3, 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1),
(7, 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 11, 16, 0, '*', 1),
(8, 'menu', 'com_contact', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 12, 13, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 14, 15, 0, '*', 1),
(10, 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 17, 22, 0, '*', 1),
(11, 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 18, 19, 0, '*', 1),
(12, 'menu', 'com_messages_read', 'Read Private Message', '', 'Messaging/Read Private Message', 'index.php?option=com_messages', 'component', 0, 10, 2, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-read', 0, '', 20, 21, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 23, 28, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 24, 25, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 26, 27, 0, '*', 1),
(16, 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 37, 38, 0, '*', 1),
(17, 'menu', 'com_search', 'Search', '', 'Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 29, 30, 0, '*', 1),
(18, 'menu', 'com_weblinks', 'Weblinks', '', 'Weblinks', 'index.php?option=com_weblinks', 'component', 0, 1, 1, 21, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 31, 36, 0, '*', 1),
(19, 'menu', 'com_weblinks_links', 'Links', '', 'Weblinks/Links', 'index.php?option=com_weblinks', 'component', 0, 18, 2, 21, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 32, 33, 0, '*', 1),
(20, 'menu', 'com_weblinks_categories', 'Categories', '', 'Weblinks/Categories', 'index.php?option=com_categories&extension=com_weblinks', 'component', 0, 18, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks-cat', 0, '', 34, 35, 0, '*', 1),
(101, 'mainmenu', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=article&id=1', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"mega_showtitle":"1","mega_desc":"","mega_cols":"1","mega_group":"0","mega_width":"","mega_colw":"","mega_colxw":"","mega_class":"","mega_subcontent":"0"}', 39, 40, 1, '*', 0),
(106, 'mainmenu', 'Details of Work', '2011-08-20-12-37-21', '', '2011-08-20-12-37-21', 'index.php?option=com_enrega&view=districts&id=18&Itemid=106', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"mega_showtitle":"1","mega_desc":"","mega_cols":"1","mega_group":"0","mega_width":"","mega_colw":"","mega_colxw":"","mega_class":"","mega_subcontent":"0"}', 45, 46, 0, '*', 0),
(105, 'main', 'COM_ADMINTOOLS', 'comadmintools', '', 'comadmintools', 'index.php?option=com_admintools', 'component', 0, 1, 1, 10000, 0, 0, '0000-00-00 00:00:00', 0, 1, '../media/com_admintools/images/admintools-16.png', 0, '', 43, 44, 0, '', 1),
(103, 'main', 'COM_AKEEBA', 'comakeeba', '', 'comakeeba', 'index.php?option=com_akeeba', 'component', 0, 1, 1, 10003, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_akeeba/assets/images/akeeba-16.png', 0, '', 41, 42, 0, '', 1),
(107, 'main', 'RSFormPro', 'rsformpro', '', 'rsformpro', 'index.php?option=com_rsform', 'component', 0, 1, 1, 10019, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_rsform/assets/images/rsformpro.gif', 0, '', 47, 60, 0, '', 1),
(108, 'main', 'COM_RSFORM_MANAGE_FORMS', 'comrsformmanageforms', '', 'rsformpro/comrsformmanageforms', 'index.php?option=com_rsform&task=forms.manage', 'component', 0, 107, 2, 10019, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 48, 49, 0, '', 1),
(109, 'main', 'COM_RSFORM_MANAGE_SUBMISSIONS', 'comrsformmanagesubmissions', '', 'rsformpro/comrsformmanagesubmissions', 'index.php?option=com_rsform&task=submissions.manage', 'component', 0, 107, 2, 10019, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 50, 51, 0, '', 1),
(110, 'main', 'COM_RSFORM_CONFIGURATION', 'comrsformconfiguration', '', 'rsformpro/comrsformconfiguration', 'index.php?option=com_rsform&task=configuration.edit', 'component', 0, 107, 2, 10019, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 52, 53, 0, '', 1),
(111, 'main', 'COM_RSFORM_BACKUP_RESTORE', 'comrsformbackuprestore', '', 'rsformpro/comrsformbackuprestore', 'index.php?option=com_rsform&task=backup.restore', 'component', 0, 107, 2, 10019, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 54, 55, 0, '', 1),
(112, 'main', 'COM_RSFORM_UPDATES', 'comrsformupdates', '', 'rsformpro/comrsformupdates', 'index.php?option=com_rsform&task=updates.manage', 'component', 0, 107, 2, 10019, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 56, 57, 0, '', 1),
(113, 'main', 'COM_RSFORM_PLUGINS', 'comrsformplugins', '', 'rsformpro/comrsformplugins', 'index.php?option=com_rsform&task=goto.plugins', 'component', 0, 107, 2, 10019, 0, 0, '0000-00-00 00:00:00', 0, 1, 'class:component', 0, '', 58, 59, 0, '', 1),
(114, 'mainmenu', 'Contact Us', 'contact-us', '', 'contact-us', 'index.php?option=com_rsform&view=rsform&formId=1', 'component', 1, 1, 1, 10019, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"mega_showtitle":"1","mega_desc":"","mega_cols":"1","mega_group":"0","mega_width":"","mega_colw":"","mega_colxw":"","mega_class":"","mega_subcontent":"0"}', 61, 62, 0, '*', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rega_menu_types`
--

CREATE TABLE IF NOT EXISTS `rega_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `rega_menu_types`
--

INSERT INTO `rega_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site');

-- --------------------------------------------------------

--
-- Table structure for table `rega_messages`
--

CREATE TABLE IF NOT EXISTS `rega_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rega_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `rega_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rega_modules`
--

CREATE TABLE IF NOT EXISTS `rega_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) DEFAULT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `rega_modules`
--

INSERT INTO `rega_modules` (`id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 'Main Menu', '', '', 1, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"mainmenu","startLevel":"0","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"","moduleclass_sfx":"_menu","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(2, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(4, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(6, 'Unread Messages', '', '', 1, 'header', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_unread', 3, 1, '', 1, '*'),
(7, 'Online Users', '', '', 2, 'header', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_online', 3, 1, '', 1, '*'),
(8, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(12, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 'User Status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 'Login Form', '', '', 7, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '{"greeting":"1","name":"0"}', 0, '*'),
(17, 'Breadcrumbs', '', '', 1, 'position-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 1, 1, '{"moduleclass_sfx":"","showHome":"1","homeText":"Home","showComponent":"1","separator":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(18, 'Banners', '', '', 1, 'position-5', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_banners', 1, 1, '{"target":"1","count":"1","cid":"1","catid":["27"],"tag_search":"0","ordering":"0","header_text":"","footer_text":"","layout":"","moduleclass_sfx":"","cache":"1","cache_time":"900"}', 0, '*'),
(19, 'Admin Tools Joomla! Upgrade Notification', '', '', 98, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_atjupgrade', 1, 1, '', 1, '*'),
(20, 'Akeeba Backup Notification Module', '', '', 97, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_akadmin', 1, 1, '', 1, '*'),
(21, 'Minima myPanel', '', '', 0, 'panel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_mypanel', 3, 1, '', 1, '*'),
(22, 'Minima myShortcuts', '', '', 0, 'shortcuts', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_myshortcuts', 3, 1, '', 1, '*'),
(23, 'Popular Articles', '', '', 3, 'widgets-last', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(24, 'Recently Added Articles', '', '', 4, 'widgets-first', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(25, 'Logged-in Users', '', '', 2, 'widgets-first', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*');

-- --------------------------------------------------------

--
-- Table structure for table `rega_modules_menu`
--

CREATE TABLE IF NOT EXISTS `rega_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rega_modules_menu`
--

INSERT INTO `rega_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(20, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rega_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `rega_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(100) NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rega_redirect_links`
--

CREATE TABLE IF NOT EXISTS `rega_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(150) NOT NULL,
  `new_url` varchar(150) NOT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `rega_redirect_links`
--

INSERT INTO `rega_redirect_links` (`id`, `old_url`, `new_url`, `referer`, `comment`, `published`, `created_date`, `modified_date`) VALUES
(1, 'http://enrega.dreamhosters.com/index.php/component/enrega/?view=blocks&id=29', '', 'http://enrega.dreamhosters.com/index.php/component/enrega/?view=districts&sort=MaterialExpenditures&direction=asc', '', 0, '2011-08-18 20:31:22', '0000-00-00 00:00:00'),
(2, 'http://enrega.dreamhosters.com/index.php/component/enrega/?view=blocks&id=23', '', 'http://enrega.dreamhosters.com/index.php/component/enrega/?view=districts', '', 0, '2011-08-19 04:54:49', '0000-00-00 00:00:00'),
(3, 'http://enrega.dreamhosters.com/index.php/component/enrega/?view=blocks&id=1', '', 'http://enrega.dreamhosters.com/index.php/component/enrega/?view=districts&sort=DistrictName_En&direction=asc', '', 0, '2011-08-19 05:15:07', '0000-00-00 00:00:00'),
(4, 'http://enrega.dreamhosters.com/index.php/component/enrega/', '', 'http://enrega.dreamhosters.com/index.php/component/enrega/?view=districts', '', 0, '2011-08-20 11:26:48', '0000-00-00 00:00:00'),
(5, 'http://enrega.dreamhosters.com/index.php?view=districts&Itemid=106&sort=materialpercent&direction=asc', '', 'http://enrega.dreamhosters.com/index.php/component/enrega/?view=districts&Itemid=106', '', 0, '2011-08-21 09:40:37', '0000-00-00 00:00:00'),
(6, 'http://enrega.dreamhosters.com/index.php?view=districts&Itemid=106&sort=totalexpenditure&direction=asc', '', 'http://enrega.dreamhosters.com/index.php/component/enrega/?view=districts&Itemid=106', '', 0, '2011-08-22 07:38:16', '0000-00-00 00:00:00'),
(7, 'http://enrega.dreamhosters.com/index.php?view=districts&Itemid=106&sort=LabourExpenditures&direction=asc', '', 'http://enrega.dreamhosters.com/index.php/component/enrega/?view=districts&Itemid=106', '', 0, '2011-08-22 08:27:41', '0000-00-00 00:00:00'),
(8, 'http://enrega.dreamhosters.com/index.php?view=districts&Itemid=106&sort=NoOfWorks&direction=asc', '', 'http://enrega.dreamhosters.com/index.php/component/enrega/?view=districts&Itemid=106', '', 0, '2011-08-22 17:02:32', '0000-00-00 00:00:00'),
(9, 'http://enrega.dreamhosters.com/index.php/component/enrega/?view=districts&Itemid=106', '', 'http://enrega.dreamhosters.com/index.php/component/enrega/?view=districts&layout=default&language=Mr&search=&limit=0', '', 0, '2011-08-22 17:28:21', '0000-00-00 00:00:00'),
(10, 'http://enrega.dreamhosters.com/index.php?option=com_enrega&view=district&search=pune&Itemid=106', '', 'http://enrega.dreamhosters.com/index.php?option=com_enrega&view=districts&Itemid=106', '', 0, '2011-08-23 15:26:19', '0000-00-00 00:00:00'),
(11, 'http://enrega.dreamhosters.com/index.php?option=com_enrega&view=districts&layout=default&language=En&option=com_enrega&view=states&search=States&Itemi', '', 'http://enrega.dreamhosters.com/index.php?option=com_enrega&view=districts&sort=NoOfWorks&direction=asc', '', 0, '2011-08-25 16:44:10', '0000-00-00 00:00:00'),
(12, 'http://enrega.dreamhosters.com/index.php?option=com_enrega&view=districts&layout=default&language=Mr&option=com_enrega&view=states&search=&Itemid=106&', '', 'http://enrega.dreamhosters.com/index.php?option=com_enrega&view=districts&Itemid=106', '', 0, '2011-08-27 11:25:22', '0000-00-00 00:00:00'),
(13, 'http://enrega.dreamhosters.com/index.php?option=com_enrega&view=districts&layout=default&language=Language+/+भाषा&option=com_enrega&view=states&search', '', 'http://enrega.dreamhosters.com/index.php?option=com_enrega&view=districts&Itemid=106&language=Mr', '', 0, '2011-08-27 11:38:19', '0000-00-00 00:00:00'),
(14, 'http://enrega.dreamhosters.com/index.php?option=com_enrega&view=districts&layout=default&lang=en&option=com_enrega&view=states&search=राज्य&Itemid=106', '', 'http://enrega.dreamhosters.com/index.php?option=com_enrega&view=districts&Itemid=106&lang=mr', '', 0, '2011-08-27 15:20:30', '0000-00-00 00:00:00'),
(15, 'http://enrega.dreamhosters.com/index.php?option=com_enrega&view=states&lang=en', '', 'http://enrega.dreamhosters.com/index.php?option=com_enrega&view=blocks&id=1823&lang=en', '', 0, '2011-08-27 17:52:49', '0000-00-00 00:00:00'),
(16, 'http://enrega.dreamhosters.com/index.php?option=com_enrega&task=loaddb&lang=mr', '', '', '', 0, '2011-08-30 15:17:40', '0000-00-00 00:00:00'),
(17, 'http://enrega.dreamhosters.com/index.php?option=com_enrega&view=panchayats&id=1810002&lang=en', '', 'http://enrega.dreamhosters.com/index.php?option=com_enrega&view=blocks&id=1810&lang=en', '', 0, '2011-08-31 21:29:44', '0000-00-00 00:00:00'),
(18, 'http://enrega.dreamhosters.com/index.php?option=com_enrega&view=panchayats&id=1809011&lang=en', '', 'http://enrega.dreamhosters.com/index.php?option=com_enrega&view=blocks&id=1809&lang=en', '', 0, '2011-09-01 03:33:45', '0000-00-00 00:00:00'),
(19, 'http://enrega.dreamhosters.com/index.php?option=com_enrega&view=panchayats&id=1810004&lang=en', '', 'http://enrega.dreamhosters.com/index.php?option=com_enrega&view=blocks&id=1810&lang=en', '', 0, '2011-09-01 09:54:29', '0000-00-00 00:00:00'),
(20, 'http://localhost/enrega/index.php?option=com_enrega&view=districts&id=18&Itemid=106&lang=en', '', 'http://localhost/enrega/index.php?lang=en', '', 0, '2011-09-02 17:38:34', '0000-00-00 00:00:00'),
(21, 'http://localhost/enrega/index.php?option=com_enrega&view=panchayats&id=1810002&lang=en', '', 'http://localhost/enrega/index.php?option=com_enrega&view=blocks&id=1810&lang=en', '', 0, '2011-09-04 09:08:26', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `rega_rsform_components`
--

CREATE TABLE IF NOT EXISTS `rega_rsform_components` (
  `ComponentId` int(11) NOT NULL AUTO_INCREMENT,
  `FormId` int(11) NOT NULL DEFAULT '0',
  `ComponentTypeId` int(11) NOT NULL DEFAULT '0',
  `Order` int(11) NOT NULL DEFAULT '0',
  `Published` tinyint(1) NOT NULL DEFAULT '1',
  UNIQUE KEY `ComponentId` (`ComponentId`),
  KEY `ComponentTypeId` (`ComponentTypeId`),
  KEY `FormId` (`FormId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `rega_rsform_components`
--

INSERT INTO `rega_rsform_components` (`ComponentId`, `FormId`, `ComponentTypeId`, `Order`, `Published`) VALUES
(1, 1, 1, 2, 1),
(2, 1, 10, 1, 1),
(3, 1, 1, 3, 1),
(23, 1, 2, 4, 1),
(8, 1, 13, 5, 1),
(10, 2, 1, 2, 1),
(11, 2, 10, 1, 1),
(12, 2, 1, 3, 1),
(13, 2, 3, 6, 1),
(14, 2, 5, 7, 1),
(15, 2, 4, 10, 1),
(16, 2, 6, 11, 1),
(17, 2, 13, 12, 1),
(18, 2, 10, 13, 1),
(19, 2, 41, 4, 1),
(20, 2, 41, 8, 1),
(21, 2, 10, 5, 1),
(22, 2, 10, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rega_rsform_component_types`
--

CREATE TABLE IF NOT EXISTS `rega_rsform_component_types` (
  `ComponentTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `ComponentTypeName` text NOT NULL,
  PRIMARY KEY (`ComponentTypeId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `rega_rsform_component_types`
--

INSERT INTO `rega_rsform_component_types` (`ComponentTypeId`, `ComponentTypeName`) VALUES
(1, 'textBox'),
(2, 'textArea'),
(3, 'selectList'),
(4, 'checkboxGroup'),
(5, 'radioGroup'),
(6, 'calendar'),
(7, 'button'),
(8, 'captcha'),
(9, 'fileUpload'),
(10, 'freeText'),
(11, 'hidden'),
(12, 'imageButton'),
(13, 'submitButton'),
(14, 'password'),
(15, 'ticket'),
(41, 'pageBreak');

-- --------------------------------------------------------

--
-- Table structure for table `rega_rsform_component_type_fields`
--

CREATE TABLE IF NOT EXISTS `rega_rsform_component_type_fields` (
  `ComponentTypeFieldId` int(11) NOT NULL AUTO_INCREMENT,
  `ComponentTypeId` int(11) NOT NULL DEFAULT '0',
  `FieldName` text NOT NULL,
  `FieldType` enum('hidden','hiddenparam','textbox','textarea','select','emailattach') NOT NULL DEFAULT 'hidden',
  `FieldValues` text NOT NULL,
  `Ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ComponentTypeFieldId`),
  KEY `ComponentTypeId` (`ComponentTypeId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=178 ;

--
-- Dumping data for table `rega_rsform_component_type_fields`
--

INSERT INTO `rega_rsform_component_type_fields` (`ComponentTypeFieldId`, `ComponentTypeId`, `FieldName`, `FieldType`, `FieldValues`, `Ordering`) VALUES
(2, 1, 'NAME', 'textbox', '', 1),
(3, 1, 'CAPTION', 'textbox', '', 2),
(4, 1, 'REQUIRED', 'select', 'NO\r\nYES', 3),
(5, 1, 'SIZE', 'textbox', '20', 4),
(6, 1, 'MAXSIZE', 'textbox', '', 5),
(7, 1, 'VALIDATIONRULE', 'select', '//<code>\r\nreturn RSgetValidationRules();\r\n//</code>', 6),
(8, 1, 'VALIDATIONMESSAGE', 'textarea', 'INVALIDINPUT', 7),
(9, 1, 'ADDITIONALATTRIBUTES', 'textarea', '', 8),
(10, 1, 'DEFAULTVALUE', 'textarea', '', 9),
(11, 1, 'DESCRIPTION', 'textarea', '', 11),
(12, 1, 'COMPONENTTYPE', 'hidden', '1', 15),
(13, 2, 'NAME', 'textbox', '', 1),
(14, 2, 'CAPTION', 'textbox', '', 2),
(15, 2, 'REQUIRED', 'select', 'NO\r\nYES', 3),
(16, 2, 'COLS', 'textbox', '50', 4),
(17, 2, 'ROWS', 'textbox', '5', 5),
(18, 2, 'VALIDATIONRULE', 'select', '//<code>\r\nreturn RSgetValidationRules();\r\n//</code>', 6),
(19, 2, 'VALIDATIONMESSAGE', 'textarea', 'INVALIDINPUT', 7),
(20, 2, 'ADDITIONALATTRIBUTES', 'textarea', '', 8),
(21, 2, 'DEFAULTVALUE', 'textarea', '', 9),
(22, 2, 'DESCRIPTION', 'textarea', '', 10),
(23, 2, 'COMPONENTTYPE', 'hidden', '2', 10),
(24, 3, 'NAME', 'textbox', '', 1),
(25, 3, 'CAPTION', 'textbox', '', 2),
(26, 3, 'SIZE', 'textbox', '', 3),
(27, 3, 'MULTIPLE', 'select', 'NO\r\nYES', 4),
(28, 3, 'ITEMS', 'textarea', '', 5),
(29, 3, 'REQUIRED', 'select', 'NO\r\nYES', 6),
(30, 3, 'ADDITIONALATTRIBUTES', 'textarea', '', 7),
(31, 3, 'DESCRIPTION', 'textarea', '', 8),
(32, 3, 'COMPONENTTYPE', 'hidden', '3', 10),
(33, 4, 'NAME', 'textbox', '', 1),
(34, 4, 'CAPTION', 'textbox', '', 2),
(35, 4, 'ITEMS', 'textarea', '', 3),
(36, 4, 'FLOW', 'select', 'HORIZONTAL\r\nVERTICAL', 4),
(37, 4, 'REQUIRED', 'select', 'NO\r\nYES', 5),
(38, 4, 'ADDITIONALATTRIBUTES', 'textarea', '', 6),
(39, 4, 'DESCRIPTION', 'textarea', '', 6),
(40, 4, 'COMPONENTTYPE', 'hidden', '4', 7),
(41, 5, 'NAME', 'textbox', '', 1),
(42, 5, 'CAPTION', 'textbox', '', 2),
(43, 5, 'ITEMS', 'textarea', '', 3),
(44, 5, 'FLOW', 'select', 'HORIZONTAL\r\nVERTICAL', 4),
(45, 5, 'REQUIRED', 'select', 'NO\r\nYES', 5),
(46, 5, 'ADDITIONALATTRIBUTES', 'textarea', '', 6),
(47, 5, 'DESCRIPTION', 'textarea', '', 6),
(48, 5, 'COMPONENTTYPE', 'hidden', '5', 7),
(49, 6, 'NAME', 'textbox', '', 1),
(50, 6, 'CAPTION', 'textbox', '', 2),
(51, 6, 'REQUIRED', 'select', 'NO\r\nYES', 3),
(52, 6, 'DATEFORMAT', 'textbox', 'DDMMYYYY', 4),
(53, 6, 'CALENDARLAYOUT', 'select', 'FLAT\r\nPOPUP', 5),
(54, 6, 'ADDITIONALATTRIBUTES', 'textarea', '', 6),
(55, 6, 'DESCRIPTION', 'textarea', '', 7),
(56, 6, 'COMPONENTTYPE', 'hidden', '6', 8),
(57, 7, 'NAME', 'textbox', '', 1),
(58, 7, 'CAPTION', 'textbox', '', 2),
(59, 7, 'LABEL', 'textbox', '', 3),
(60, 7, 'RESET', 'select', 'NO\r\nYES', 4),
(61, 7, 'RESETLABEL', 'textbox', '', 5),
(62, 7, 'ADDITIONALATTRIBUTES', 'textarea', '', 6),
(63, 7, 'DESCRIPTION', 'textarea', '', 7),
(64, 7, 'COMPONENTTYPE', 'hidden', '7', 8),
(65, 8, 'NAME', 'textbox', '', 1),
(66, 8, 'CAPTION', 'textbox', '', 2),
(67, 8, 'LENGTH', 'textbox', '4', 3),
(68, 8, 'BACKGROUNDCOLOR', 'textbox', '#FFFFFF', 4),
(69, 8, 'TEXTCOLOR', 'textbox', '#000000', 5),
(70, 8, 'TYPE', 'select', 'ALPHA\r\nNUMERIC\r\nALPHANUMERIC', 6),
(71, 8, 'ADDITIONALATTRIBUTES', 'textarea', 'style="text-align:center;width:75px;"', 7),
(72, 8, 'DESCRIPTION', 'textarea', '', 9),
(73, 8, 'COMPONENTTYPE', 'hidden', '8', 9),
(74, 9, 'NAME', 'textbox', '', 1),
(75, 9, 'CAPTION', 'textbox', '', 2),
(76, 9, 'FILESIZE', 'textbox', '', 3),
(77, 9, 'REQUIRED', 'select', 'NO\r\nYES', 4),
(78, 9, 'ACCEPTEDFILES', 'textarea', '', 5),
(79, 9, 'DESTINATION', 'textbox', '//<code>\r\nreturn JPATH_SITE.DS.''components''.DS.''com_rsform''.DS.''uploads''.DS;\r\n//</code>', 6),
(80, 9, 'ADDITIONALATTRIBUTES', 'textarea', '', 7),
(81, 9, 'DESCRIPTION', 'textarea', '', 8),
(82, 9, 'COMPONENTTYPE', 'hidden', '9', 9),
(83, 10, 'NAME', 'textbox', '', 1),
(84, 10, 'TEXT', 'textarea', '', 1),
(85, 10, 'COMPONENTTYPE', 'hidden', '10', 9),
(86, 11, 'NAME', 'textbox', '', 1),
(87, 11, 'DEFAULTVALUE', 'textarea', '', 1),
(88, 11, 'ADDITIONALATTRIBUTES', 'textarea', '', 1),
(89, 11, 'COMPONENTTYPE', 'hidden', '11', 9),
(118, 12, 'COMPONENTTYPE', 'hidden', '12', 10),
(117, 12, 'ADDITIONALATTRIBUTES', 'textarea', '', 9),
(144, 3, 'VALIDATIONMESSAGE', 'textarea', 'INVALIDINPUT', 100),
(115, 12, 'RESETLABEL', 'textbox', '', 7),
(114, 12, 'RESET', 'select', 'NO\r\nYES', 6),
(113, 12, 'IMAGERESET', 'textbox', '', 5),
(112, 12, 'IMAGEBUTTON', 'textbox', '', 4),
(111, 12, 'LABEL', 'textbox', '', 3),
(110, 12, 'CAPTION', 'textbox', '', 2),
(109, 12, 'NAME', 'textbox', '', 1),
(119, 13, 'NAME', 'textbox', '', 1),
(120, 13, 'CAPTION', 'textbox', '', 3),
(121, 13, 'LABEL', 'textbox', '', 2),
(122, 13, 'RESET', 'select', 'NO\r\nYES', 6),
(123, 13, 'RESETLABEL', 'textbox', '', 7),
(125, 13, 'ADDITIONALATTRIBUTES', 'textarea', '', 9),
(126, 13, 'COMPONENTTYPE', 'hidden', '13', 10),
(127, 14, 'NAME', 'textbox', '', 1),
(128, 14, 'CAPTION', 'textbox', '', 2),
(129, 14, 'REQUIRED', 'select', 'NO\r\nYES', 3),
(130, 14, 'SIZE', 'textbox', '', 4),
(131, 14, 'MAXSIZE', 'textbox', '', 5),
(132, 14, 'DEFAULTVALUE', 'textarea', '', 6),
(133, 14, 'ADDITIONALATTRIBUTES', 'textarea', '', 7),
(134, 14, 'COMPONENTTYPE', 'hidden', '14', 8),
(135, 15, 'NAME', 'textbox', '', 1),
(138, 15, 'LENGTH', 'textbox', '8', 4),
(140, 15, 'ADDITIONALATTRIBUTES', 'textarea', '', 7),
(141, 15, 'COMPONENTTYPE', 'hidden', '15', 8),
(142, 14, 'DESCRIPTION', 'textarea', '', 100),
(143, 8, 'VALIDATIONMESSAGE', 'textarea', 'INVALIDINPUT', 100),
(145, 4, 'VALIDATIONMESSAGE', 'textarea', 'INVALIDINPUT', 100),
(146, 5, 'VALIDATIONMESSAGE', 'textarea', 'INVALIDINPUT', 100),
(147, 6, 'VALIDATIONMESSAGE', 'textarea', 'INVALIDINPUT', 100),
(148, 14, 'VALIDATIONMESSAGE', 'textarea', 'INVALIDINPUT', 100),
(149, 9, 'VALIDATIONMESSAGE', 'textarea', 'INVALIDINPUT', 100),
(150, 8, 'FLOW', 'select', 'VERTICAL\r\nHORIZONTAL', 7),
(151, 8, 'SHOWREFRESH', 'select', 'NO\r\nYES', 8),
(152, 8, 'REFRESHTEXT', 'textbox', 'REFRESH', 11),
(153, 6, 'READONLY', 'select', 'NO\r\nYES', 6),
(154, 12, 'DESCRIPTION', 'textarea', '', 10),
(155, 6, 'POPUPLABEL', 'textbox', '...', 6),
(157, 15, 'CHARACTERS', 'select', 'ALPHANUMERIC\r\nALPHA\r\nNUMERIC', 3),
(160, 2, 'WYSIWYG', 'select', 'NO\r\nYES', 11),
(161, 8, 'SIZE', 'textbox', '15', 12),
(162, 8, 'IMAGETYPE', 'select', 'FREETYPE\r\nNOFREETYPE\r\nINVISIBLE', 3),
(163, 1, 'VALIDATIONEXTRA', 'textbox', '', 6),
(164, 2, 'VALIDATIONEXTRA', 'textbox', '', 6),
(165, 14, 'VALIDATIONRULE', 'select', '//<code>\r\nreturn RSgetValidationRules();\r\n//</code>', 9),
(166, 9, 'PREFIX', 'textarea', '', 6),
(167, 13, 'PREVBUTTON', 'textbox', '//<code>\r\nreturn JText::_(''PREV'');\r\n//</code>', 8),
(168, 41, 'NAME', 'textbox', '', 1),
(169, 41, 'COMPONENTTYPE', 'hidden', '41', 5),
(170, 41, 'NEXTBUTTON', 'textbox', '//<code>\r\nreturn JText::_(''NEXT'');\r\n//</code>', 2),
(171, 41, 'PREVBUTTON', 'textbox', '//<code>\r\nreturn JText::_(''PREV'');\r\n//</code>', 3),
(172, 41, 'ADDITIONALATTRIBUTES', 'textarea', '', 4),
(173, 41, 'VALIDATENEXTPAGE', 'select', 'NO\r\nYES', 5),
(174, 6, 'MINDATE', 'textbox', '', 5),
(175, 6, 'MAXDATE', 'textbox', '', 5),
(176, 6, 'DEFAULTVALUE', 'textarea', '', 2),
(177, 9, 'EMAILATTACH', 'emailattach', '', 102);

-- --------------------------------------------------------

--
-- Table structure for table `rega_rsform_config`
--

CREATE TABLE IF NOT EXISTS `rega_rsform_config` (
  `ConfigId` int(11) NOT NULL AUTO_INCREMENT,
  `SettingName` varchar(64) NOT NULL DEFAULT '',
  `SettingValue` text NOT NULL,
  PRIMARY KEY (`ConfigId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `rega_rsform_config`
--

INSERT INTO `rega_rsform_config` (`ConfigId`, `SettingName`, `SettingValue`) VALUES
(1, 'global.register.code', ''),
(2, 'global.debug.mode', '0'),
(3, 'global.iis', '1'),
(4, 'global.editor', '1');

-- --------------------------------------------------------

--
-- Table structure for table `rega_rsform_emails`
--

CREATE TABLE IF NOT EXISTS `rega_rsform_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formId` int(11) NOT NULL,
  `from` varchar(255) NOT NULL,
  `fromname` varchar(255) NOT NULL,
  `replyto` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `cc` varchar(255) NOT NULL,
  `bcc` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `mode` tinyint(1) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rega_rsform_forms`
--

CREATE TABLE IF NOT EXISTS `rega_rsform_forms` (
  `FormId` int(11) NOT NULL AUTO_INCREMENT,
  `FormName` text NOT NULL,
  `FormLayout` longtext NOT NULL,
  `FormLayoutName` text NOT NULL,
  `FormLayoutAutogenerate` tinyint(1) NOT NULL DEFAULT '1',
  `CSS` text NOT NULL,
  `JS` text NOT NULL,
  `FormTitle` text NOT NULL,
  `Published` tinyint(1) NOT NULL DEFAULT '1',
  `Lang` varchar(255) NOT NULL DEFAULT '',
  `ReturnUrl` text NOT NULL,
  `ShowThankyou` tinyint(1) NOT NULL DEFAULT '1',
  `Thankyou` text NOT NULL,
  `ShowContinue` tinyint(1) NOT NULL DEFAULT '1',
  `UserEmailText` text NOT NULL,
  `UserEmailTo` text NOT NULL,
  `UserEmailCC` varchar(255) NOT NULL,
  `UserEmailBCC` varchar(255) NOT NULL,
  `UserEmailFrom` varchar(255) NOT NULL DEFAULT '',
  `UserEmailReplyTo` varchar(255) NOT NULL,
  `UserEmailFromName` varchar(255) NOT NULL DEFAULT '',
  `UserEmailSubject` varchar(255) NOT NULL DEFAULT '',
  `UserEmailMode` tinyint(4) NOT NULL DEFAULT '1',
  `UserEmailAttach` tinyint(4) NOT NULL,
  `UserEmailAttachFile` varchar(255) NOT NULL,
  `AdminEmailText` text NOT NULL,
  `AdminEmailTo` text NOT NULL,
  `AdminEmailCC` varchar(255) NOT NULL,
  `AdminEmailBCC` varchar(255) NOT NULL,
  `AdminEmailFrom` varchar(255) NOT NULL DEFAULT '',
  `AdminEmailReplyTo` varchar(255) NOT NULL,
  `AdminEmailFromName` varchar(255) NOT NULL DEFAULT '',
  `AdminEmailSubject` varchar(255) NOT NULL DEFAULT '',
  `AdminEmailMode` tinyint(4) NOT NULL DEFAULT '1',
  `ScriptProcess` text NOT NULL,
  `ScriptProcess2` text NOT NULL,
  `ScriptDisplay` text NOT NULL,
  `UserEmailScript` text NOT NULL,
  `AdminEmailScript` text NOT NULL,
  `MetaTitle` tinyint(1) NOT NULL,
  `MetaDesc` text NOT NULL,
  `MetaKeywords` text NOT NULL,
  `Required` varchar(255) NOT NULL DEFAULT '(*)',
  `ErrorMessage` text NOT NULL,
  `MultipleSeparator` varchar(64) NOT NULL DEFAULT '\\n',
  `TextareaNewLines` tinyint(1) NOT NULL DEFAULT '1',
  `CSSClass` varchar(255) NOT NULL,
  `CSSId` varchar(255) NOT NULL DEFAULT 'userForm',
  `CSSName` varchar(255) NOT NULL,
  `CSSAction` text NOT NULL,
  `CSSAdditionalAttributes` text NOT NULL,
  `AjaxValidation` tinyint(1) NOT NULL,
  `ThemeParams` text NOT NULL,
  `Keepdata` tinyint(1) NOT NULL DEFAULT '1',
  `Backendmenu` tinyint(1) NOT NULL,
  `ConfirmSubmission` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`FormId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `rega_rsform_forms`
--

INSERT INTO `rega_rsform_forms` (`FormId`, `FormName`, `FormLayout`, `FormLayoutName`, `FormLayoutAutogenerate`, `CSS`, `JS`, `FormTitle`, `Published`, `Lang`, `ReturnUrl`, `ShowThankyou`, `Thankyou`, `ShowContinue`, `UserEmailText`, `UserEmailTo`, `UserEmailCC`, `UserEmailBCC`, `UserEmailFrom`, `UserEmailReplyTo`, `UserEmailFromName`, `UserEmailSubject`, `UserEmailMode`, `UserEmailAttach`, `UserEmailAttachFile`, `AdminEmailText`, `AdminEmailTo`, `AdminEmailCC`, `AdminEmailBCC`, `AdminEmailFrom`, `AdminEmailReplyTo`, `AdminEmailFromName`, `AdminEmailSubject`, `AdminEmailMode`, `ScriptProcess`, `ScriptProcess2`, `ScriptDisplay`, `UserEmailScript`, `AdminEmailScript`, `MetaTitle`, `MetaDesc`, `MetaKeywords`, `Required`, `ErrorMessage`, `MultipleSeparator`, `TextareaNewLines`, `CSSClass`, `CSSId`, `CSSName`, `CSSAction`, `CSSAdditionalAttributes`, `AjaxValidation`, `ThemeParams`, `Keepdata`, `Backendmenu`, `ConfirmSubmission`) VALUES
(1, 'Contact Us', '<div class="componentheading">{global:formtitle}</div>\n{error}\n<table border="0">\n	<tr class="rsform-block rsform-block-header">\n		<td>{Header:caption}</td>\n		<td>{Header:body}<div class="formClr"></div>{Header:validation}</td>\n		<td>{Header:description}</td>\n	</tr>\n	<tr class="rsform-block rsform-block-fullname">\n		<td>{FullName:caption} (*)</td>\n		<td>{FullName:body}<div class="formClr"></div>{FullName:validation}</td>\n		<td>{FullName:description}</td>\n	</tr>\n	<tr class="rsform-block rsform-block-email">\n		<td>{Email:caption} (*)</td>\n		<td>{Email:body}<div class="formClr"></div>{Email:validation}</td>\n		<td>{Email:description}</td>\n	</tr>\n	<tr class="rsform-block rsform-block-message">\n		<td>{Message:caption} (*)</td>\n		<td>{Message:body}<div class="formClr"></div>{Message:validation}</td>\n		<td>{Message:description}</td>\n	</tr>\n	<tr class="rsform-block rsform-block-submit">\n		<td>{Submit:caption}</td>\n		<td>{Submit:body}<div class="formClr"></div>{Submit:validation}</td>\n		<td>{Submit:description}</td>\n	</tr>\n</table>\n', 'inline', 1, '', '', 'Contact Us', 1, 'en-GB', '', 1, '<p>Dear {FullName:value},</p>\r\n<p>We have received your message and will get back to you soon.</p>', 0, '<p>Dear {FullName:value},</p>\r\n<p>We received your message and will get back to you soon.</p>', '', '', '', '', '{Email:value}', '', 'eNREGA Inquiry', 1, 0, '', '<p>New eNREGA Inquiry. Details as follows:</p>\r\n<p><strong>{FullName:caption}</strong>:{FullName:value}<br /> <strong>{Email:caption}</strong>:{Email:value}<br /><strong>{Message:caption}</strong>:<br />{Message:value}<br /><br /></p>', 'coolbung@gmail.com', '', '', '{Email:value}', '{Email:value}', '{FullName:value}', 'eNREGA Inquiry', 1, '', '', '', '', '', 0, 'This is the meta description of your form. You can use it for SEO purposes.', 'rsform, contact, form, joomla', '(*)', '<p class="formRed">Please complete all required fields!</p>', ', ', 1, '', 'userForm', '', '', '', 0, '', 1, 0, 0),
(2, 'RSformPro Multipage example', '<fieldset class="formFieldset">\n<legend>{global:formtitle}</legend>\n{error}\n<!-- Do not remove this ID, it is used to identify the page so that the pagination script can work correctly -->\n<ol class="formContainer" id="rsform_2_page_0">\n	<li class="rsform-block rsform-block-header">\n		<div class="formCaption">{Header:caption}</div>\n		<div class="formBody">{Header:body}<span class="formClr">{Header:validation}</span></div>\n		<div class="formDescription">{Header:description}</div>\n	</li>\n	<li class="rsform-block rsform-block-fullname">\n		<div class="formCaption">{FullName:caption}<strong class="formRequired">(*)</strong></div>\n		<div class="formBody">{FullName:body}<span class="formClr">{FullName:validation}</span></div>\n		<div class="formDescription">{FullName:description}</div>\n	</li>\n	<li class="rsform-block rsform-block-email">\n		<div class="formCaption">{Email:caption}<strong class="formRequired">(*)</strong></div>\n		<div class="formBody">{Email:body}<span class="formClr">{Email:validation}</span></div>\n		<div class="formDescription">{Email:description}</div>\n	</li>\n	<li class="rsform-block rsform-block-page1">\n		<div class="formCaption">&nbsp;</div>\n		<div class="formBody">{Page1:body}</div>\n	</li>\n	</ol>\n<!-- Do not remove this ID, it is used to identify the page so that the pagination script can work correctly -->\n<ol class="formContainer" id="rsform_2_page_1">\n	<li class="rsform-block rsform-block-companyheader">\n		<div class="formCaption">{CompanyHeader:caption}</div>\n		<div class="formBody">{CompanyHeader:body}<span class="formClr">{CompanyHeader:validation}</span></div>\n		<div class="formDescription">{CompanyHeader:description}</div>\n	</li>\n	<li class="rsform-block rsform-block-companysize">\n		<div class="formCaption">{CompanySize:caption}<strong class="formRequired">(*)</strong></div>\n		<div class="formBody">{CompanySize:body}<span class="formClr">{CompanySize:validation}</span></div>\n		<div class="formDescription">{CompanySize:description}</div>\n	</li>\n	<li class="rsform-block rsform-block-position">\n		<div class="formCaption">{Position:caption}<strong class="formRequired">(*)</strong></div>\n		<div class="formBody">{Position:body}<span class="formClr">{Position:validation}</span></div>\n		<div class="formDescription">{Position:description}</div>\n	</li>\n	<li class="rsform-block rsform-block-page2">\n		<div class="formCaption">&nbsp;</div>\n		<div class="formBody">{Page2:body}</div>\n	</li>\n	</ol>\n<!-- Do not remove this ID, it is used to identify the page so that the pagination script can work correctly -->\n<ol class="formContainer" id="rsform_2_page_2">\n	<li class="rsform-block rsform-block-contactheader">\n		<div class="formCaption">{ContactHeader:caption}</div>\n		<div class="formBody">{ContactHeader:body}<span class="formClr">{ContactHeader:validation}</span></div>\n		<div class="formDescription">{ContactHeader:description}</div>\n	</li>\n	<li class="rsform-block rsform-block-contactby">\n		<div class="formCaption">{ContactBy:caption}</div>\n		<div class="formBody">{ContactBy:body}<span class="formClr">{ContactBy:validation}</span></div>\n		<div class="formDescription">{ContactBy:description}</div>\n	</li>\n	<li class="rsform-block rsform-block-contactwhen">\n		<div class="formCaption">{ContactWhen:caption}<strong class="formRequired">(*)</strong></div>\n		<div class="formBody">{ContactWhen:body}<span class="formClr">{ContactWhen:validation}</span></div>\n		<div class="formDescription">{ContactWhen:description}</div>\n	</li>\n	<li class="rsform-block rsform-block-submit">\n		<div class="formCaption">{Submit:caption}</div>\n		<div class="formBody">{Submit:body}<span class="formClr">{Submit:validation}</span></div>\n		<div class="formDescription">{Submit:description}</div>\n	</li>\n	<li class="rsform-block rsform-block-footer">\n		<div class="formCaption">{Footer:caption}</div>\n		<div class="formBody">{Footer:body}<span class="formClr">{Footer:validation}</span></div>\n		<div class="formDescription">{Footer:description}</div>\n	</li>\n</ol>\n</fieldset>', 'inline-xhtml', 1, '', '', 'RSForm! Pro Multipage example', 1, '', '', 0, '<p>Dear {FullName:value},</p><p> thank you for your submission. One of our staff members will contact you by  {ContactBy:value} as soon as possible.</p>', 1, '<p>Dear {FullName:value},</p><p> we received your contact request. Someone will get back to you by {ContactBy:value} soon. </p>', '{Email:value}', '', '', 'your@email.com', '', 'Your Company', 'Contact confirmation', 1, 0, '', '<p>Customize this e-mail also. You will receive it as administrator. </p><p>{FullName:caption}:{FullName:value}<br />\n{Email:caption}:{Email:value}<br />\n{CompanySize:caption}:{CompanySize:value}<br />\n{Position:caption}:{Position:value}<br />\n{ContactBy:caption}:{ContactBy:value}<br />\n{ContactWhen:caption}:{ContactWhen:value}</p>', 'youradminemail@email.com', '', '', '{Email:value}', '', 'Your Company', 'Contact', 1, '', '', '', '', '', 0, 'This is the meta description of your form. You can use it for SEO purposes.', 'rsform, contact, form, joomla', '(*)', '<p class="formRed">Please complete all required fields!</p>', ', ', 1, '', 'userForm', '', '', '', 0, '', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `rega_rsform_mappings`
--

CREATE TABLE IF NOT EXISTS `rega_rsform_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formId` int(11) NOT NULL,
  `connection` tinyint(1) NOT NULL,
  `host` varchar(255) NOT NULL,
  `port` int(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `database` varchar(255) NOT NULL,
  `method` tinyint(1) NOT NULL,
  `table` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `wheredata` text NOT NULL,
  `extra` text NOT NULL,
  `andor` text NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rega_rsform_properties`
--

CREATE TABLE IF NOT EXISTS `rega_rsform_properties` (
  `PropertyId` int(11) NOT NULL AUTO_INCREMENT,
  `ComponentId` int(11) NOT NULL DEFAULT '0',
  `PropertyName` text NOT NULL,
  `PropertyValue` text NOT NULL,
  UNIQUE KEY `PropertyId` (`PropertyId`),
  KEY `ComponentId` (`ComponentId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=169 ;

--
-- Dumping data for table `rega_rsform_properties`
--

INSERT INTO `rega_rsform_properties` (`PropertyId`, `ComponentId`, `PropertyName`, `PropertyValue`) VALUES
(1, 1, 'NAME', 'FullName'),
(2, 1, 'CAPTION', 'Full Name'),
(3, 1, 'REQUIRED', 'YES'),
(4, 1, 'SIZE', '30'),
(5, 1, 'MAXSIZE', ''),
(6, 1, 'VALIDATIONRULE', 'none'),
(7, 1, 'VALIDATIONMESSAGE', 'Please type your full name.'),
(8, 1, 'ADDITIONALATTRIBUTES', 'class="inputbox"'),
(9, 1, 'DEFAULTVALUE', ''),
(10, 1, 'DESCRIPTION', ''),
(11, 2, 'NAME', 'Header'),
(12, 2, 'TEXT', 'We''re an enthu group wanting to change the way Government websites are built. Let us know how we can help you!'),
(13, 3, 'NAME', 'Email'),
(14, 3, 'CAPTION', 'E-mail'),
(15, 3, 'REQUIRED', 'YES'),
(16, 3, 'SIZE', '30'),
(17, 3, 'MAXSIZE', ''),
(18, 3, 'VALIDATIONRULE', 'email'),
(19, 3, 'VALIDATIONMESSAGE', 'Invalid email address.'),
(20, 3, 'ADDITIONALATTRIBUTES', 'class="inputbox"'),
(21, 3, 'DEFAULTVALUE', ''),
(22, 3, 'DESCRIPTION', ''),
(168, 8, 'EMAILATTACH', ''),
(167, 8, 'PREVBUTTON', ''),
(166, 3, 'EMAILATTACH', ''),
(160, 23, 'COLS', '50'),
(159, 23, 'VALIDATIONMESSAGE', 'Invalid Input'),
(158, 23, 'VALIDATIONRULE', 'none'),
(157, 23, 'VALIDATIONEXTRA', ''),
(156, 23, 'REQUIRED', 'YES'),
(155, 23, 'DESCRIPTION', 'Your Message to us'),
(154, 23, 'DEFAULTVALUE', ''),
(152, 23, 'NAME', 'Message'),
(153, 23, 'CAPTION', 'Message'),
(58, 8, 'NAME', 'Submit'),
(59, 8, 'LABEL', 'Submit'),
(60, 8, 'CAPTION', ''),
(61, 8, 'RESET', 'NO'),
(62, 8, 'RESETLABEL', 'Reset'),
(63, 8, 'ADDITIONALATTRIBUTES', 'class="button"'),
(165, 1, 'EMAILATTACH', ''),
(161, 23, 'ROWS', '5'),
(162, 23, 'WYSIWYG', 'NO'),
(163, 23, 'ADDITIONALATTRIBUTES', 'class="inputbox"'),
(164, 23, 'EMAILATTACH', ''),
(68, 10, 'NAME', 'FullName'),
(69, 10, 'CAPTION', 'Full Name'),
(70, 10, 'REQUIRED', 'YES'),
(71, 10, 'SIZE', '20'),
(72, 10, 'MAXSIZE', ''),
(73, 10, 'VALIDATIONRULE', 'none'),
(74, 10, 'VALIDATIONMESSAGE', 'Please type your full name.'),
(75, 10, 'ADDITIONALATTRIBUTES', ''),
(76, 10, 'DEFAULTVALUE', ''),
(77, 10, 'DESCRIPTION', ''),
(78, 10, 'VALIDATIONEXTRA', ''),
(79, 11, 'NAME', 'Header'),
(80, 11, 'TEXT', '<b>This text describes the form. It is added using the Free Text component</b>. HTML code can be added directly here.'),
(81, 12, 'NAME', 'Email'),
(82, 12, 'CAPTION', 'E-mail'),
(83, 12, 'REQUIRED', 'YES'),
(84, 12, 'SIZE', '20'),
(85, 12, 'MAXSIZE', ''),
(86, 12, 'VALIDATIONRULE', 'email'),
(87, 12, 'VALIDATIONMESSAGE', 'Invalid email address.'),
(88, 12, 'ADDITIONALATTRIBUTES', ''),
(89, 12, 'DEFAULTVALUE', ''),
(90, 12, 'DESCRIPTION', ''),
(91, 12, 'VALIDATIONEXTRA', ''),
(92, 13, 'NAME', 'CompanySize'),
(93, 13, 'CAPTION', 'Number of Employees'),
(94, 13, 'SIZE', ''),
(95, 13, 'MULTIPLE', 'NO'),
(96, 13, 'ITEMS', '|Please Select[c]\n1-20\n21-50\n51-100\n>100|More than 100'),
(97, 13, 'REQUIRED', 'YES'),
(98, 13, 'ADDITIONALATTRIBUTES', ''),
(99, 13, 'DESCRIPTION', ''),
(100, 13, 'VALIDATIONMESSAGE', 'Please tell us how big is your company.'),
(101, 14, 'NAME', 'Position'),
(102, 14, 'CAPTION', 'Position'),
(103, 14, 'ITEMS', 'CEO\nCFO\nCTO\nHR[c]'),
(104, 14, 'FLOW', 'HORIZONTAL'),
(105, 14, 'REQUIRED', 'YES'),
(106, 14, 'ADDITIONALATTRIBUTES', ''),
(107, 14, 'DESCRIPTION', ''),
(108, 14, 'VALIDATIONMESSAGE', 'Please specify your position in the company'),
(109, 15, 'NAME', 'ContactBy'),
(110, 15, 'CAPTION', 'How should we contact you?'),
(111, 15, 'ITEMS', 'E-mail[c]\nPhone\nNewsletter[c]\nMail'),
(112, 15, 'FLOW', 'HORIZONTAL'),
(113, 15, 'REQUIRED', 'NO'),
(114, 15, 'ADDITIONALATTRIBUTES', ''),
(115, 15, 'DESCRIPTION', ''),
(116, 15, 'VALIDATIONMESSAGE', ''),
(117, 16, 'NAME', 'ContactWhen'),
(118, 16, 'CAPTION', 'When would you like to be contacted?'),
(119, 16, 'REQUIRED', 'YES'),
(120, 16, 'DATEFORMAT', 'dd.mm.yyyy'),
(121, 16, 'CALENDARLAYOUT', 'POPUP'),
(122, 16, 'ADDITIONALATTRIBUTES', ''),
(123, 16, 'READONLY', 'YES'),
(124, 16, 'POPUPLABEL', '...'),
(125, 16, 'DESCRIPTION', ''),
(126, 16, 'VALIDATIONMESSAGE', 'Please select a date when we should contact you.'),
(127, 17, 'NAME', 'Submit'),
(128, 17, 'LABEL', 'Submit'),
(129, 17, 'CAPTION', ''),
(130, 17, 'RESET', 'YES'),
(131, 17, 'RESETLABEL', 'Reset'),
(132, 17, 'ADDITIONALATTRIBUTES', ''),
(133, 18, 'NAME', 'Footer'),
(134, 18, 'TEXT', 'This form is an example. Please check our knowledgebase for articles related to how you should build your form. Articles are updated daily. <a href="http://www.rsjoomla.com/" target="_blank">http://www.rsjoomla.com/</a>'),
(135, 19, 'NAME', 'Page1'),
(136, 19, 'NEXTBUTTON', 'Next >'),
(137, 19, 'PREVBUTTON', 'Prev'),
(138, 19, 'ADDITIONALATTRIBUTES', ''),
(139, 20, 'NAME', 'Page2'),
(140, 20, 'NEXTBUTTON', 'Next >'),
(141, 20, 'PREVBUTTON', 'Prev'),
(142, 20, 'ADDITIONALATTRIBUTES', ''),
(143, 21, 'NAME', 'CompanyHeader'),
(144, 21, 'TEXT', 'Please tell us a little about your company.'),
(145, 22, 'NAME', 'ContactHeader'),
(146, 22, 'TEXT', 'Please let us know how and when to contact you.'),
(147, 1, 'VALIDATIONEXTRA', ''),
(148, 3, 'VALIDATIONEXTRA', ''),
(149, 10, 'VALIDATIONEXTRA', ''),
(150, 12, 'VALIDATIONEXTRA', ''),
(151, 2, 'EMAILATTACH', '');

-- --------------------------------------------------------

--
-- Table structure for table `rega_rsform_submissions`
--

CREATE TABLE IF NOT EXISTS `rega_rsform_submissions` (
  `SubmissionId` int(11) NOT NULL AUTO_INCREMENT,
  `FormId` int(11) NOT NULL DEFAULT '0',
  `DateSubmitted` datetime NOT NULL,
  `UserIp` varchar(15) NOT NULL DEFAULT '',
  `Username` varchar(255) NOT NULL DEFAULT '',
  `UserId` text NOT NULL,
  `Lang` varchar(255) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  PRIMARY KEY (`SubmissionId`),
  KEY `FormId` (`FormId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `rega_rsform_submissions`
--

INSERT INTO `rega_rsform_submissions` (`SubmissionId`, `FormId`, `DateSubmitted`, `UserIp`, `Username`, `UserId`, `Lang`, `confirmed`) VALUES
(1, 1, '2011-08-28 12:02:15', '117.195.41.190', '', '0', 'en-GB', 1),
(2, 1, '2011-08-28 12:04:19', '117.195.41.190', '', '0', 'en-GB', 1),
(3, 1, '2011-08-28 12:06:32', '117.195.41.190', '', '0', 'en-GB', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rega_rsform_submission_columns`
--

CREATE TABLE IF NOT EXISTS `rega_rsform_submission_columns` (
  `FormId` int(11) NOT NULL,
  `ColumnName` varchar(255) NOT NULL,
  `ColumnStatic` tinyint(1) NOT NULL,
  PRIMARY KEY (`FormId`,`ColumnName`,`ColumnStatic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rega_rsform_submission_values`
--

CREATE TABLE IF NOT EXISTS `rega_rsform_submission_values` (
  `SubmissionValueId` int(11) NOT NULL AUTO_INCREMENT,
  `FormId` int(11) NOT NULL,
  `SubmissionId` int(11) NOT NULL DEFAULT '0',
  `FieldName` text NOT NULL,
  `FieldValue` text NOT NULL,
  PRIMARY KEY (`SubmissionValueId`),
  KEY `FormId` (`FormId`),
  KEY `SubmissionId` (`SubmissionId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `rega_rsform_submission_values`
--

INSERT INTO `rega_rsform_submission_values` (`SubmissionValueId`, `FormId`, `SubmissionId`, `FieldName`, `FieldValue`) VALUES
(1, 1, 1, 'FullName', 'Ashwin'),
(2, 1, 1, 'Email', 'coolbung@gmail.com'),
(3, 1, 1, 'Message', 'test'),
(4, 1, 1, 'Submit', 'Submit'),
(5, 1, 1, 'formId', '1'),
(6, 1, 2, 'FullName', 'Ashwin D'),
(7, 1, 2, 'Email', 'ashwin.date@tekdi.net'),
(8, 1, 2, 'Message', 'Test'),
(9, 1, 2, 'Submit', 'Submit'),
(10, 1, 2, 'formId', '1'),
(11, 1, 3, 'FullName', 'Ashwin'),
(12, 1, 3, 'Email', 'ashwin.date@tekdi.net'),
(13, 1, 3, 'Message', 'test'),
(14, 1, 3, 'Submit', 'Submit'),
(15, 1, 3, 'formId', '1');

-- --------------------------------------------------------

--
-- Table structure for table `rega_rsform_translations`
--

CREATE TABLE IF NOT EXISTS `rega_rsform_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `lang_code` varchar(32) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `reference_id` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rega_schemas`
--

CREATE TABLE IF NOT EXISTS `rega_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rega_session`
--

CREATE TABLE IF NOT EXISTS `rega_session` (
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` varchar(20480) DEFAULT NULL,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  `usertype` varchar(50) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rega_session`
--

INSERT INTO `rega_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`, `usertype`) VALUES
('4ade2b8e9184cd394a66e3afad17d286', 0, 1, '1316378164', '__default|a:8:{s:22:"session.client.browser";s:64:"Mozilla/5.0 (X11; Linux i686; rv:6.0) Gecko/20100101 Firefox/6.0";s:15:"session.counter";i:142;s:8:"registry";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:4:"user";O:5:"JUser":23:{s:9:"\0*\0isRoot";b:0;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:0:{}s:5:"guest";i:1;s:10:"\0*\0_params";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:14:"\0*\0_authGroups";a:1:{i:0;i:1;}s:14:"\0*\0_authLevels";a:2:{i:0;i:1;i:1;i:1;}s:15:"\0*\0_authActions";N;s:12:"\0*\0_errorMsg";N;s:10:"\0*\0_errors";a:0:{}s:3:"aid";i:0;}s:13:"session.token";s:32:"ec4d0c9211d2a1e68b25e813c96b20cd";s:19:"session.timer.start";i:1316372605;s:18:"session.timer.last";i:1316378163;s:17:"session.timer.now";i:1316378163;}year|s:4:"2011";', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `rega_template_styles`
--

CREATE TABLE IF NOT EXISTS `rega_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `rega_template_styles`
--

INSERT INTO `rega_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(2, 'bluestork', 1, '1', 'Bluestork - Default', '{"useRoundedCorners":"1","showSiteName":"0"}'),
(3, 'atomic', 0, '0', 'Atomic - Default', '{}'),
(4, 'beez_20', 0, '0', 'Beez2 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(6, 'beez5', 0, '0', 'Beez5 - Default-Fruit Shop', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/sampledata\\/fruitshop\\/fruits.gif","sitetitle":"Matuna Market ","sitedescription":"Fruit Shop Sample Site","navposition":"left","html5":"0"}'),
(7, 'minima', 1, '0', 'Minima - Default', '{"templateColor":"#2A94C8","darkerColor":"#247eaa"}'),
(8, 'ja_cloris', 0, '0', 'ja_cloris - Default', '{}'),
(9, 'ja_portfolio', 0, '1', 'JA_Portfolio - Default', '{}');

-- --------------------------------------------------------

--
-- Table structure for table `rega_updates`
--

CREATE TABLE IF NOT EXISTS `rega_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `categoryid` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(10) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Available Updates' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rega_update_categories`
--

CREATE TABLE IF NOT EXISTS `rega_update_categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '',
  `description` text NOT NULL,
  `parent` int(11) DEFAULT '0',
  `updatesite` int(11) DEFAULT '0',
  PRIMARY KEY (`categoryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Update Categories' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rega_update_sites`
--

CREATE TABLE IF NOT EXISTS `rega_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  PRIMARY KEY (`update_site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Update Sites' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `rega_update_sites`
--

INSERT INTO `rega_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`) VALUES
(1, 'Joomla Core', 'collection', 'http://update.joomla.org/core/list.xml', 1),
(2, 'Joomla Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 1),
(3, 'Admin Tools Core Updates', 'extension', 'http://www.akeebabackup.com/index.php?option=com_ars&view=update&task=stream&id=5&format=xml', 1),
(4, 'Akeeba Backup Core Updates', 'extension', 'http://www.akeebabackup.com/index.php?option=com_ars&view=update&task=stream&id=1&format=xml', 1),
(5, 'Minima Update Site', 'extension', 'http://minimatemplate.com/update/templates/minima/extension.xml', 1),
(6, 'Minima Update Site', 'collection', 'http://minimatemplate.com/update/update.xml', 1),
(7, 'Minima Update Site', 'extension', 'http://minimatemplate.com/update/modules/mod_mypanel/extension.xml', 1),
(8, 'Minima Update Site', 'extension', 'http://minimatemplate.com/update/modules/mod_myshortcuts/extension.xml', 1),
(9, '', 'collection', 'http://update.joomlart.com/service/tracking/list.xml', 1);

-- --------------------------------------------------------

--
-- Table structure for table `rega_update_sites_extensions`
--

CREATE TABLE IF NOT EXISTS `rega_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';

--
-- Dumping data for table `rega_update_sites_extensions`
--

INSERT INTO `rega_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(3, 10000),
(4, 10003),
(5, 10006),
(6, 10006),
(6, 10007),
(6, 10008),
(7, 10007),
(8, 10008),
(9, 10017);

-- --------------------------------------------------------

--
-- Table structure for table `rega_usergroups`
--

CREATE TABLE IF NOT EXISTS `rega_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `rega_usergroups`
--

INSERT INTO `rega_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 20, 'Public'),
(2, 1, 6, 17, 'Registered'),
(3, 2, 7, 14, 'Author'),
(4, 3, 8, 11, 'Editor'),
(5, 4, 9, 10, 'Publisher'),
(6, 1, 2, 5, 'Manager'),
(7, 6, 3, 4, 'Administrator'),
(8, 1, 18, 19, 'Super Users');

-- --------------------------------------------------------

--
-- Table structure for table `rega_users`
--

CREATE TABLE IF NOT EXISTS `rega_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `rega_users`
--

INSERT INTO `rega_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`) VALUES
(42, 'Super User', 'njzs_ashwin', 'njzs_coolbung@gmail.com', '9062dc06c299104e3373a70c5552bda0', 'deprecated', 1, 0, '2011-07-14 20:09:05', '2011-07-24 13:26:22', '', ''),
(43, 'Mrinmayee Kalkar', 'mrinmayee', 'kmrinmayee@gmail.com', '76725c9b9d1172cf732476083d712d3a:cfkcKNX9nK85e3X4AiqBRBbLKG86lujF', '', 0, 0, '2011-07-17 08:37:52', '2011-07-18 06:23:46', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}'),
(39, 'Super User', 'ashwin', 'coolbung@gmail.com', 'c17b179b5b4449a15e1dea3789627be1:V4tIi4IPrLVw8ploEufHYGAGkSX4phk2', 'deprecated', 0, 1, '2011-07-14 20:09:05', '2011-09-02 17:54:20', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `rega_user_profiles`
--

CREATE TABLE IF NOT EXISTS `rega_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';

-- --------------------------------------------------------

--
-- Table structure for table `rega_user_usergroup_map`
--

CREATE TABLE IF NOT EXISTS `rega_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rega_user_usergroup_map`
--

INSERT INTO `rega_user_usergroup_map` (`user_id`, `group_id`) VALUES
(39, 8),
(42, 8),
(43, 8);

-- --------------------------------------------------------

--
-- Table structure for table `rega_viewlevels`
--

CREATE TABLE IF NOT EXISTS `rega_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `rega_viewlevels`
--

INSERT INTO `rega_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 1, '[6,2,8]'),
(3, 'Special', 2, '[6,3,8]');

-- --------------------------------------------------------

--
-- Table structure for table `rega_weblinks`
--

CREATE TABLE IF NOT EXISTS `rega_weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
