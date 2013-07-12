/*
MySQL Data Transfer
Source Host: localhost
Source Database: mygift
Target Host: localhost
Target Database: mygift
Date: 2013-7-12 16:40:31
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for cats
-- ----------------------------
CREATE TABLE `cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for news
-- ----------------------------
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) COLLATE utf8_bin NOT NULL,
  `content` varchar(10240) COLLATE utf8_bin DEFAULT NULL,
  `catId` int(11) NOT NULL COMMENT '新闻种类id',
  `publishTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `comefrom` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `bigIcon` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `smallIcon` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `abs` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '摘要',
  `is_push` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for notes
-- ----------------------------
CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_visitor` int(11) NOT NULL,
  `user` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `content` varchar(10240) COLLATE utf8_bin DEFAULT NULL,
  `news_id` int(11) NOT NULL,
  `pre_note_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for photos
-- ----------------------------
CREATE TABLE `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) DEFAULT NULL,
  `index` int(11) NOT NULL,
  `icon` varchar(255) COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for tests
-- ----------------------------
CREATE TABLE `tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_guest` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for users
-- ----------------------------
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pwd` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `birthday` timestamp NULL DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_bin NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `level` int(11) NOT NULL DEFAULT '1',
  `nickname` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `pushed_id` int(11) NOT NULL DEFAULT '0',
  `is_guest` int(11) NOT NULL DEFAULT '1',
  `is_push` int(11) NOT NULL DEFAULT '1',
  `is_online` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `cats` VALUES ('1', '实事');
INSERT INTO `cats` VALUES ('2', '娱乐');
INSERT INTO `cats` VALUES ('3', '体育');
INSERT INTO `cats` VALUES ('4', '校园');
INSERT INTO `tests` VALUES ('1', '1');
INSERT INTO `tests` VALUES ('2', '0');
