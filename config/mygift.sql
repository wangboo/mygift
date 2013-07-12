/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : mygift

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2013-07-13 00:36:15
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '斯诺登半个多月来首次公开露面', '中新网7月12日电 据外媒报道，美国“棱镜”监控计划泄密者爱德华•斯诺登于莫斯科时间7月12日在莫斯科谢列梅捷沃机场与多家人权机构代表人士举行会谈。自6月23日至今，斯诺登已半个多月没有公开露面了。\r\n\r\n　　一名人权律师阿维拉(Renata Avila)说，联合国难民署高级人权专员、“人权观察”组织等将与斯诺登会面，联合国难民署高级人权专员有权限“协助”斯诺登的行程。\r\n\r\n　　据知，斯诺登稍早时向联合国在莫斯科的人权事务专员(难民署)及“人权观察”(Human Rights Watch)组织等国际上的人权组织等发出邀请，希望与相关人权活动人士以及知名律师会谈。根据这份邀请的内容，斯诺登希望每个人权组织最多派出三名代表，邀请写道：“我将非常感谢你们的合作和支持”。\r\n\r\n　　俄国际文传电讯社援引机场消息人士的话说，斯诺登打算借此机会表达对美国当局对他的系列“迫害”的态度，他认为，美当局的行为导致了拉丁美洲一些国家的国际航班乘客面临危险。\r\n\r\n　　“人权观察”组织驻莫斯科的代表娜塔莉亚•洛克申娜公布斯诺登发送的邮件信息说，斯诺登将就他所面临的情况、接下来的计划与人权组织代表和律师进行讨论。\r\n\r\n　　据称，斯诺登在写给人权组织的邮件中指出，美国当局致力于逮捕他，是对想要脱离迫害者基本权利的一种威胁。\r\n\r\n　　谢列梅捷沃机场有关负责人已对媒体证实，机场方面会为斯诺登的这次会面提供接入平台。\r\n\r\n　　斯诺登于6月初通过媒体披露了美国情报部门大规模搜集通信和电子通讯用户个人信息的“棱镜”项目，并于6月23日作为中转旅客从香港抵达莫斯科，滞留莫斯科谢列梅捷沃机场至今。委内瑞拉、尼加拉瓜拉美三国已表态称愿意为其提供庇护。美国方面则反复要求将斯诺登引渡回国审判。', '1', '2013-07-12 23:50:56', '中国新闻网', 'cat_0/1373635049_01r24P.jpg', null, null, '0', '1', '0');
INSERT INTO `news` VALUES ('2', '习近平在河北调研指导党的群众路线教育活动', '习近平在调研指导河北省党的群众路线教育实践活动时强调\r\n\r\n　　充分调动干部和群众积极性 保证教育实践活动善做善成\r\n\r\n　　新华网石家庄7月12日电 中共中央总书记、国家主席、中央军委主席习近平7月11日至12日在河北省调研指导党的群众路线教育实践活动。他强调，要坚持以邓小平理论、“三个代表”重要思想、科学发展观为指导，全面贯彻中央要求，扎实做好各项工作，充分调动领导干部和广大群众两个积极性，通过深入学习教育、广泛听取意见，推动深入查摆和解决作风上存在的突出问题，保证活动善始善终、善做善成。\r\n\r\n　　根据中央统一安排，中共中央政治局常委在第一批教育实践活动中分别联系一个省，进行具体指导，发挥示范带动作用，习近平联系河北省。11日至12日，习近平在河北省委书记周本顺、省长张庆伟陪同下，先后来到正定县、平山县西柏坡、石家庄市区，深入农村、机关，与各级干部和党员、群众座谈，实地调研指导河北省第一批教育实践活动。\r\n\r\n　　11日上午，习近平一下火车，就来到正定县正定镇塔元庄村，了解村里近年来的发展变化和村党支部、村委会开展工作的情况。他对塔元庄村坚持发展优秀青年农民入党和坚持选育“农村好青年”的做法表示肯定，希望他们加强以村党组织为核心的村级组织配套建设，全面提高村级服务水平。\r\n\r\n　　在村民解建勇家，习近平同一家三代围坐一起，详细询问家庭收入怎么样、孩子书读得怎么样、村里的公共服务好不好？他说，让农民群众不断过上好日子，是体现我们党的宗旨的一个重要方面，我们还要继续努力。在村里的综合超市，习近平看货架商品，问蔬菜价格，同前来购物的群众亲切交流。他指出，超市连接百姓生活，是农村服务业的一个发展趋势，要加强农村流通网络建设，为群众生活提供方便、快捷的服务。\r\n\r\n　　随后，习近平来到社区综合服务中心，看望镇村干部和村民。村民们敞开心扉，向总书记吐露心声。同大家热烈交谈后，习近平指出，做好基层基础工作十分重要，只要每个基层党组织和每个共产党员都有强烈的宗旨意识和责任意识，都能发挥战斗堡垒作用、先锋模范作用，我们党就会很有力量，我们国家就会很有力量，我们人民就会很有力量，党的执政基础就能坚如磐石。\r\n\r\n　　下午，习近平来到西柏坡，参观了西柏坡纪念馆、毛泽东旧居、中央军委作战室、七届二中全会旧址。在著名的九月会议旧址，习近平主持召开了座谈会。平山县县乡村干部、老党员和群众代表畅谈了他们对反对“四风”、树立良好作风的感想，总书记对他们的意见表示肯定。他表示，西柏坡我来过多次，每次都怀着崇敬之心来，带着许多思考走。对我们共产党人来说，中国革命历史是最好的营养剂。多重温我们党领导人民进行革命的伟大历史，心中就会增添很多正能量。习近平指出，毛泽东同志当年在西柏坡提出“两个务必”，包含着对我国几千年历史治乱规律的深刻借鉴，包含着对我们党艰苦卓绝奋斗历程的深刻总结，包含着对胜利了的政党永葆先进性和纯洁性、对即将诞生的人民政权实现长治久安的深刻忧思，包含着对我们党坚持全心全意为人民服务根本宗旨的深刻认识，思想意义和历史意义十分深远。全党同志要不断学习领会“两个务必”的深邃思想，始终做到谦虚谨慎、艰苦奋斗、实事求是、一心为民，继续把人民对我们党的“考试”、把我们党正在经受和将要经受各种考验的“考试”考好，使我们的党永远不变质、我们的红色江山永远不变色。\r\n\r\n　　河北省民政厅社会救助处、社会福利和社会事务处，是直接同群众打交道的窗口处室。12日上午，习近平来到这里，向工作人员了解机关开展教育实践活动和改进服务的情况。习近平在民政厅主持召开座谈会，听取省民政厅、省监察厅、省环保厅、省社科院、河北科技大学、开滦(集团)有限责任公司、以岭药业股份有限公司等单位负责人的意见。他一边听一边同大家讨论，就一些问题深入探讨。\r\n\r\n　　听取大家发言后，习近平指出，调动领导干部和广大群众两个积极性、打牢学习教育和查摆问题两个基础、抓住整改落实和建章立制两个关键，对教育实践活动取得实效至关重要。领导干部要让群众看到自己敢于正视并解决问题的决心，看到自己拜群众为师、向群众求教的襟怀，看到自己以身作则、发挥示范带头作用的行动。同时，要激发广大群众关心党的形象、关心党的事业、关心领导干部健康成长的责任感，引导群众履行监督责任，多提意见建议，真心帮助领导干部改进提高。对查摆出来的问题，要深刻分析原因，明确整改方向，制定整改措施，规定整改时限，一个一个加以解决。党员、干部改什么、怎么改、改得怎么样，要让群众看清楚，接受群众监督。\r\n\r\n　　调研指导期间，习近平听取了河北省级领导班子开展教育实践活动和中央督导组开展督导工作的情况汇报。他强调，开展好教育实践活动，要着力增强思想自觉和行动自觉，引导广大党员、干部提高贯彻执行党的群众路线的自觉性和坚定性，做到以“知”促“行”、以“行”促“知”、知行合一；着力贯彻和体现整风精神，把批评和自我批评摆在重要位置，把开门搞活动作为重要方法，把严格执行纪律作为重要措施；着力解决突出问题，坚持标本兼治，既认真解决“四风”方面的问题，又注重通过强化理想信念、规范工作程序、完善体制机制抑制不正之风；着力保证活动健康发展，切实做到不虚、不空、不偏。\r\n\r\n　　习近平要求河北省级领导班子成员把示范带头作用体现到活动全过程，要求中央督导组深入开展工作，认真履行职责。他强调，省级班子成员是这次教育实践活动的组织者、推进者、监督者，更是参与者。大家要结合活动加强思想政治建设，用严格的尺子衡量自己，用很高的标准要求自己，用无私无畏的勇气对照、检查、改进、提高自己，牢固树立政治意识、大局意识、责任意识，自觉在大局下想问题、做工作。\r\n\r\n　　习近平对河北各项工作取得的成绩表示肯定，强调开展教育实践活动的目的就是要使全党同志特别是各级领导干部用好的作风做好工作。他希望河北省委统筹兼顾、合理安排，做到两手抓、两促进，切实抓好当前各项工作，特别是要大力提高发展质量和效益、大力保障和改善民生、大力推进生态环境保护，推动党的十八大精神全面贯彻落实。\r\n\r\n　　调研期间，习近平还专门分别召开河北省和石家庄市部分离退休老同志、正定县领导班子主要成员和退休干部座谈会，听取他们对教育实践活动的意见和建议。\r\n\r\n　　王沪宁、赵乐际、栗战书等陪同调研。\r\n\r\n(原标题：习近平在河北省调研指导党的群众路线教育实践活动)', '1', '2013-07-13 00:09:08', '新华网', '', 'cat_0/b219ebc4b74543a9bf640ec21e178a82b9011444.jpg', null, '1', '0', '0');

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
  `index` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of users
-- ----------------------------
