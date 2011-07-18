-- phpMyAdmin SQL Dump
-- version 3.3.10
-- http://www.phpmyadmin.net
--
-- Host: mysql.enrega.dreamhosters.com
-- Generation Time: Jul 18, 2011 at 10:00 AM
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
  `UniqueId` int(10) NOT NULL,
  `DistrictUniqueId` int(10) NOT NULL COMMENT 'Foreign Key From  District Table ',
  `Year` year(4) NOT NULL,
  `NoOfWorks` int(10) NOT NULL DEFAULT '0',
  `LabourExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `MaterialExpenditures` decimal(10,0) NOT NULL DEFAULT '0',
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` datetime NOT NULL,
  `Link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UniqueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rega_enrega_districtexpenses`
--


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
  `UniqueId` int(10) NOT NULL,
  `DistrictId` varchar(10) DEFAULT NULL,
  `StateUniqueId` int(10) NOT NULL COMMENT 'Foreign Key from States Table',
  `DistrictName_Mr` varchar(100) DEFAULT NULL,
  `DistrictName_En` varchar(100) DEFAULT NULL,
  `DistrictCode` varchar(10) DEFAULT NULL,
  `CreatedOn` datetime NOT NULL,
  `ModifiedOn` datetime NOT NULL,
  PRIMARY KEY (`UniqueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rega_enrega_districts`
--


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

