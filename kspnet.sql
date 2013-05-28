# phpMyAdmin MySQL-Dump
# version 2.4.0
# http://www.phpmyadmin.net/ (download page)
#
# Host: localhost
# Generation Time: May 28, 2003 at 10:31 AM
# Server version: 4.0.12
# PHP Version: 4.3.1
# Database : `kspnet`
# --------------------------------------------------------

#
# Table structure for table `authors`
#

DROP TABLE IF EXISTS `authors`;
CREATE TABLE `authors` (
  `authorid` int(10) unsigned NOT NULL auto_increment,
  `fname` varchar(40) NOT NULL default '',
  `lname` varchar(40) NOT NULL default '',
  `desc` text,
  PRIMARY KEY  (`authorid`)
) TYPE=MyISAM;

#
# Dumping data for table `authors`
#

# --------------------------------------------------------

#
# Table structure for table `book_authors`
#

DROP TABLE IF EXISTS `book_authors`;
CREATE TABLE `book_authors` (
  `bookid` varchar(6) NOT NULL default '',
  `author` int(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`bookid`,`author`)
) TYPE=MyISAM;

#
# Dumping data for table `book_authors`
#

# --------------------------------------------------------

#
# Table structure for table `book_series`
#

DROP TABLE IF EXISTS `book_series`;
CREATE TABLE `book_series` (
  `bookid` varchar(6) NOT NULL default '',
  `series` varchar(40) NOT NULL default '',
  `seq` tinyint(4) NOT NULL default '1',
  `desc` text,
  PRIMARY KEY  (`bookid`),
  UNIQUE KEY `series_seq` (`series`,`seq`)
) TYPE=MyISAM;

#
# Dumping data for table `book_series`
#

INSERT INTO `book_series` (`bookid`, `series`, `seq`, `desc`) VALUES ('007A', 'The Inevitable Journey', 1, NULL),
('007B', 'The Inevitable Journey', 2, NULL),
('007C', 'The Inevitable Journey', 3, NULL),
('007D', 'The Inevitable Journey', 4, NULL),
('008A', 'The Muslim Family', 1, NULL),
('008B', 'The Muslim Family', 2, NULL),
('008C', 'The Muslim Family', 3, NULL),
('008D', 'The Muslim Family', 4, NULL);
# --------------------------------------------------------

#
# Table structure for table `book_series_def`
#

DROP TABLE IF EXISTS `book_series_def`;
CREATE TABLE `book_series_def` (
  `series` varchar(40) NOT NULL default '',
  `desc` text NOT NULL,
  `image` varchar(40) default NULL,
  PRIMARY KEY  (`series`)
) TYPE=MyISAM;

#
# Dumping data for table `book_series_def`
#

INSERT INTO `book_series_def` (`series`, `desc`, `image`) VALUES ('The Muslim Family', 'Description of the Muslim family.', 'muslim-family.gif'),
('The Inevitable Journey', 'Description of the Inevitable Journey.', 'inevitable-journey.gif');
# --------------------------------------------------------

#
# Table structure for table `books`
#

DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `bookid` varchar(6) NOT NULL default '',
  `title` varchar(60) NOT NULL default '',
  `price` double(6,2) NOT NULL default '0.00',
  `isbn` varchar(13) default NULL,
  `desc` text,
  `pages` int(4) default NULL,
  `length` double(4,2) default NULL,
  `width` double(4,2) default NULL,
  `binding` varchar(40) default NULL,
  `image` varchar(40) default NULL,
  PRIMARY KEY  (`bookid`),
  UNIQUE KEY `isbn` (`isbn`)
) TYPE=MyISAM;

#
# Dumping data for table `books`
#

