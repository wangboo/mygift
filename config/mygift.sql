/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : mygift

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-07-14 23:05:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `advs`
-- ----------------------------
DROP TABLE IF EXISTS `advs`;
CREATE TABLE `advs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(256) COLLATE utf8_bin NOT NULL,
  `title` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of advs
-- ----------------------------
INSERT INTO `advs` VALUES ('1', 'http://192.168.0.10:9090/adv/2055994_233734077785_2.jpg', null);

-- ----------------------------
-- Table structure for `cats`
-- ----------------------------
DROP TABLE IF EXISTS `cats`;
CREATE TABLE `cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cats
-- ----------------------------
INSERT INTO `cats` VALUES ('1', '实事');
INSERT INTO `cats` VALUES ('2', '娱乐');
INSERT INTO `cats` VALUES ('3', '体育');
INSERT INTO `cats` VALUES ('4', '校园');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) COLLATE utf8_bin NOT NULL,
  `content` varchar(10240) COLLATE utf8_bin DEFAULT NULL,
  `cat_id` int(11) NOT NULL COMMENT '新闻种类id',
  `publish_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `come_from` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `big_icon` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `small_icon` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `abstract` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT '摘要',
  `is_push` int(11) NOT NULL DEFAULT '1',
  `is_head` int(11) NOT NULL DEFAULT '1',
  `news_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '斯诺登半个多月来首次公开露面', '中新网7月12日电 据外媒报道，美国“棱镜”监控计划泄密者爱德华•斯诺登于莫斯科时间7月12日在莫斯科谢列梅捷沃机场与多家人权机构代表人士举行会谈。自6月23日至今，斯诺登已半个多月没有公开露面了。\r\n\r\n　　一名人权律师阿维拉(Renata Avila)说，联合国难民署高级人权专员、“人权观察”组织等将与斯诺登会面，联合国难民署高级人权专员有权限“协助”斯诺登的行程。\r\n\r\n　　据知，斯诺登稍早时向联合国在莫斯科的人权事务专员(难民署)及“人权观察”(Human Rights Watch)组织等国际上的人权组织等发出邀请，希望与相关人权活动人士以及知名律师会谈。根据这份邀请的内容，斯诺登希望每个人权组织最多派出三名代表，邀请写道：“我将非常感谢你们的合作和支持”。\r\n\r\n　　俄国际文传电讯社援引机场消息人士的话说，斯诺登打算借此机会表达对美国当局对他的系列“迫害”的态度，他认为，美当局的行为导致了拉丁美洲一些国家的国际航班乘客面临危险。\r\n\r\n　　“人权观察”组织驻莫斯科的代表娜塔莉亚•洛克申娜公布斯诺登发送的邮件信息说，斯诺登将就他所面临的情况、接下来的计划与人权组织代表和律师进行讨论。\r\n\r\n　　据称，斯诺登在写给人权组织的邮件中指出，美国当局致力于逮捕他，是对想要脱离迫害者基本权利的一种威胁。\r\n\r\n　　谢列梅捷沃机场有关负责人已对媒体证实，机场方面会为斯诺登的这次会面提供接入平台。\r\n\r\n　　斯诺登于6月初通过媒体披露了美国情报部门大规模搜集通信和电子通讯用户个人信息的“棱镜”项目，并于6月23日作为中转旅客从香港抵达莫斯科，滞留莫斯科谢列梅捷沃机场至今。委内瑞拉、尼加拉瓜拉美三国已表态称愿意为其提供庇护。美国方面则反复要求将斯诺登引渡回国审判。', '1', '2013-07-14 21:33:14', '中国新闻网', 'http://192.168.0.10:9090/cat_1/1373635049_01r24P.jpg', null, null, '0', '1', '0');
