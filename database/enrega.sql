-- phpMyAdmin SQL Dump
-- version 3.3.10
-- http://www.phpmyadmin.net
--
-- Host: mysql.enrega.dreamhosters.com
-- Generation Time: Aug 19, 2011 at 03:28 AM
-- Server version: 5.1.53
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `enrega`
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

--
-- Dumping data for table `rega_admintools_acl`
--


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

--
-- Dumping data for table `rega_admintools_adminiplist`
--


-- --------------------------------------------------------

--
-- Table structure for table `rega_admintools_badwords`
--

CREATE TABLE IF NOT EXISTS `rega_admintools_badwords` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(255) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `rega_admintools_badwords`
--


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

--
-- Dumping data for table `rega_admintools_customperms`
--


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

--
-- Dumping data for table `rega_admintools_ipautoban`
--


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

--
-- Dumping data for table `rega_admintools_ipblock`
--


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

--
-- Dumping data for table `rega_admintools_log`
--


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

--
-- Dumping data for table `rega_admintools_redirects`
--


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
('cparams', '{"latestjversion":"{\\"version\\":\\"1.6.5\\",\\"updates\\":{\\"1.6.0\\":\\"http:\\\\\\/\\\\\\/joomlacode.org\\\\\\/gf\\\\\\/download\\\\\\/frsrelease\\\\\\/15178\\\\\\/66272\\\\\\/Joomla_1.6.0_to_1.6.5-Stable-Patch_Package.zip\\",\\"1.6.4\\":\\"http:\\\\\\/\\\\\\/joomlacode.org\\\\\\/gf\\\\\\/download\\\\\\/frsrelease\\\\\\/15178\\\\\\/66275\\\\\\/Joomla_1.6.4_to_1.6.5-Stable-Patch_Package.zip\\"},\\"full\\":\\"http:\\\\\\/\\\\\\/joomlacode.org\\\\\\/gf\\\\\\/download\\\\\\/frsrelease\\\\\\/15179\\\\\\/66269\\\\\\/Joomla_1.6.5-Stable-Full_Package.zip\\"}","lastjupdatecheck":1311513890}');

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

--
-- Dumping data for table `rega_admintools_wafexceptions`
--


-- --------------------------------------------------------

--
-- Table structure for table `rega_ak_acl`
--