INSERT INTO `books` (`bookid`, `title`, `price`, `isbn`, `desc`, `pages`, `length`, `width`, `binding`, `image`) VALUES ('001A', 'Ibn ul-Qayyim\'s Ar-Risalat ut-Tabukiyyah, 2nd Ed.', '8.00', '1-891229-61-3', NULL, 136, NULL, NULL, NULL, NULL),
('006', 'The Night Prayers: Qiyam & Tarawih, 2nd Ed.', '9.00', '1-891229-22-2', NULL, 195, NULL, NULL, NULL, NULL),
('007A', 'Sickness: Regulations & Exhortations, 2nd Ed.', '8.00', '1-891229-78-8', NULL, 171, NULL, NULL, NULL, NULL),
('007B', 'The Final Bequest: The Islamic Will & Testament', '8.00', '1-891229-79-6', NULL, 148, NULL, NULL, NULL, NULL),
('007C', 'Funerals: Regulations & Exhortations', '13.00', '1-891229-80-X', NULL, 344, NULL, NULL, NULL, NULL),
('007D', 'Life in al-Barzakh, 2nd Ed.', '7.00', '1-891229-81-8', NULL, 126, NULL, NULL, NULL, NULL),
('008A', 'The Quest for Love & Mercy', '10.00', '1-891229-51-6', NULL, 211, NULL, NULL, NULL, NULL),
('008B', 'Closer than a Garment', '10.00', '1-891229-52-4', NULL, 220, NULL, NULL, NULL, NULL),
('008C', 'The Fragile Vessels', '9.00', '1-891229-53-2', NULL, 191, NULL, NULL, NULL, NULL),
('008D', 'Our Precious Sprouts: Islamic Regulations for Newborns', '10.99', '1-891229-54-0', NULL, 234, NULL, NULL, NULL, NULL);
# --------------------------------------------------------

#
# Table structure for table `customer_info`
#

DROP TABLE IF EXISTS `customer_info`;
CREATE TABLE `customer_info` (
  `custid` int(10) unsigned NOT NULL default '0',
  `address1` varchar(40) NOT NULL default '',
  `address2` varchar(40) default NULL,
  `city` varchar(20) NOT NULL default '',
  `state` varchar(20) default NULL,
  `zip` varchar(10) default NULL,
  `country` varchar(20) NOT NULL default '',
  `phone` varchar(20) default NULL,
  `fax` varchar(20) default NULL,
  PRIMARY KEY  (`custid`)
) TYPE=MyISAM;

#
# Dumping data for table `customer_info`
#

# --------------------------------------------------------

#
# Table structure for table `customers`
#

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `custid` int(10) unsigned NOT NULL auto_increment,
  `fname` varchar(40) NOT NULL default '',
  `lname` varchar(40) NOT NULL default '',
  `email` varchar(60) NOT NULL default '',
  PRIMARY KEY  (`custid`)
) TYPE=MyISAM;

#
# Dumping data for table `customers`
#

# --------------------------------------------------------

#
# Table structure for table `order_items`
#

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `orderid` int(10) unsigned NOT NULL default '0',
  `type` enum('book','tape') NOT NULL default 'book',
  `itemid` varchar(6) NOT NULL default '',
  `qty` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`orderid`,`type`,`itemid`)
) TYPE=MyISAM;

#
# Dumping data for table `order_items`
#

# --------------------------------------------------------

#
# Table structure for table `order_status`
#

DROP TABLE IF EXISTS `order_status`;
CREATE TABLE `order_status` (
  `orderid` int(10) unsigned NOT NULL default '0',
  `timestamp` timestamp(14) NOT NULL,
  `status` varchar(20) NOT NULL default '',
  `desc` tinytext,
  PRIMARY KEY  (`orderid`,`timestamp`)
) TYPE=MyISAM;

#
# Dumping data for table `order_status`
#

# --------------------------------------------------------

#
# Table structure for table `order_status_def`
#

DROP TABLE IF EXISTS `order_status_def`;
CREATE TABLE `order_status_def` (
  `status` varchar(20) NOT NULL default '',
  `desc` tinytext,
  PRIMARY KEY  (`status`)
) TYPE=MyISAM;

#
# Dumping data for table `order_status_def`
#

# --------------------------------------------------------

#
# Table structure for table `orders`
#

DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderid` int(10) unsigned NOT NULL auto_increment,
  `custid` int(10) unsigned NOT NULL default '0',
  `amount` double(6,2) NOT NULL default '0.00',
  `ship_fname` varchar(40) NOT NULL default '',
  `ship_lname` varchar(40) NOT NULL default '',
  `ship_address1` varchar(40) NOT NULL default '',
  `ship_address2` varchar(40) default NULL,
  `ship_city` varchar(20) NOT NULL default '',
  `ship_state` varchar(20) default NULL,
  `ship_zip` varchar(10) default NULL,
  `ship_country` varchar(20) NOT NULL default '',
  PRIMARY KEY  (`orderid`)
) TYPE=MyISAM;

#
# Dumping data for table `orders`
#

# --------------------------------------------------------

#
# Table structure for table `tape_albums`
#

DROP TABLE IF EXISTS `tape_albums`;
CREATE TABLE `tape_albums` (
  `tapeid` varchar(6) NOT NULL default '',
  `image` varchar(40) default NULL,
  PRIMARY KEY  (`tapeid`)
) TYPE=MyISAM;

#
# Dumping data for table `tape_albums`
#

INSERT INTO `tape_albums` (`tapeid`, `image`) VALUES ('AD001', 'manners_seeking_knowledge.gif'),
('AD006', 'building_community.gif'),
('AQ001', 'wasitiyyah.gif');
# --------------------------------------------------------

#
# Table structure for table `tape_authors`
#

DROP TABLE IF EXISTS `tape_authors`;
CREATE TABLE `tape_authors` (
  `tapeid` varchar(6) NOT NULL default '',
  `author` int(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tapeid`,`author`)
) TYPE=MyISAM;