INSERT INTO `news` VALUES ('2', '习近平在河北', '习近平在调研指导河北省党的群众路线教育实践活动时强调', '1', '2013-07-14 21:52:00', '新华网', '', 'http://192.168.0.10:9090/cat_1/b219ebc4b74543a9bf640ec21e178a82b9011444.jpg', '习近平在河北调研指导党的群众路线教育活动', '1', '0', '0');
INSERT INTO `news` VALUES ('3', '西双版纳又出事', '云南网讯（记者 杨之辉）记者从西双版纳州政府新闻办获悉，7月14日12时41分，云KT0396旅游车在勐景路13.25公里发生交通事故。据了解事故发生时，该车共有27名司乘人员，伤亡人数正在核实中。\r\n\r\n事故发生后，西双版纳州迅速启动应急预案，州市有关部门第一时间到达事故现场，组织指挥救援，并根据现场情况成立了抢险救援组，医序救护组，善后安置组，所有医院开通绿色通道，所有医生到岗到位参与救援。\r\n\r\n截至记者发稿时，事故处置正有序开展中。', '1', '2013-07-14 22:09:58', '云南网', null, 'http://192.168.0.10:9090/cat_1/001cc435640b12ad22e301.jpg', '西双版纳一载27人旅游车发生交通事故 伤亡人数正在核实中', '1', '0', '0');
INSERT INTO `news` VALUES ('4', '日本4名内阁大臣向靖国神社甲级战犯供奉灯笼', '据日本共同社13日报道，日本法务大臣谷垣祯一等4名内阁大臣当天向供奉着14名二战甲级战犯牌位的靖国神社供奉灯笼。\r\n\r\n报道说，向靖国神社供奉灯笼的内阁大臣是法务大臣谷垣祯一、农林水产大臣林芳正、复兴担当大臣根本匠和行政改革兼公务员改革担当大臣稻田朋美。谷垣祯一、林芳正和稻田朋美分别在灯笼上写的头衔是“京都府遗族会”、“参议院议员”和“传统与创造会众议院议员”，根本匠没有在灯笼上写上头衔。\r\n\r\n靖国神社每年7月13日至16日举行“御灵祭”，一些日本政客和阵亡者遗属会向靖国神社供奉灯笼。\r\n\r\n今年4月，日本副首相兼财务大臣麻生太郎等4名内阁成员参拜靖国神社，日本首相安倍晋三以“内阁总理大臣”名义向靖国神社供奉名为“真榊”的祭品。此外，由日本跨党派国会议员组成的“大家都来参拜靖国神社国会议员之会”168名成员集体参拜了靖国神社。\r\n\r\n靖国神社位于东京千代田区，供奉有包括东条英机在内的14名第二次世界大战甲级战犯的牌位。长期以来，日本部分政客、国会议员坚持参拜靖国神社，严重伤害中国、韩国等亚洲国家人民的感情。（吴谷丰）', '1', '2013-07-14 22:20:26', '新华网', null, null, '日本4名内阁大臣向靖国神社甲级战犯供奉灯笼', '1', '0', '0');

-- ----------------------------
-- Table structure for `news_types`
-- ----------------------------
DROP TABLE IF EXISTS `news_types`;
CREATE TABLE `news_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of news_types
-- ----------------------------

-- ----------------------------
-- Table structure for `notes`
-- ----------------------------
DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `is_visitor` int(11) NOT NULL,
  `user` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `content` varchar(10240) COLLATE utf8_bin DEFAULT NULL,
  `news_id` int(11) NOT NULL,
  `pre_note_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of notes
-- ----------------------------

-- ----------------------------
-- Table structure for `photos`
-- ----------------------------
DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of photos
-- ----------------------------

-- ----------------------------
-- Table structure for `tests`
-- ----------------------------
DROP TABLE IF EXISTS `tests`;
CREATE TABLE `tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_guest` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tests
-- ----------------------------
INSERT INTO `tests` VALUES ('1', '1');
INSERT INTO `tests` VALUES ('2', '0');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of users
-- ----------------------------