CREATE TABLE IF NOT EXISTS `rega_ak_acl` (
  `user_id` bigint(20) unsigned NOT NULL,
  `permissions` mediumtext,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rega_ak_acl`
--


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

--
-- Dumping data for table `rega_ak_stats`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `rega_assets`
--

INSERT INTO `rega_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 1, 418, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 17, 20, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 21, 22, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 23, 24, 1, 'com_installer', 'com_installer', '{"core.admin":{"7":1},"core.manage":{"7":1},"core.delete":[],"core.edit.state":[]}'),
(11, 1, 25, 26, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 27, 28, 1, 'com_login', 'com_login', '{}'),
(13, 1, 29, 30, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 31, 32, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 33, 34, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 35, 36, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 37, 38, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 39, 40, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 41, 44, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 45, 46, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 47, 48, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 49, 50, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 51, 52, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 53, 54, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.own":{"6":1},"core.edit.state":[]}'),
(25, 1, 55, 58, 1, 'com_weblinks', 'com_weblinks', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(26, 1, 59, 60, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 19, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 42, 43, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(31, 25, 56, 57, 2, 'com_weblinks.category.6', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 1, 414, 415, 1, 'com_admintools', 'admintools', '{}'),
(33, 1, 416, 417, 1, 'com_akeeba', 'akeeba', '{}');

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

--
-- Dumping data for table `rega_banners`
--


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

--
-- Dumping data for table `rega_banner_clients`
--


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

--
-- Dumping data for table `rega_banner_tracks`
--


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

--
-- Dumping data for table `rega_contact_details`
--


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `rega_content`
--


-- --------------------------------------------------------

--
-- Table structure for table `rega_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `rega_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rega_content_frontpage`
--


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

--
-- Dumping data for table `rega_content_rating`
--


-- --------------------------------------------------------

--
-- Table structure for table `rega_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `rega_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rega_core_log_searches`
--


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

--
-- Dumping data for table `rega_enrega_blockexpensearchive`
--


-- --------------------------------------------------------

--
-- Table structure for table `rega_enrega_blockexpenses`
--

CREATE TABLE IF NOT EXISTS `rega_enrega_blockexpenses` (
  `UniqueId` int(11) NOT NULL,
  `BlockUniqueId` int(11) NOT NULL COMMENT 'Foreign Key from Blocks Table',
  `Year` varchar(20) DEFAULT NULL,
  `NoOfWorks` int(11) NOT NULL DEFAULT '0',
  `LabourExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `MaterialExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` datetime NOT NULL,
  `Link` varchar(100) DEFAULT NULL,
  `Html_hash` varchar(400) NOT NULL COMMENT 'Hash of the HTML contents of the district page (i.e. the one that has a list of panchayats)\r\n',
  PRIMARY KEY (`UniqueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table will store the Expenses information of Block for ';

--
-- Dumping data for table `rega_enrega_blockexpenses`
--


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

--
-- Dumping data for table `rega_enrega_blockexpensesappendix`
--


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

--
-- Dumping data for table `rega_enrega_districtexpensearchive`
--


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
  `ModifiedOn` datetime NOT NULL,
  `Link` varchar(100) DEFAULT NULL,
  `Html_hash` varchar(400) NOT NULL COMMENT 'Hash of the HTML contents of the district page (i.e. the one that has a list of talukas)',
  PRIMARY KEY (`UniqueId`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `rega_enrega_districtexpenses`
--

INSERT INTO `rega_enrega_districtexpenses` (`UniqueId`, `districtuniqueid`, `Year`, `NoOfWorks`, `LabourExpenditures`, `MaterialExpenditures`, `CreatedOn`, `ModifiedOn`, `Link`, `Html_hash`) VALUES
(1, 1809, 2011, 2311, 21739902, 2673214, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(2, 1823, 2011, 3054, 125247, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(3, 1824, 2011, 19579, 53677911, 1937688, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(4, 1815, 2011, 4746, 27173242, 49462018, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(5, 1818, 2011, 2134, 5620188, 1754187, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(6, 1828, 2011, 2169, 25554353, 1510252, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(7, 1822, 2011, 7829, 10857896, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(8, 1829, 2011, 2607, 43598886, 906409, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(9, 1807, 2011, 878, 13795802, 2600379, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(10, 1830, 2011, 3740, 28918927, 11265263, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(11, 1833, 2011, 5671, 21868452, 1029051, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(12, 1834, 2011, 1410, 8700093, 1959654, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(13, 1808, 2011, 665, 10171907, 9577, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(14, 1816, 2011, 853, 20108658, 4483849, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(15, 1814, 2011, 859, 21919644, 268927, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(16, 1821, 2011, 2848, 74188281, 6063776, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(17, 1827, 2011, 332, 4790782, 4867, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(18, 1819, 2011, 10163, 253221777, 23714099, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(19, 1831, 2011, 3349, 92493762, 4471, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(20, 1806, 2011, 759, 8253938, 155024, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(21, 1820, 2011, 1261, 10481877, 89229, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(22, 1817, 2011, 680, 713784, 133885, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(23, 1810, 2011, 465, 3299804, 8336, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(24, 1803, 2011, 1737, 13540825, 428, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(25, 1804, 2011, 629, 5269625, 12199, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(26, 1812, 2011, 1710, 44363464, 265506, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(27, 1811, 2011, 29, 1031305, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(28, 1805, 2011, 232, 898324, 13452, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(29, 1813, 2011, 439, 8400714, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(30, 1802, 2011, 10295, 356725, 1015245, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(31, 1826, 2011, 1086, 11618194, 638757, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(32, 1832, 2011, 2107, 840556, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', ''),
(33, 1825, 2011, 3021, 88707166, 1981688, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'http://164.100.112.66/netnrega/citizen_html/phy_fin_reptemp.aspx?lflag=eng&state_name=MAHARASHTRA&fi', '');

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

--
-- Dumping data for table `rega_enrega_districtexpensesappendix`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `rega_enrega_districts`
--

INSERT INTO `rega_enrega_districts` (`UniqueId`, `districtid`, `StateUniqueId`, `DistrictName_Mr`, `DistrictName_En`, `DistrictCode`, `CreatedOn`, `ModifiedOn`) VALUES
(1, '1809', 18, '', 'AHMEDNAGAR', '1809', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '1823', 18, '', 'AKOLA', '1823', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '1824', 18, '', 'AMRAVATI', '1824', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
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
(31, '1826', 18, '', 'WARDHA', '1826', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, '1832', 18, '', 'WASHIM', '1832', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, '1825', 18, '', 'YAVATMAL', '1825', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
  `ModifiedOn` datetime NOT NULL,
  `Link` varchar(100) DEFAULT NULL,
  `Html_hash` varchar(400) NOT NULL,
  PRIMARY KEY (`UniqueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table will store the Expenses information of Block for ';

--
-- Dumping data for table `rega_enrega_grampanchayatexpenses`
--


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

--
-- Dumping data for table `rega_enrega_grampanchayatexpensesappendix`
--


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

--
-- Dumping data for table `rega_enrega_grampanchayatexpensesarchive`
--


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

--
-- Dumping data for table `rega_enrega_grampanchayats`
--


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

--
-- Dumping data for table `rega_enrega_languageresourcestrings`
--


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

--
-- Dumping data for table `rega_enrega_stateexpensearchive`
--


-- --------------------------------------------------------

--
-- Table structure for table `rega_enrega_stateexpenses`
--

CREATE TABLE IF NOT EXISTS `rega_enrega_stateexpenses` (
  `UniqueId` int(11) NOT NULL,
  `StateUniqueId` int(11) NOT NULL COMMENT 'Foreign Key from States Table',
  `Year` varchar(50) DEFAULT NULL,
  `NoOfWorks` int(11) NOT NULL DEFAULT '0',
  `LabourExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `MaterialExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` datetime NOT NULL,
  `Link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UniqueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rega_enrega_stateexpenses`
--


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

--
-- Dumping data for table `rega_enrega_stateexpensesappendix`
--


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

--
-- Dumping data for table `rega_enrega_worktypes`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10014 ;

--
-- Dumping data for table `rega_extensions`
--

INSERT INTO `rega_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '', '{"show_contact_category":"hide","show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '', '{"administrator":"en-GB","site":"en-GB"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html","enable_flash":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '', '{"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_word_count":"0","show_headings":"1","show_name":"1","show_articles":"0","show_link":"1","show_description":"1","show_description_image":"1","display_num":"","show_pagination_limit":"1","show_pagination":"1","show_pagination_results":"1","show_cat_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 1, '', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(21, 'com_weblinks', 'component', 'com_weblinks', '', 1, 1, 1, 0, '', '{"show_comp_description":"1","comp_description":"","show_link_hits":"1","show_link_description":"1","show_other_cats":"0","show_headings":"0","show_numbers":"0","show_report":"1","count_clicks":"1","target":"0","link_icons":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","show_category":"1","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_author":"1","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"1","show_item_navigation":"1","show_vote":"0","show_readmore":"1","show_readmore_title":"1","readmore_limit":"100","show_icons":"1","show_print_icon":"1","show_email_icon":"1","show_hits":"1","show_noauth":"0","category_layout":"_:blog","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1","feed_summary":"0","filters":{"1":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"2":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"10":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"12":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"BL","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '', '{"allowUserRegistration":"1","new_usertype":"2","useractivation":"1","frontend_userparams":"1","mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(100, 'PHPMailer', 'library', 'phpmailer', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(101, 'SimplePie', 'library', 'simplepie', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Web Application Framework', 'library', 'joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"Joomla! Web Application Framework","type":"library","creationDate":"2008","author":"Joomla","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"1.6.0","description":"The Joomla! Web Application Framework is the Core of the Joomla! Content Management System","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(217, 'mod_weblinks', 'module', 'mod_weblinks', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(306, 'mod_online', 'module', 'mod_online', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_unread', 'module', 'mod_unread', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(405, 'plg_content_geshi', 'plugin', 'geshi', 'content', 0, 0, 1, 0, '', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '', '{"style":"none"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 1, '', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 1, '', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 1, '', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '', '{"linenumbers":"0","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 1, '', '{"mode":"1","skin":"0","compressed":"0","cleanup_startup":"0","cleanup_save":"2","entity_encoding":"raw","lang_mode":"0","lang_code":"en","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":"","toolbar":"top","toolbar_align":"left","html_height":"550","html_width":"750","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","format_date":"%Y-%m-%d","inserttime":"1","format_time":"%H:%M:%S","colors":"1","table":"1","smilies":"1","media":"1","hr":"1","directionality":"1","fullscreen":"1","style":"1","layer":"1","xhtmlxtras":"1","visualchars":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advimage":"1","advlink":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","safari":"0","custom_plugin":"","custom_button":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 1, '', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(421, 'plg_search_weblinks', 'plugin', 'weblinks', 'search', 0, 1, 1, 0, '', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 1, 1, 1, '', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 1, 1, 1, '', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '', '{}', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 1, '', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '', '{"autoregister":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 1, '', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(500, 'atomic', 'template', 'atomic', '', 0, 1, 1, 0, '{"legacy":false,"name":"atomic","type":"template","creationDate":"10\\/10\\/09","author":"Ron Severdia","copyright":"Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.","authorEmail":"contact@kontentdesign.com","authorUrl":"http:\\/\\/www.kontentdesign.com","version":"1.6.0","description":"TPL_ATOMIC_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(502, 'bluestork', 'template', 'bluestork', '', 1, 1, 1, 0, '{"legacy":false,"name":"bluestork","type":"template","creationDate":"07\\/02\\/09","author":"Ron Severdia","copyright":"Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.","authorEmail":"contact@kontentdesign.com","authorUrl":"http:\\/\\/www.kontentdesign.com","version":"1.6.0","description":"TPL_BLUESTORK_XML_DESCRIPTION","group":""}', '{"useRoundedCorners":"1","showSiteName":"0","textBig":"0","highContrast":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(503, 'beez_20', 'template', 'beez_20', '', 0, 1, 1, 0, '{"legacy":false,"name":"beez_20","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"1.6.0","description":"TPL_BEEZ2_XML_DESCRIPTION","group":""}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"legacy":false,"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.","authorEmail":"hathor@tarrconsulting.com","authorUrl":"http:\\/\\/www.tarrconsulting.com","version":"1.6.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":""}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(505, 'beez5', 'template', 'beez5', '', 0, 1, 1, 0, '{"legacy":false,"name":"beez5","type":"template","creationDate":"21 May 2010","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2011 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"1.6.0","description":"TPL_BEEZ5_XML_DESCRIPTION","group":""}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","html5":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (United Kingdom)', 'language', 'en-GB', '', 0, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (United Kingdom)', 'language', 'en-GB', '', 1, 1, 1, 1, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'Joomla! CMS', 'file', 'joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"files_joomla","type":"file","creationDate":"June 2011","author":"Joomla!","copyright":"(C) 2005 - 2011 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"1.6.4","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10000, 'admintools', 'component', 'com_admintools', '', 1, 1, 0, 0, '{"legacy":true,"name":"Admintools","type":"component","creationDate":"2011-07-19","author":"Nicholas K. Dionysopoulos","copyright":"Copyright (c)2010 Nicholas K. Dionysopoulos","authorEmail":"nicholas@akeebabackup.com","authorUrl":"http:\\/\\/www.akeebabackup.com","version":"2.1.4","description":"Security and utilitarian tools for Joomla! site administrators","group":""}', '{"latestjversion":null,"lastjupdatecheck":null}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10001, 'Admin Tools Joomla! Upgrade Notification', 'module', 'mod_atjupgrade', '', 1, 1, 2, 0, '{"legacy":true,"name":"Admin Tools Joomla! Upgrade Notification","type":"module","creationDate":"2011-07-19","author":"Nicholas K. Dionysopoulos","copyright":"Copyright (c)2010 Nicholas K. Dionysopoulos","authorEmail":"nicholas@dionysopoulos.me","authorUrl":"http:\\/\\/www.akeebabackup.com","version":"2.1.4","description":"","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10002, 'System - Admin Tools', 'plugin', 'admintools', 'system', 0, 1, 1, 0, '{"legacy":true,"name":"System - Admin Tools","type":"plugin","creationDate":"2011-07-19","author":"Nicholas K. Dionysopoulos","copyright":"Copyright (c)2010 Nicholas K. Dionysopoulos","authorEmail":"nicholas@akeebabackup.com","authorUrl":"http:\\/\\/www.akeebabackup.com","version":"2.1.4","description":"\\n\\t\\tHandles all the system-wide features provided by Admin Tools Core\\n\\t","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', -30000, 0),
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
(10013, 'com_enrega', 'component', 'com_enrega', '', 1, 1, 1, 0, '', '', '', '', 0, '0000-00-00 00:00:00', 0, 0);

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
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `rega_languages`
--

INSERT INTO `rega_languages` (`lang_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `published`) VALUES
(1, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=105 ;

--
-- Dumping data for table `rega_menu`
--

INSERT INTO `rega_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `ordering`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 45, 0, '*', 0),
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
(101, 'mainmenu', 'Home', 'home', '', 'home', 'index.php?option=com_content&view=featured', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"num_leading_articles":"1","num_intro_articles":"3","num_columns":"3","num_links":"0","orderby_pri":"","orderby_sec":"front","order_date":"","multi_column_order":"1","show_pagination":"2","show_pagination_results":"1","show_noauth":"","article-allow_ratings":"","article-allow_comments":"","show_feed_link":"1","feed_summary":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_readmore":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","show_page_heading":1,"page_title":"","page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 39, 40, 1, '*', 0),
(104, 'main', 'COM_ADMINTOOLS', 'comadmintools', '', 'comadmintools', 'index.php?option=com_admintools', 'component', 0, 1, 1, 10000, 0, 0, '0000-00-00 00:00:00', 0, 1, '../media/com_admintools/images/admintools-16.png', 0, '', 43, 44, 0, '', 1),
(103, 'main', 'COM_AKEEBA', 'comakeeba', '', 'comakeeba', 'index.php?option=com_akeeba', 'component', 0, 1, 1, 10003, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_akeeba/assets/images/akeeba-16.png', 0, '', 41, 42, 0, '', 1);

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

--
-- Dumping data for table `rega_messages`
--


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

--
-- Dumping data for table `rega_messages_cfg`
--


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

--
-- Dumping data for table `rega_newsfeeds`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `rega_redirect_links`
--

INSERT INTO `rega_redirect_links` (`id`, `old_url`, `new_url`, `referer`, `comment`, `published`, `created_date`, `modified_date`) VALUES
(1, 'http://enrega.dreamhosters.com/index.php/component/enrega/?view=blocks&id=29', '', 'http://enrega.dreamhosters.com/index.php/component/enrega/?view=districts&sort=MaterialExpenditures&direction=asc', '', 0, '2011-08-18 20:31:22', '0000-00-00 00:00:00'),
(2, 'http://enrega.dreamhosters.com/index.php/component/enrega/?view=blocks&id=23', '', 'http://enrega.dreamhosters.com/index.php/component/enrega/?view=districts', '', 0, '2011-08-19 04:54:49', '0000-00-00 00:00:00'),
(3, 'http://enrega.dreamhosters.com/index.php/component/enrega/?view=blocks&id=1', '', 'http://enrega.dreamhosters.com/index.php/component/enrega/?view=districts&sort=DistrictName_En&direction=asc', '', 0, '2011-08-19 05:15:07', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `rega_schemas`
--

CREATE TABLE IF NOT EXISTS `rega_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rega_schemas`
--


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
('ac156835c93e7ad1811ce827271c2d8a', 0, 1, '1313749574', '__default|a:8:{s:22:"session.client.browser";s:64:"Mozilla/5.0 (X11; Linux i686; rv:5.0) Gecko/20100101 Firefox/5.0";s:15:"session.counter";i:2;s:8:"registry";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:4:"user";O:5:"JUser":23:{s:9:"\0*\0isRoot";N;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:0:{}s:5:"guest";i:1;s:10:"\0*\0_params";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:14:"\0*\0_authGroups";N;s:14:"\0*\0_authLevels";a:2:{i:0;i:1;i:1;i:1;}s:15:"\0*\0_authActions";N;s:12:"\0*\0_errorMsg";N;s:10:"\0*\0_errors";a:0:{}s:3:"aid";i:0;}s:13:"session.token";s:32:"e481545b7ba9833626c90a1d76d834ba";s:19:"session.timer.start";i:1313749573;s:18:"session.timer.last";i:1313749573;s:17:"session.timer.now";i:1313749573;}', 0, '', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `rega_template_styles`
--

INSERT INTO `rega_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(2, 'bluestork', 1, '0', 'Bluestork - Default', '{"useRoundedCorners":"1","showSiteName":"0"}'),
(3, 'atomic', 0, '1', 'Atomic - Default', '{}'),
(4, 'beez_20', 0, '0', 'Beez2 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(6, 'beez5', 0, '0', 'Beez5 - Default-Fruit Shop', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/sampledata\\/fruitshop\\/fruits.gif","sitetitle":"Matuna Market ","sitedescription":"Fruit Shop Sample Site","navposition":"left","html5":"0"}'),
(7, 'minima', 1, '1', 'Minima - Default', '{"templateColor":"#2A94C8","darkerColor":"#247eaa"}');

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

--
-- Dumping data for table `rega_updates`
--


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

--
-- Dumping data for table `rega_update_categories`
--


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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Update Sites' AUTO_INCREMENT=9 ;

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
(8, 'Minima Update Site', 'extension', 'http://minimatemplate.com/update/modules/mod_myshortcuts/extension.xml', 1);

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
(8, 10008);

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
(39, 'Super User', 'ashwin', 'coolbung@gmail.com', 'c17b179b5b4449a15e1dea3789627be1:V4tIi4IPrLVw8ploEufHYGAGkSX4phk2', 'deprecated', 0, 1, '2011-07-14 20:09:05', '2011-08-18 18:55:01', '', '');

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

--
-- Dumping data for table `rega_user_profiles`
--


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

--
-- Dumping data for table `rega_weblinks`
--