#
# Dumping data for table `tape_authors`
#

# --------------------------------------------------------

#
# Table structure for table `tape_topic_def`
#

DROP TABLE IF EXISTS `tape_topic_def`;
CREATE TABLE `tape_topic_def` (
  `topic` varchar(40) NOT NULL default '',
  `desc` text NOT NULL,
  PRIMARY KEY  (`topic`)
) TYPE=MyISAM;

#
# Dumping data for table `tape_topic_def`
#

INSERT INTO `tape_topic_def` (`topic`, `desc`) VALUES ('Adab (Manners)', 'Description of adab.'),
('`Aqidah (Creed)', 'Description of Aqidah.'),
('Exhortations', 'Description of exhortations.');
# --------------------------------------------------------

#
# Table structure for table `tape_topics`
#

DROP TABLE IF EXISTS `tape_topics`;
CREATE TABLE `tape_topics` (
  `tapeid` varchar(6) NOT NULL default '',
  `topic` varchar(40) NOT NULL default '',
  PRIMARY KEY  (`tapeid`,`topic`)
) TYPE=MyISAM;

#
# Dumping data for table `tape_topics`
#

INSERT INTO `tape_topics` (`tapeid`, `topic`) VALUES ('AD001', 'Adab (Manners)'),
('AD002', 'Adab (Manners)'),
('AD003', 'Adab (Manners)'),
('AD004', 'Adab (Manners)'),
('AD005', 'Adab (Manners)'),
('AD006', 'Adab (Manners)'),
('AQ001', '`Aqidah (Creed)'),
('AQ002', '`Aqidah (Creed)'),
('AQ003', '`Aqidah (Creed)');
# --------------------------------------------------------

#
# Table structure for table `tapes`
#

DROP TABLE IF EXISTS `tapes`;
CREATE TABLE `tapes` (
  `tapeid` varchar(6) NOT NULL default '',
  `titleA` varchar(60) NOT NULL default '',
  `titleB` varchar(60) default NULL,
  `price` double(6,2) default NULL,
  `desc` text,
  `length` int(4) unsigned default NULL,
  `tape_count` tinyint(3) unsigned default NULL,
  PRIMARY KEY  (`tapeid`)
) TYPE=MyISAM;

#
# Dumping data for table `tapes`
#

INSERT INTO `tapes` (`tapeid`, `titleA`, `titleB`, `price`, `desc`, `length`, `tape_count`) VALUES ('AD001', 'Manners & Etiquettes of Seeking Knowledge', NULL, '10.00', NULL, NULL, 4),
('AD002', 'Importance of Knowledge & Adab of Seeking It', NULL, '2.00', NULL, NULL, 1),
('AD003', 'Achieving Good Character', NULL, '2.00', NULL, NULL, 1),
('AD004', 'Protect Yourselves & Families', NULL, '2.00', NULL, NULL, 1),
('AD005', 'The Islamic Solution to Family Problems', NULL, '2.00', NULL, NULL, 1),
('AD006', 'Building a Strong Community', NULL, '10.00', NULL, NULL, 4),
('AQ001', 'Explanation of "Al-`Aqidah al-Wasitiyyah"', NULL, '45.00', NULL, NULL, 32),
('AQ002', 'Signs of the Hour', NULL, '8.00', NULL, NULL, 4),
('AQ003', 'Destiny & Allah’s Will', NULL, '2.00', NULL, NULL, 1),
('AQ005', 'Tawhid vs. Shirk', NULL, '2.00', NULL, NULL, 1),
('AQ006', 'Importance of Faith for Muslims in the West', NULL, '2.00', NULL, NULL, 1),
('AQ007', 'Belief in Resurrection', NULL, '2.00', NULL, NULL, 1),
('AQ008', 'Resurrection & the Beginning of the Day of Judgment', NULL, '2.00', NULL, NULL, 1);

