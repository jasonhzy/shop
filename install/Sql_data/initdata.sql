-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2014 年 07 月 11 日 11:58
-- 服务器版本: 5.5.20
-- PHP 版本: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `aixiang1`
--

-- --------------------------------------------------------

--
-- 表的结构 `weixin_ad`
--

CREATE TABLE IF NOT EXISTS `weixin_ad` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `board_id` smallint(5) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `extimg` varchar(255) NOT NULL,
  `extval` varchar(200) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `start_time` int(10) NOT NULL,
  `end_time` int(10) NOT NULL,
  `clicks` int(10) NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL DEFAULT '0',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- 转存表中的数据 `weixin_ad`
--

INSERT INTO `weixin_ad` (`id`, `board_id`, `type`, `name`, `url`, `content`, `extimg`, `extval`, `desc`, `start_time`, `end_time`, `clicks`, `add_time`, `ordid`, `status`) VALUES
(29, 1, 'image', '杜蕾斯 避孕套 活力装安全套', 'http://www.69986.cn/index.php?m=item&a=index&id=143', '1403/20/532afc0435882.jpg', '', '', '', 1395244800, 1396108800, 0, 0, 255, 0),
(32, 1, 'image', '买牛奶就到优客来', 'http://www.69986.cn/index.php?m=item&a=index&id=206', '1405/31/53894bd84a743.jpg', '', '', '', 1401465600, 1433001600, 0, 0, 255, 1);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_adboard`
--

CREATE TABLE IF NOT EXISTS `weixin_adboard` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `tpl` varchar(20) NOT NULL,
  `width` smallint(5) NOT NULL,
  `height` smallint(5) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `weixin_adboard`
--

INSERT INTO `weixin_adboard` (`id`, `name`, `tpl`, `width`, `height`, `description`, `status`) VALUES
(1, '首页焦点图', 'indexfocus', 730, 395, '小图调用扩展图', 1);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_address`
--

CREATE TABLE IF NOT EXISTS `weixin_address` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `contacts` varchar(100) DEFAULT '联系人',
  `Province` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Area` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `postcode` varchar(30) DEFAULT NULL COMMENT '邮编',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机号码',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话号码',
  `name` varchar(50) NOT NULL COMMENT '公司名称',
  `isno` varchar(10) DEFAULT '0' COMMENT '0:否 1:是',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- 转存表中的数据 `weixin_address`
--

INSERT INTO `weixin_address` (`id`, `contacts`, `Province`, `City`, `Area`, `address`, `postcode`, `mobile`, `phone`, `name`, `isno`, `status`, `ordid`) VALUES
(23, '江安优客来', NULL, NULL, NULL, '江安优客来送货仓库', '', '', '', '', '1', 1, 0),
(4, '周建群', '福建省', '厦门市', '思明区', '金沙花园1', '362246', '15880765056', '15655', '乐谷', '0', 1, 0),
(22, 'leebay', '山西省', '阳泉市', '城区', '西安市雁塔西路纬二街世纪经典大厦B座1608', '710076', '862985263216', '862985263216', '百容捷科技', '1', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_admin`
--

CREATE TABLE IF NOT EXISTS `weixin_admin` (
  `id` mediumint(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `role_id` smallint(5) NOT NULL,
  `last_ip` varchar(15) NOT NULL,
  `last_time` int(10) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `weixin_admin`
--

INSERT INTO `weixin_admin` (`id`, `username`, `password`, `role_id`, `last_ip`, `last_time`, `email`, `status`) VALUES
(4, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, '', 0, '364620882@qq.com', 1);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_admin_auth`
--

CREATE TABLE IF NOT EXISTS `weixin_admin_auth` (
  `role_id` tinyint(3) NOT NULL,
  `menu_id` smallint(6) NOT NULL,
  KEY `role_id` (`role_id`,`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `weixin_admin_auth`
--

INSERT INTO `weixin_admin_auth` (`role_id`, `menu_id`) VALUES
(1, 1),
(1, 1),
(1, 2),
(1, 2),
(1, 3),
(1, 3),
(1, 4),
(1, 4),
(1, 6),
(1, 6),
(1, 7),
(1, 7),
(1, 8),
(1, 8),
(1, 9),
(1, 9),
(1, 10),
(1, 10),
(1, 11),
(1, 11),
(1, 12),
(1, 12),
(1, 13),
(1, 13),
(1, 14),
(1, 14),
(1, 15),
(1, 15),
(1, 16),
(1, 16),
(1, 17),
(1, 17),
(1, 18),
(1, 18),
(1, 19),
(1, 19),
(1, 20),
(1, 20),
(1, 21),
(1, 21),
(1, 22),
(1, 22),
(1, 23),
(1, 23),
(1, 24),
(1, 24),
(1, 25),
(1, 25),
(1, 26),
(1, 26),
(1, 27),
(1, 27),
(1, 28),
(1, 28),
(1, 29),
(1, 29),
(1, 31),
(1, 31),
(1, 32),
(1, 32),
(1, 33),
(1, 33),
(1, 34),
(1, 34),
(1, 36),
(1, 36),
(1, 37),
(1, 37),
(1, 38),
(1, 38),
(1, 50),
(1, 50),
(1, 51),
(1, 51),
(1, 52),
(1, 52),
(1, 54),
(1, 54),
(1, 56),
(1, 56),
(1, 57),
(1, 57),
(1, 58),
(1, 58),
(1, 59),
(1, 59),
(1, 60),
(1, 60),
(1, 61),
(1, 61),
(1, 62),
(1, 62),
(1, 63),
(1, 63),
(1, 64),
(1, 64),
(1, 65),
(1, 65),
(1, 66),
(1, 66),
(1, 70),
(1, 70),
(1, 117),
(1, 117),
(1, 118),
(1, 118),
(1, 119),
(1, 119),
(1, 148),
(1, 148),
(1, 149),
(1, 149),
(1, 150),
(1, 150),
(1, 151),
(1, 151),
(1, 152),
(1, 152),
(1, 153),
(1, 153),
(1, 154),
(1, 154),
(1, 155),
(1, 155),
(1, 156),
(1, 156),
(1, 157),
(1, 157),
(1, 158),
(1, 158),
(1, 159),
(1, 159),
(1, 160),
(1, 160),
(1, 161),
(1, 161),
(1, 162),
(1, 162),
(1, 164),
(1, 164),
(1, 172),
(1, 172),
(1, 173),
(1, 173),
(1, 174),
(1, 174),
(1, 175),
(1, 175),
(1, 176),
(1, 176),
(1, 177),
(1, 177),
(1, 178),
(1, 178),
(1, 179),
(1, 179),
(1, 180),
(1, 180),
(1, 181),
(1, 181),
(1, 182),
(1, 182),
(1, 184),
(1, 184),
(1, 185),
(1, 185),
(1, 186),
(1, 186),
(1, 187),
(1, 187),
(1, 190),
(1, 190),
(1, 192),
(1, 192),
(1, 195),
(1, 195),
(1, 199),
(1, 199),
(1, 200),
(1, 200),
(1, 201),
(1, 201),
(1, 202),
(1, 202),
(1, 203),
(1, 203),
(1, 210),
(1, 210),
(1, 212),
(1, 212),
(1, 213),
(1, 213),
(1, 214),
(1, 214),
(1, 215),
(1, 215),
(1, 216),
(1, 216),
(1, 232),
(1, 232),
(1, 233),
(1, 233),
(1, 234),
(1, 234),
(1, 235),
(1, 235),
(1, 236),
(1, 236),
(1, 237),
(1, 237),
(1, 238),
(1, 238),
(1, 240),
(1, 240),
(1, 242),
(1, 242),
(1, 244),
(1, 244),
(1, 245),
(1, 245),
(1, 246),
(1, 246),
(1, 247),
(1, 247),
(1, 248),
(1, 248),
(1, 249),
(1, 249),
(1, 250),
(1, 250),
(1, 252),
(1, 252),
(1, 253),
(1, 253),
(1, 254),
(1, 254),
(1, 255),
(1, 255),
(1, 256),
(1, 256),
(1, 257),
(1, 257),
(1, 258),
(1, 258),
(1, 259),
(1, 259),
(1, 260),
(1, 260),
(1, 261),
(1, 261),
(1, 262),
(1, 262),
(1, 263),
(1, 263),
(1, 264),
(1, 264),
(1, 265),
(1, 265),
(1, 267),
(1, 267),
(1, 268),
(1, 268),
(1, 269),
(1, 269),
(1, 270),
(1, 270),
(1, 271),
(1, 271),
(1, 272),
(1, 272),
(1, 273),
(1, 273),
(1, 274),
(1, 274),
(1, 275),
(1, 275),
(1, 276),
(1, 276),
(1, 277),
(1, 277),
(1, 278),
(1, 278),
(1, 279),
(1, 279),
(1, 280),
(1, 280),
(1, 281),
(1, 281),
(1, 282),
(1, 282),
(1, 283),
(1, 283),
(1, 284),
(1, 284),
(1, 285),
(1, 285),
(1, 286),
(1, 286),
(1, 291),
(1, 291),
(1, 292),
(1, 292),
(1, 293),
(1, 293),
(1, 294),
(1, 294),
(1, 295),
(1, 295),
(1, 296),
(1, 296),
(1, 297),
(1, 297),
(1, 298),
(1, 298),
(1, 299),
(1, 299),
(1, 300),
(1, 300),
(1, 301),
(1, 301),
(1, 302),
(1, 302),
(1, 303),
(1, 303),
(1, 304),
(1, 304),
(1, 305),
(1, 305),
(1, 306),
(1, 306),
(1, 307),
(1, 307),
(1, 308),
(1, 308),
(1, 309),
(1, 309),
(1, 310),
(1, 310),
(4, 50),
(4, 50),
(4, 295),
(4, 295),
(4, 296),
(4, 296),
(4, 297),
(4, 297),
(4, 298),
(4, 298),
(4, 304),
(4, 304),
(4, 310),
(4, 310),
(5, 50),
(5, 50),
(5, 295),
(5, 295),
(5, 296),
(5, 296),
(5, 297),
(5, 297),
(5, 298),
(5, 298),
(5, 304),
(5, 304),
(5, 310),
(5, 310);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_admin_role`
--

CREATE TABLE IF NOT EXISTS `weixin_admin_role` (
  `id` tinyint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `remark` text NOT NULL,
  `ordid` tinyint(3) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `weixin_admin_role`
--

INSERT INTO `weixin_admin_role` (`id`, `name`, `remark`, `ordid`, `status`) VALUES
(1, '超级管理员', '超级管理员', 0, 1),
(4, '测试管理员', '测试', 0, 1),
(5, '员工', '员工', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_album`
--

CREATE TABLE IF NOT EXISTS `weixin_album` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `cover_cache` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `likes` int(10) NOT NULL,
  `items` int(10) unsigned NOT NULL DEFAULT '0',
  `follows` int(10) unsigned NOT NULL DEFAULT '0',
  `is_index` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `weixin_album`
--

INSERT INTO `weixin_album` (`id`, `cate_id`, `uid`, `uname`, `title`, `intro`, `banner`, `cover_cache`, `status`, `ordid`, `likes`, `items`, `follows`, `is_index`, `add_time`) VALUES
(1, 1, 14, '泡芙小米粒', '【大自然的小精灵。】', '', '', 'a:5:{i:0;a:2:{s:3:"img";s:96:"http://img01.taobaocdn.com/bao/uploaded/i1/15957022531960761/T1lBuqXB4fXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:90:"韩版新款夏装中长款带帽长袖透明防晒衣空调衫防晒衫披肩开衫外套";}i:1;a:2:{s:3:"img";s:72:"http://img03.taobaocdn.com/bao/uploaded/i3/T197PPXgVoXXcy8OM._112623.jpg";s:5:"intro";s:79:"淘金币 【远步正品】 2012新款 星旗条纹男女帆布鞋情侣鞋子";}i:2;a:2:{s:3:"img";s:72:"http://img04.taobaocdn.com/bao/uploaded/i4/T1wBy7XflaXXX6UvwV_020442.jpg";s:5:"intro";s:86:"MIYI新款鳄鱼纹翻盖潮手包牛皮女包单肩包复古包小包包 清仓包邮";}i:3;a:2:{s:3:"img";s:72:"http://img04.taobaocdn.com/bao/uploaded/i4/T1qdnCXlBhXXbCT873_051140.jpg";s:5:"intro";s:82:"浪漫一身 2012秋装新款 通勤OL开衫V领长袖 纯色百搭时尚小外套";}i:4;a:2:{s:3:"img";s:72:"http://img02.taobaocdn.com/bao/uploaded/i2/T1h4F7XbdAXXce_eEZ_032143.jpg";s:5:"intro";s:79:"浪漫一身 2012秋装新款 专柜正品 亮色带帽长袖休闲格子外套";}}', 1, 255, 0, 6, 0, 0, 1353896347),
(2, 1, 10, '设计系小女生', '甜美商品惹人爱♡', '', '', 'a:5:{i:0;a:2:{s:3:"img";s:96:"http://img02.taobaocdn.com/bao/uploaded/i2/12023026773167605/T14VXuFiNgXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:81:"2013夏装新款 韩版大码修身 圆领雪纺袖印花 纯棉短袖女T恤 夏";}i:1;a:2:{s:3:"img";s:93:"http://image.taobao.com/bao/uploaded/i4/19292023009681721/T1pgyHXEJfXXXXXXXX_!!2-item_pic.png";s:5:"intro";s:87:"2013夏装新款韩版女装 时尚修身百搭体恤圆领印花纯棉女士T恤短袖";}i:2;a:2:{s:3:"img";s:96:"http://img04.taobaocdn.com/bao/uploaded/i4/13411024173381739/T1IppqFbNXXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:85:"奕生缘2013新款 高档纯棉V领纯色修身白色韩版t恤短袖女夏装大码";}i:3;a:2:{s:3:"img";s:72:"http://img03.taobaocdn.com/bao/uploaded/i3/T1hG1IXelfXXcX4o.9_105150.jpg";s:5:"intro";s:64:"【远步正品】  2011冬季时尚女士平底雪地靴 棉鞋";}i:4;a:2:{s:3:"img";s:72:"http://img01.taobaocdn.com/bao/uploaded/i1/T1tWOuXmFTXXXbvKDb_093608.jpg";s:5:"intro";s:84:"MIYI 2012秋冬新款头层牛皮手提包单肩包水桶真皮女包通勤包包邮";}}', 1, 255, 0, 7, 0, 0, 1353896347),
(3, 2, 19, '安土桃山', '一个人的世界', '', '', 'a:4:{i:0;a:2:{s:3:"img";s:96:"http://img04.taobaocdn.com/bao/uploaded/i4/18075021709325472/T1L8N.XudgXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:88:"都衣舞尔情侣装短袖撞色拼接夏装新款韩国男女大码T恤沙滩情侣衫";}i:1;a:2:{s:3:"img";s:96:"http://img01.taobaocdn.com/bao/uploaded/i1/12816023555462640/T18JONXApeXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:83:"印迪洋时2013夏季新品女装韩版修身大码圆点印花连帽短袖T恤女";}i:2;a:2:{s:3:"img";s:72:"http://img01.taobaocdn.com/bao/uploaded/i1/T1RKfEXkxkXXc.bh3U_014824.jpg";s:5:"intro";s:77:"【远步正品】 加厚松高鞋休闲棉帆布鞋 韩版厚底帆松糕鞋";}i:3;a:2:{s:3:"img";s:72:"http://img01.taobaocdn.com/bao/uploaded/i1/T1FGLNXmJbXXbjSLvb_093718.jpg";s:5:"intro";s:85:"浪漫一身 2012秋装新款 专柜正品 休闲长袖薄外套修身立领棒球衫";}}', 1, 255, 0, 4, 0, 0, 1353896347),
(4, 1, 8, '枕水而眠', '❀色彩_谁是那个人', '', '', 'a:5:{i:0;a:2:{s:3:"img";s:25:"1307/18/51e7ad7789d26.jpg";s:5:"intro";s:6:"测试";}i:1;a:2:{s:3:"img";s:96:"http://img04.taobaocdn.com/bao/uploaded/i4/15843024126370724/T1Fq9QXstiXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:84:"短袖女t恤2013夏装韩版新款小清新女装宽松甜美上衣女生白色t桖";}i:2;a:2:{s:3:"img";s:96:"http://img01.taobaocdn.com/bao/uploaded/i1/19526021830466963/T1KW5dXxlcXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:87:"2013新款女装夏装韩版短袖时尚休闲运动套装加大码胖mm套装运动服";}i:3;a:2:{s:3:"img";s:72:"http://img04.taobaocdn.com/bao/uploaded/i4/T1ac2vXcRvXXXE1hsU_014747.jpg";s:5:"intro";s:84:"【远步正品】2012秋冬新款 英伦印花松糕厚底高帮鞋 松糕鞋女款";}i:4;a:2:{s:3:"img";s:72:"http://img02.taobaocdn.com/bao/uploaded/i2/T1x7C0XhxqXXbW6xwT_012127.jpg";s:5:"intro";s:79:"特卖款2012秋冬新款榴莲家 风衣帅气外套 带帽风衣外套LLS1009";}}', 1, 255, 0, 10, 0, 0, 1353896347),
(5, 1, 18, '晨雪熙', '一颗心的距离', '', '', 'a:5:{i:0;a:2:{s:3:"img";s:96:"http://img03.taobaocdn.com/bao/uploaded/i3/19490024699170259/T1QmRxFX8aXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:85:"Simier斯米尔流行男鞋潮鞋夏季透气低帮鞋男休闲鞋男英伦板鞋1039";}i:1;a:2:{s:3:"img";s:96:"http://img04.taobaocdn.com/bao/uploaded/i4/15721024181492800/T1wMS5Xy4cXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:87:"哥弟专柜正品2013新款夏装新品大码女装短袖T恤 女式韩版修身上衣";}i:2;a:2:{s:3:"img";s:96:"http://img04.taobaocdn.com/bao/uploaded/i4/10114024878170152/T162pAFoBcXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:87:"年中大促天猫 夏装 韩版名族风时尚修身大码绣花女装棉短袖t恤女";}i:3;a:2:{s:3:"img";s:96:"http://img01.taobaocdn.com/bao/uploaded/i1/13331035721128449/T1bG5JXB8iXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:83:"欧罗兰2013夏季新款女装韩版宽松圆领大码纯棉短袖中长款t恤女";}i:4;a:2:{s:3:"img";s:96:"http://img02.taobaocdn.com/bao/uploaded/i2/18118024057573261/T1zhO3XDhbXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:84:"公子一派 2013新款男士V领短袖T恤品质男装纯棉男士T恤修身男T恤";}}', 1, 255, 0, 12, 0, 1, 1353896348),
(6, 1, 6, '起个名字太累', '总有一个角落，卸下你的包袱', '', '', 'a:5:{i:0;a:2:{s:3:"img";s:96:"http://img03.taobaocdn.com/bao/uploaded/i3/18997020551833232/T1DaRKXCReXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:86:"2013夏装女装韩国代购潮现货7分泡泡袖胖MM大码长款宽松女t恤短袖";}i:1;a:2:{s:3:"img";s:96:"http://img03.taobaocdn.com/bao/uploaded/i3/17241035052144126/T1ANX.Xz4iXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:81:"新品2013胖mm显瘦款莫代尔蝙蝠衫宽松韩版短袖夏装 女 大码T恤";}i:2;a:2:{s:3:"img";s:72:"http://img02.taobaocdn.com/bao/uploaded/i2/T1_tHLXn4fXXXLjDMT_013219.jpg";s:5:"intro";s:72:"【远步正品】2012秋冬季印花高帮帆布鞋 韩版 学生女鞋";}i:3;a:2:{s:3:"img";s:72:"http://img01.taobaocdn.com/bao/uploaded/i1/T1wnqyXXNfXXa2j1I0_034801.jpg";s:5:"intro";s:73:"【远步正品】 越狱米勒系列厚底帆布鞋松糕鞋 欧美ca276";}i:4;a:2:{s:3:"img";s:72:"http://img04.taobaocdn.com/bao/uploaded/i4/T1ZArWXkllXXX.ujTX_085705.jpg";s:5:"intro";s:85:"远步正品 韩版潮 厚底松糕高帮帆布鞋子 学生休闲鞋 女式帆布鞋";}}', 1, 255, 0, 9, 0, 1, 1353896348),
(7, 1, 20, '熊小熊zz', '放慢脚步，细细地品味生活', '', '', 'a:5:{i:0;a:2:{s:3:"img";s:96:"http://img04.taobaocdn.com/bao/uploaded/i4/19109019960887092/T1cFFxXsVfXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:89:"休闲套装夏季韩版时尚女 短袖运动服运动套装夏装 大码女装卫衣装";}i:1;a:2:{s:3:"img";s:96:"http://img01.taobaocdn.com/bao/uploaded/i1/14456024842364836/T13LJuFkBfXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:86:"t恤男短袖韩版2013新款夏装男装潮牌正品代购美国男士短袖af男t恤";}i:2;a:2:{s:3:"img";s:72:"http://img02.taobaocdn.com/bao/uploaded/i2/T1Ag54XbtuXXXfz.I5_060343.jpg";s:5:"intro";s:84:"榴莲家2012秋季女装 韩版波点翻袖小西装外套 修身休闲西装 20072";}i:3;a:2:{s:3:"img";s:72:"http://img04.taobaocdn.com/bao/uploaded/i4/T1.Ly7XmhmXXcoBArb_124637.jpg";s:5:"intro";s:85:"MIYI休闲糖果色邮差包韩版撞色单肩斜挎包磨砂牛皮复古包包女包";}i:4;a:2:{s:3:"img";s:72:"http://img01.taobaocdn.com/bao/uploaded/i1/T1xtK1XnlkXXaGp4E6_062100.jpg";s:5:"intro";s:86:"MIYI单肩小包2012新款潮时尚韩版休闲牛皮欧美红色新娘手拿女包包";}}', 1, 255, 0, 8, 0, 1, 1353896348),
(8, 1, 17, 'V小莲小莲V', '美好时光', '', '', 'a:5:{i:0;a:2:{s:3:"img";s:96:"http://img03.taobaocdn.com/bao/uploaded/i3/10519034815428119/T1GVSyXDFaXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:86:"2013夏装新款情侣装两件套女裙韩国版新品时尚撞色拼接男短袖T恤";}i:1;a:2:{s:3:"img";s:96:"http://img04.taobaocdn.com/bao/uploaded/i4/12239024730307672/T14HWxXqpbXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:85:"包邮2013男T女裙女t女恤短袖情侣装夏装长款打底衫女韩版情侣T恤";}i:2;a:2:{s:3:"img";s:96:"http://img04.taobaocdn.com/bao/uploaded/i4/13434022985138156/T1Lz1zXtXXXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:83:"夏装新款2013大码女装 胖mm夏装韩版修身显瘦打底衫宽松短袖t恤";}i:3;a:2:{s:3:"img";s:96:"http://img01.taobaocdn.com/bao/uploaded/i1/11867023623831451/T14UeRXDdXXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:82:"2013夏装韩版女款新款大码上衣网纱打底衫纯色短袖t恤短袖26320";}i:4;a:2:{s:3:"img";s:96:"http://img04.taobaocdn.com/bao/uploaded/i4/17601022601388672/T1niWsXDpfXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:86:"依嬅莎 2013新款夏装韩版女装专柜正品女士T恤显瘦条纹短袖t恤 女";}}', 1, 255, 0, 12, 0, 0, 1353896349),
(9, 1, 12, '跳房子123', '❤ Home❥小小的空间', '', '', 'a:4:{i:0;a:2:{s:3:"img";s:72:"http://img02.taobaocdn.com/bao/uploaded/i2/T1RR2RXkNcXXceltU7_063938.jpg";s:5:"intro";s:60:"【远步正品】男女款 越狱 低帮帆布鞋 情侣鞋";}i:1;a:2:{s:3:"img";s:72:"http://img04.taobaocdn.com/bao/uploaded/i4/T1DxC8Xi4eXXXO8ZZ5_054947.jpg";s:5:"intro";s:86:"MIYI米逸 新款英伦小包卡其色单肩包复古牛皮撞色复古女包邮差包";}i:2;a:2:{s:3:"img";s:72:"http://img02.taobaocdn.com/bao/uploaded/i2/T1X697XjXbXXcMnfM._112229.jpg";s:5:"intro";s:85:"MIYI 红色斜纹牛皮单肩包包女包 2012新款潮包结婚包新娘包晚宴包";}i:3;a:2:{s:3:"img";s:72:"http://img04.taobaocdn.com/bao/uploaded/i4/T1oAbZXkldXXcH5ug2_043616.jpg";s:5:"intro";s:84:"MIYI 英国2013新款头层牛皮撞色真皮女包小包单肩包信封邮差包邮";}}', 1, 255, 0, 4, 0, 0, 1353902316),
(10, 1, 7, '咕咕是一只猫', '手作王国', '', '', 'a:3:{i:0;a:2:{s:3:"img";s:96:"http://img01.taobaocdn.com/bao/uploaded/i1/10917022951369205/T1wfGxXCxiXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:84:"春夏新品潮爆图案印花双口袋纯棉宽松大版蝙蝠T恤 CC皇后家C0062";}i:1;a:2:{s:3:"img";s:72:"http://img01.taobaocdn.com/bao/uploaded/i1/T18U_SXklkXXcPno7._084022.jpg";s:5:"intro";s:85:"MIYI 2012秋冬新款欧美时尚牛皮邮差包单肩斜挎包 复古百搭女大包";}i:2;a:2:{s:3:"img";s:72:"http://img02.taobaocdn.com/bao/uploaded/i2/T1qrdqXXlwXXa_4U38_101909.jpg";s:5:"intro";s:85:"MIYI 2012英伦复古学院风牛皮撞色邮差包 时尚单肩斜挎潮包女士包";}}', 1, 255, 0, 3, 0, 0, 1353902316),
(11, 1, 11, '彩色淘', '怀旧系，寻找时光的芳', '', '', 'a:5:{i:0;a:2:{s:3:"img";s:96:"http://img01.taobaocdn.com/bao/uploaded/i1/12542025078365981/T14i8OFohXXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:84:"2013情侣装夏装 流氓兔子韩版短袖纯棉打底衫情侣t恤修身男女款";}i:1;a:2:{s:3:"img";s:96:"http://img01.taobaocdn.com/bao/uploaded/i1/16534025602603614/T1nUSPXq0hXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:88:"缀爱依 连衣裙 夏季 韩版 新款女装小碎花休闲修身雪纺连衣裙裙子";}i:2;a:2:{s:3:"img";s:96:"http://img04.taobaocdn.com/bao/uploaded/i4/18861022761956552/T1RGWvXvhfXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:85:"2013夏装新款 韩版女装纯棉修身百搭圆领短袖T恤女 大码白色半袖";}i:3;a:2:{s:3:"img";s:96:"http://img03.taobaocdn.com/bao/uploaded/i3/12912023572419619/T1PXyaXu4cXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:83:"2013夏天新款女装翻领纯棉T恤女短袖韩版修身POLO衫刺绣t恤女士t";}i:4;a:2:{s:3:"img";s:96:"http://img04.taobaocdn.com/bao/uploaded/i4/12179025445503052/T1oHNyFl8iXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:86:"韩版防晒衫 无扣披肩 防晒衣 空调开衫罩衫超薄 针织衫外套 女夏";}}', 1, 255, 0, 11, 0, 1, 1353902316),
(12, 1, 15, 'Prickleman', '小小角落', '', '', 'a:2:{i:0;a:2:{s:3:"img";s:72:"http://img02.taobaocdn.com/bao/uploaded/i2/T1ctjsXf4gXXXA2Yvb_093214.jpg";s:5:"intro";s:89:"正品 防晒衣长袖透明蕾丝超薄外套女 夏防紫外线防晒衫开衫防晒服";}i:1;a:2:{s:3:"img";s:72:"http://img04.taobaocdn.com/bao/uploaded/i4/T1_HC7XhlwXXbMVu7W_023330.jpg";s:5:"intro";s:81:"MIYI秋冬新款牛皮复古OL通勤单肩斜挎女包包英伦潮款特价包邮";}}', 1, 255, 0, 2, 0, 0, 1353902316),
(13, 1, 16, 'Eudora_寻寻', '温暖的小世界。', '', '', 'a:5:{i:0;a:2:{s:3:"img";s:96:"http://img01.taobaocdn.com/bao/uploaded/i1/11492021659317504/T1TyOaXCXbXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:86:"tinee天鹅绒运动套装女款春秋休闲套装女韩版金丝绒大码卫衣套装";}i:1;a:2:{s:3:"img";s:96:"http://img03.taobaocdn.com/bao/uploaded/i3/10261021377723980/T1GbZ_Xl0cXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:90:"笠莎春秋韩版天鹅绒运动套装女金丝绒大码卫衣套装休闲套装运动服";}i:2;a:2:{s:3:"img";s:96:"http://img03.taobaocdn.com/bao/uploaded/i3/14022024525063591/T1XJusXE0eXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:86:"奶牛的梦 短袖男装夏装2013新款 男t恤休闲翻领珠地棉男士短袖T恤";}i:3;a:2:{s:3:"img";s:72:"http://img01.taobaocdn.com/bao/uploaded/i1/T1msjzXfFmXXbavIAU_013829.jpg";s:5:"intro";s:76:"【远步正品】2012秋冬新款 印花高帮帆布鞋 韩版 学生女鞋";}i:4;a:2:{s:3:"img";s:72:"http://img04.taobaocdn.com/bao/uploaded/i4/T1gz6JXj8iXXblFxU8_100704.jpg";s:5:"intro";s:87:"MIYI 欧美鸵鸟纹头层牛皮单肩包斜跨复古女包邮差包 手提真皮女包";}}', 1, 255, 0, 5, 0, 0, 1353902317),
(14, 1, 13, '想太多妹子', '创意也能DIY', '', '', 'a:5:{i:0;a:2:{s:3:"img";s:72:"http://img01.taobaocdn.com/bao/uploaded/i1/T1K_vfXlJaXXakVJ37_064254.jpg";s:5:"intro";s:77:"【远步正品】2012秋冬新款 星星印花女式低帮帆布鞋学生鞋";}i:1;a:2:{s:3:"img";s:72:"http://img03.taobaocdn.com/bao/uploaded/i3/T1qYjFXbXfXXXvyygU_015147.jpg";s:5:"intro";s:63:"【远步正品】 男女帆布鞋韩版 高帮 学生情侣鞋";}i:2;a:2:{s:3:"img";s:72:"http://img03.taobaocdn.com/bao/uploaded/i3/T1M463XeBdXXb0fkM9_074304.jpg";s:5:"intro";s:85:"预售定金 榴莲家 英伦双排扣毛呢外套牛角扣肩章羊毛呢大衣20459";}i:3;a:2:{s:3:"img";s:72:"http://img04.taobaocdn.com/bao/uploaded/i4/T1srf5Xm8XXXXV8lI__110350.jpg";s:5:"intro";s:82:"预售款 榴莲家秋冬装新款呢大衣女 双排扣气质呢大衣外套20281";}i:4;a:2:{s:3:"img";s:72:"http://img02.taobaocdn.com/bao/uploaded/i2/T1O9mQXndwXXXD_O.0_035651.jpg";s:5:"intro";s:85:"MIYI 2012秋冬新款欧美头层牛皮单肩斜挎包 韩版真皮女包通勤包包";}}', 1, 255, 0, 5, 0, 1, 1353902318),
(15, 1, 9, 'wingsa区', '韩范范思密达', '', '', 'a:5:{i:0;a:2:{s:3:"img";s:25:"1307/18/51e7a67871098.gif";s:5:"intro";s:15:"sadasdsadsadsad";}i:1;a:2:{s:3:"img";s:96:"http://img02.taobaocdn.com/bao/uploaded/i2/14997021759858927/T1RF1XXAddXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:83:"包邮特价2013女士夏装纯色t恤/韩版修身V领白色短袖t恤女/胖mm潮";}i:2;a:2:{s:3:"img";s:96:"http://img03.taobaocdn.com/bao/uploaded/i3/13541025066567942/T1PPWEXxpfXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:85:"艾路丝婷2013夏装新款大码韩版女装修身体恤短袖打底衫T恤女B0601";}i:3;a:2:{s:3:"img";s:96:"http://img01.taobaocdn.com/bao/uploaded/i1/13873036405076498/T1THxmFm8XXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:85:"2013新款夏装韩版短袖潮女装上衣服胖MM大码宽松中长款短袖女t恤";}i:4;a:2:{s:3:"img";s:96:"http://img02.taobaocdn.com/bao/uploaded/i2/12582025820267890/T1bjmYXzxdXXXXXXXX_!!0-item_pic.jpg";s:5:"intro";s:86:"尚西哲 男士短袖t恤 男夏装男T恤 韩版男装 t恤 大码男装短袖条纹";}}', 1, 255, 0, 7, 0, 0, 1353902642);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_album_cate`
--

CREATE TABLE IF NOT EXISTS `weixin_album_cate` (
  `id` smallint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `img` varchar(255) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `albums` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `weixin_album_cate`
--

INSERT INTO `weixin_album_cate` (`id`, `name`, `img`, `ordid`, `albums`, `status`, `seo_title`, `seo_keys`, `seo_desc`) VALUES
(1, '甜美', '', 0, 0, 1, '', '', ''),
(2, '欧美', '', 0, 0, 1, '', '', ''),
(3, '街拍', '', 0, 0, 1, '', '', ''),
(4, '复古', '', 0, 0, 1, '', '', ''),
(5, '明星', '', 0, 0, 1, '', '', ''),
(6, '穿搭', '', 0, 0, 1, '', '', ''),
(7, '品牌', '', 0, 0, 1, '', '', ''),
(8, '婚礼', '', 0, 0, 1, '', '', ''),
(9, '美妆', '', 0, 0, 1, '', '', ''),
(10, '美发', '', 0, 0, 1, '', '', ''),
(11, '个性', '', 0, 0, 1, '', '', ''),
(12, '日系', '', 0, 0, 1, '', '', ''),
(13, '韩系', '', 0, 0, 1, '', '', ''),
(14, '清新', '', 0, 0, 1, '', '', ''),
(15, '英伦', '', 0, 0, 1, '', '', ''),
(16, 'BF风', '', 0, 0, 1, '', '', ''),
(17, '朋克', '', 0, 0, 1, '', '', ''),
(18, '优雅', '', 0, 0, 1, '', '', ''),
(19, '名媛', '', 0, 0, 1, '', '', ''),
(20, '森女', '', 0, 0, 1, '', '', ''),
(21, '性感', '', 0, 0, 1, '', '', ''),
(22, '流行', '', 0, 0, 1, '', '', ''),
(23, '时尚', '', 0, 0, 1, '', '', ''),
(24, '简约', '', 0, 0, 1, '', '', ''),
(25, '民族', '', 0, 0, 1, '', '', ''),
(26, '原单', '', 0, 0, 1, '', '', ''),
(27, 'OL', '', 0, 0, 1, '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `weixin_album_comment`
--

CREATE TABLE IF NOT EXISTS `weixin_album_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `info` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_album_follow`
--

CREATE TABLE IF NOT EXISTS `weixin_album_follow` (
  `uid` int(10) NOT NULL,
  `album_id` int(10) NOT NULL,
  `add_time` int(10) NOT NULL,
  UNIQUE KEY `uid` (`uid`,`album_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_album_item`
--

CREATE TABLE IF NOT EXISTS `weixin_album_item` (
  `album_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `intro` varchar(255) NOT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`album_id`,`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_alipay`
--

CREATE TABLE IF NOT EXISTS `weixin_alipay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alipayname` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '支付宝名称',
  `partner` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '合作身份者id',
  `key` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '安全检验码',
  `leixing` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `weixin_alipay`
--

INSERT INTO `weixin_alipay` (`id`, `alipayname`, `partner`, `key`, `leixing`) VALUES
(1, 'zheng@breadth.com.cn', '2088901306725622', '5wjijzo50vjw1bgj26kq1s1gbcl8sg2b', 2),
(2, '自助商户测试帐户', '1900000113', 'e82573dc7e6136ba414f2e2affbe39fa', 1);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_article`
--

CREATE TABLE IF NOT EXISTS `weixin_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(4) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `colors` varchar(10) NOT NULL,
  `author` varchar(100) NOT NULL,
  `tags` varchar(100) NOT NULL,
  `img` varchar(255) NOT NULL,
  `intro` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `comments` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `hits` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255' COMMENT '排序值',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_article_cate`
--

CREATE TABLE IF NOT EXISTS `weixin_article_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `img` varchar(255) NOT NULL,
  `pid` smallint(4) unsigned NOT NULL DEFAULT '0',
  `spid` varchar(50) NOT NULL,
  `ordid` smallint(4) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `weixin_article_cate`
--

INSERT INTO `weixin_article_cate` (`id`, `type`, `name`, `alias`, `img`, `pid`, `spid`, `ordid`, `status`, `seo_title`, `seo_keys`, `seo_desc`) VALUES
(1, 1, '网站信息', '', '', 0, '0', 255, 1, '', '', ''),
(2, 1, '关于我们', '', '', 1, '1|', 255, 1, '', '', ''),
(3, 1, '联系我们', '', '', 1, '1|', 255, 1, '', '', ''),
(4, 1, '加入我们', '', '', 1, '1|', 255, 1, '', '', ''),
(6, 1, '积分规则', '', '', 5, '5|', 255, 1, '', '', ''),
(7, 1, '兑换说明', '', '', 5, '5|', 255, 1, '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `weixin_article_page`
--

CREATE TABLE IF NOT EXISTS `weixin_article_page` (
  `cate_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) NOT NULL,
  `info` text NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  `last_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `weixin_article_page`
--

INSERT INTO `weixin_article_page` (`cate_id`, `title`, `info`, `seo_title`, `seo_keys`, `seo_desc`, `last_time`) VALUES
(2, '关于我们', '<div>\r\n	欢迎来到PinPHP－拼品网， 拼品网是一个技术驱动创造时尚的互联网创业型公司，通过搜索引擎、图形处理、视觉搜索等核心技术研发优势，为中国千百万的个人站长提供一个解决如何快速抢建一个社会化的电子商务导购平台，它可以帮助爱美丽的女生找到适合的穿衣搭配、在哪里购买合适的时装搭配网购社区平台；我们将致力于为每一个时尚女孩都能轻松地创建属于自己的搭配宝典库而矢志不移的奉献青春年华。\r\n</div>\r\n<div>\r\n	<br />\r\n</div>\r\n<div>\r\n	　　来逛拼品网&nbsp;，你将发现更多喜爱的搭配风格，找到你最喜欢的时尚元素，你也将发现全球各地流行的风格与趋势，你还能很方便的在线拼贴搭配出你的时尚品味；懂得搭配的女人才更美丽，拉上你的好姐妹们一起来逛拼品网吧！\r\n</div>\r\n<div>\r\n	<br />\r\n</div>\r\n<div>\r\n	　　Logo寓意诠释：化蛹成碟的美丽蜕变，意思是通过来逛拼品网能让女孩们蜕变得更美丽！\r\n</div>', '', '', '', 0),
(3, '联系我们', '<p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;">\r\n	联系电话：0571-28058597\r\n</p>\r\n<p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;">\r\n	&nbsp;\r\n</p>\r\n<p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;">\r\n	官方网站：www.pinphp.com\r\n</p>\r\n<p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;">\r\n	&nbsp;\r\n</p>\r\n<p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;">\r\n	地址：杭州市万塘路６９号华星科技苑Ａ楼\r\n</p>\r\n<p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;">\r\n	&nbsp;\r\n</p>\r\n<p style="margin-top:0px;margin-bottom:0px;padding:0px;color:#666666;font-family:Arial;font-size:14px;line-height:22px;white-space:normal;background-color:#FFFFFF;">\r\n	邮编：３１００１２\r\n</p>', '', '', '', 0),
(4, '加入我们', '<span style="white-space:nowrap;"><strong>岗位名称：信息编辑</strong></span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp;<strong> 岗位职责：&nbsp;</strong></span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp; 1、产业网站内容建设；&nbsp;</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp; 2、产业数据搜集整理；</span><br />\r\n<span style="white-space:nowrap;">&nbsp;</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; <strong>任职要求 ：&nbsp;</strong></span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp; 1、大专以上学历，传媒、新闻、电子商务相关专业优先；&nbsp;</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp; 2、1年以上互联网行业媒体从业经验，有电子商务相关从业经历者优先；&nbsp;</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp; 3、熟悉网页制作软件，良好的文字功底、有原创采写经验者优先；&nbsp;</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp; 4、对新闻、电子商务等产业有持续关注兴趣，良好的英文阅读能力；&nbsp;</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp; 5、具有较强学习能力和责任心，以及团队合作精神；&nbsp;</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp; 6、优秀应届毕业生可放宽工作经验要求；</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp;</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp; 有意者请发送简历至：HR#insuny.com （#替换成@）</span><br />\r\n<span style="white-space:nowrap;"><br />\r\n</span><br />\r\n<span style="white-space:nowrap;"><strong>岗位名称：开发工程师</strong></span><br />\r\n<span style="white-space:nowrap;"><strong>&nbsp; &nbsp; 岗位职责：&nbsp;</strong></span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp; 1、负责网站系统及B/S架构产品开发；&nbsp;</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp; 2、负责产品体验优化；</span><br />\r\n<span style="white-space:nowrap;">&nbsp;</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp;<strong> 任职要求 ：</strong>&nbsp;</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp; 1、大学专科及以上，计算机相关专业优先；&nbsp;</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp; 2、2年以上B/S架构开发经验；有独立开发开发经验者优先；&nbsp;</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp; 3、良好掌握PHP开发语言及MySQL数据库；&nbsp;</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp; 4、熟练掌握javascript / ajax等；&nbsp;</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp; 5、有激情，热爱互联网行业，熟悉web2.0应用；</span><br />\r\n<span style="white-space:nowrap;"><br />\r\n</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; 有意者请发送简历至：HR#insuny.com（#替换成@）</span><br />\r\n<span style="white-space:nowrap;"><br />\r\n</span><br />\r\n<span style="white-space:nowrap;"><strong>岗位名称：网页设计师</strong></span><br />\r\n<span style="white-space:nowrap;"><strong>&nbsp; &nbsp; 岗位职责：</strong>&nbsp;</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp; 1、负责网站及B/S架构产品前端界面设计及重构；&nbsp;</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp; 2、负责产品体验优化；</span><br />\r\n<span style="white-space:nowrap;">&nbsp;</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp;<strong> 任职要求 ：</strong>&nbsp;</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp; 1、大学专科及以上，计算机相关专业优先；&nbsp;</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp; 2、2年以上网站设计经验；有整站设计重构经验者优先；&nbsp;</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp; 3、良好掌握XHTML，CSS手工书写页面，熟悉W3C标准，精通div+css；&nbsp;</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp; 4、精通Photoshop、Dreamweaver、Flash等多种网页设计制作软件；&nbsp;</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp; 5、有激情，热爱互联网行业，熟悉web2.0应用；</span><br />\r\n<span style="white-space:nowrap;"><br />\r\n</span><br />\r\n<span style="white-space:nowrap;">&nbsp; &nbsp; &nbsp; &nbsp;有意者请发送简历至：HR#insuny.com （#替换成@）</span><br />', '', '', '', 0),
(6, '会员加减分规则', '<p>\r\n	<strong>积分兑换</strong>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	积分是为了答谢支持PinPHP网站会员而制定的一种奖励方式，您可以进入账户中的积分页面查看积分明细，同时PinPHP会推出各类积分兑换活动，请随时关注关于积分的活动告知。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>积分获得：</strong>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	1、会员注册：会员注册即送20点积分，一个账户只能得一次注册积分；\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	2、每日登录：会员每日首次登录PinPHP网站能获得10积分，每日上限5次；\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	3、发布分享：会员分享新商品到PinPHP网站能获得20积分，每日上限10次；\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	4、添加喜欢：针对PinPHP网站上的商品会员点击喜欢可获得1积分，每日上限10次；\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	5、添加到专辑：会员把喜欢的商品添加进个人的专辑中可获得2积分，每日上限10次；\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	6、转发分享：会员转发PinPHP网站上商品到其他网站上可获2积分，每日上限10次；\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	7、发布评论：会员评论PinPHP网站商品可获1积分，每日上线5次。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>积分扣除：</strong>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	1、删除分享：会员删除自己添加的商品减20积分，每日上限100次；\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	2、兑换商品：会员使用积分兑换自己喜欢的商品会扣除相对应的积分。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<div>\r\n	<br />\r\n</div>', '', '', '', 0),
(7, '兑换说明', '1、奖品价格已经包含邮寄费用在内，您无须另行支付。兑奖前请确认您的帐户中有足够数量的积分！<br />\r\n2、奖品寄送方式：QQ直充类奖品兑奖审核通过后会直接充入您的QQ号码中，其余虚拟奖品采用在线发送卡密的方式；实体奖品全部采用快递方式。<br />\r\n3、虚拟奖品有效期：虚拟卡密类奖品除手机充值卡10/20/30元卡密，因为充值卡金额少，有效期比较短，大约一周左右,其余卡密类奖品有效期为1个月；虚拟卡直冲类为即时发货即时到账，无有效期限制！积分兑换含有有效期的奖品，请尽快充值使用，如过有效期未充值导致卡密失效，PinPHP网概不负责。<br />\r\n4、确认您的奖品邮寄地址、联系电话正确无误后提交兑奖申请！如因您未提供详细信息或信息错误，导致奖品错投或无法寄送，网站不负任何责任，并不再补发奖品。<br />\r\n5、实物奖品将在兑奖提交后的2-5工作日内发出(奖品状态您可通过“积分订单”查询)！<br />\r\n6、实物奖品按照会员申请的要求发出去之后，无破损、短缺等质量问题或因个人喜好（色泽、外观）要求退换货将无法受理。<br />\r\n7、兑奖中心所有实物奖品颜色均为随机发送, 敬请谅解！<br />\r\n<br />\r\n<strong>注意：</strong><br />\r\n<br />\r\n1、签收奖品前，务必仔细检查货物是否完好！如果发现有破损、短缺情况，请直接让快递公司退回，无需承担任何费用，并及时与我们联系。签收后提出货物破损等问题，一律责任自负！无法受理退换货要求！他人代签与本人签收一样。<br />\r\n2、收到奖品7天内，若发现质量问题，请及时与我们联系并提供图片说明。如因个人使用不当导致的奖品问题无法更换。<br />\r\n3、如提交兑奖后，由于商家缺货导致无法发货的情况，会员会收到站内信息通知并取消兑奖，请重新选择其他奖品兑换。<br />\r\n<br />\r\n兑奖过程中如有问题请通过“联系我们”联系咨询。<br />\r\n以上奖品图片仅供参考,请您以收取的实物为准！如有异议请联系客服人员确认奖品情况。<br />', '', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_auto_user`
--

CREATE TABLE IF NOT EXISTS `weixin_auto_user` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `users` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `weixin_auto_user`
--

INSERT INTO `weixin_auto_user` (`id`, `name`, `users`) VALUES
(1, '商品采集采集', '熊小熊zz,安土桃山,晨雪熙,V小莲小莲V,Eudora_寻寻,Prickleman,泡芙小米粒,想太多妹子,跳房子123,彩色淘,设计系小女生,wingsa区,枕水而眠,咕咕是一只猫,起个名字太累');

-- --------------------------------------------------------

--
-- 表的结构 `weixin_badword`
--

CREATE TABLE IF NOT EXISTS `weixin_badword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1：禁用；2：替换；3：审核',
  `badword` varchar(100) NOT NULL,
  `replaceword` varchar(100) NOT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_brandlist`
--

CREATE TABLE IF NOT EXISTS `weixin_brandlist` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- 转存表中的数据 `weixin_brandlist`
--

INSERT INTO `weixin_brandlist` (`id`, `name`, `status`, `ordid`) VALUES
(46, '江安优客来', 1, 0),
(26, '达利园', 1, 10),
(15, '洽洽', 1, 0),
(16, '好巴食', 1, 0),
(17, '加多宝', 1, 1),
(18, '康师傅', 1, 2),
(19, '喜之郎', 1, 3),
(20, '伊利', 1, 4),
(21, '有友', 1, 5),
(22, '好牌', 1, 6),
(23, '旺旺', 1, 7),
(24, '百事可乐', 1, 8),
(25, '可口可乐', 1, 9),
(27, '斗牛士', 1, 11),
(31, '统一', 1, 12),
(32, '老灶煮花生', 1, 13),
(33, '百世兴', 1, 14),
(34, '喜之郎', 1, 15),
(35, '江南美食', 1, 16),
(36, '农夫山泉', 1, 17),
(37, '哇哈哈', 1, 18),
(38, '雪花', 1, 20),
(39, '青岛啤酒', 1, 19),
(40, '哈尔滨啤酒', 1, 21),
(42, '红牛', 1, 22),
(43, '脉动', 1, 23),
(44, '赠品', 1, 100),
(45, '特仑苏', 1, 24),
(47, '未来星', 1, 46),
(48, '蒙牛', 1, 48),
(12, '百容捷', 1, 0),
(13, '真心网', 1, 0),
(14, '饮食', 1, 11);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_custom_menu`
--

CREATE TABLE IF NOT EXISTS `weixin_custom_menu` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `tags` varchar(50) NOT NULL,
  `pid` smallint(4) unsigned NOT NULL,
  `spid` varchar(50) NOT NULL,
  `fcolor` varchar(10) NOT NULL,
  `remark` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `items` int(10) unsigned NOT NULL DEFAULT '0',
  `likes` int(10) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0:商品分类 1:标签分类',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL,
  `is_index` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keyword` varchar(255) DEFAULT NULL COMMENT '关键词',
  `key` varchar(255) DEFAULT NULL COMMENT 'key值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=382 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_delivery`
--

CREATE TABLE IF NOT EXISTS `weixin_delivery` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `weixin_delivery`
--

INSERT INTO `weixin_delivery` (`id`, `name`, `status`, `ordid`) VALUES
(1, 'EMS', 1, 0),
(2, '中通速递', 1, 0),
(3, '圆通速递', 1, 0),
(4, '汇通快运', 1, 0),
(5, '申通快递', 1, 0),
(6, '韵达快运', 1, 0),
(7, '顺丰速运', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_flink`
--

CREATE TABLE IF NOT EXISTS `weixin_flink` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `img` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `cate_id` smallint(5) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `weixin_flink`
--

INSERT INTO `weixin_flink` (`id`, `name`, `img`, `url`, `cate_id`, `ordid`, `status`) VALUES
(1, 'PinPHP', '', 'http://www.pinphp.com', 1, 0, 1),
(2, '羽绒衣', '', 'http://www.yurongyi.com', 1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_flink_cate`
--

CREATE TABLE IF NOT EXISTS `weixin_flink_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `weixin_flink_cate`
--

INSERT INTO `weixin_flink_cate` (`id`, `name`, `ordid`, `status`) VALUES
(1, '友情链接', 255, 1);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_images`
--

CREATE TABLE IF NOT EXISTS `weixin_images` (
  `iid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `imgurl` varchar(300) NOT NULL,
  PRIMARY KEY (`iid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=79 ;

--
-- 转存表中的数据 `weixin_images`
--

INSERT INTO `weixin_images` (`iid`, `imgurl`) VALUES
(45, 'data/upload/keyword/1403/29/5336c1c10a00c.jpg'),
(46, 'data/upload/keyword/1403/30/5337b0494d528.jpg'),
(47, 'data/upload/keyword/1403/30/5337b09e066ad.jpg'),
(48, 'data/upload/keyword/1403/30/5337b0db1a9a0.jpg'),
(49, 'data/upload/keyword/1403/30/5337b12da8a14.jpg'),
(50, 'data/upload/keyword/1403/30/5337d83059efa.jpg'),
(51, 'data/upload/keyword/1404/10/5346a97c79ffd.jpg'),
(78, 'data/upload/keyword/1406/05/539035914daf9.png'),
(75, 'data/upload/keyword/1405/31/538950e39723f.jpg'),
(76, 'data/upload/keyword/1406/04/538e8945ec3c2.jpg'),
(62, 'data/upload/keyword/1405/02/536303be18281.jpg'),
(71, 'data/upload/keyword/1405/23/537f1af07e6e0.jpg'),
(70, 'data/upload/keyword/1405/23/537f1ae2291c1.jpg'),
(77, 'data/upload/keyword/1406/05/5390346dea118.png'),
(43, 'data/upload/keyword/1403/24/532fcf9054552.jpg'),
(22, 'data/upload/keyword/1308/16/520dc84ee84b2.jpg'),
(23, 'data/upload/keyword/1312/24/52b929bd815f0.jpg'),
(24, 'data/upload/keyword/1312/24/52b929d5e56a8.jpg'),
(25, 'data/upload/keyword/1312/24/52b93af77b534.jpg'),
(26, 'data/upload/keyword/1312/24/52b93b2c1f6c5.jpg'),
(27, 'data/upload/keyword/1312/24/52b93ef8d14b0.jpg'),
(28, 'data/upload/keyword/1312/24/52b940ed90901.jpg'),
(29, 'data/upload/keyword/1312/24/52b94106f1808.jpg'),
(30, 'data/upload/keyword/1312/24/52b94280dace6.jpg'),
(31, 'data/upload/keyword/1312/24/52b942858c041.jpg'),
(32, 'data/upload/keyword/1312/24/52b943b1be93f.jpg'),
(33, 'data/upload/keyword/1312/24/52b943bb96afc.jpg'),
(34, 'data/upload/keyword/1312/24/52b94409638ee.jpg'),
(35, 'data/upload/keyword/1312/24/52b9445456c8d.png'),
(36, 'data/upload/keyword/1312/26/52bb9befd0c95.jpg'),
(37, 'data/upload/keyword/1312/26/52bba35664e9f.jpg'),
(38, 'data/upload/keyword/1312/26/52bba3a511371.jpg'),
(39, 'data/upload/keyword/1312/26/52bba4d509614.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `weixin_ipban`
--

CREATE TABLE IF NOT EXISTS `weixin_ipban` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `expires_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_item`
--

CREATE TABLE IF NOT EXISTS `weixin_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(4) unsigned DEFAULT NULL,
  `orig_id` smallint(6) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `intro` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `rates` float(8,2) NOT NULL COMMENT '佣金比率xxx.xx%',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:商品,2:图片',
  `comments` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `cmt_taobao_time` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `info` text,
  `news` tinyint(4) DEFAULT '0',
  `tuijian` tinyint(4) DEFAULT '0',
  `goods_stock` int(11) DEFAULT '50' COMMENT '库存',
  `buy_num` int(11) DEFAULT '0' COMMENT '卖出数量',
  `brand` int(11) DEFAULT '1' COMMENT '品牌',
  `pingyou` decimal(10,2) DEFAULT '0.00',
  `kuaidi` decimal(10,2) DEFAULT '0.00',
  `ems` decimal(10,2) DEFAULT '0.00',
  `free` int(11) DEFAULT '1',
  `color` varchar(255) DEFAULT NULL COMMENT '颜色',
  `size` varchar(255) DEFAULT NULL COMMENT '尺寸',
  PRIMARY KEY (`id`),
  KEY `cid` (`cate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=228 ;

--
-- 转存表中的数据 `weixin_item`
--

INSERT INTO `weixin_item` (`id`, `cate_id`, `orig_id`, `title`, `intro`, `img`, `price`, `rates`, `type`, `comments`, `cmt_taobao_time`, `add_time`, `ordid`, `status`, `info`, `news`, `tuijian`, `goods_stock`, `buy_num`, `brand`, `pingyou`, `kuaidi`, `ems`, `free`, `color`, `size`) VALUES
(209, 359, 0, '真果粒芦荟味250ml*12盒', '', '1405/29/5386dad88c592.jpg', '39.00', 0.00, 1, 0, 0, 1401346776, 255, 1, '<p>\r\n	<br />\r\n</p>\r\n<p style="white-space:normal;">\r\n	<span style="font-size:16px;"><s>超市价格：42元</s></span> \r\n</p>\r\n<p style="white-space:normal;">\r\n	<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">39</span><span style="font-size:16px;">元</span></span> \r\n</p>\r\n<p style="white-space:normal;">\r\n	<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span> \r\n</p>\r\n<p style="white-space:normal;">\r\n	<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401347362599807.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401347363457426.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/140134736381573.jpg" />&nbsp;&nbsp;<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401347363457426.jpg" /> \r\n</p>', 0, 0, 100, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(210, 357, 0, '红枣味早餐奶250ml*16盒', '', '1405/29/5386ea3ed8610.jpg', '0.00', 0.00, 1, 0, 0, 1401350718, 255, 0, '<p>\r\n	<img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/140135130586491.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401351306682433.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401351307191268.jpg" /> \r\n</p>\r\n<p>\r\n	<span style="font-size:48.0px;">新包装</span> \r\n</p>\r\n<p>\r\n	<span style="font-size:48.0px;"></span><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/140135130768147.jpg" /> \r\n</p>', 0, 0, 100, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(211, 357, 0, '麦香味早餐奶250ml*16盒', '', '1405/29/538738b3dbe95.jpg', '0.00', 0.00, 1, 0, 0, 1401370803, 255, 0, '<img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401371395646801.jpg" /> <img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401371396514044.jpg" /> <img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401371396886566.jpg" /> <img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/140137139726683.jpg" />', 0, 0, 100, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(212, 357, 0, '核桃味早餐奶 250ml*16盒', '', '1405/30/5387d2247ff4b.jpg', '0.00', 0.00, 1, 0, 0, 1401410084, 255, 0, '<img src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401410610319214.jpg" align="absmiddle" /><img src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/140141061087409.jpg" align="absmiddle" /><img src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401410611328413.jpg" align="absmiddle" />', 0, 0, 100, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(213, 363, 0, '奶特香蕉牛奶243ml×12盒 ', '', '1405/30/53889c147f2d8.jpg', '53.00', 0.00, 1, 0, 0, 1401461780, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<s style="font-size:16px;">超市价格：59元</s>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">53</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401334036697760.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401334037521897.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401334038022127.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401334038541020.jpg" />\r\n</p>', 0, 0, 100, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(220, 366, 0, '新养道零乳糖牛奶全脂型250ml×12盒', '', '1405/31/538976b3a03b6.jpg', '45.00', 0.00, 1, 0, 0, 1401517747, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;"><s>超市价格：49元</s></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">45</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401518349396133.jpg" /><img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401518350336792.jpg" /><img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401518350828284.jpg" /> \r\n</p>', 1, 0, 99, 1, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(221, 356, 0, '未来星儿童成长有机奶190ml×10盒', '', '1405/31/5389784334a71.jpg', '54.00', 0.00, 1, 0, 0, 1401518147, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;"><s>超市价格：59元</s></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">54</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401518742623556.jpg" /><img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401518743435825.jpg" /><img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401518743876011.jpg" /> \r\n</p>', 1, 0, 100, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(222, 366, 0, '新养道零乳糖牛奶珍养型250ml×12盒', '', '1405/31/53897d5a8fafe.jpg', '46.00', 0.00, 1, 0, 0, 1401518560, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;"><s>超市价格：52.5元</s></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">46</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401518349396133.jpg" /><img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401518350336792.jpg" /><img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401518350828284.jpg" /> \r\n</p>', 1, 0, 99, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(223, 366, 0, '新养道零乳糖牛奶低脂型250ml×12盒', '', '1405/31/53897f144c67b.jpg', '45.00', 0.00, 1, 0, 0, 1401519892, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;"><s>超市价格：49元</s></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">45</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401518349396133.jpg" /><img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401518350336792.jpg" /><img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401518350828284.jpg" /> \r\n</p>', 0, 0, 100, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(203, 359, 0, '紫薯黑加仑菠萝味果蔬酸酸乳250ml×12盒', '', '1405/28/5385f02de6e04.jpg', '28.00', 0.00, 1, 0, 0, 1401286701, 255, 1, '<p>\r\n	<br />\r\n</p>\r\n<p style="white-space:normal;">\r\n	<span style="font-size:16px;"><s>超市价格：30元</s></span> \r\n</p>\r\n<p style="white-space:normal;">\r\n	<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">28</span><span style="font-size:16px;">元</span></span> \r\n</p>\r\n<p style="white-space:normal;">\r\n	<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span> \r\n</p>\r\n<p style="white-space:normal;">\r\n	<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401287305367008.jpg" /><img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401287306124118.jpg" /><img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401287306552102.jpg" /><img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401287307027732.jpg" /><img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401287307526470.jpg" /><img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401287307956699.jpg" /><img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401287308498800.jpg" /> \r\n</p>', 0, 1, 173, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(204, 359, 0, '番茄樱桃草莓味果蔬酸酸乳250ml×12盒', '', '1405/29/5386a2b2905be.jpg', '28.00', 0.00, 1, 0, 0, 1401332402, 255, 1, '<p>\r\n	<s style="font-size:16px;">超市价格：30元</s>\r\n</p>\r\n<p style="white-space:normal;">\r\n	<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">28</span><span style="font-size:16px;">元</span></span> \r\n</p>\r\n<p style="white-space:normal;">\r\n	<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span> \r\n</p>\r\n<p style="white-space:normal;">\r\n	<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/140133301975148.jpg" /><img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/140133302049134.jpg" /><img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401333020854495.jpg" /><img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401333021318608.jpg" /><img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401333021655469.jpg" /><img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/140133302209219.jpg" /><img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401333022424379.jpg" /><img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401333022862621.jpg" /><img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/14013330235337.jpg" /><img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401333023934603.jpg" /><img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401333024399258.jpg" /> \r\n</p>', 0, 1, 95, 1, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(205, 363, 0, '奶特浓情朱古力奶243ml×12盒 ', '', '1405/29/5386a7a3be537.jpg', '53.00', 0.00, 1, 0, 0, 1401333535, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<s style="font-size:16px;">超市价格：59元</s>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">53</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401334036697760.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401334037521897.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401334038022127.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401334038541020.jpg" />\r\n</p>', 1, 0, 99, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(206, 363, 0, '奶特香草口味243ml×12盒', '', '1405/29/5386a920e0633.jpg', '53.00', 0.00, 1, 0, 0, 1401334048, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<s style="font-size:16px;">超市价格：59元</s>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">53</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401334036697760.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401334037521897.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401334038022127.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401334038541020.jpg" />\r\n</p>', 1, 0, 30, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(207, 359, 0, '草莓真果粒250ml*12盒', '', '1405/29/5386ae6a7f7aa.jpg', '39.00', 0.00, 1, 0, 0, 1401335215, 255, 1, '<p>\r\n	<br />\r\n</p>\r\n<p style="white-space:normal;">\r\n	<span style="font-size:16px;"><s>超市价格：42元</s></span> \r\n</p>\r\n<p style="white-space:normal;">\r\n	<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">39</span><span style="font-size:16px;">元</span></span> \r\n</p>\r\n<p style="white-space:normal;">\r\n	<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span> \r\n</p>\r\n<p style="white-space:normal;">\r\n	<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401335772055286.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401335772822473.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401335773562140.jpg" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 0, 0, 100, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(208, 359, 0, '真果粒椰果味250ml*12盒 ', '', '1405/29/5386b186d0a82.jpg', '39.00', 0.00, 1, 0, 0, 1401336198, 255, 1, '<p>\r\n	<br />\r\n</p>\r\n<p style="white-space:normal;">\r\n	<span style="font-size:16px;"><s>超市价格：42元</s></span> \r\n</p>\r\n<p style="white-space:normal;">\r\n	<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">39</span><span style="font-size:16px;">元</span></span> \r\n</p>\r\n<p style="white-space:normal;">\r\n	<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span> \r\n</p>\r\n<p style="white-space:normal;">\r\n	<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/140141870851169.jpg" /><img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/140141870896472.jpg" /><img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401418709415444.jpg" /><img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401418709858115.jpg" /><img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401418710271545.jpg" /><img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401418710683164.jpg" /><img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401418714513977.jpg" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 0, 0, 99, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(187, 353, 0, '伊利 AD钙优酸乳250ml*24盒/箱 ', '', '1404/15/534d3fc5ca6a0.jpg', '46.00', 0.00, 1, 0, 0, 1397571525, 255, 0, '<span style="font-size: 18.0px;">规  格：250ml*24盒/箱</span></span></strong></span></p><p><span style="color: #ff00ff;"><strong><span style="font-family: simhei;"><span style="font-size: 18.0px;">产  地：中国大陆</span></span></strong></span></p><p><span style="color: #ff00ff;"><strong><span style="font-family: simhei;"><span style="font-size: 18.0px;">保质期：8个</span></span></strong></span></p>\r\n<p><img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1397573081833018.jpg"></p>\r\n<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1397573082218199.jpg"></p>\r\n<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1397573082615944.jpg"></p>', 0, 0, 1000, 0, 20, '0.00', '0.00', '0.00', 1, NULL, NULL),
(188, 354, 0, '双河葡萄井凉糕【本商城满10元免费送货上门  凭券还可以免费领取凉糕1份】', '', '1404/22/535611112ea4c.jpg', '3.00', 0.00, 1, 0, 0, 1398149393, 255, 0, '<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1398149736539659.jpg" /> \r\n<p style="margin-bottom:0px;font-size:12px;font-family:tahoma arial verdana;color:#000000;orphans:2;widows:2;margin-top:0px;line-height:normal;">\r\n	&nbsp;<img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/139814973725705.jpg" /> \r\n</p>\r\n<p style="margin-bottom:0px;font-size:12px;font-family:tahoma arial verdana;color:#000000;orphans:2;widows:2;margin-top:0px;line-height:normal;">\r\n	<span style="font-size:14px;"></span> \r\n</p>\r\n<p style="margin-bottom:0px;font-size:12px;font-family:tahoma arial verdana;color:#000000;orphans:2;widows:2;margin-top:0px;line-height:normal;">\r\n	<span style="font-size:14px;"></span> \r\n</p>\r\n<p style="margin-bottom:0px;font-size:12px;font-family:tahoma arial verdana;color:#000000;orphans:2;widows:2;margin-top:0px;line-height:normal;">\r\n	<span style="font-size:14px;"></span> \r\n</p>\r\n<p style="margin-bottom:0px;font-size:12px;font-family:tahoma arial verdana;color:#000000;orphans:2;widows:2;margin-top:0px;line-height:normal;">\r\n	<span style="font-size:14px;">凉糕集“凉、甜、绵、嫩”为一体，</span><span style="font-size:14px;">风味独特，一年四季都能吃到，堪称一绝。</span> \r\n</p>\r\n<p style="margin-bottom:0px;font-size:12px;font-family:tahoma arial verdana;color:#000000;orphans:2;widows:2;margin-top:0px;line-height:normal;">\r\n	<br />\r\n</p>\r\n<p style="margin-bottom:0px;font-size:12px;font-family:tahoma arial verdana;color:#000000;orphans:2;widows:2;margin-top:0px;line-height:normal;">\r\n	<img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1398149737617506.jpg" /> \r\n</p>\r\n<p style="margin-bottom:0px;font-size:12px;font-family:tahoma arial verdana;color:#000000;orphans:2;widows:2;margin-top:0px;line-height:normal;">\r\n	<br />\r\n</p>\r\n<p style="margin-bottom:0px;font-size:12px;font-family:tahoma arial verdana;color:#000000;orphans:2;widows:2;margin-top:0px;line-height:normal;">\r\n	<br />\r\n</p>\r\n<p style="margin-bottom:0px;font-size:12px;font-family:tahoma arial verdana;color:#000000;orphans:2;widows:2;margin-top:0px;line-height:normal;">\r\n	<span style="font-size:14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 凉糕是巴蜀地区的特色小吃，它的主要原料是大米，做出的凉糕透明度好、韧性高、口感好，是老幼皆宜的降暑小吃。</span> \r\n</p>\r\n<p style="margin-bottom:0px;font-size:12px;font-family:tahoma arial verdana;color:#000000;orphans:2;widows:2;margin-top:0px;line-height:normal;">\r\n	<span style="font-size:14px;"></span> \r\n</p>\r\n<p style="margin-bottom:0px;font-size:12px;font-family:tahoma arial verdana;color:#000000;orphans:2;widows:2;margin-top:0px;line-height:normal;">\r\n	<img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/139814973794446.jpg" /> \r\n</p>\r\n<p style="margin-bottom:0px;font-size:12px;font-family:tahoma arial verdana;color:#000000;orphans:2;widows:2;margin-top:0px;line-height:normal;">\r\n	<br />\r\n</p>\r\n<p style="margin-bottom:0px;font-size:12px;font-family:tahoma arial verdana;color:#000000;orphans:2;widows:2;margin-top:0px;line-height:normal;">\r\n	<br />\r\n</p>\r\n<p style="margin-bottom:0px;font-size:12px;font-family:tahoma arial verdana;color:#000000;orphans:2;widows:2;margin-top:0px;line-height:normal;">\r\n	<span style="font-size:14px;"></span> \r\n</p>\r\n<p style="margin-bottom:0px;font-size:12px;font-family:tahoma arial verdana;color:#000000;orphans:2;widows:2;margin-top:0px;line-height:normal;">\r\n	<span style="font-size:14px;"><span style="font-family:宋体;"><span style="font-family:Tahoma;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>那一碗碗、一盘盘凉糕形同冰雪凝聚，洁白晶莹。红糖味、水果味、麻辣味……应有尽有，硬是人人见了都嘴馋。</span></span><span style="font-size:14px;"><span style="font-family:宋体;">无论多热的天气，只要吃完凉糕，不仅热感全无，还让人肝脾舒畅，神思爽朗。</span></span> \r\n</p>', 1, 1, 999, 0, 46, '0.00', '0.00', '0.00', 1, NULL, NULL),
(186, 353, 0, '伊利 原味优酸乳250ml*24盒/箱', '', '1404/15/534d1cf3cd47f.jpg', '46.00', 0.00, 1, 0, 0, 1397562611, 255, 0, '<p>\r\n	<strong style="font-family:simhei;font-size:18px;color:#FF00FF;">规 &nbsp;格：24*250ml</strong> \r\n</p>\r\n<p>\r\n	<span style="color:#ff00ff;"><span style="font-size:18.0px;"><span style="font-family:simhei;"><strong>产 &nbsp;地：中国大陆</strong></span></span></span> \r\n</p>\r\n<p>\r\n	<span style="color:#ff00ff;"><span style="font-size:18.0px;"><span style="font-family:simhei;"><strong>保质期：8个月</strong></span></span></span> \r\n</p>\r\n<p>\r\n	<span style="color:#ff00ff;"><span style="font-size:18.0px;"><span style="font-family:simhei;"><strong>商品特色：</strong></span></span></span> \r\n</p>\r\n<p>\r\n	<span style="color:#ff00ff;"><span style="font-size:18.0px;"><span style="font-family:simhei;"><strong>&nbsp; &nbsp; 挑选天然的纯正牛奶，加入科学配比的“优+活性益生元”，富含多种健康元素，不仅增强免疫力，能激活人体益生菌繁殖，有益身体吸收，并源源不断地给身体提供能量，保证全面吸收，让你活力十足。酸甜浓滑，口口都那么有滋有味！伊利优酸乳，我要我的滋味！</strong></span></span></span> \r\n</p>\r\n<img alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1397563036778889.jpg" /> \r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1397563037155667.jpg" /> \r\n</p>\r\n<p>\r\n	<img alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1397563038086498.jpg" /> \r\n</p>', 0, 1, 1000, 0, 20, '0.00', '0.00', '0.00', 1, NULL, NULL),
(184, 353, 0, '雪碧 330ml罐装', '', '1404/15/534cf7a24bdc9.jpg', '2.00', 0.00, 1, 0, 0, 1397553058, 255, 0, '<img alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1397553475524285.jpg" /> <img alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1397553476144259.jpg" /> <img alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1397553477011750.jpg" /> <img alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1397553477483331.jpg" />', 1, 0, 1000, 0, 25, '0.00', '0.00', '0.00', 1, NULL, NULL),
(185, 355, 0, '特仑苏纯牛奶250ml*12盒', '', '1404/15/534d1068dd990.jpg', '60.00', 0.00, 1, 0, 0, 1397559400, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;"><s>超市价格：65元</s></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">60</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1397559728235003.jpg" /> <img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1397559728611827.jpg" />\r\n</p>', 0, 1, 993, 0, 45, '0.00', '0.00', '0.00', 1, NULL, NULL),
(145, 348, 0, '洽洽 160g 五香瓜子', '', '1403/22/532d94cd71c18.jpg', '5.00', 0.00, 1, 0, 0, 1395496141, 255, 0, '<br />\r\n<div style="margin-top:0px;margin-left:0px;">\r\n	<span style="font-size:14px;">洽洽</span><span style="font-size:14px;">”</span><span style="font-size:14px;">香瓜子所具有的独特的口感和香味，主要在于用料精良，配方独特。来自于内蒙古草原和海外原料基地的优质葵花籽原料和长白山纯天然香料，经过</span><span style="font-size:14px;">“</span><span style="font-size:14px;">洽洽</span><span style="font-size:14px;">”</span><span style="font-size:14px;">精心独特的配方，造就了</span><span style="font-size:14px;">“</span><span style="font-size:14px;">洽洽</span><span style="font-size:14px;">”</span><span style="font-size:14px;">香瓜子特有的口味，从此众口不再难调，</span><span style="font-size:14px;">“</span><span style="font-size:14px;">洽洽瓜子口口香</span><span style="font-size:14px;">”</span><span style="font-size:14px;">随之家喻户晓。</span> \r\n</div>\r\n<p style="margin-top:0px;margin-left:0px;">\r\n	<span style="font-size:14px;">洽洽香瓜子是安徽华泰集团出品的一种葵瓜子。洽洽只是一个香瓜子品牌，但就我所看到的其在终端上的突出表现并不是一般休闲食品所能做到的。在家乐福、华联超市以及好又多等各类大卖场都发现了与易初莲花货架同样的洽洽产品展示效果。城市各个角落的小型连锁超市和便利店，杂货店乃至高速公路旁边加油站里的便利超市，洽洽也洽洽香瓜子无一不是那么彰显的齐整陈列。中国有这么一家仅仅靠卖香瓜子就能在几年内卖出一个年销售额达到10个亿的休闲食品品牌来的优秀企业！后来关注了一下炒货行业，才知道，洽洽通过几年时间的默默耕耘，目前已经成为炒货行业的第一品牌。</span> \r\n</p>\r\n<div style="margin-top:0px;margin-left:0px;">\r\n	<img width="750" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395822078578705.jpg" /> <img width="750" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395822079227340.jpg" /> \r\n</div>', 0, 1, 96, 0, 15, '0.00', '0.00', '0.00', 1, NULL, NULL),
(146, 347, 0, '南溪豆腐干 95g', '', '1403/23/532ea74c5caed.jpg', '2.50', 0.00, 1, 0, 0, 1395564890, 255, 0, '<p>\r\n	规格：95g\r\n</p>\r\n<p>\r\n	产地：四川\r\n</p>\r\n<p>\r\n	功能：食用\r\n</p>\r\n<p>\r\n	食用方法：开袋即食\r\n</p>\r\n<p>\r\n	贮存方法：置于阴凉干燥处\r\n</p>\r\n<p>\r\n	适用人群：所有人群\r\n</p>\r\n<p>\r\n	产品详情：精选优质大豆，传统工艺秘制，丰富植物蛋白。 <img style="margin:10px;float:none;" alt="alt" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395822192784565.jpg" /> \r\n</p>\r\n<p>\r\n	<img style="margin:10px;float:none;" alt="alt" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/139582219331910.jpg" /> \r\n</p>\r\n<p>\r\n	<img style="margin:10px;float:none;" alt="alt" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/139582219391719.jpg" /> \r\n</p>\r\n<p>\r\n	<img style="margin:10px;float:none;" alt="alt" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395822194444955.jpg" /> \r\n</p>', 0, 1, 99, 0, 16, '0.00', '0.00', '0.00', 1, NULL, NULL),
(168, 353, 0, '可口可乐 300ml瓶装', '', '1403/26/5332a16f9fad2.jpg', '3.00', 0.00, 1, 0, 0, 1395827055, 255, 0, '<img alt="可口可乐 碳酸饮料 汽水 300ml/瓶,1号店 正品保障" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395827514046409.jpg" /> <img alt="可口可乐 碳酸饮料 汽水 300ml/瓶,1号店 正品保障" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395827514447172.jpg" /> <img alt="可口可乐 碳酸饮料 汽水 300ml/瓶,1号店 正品保障" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395827515471809.jpg" />', 1, 1, 100, 0, 25, '0.00', '0.00', '0.00', 1, NULL, NULL),
(167, 353, 0, '伊利舒化牛奶 250ml', '', '1403/26/5332f314c5163.jpg', '4.00', 0.00, 1, 0, 0, 1395756779, 255, 0, '<img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/13958197138277.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395819713463342.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395819713951445.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395819714467295.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395819715278529.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395819715828064.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395819716462119.jpg" />', 1, 0, 100, 0, 20, '0.00', '0.00', '0.00', 1, NULL, NULL),
(173, 351, 0, '哇哈哈矿泉水 596ml', '', '1403/26/5332bd71e2261.jpg', '1.50', 0.00, 1, 0, 0, 1395834225, 255, 0, '<img alt="" src="./data/upload/editer/image/2014/03/26/5332bd6731a55.jpg" /><br />\r\n<img alt="" src="./data/upload/editer/image/2014/03/26/5332bd6808ffa.jpg" /><br />', 0, 0, 100, 0, 37, '0.00', '0.00', '0.00', 1, NULL, NULL),
(174, 351, 0, '雪花啤酒 330ml 罐装', '', '1403/26/5332c0cfb3258.jpg', '2.50', 0.00, 1, 0, 0, 1395835087, 255, 0, '<p align="left" style="background:white;text-align:left;line-height:150%;">\r\n	<b><span style="color:black;line-height:150%;font-family:宋体;font-size:15pt;">产品特色：</span></b>\r\n</p>\r\n<p align="left" style="background:white;text-align:left;line-height:150%;">\r\n	<strong>优质选材</strong>\r\n</p>\r\n<p style="line-height:24px;font-family:微软雅黑;font-size:16px;">\r\n	精选上等啤酒花、麦芽等为主要原料精心酿制而成，品质天然上乘\r\n</p>\r\n<p style="line-height:24px;font-family:微软雅黑;font-size:16px;">\r\n	<strong>醇厚口感</strong>\r\n</p>\r\n<p style="line-height:24px;font-family:微软雅黑;font-size:16px;">\r\n	入口顺滑，醇浓细腻，蕴含淡淡的麦芽混合成熟的啤酒花香味\r\n</p>\r\n<p style="line-height:24px;font-family:微软雅黑;font-size:16px;">\r\n	<strong>科学工艺</strong>\r\n</p>\r\n<p style="line-height:24px;font-family:微软雅黑;font-size:16px;">\r\n	经现代先进工艺加工，使得原料充分融合，滋味纯正，轻松享受\r\n</p>\r\n<p style="line-height:24px;font-family:微软雅黑;font-size:16px;">\r\n	<strong>精美包装</strong>\r\n</p>\r\n<p style="line-height:24px;font-family:微软雅黑;font-size:16px;">\r\n	内置独立易拉罐装，饮用方便，是您休闲时刻、朋友聚会的上选之品\r\n</p>\r\n<p style="line-height:24px;font-family:微软雅黑;font-size:16px;">\r\n	<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/139583554871461.jpg" /><img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395835549088126.jpg" /><img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/139583554945292.jpg" />\r\n</p>\r\n<p style="line-height:24px;font-family:微软雅黑;font-size:16px;">\r\n	<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395835549814159.jpg" /><img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395835550214288.jpg" />\r\n</p>\r\n<p style="line-height:24px;font-family:微软雅黑;font-size:16px;">\r\n	<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/139583555063488.jpg" />\r\n</p>\r\n<p style="line-height:24px;font-family:微软雅黑;font-size:16px;">\r\n	<br />\r\n</p>\r\n<p align="left" style="background:white;text-align:left;line-height:150%;">\r\n	<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395835550984977.jpg" />\r\n</p>', 0, 1, 100, 0, 38, '0.00', '0.00', '0.00', 1, NULL, NULL),
(148, 353, 0, '加多宝凉茶', '', '1403/23/532eb04054767.jpg', '3.50', 0.00, 1, 0, 0, 1395568704, 255, 0, '<p>\r\n	<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821759719299.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821760162575.jpg" /><img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821760594265.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821761018806.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821761523690.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821762045095.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821762764111.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821763225104.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821764399511.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821764933030.jpg" /> \r\n</p>', 0, 1, 100, 0, 17, '0.00', '0.00', '0.00', 1, NULL, NULL),
(169, 353, 0, '雪碧 2L瓶装', '', '1403/26/5332a42b815c4.jpg', '6.00', 0.00, 1, 0, 0, 1395827755, 255, 0, '<img alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395828037813042.jpg" /><span style="font-size:14px;"> <span style="font-size:14px;">“雪碧”一词，音译自英语Sprite，原意为妖怪、精灵。作为一种饮料，把它译为“雪碧”可谓是煞费苦心。 在汉语中，雪碧有纯洁、清凉的含义，使人在炎热的夏季里联想到一片纷飞的白雪，一潭清澈的碧水，顿时 有一种清凉之感，产生“挡不住的诱惑”。这样的饮料名，听着就想喝。这样的字又何止“一字千金”呢？ “雪碧”一贯奉行世界级明星代言策略，国际天后张惠妹、世界跳水皇后伏明霞等先后倾情演绎年轻、时尚 的品牌内涵，广告语“晶晶亮，透心凉”曾成为年轻一代人争相传颂的“歌谣”，其品牌知名度几乎是家喻 户晓、妇儒皆知，“雪碧”已成为我国柠檬味碳酸饮料市场的绝对领导品牌。</span> <img style="margin:10px;float:none;" alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/139582803822270.jpg" /></span>', 0, 0, 100, 0, 25, '0.00', '0.00', '0.00', 1, NULL, NULL),
(149, 347, 0, '康师傅方便面 桶装', '', '1403/23/532eb43585398.jpg', '4.00', 0.00, 1, 0, 0, 1395569717, 255, 0, '<img style="margin:10px;float:none;" alt="alt" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821675821174.jpg" /> \r\n<p>\r\n	<img style="margin:10px;float:none;" alt="alt" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/139582167638174.jpg" /> \r\n</p>\r\n<p>\r\n	<img style="margin:10px;float:none;" alt="alt" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821676859063.jpg" /> \r\n</p>\r\n<p>\r\n	<img style="margin:10px;float:none;" alt="alt" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821677417574.jpg" /> \r\n</p>', 0, 0, 100, 0, 18, '0.00', '0.00', '0.00', 1, NULL, NULL),
(150, 353, 0, '优乐美奶茶', '', '1403/23/532eb8e1190d2.jpg', '3.00', 0.00, 1, 0, 0, 1395570913, 255, 0, '<p>\r\n	<span style="font-size:14px;">规格：80/杯</span> \r\n</p>\r\n<p>\r\n	<span style="font-size:14px;">产地：中国</span> \r\n</p>\r\n<p>\r\n	<span style="font-size:14px;">食用方法：冲泡</span> \r\n</p>\r\n<p>\r\n	<span style="font-size:14px;">贮存方法：阴凉干燥避光处</span> \r\n</p>\r\n<p>\r\n	<span style="font-size:14px;">作 为目前世界上最大的专业生产和销售果冻布丁的食品企业，广东喜之郎集团有限公司已有14年的创业历史。它创建于1993年，拥有“喜之郎”、“水晶之 恋”、“CICI”、“美好时光”等果冻布丁和海苔行业知名品牌。多年来，喜之郎产品一直稳居全国市场占有率第一位，并多次被评为“消费者最喜爱产品”、 “最畅销产品”，是中国营养学会、中国消费者协会推荐产品，我们的“喜之郎牌果冻”品牌更在2004年获得“中国名牌”之殊荣。 2007年，喜之郎家族成员优乐美奶茶以原味、香草、麦香、咖啡、巧克力、草莓、香芋和红豆八种面孔全新登场！</span> \r\n</p>\r\n<p>\r\n	<img style="margin:10px;float:none;" alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821599059845.jpg" /> \r\n</p>\r\n<p>\r\n	<img style="margin:10px;float:none;" alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821599565706.jpg" /> <img style="margin:10px;float:none;" alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821600097981.jpg" /> <img style="margin:10px;float:none;" alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821601334376.jpg" /> <img style="margin:10px;float:none;" alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821602518122.jpg" /> \r\n</p>', 0, 0, 100, 0, 19, '0.00', '0.00', '0.00', 1, NULL, NULL),
(151, 353, 0, '伊利优酸乳', '', '1403/23/532edb63bd671.jpg', '2.00', 0.00, 1, 0, 0, 1395579747, 255, 0, '<p>\r\n	<span style="color:#FF00FF;"><strong><span style="font-family:simhei;"><span style="font-size:18px;">商品特色：</span></span></strong></span> \r\n</p>\r\n<p>\r\n	<span style="color:#FF00FF;"><strong><span style="font-family:simhei;"><span style="font-size:18px;">&nbsp; &nbsp; 挑选天然的纯正牛奶，加入科学配比的“优+活性益生元”，富含多种健康元素，不仅增强免疫力，能激活人体益生菌繁殖，有益身体吸收，并源源不断地给身体提供能量，保证全面吸收，让你活力十足。酸甜浓滑，口口都那么有滋有味！伊利优酸乳，我要我的滋味！</span></span></strong></span> \r\n</p>\r\n<p>\r\n	<img alt="" src="./data/upload/editer/image/2014/03/23/532edb21e2848.jpg" /><br />\r\n<img alt="" src="./data/upload/editer/image/2014/03/23/532edb2cccb35.jpg" /><br />\r\n<img alt="" src="./data/upload/editer/image/2014/03/23/532edb2f543e4.jpg" /> \r\n</p>', 0, 1, 200, 0, 20, '0.00', '0.00', '0.00', 1, NULL, NULL),
(152, 350, 0, '有友泡椒凤爪', '', '1403/24/532f9efcc6365.jpg', '3.00', 0.00, 1, 0, 0, 1395629820, 255, 0, '<p>\r\n	<img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821484468866.png" /><img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821485056563.png" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/139582148665951.jpg" /> \r\n</p>\r\n<p>\r\n	<span style="font-size:14px;"><span style="color:#000000;"><strong>办公室白领休闲食品首选，好东西要和好朋友一起分享</strong></span></span><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821487185310.jpg" /> \r\n</p>\r\n<p>\r\n	<span style="font-size:14px;"><span style="color:#000000;"><strong><span style="font-family:simsun;"><span style="background-color:white;">温馨提示：有友公司遵照最新食品法，变换了制作工艺（双氧水漂白取消了） 现全国所有的凤爪颜色都变的偏黄了 没之前的那么白，特此声明一下以免大家误以为是质量问题。</span></span></strong></span></span> \r\n</p>\r\n<p>\r\n	<span style="font-size:14px;"><span style="color:#000000;"><strong><span style="font-family:simsun;"><span style="background-color:white;"></span></span></strong></span></span> \r\n</p>\r\n<p style="text-align:center;">\r\n	<span style="font-size:14px;"><span style="color:#000000;"><strong><span style="font-family:simsun;"><span style="background-color:white;"><strong><span style="font-family:microsoft yahei;">辣椒：可增强力，改善怕冷、冻伤、血管性头痛等。同时辣椒中含有一种物殊物质，能加速新陈代谢，促进荷尔蒙分泌，保护皮肤。富含的维C可以美白，以及控制心脏病及冠状动脉硬化，降低胆固醇。含有较多抗氧化物质，可预防癌症及其他慢性疾病。可以使呼吸道畅通，用以治疗咳嗽、感冒。辣椒还能杀抑胃腹内的寄生虫。</span></strong></span></span></strong></span></span> \r\n</p>\r\n<p>\r\n	<span style="font-size:14px;"><span style="color:#000000;"><strong><span style="font-family:simsun;"><span style="background-color:white;"><strong><span style="font-family:microsoft yahei;"></span></strong></span></span></strong></span></span> \r\n</p>\r\n<p>\r\n	<span style="font-size:14px;"><span style="color:#000000;"><strong><span style="font-family:simsun;"><span style="background-color:white;"><strong><span style="font-family:microsoft yahei;"><span style="font-size:14px;"><span style="color:#000000;"><strong><span style="font-family:simsun;"><span style="background-color:white;"><strong><span style="font-family:microsoft yahei;">鸡 爪:鸡爪的营养价值颇高，含有丰富的钙质及胶原蛋白，多吃不但能软化血管，同时具有美容功效。</span></strong></span></span></strong></span></span></span></strong></span></span></strong></span></span> \r\n</p>\r\n<p>\r\n	<img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/139582148779027.jpg" /> \r\n</p>\r\n<p>\r\n	<span style="font-size:14px;"><span style="color:#000000;">产品名称：有友 泡凤爪（山椒味）<br />\r\n产品规格：80g/袋<br />\r\n产品配料：鸡爪、泡椒、食用盐、味精、白砂糖、食品添加剂、酵母抽提物、食用香精、食用香料、香辛料</span></span> \r\n</p>\r\n<p>\r\n	<span style="font-size:14px;"><span style="color:#000000;">保 质 期：6个月<br />\r\n生产日期：库存随时更新，均为最新出产<br />\r\n储存方法：阴凉、避光、防潮、勿压<br />\r\n<br />\r\n产品描述：以优质鸡爪为原料，用复合乳酸菌种与天然香料，人工控制发酵方法泡制而成。新产品色泽天然，香辣纯正，略带乳酸味，鸡肉的鲜香与泡菜的爽脆相结合，营养丰富，好吃又开胃。佐餐伴酒、休闲旅游皆为上品。<br />\r\n<br />\r\n有友凤爪口味一级棒，以其鲜、辣的特色味道征服了很多嘴刁的客人，使他们一买再买，甚至整箱购买或联合单位同事一起购买，可以说是百吃不腻。不论是作为零食，还是作为下酒小菜，都是非常合适的。虽然辣，但是依然放不下，这，就是有友泡凤爪的魅力吧。</span></span> \r\n</p>\r\n<p>\r\n	<img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821488847612.jpg" /> \r\n</p>', 1, 0, 100, 0, 21, '0.00', '0.00', '0.00', 1, NULL, NULL);
INSERT INTO `weixin_item` (`id`, `cate_id`, `orig_id`, `title`, `intro`, `img`, `price`, `rates`, `type`, `comments`, `cmt_taobao_time`, `add_time`, `ordid`, `status`, `info`, `news`, `tuijian`, `goods_stock`, `buy_num`, `brand`, `pingyou`, `kuaidi`, `ems`, `free`, `color`, `size`) VALUES
(170, 353, 0, '可口可乐 300ml 瓶装', '', '1403/26/5332a518ce6c8.jpg', '3.00', 0.00, 1, 0, 0, 1395827992, 255, 0, '<img alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395828037813042.jpg" /> <span style="font-size:14px;">“</span><span style="font-size:14px;">雪碧</span><span style="font-size:14px;">”</span><span style="font-size:14px;">一词，音译自英语</span><span style="font-size:14px;">Sprite</span><span style="font-size:14px;">，原意为妖怪、精灵。作为一种饮料，把它译为</span><span style="font-size:14px;">“</span><span style="font-size:14px;">雪碧</span><span style="font-size:14px;">”</span><span style="font-size:14px;">可谓是煞费苦心。 在汉语中，雪碧有纯洁、清凉的含义，使人在炎热的夏季里联想到一片纷飞的白雪，一潭清澈的碧水，顿时 有一种清凉之感，产生</span><span style="font-size:14px;">“</span><span style="font-size:14px;">挡不住的诱惑</span><span style="font-size:14px;">”</span><span style="font-size:14px;">。这样的饮料名，听着就想喝。这样的字又何止</span><span style="font-size:14px;">“</span><span style="font-size:14px;">一字千金</span><span style="font-size:14px;">”</span><span style="font-size:14px;">呢？ </span><span style="font-size:14px;">“</span><span style="font-size:14px;">雪碧</span><span style="font-size:14px;">”</span><span style="font-size:14px;">一贯奉行世界级明星代言策略，国际天后张惠妹、世界跳水皇后伏明霞等先后倾情演绎年轻、时尚 的品牌内涵，广告语</span><span style="font-size:14px;">“</span><span style="font-size:14px;">晶晶亮，透心凉</span><span style="font-size:14px;">”</span><span style="font-size:14px;">曾成为年轻一代人争相传颂的</span><span style="font-size:14px;">“</span><span style="font-size:14px;">歌谣</span><span style="font-size:14px;">”</span><span style="font-size:14px;">，其品牌知名度几乎是家喻 户晓、妇儒皆知，</span><span style="font-size:14px;">“</span><span style="font-size:14px;">雪碧</span><span style="font-size:14px;">”</span><span style="font-size:14px;">已成为我国柠檬味碳酸饮料市场的绝对领导品牌。 </span><img alt="" src="/data/upload/editer/image/2014/03/26/5332a50ad9236.jpg" />', 0, 1, 100, 0, 25, '0.00', '0.00', '0.00', 1, NULL, NULL),
(153, 349, 0, '好牌阿胶蜜枣 258g', '', '1403/24/532fa2e2b3808.jpg', '5.00', 0.00, 1, 0, 0, 1395630818, 255, 0, '<p>\r\n	<img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821410144435.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/139582141081489.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821411468979.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821412058082.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821413731364.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/139582141432211.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821415067300.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/139582141563786.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/139582141623114.jpg" /><img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821416995963.jpg" /> \r\n</p>', 1, 0, 99, 1, 22, '0.00', '0.00', '0.00', 1, NULL, NULL),
(154, 347, 0, '旺旺雪饼 84g', '', '1403/24/532fa86de261a.jpg', '5.00', 0.00, 1, 0, 0, 1395632237, 255, 0, '<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821155624073.jpg" /><img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/139582115628822.jpg" /><img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395821156747843.jpg" />', 1, 0, 100, 0, 23, '0.00', '0.00', '0.00', 1, NULL, NULL),
(155, 353, 0, '旺仔牛奶', '', '1403/24/532faab24701a.jpg', '5.00', 0.00, 1, 0, 0, 1395632818, 255, 0, '<img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395820738388980.jpg" /> \r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/139582073965756.jpg" /> \r\n</p>\r\n<p>\r\n	<b>产品特色：</b> \r\n</p>\r\n<p>\r\n	富含人体每日必须的多种氨基酸、钙、脂肪、维生素等营养成份，包装设计体面大方，定价合理。专为成长中的儿童设计的风味乳品，更是馈赠亲友的理想选择。\r\n</p>', 0, 1, 100, 0, 23, '0.00', '0.00', '0.00', 1, NULL, NULL),
(156, 353, 0, '可口可乐 罐装', '', '1403/24/532fb022a5b38.jpg', '2.00', 0.00, 1, 0, 0, 1395634210, 255, 0, '<p>\r\n	<span style="font-family:微软雅黑;">可口可乐（英文名称：Coca-Cola，也称Coke），是由美国可口可乐公司出品的一种含有咖啡因的碳酸饮料。可口可乐早期在中国的译名作“蝌蝌啃蜡”，但因销路不佳，后改名为“可口可乐”。</span> \r\n</p>\r\n<p>\r\n	<span style="font-family:微软雅黑;"></span><img style="margin:10px;float:none;" alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395820672835767.jpg" /> \r\n</p>\r\n<p>\r\n	<img style="margin:10px;float:none;" alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395820673865239.jpg" /> \r\n</p>', 0, 1, 100, 0, 25, '0.00', '0.00', '0.00', 1, NULL, NULL),
(157, 353, 0, '百事可乐 罐装', '', '1403/24/532fc95f5e78d.jpg', '2.00', 0.00, 1, 0, 0, 1395640671, 255, 0, '<img style="margin:10px;float:none;" alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395820620674828.jpg" /> <img style="margin:10px;float:none;" alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395820621226255.jpg" /><img style="margin:10px;float:none;" alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395820621726325.jpg" />', 0, 1, 100, 0, 24, '0.00', '0.00', '0.00', 1, NULL, NULL),
(158, 353, 0, '伊利经典牛奶 250ml*12', '', '1403/24/532fcd28dfc4d.jpg', '70.00', 0.00, 1, 0, 0, 1395641640, 255, 0, '<img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395820525683047.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/13958205263688.jpg" /><img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395820526891148.jpg" /> \r\n<p>\r\n	<br />\r\n</p>', 1, 0, 100, 0, 20, '0.00', '0.00', '0.00', 1, NULL, NULL),
(159, 347, 0, '达利园 可比克薯片 60g', '', '1403/25/53310f924f6f6.jpg', '4.00', 0.00, 1, 0, 0, 1395724178, 255, 0, '<p>\r\n	<span style="font-size:14px;">福建达利食品有限公司创办于1989年9月，始终秉承以科技为先导、以先进的现代化管理为依托、以“顾客满意第一”为宗旨的经营方针，发展成为一家致力于研发和制造健康美味食品的大型集团化民营企业。</span>\r\n</p>\r\n<p>\r\n	<span style="font-size:14px;">历经20年的风雨历程，达利集团旗下的“达利园”、“好吃点”、“可比克”已成为市场上家喻户晓的三大品牌，达利在走品牌创新和建设的道路上创造出一块又一块丰碑： 2004年“达利园”派类食品被国家质量监督检验检疫总局授予“中国名牌产品”称号；2005年，“达利”图形商标荣获中国 驰名商标；2006年，“达利”饼干被国家质量监督检验检疫总局授予“中国名牌产品”称号；同年，达利集团被国家统计局授予“中国食品行业饼干行业十强企业”，被中国食品工业协会授予“2005－2006年度全国食品工业优秀龙头食品企业”；2008年集团再次被中国食品工业协会授予“2007－2008年度全国食品工业优秀龙头食品企业”，这是达利集团自05年开始连续三次获此殊荣；2009年“达利”品牌荣获“福建改革开放三十年最具影响力、贡献力品牌”。</span>\r\n</p>\r\n<p>\r\n	<span style="font-size:14px;">配 料：马铃薯粉、精炼植物油、淀粉、变性淀粉、玉米粉、牛肉味调味料（牛肉粉、辣椒粉、食用盐、白砂糖、谷氨酸钠、淀粉、复合香辛料、酱油粉、柠檬黄、日落黄）、食用盐、乳化剂、食用香料。</span>\r\n</p>\r\n<p>\r\n	&nbsp;<img alt="" src="/data/upload/editer/image/2014/03/25/533111d43255d.jpg" />\r\n</p>', 0, 1, 100, 0, 26, '0.00', '0.00', '0.00', 1, NULL, NULL),
(160, 347, 0, '斗牛士 牛肉干 62g', '', '1403/25/5331274906367.jpg', '8.00', 0.00, 1, 0, 0, 1395730249, 255, 0, '<img width="735" height="66" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395820428843939.jpg" border="0" /> \r\n<div>\r\n	<img width="669" height="484" align="middle" style="width:601px;height:398px;" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395820429298974.jpg" /> \r\n</div>\r\n<div>\r\n	绿色环保的古蔺老山区\r\n</div>\r\n<div>\r\n	<img align="middle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395820429785517.jpg" /> \r\n</div>\r\n<div>\r\n	古蔺山区的绿色牧场\r\n</div>\r\n<div>\r\n	<img align="middle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395820430257189.jpg" /> \r\n</div>\r\n<div>\r\n	优良品种黄牛\r\n</div>\r\n<div>\r\n	<img align="middle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395820430728964.jpg" /> \r\n</div>\r\n<div>\r\n	<img align="middle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395820431236243.jpg" /> \r\n</div>\r\n<div>\r\n	<img align="middle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/139582043171736.jpg" /> \r\n</div>\r\n<div>\r\n	<img align="middle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395820432167995.jpg" /> \r\n</div>', 0, 1, 100, 0, 27, '0.00', '0.00', '0.00', 1, NULL, NULL),
(161, 347, 0, '统一方便面 袋装', '', '1403/25/5331392426475.jpg', '2.50', 0.00, 1, 0, 0, 1395734820, 255, 0, '<p>\r\n	<img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/139582033894165.jpg" /> \r\n</p>\r\n<p>\r\n	<img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/139582033945334.jpg" /> \r\n</p>\r\n<p>\r\n	<img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395820339898819.jpg" /> \r\n</p>\r\n<p>\r\n	<img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395820340383098.jpg" /> \r\n</p>', 0, 0, 100, 0, 31, '0.00', '0.00', '0.00', 1, NULL, NULL),
(162, 347, 0, '康师傅方便面 袋装', '', '1403/25/53313d63af937.jpg', '2.50', 0.00, 1, 0, 0, 1395735907, 255, 0, '<p>\r\n	<img align="middle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395820113944817.jpg" /> \r\n</p>\r\n<p style="line-height:13.5pt;text-indent:18pt;margin-top:0pt;margin-bottom:0pt;">\r\n	<span style="color:#000000;font-family:宋体;font-size:14px;">吃法说明：</span><span style="color:#000000;font-family:宋体;font-size:9pt;"></span> \r\n</p>\r\n<p style="line-height:13.5pt;text-indent:18pt;margin-top:0pt;margin-bottom:0pt;">\r\n	<span style="color:#000000;font-family:宋体;font-size:14px;">1.将杯盖掀开，取出所有调味包，撕开倒入杯内，注</span><span style="color:#000000;font-family:宋体;font-size:9pt;"></span> \r\n</p>\r\n<p style="line-height:13.5pt;margin-top:0pt;margin-bottom:0pt;">\r\n	<span style="color:#000000;font-family:宋体;font-size:14px;">　　入沸腾开水至八分</span> \r\n</p>\r\n<p>\r\n	<span style="font-size:14px;">2.盖紧杯盖，待三分钟後拌匀即可食用。</span> \r\n</p>\r\n<p>\r\n	<img align="middle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395820114478639.jpg" /> \r\n</p>', 0, 0, 100, 0, 18, '0.00', '0.00', '0.00', 1, NULL, NULL),
(163, 348, 0, '老灶煮花生 72g', '', '1403/25/5331418b2fcbf.jpg', '3.00', 0.00, 1, 0, 0, 1395736971, 255, 0, '<p style="margin-right:0px;" dir="ltr">\r\n	<span style="font-size:14px;">"</span><span style="font-size:14px;">老灶煮花生</span><span style="font-size:14px;">"</span><span style="font-size:14px;">选用优质的四川花生，经过精心加工制作，以优质的产品质量和优良的品质，奉献给每一位消费者，让我们享受具有传统风味的姚氏老灶煮花生。花生粒粒饱满，加工颗粒均匀，保证无烂花生，经传统工艺秘制而成，迎合大众口味，老少皆宜，而且健康，不含防腐剂。 口感酥脆，浓浓的花生香味，回味无穷，让你越吃越想吃</span><span style="font-size:14px;">~~~~</span> \r\n</p>\r\n<p style="margin-right:0px;" dir="ltr">\r\n	<img alt="" src="/data/upload/editer/image/2014/03/25/533141848487d.jpg" /><span style="font-size:14px;"></span> \r\n</p>', 1, 1, 100, 0, 32, '0.00', '0.00', '0.00', 1, NULL, NULL),
(164, 347, 0, '酒鬼花生 70g', '', '1403/25/5331458a74bf3.jpg', '4.00', 0.00, 1, 0, 0, 1395737994, 255, 0, '<img style="margin:10px;float:none;" alt="alt" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395820014949118.jpg" /> <img style="margin:10px;float:none;" alt="alt" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395820015519479.jpg" /> <img style="margin:10px;float:none;" alt="alt" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395820016146768.jpg" />', 1, 1, 100, 0, 33, '0.00', '0.00', '0.00', 1, NULL, NULL),
(172, 351, 0, '农夫山泉 550ml', '', '1403/26/5332ae05b766d.jpg', '1.50', 0.00, 1, 0, 0, 1395830277, 255, 0, '<img alt="" src="/data/upload/editer/image/2014/03/26/5332ad753bba7.jpg" /><img alt="" src="/data/upload/editer/image/2014/03/26/5332adff8384f.png" />', 0, 0, 100, 0, 36, '0.00', '0.00', '0.00', 1, NULL, NULL),
(165, 349, 0, '喜之郎果冻 200g', '', '1403/25/53316e812f1d6.jpg', '3.50', 0.00, 1, 0, 0, 1395748481, 255, 0, '<img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395819963046298.jpg" /> <img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395819963445647.jpg" /> <img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395819964456384.jpg" />', 1, 1, 100, 0, 34, '0.00', '0.00', '0.00', 1, NULL, NULL),
(166, 347, 0, '江南美食豌豆 88g', '', '1403/25/53317a9fc76b9.jpg', '3.50', 0.00, 1, 0, 0, 1395751583, 255, 0, '<img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395819854936242.jpg" /> <img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395819855368205.jpg" /> <img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395819855763865.jpg" /> <img align="absMiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395819856244340.jpg" />', 1, 0, 100, 0, 35, '0.00', '0.00', '0.00', 1, NULL, NULL),
(190, 355, 0, '特仑苏有机奶250ml×12盒 ', '', '1405/26/53832a424e8cd.jpg', '69.00', 0.00, 1, 0, 0, 1401104183, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;"><s>超市价格：76元</s></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">69</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401104645981776.jpg" /> \r\n</p>\r\n<p>\r\n	<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401104646938085.jpg" /> \r\n</p>\r\n<p>\r\n	<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401104647367845.jpg" /> \r\n</p>\r\n<p>\r\n	<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/140110464777422.jpg" /> \r\n</p>', 0, 0, 100, 0, 45, '0.00', '0.00', '0.00', 1, NULL, NULL),
(171, 353, 0, '芬达香橙味 330ml罐装', '', '1404/17/534f7bce4f22d.jpg', '2.00', 0.00, 1, 0, 0, 1395828449, 255, 0, '<br />\r\n<span style="font-size:14px;">芬达是世界上最畅销的果味汽水，其名字源于 </span><span style="font-size:14px;">“</span><span style="font-size:14px;">Fantasy</span><span style="font-size:14px;">” </span><span style="font-size:14px;">一字， 取其</span><span style="font-size:14px;">”</span><span style="font-size:14px;">开怀，有趣</span><span style="font-size:14px;">”</span><span style="font-size:14px;">的含义。</span><span style="font-size:14px;">2005</span><span style="font-size:14px;">年，</span><span style="font-size:14px;">[</span><span style="font-size:14px;">芬达</span><span style="font-size:14px;">]</span><span style="font-size:14px;">建立</span><span style="font-size:14px;">“</span><span style="font-size:14px;">芬达笑园</span><span style="font-size:14px;">”</span><span style="font-size:14px;">，带来不一样的笑</span><span style="font-size:14px;">园生活，为每日规范的生活 添加一点缤纷色彩，成为消费者心目中的</span><span style="font-size:14px;">“</span><span style="font-size:14px;">开心乐源</span><span style="font-size:14px;">”</span><span style="font-size:14px;">。</span><span style="font-size:14px;">[</span><span style="font-size:14px;">芬达</span><span style="font-size:14px;">]</span><span style="font-size:14px;">橙汁碳酸饮料，带给你不一样的校园生活，在 里边你可以无时无刻发现惊喜，你更可以自己创造出乎意料之外的快乐，及欢乐发带给你的朋友。</span><span style="font-size:14px;">[</span><span style="font-size:14px;">芬达</span><span style="font-size:14px;">]</span><span style="font-size:14px;">吸引 人的色彩及令人振奋的水果口味，把你从每日规范的生活中解脱出来，令你的开心脉搏加快。来好好享受一下 不一样的开心滋味吧</span><span style="font-size:14px;">!</span><img alt="" src="./data/upload/editer/image/2014/03/26/5332a694780dc.jpg" /><br />\r\n<img alt="" src="./data/upload/editer/image/2014/03/26/5332a69673467.jpg" /><br />', 1, 0, 100, 0, 25, '0.00', '0.00', '0.00', 1, NULL, NULL),
(175, 351, 0, '青岛啤酒 330ml', '', '1403/26/5332c29579881.jpg', '4.00', 0.00, 1, 0, 0, 1395835541, 255, 0, '<img alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395835930145932.jpg" /> <img alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395835930953736.png" />', 0, 1, 100, 0, 39, '0.00', '0.00', '0.00', 1, NULL, NULL),
(176, 351, 0, '哈尔滨啤酒 330ml 罐装', '', '1403/26/5332c438b5d7e.jpg', '3.00', 0.00, 1, 0, 0, 1395835960, 255, 0, '<img alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395836408646123.jpg" /> \r\n<p>\r\n	<span style="font-size:14px;">&nbsp;</span><span style="color:#333333;"><span style="font-size:14px;">哈尔滨小麦王啤酒以其麦香浓郁、口味清丽的特点在名酒之林独树帜。哈尔滨小麦王特别选用优质的白皮小麦，采用哈啤的传统工艺。观感享受，回味悠长是其突出的两大特点。将哈尔滨小麦王倒入杯中，洁白、细腻的泡沫立即泛起，丰富而持久；金黄的酒体，澄清、诱人；轻轻摇晃酒杯，仿佛白云皑皑，麦浪翻滚，令人遐想无限。把哈尔滨小麦王放置唇边，一股浓郁的小麦芬芳扑面而来；饮酒入喉，唇齿生香，沁人心脾 </span><img style="margin:10px;float:none;" alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395836409213151.jpg" /></span> \r\n</p>', 1, 1, 190, 0, 40, '0.00', '0.00', '0.00', 1, NULL, NULL),
(178, 351, 0, '青岛纯生啤酒 500ml 罐装', '', '1403/26/5332c6e93f2e5.jpg', '5.50', 0.00, 1, 0, 0, 1395836649, 255, 0, '<img alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395837092885046.jpg" /> \r\n<p>\r\n	<span style="font-size:14px;">青岛啤酒产自青岛啤酒股份有限公司，公司的前身是国营青岛啤酒厂, 1903年由英、德两国商人合资开办，是我国最早的啤酒生产企业。</span><br />\r\n<span style="font-size:14px;"> 青岛啤酒选用优质大麦、大米、上等啤酒花和软硬适度、洁净甘美的天然矿泉水为原料酿制而成。酒液清澈透明、呈淡黄色，泡沫清白、细腻而持久。</span> \r\n</p>\r\n<span style="font-size:14px;">规格：</span><span style="font-size:14px;">500ml*1</span><br />\r\n<span style="font-size:14px;">产地：中国</span><br />\r\n<span style="font-size:14px;"> 保质期：</span><span style="font-size:14px;">365</span><span style="font-size:14px;">天</span><br />\r\n<span style="font-size:14px;"> 食用方法：开罐即饮</span><br />\r\n<span style="font-size:14px;"> 贮存方法：置于干燥阴凉处</span> \r\n<p>\r\n	<span style="font-size:14px;">商品特色：</span><br />\r\n<span style="font-size:14px;"> 纯生啤酒是指不经过高温杀菌而保质期同样能达到熟啤酒的标准的啤酒，它与普通啤酒的区别是风味稳定性好（随着储存期的延长，风味变化不大）口感好，营养丰富，可以说纯生啤酒好比新鲜水果，熟啤酒只能是水果罐头。</span> \r\n</p>\r\n<p>\r\n	<span style="font-size:14px;">本款纯生，品位高、档次高、口感新鲜、酒香清纯、口味柔和、品质上乘。</span> \r\n</p>\r\n<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/139583709333276.jpg" />', 0, 0, 100, 0, 39, '0.00', '0.00', '0.00', 1, NULL, NULL),
(179, 353, 0, '营养快线 500ml', '', '1403/26/5332c8c2d2479.jpg', '4.00', 0.00, 1, 0, 0, 1395837122, 255, 0, '<p>\r\n	<span style="font-size:14px;">娃哈哈营养快线，是娃哈哈集团根据中国人独特膳食结构和营养状况，精心研制而成的一种全新的牛奶果昔饮品。</span> \r\n</p>\r\n<p>\r\n	<span style="font-size:14px;">纯正果汁与香浓牛奶的完美结合，让营养快线不但拥有来自牛奶的丰富营养和钙质，而且还有来自果汁的丰富维生素。</span> \r\n</p>\r\n<p>\r\n	<span style="font-size:14px;">营养快线，时尚出跳的包装，清新滑爽的口感，丰富全面的营养，契合了都市人的现代生活节奏，一上市就赢得了</span> \r\n</p>\r\n<p>\r\n	<span style="font-size:14px;">众多消费者的喜爱，成为营养早餐、课间小憩、工作闲暇、聚会旅游的理想选择。</span> \r\n</p>\r\n<p>\r\n	<img alt="alt" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395838271281085.jpg" /> \r\n</p>\r\n<img alt="alt" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395838272494064.jpg" /> \r\n<p>\r\n	<br />\r\n</p>', 0, 1, 100, 0, 37, '0.00', '0.00', '0.00', 1, NULL, NULL),
(180, 353, 0, '红牛 250ml', '', '1403/26/5332ed8cb919d.jpg', '5.50', 0.00, 1, 0, 0, 1395846540, 255, 0, '<br />\r\n<strong style="font-size:12px;"><span style="font-size:14px;">产品特点：</span></strong> <span style="font-size:14px;">● </span><span style="font-size:14px;">红牛维生素功能饮料富含牛磺酸、赖氨酸和</span><span style="font-size:14px;">B</span><span style="font-size:14px;">族维生素</span><span style="font-size:14px;">[ </span><span style="font-size:14px;">肌醇、烟酰胺</span><span style="font-size:14px;">(</span><span style="font-size:14px;">维生素</span><span style="font-size:14px;">PP)</span><span style="font-size:14px;">、维生素</span><span style="font-size:14px;">B6</span><span style="font-size:14px;">、维生素</span><span style="font-size:14px;">B12 ]</span><span style="font-size:14px;">，以及精制白砂糖和适量的咖啡因（符合国家卫生部食品药品监督管理局保健食品注册批件）。</span><br />\r\n<span style="font-size:14px;">●</span><span style="font-size:14px;">各种功能因子在人体新陈代谢中协同作用。</span><br />\r\n<span style="font-size:14px;">●</span><span style="font-size:14px;">特别适合工作学习、会议培训、考试竞赛、熬夜加班、运动健身、长途驾车、户外旅行等场合饮用</span><br />\r\n<img width="690" align="middle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395847000499413.jpg" /><img width="690" align="middle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395847000896250.jpg" />', 0, 0, 100, 0, 42, '0.00', '0.00', '0.00', 1, NULL, NULL),
(181, 353, 0, '脉动 600ml', '', '1403/26/5332eff7831e4.jpg', '4.00', 0.00, 1, 0, 0, 1395847159, 255, 0, '<img alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395847610447517.jpg" /> <img alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395847610785726.jpg" /> <img alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1395847611153284.jpg" /> <img alt="" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/139584761156835.jpg" />', 0, 1, 100, 0, 43, '0.00', '0.00', '0.00', 1, NULL, NULL),
(182, 352, 0, '【礼品一】可口可乐芬达汽水1罐（香橙味）+南溪豆腐干2包', '', '1404/17/534f99e903881.jpg', '0.00', 0.00, 1, 0, 0, 1397140756, 255, 0, '<br />\r\n<p>\r\n	<strong><span style="color:#E53333;font-size:18px;">点击</span></strong><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200496233&amp;idx=1&amp;sn=5a625e275bc52953a0271b13c3def2bd#rd"><strong><span style="color:#003399;font-size:18px;">这里</span></strong></a><strong><span style="color:#E53333;font-size:18px;">查看领取方式</span></strong> \r\n</p>', 0, 0, 992, 5, 44, '0.00', '0.00', '0.00', 1, NULL, NULL),
(183, 352, 0, '【赠品二】可口可乐雪碧1罐+南溪豆腐干2包', '', '1404/15/534d0b898ec10.jpg', '0.00', 0.00, 1, 0, 0, 1397141959, 255, 0, '<br />\r\n<p>\r\n	<strong><span style="color:#E53333;font-size:18px;">点击</span></strong><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200496233&amp;idx=1&amp;sn=5a625e275bc52953a0271b13c3def2bd#rd"><strong><span style="color:#003399;font-size:18px;">这里</span></strong></a><strong><span style="color:#E53333;font-size:18px;">查看领取方式</span></strong> \r\n</p>', 0, 0, 999, 1, 44, '0.00', '0.00', '0.00', 1, NULL, NULL),
(189, 354, 0, '宜宾凉面 【本商城满10元免费送货上门  凭券还可以免费领取凉糕1份】', '', '1404/22/535618e45c2be.jpg', '5.00', 0.00, 1, 0, 0, 1398151396, 255, 0, '<p>\r\n	<span style="font-size:14px;">凉面又称“过水面”，古称为“</span><a href="http://baike.baidu.com/view/76227.htm" target="_blank"><span style="font-size:14px;">冷淘</span></a><span style="font-size:14px;">”，传说最早起源于唐代</span><a href="http://baike.baidu.com/view/2225.htm" target="_blank"><span style="font-size:14px;">武则天</span></a><span style="font-size:14px;">未入宫之前，由于武则天与情人吃山西面时烫伤了舌头，于是两人便研究出凉面的新吃法。</span>\r\n</p>\r\n<div class="para">\r\n	<span style="font-size:14px;">大诗人</span><a href="http://baike.baidu.com/view/2211.htm" target="_blank"><span style="font-size:14px;">杜甫</span></a><span style="font-size:14px;">曾写有《槐叶冷淘》一诗：“青青高槐叶，采掇付中厨。新面来近市，汁滓宛相敷……经齿冷</span><a href="http://baike.baidu.com/view/4296660.htm" target="_blank"><span style="font-size:14px;">于雪</span></a><span style="font-size:14px;">，劝人投此珠。”诗人所说的“槐叶凉面”，是指用鲜嫩的槐叶汁和面后而制成的碧绿面条，绿色本身就是冷色调，再加上煮熟的面条过水而淘，自然会更给人以“凉”的感觉。</span>\r\n</div>\r\n<p>\r\n	<img src="/data/upload/editer/image/2014/04/22/535618c270ad7.jpg" alt="" /> \r\n</p>', 1, 1, 1000, 0, 46, '0.00', '0.00', '0.00', 1, NULL, NULL),
(191, 355, 0, '特仑苏低脂牛奶250ml×12盒', '', '1405/26/53832cac4e349.jpg', '63.00', 0.00, 1, 0, 0, 1401105580, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;"><s>超市价格：68元</s></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">63</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/140110609628134.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401106097083299.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/140110609753815.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401106097998965.jpg" />\r\n</p>', 0, 1, 96, 0, 45, '0.00', '0.00', '0.00', 1, NULL, NULL),
(192, 355, 0, '特仑苏醇纤牛奶250ml×12盒', '', '1405/26/53832ece26c42.jpg', '63.00', 0.00, 1, 0, 0, 1401106126, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;"><s>超市价格：68元</s></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">63</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401106623491939.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401106624363580.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401106624859416.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401106625323383.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401106625897000.jpg" />\r\n</p>', 0, 1, -34, 0, 45, '0.00', '0.00', '0.00', 1, NULL, NULL),
(193, 356, 0, '未来星佳智型儿童成长牛奶190ml*15盒', '', '1405/26/5383353c3190b.jpg', '53.00', 0.00, 1, 0, 0, 1401107772, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;"><s>超市价格：58.5元</s></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">53</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401108194586802.jpg" /><img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401108195238067.jpg" />\r\n</p>', 0, 1, 99, 0, 47, '0.00', '0.00', '0.00', 1, NULL, NULL),
(194, 356, 0, '未来星骨力型儿童成长牛奶190ml*15盒', '', '1405/26/53833ad245fbe.jpg', '53.00', 0.00, 1, 0, 0, 1401109202, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;"><s>超市价格：58.5元</s></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">53</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/140110926932325.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401109270174783.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401109270813573.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401109271471211.jpg" />\r\n</p>', 0, 0, 100, 0, 47, '0.00', '0.00', '0.00', 1, NULL, NULL),
(195, 356, 0, '未来星儿童成长牛奶均养型190ml*15盒', '', '1405/26/53834063e89b3.jpg', '53.00', 0.00, 1, 0, 0, 1401109615, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;"><s>超市价格：58.5元</s></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">53</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401111182731474.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401111183642795.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401111184352057.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/14011111854568.jpg" />\r\n</p>', 0, 0, 100, 0, 47, '0.00', '0.00', '0.00', 1, NULL, NULL),
(196, 357, 0, '早餐奶红谷粒250ml*12盒', '', '1405/26/53834997273a7.jpg', '32.00', 0.00, 1, 0, 0, 1401112937, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<s style="font-size:16px;">超市价格：36元</s>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">32</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401113255092132.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401113256012569.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401113256479966.jpg" />\r\n</p>', 0, 1, 100, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(197, 357, 0, '早餐奶黑谷粒250ml*12盒', '', '1405/26/53834ec987cfa.jpg', '32.00', 0.00, 1, 0, 0, 1401114313, 255, 1, '<p>\r\n	<s style="font-size:16px;">超市价格：36元</s>\r\n</p>\r\n<p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">32</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span><img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401113255092132.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401113256012569.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401113256479966.jpg" />\r\n	</p>\r\n</p>', 0, 1, 99, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(198, 358, 0, '纯牛奶250ml*24盒', '', '1405/26/538357d1eea03.jpg', '45.00', 0.00, 1, 0, 0, 1401116486, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;"><s>超市价格：48元</s></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">45</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img alt="" src="./data/upload/editer/image/2014/05/26/5383573181039.jpg" />\r\n</p>\r\n<img alt="" src="./data/upload/editer/image/2014/05/26/538357338abed.jpg" /><br />\r\n<img alt="" src="./data/upload/editer/image/2014/05/26/53835738b630d.jpg" /><br />', 0, 1, 100, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(199, 358, 0, '高钙奶250ml*16盒', '', '1405/28/53857aab6d8f7.jpg', '46.00', 0.00, 1, 0, 0, 1401256366, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;"><s>超市价格：51元</s></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">46</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401256879688162.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/140125688026854.jpg" /> <img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401256880732381.jpg" /> <img align="absmiddle" src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401256881157280.jpg" />\r\n</p>', 0, 0, 100, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(200, 358, 0, '低脂高钙奶250ml*24盒', '', '1405/28/5385bf0cc1230.jpg', '46.00', 0.00, 1, 0, 0, 1401274124, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;"><s>超市价格：51元</s></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">46</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401274735868425.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401274736726810.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/1401274737137279.jpg" /> <img src="http://bxjkn.img40.wal8.com/img40/410605_20140326144905/140127473763498.jpg" />\r\n</p>', 0, 0, 100, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(224, 367, 0, '蒙牛原味酸酸乳250ml*24盒 ', '', '1405/31/538987668f0a3.jpg', '34.00', 0.00, 1, 0, 0, 1401521598, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;"><s>超市价格：35元</s></span> \r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;background-color:#FFE500;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">34</span><span style="font-size:16px;">元</span></span> \r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span> \r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span> \r\n	</p>\r\n	<p>\r\n		<br />\r\n	</p>\r\n	<p>\r\n		<img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/140152169893922.jpg" /> <img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/140152170014779.jpg" /> <img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401521700439787.jpg" /> \r\n	</p>', 0, 0, 100, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(225, 367, 0, '蒙牛蓝莓味酸酸乳250ml*24盒 ', '', '1405/31/53898a435dd63.jpg', '34.00', 0.00, 1, 0, 0, 1401522755, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;"><s>超市价格：35元</s></span> \r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;background-color:#FFE500;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">34</span><span style="font-size:16px;">元</span></span> \r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span> \r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span> \r\n	</p>\r\n	<p>\r\n		<br />\r\n	</p>\r\n	<p>\r\n		<img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401523085097562.jpg" /><img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401523085838080.jpg" /><img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401523086282060.jpg" /> \r\n	</p>', 0, 0, 100, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(226, 367, 0, '蒙牛草莓味酸酸乳250ml*24盒 ', '', '1405/31/53898ab4802c9.jpg', '34.00', 0.00, 1, 0, 0, 1401522868, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;"><s>超市价格：35元</s></span> \r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;background-color:#FFE500;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">34</span><span style="font-size:16px;">元</span></span> \r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span> \r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span> \r\n	</p>\r\n	<p>\r\n		<br />\r\n	</p>\r\n	<p>\r\n		<img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401523085097562.jpg" /><img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401523085838080.jpg" /><img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401523086282060.jpg" /> \r\n	</p>', 0, 0, 100, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(214, 364, 0, '蒙牛焕轻骨力牛奶250ml*12盒', '', '1405/30/5388a2aec2c49.jpg', '55.00', 0.00, 1, 0, 0, 1401463470, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;"><s>超市价格：59元</s></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">55</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401464015366293.jpg" /><img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401464016483710.jpg" /><img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401464017115664.jpg" /><img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401464017625130.jpg" /> \r\n</p>', 0, 0, 100, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL);
INSERT INTO `weixin_item` (`id`, `cate_id`, `orig_id`, `title`, `intro`, `img`, `price`, `rates`, `type`, `comments`, `cmt_taobao_time`, `add_time`, `ordid`, `status`, `info`, `news`, `tuijian`, `goods_stock`, `buy_num`, `brand`, `pingyou`, `kuaidi`, `ems`, `free`, `color`, `size`) VALUES
(215, 364, 0, '焕轻舒活牛奶250ml×12盒 ', '', '1405/30/5388a596e4c89.jpg', '55.00', 0.00, 1, 0, 0, 1401464214, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;"><s>超市价格：59元</s></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">55</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401464829968027.jpg" /><img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401464830791482.jpg" /><img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401464831351532.jpg" /><img align="absmiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401464832223007.jpg" /> \r\n</p>', 0, 0, 100, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(216, 364, 0, '焕轻骨力配方奶粉500g', '', '1405/30/5388a8439075b.jpg', '65.00', 0.00, 1, 0, 0, 1401464899, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;"><s>超市价格：69元</s></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">65</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img width="790" height="400" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401465430476505.jpg" /><img width="790" height="438" alt=" " src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401465431264096.jpg" /><img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401465431637311.jpg" /> \r\n</p>\r\n<p>\r\n	<img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/14014654320733.jpg" border="0" usemap="#Map" /> \r\n	<map name="Map">\r\n		<a></a><a></a> \r\n	</map>\r\n</p>\r\n<p>\r\n	<a><img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401465432528955.jpg" /> </a> \r\n</p>\r\n<p>\r\n	<a><img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401465433029643.jpg" /> </a> \r\n</p>', 0, 0, 100, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(217, 364, 0, '焕轻舒活配方奶粉500g ', '', '1405/30/5388a8e6447fa.jpg', '65.00', 0.00, 1, 0, 0, 1401465062, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;"><s>超市价格：69元</s></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">65</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img width="790" height="400" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401465430476505.jpg" /><img width="790" height="438" alt=" " src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401465431264096.jpg" /><img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401465431637311.jpg" /> \r\n</p>\r\n<p>\r\n	<img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/14014654320733.jpg" border="0" usemap="#Map" /> \r\n	<map name="Map">\r\n		<a></a><a></a> \r\n	</map>\r\n</p>\r\n<p>\r\n	<a><img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401465432528955.jpg" /> </a> \r\n</p>\r\n<p>\r\n	<a><img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401465433029643.jpg" /> </a> \r\n</p>', 0, 0, 100, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(218, 365, 0, '纯甄风味酸牛奶200g*12盒（丹麦进口菌种）', '', '1405/31/5388ae92b1d8b.jpg', '60.00', 0.00, 1, 0, 0, 1401465846, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;"><s>超市价格：66元</s></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">60</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401466849676920.jpg" /><img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401466850261200.jpg" /><img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/140146685072312.jpg" /><img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401466851582970.jpg" />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 0, 1, 98, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(219, 356, 0, '大眼萌香蕉牛奶饮品190ml*12盒', '', '1405/31/5388b07a5470e.jpg', '43.00', 0.00, 1, 0, 0, 1401467002, 255, 1, '<p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;"><s>超市价格：48元</s></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="background-color:#FFE500;font-size:16px;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">43</span><span style="font-size:16px;">元</span></span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;">货到付款，</span><span style="line-height:21px;font-size:16px;">免费</span><span style="font-size:16px;">送货上门。</span>\r\n	</p>\r\n	<p style="white-space:normal;">\r\n		<span style="font-size:16px;">查看</span><span style="font-size:16px;"><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank">购物帮助</a></span>\r\n	</p>\r\n</p>\r\n<p>\r\n	<img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401467571163169.jpg" /><img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401467572042971.jpg" /><img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401467572581241.jpg" /><img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401467573054140.jpg" />\r\n</p>', 1, 0, 99, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL),
(227, 367, 0, '蒙牛AD钙酸酸乳250ml*24盒 ', '', '1405/31/53898b251ddd1.jpg', '34.00', 0.00, 1, 0, 0, 1401522981, 1, 1, '<p>\r\n	<span style="font-size:16px;"><s>超市价格：35元</s></span> \r\n</p>\r\n<p>\r\n	<span style="font-size:16px;background-color:#FFE500;">优客来价格：</span><span style="background-color:#FFE500;"><span style="font-size:24px;">34</span><span style="font-size:16px;">元</span></span> \r\n</p>\r\n<p>\r\n	<span><span style="font-size:16px;">江安城区</span><span style="line-height:21px;font-size:16px;white-space:normal;">货到付款，</span><span style="line-height:21px;font-size:16px;white-space:normal;">免费</span><span style="font-size:16px;">送货上门。</span></span> \r\n</p>\r\n<p>\r\n	<span><span style="font-size:16px;">查看</span><a href="http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&amp;mid=200497229&amp;idx=1&amp;sn=44b534479abc812959ab387496df0d59#rd" target="_blank"><span style="font-size:16px;">购物帮助</span></a></span> \r\n</p>\r\n<p>\r\n	<img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401523085097562.jpg" /><img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401523085838080.jpg" /><img align="absMiddle" src="http://bxjkn.img41.wal8.com/img41/410605_20140326144905/1401523086282060.jpg" /> \r\n</p>', 0, 0, 967, 0, 48, '0.00', '0.00', '0.00', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_item_attr`
--

CREATE TABLE IF NOT EXISTS `weixin_item_attr` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_id` int(10) NOT NULL,
  `attr_name` varchar(50) NOT NULL,
  `attr_value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `weixin_item_attr`
--

INSERT INTO `weixin_item_attr` (`id`, `item_id`, `attr_name`, `attr_value`) VALUES
(22, 165, '口味选择', '什锦果肉|黄桃&蜜桃'),
(21, 146, '口味选择', '麻辣味|泡椒味|烧烤味|五香味'),
(19, 150, '口味选择', '麦香味|香芋味|原味|草莓味|巧克力|咖啡'),
(23, 166, '口味选择', '牛肉味|烤肉味|香辣味|蒜香味'),
(24, 179, '口味选择', '香草味|原味');

-- --------------------------------------------------------

--
-- 表的结构 `weixin_item_cate`
--

CREATE TABLE IF NOT EXISTS `weixin_item_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `tags` varchar(50) NOT NULL,
  `pid` smallint(4) unsigned NOT NULL,
  `spid` varchar(50) NOT NULL,
  `img` varchar(255) NOT NULL,
  `fcolor` varchar(10) NOT NULL,
  `remark` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `items` int(10) unsigned NOT NULL DEFAULT '0',
  `likes` int(10) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0:商品分类 1:标签分类',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL,
  `is_index` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=368 ;

--
-- 转存表中的数据 `weixin_item_cate`
--

INSERT INTO `weixin_item_cate` (`id`, `name`, `tags`, `pid`, `spid`, `img`, `fcolor`, `remark`, `add_time`, `items`, `likes`, `type`, `ordid`, `status`, `is_index`, `is_default`, `seo_title`, `seo_keys`, `seo_desc`) VALUES
(355, '特仑苏', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(364, '焕轻', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(4, '毛衣', '', 2, '1|2|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(363, '奶特', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(6, '西装', '', 2, '1|2|', '50b2e02e0332f_thumb.jpg', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(7, '风衣', '', 2, '1|2|', '50b2e03a38859_thumb.jpg', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(8, '卫衣', '', 2, '1|2|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(9, '马甲', '', 2, '1|2|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(10, '牛仔裤', '', 2, '1|2|', '50b2e044c46ad_thumb.jpg', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(11, '小脚裤', '', 2, '1|2|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(12, '哈伦裤', '', 2, '1|2|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(319, '黑色', '', 315, '1|315|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(318, '黄色', '', 315, '1|315|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(317, '绿色', '', 315, '1|315|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(316, '红色', '', 315, '1|315|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(17, '打底裤', '', 2, '1|2|', '50b2e06575aa1_thumb.jpg', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(18, '五分裤', '', 2, '1|2|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(21, '蕾丝', '', 20, '1|20|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(22, '打底', '', 20, '1|20|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(23, '牛仔', '', 20, '1|20|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(24, '镂空', '', 20, '1|20|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(25, '拼接', '', 20, '1|20|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(26, '紧身', '', 20, '1|20|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(27, '格子', '', 20, '1|20|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(28, '水洗', '', 20, '1|20|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(29, '高腰', '', 20, '1|20|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(30, '磨旧', '', 20, '1|20|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(32, '宽松', '', 31, '1|31|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(33, '清新', '', 31, '1|31|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(34, '欧美', '', 31, '1|31|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(35, '韩系', '', 31, '1|31|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(36, '甜美', '', 31, '1|31|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(37, '复古', '', 31, '1|31|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(38, '简约', '', 31, '1|31|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(39, '英伦', '', 31, '1|31|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(41, '珊瑚绒', '', 40, '1|40|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(42, '莫代尔', '', 40, '1|40|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(43, '纯棉', '', 40, '1|40|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(44, '全棉', '', 40, '1|40|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(45, '毛呢', '', 40, '1|40|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(46, '牛仔', '', 40, '1|40|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(47, '针织', '', 40, '1|40|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(48, '毛绒', '', 40, '1|40|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(49, '雪纺', '', 40, '1|40|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(339, '鞋子', '', 336, '336|', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(52, '优雅', '', 51, '50|51|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(53, '朋克', '', 51, '50|51|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(54, '名媛', '', 51, '50|51|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(55, '复古', '', 51, '50|51|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(56, '甜美', '', 51, '50|51|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(57, '百搭', '', 51, '50|51|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(58, '欧美', '', 51, '50|51|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(59, '英伦', '', 51, '50|51|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(61, '细跟', '', 60, '50|60|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(62, '圆头', '', 60, '50|60|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(63, '铆钉', '', 60, '50|60|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(64, '豹纹', '', 60, '50|60|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(65, '防水台', '', 60, '50|60|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(66, '流苏', '', 60, '50|60|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(67, '粗跟', '', 60, '50|60|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(68, '尖头', '', 60, '50|60|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(69, '坡跟', '', 60, '50|60|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(70, '厚底', '', 60, '50|60|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(71, '系带', '', 60, '50|60|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(72, '撞色', '', 60, '50|60|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(74, '工装靴', '', 73, '50|73|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(75, '长靴', '', 73, '50|73|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(76, '复古鞋', '', 73, '50|73|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(77, '马靴', '', 73, '50|73|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(78, '布洛克鞋', '', 73, '50|73|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(79, '及裸靴', '', 73, '50|73|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(81, '豆豆鞋', '', 80, '50|80|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(82, '休闲鞋', '', 80, '50|80|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(83, '高帮鞋', '', 80, '50|80|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(84, '运动鞋', '', 80, '50|80|', '50b2e09aa9967_thumb.jpeg', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(85, '帆布鞋', '', 80, '50|80|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(86, '松糕鞋', '', 80, '50|80|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(87, '厚底鞋', '', 80, '50|80|', '50b2e0a2e6b97_thumb.jpeg', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(88, '雪地靴', '', 80, '50|80|', '50b2e0aabcb80_thumb.jpeg', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(89, '家居鞋', '', 80, '50|80|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(91, '低跟鞋', '', 90, '50|90|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(92, '细跟鞋', '', 90, '50|90|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(93, '牛津鞋', '', 90, '50|90|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(94, '中跟鞋', '', 90, '50|90|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(95, '单鞋', '', 90, '50|90|', '50b2e07ae109c_thumb.jpeg', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(96, '粗跟鞋', '', 90, '50|90|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(97, '坡跟鞋', '', 90, '50|90|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(98, '平底鞋', '', 90, '50|90|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(99, '马丁靴', '', 90, '50|90|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(100, '高跟鞋', '', 90, '50|90|', '50b2e086780ab_thumb.jpeg', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(101, '短靴', '', 90, '50|90|', '50b2e091e2cec_thumb.jpeg', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(104, '真皮', '', 103, '102|103|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(105, '金属', '', 103, '102|103|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(106, '透明', '', 103, '102|103|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(107, '棉麻', '', 103, '102|103|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(108, '羊皮', '', 103, '102|103|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(109, 'PU', '', 103, '102|103|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(110, '帆布', '', 103, '102|103|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(111, '牛皮', '', 103, '102|103|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(113, '代购', '', 112, '102|112|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(338, '裤子', '', 336, '336|', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(337, 't恤', '', 336, '336|', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(117, '铆钉', '', 112, '102|112|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(118, '豹纹', '', 112, '102|112|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(119, '菱形格', '', 112, '102|112|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(120, '甜美', '', 112, '102|112|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(121, '复古', '', 112, '102|112|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(122, '外贸', '', 112, '102|112|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(123, '链条', '', 112, '102|112|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(127, '马鞍包', '', 125, '102|125|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(128, '相机包', '', 125, '102|125|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(130, '信封包', '', 125, '102|125|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(132, '剑桥包', '', 125, '102|125|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(133, '医生包', '', 125, '102|125|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(135, '笑脸包', '', 125, '102|125|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(137, '波士顿包', '', 125, '102|125|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(139, '邮差包', '', 125, '102|125|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(140, '机车包', '', 125, '102|125|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(141, '行李箱', '', 125, '102|125|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(143, '水桶包', '', 125, '102|125|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(145, '手提包', '', 125, '102|125|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(148, '帆布包', '', 126, '102|126|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(150, '链条包', '', 126, '102|126|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(151, '复古包', '', 126, '102|126|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(152, '手拿包', '', 126, '102|126|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(154, '斜挎包', '', 126, '102|126|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(156, '大包', '', 126, '102|126|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(158, '钱包', '', 126, '102|126|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(160, '双肩包', '', 126, '102|126|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(161, '单肩包', '', 126, '102|126|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(163, '花朵', '', 129, '114|129|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(164, '玉', '', 129, '114|129|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(165, '24K金', '', 129, '114|129|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(166, '水晶', '', 129, '114|129|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(167, '玫瑰金', '', 129, '114|129|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(168, '银饰', '', 129, '114|129|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(169, '印花', '', 129, '114|129|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(170, '哥特', '', 131, '114|131|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(171, '欧美', '', 131, '114|131|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(172, '韩系', '', 131, '114|131|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(173, '英伦', '', 131, '114|131|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(174, '个性', '', 131, '114|131|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(175, '甜美', '', 131, '114|131|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(176, '朋克', '', 131, '114|131|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(177, '复古', '', 131, '114|131|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(178, '袜套', '', 134, '114|134|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(179, '电子表', '', 134, '114|134|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(180, '发带', '', 134, '114|134|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(181, '礼帽', '', 134, '114|134|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(182, '锁骨链', '', 134, '114|134|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(183, '鸭舌帽', '', 134, '114|134|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(184, '贝雷帽', '', 134, '114|134|', '50b2dc6c73cb4_thumb.jpeg', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(185, '假领', '', 134, '114|134|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(186, '发饰', '', 134, '114|134|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(187, '脚链', '', 136, '114|136|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(188, '腰链', '', 136, '114|136|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(189, '手镯', '', 136, '114|136|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(190, '手链', '', 136, '114|136|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(191, '耳环', '', 136, '114|136|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(192, '戒指', '', 136, '114|136|', '50b2dc7deb82f_thumb.jpeg', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(193, '耳钉', '', 136, '114|136|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(194, '项链', '', 136, '114|136|', '50b2dc8787567_thumb.jpeg', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(195, '墨镜', '', 138, '114|138|', '50b2dcb8b134a_thumb.jpeg', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(196, '钥匙链', '', 138, '114|138|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(197, '腰带', '', 138, '114|138|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(198, '手套', '', 138, '114|138|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(199, '头花', '', 138, '114|138|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(200, '毛衣链', '', 138, '114|138|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(201, '瘦腿袜', '', 138, '114|138|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(202, '发箍', '', 138, '114|138|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(203, '手表', '', 138, '114|138|', '50b2dc974a19b_thumb.jpeg', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(204, '帽子', '', 138, '114|138|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(205, '围巾', '', 138, '114|138|', '50b2dca7045fc_thumb.jpeg', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(206, '储物罐', '', 142, '115|142|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(207, '烹饪', '', 142, '115|142|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(208, '烘焙', '', 142, '115|142|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(209, '锅具', '', 142, '115|142|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(210, '饭盒', '', 142, '115|142|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(211, '筷子', '', 142, '115|142|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(212, '勺', '', 142, '115|142|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(213, '茶具', '', 142, '115|142|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(214, '水壶', '', 142, '115|142|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(215, '盘碟', '', 142, '115|142|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(216, '调味瓶', '', 142, '115|142|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(217, '餐巾', '', 142, '115|142|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(218, '餐垫', '', 142, '115|142|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(219, '床上用品', '', 144, '115|144|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(220, '梳妆', '', 144, '115|144|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(221, '家居鞋', '', 144, '115|144|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(222, '窗帘', '', 144, '115|144|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(223, '斗柜', '', 144, '115|144|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(224, '衣柜', '', 144, '115|144|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(225, '床头柜', '', 144, '115|144|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(226, '床', '', 144, '115|144|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(227, '茶几', '', 146, '115|146|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(228, '搁板', '', 146, '115|146|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(229, '电视柜', '', 146, '115|146|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(230, '椅子', '', 146, '115|146|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(231, '桌子', '', 146, '115|146|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(232, '坐垫', '', 146, '115|146|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(233, '沙发垫', '', 146, '115|146|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(234, '照片墙', '', 146, '115|146|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(235, '沙发', '', 146, '115|146|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(236, '相框', '', 146, '115|146|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(237, '收纳', '', 147, '115|147|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(238, '台灯', '', 147, '115|147|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(239, '时钟', '', 147, '115|147|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(240, '吊灯', '', 147, '115|147|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(241, '吸顶灯', '', 147, '115|147|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(242, '杯子', '', 147, '115|147|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(243, '置物架', '', 147, '115|147|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(244, '香薰', '', 147, '115|147|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(245, '地毯', '', 147, '115|147|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(246, '落地灯', '', 147, '115|147|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(247, '桌布', '', 147, '115|147|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(248, '摆件', '', 147, '115|147|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(249, '墙贴', '', 147, '115|147|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(250, '烛台', '', 147, '115|147|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(251, '书柜', '', 147, '115|147|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(252, '挂钩', '', 149, '115|149|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(253, '马桶刷', '', 149, '115|149|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(254, '衣架', '', 149, '115|149|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(255, '皂盒', '', 149, '115|149|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(256, '浴室垫', '', 149, '115|149|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(257, '浴室套件', '', 149, '115|149|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(258, '浴帘', '', 149, '115|149|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(259, '毛巾', '', 149, '115|149|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(260, '补水', '', 153, '116|153|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(261, '控油', '', 153, '116|153|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(262, '美白', '', 153, '116|153|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(263, '遮瑕', '', 153, '116|153|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(264, '去角质', '', 153, '116|153|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(265, '祛痘', '', 153, '116|153|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(266, '保湿', '', 153, '116|153|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(267, '洁面', '', 153, '116|153|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(268, '去黑头', '', 153, '116|153|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(269, '收毛孔', '', 153, '116|153|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(270, '去眼袋', '', 153, '116|153|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(271, '倩碧', '', 155, '116|155|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(272, '雅漾', '', 155, '116|155|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(273, '资生堂', '', 155, '116|155|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(274, '娇韵诗', '', 155, '116|155|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(275, '欧舒丹', '', 155, '116|155|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(276, '兰蔻', '', 155, '116|155|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(277, '水宝宝', '', 155, '116|155|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(278, '雅诗兰黛', '', 155, '116|155|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(279, '丝芙兰', '', 155, '116|155|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(280, '露得清', '', 155, '116|155|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(281, '染发膏', '', 157, '116|157|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(282, '蓬蓬粉', '', 157, '116|157|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(283, '发膜', '', 157, '116|157|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(284, '弹力素', '', 157, '116|157|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(285, '发蜡', '', 157, '116|157|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(286, '假发', '', 157, '116|157|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(287, '护手霜', '', 157, '116|157|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(288, '身体乳', '', 157, '116|157|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(289, '美颈霜', '', 157, '116|157|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(290, '沐浴露', '', 157, '116|157|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(291, '手工皂', '', 157, '116|157|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(292, '眼线膏', '', 159, '116|159|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(293, '唇彩', '', 159, '116|159|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(294, '眉笔', '', 159, '116|159|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(295, '眼影', '', 159, '116|159|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(296, '腮红', '', 159, '116|159|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(297, '口红', '', 159, '116|159|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(298, '蜜粉', '', 159, '116|159|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(299, '粉饼', '', 159, '116|159|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(300, 'BB霜', '', 159, '116|159|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(301, '睫毛膏', '', 159, '116|159|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(302, '指甲油', '', 159, '116|159|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(303, '香水', '', 159, '116|159|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(304, '药妆', '', 162, '116|162|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(305, '吸油面纸', '', 162, '116|162|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(306, '隔离霜', '', 162, '116|162|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(307, '精油', '', 162, '116|162|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(308, '爽肤水', '', 162, '116|162|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(309, '眼霜', '', 162, '116|162|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(310, '面膜', '', 162, '116|162|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(311, '洗面奶', '', 162, '116|162|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(312, '卸妆油', '', 162, '116|162|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(313, '喷雾', '', 162, '116|162|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(314, '防晒霜', '', 162, '116|162|', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(320, '粉色', '', 315, '1|315|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(321, '紫色', '', 315, '1|315|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(322, '白色', '', 315, '1|315|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(323, '蓝色', '', 315, '1|315|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(354, '江安优客来', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(325, '红色', '', 324, '102|324|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(326, '黑色', '', 324, '102|324|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(327, '蓝色', '', 324, '102|324|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(328, '绿色', '', 324, '102|324|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(329, '紫色', '', 324, '102|324|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(330, '白色', '', 324, '102|324|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(331, '粉色', '', 324, '102|324|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(332, '黄色', '', 324, '102|324|', '', '', '', 0, 0, 0, 1, 255, 1, 0, 0, '', '', ''),
(349, '蜜饯果干', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(348, '坚果炒货', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(347, '休闲零食', '', 0, '0', '', '', '', 0, 0, 0, 0, 1, 1, 0, 0, '', '', ''),
(353, '牛奶饮料', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(346, '会员专享', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 0, 0, 0, '', '', ''),
(350, '肉制海鲜', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(351, '酒水卤肉', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(356, '儿童奶', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(357, '早餐奶', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(358, '纯牛奶', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(359, '果蔬奶', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(340, '特价秒杀', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(341, '新品特惠', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 0, 0, '', '', ''),
(365, '纯甄', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(366, '新养道', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', ''),
(367, '酸酸乳', '', 0, '0', '', '', '', 0, 0, 0, 0, 255, 1, 1, 0, '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `weixin_item_cate_tag`
--

CREATE TABLE IF NOT EXISTS `weixin_item_cate_tag` (
  `cate_id` smallint(4) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `weight` tinyint(3) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `cate_id` (`cate_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `weixin_item_cate_tag`
--

INSERT INTO `weixin_item_cate_tag` (`cate_id`, `tag_id`, `weight`) VALUES
(3, 1, 0),
(4, 2, 0),
(5, 3, 0),
(6, 4, 0),
(7, 5, 0),
(8, 6, 0),
(9, 7, 0),
(10, 8, 0),
(11, 9, 0),
(12, 10, 0),
(17, 11, 0),
(18, 12, 0),
(21, 13, 0),
(23, 14, 0),
(22, 15, 0),
(24, 16, 0),
(25, 17, 0),
(26, 18, 0),
(27, 19, 0),
(28, 20, 0),
(29, 21, 0),
(30, 22, 0),
(32, 23, 0),
(33, 24, 0),
(34, 25, 0),
(35, 26, 0),
(36, 27, 0),
(37, 28, 0),
(38, 29, 0),
(39, 30, 0),
(41, 31, 0),
(42, 32, 0),
(43, 33, 0),
(44, 34, 0),
(45, 35, 0),
(46, 14, 0),
(47, 36, 0),
(48, 37, 0),
(49, 38, 0),
(319, 39, 0),
(318, 40, 0),
(317, 41, 0),
(316, 42, 0),
(320, 43, 0),
(321, 44, 0),
(322, 45, 0),
(323, 46, 0),
(91, 96, 0),
(92, 97, 0),
(93, 98, 0),
(94, 99, 0),
(281, 100, 0),
(95, 101, 0),
(282, 102, 0),
(283, 103, 0),
(96, 104, 0),
(284, 105, 0),
(97, 106, 0),
(285, 107, 0),
(98, 108, 0),
(99, 109, 0),
(286, 110, 0),
(100, 111, 0),
(287, 112, 0),
(101, 113, 0),
(288, 114, 0),
(289, 115, 0),
(290, 116, 0),
(291, 117, 0),
(292, 118, 0),
(293, 119, 0),
(294, 120, 0),
(295, 121, 0),
(296, 122, 0),
(297, 123, 0),
(298, 124, 0),
(299, 125, 0),
(300, 126, 0),
(301, 127, 0),
(302, 128, 0),
(303, 129, 0),
(304, 130, 0),
(305, 131, 0),
(306, 132, 0),
(307, 133, 0),
(308, 134, 0),
(309, 135, 0),
(310, 136, 0),
(219, 137, 0),
(311, 138, 0),
(312, 139, 0),
(313, 140, 0),
(314, 141, 0),
(260, 142, 0),
(261, 143, 0),
(262, 144, 0),
(263, 145, 0),
(264, 146, 0),
(265, 147, 0),
(266, 148, 0),
(267, 149, 0),
(268, 150, 0),
(269, 151, 0),
(270, 152, 0),
(271, 153, 0),
(272, 154, 0),
(273, 155, 0),
(274, 156, 0),
(275, 157, 0),
(276, 158, 0),
(277, 159, 0),
(278, 160, 0),
(279, 161, 0),
(280, 162, 0),
(237, 163, 0),
(238, 164, 0),
(239, 165, 0),
(240, 166, 0),
(241, 167, 0),
(242, 168, 0),
(243, 169, 0),
(244, 170, 0),
(245, 171, 0),
(246, 172, 0),
(247, 173, 0),
(248, 174, 0),
(249, 175, 0),
(250, 176, 0),
(251, 177, 0),
(206, 178, 0),
(207, 179, 0),
(208, 180, 0),
(209, 181, 0),
(210, 182, 0),
(211, 183, 0),
(212, 184, 0),
(213, 185, 0),
(214, 186, 0),
(215, 187, 0),
(216, 188, 0),
(217, 189, 0),
(218, 190, 0),
(220, 191, 0),
(221, 192, 0),
(222, 193, 0),
(223, 194, 0),
(224, 195, 0),
(225, 196, 0),
(226, 196, 0),
(226, 137, 0),
(227, 197, 0),
(228, 198, 0),
(229, 199, 0),
(230, 200, 0),
(231, 201, 0),
(232, 202, 0),
(233, 203, 0),
(234, 204, 0),
(236, 205, 0),
(235, 206, 0),
(252, 207, 0),
(253, 208, 0),
(254, 209, 0),
(255, 210, 0),
(256, 211, 0),
(257, 212, 0),
(258, 213, 0),
(259, 214, 0),
(178, 215, 0),
(179, 216, 0),
(180, 267, 0),
(181, 268, 0),
(182, 269, 0),
(183, 270, 0),
(184, 271, 0),
(185, 289, 0),
(186, 290, 0),
(187, 291, 0),
(188, 292, 0),
(189, 293, 0),
(190, 294, 0),
(191, 295, 0),
(192, 296, 0),
(193, 297, 0),
(194, 330, 0),
(195, 336, 0),
(196, 337, 0),
(197, 338, 0),
(198, 339, 0),
(199, 340, 0),
(200, 341, 0),
(201, 342, 0),
(202, 343, 0),
(203, 344, 0),
(204, 345, 0),
(205, 346, 0),
(170, 347, 0),
(171, 25, 0),
(172, 26, 0),
(173, 30, 0),
(174, 348, 0),
(175, 27, 0),
(176, 349, 0),
(177, 259, 0),
(177, 28, 0),
(163, 350, 0),
(164, 351, 0),
(165, 352, 0),
(166, 353, 0),
(167, 354, 0),
(168, 355, 0),
(169, 314, 0),
(127, 356, 0),
(128, 357, 0),
(130, 358, 0),
(132, 359, 0),
(81, 360, 0),
(82, 301, 0),
(83, 323, 0),
(84, 361, 0),
(85, 300, 0),
(86, 318, 0),
(87, 362, 0),
(88, 332, 0),
(89, 192, 0),
(74, 363, 0),
(75, 364, 0),
(76, 365, 0),
(77, 366, 0),
(78, 367, 0),
(79, 368, 0),
(61, 97, 0),
(61, 369, 0),
(62, 370, 0),
(63, 371, 0),
(64, 372, 0),
(316, 373, 0),
(316, 374, 0),
(316, 375, 0),
(65, 376, 0),
(65, 377, 0),
(66, 378, 0),
(67, 379, 0),
(68, 380, 0),
(69, 381, 0),
(70, 382, 0),
(71, 308, 0),
(72, 383, 0),
(52, 384, 0),
(53, 349, 0),
(54, 385, 0),
(55, 28, 0),
(56, 27, 0),
(57, 386, 0),
(58, 25, 0),
(59, 30, 0),
(133, 387, 0),
(135, 388, 0),
(137, 389, 0),
(139, 390, 0),
(140, 246, 0),
(141, 391, 0),
(143, 392, 0),
(145, 241, 0),
(148, 393, 0),
(150, 394, 0),
(151, 259, 0),
(152, 395, 0),
(154, 237, 0),
(156, 238, 0),
(158, 396, 0),
(160, 397, 0),
(161, 218, 0),
(113, 398, 0),
(117, 371, 0),
(118, 372, 0),
(119, 399, 0),
(119, 400, 0),
(120, 27, 0),
(121, 28, 0),
(122, 401, 0),
(123, 233, 0),
(104, 220, 0),
(105, 402, 0),
(106, 403, 0),
(107, 404, 0),
(108, 405, 0),
(109, 406, 0),
(110, 302, 0),
(111, 223, 0),
(325, 42, 0),
(325, 374, 0),
(325, 375, 0),
(326, 39, 0),
(326, 407, 0),
(327, 46, 0),
(327, 408, 0),
(327, 409, 0),
(327, 410, 0),
(327, 411, 0),
(328, 41, 0),
(328, 412, 0),
(328, 413, 0),
(328, 414, 0),
(329, 44, 0),
(329, 415, 0),
(330, 45, 0),
(330, 416, 0),
(331, 43, 0),
(331, 373, 0),
(332, 40, 0),
(332, 417, 0),
(332, 418, 0);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_item_comment`
--

CREATE TABLE IF NOT EXISTS `weixin_item_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `info` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `weixin_item_comment`
--

INSERT INTO `weixin_item_comment` (`id`, `item_id`, `uid`, `uname`, `info`, `add_time`, `status`) VALUES
(4, 203, 0, 'oP1not2XgVZ1Bo8ZlbjD', '价格确实比超市更便宜', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_item_img`
--

CREATE TABLE IF NOT EXISTS `weixin_item_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=745 ;

--
-- 转存表中的数据 `weixin_item_img`
--

INSERT INTO `weixin_item_img` (`id`, `item_id`, `url`, `add_time`, `ordid`, `status`) VALUES
(563, 146, '1403/23/532ea45087c98.jpg', 0, 255, 1),
(562, 146, '1403/23/532ea447cf7c3.jpg', 0, 255, 1),
(561, 146, '1403/23/532ea44794637.jpg', 0, 255, 1),
(559, 145, '1403/22/532d9d4e4d28c.jpg', 0, 255, 1),
(558, 145, '1403/22/532d9d4e0d921.jpg', 0, 255, 1),
(557, 145, '1403/22/532d9d4dd45b7.jpg', 0, 255, 1),
(653, 171, '1404/17/534f7bce4f22d.jpg', 0, 255, 1),
(652, 187, '1404/15/534d40d1c6b74.jpg', 0, 255, 1),
(651, 186, '1404/15/534d409337368.jpg', 0, 255, 1),
(650, 186, '1404/15/534d40930858b.jpg', 0, 255, 1),
(649, 187, '1404/15/534d400406d15.jpg', 0, 255, 1),
(648, 185, '1404/15/534d107f0ab7a.jpg', 0, 255, 1),
(646, 183, '1404/15/534d0b898ec10.jpg', 0, 255, 1),
(645, 184, '1404/15/534cf7f905260.jpg', 0, 255, 1),
(644, 184, '1404/15/534cf7f8cb7e2.jpg', 0, 255, 1),
(658, 190, '1405/26/53832a424e8cd.jpg', 0, 255, 1),
(659, 190, '1405/26/53832a5474bea.jpg', 0, 255, 1),
(656, 189, '1404/22/535618ffd0ea1.jpg', 0, 255, 1),
(654, 182, '1404/17/534f99e903881.jpg', 0, 255, 1),
(564, 146, '1403/23/532ea450b8d0d.jpg', 0, 255, 1),
(565, 146, '1403/23/532ea457e252f.jpg', 0, 255, 1),
(566, 146, '1403/23/532ea4582511f.jpg', 0, 255, 1),
(567, 146, '1403/23/532ea74c5caed.jpg', 0, 255, 1),
(568, 148, '1403/23/532eb0b84fff8.jpg', 0, 255, 1),
(569, 148, '1403/23/532eb0b880eee.jpg', 0, 255, 1),
(570, 148, '1403/23/532eb0b8b5ff6.jpg', 0, 255, 1),
(571, 149, '1403/23/532eb4a1969eb.jpg', 0, 255, 1),
(572, 149, '1403/23/532eb4a19b7c1.jpg', 0, 255, 1),
(573, 150, '1403/23/532eb95255452.jpg', 0, 255, 1),
(574, 150, '1403/23/532eb95283c5d.jpg', 0, 255, 1),
(575, 151, '1403/23/532ef8890d501.jpg', 0, 255, 1),
(576, 151, '1403/23/532ef889188a3.jpg', 0, 255, 1),
(577, 151, '1403/23/532ef88938ffb.jpg', 0, 255, 1),
(578, 152, '1403/24/532f9f524725d.jpg', 0, 255, 1),
(579, 152, '1403/24/532f9f5252af1.jpg', 0, 255, 1),
(580, 152, '1403/24/532f9f526670f.jpg', 0, 255, 1),
(581, 152, '1403/24/532f9f5270bf4.jpg', 0, 255, 1),
(582, 153, '1403/24/532fa32c10380.jpg', 0, 255, 1),
(583, 153, '1403/24/532fa32c3ef3d.jpg', 0, 255, 1),
(584, 153, '1403/24/532fa32c82e40.jpg', 0, 255, 1),
(585, 154, '1403/24/532fa8a53bb0c.jpg', 0, 255, 1),
(586, 154, '1403/24/532fa8a546557.jpg', 0, 255, 1),
(587, 155, '1403/24/532fab875e4cb.jpg', 0, 255, 1),
(590, 156, '1403/24/532fb03b9926e.jpg', 0, 255, 1),
(589, 155, '1403/24/532fab8771070.jpg', 0, 255, 1),
(591, 156, '1403/24/532fb03bc86db.jpg', 0, 255, 1),
(592, 157, '1403/24/532fc97a6aad4.jpg', 0, 255, 1),
(593, 158, '1403/24/532fcd74a7e5c.jpg', 0, 255, 1),
(594, 159, '1403/25/53311080db106.jpg', 0, 255, 1),
(595, 159, '1403/25/53311080e4ad5.jpg', 0, 255, 1),
(596, 160, '1403/25/533127d4ec7e5.jpg', 0, 255, 1),
(597, 161, '1403/25/5331397ab35b1.jpg', 0, 255, 1),
(598, 161, '1403/25/5331397ac0ca3.jpg', 0, 255, 1),
(599, 162, '1403/25/53313dbc81ccf.jpg', 0, 255, 1),
(601, 163, '1403/25/533141a7d7931.jpg', 0, 255, 1),
(602, 163, '1403/25/533141c3319e8.jpg', 0, 255, 1),
(603, 164, '1403/25/533145ef72cfc.jpg', 0, 255, 1),
(604, 164, '1403/25/533145ef9def0.jpg', 0, 255, 1),
(605, 164, '1403/25/533145efd30dc.jpg', 0, 255, 1),
(609, 166, '1403/25/53317ad395189.jpg', 0, 255, 1),
(607, 165, '1403/25/53316eac75721.jpg', 0, 255, 1),
(608, 165, '1403/25/53316eacacc74.jpg', 0, 255, 1),
(610, 166, '1403/25/53317ad3ca39d.jpg', 0, 255, 1),
(611, 166, '1403/25/53317ad3eada8.jpg', 0, 255, 1),
(612, 166, '1403/25/53317ad44bd60.jpg', 0, 255, 1),
(616, 168, '1403/26/5332a18cbe0d5.jpg', 0, 255, 1),
(614, 167, '1403/25/53318f3003fff.jpg', 0, 255, 1),
(615, 167, '1403/25/53318f3026040.jpg', 0, 255, 1),
(617, 169, '1403/26/5332a48bec142.jpg', 0, 255, 1),
(618, 169, '1403/26/5332a48c008e0.jpg', 0, 255, 1),
(619, 170, '1403/26/5332a54642b71.jpg', 0, 255, 1),
(620, 170, '1403/26/5332a5464b9b1.jpg', 0, 255, 1),
(621, 171, '1403/26/5332a91a2de56.jpg', 0, 255, 1),
(622, 171, '1403/26/5332a91a366f3.jpg', 0, 255, 1),
(623, 172, '1403/26/5332ae20cff8b.jpg', 0, 255, 1),
(624, 173, '1403/26/5332bd9a2aa56.jpg', 0, 255, 1),
(625, 173, '1403/26/5332bd9a317f1.jpg', 0, 255, 1),
(626, 174, '1403/26/5332c1049d477.jpg', 0, 255, 1),
(627, 174, '1403/26/5332c104c923a.jpg', 0, 255, 1),
(628, 174, '1403/26/5332c10509f7e.jpg', 0, 255, 1),
(629, 175, '1403/26/5332c2b131af2.jpg', 0, 255, 1),
(630, 175, '1403/26/5332c2b16388b.jpg', 0, 255, 1),
(631, 176, '1403/26/5332c46968720.jpg', 0, 255, 1),
(632, 178, '1403/26/5332c71f30c31.jpg', 0, 255, 1),
(633, 179, '1403/26/5332c9010be34.jpg', 0, 255, 1),
(634, 179, '1403/26/5332c90133da7.jpg', 0, 255, 1),
(635, 180, '1403/26/5332edde0b429.jpg', 0, 255, 1),
(636, 181, '1403/26/5332f020a9fde.jpg', 0, 255, 1),
(637, 181, '1403/26/5332f020d2c7c.jpg', 0, 255, 1),
(638, 181, '1403/26/5332f0210aacf.jpg', 0, 255, 1),
(639, 167, '1403/26/5332f314c5163.jpg', 0, 255, 1),
(655, 188, '1404/22/535613b44dfe5.jpg', 0, 255, 1),
(641, 182, '1404/10/5346adb912445.jpg', 0, 255, 1),
(647, 185, '1404/15/534d107eeb493.jpg', 0, 255, 1),
(643, 183, '1404/10/5346b1ff0fe3d.jpg', 0, 255, 1),
(660, 191, '1405/26/53832cdf5b7eb.jpg', 0, 255, 1),
(661, 191, '1405/26/53832cdf9c2df.jpg', 0, 255, 1),
(665, 192, '1405/26/53832ef4d8735.jpg', 0, 255, 1),
(664, 192, '1405/26/53832ef49921d.jpg', 0, 255, 1),
(666, 193, '1405/26/538335fdb6130.jpg', 0, 255, 1),
(667, 193, '1405/26/538336648a3f8.jpg', 0, 255, 1),
(668, 194, '1405/26/53833b03cc93e.jpg', 0, 255, 1),
(669, 194, '1405/26/53833b0420012.jpg', 0, 255, 1),
(674, 196, '1405/26/53834997273a7.jpg', 0, 255, 1),
(673, 195, '1405/26/538342f38f74e.jpg', 0, 255, 1),
(672, 195, '1405/26/53834063e89b3.jpg', 0, 255, 1),
(675, 196, '1405/26/538349b486fc6.jpg', 0, 255, 1),
(676, 197, '1405/26/53834f21914df.jpg', 0, 255, 1),
(677, 197, '1405/26/53834f21d6199.jpg', 0, 255, 1),
(681, 199, '1405/28/538579f48a4ba.jpg', 0, 255, 1),
(679, 198, '1405/26/5383576a4f9c8.jpg', 0, 255, 1),
(680, 198, '1405/26/538357d1eea03.jpg', 0, 255, 1),
(682, 199, '1405/28/538579f496697.jpg', 0, 255, 1),
(683, 199, '1405/28/53857aab6d8f7.jpg', 0, 255, 1),
(684, 200, '1405/28/5385bfc973e31.jpg', 0, 255, 1),
(685, 200, '1405/28/5385bfc9a181d.jpg', 0, 255, 1),
(738, 222, '1405/31/53897d5a8fafe.jpg', 0, 255, 1),
(739, 223, '1405/31/53897f742ec05.jpg', 0, 255, 1),
(734, 221, '1405/31/538978f360870.jpg', 0, 255, 1),
(732, 221, '1405/31/5389786298d99.jpg', 0, 255, 1),
(731, 220, '1405/31/538977a7d9aa6.jpg', 0, 255, 1),
(692, 203, '1405/28/5385f0560441a.jpg', 0, 255, 1),
(693, 203, '1405/28/5385f0564204f.jpg', 0, 255, 1),
(694, 204, '1405/29/5386a2e4e1067.jpg', 0, 255, 1),
(696, 204, '1405/29/5386a32bd3c1a.jpg', 0, 255, 1),
(698, 205, '1405/29/5386a7b8963d2.jpg', 0, 255, 1),
(699, 205, '1405/29/5386a7b89ed0a.jpg', 0, 255, 1),
(700, 206, '1405/29/5386a965d0722.jpg', 0, 255, 1),
(701, 206, '1405/29/5386a965d82b6.jpg', 0, 255, 1),
(702, 207, '1405/29/5386ae6a7f7aa.jpg', 0, 255, 1),
(704, 207, '1405/29/5386af65c774b.jpg', 0, 255, 1),
(705, 208, '1405/29/5386b1a1e33f2.jpg', 0, 255, 1),
(706, 208, '1405/29/5386b1a1e969d.jpg', 0, 255, 1),
(707, 209, '1405/29/5386db088a1cc.jpg', 0, 255, 1),
(729, 220, '1405/31/538976d252b23.jpg', 0, 255, 1),
(709, 210, '1405/29/5386ea553064d.jpg', 0, 255, 1),
(710, 211, '1405/29/538738d51db90.jpg', 0, 255, 1),
(712, 211, '1405/29/538739341430b.jpg', 0, 255, 1),
(713, 212, '1405/30/5387d24373c3a.jpg', 0, 255, 1),
(714, 212, '1405/30/5387d24390861.jpg', 0, 255, 1),
(716, 213, '1405/30/53889c8c25e68.jpg', 0, 255, 1),
(717, 213, '1405/30/53889c8c2d927.jpg', 0, 255, 1),
(718, 214, '1405/30/5388a2d7b1cc1.jpg', 0, 255, 1),
(720, 214, '1405/30/5388a456e9672.jpg', 0, 255, 1),
(721, 215, '1405/30/5388a63605716.jpg', 0, 255, 1),
(722, 215, '1405/30/5388a63640561.jpg', 0, 255, 1),
(723, 218, '1405/31/5388ace4ece91.jpg', 0, 255, 1),
(724, 218, '1405/31/5388acf573395.jpg', 0, 255, 1),
(725, 218, '1405/31/5388ae4216616.jpg', 0, 255, 1),
(726, 218, '1405/31/5388ae92b1d8b.jpg', 0, 255, 1),
(727, 219, '1405/31/5388b0b6d32d0.jpg', 0, 255, 1),
(728, 219, '1405/31/5388b0b7247a6.jpg', 0, 255, 1),
(740, 224, '1405/31/538987668f0a3.jpg', 0, 255, 1),
(741, 224, '1405/31/53898766a1475.jpg', 0, 255, 1),
(742, 225, '1405/31/53898a5523cc2.jpg', 0, 255, 1),
(743, 226, '1405/31/53898ac7beba2.jpg', 0, 255, 1),
(744, 227, '1406/17/539fb0c2f2d8c.jpg', 0, 255, 1);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_item_like`
--

CREATE TABLE IF NOT EXISTS `weixin_item_like` (
  `item_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`item_id`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_item_order`
--

CREATE TABLE IF NOT EXISTS `weixin_item_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(50) NOT NULL COMMENT '订单号',
  `add_time` int(11) DEFAULT NULL COMMENT '下单时间',
  `goods_sumPrice` decimal(10,2) NOT NULL COMMENT '商品总额',
  `order_sumPrice` decimal(10,2) NOT NULL COMMENT '订单总额',
  `note` text CHARACTER SET utf8 COMMENT '客服备注',
  `userId` int(11) NOT NULL COMMENT '用户ID',
  `userName` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '用户名',
  `address_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '收货人',
  `mobile` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系手机',
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '收货地址',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '订单状态 1:待付款 2：待发货  3:待收货 4:完成 5:关闭',
  `supportmetho` tinyint(5) DEFAULT NULL COMMENT '支付方式 1:支付宝 2:货到付款',
  `freetype` int(11) DEFAULT NULL COMMENT '用户快递方式  1:平邮 2:快递 3:ems 0:卖家包邮',
  `freeprice` decimal(10,2) DEFAULT '0.00' COMMENT '快递费用',
  `closemsg` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '关闭原因',
  `support_time` int(11) DEFAULT NULL COMMENT '支付时间',
  `sellerRemark` text CHARACTER SET utf8 COMMENT '客服备注',
  `userfree` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '给用户配送快递方式 0:无需快递',
  `freecode` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '快递编号',
  `fahuoaddress` int(11) DEFAULT NULL COMMENT '发货地址',
  `fahuo_time` int(11) DEFAULT NULL COMMENT '发货时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=121 ;

--
-- 转存表中的数据 `weixin_item_order`
--

INSERT INTO `weixin_item_order` (`id`, `orderId`, `add_time`, `goods_sumPrice`, `order_sumPrice`, `note`, `userId`, `userName`, `address_name`, `mobile`, `address`, `status`, `supportmetho`, `freetype`, `freeprice`, `closemsg`, `support_time`, `sellerRemark`, `userfree`, `freecode`, `fahuoaddress`, `fahuo_time`) VALUES
(76, '201404142312201312', 1397488340, '0.00', '0.00', NULL, 72, 'oP1not63MpXyiZRtsNfcsllqQKRw', '胡伟', '18081399790', '四川省宜宾市江安县竹都大道东段翠峰园', 4, 2, 0, '0.00', NULL, 1397488351, NULL, '0', NULL, NULL, 1397524346),
(78, '201404150943271054', 1397526207, '0.00', '0.00', NULL, 73, 'oP1noty-VxnHKtrXhM0n9MjlYLFc', '陈羽', '15283664558', '四川省宜宾市江安县42米大道翠峰园汇通小额贷款公司', 4, 2, 0, '0.00', NULL, 1397526211, NULL, '0', NULL, NULL, 1397528199),
(79, '201404151141501250', 1397533310, '0.00', '0.00', NULL, 74, 'oP1not0kUq-55wNVwKx7dTW1F8rg', '邓晓娟', '15082603453', '四川省宜宾市市辖区江安县竹都大道汇通公司', 4, 2, 0, '0.00', NULL, 1397533323, NULL, '0', NULL, NULL, 1397552109),
(86, '201406121148211169', 1402544901, '28.00', '28.00', NULL, 61, 'oP1not2XgVZ1Bo8ZlbjDHAovw0mg', '133', '13684151124', '四川省宜宾市江安县美景家园', 4, 2, 0, '0.00', NULL, 1402563174, NULL, '0', NULL, NULL, 1402565245),
(92, '201406121722431854', 1402564963, '45.00', '45.00', NULL, 61, 'oP1not2XgVZ1Bo8ZlbjDHAovw0mg', '133', '13684151124', '四川省宜宾市江安县美景家园', 4, 2, 0, '0.00', NULL, 1402564969, NULL, '0', NULL, NULL, 1402565097),
(110, '201406201141451333', 1403235705, '60.00', '60.00', NULL, 61, 'oP1not2XgVZ1Bo8ZlbjDHAovw0mg', '133', '13684151124', '四川省宜宾市江安县美景家园', 2, 2, 0, '0.00', NULL, 1403235717, NULL, '', NULL, NULL, NULL),
(109, '201406201128361980', 1403234916, '120.00', '120.00', NULL, 100, 'oP1not1j6Bo77J5ZaMWtqT4PTbRI', '王天玉', '18982410087', '四川省宜宾市江安县美景家园', 2, 2, 0, '0.00', NULL, 1403234929, NULL, '', NULL, NULL, NULL),
(98, '201406122200211859', 1402581621, '53.00', '53.00', NULL, 61, 'oP1not2XgVZ1Bo8ZlbjDHAovw0mg', '133', '13684151124', '四川省宜宾市江安县美景家园', 5, NULL, 0, '0.00', '改选其他商品', NULL, NULL, '', NULL, NULL, NULL),
(108, '201406181526191741', 1403076379, '448.00', '448.00', NULL, 61, 'oP1not2XgVZ1Bo8ZlbjDHAovw0mg', '133', '13684151124', '四川省宜宾市江安县美景家园', 2, 2, 0, '0.00', NULL, 1403076383, NULL, '', NULL, NULL, NULL),
(107, '201406181352571959', 1403070777, '60.00', '60.00', NULL, 61, 'oP1not2XgVZ1Bo8ZlbjDHAovw0mg', '133', '13684151124', '四川省宜宾市江安县美景家园', 2, 2, 0, '0.00', NULL, 1403070781, NULL, '', NULL, NULL, NULL),
(106, '201406181237311196', 1403066251, '1029.00', '1029.00', NULL, 61, 'oP1not2XgVZ1Bo8ZlbjDHAovw0mg', '133', '13684151124', '四川省宜宾市江安县美景家园', 2, 2, 0, '0.00', NULL, 1403066259, NULL, '', NULL, NULL, NULL),
(102, '201406131129211535', 1402630161, '60.00', '60.00', NULL, 61, 'oP1not2XgVZ1Bo8ZlbjDHAovw0mg', '133', '13684151124', '四川省宜宾市江安县美景家园', 5, NULL, 0, '0.00', '改选其他卖家', NULL, NULL, '', NULL, NULL, NULL),
(105, '201406181231281158', 1403065888, '11877.00', '11877.00', NULL, 61, 'oP1not2XgVZ1Bo8ZlbjDHAovw0mg', '133', '13684151124', '四川省宜宾市江安县美景家园', 2, 2, 0, '0.00', NULL, 1403065894, NULL, '', NULL, NULL, NULL),
(104, '201406171015061870', 1402971306, '53.00', '53.00', NULL, 61, 'oP1not2XgVZ1Bo8ZlbjDHAovw0mg', '133', '13684151124', '四川省宜宾市江安县美景家园', 2, 2, 0, '0.00', NULL, 1402971311, NULL, '', NULL, NULL, NULL),
(117, '201407061612121895', 1404634332, '183.00', '183.00', NULL, 133, '夏雨荷', '哦陌生', '13458835178', '北京市市辖县密云县哦新破', 1, NULL, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(5, '201308081502021656', 1375945322, '20.00', '20.00', NULL, 1, 'dan8288749', '周建群', '15880765056', '福建省厦门市思明区金沙花园', 1, NULL, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(6, '201312061151471906', 1386301907, '128.00', '135.00', NULL, 30, 'leebay0427', 'leebay', '15802986427', '北京市市辖区东城区西城路西城小区-B-1608', 1, NULL, 1, '7.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(8, '201312061633521179', 1386318832, '216.00', '216.00', NULL, 30, 'leebay0427', 'leebay', '15802986427', '北京市市辖区东城区西城路西城小区-B-1608', 1, NULL, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(9, '201312061635191716', 1386318919, '128.00', '135.00', NULL, 30, 'leebay0427', 'leebay', '15802986427', '北京市市辖区东城区西城路西城小区-B-1608', 1, NULL, 1, '7.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(10, '201312061715471584', 1386321347, '159.00', '159.00', NULL, 30, 'leebay0427', 'leebay', '15802986427', '北京市市辖区东城区西城路西城小区-B-1608', 1, NULL, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(11, '201312061720221961', 1386321622, '159.00', '159.00', NULL, 30, 'leebay0427', 'leebay', '15802986427', '北京市市辖区东城区西城路西城小区-B-1608', 1, NULL, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(12, '201312061721251222', 1386321685, '588.00', '595.00', NULL, 30, 'leebay0427', 'leebay', '15802986427', '北京市市辖区东城区西城路西城小区-B-1608', 1, NULL, 1, '7.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(13, '201312061723131387', 1386321793, '128.00', '135.00', NULL, 30, 'leebay0427', 'leebay', '15802986427', '北京市市辖区东城区西城路西城小区-B-1608', 1, NULL, 1, '7.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(14, '201312061723511812', 1386321831, '159.00', '159.00', NULL, 30, 'leebay0427', 'leebay', '15802986427', '北京市市辖区东城区西城路西城小区-B-1608', 1, NULL, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(15, '201312061724231302', 1386321863, '145.00', '145.00', NULL, 30, 'leebay0427', 'leebay', '15802986427', '北京市市辖区东城区西城路西城小区-B-1608', 1, 1, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(16, '201312061741491771', 1386322909, '3980.00', '3980.00', NULL, 30, 'leebay0427', 'leebay', '15802986427', '北京市市辖区东城区西城路西城小区-B-1608', 1, 1, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(17, '201312062056531943', 1386334613, '441.00', '451.00', NULL, 31, 'test', 'tty', '1234678', '河北省保定市满城县fghj', 4, 2, 2, '10.00', NULL, 1387800565, NULL, '中通速递', '', 22, 1387853373),
(18, '201312221520071750', 1387696807, '747.00', '757.00', NULL, 32, 'vega', 'wp', '13501159554', '北京市市辖区西城区djdn', 4, NULL, 2, '10.00', NULL, NULL, NULL, '韵达快运', '2222222222222', 4, 1387854496),
(19, '201312231418351805', 1387779515, '159.01', '169.01', '顶顶顶顶', 31, 'test', '甄军国', '13458475598', '天津市市辖县静海县我千万千万', 4, 2, 2, '10.00', NULL, 1387779537, '21212', '0', NULL, NULL, 1387852416),
(20, '201312231711241171', 1387789884, '159.00', '159.00', NULL, 30, 'leebay0427', 'leebay', '15802986427', '北京市市辖区东城区西城路西城小区-B-1608', 4, NULL, 0, '0.00', NULL, NULL, '千万千万', '韵达快运', '111111', 22, 1387863150),
(23, '201312241054081049', 1387853648, '434.00', '435.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 4, 2, 1, '1.00', NULL, 1387853651, NULL, 'EMS', 'ems11111', 22, 1387853686),
(24, '201312241055531192', 1387853753, '7960.00', '7960.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 4, 1, 0, '0.00', NULL, NULL, NULL, '圆通速递', '7854121587', 22, 1387853797),
(25, '201312241501001365', 1387868460, '0.02', '5.02', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 5, 1, 1, '5.00', '改选其他商品', NULL, NULL, '', NULL, NULL, NULL),
(26, '201312241818051756', 1387880285, '159.00', '159.00', NULL, 36, '520', '张树林', '18609528895', '河北省石家庄市新华区丁庄', 2, 2, 0, '0.00', NULL, 1387880295, NULL, '', NULL, NULL, NULL),
(27, '201312241818391095', 1387880319, '128.00', '135.00', NULL, 36, '520', '张树林', '18609528895', '河北省石家庄市新华区丁庄', 5, 1, 1, '7.00', '改选其他商品', NULL, NULL, '', NULL, NULL, NULL),
(28, '201312241833521857', 1387881232, '128.00', '135.00', NULL, 36, '520', '张树林', '18609528895', '河北省石家庄市新华区丁庄', 2, 2, 1, '7.00', NULL, 1387881258, NULL, '', NULL, NULL, NULL),
(29, '201312241835301615', 1387881330, '128.00', '128.00', NULL, 36, '520', '张树林', '18609528895', '河北省石家庄市新华区丁庄', 1, 1, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(30, '201312241942521577', 1387885372, '128.00', '143.00', NULL, 36, '520', '张树林', '18609528895', '河北省石家庄市新华区丁庄', 1, 1, 3, '15.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(31, '201312251021131035', 1387938073, '256.00', '263.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 2, 2, 1, '7.00', NULL, 1387938077, NULL, '', NULL, NULL, NULL),
(32, '201312251155281449', 1387943728, '159.00', '159.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 2, 2, 0, '0.00', NULL, 1387943745, NULL, '', NULL, NULL, NULL),
(33, '201312251905051386', 1387969505, '0.02', '5.02', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 1, 1, 1, '5.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(34, '201312251952471400', 1387972367, '0.01', '5.01', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 1, 1, 1, '5.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(35, '201312251954251614', 1387972465, '0.01', '0.01', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 2, 1, 0, '0.00', NULL, 1387973242, NULL, '', NULL, NULL, NULL),
(36, '201312251958251326', 1387972705, '0.01', '0.01', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 1, 1, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(37, '201312252019091916', 1387973949, '0.01', '5.01', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 1, 1, 1, '5.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(38, '201312252020361542', 1387974036, '0.01', '0.01', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 2, 1, 0, '0.00', NULL, 1387974101, NULL, '', NULL, NULL, NULL),
(115, '201407051837321020', 1404556652, '28.00', '28.00', NULL, 61, 'oP1not2XgVZ1Bo8ZlbjDHAovw0mg', '133', '13684151124', '四川省宜宾市江安县美景家园', 1, 3, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(40, '201312261205301214', 1388030730, '128.00', '135.00', NULL, 34, 'oCFWWjlGLYykOGSW5mADwD1aZh0k', '白龙', '11588745566', '北京市市辖区东城区不就默默', 1, 1, 1, '7.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(41, '201312272003331335', 1388145813, '128.00', '128.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 5, NULL, 0, '0.00', '改选其他商品', NULL, NULL, '', NULL, NULL, NULL),
(42, '201312272018201872', 1388146700, '159.00', '159.00', NULL, 47, 'admin1', 'FAG', '180562458154', '山西省太原市杏花岭区FR E', 5, 1, 0, '0.00', '改选其他商品', NULL, NULL, '', NULL, NULL, NULL),
(43, '201312272022231432', 1388146943, '159.00', '159.00', NULL, 47, 'admin1', 'FAG', '180562458154', '山西省太原市杏花岭区FR E', 5, 1, 0, '0.00', '改选其他商品', NULL, NULL, '', NULL, NULL, NULL),
(44, '201312272022471834', 1388146967, '128.00', '135.00', NULL, 47, 'admin1', 'FAG', '180562458154', '山西省太原市杏花岭区FR E', 5, 1, 1, '7.00', '改选其他商品', NULL, NULL, '', NULL, NULL, NULL),
(45, '201312272030071112', 1388147407, '0.01', '0.01', NULL, 48, 'o3AjHjuehNvuyQZHFTjU2Fnxdkbw', '官方丰都', '1869776445', '山西省太原市尖草坪区一封信都', 1, 1, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(46, '201312272031371748', 1388147497, '128.00', '135.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 1, 1, 1, '7.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(47, '201312301358551101', 1388383135, '159.00', '159.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 1, 1, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(48, '201401131142321692', 1389584552, '128.00', '135.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 1, NULL, 1, '7.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(49, '201401151228001457', 1389760080, '128.00', '135.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 1, 3, 1, '7.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(50, '201401151236461888', 1389760606, '159.00', '159.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 1, NULL, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(51, '201401151239391734', 1389760779, '588.00', '595.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 1, 3, 1, '7.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(52, '201401151245241771', 1389761124, '128.00', '135.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 1, 3, 1, '7.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(53, '201401151245451233', 1389761145, '159.00', '159.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 1, 3, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(114, '201407051741481773', 1404553308, '28.00', '28.00', NULL, 61, 'oP1not2XgVZ1Bo8ZlbjDHAovw0mg', '133', '13684151124', '四川省宜宾市江安县美景家园', 1, 4, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(113, '201407021204231061', 1404273863, '60.00', '60.00', NULL, 61, 'oP1not2XgVZ1Bo8ZlbjDHAovw0mg', '133', '13684151124', '四川省宜宾市江安县美景家园', 2, 2, 0, '0.00', NULL, 1404273870, NULL, '', NULL, NULL, NULL),
(56, '201402201722481568', 1392888168, '99.00', '99.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 2, 2, 0, '0.00', NULL, 1392888170, NULL, '', NULL, NULL, NULL),
(57, '201402201731581953', 1392888718, '22.02', '22.02', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 2, 2, 0, '0.00', NULL, 1392888722, NULL, '', NULL, NULL, NULL),
(58, '201402201747021490', 1392889622, '23.00', '23.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 2, 2, 0, '0.00', NULL, 1392889627, NULL, '', NULL, NULL, NULL),
(59, '201402201749391778', 1392889779, '33.00', '33.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 2, 2, 0, '0.00', NULL, 1392889780, NULL, '', NULL, NULL, NULL),
(60, '201402201759371530', 1392890377, '33.00', '33.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 2, 2, 0, '0.00', NULL, 1392890379, NULL, '', NULL, NULL, NULL),
(61, '201402201817201883', 1392891440, '33.00', '33.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 2, 2, 0, '0.00', NULL, 1392891442, NULL, '', NULL, NULL, NULL),
(62, '201402201818151436', 1392891495, '33.00', '33.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 2, 2, 0, '0.00', NULL, 1392891496, NULL, '', NULL, NULL, NULL),
(63, '201402261537481695', 1393400268, '128.00', '135.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 1, 3, 1, '7.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(64, '201402261758401864', 1393408720, '0.01', '0.01', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 1, 3, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(65, '201402261802031150', 1393408923, '0.01', '0.01', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 1, 3, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(66, '201402261803471058', 1393409027, '0.01', '0.01', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 1, 3, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(67, '201402261804201411', 1393409060, '0.01', '0.01', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 1, 3, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(68, '201402261919341852', 1393413574, '11.00', '11.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 1, 3, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(69, '201402261928101038', 1393414090, '11.00', '11.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 1, 3, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(70, '201403041909061545', 1393931346, '0.01', '5.01', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 1, 4, 1, '5.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(71, '201403041946171986', 1393933578, '0.01', '5.01', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 1, 4, 1, '5.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(72, '201403041946541050', 1393933614, '0.01', '5.01', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 2, 4, 1, '5.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(73, '201405301200221085', 1401422422, '22.00', '22.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 2, 4, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(74, '201406031154241693', 1401767664, '128.00', '135.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 1, 4, 1, '7.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(75, '201406031354451666', 1401774885, '128.00', '135.00', NULL, 31, 'test', '甄军国', '13458475598', '天津市市辖区东丽区我千万千万', 1, 4, 1, '7.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(111, '201406301635271839', 1404117327, '28.00', '28.00', NULL, 61, 'oP1not2XgVZ1Bo8ZlbjDHAovw0mg', '133', '13684151124', '四川省宜宾市江安县美景家园', 2, 2, 0, '0.00', NULL, 1404117377, NULL, '', NULL, NULL, NULL),
(112, '201406301638091823', 1404117489, '28.00', '28.00', NULL, 61, 'oP1not2XgVZ1Bo8ZlbjDHAovw0mg', '133', '13684151124', '四川省宜宾市江安县美景家园', 2, 2, 0, '0.00', NULL, 1404117498, NULL, '', NULL, NULL, NULL),
(118, '201407061615451433', 1404634545, '53.00', '53.00', NULL, 133, '夏雨荷', '毛利率', '13468835189', '北京市市辖县密云县吧榴莲控', 1, NULL, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(119, '201407061617181527', 1404634638, '53.00', '53.00', NULL, 133, '夏雨荷', '毛利率', '13468835189', '北京市市辖县密云县吧榴莲控', 1, NULL, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL),
(120, '201407071538031638', 1404718683, '56.00', '56.00', NULL, 134, 'oP1not2XgVZ1Bo8ZlbjDHAovw0mg', '文章', '136181818181', '北京市市辖区东城区天堂路78号', 1, NULL, 0, '0.00', NULL, NULL, NULL, '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_item_orig`
--

CREATE TABLE IF NOT EXISTS `weixin_item_orig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `weixin_item_orig`
--

INSERT INTO `weixin_item_orig` (`id`, `img`, `name`, `url`, `ordid`) VALUES
(1, '50b2e721a6c1e_thumb.jpg', '淘宝', 'taobao.com', 0),
(2, '50b2e726d4ade_thumb.jpg', '天猫', 'tmall.com', 0);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_item_site`
--

CREATE TABLE IF NOT EXISTS `weixin_item_site` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `config` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `weixin_item_site`
--

INSERT INTO `weixin_item_site` (`id`, `code`, `name`, `domain`, `url`, `desc`, `config`, `author`, `ordid`, `status`) VALUES
(5, 'taobao', '淘宝', 'taobao.com,tianmao.com,tmall.com', 'http://www.taobao.com', '通过淘宝开放平台获取商品数据，可到 http://open.taobao.com/ 查看详细', 'a:2:{s:7:"app_key";s:8:"21342572";s:10:"app_secret";s:32:"1f3beed14c1b6f0b42416e4ee5add418";}', 'PinPHP TEAM', 255, 1);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_item_tag`
--

CREATE TABLE IF NOT EXISTS `weixin_item_tag` (
  `item_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `item_id` (`item_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_keyword`
--

CREATE TABLE IF NOT EXISTS `weixin_keyword` (
  `kid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `kename` varchar(300) DEFAULT NULL,
  `kecontent` varchar(500) DEFAULT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1:文本 2：图文',
  `kyword` varchar(255) DEFAULT NULL,
  `titles` varchar(1000) DEFAULT NULL,
  `imageinfo` varchar(1000) DEFAULT NULL,
  `linkinfo` varchar(1000) DEFAULT NULL,
  `ismess` tinyint(1) DEFAULT NULL,
  `isfollow` tinyint(1) DEFAULT NULL,
  `iskey` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`kid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=108 ;

--
-- 转存表中的数据 `weixin_keyword`
--

INSERT INTO `weixin_keyword` (`kid`, `kename`, `kecontent`, `type`, `kyword`, `titles`, `imageinfo`, `linkinfo`, `ismess`, `isfollow`, `iskey`) VALUES
(56, '欢迎', '欢迎关注爱享网赚团队微信号！', 1, '欢迎', NULL, NULL, NULL, NULL, 1, NULL),
(96, '商城首页', '', 2, '商城首页', 'a:1:{i:0;s:12:"商城首页";}', 'a:1:{i:0;s:45:"data/upload/keyword/1405/31/538950e39723f.jpg";}', 'a:1:{i:0;s:20:"http://www.69986.cn/";}', NULL, NULL, 1),
(95, '新品推荐', '', 2, '新品推荐', 'a:5:{i:0;s:12:"新品推荐";i:1;s:22:"江南美食豌豆 88g";i:2;s:20:"喜之郎果冻 200g";i:3;s:19:"南溪豆腐干 95g";i:4;s:16:"酒鬼花生 70g";}', 'a:5:{i:0;s:45:"data/upload/keyword/1403/24/532fcf9054552.jpg";i:1;s:45:"data/upload/keyword/1403/30/5337b0494d528.jpg";i:2;s:45:"data/upload/keyword/1403/30/5337b09e066ad.jpg";i:3;s:45:"data/upload/keyword/1403/30/5337b0db1a9a0.jpg";i:4;s:45:"data/upload/keyword/1403/30/5337b12da8a14.jpg";}', 'a:5:{i:0;s:20:"http://www.69986.cn/";i:1;s:51:"http://www.69986.cn/index.php?m=item&a=index&id=166";i:2;s:51:"http://www.69986.cn/index.php?m=item&a=index&id=165";i:3;s:51:"http://www.69986.cn/index.php?m=item&a=index&id=146";i:4;s:51:"http://www.69986.cn/index.php?m=item&a=index&id=164";}', NULL, NULL, 1),
(88, '回复', '您好，您的消息已收到，我们会尽快处理！', 1, '回复', NULL, NULL, NULL, 1, NULL, NULL),
(92, '会员专享', '呃呃呃', 2, '会员专享', 'a:2:{i:0;s:12:"会员专享";i:1;s:36:"化妆镜荷塘清趣单面陶瓷镜";}', 'a:2:{i:0;s:45:"data/upload/keyword/1312/24/52b929bd815f0.jpg";i:1;s:45:"data/upload/keyword/1312/26/52bba35664e9f.jpg";}', 'a:2:{i:0;s:51:"http://www.69986.cn/index.php?m=book&a=cate&cid=346";i:1;s:61:"http://wx.breadth.com.cn/shop/index.php?m=item&a=index&id=126";}', NULL, NULL, 1),
(98, '购物车', '', 2, '购物车', 'a:1:{i:0;s:9:"购物车";}', 'a:1:{i:0;s:45:"data/upload/keyword/1405/31/538950e39723f.jpg";}', 'a:1:{i:0;s:55:"http://www.net235.net/shop/index.php?m=shopcart&a=index";}', NULL, NULL, 1),
(99, '用户中心', '', 2, '用户中心', 'a:1:{i:0;s:12:"用户中心";}', 'a:1:{i:0;s:45:"data/upload/keyword/1312/26/52bba4d509614.jpg";}', 'a:1:{i:0;s:44:"http://www.69986.cn/index.php?m=user&a=index";}', NULL, NULL, 1),
(100, '快递查询', '查询快递，请输入“快递：快递公司名称+单号”，如“快递：汇通快运350070316281”。', 1, '快递查询', '', '', '', NULL, NULL, 1),
(101, '我的订单', '', 2, '我的订单', 'a:1:{i:0;s:12:"我的订单";}', 'a:1:{i:0;s:45:"data/upload/keyword/1405/31/538950e39723f.jpg";}', 'a:1:{i:0;s:53:"http://www.69986.cn/index.php?m=user&a=index&status=2";}', NULL, NULL, 1),
(102, '收货地址', '', 2, '收货地址', 'a:1:{i:0;s:18:"管理收货地址";}', 'a:1:{i:0;s:45:"data/upload/keyword/1405/31/538950e39723f.jpg";}', 'a:1:{i:0;s:46:"http://www.69986.cn/index.php?m=user&a=address";}', NULL, NULL, 1),
(104, '购物指南', '', 2, '购物指南', 'a:5:{i:0;s:12:"购物指南";i:1;s:57:"【视频教程】怎么添加江安优客来微信号？";i:2;s:39:"【视频教程】怎么购买商品？";i:3;s:57:"【图文教程】怎么添加江安优客来微信号？";i:4;s:39:"【图文教程】怎么购买商品？";}', 'a:5:{i:0;s:45:"data/upload/keyword/1403/30/5337d83059efa.jpg";i:1;s:45:"data/upload/keyword/1403/29/5336c1c10a00c.jpg";i:2;s:45:"data/upload/keyword/1403/29/5336c1c10a00c.jpg";i:3;s:45:"data/upload/keyword/1403/29/5336c1c10a00c.jpg";i:4;s:45:"data/upload/keyword/1403/29/5336c1c10a00c.jpg";}', 'a:5:{i:0;s:20:"http://www.69986.cn/";i:1;s:107:"http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&mid=200483223&idx=1&sn=1a0d36c341ca8f5baa3ee143a75027c8#rd";i:2;s:107:"http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&mid=200496233&idx=1&sn=5a625e275bc52953a0271b13c3def2bd#rd";i:3;s:107:"http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&mid=200497202&idx=1&sn=8d40ec28a479d87a6f036fe3ccbe3163#rd";i:4;s:107:"http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&mid=200497229&idx=1&sn=44b534479abc812959ab387496df0d59#rd";}', NULL, NULL, 1),
(105, '联系我们', '服务热线：\n13680009000', 1, '联系我们', '', '', '', NULL, NULL, 1),
(106, '我要留言', '如要留言请输入“留言：你的留言内容”，如“留言：大家好！”', 1, '我要留言', '', '', '', NULL, NULL, 1),
(107, '我要打车', '', 2, '我要打车', 'a:3:{i:0;s:30:"我要打车（全程接送）";i:1;s:27:"****马上联系的士*****";i:2;s:27:"****查看的士线路*****";}', 'a:3:{i:0;s:45:"data/upload/keyword/1406/04/538e8945ec3c2.jpg";i:1;s:45:"data/upload/keyword/1406/05/539035914daf9.png";i:2;s:45:"data/upload/keyword/1406/05/5390346dea118.png";}', 'a:3:{i:0;s:129:"http://qiao.baidu.com/v3/?module=mobile&controller=mobileim&action=index&ucid=7113771&siteid=4896040&bid=6405806cc922b01a0289a99a";i:1;s:129:"http://qiao.baidu.com/v3/?module=mobile&controller=mobileim&action=index&ucid=7113771&siteid=4896040&bid=6405806cc922b01a0289a99a";i:2;s:107:"http://mp.weixin.qq.com/s?__biz=MzA4NTQ1NzcyNw==&mid=201286862&idx=1&sn=caa8d285bc6963bd484b2f0c997785d5#rd";}', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_mail_queue`
--

CREATE TABLE IF NOT EXISTS `weixin_mail_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mail_to` varchar(120) NOT NULL,
  `mail_subject` varchar(255) NOT NULL,
  `mail_body` text NOT NULL,
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `err_num` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL,
  `lock_expiry` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_menu`
--

CREATE TABLE IF NOT EXISTS `weixin_menu` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `pid` smallint(6) NOT NULL,
  `module_name` varchar(20) NOT NULL,
  `action_name` varchar(20) NOT NULL,
  `data` varchar(120) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `often` tinyint(1) NOT NULL DEFAULT '0',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `display` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=311 ;

--
-- 转存表中的数据 `weixin_menu`
--

INSERT INTO `weixin_menu` (`id`, `name`, `pid`, `module_name`, `action_name`, `data`, `remark`, `often`, `ordid`, `display`) VALUES
(1, '全局', 0, 'setting', 'index', '', '', 0, 7, 0),
(2, '核心设置', 1, 'setting', 'index', '', '', 0, 0, 1),
(3, '全局参数', 148, 'setting', 'index', '&type=site', '', 0, 2, 1),
(4, '邮件设置', 148, 'setting', 'index', '&type=mail', '', 0, 5, 1),
(172, '专辑管理', 285, 'album', 'index', '', '', 0, 4, 1),
(6, '菜单管理', 2, 'menu', 'index', '', '', 0, 7, 1),
(7, '新增', 6, 'menu', 'add', '', '', 0, 0, 0),
(8, '编辑', 6, 'menu', 'edit', '', '', 0, 0, 0),
(9, '删除', 6, 'menu', 'delete', '', '', 0, 0, 0),
(10, '运营', 0, 'operate', 'index', '', '', 0, 4, 0),
(11, '广告管理', 10, 'advert', 'index', '', '', 0, 2, 1),
(12, '广告管理', 11, 'ad', 'index', '', '', 5, 0, 1),
(13, '广告位管理', 11, 'adboard', 'index', '', '', 0, 0, 0),
(14, '友情链接', 10, 'flink', 'index', '', '', 0, 3, 0),
(15, '友情链接', 14, 'flink', 'index', '', '', 0, 0, 1),
(16, '链接分类', 14, 'flink_cate', 'index', '', '', 0, 0, 1),
(17, '新增', 15, 'flink', 'add', '', '', 0, 0, 0),
(18, '编辑', 15, 'flink', 'edit', '', '', 0, 0, 0),
(19, '删除', 15, 'flink', 'delete', '', '', 0, 0, 0),
(20, '新增', 16, 'flink_cate', 'add', '', '', 0, 0, 0),
(21, '编辑', 16, 'flink_cate', 'edit', '', '', 0, 0, 0),
(22, '删除', 16, 'flink_cate', 'del', '', '', 0, 0, 0),
(23, '新增', 12, 'ad', 'add', '', '', 0, 0, 0),
(24, '编辑', 12, 'ad', 'edit', '', '', 0, 0, 0),
(25, '删除', 12, 'ad', 'delete', '', '', 0, 0, 0),
(26, '新增', 13, 'adboard', 'add', '', '', 0, 0, 0),
(27, '编辑', 13, 'adboard', 'edit', '', '', 0, 0, 0),
(28, '删除', 13, 'adboard', 'delete', '', '', 0, 0, 0),
(29, '数据', 0, 'data', 'index', '', '', 0, 5, 0),
(258, '商品分类', 256, 'score_item_cate', 'index', '', '', 0, 255, 1),
(31, '数据库管理', 29, 'backup', 'index', '', '', 0, 2, 1),
(32, '数据备份', 31, 'backup', 'index', '', '', 0, 0, 1),
(33, '数据恢复', 31, 'backup', 'restore', '', '', 0, 0, 1),
(34, '缓存管理', 254, 'cache', 'index', '', '', 0, 0, 1),
(195, '登陆接口', 245, 'oauth', 'index', '', '', 0, 2, 0),
(36, '黑名单管理', 117, 'ipban', 'index', '', '', 0, 3, 0),
(37, '新增', 36, 'ipban', 'add', '', '', 0, 0, 0),
(38, '编辑', 36, 'ipban', 'edit', '', '', 0, 0, 0),
(50, '商品', 0, 'content', 'index', '', '', 0, 1, 0),
(51, '商品管理', 50, 'article', 'index', '', '', 0, 1, 1),
(52, '商品管理', 51, 'item', 'index', '', '', 1, 1, 1),
(54, '编辑', 52, 'article', 'edit', '', '', 0, 3, 0),
(190, '删除', 52, 'item', 'delete', '', '', 0, 4, 0),
(56, '商品分类', 51, 'item_cate', 'index', '', '', 1, 6, 1),
(57, '新增', 56, 'article_cate', 'add', '', '', 0, 0, 0),
(58, '编辑', 56, 'article_cate', 'edit', '', '', 0, 0, 0),
(59, '删除', 56, 'article_cate', 'delete', '', '', 0, 0, 0),
(60, '管理员管理', 1, 'admin', 'index', '', '', 0, 4, 1),
(61, '管理员管理', 60, 'admin', 'index', '', '', 7, 0, 1),
(62, '新增', 61, 'admin', 'add', '', '', 0, 0, 0),
(63, '编辑', 61, 'admin', 'edit', '', '', 0, 0, 0),
(64, '删除', 61, 'admin', 'delete', '', '', 0, 0, 0),
(65, '角色管理', 60, 'admin_role', 'index', '', '', 7, 0, 1),
(66, '新增', 65, 'admin_role', 'add', '', '', 0, 0, 0),
(192, '淘宝采集', 164, 'collect_alimama', 'index', '', '', 0, 0, 1),
(70, '用户', 0, 'user', 'index', '', '', 0, 3, 0),
(119, '新增', 149, 'user', 'add', '', '', 0, 3, 0),
(118, '编辑', 149, 'user', 'edit', '', '', 0, 4, 0),
(117, '会员管理', 70, 'user', 'index', '', '', 0, 0, 1),
(156, '文章分类', 154, 'article_cate', 'index', '', '', 0, 3, 1),
(151, '导航设置', 216, 'nav', 'index', '', '', 0, 1, 1),
(149, '会员管理', 117, 'user', 'index', '', '', 0, 1, 1),
(150, '删除', 149, 'user', 'delete', '', '', 0, 5, 0),
(152, '主导航', 151, 'nav', 'index', '&type=main', '', 0, 1, 1),
(153, '底部导航', 151, 'nav', 'index', '&type=bottom', '', 0, 2, 1),
(154, '文章管理', 10, 'article', 'index', '', '', 0, 1, 1),
(155, '文章管理', 154, 'article', 'index', '', '', 0, 1, 1),
(148, '站点设置', 2, 'setting', 'index', '', '', 0, 0, 1),
(157, '添加文章', 155, 'article', 'add', '', '', 0, 2, 1),
(158, '编辑', 155, 'article', 'edit', '', '', 0, 3, 0),
(159, '删除', 155, 'article', 'delete', '', '', 0, 4, 0),
(160, '新增', 156, 'article_cate', 'add', '', '', 0, 0, 0),
(161, '编辑', 156, 'article_cate', '编辑', '', '', 0, 0, 0),
(162, '删除', 156, 'article_cate', 'delete', '', '', 0, 0, 0),
(164, '商品采集', 50, 'item_collect', 'index', '', '', 0, 2, 0),
(173, '专辑管理', 172, 'album', 'index', '', '', 0, 1, 1),
(174, '专辑分类', 172, 'album_cate', 'index', '', '', 0, 3, 1),
(175, '新增', 174, 'album_cate', 'add', '', '', 0, 0, 0),
(176, '编辑', 174, 'album_cate', 'edit', '', '', 0, 0, 0),
(177, '删除', 174, 'album_cate', 'delete', '', '', 0, 0, 0),
(178, '敏感词管理', 254, 'badword', 'index', '', '', 0, 4, 1),
(179, '新增', 178, 'badword', 'add', '', '', 0, 0, 0),
(180, '编辑', 178, 'badword', 'edit', '', '', 0, 0, 0),
(181, '删除', 36, 'ipban', 'delete', '', '', 0, 0, 0),
(182, '删除', 178, 'badword', 'delete', '', '', 0, 0, 0),
(255, '采集马甲', 117, 'auto_user', 'index', '', '', 0, 2, 0),
(184, '标签管理', 254, 'tag', 'index', '', '', 0, 3, 1),
(185, '商品接口', 245, 'item_site', 'index', '', '', 0, 1, 1),
(186, '商品评论', 51, 'item_comment', 'index', '', '', 1, 1, 1),
(187, '删除', 186, 'item_comment', 'delete', '', '', 0, 0, 0),
(265, '删除', 257, 'score_item', 'edit', '', '', 0, 4, 0),
(250, '一键删除', 51, 'item', 'delete_search', '', '', 0, 5, 1),
(198, '新增', 196, 'message', 'add', '', '', 0, 0, 0),
(199, '商品来源', 51, 'item_orig', 'index', '', '', 0, 6, 0),
(200, '新增', 199, 'item_orig', 'add', '', '', 0, 0, 0),
(201, '编辑', 199, 'item_orig', 'edit', '', '', 0, 0, 0),
(202, '删除', 199, 'item_orig', 'delete', '', '', 0, 0, 0),
(203, '商品审核', 51, 'item', 'check', '', '', 0, 5, 0),
(249, '添加商品', 51, 'item', 'add', '', '', 1, 3, 1),
(259, '新增', 258, 'score_item_cate', 'add', '', '', 0, 255, 0),
(268, '批量添加', 164, 'collect_batch', 'index', '', '', 0, 255, 0),
(269, '积分设置', 2, 'score', 'setting', '', '', 0, 3, 0),
(210, '专辑审核', 172, 'album', 'check', '', '', 0, 2, 1),
(257, '积分商品', 256, 'score_item', 'index', '', '', 0, 255, 1),
(212, '日志管理', 29, 'log', 'index', '', '', 0, 3, 0),
(213, '管理员日志', 212, 'log', 'index', '', '', 0, 0, 0),
(214, '用户日志', 212, 'log', 'user', '', '', 0, 0, 1),
(215, '积分日志', 212, 'log', 'score', '', '', 0, 0, 0),
(216, '界面设置', 1, 'setting', 'index', '&type=show', '', 0, 2, 0),
(256, '积分商城', 70, 'score_item', 'index', '', '', 0, 255, 0),
(254, '系统数据', 29, 'tag', 'index', '', '', 0, 1, 1),
(264, '编辑', 257, 'score_item', 'edit', '', '', 0, 3, 0),
(263, '添加商品', 257, 'score_item', 'add', '', '', 0, 2, 1),
(262, '积分订单', 256, 'score_order', 'index', '', '', 0, 255, 1),
(261, '删除', 258, 'score_item_cate', 'delete', '', '', 0, 255, 0),
(260, '编辑', 258, 'score_item_cate', 'edit', '', '', 0, 255, 0),
(232, '站内信管理', 70, 'message', 'index', '', '', 0, 0, 0),
(233, '系统通知', 232, 'message', 'index', '&type=1', '', 0, 0, 1),
(234, '用户私信', 232, 'message', 'index', '&type=2', '', 0, 0, 1),
(235, '通知模版', 2, 'message_tpl', 'index', '&type=msg', '', 0, 4, 0),
(236, '添加模版', 235, 'message_tpl', 'add', '', '', 0, 7, 1),
(237, '编辑', 235, 'message_tpl', 'edit', '', '', 0, 255, 0),
(238, '删除', 235, 'message_tpl', 'delete', '', '', 0, 255, 0),
(240, '单页管理', 154, 'article', 'page', '', '', 0, 2, 1),
(242, '积分记录', 269, 'score', 'logs', '', '', 0, 2, 1),
(244, '应用', 0, 'plugin', 'index', '', '', 0, 6, 0),
(245, '系统接口', 244, 'apis', 'index', '', '', 0, 1, 1),
(246, '应用管理', 244, 'plugin', 'index', '', '', 0, 3, 0),
(247, '应用中心', 246, 'plugin', 'index', '', '', 0, 0, 1),
(248, '已安装应用', 246, 'plugin', 'list', '', '', 0, 0, 1),
(252, '用户整合', 245, 'integrate', 'index', '', '', 0, 255, 0),
(253, '图片模式', 52, 'item', 'index', '&sm=image', '', 0, 2, 1),
(267, '批量注册', 149, 'user', 'add_users', '', '', 0, 2, 1),
(270, '邮件模板', 235, 'message_tpl', 'index', '&type=mail', '', 0, 6, 1),
(271, '短消息模板', 235, 'message_tpl', 'index', '&type=msg', '', 0, 5, 1),
(272, '附件设置', 148, 'setting', 'index', '&type=attachment', '', 0, 4, 1),
(273, '显示设置', 216, 'setting', 'index', '&type=style', '', 0, 2, 1),
(274, '模板管理', 216, 'template', 'index', '', '', 6, 3, 1),
(275, '站点设置', 148, 'setting', 'index', '', '', 6, 1, 1),
(276, '积分设置', 269, 'score', 'setting', '', '', 0, 1, 1),
(277, '商品管理', 52, 'item', 'index', '', '', 0, 1, 1),
(278, '文章管理', 155, 'article', 'index', '', '', 0, 1, 1),
(279, '会员管理', 149, 'user', 'index', '', '', 3, 1, 1),
(280, '积分商品', 257, 'score_item', 'index', '', '', 0, 1, 1),
(281, '淘宝评论', 164, 'cmt_taobao', 'index', '', '', 0, 255, 0),
(282, 'SEO设置', 2, 'seo', 'url', '', '', 0, 5, 0),
(283, 'UR静态化', 282, 'seo', 'url', '', '', 0, 255, 1),
(284, '页面SEO', 282, 'seo', 'page', '', '', 0, 255, 1),
(285, '专辑', 0, 'album', 'index', '', '', 0, 2, 0),
(286, '注册登陆', 2, 'setting', 'user', '', '', 6, 2, 1),
(293, '编辑', 291, 'brandlist', ' edit', '', '', 0, 255, 0),
(292, '新增', 291, 'brandlist', 'add', '', '', 0, 255, 0),
(291, '品牌管理', 51, 'brandlist', 'index', '', '', 1, 1, 1),
(294, '删除', 291, 'brandlist', 'delete', '', '', 0, 255, 0),
(295, '交易管理', 50, 'item_order', 'index', '', '', 0, 255, 1),
(296, '订单管理', 295, 'item_order', 'index', '', '', 2, 255, 1),
(297, '快递方式管理', 295, 'delivery', 'index', '', '', 2, 255, 1),
(298, '发货地址管理', 295, 'address', 'index', '', '', 2, 255, 1),
(299, '回复设置', 0, 'keyword', 'index', '', '', 0, 2, 0),
(300, '回复设置', 299, 'keyword', 'index', '', '', 0, 255, 1),
(301, '关键词自动回复', 300, 'keyword', 'addkeyword', '', '', 4, 255, 1),
(302, '消息自动回复', 300, 'keyword', 'addmess', '', '', 4, 255, 1),
(303, '关注自动回复', 300, 'keyword', 'addfollow', '', '', 4, 255, 1),
(304, '收款方式设置', 295, 'alipay', 'index', '', '', 2, 255, 1),
(305, '自定义菜单', 300, 'custom_menu', 'index', '', '', 4, 255, 1),
(306, '添加', 305, 'custom_menu', 'add', '', '', 0, 255, 0),
(307, '编辑', 305, 'custom_menu', 'edit', '', '', 0, 255, 0),
(308, '删除', 305, 'custom_menu', 'delete', '', '', 0, 255, 0),
(309, '留言管理', 149, 'message', 'index', '', '', 3, 1, 1),
(310, '快递查询', 295, 'delivery', 'kdcx', '', '', 2, 254, 1);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_message`
--

CREATE TABLE IF NOT EXISTS `weixin_message` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ftid` int(10) unsigned NOT NULL,
  `from_id` int(10) NOT NULL,
  `from_name` varchar(50) NOT NULL,
  `to_id` int(10) NOT NULL,
  `to_name` varchar(50) NOT NULL,
  `add_time` int(10) NOT NULL,
  `info` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `weixin_message`
--

INSERT INTO `weixin_message` (`id`, `ftid`, `from_id`, `from_name`, `to_id`, `to_name`, `add_time`, `info`, `status`) VALUES
(14, 0, 0, 'oCFWWjlGLYykOGSW5mADwD1aZh0k', 0, 'gh_5634eebb182c', 1388127793, '很好啊aaa', 1),
(2, 0, 0, 'oCFWWjlGLYykOGSW5mADwD1aZh0k', 0, '', 1388115582, '你好', 1),
(3, 0, 0, 'oCFWWjlGLYykOGSW5mADwD1aZh0k', 0, '', 1388115852, '你好', 1),
(4, 0, 0, 'oCFWWjlGLYykOGSW5mADwD1aZh0k', 0, '', 1388116043, '你好', 1),
(5, 0, 0, 'oCFWWjlGLYykOGSW5mADwD1aZh0k', 0, 'gh_5634eebb182c', 1388116122, '你好', 1),
(6, 0, 0, 'oCFWWjlGLYykOGSW5mADwD1aZh0k', 0, 'gh_5634eebb182c', 1388116169, '你好', 1),
(7, 0, 0, 'oCFWWjlGLYykOGSW5mADwD1aZh0k', 0, '', 1388116233, '你好', 1),
(8, 0, 0, 'oCFWWjlGLYykOGSW5mADwD1aZh0k', 0, '0', 1388116374, '你好', 1),
(15, 0, 0, 'oCFWWjlGLYykOGSW5mADwD1aZh0k', 0, 'gh_5634eebb182c', 1388393582, '1111', 1),
(10, 0, 0, 'oCFWWjlGLYykOGSW5mADwD1aZh0k', 0, 'gh_5634eebb182c', 1388116741, '你好', 1),
(13, 0, 0, 'oCFWWjlGLYykOGSW5mADwD1aZh0k', 0, 'gh_5634eebb182c', 1388127684, '大家好顶顶顶啊', 1),
(12, 0, 0, 'oCFWWjlGLYykOGSW5mADwD1aZh0k', 0, 'gh_5634eebb182c', 1388116937, '怎么会这样啊', 1);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_message_tpl`
--

CREATE TABLE IF NOT EXISTS `weixin_message_tpl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `is_sys` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `alias` varchar(50) NOT NULL COMMENT '别名',
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `weixin_message_tpl`
--

INSERT INTO `weixin_message_tpl` (`id`, `type`, `is_sys`, `name`, `alias`, `content`) VALUES
(1, 'msg', 1, '登录', 'login', '<p>\r\n	欢迎\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<div>\r\n	<p>\r\n		<span style="font-size:10.5000pt;font-family:''宋体'';">拼品网是一个集购物与分享与一体的网站，它会带给你惊喜，它让你与心仪的宝贝不期而遇，同时和朋友一起逛，分享每一次的购物乐趣，惊喜不断<span>~</span></span><span style="font-size:10.5000pt;font-family:''宋体'';"></span> \r\n	</p>\r\n	<p>\r\n		<span style="font-size:10.5000pt;font-family:''宋体'';"></span> \r\n	</p>\r\n	<p>\r\n		<span style="font-size:10.5000pt;font-family:''宋体'';">为了更好地开始专属于你的购物之旅，你可以：</span><span style="font-size:10.5000pt;font-family:''宋体'';"></span> \r\n	</p>\r\n	<p>\r\n		<span style="font-size:10.5000pt;font-family:''宋体'';"></span> \r\n	</p>\r\n	<p>\r\n		<span style="font-size:10.5000pt;font-family:''宋体'';">1<span>、发现更多美好</span></span><span style="font-size:10.5000pt;font-family:''宋体'';"></span> \r\n	</p>\r\n	<p>\r\n		<span style="font-size:10.5000pt;font-family:''宋体'';"></span> \r\n	</p>\r\n	<p>\r\n		<span style="font-size:10.5000pt;font-family:''宋体'';">2<span>、寻找喜好相投的好友</span></span><span style="font-size:10.5000pt;font-family:''宋体'';"></span> \r\n	</p>\r\n	<p>\r\n		<span style="font-size:10.5000pt;font-family:''宋体'';"></span> \r\n	</p>\r\n	<p>\r\n		<span style="font-size:10.5000pt;font-family:''宋体'';">4<span>、创建属于自己的专辑</span></span><span style="font-size:10.5000pt;font-family:''宋体'';"></span> \r\n	</p>\r\n	<p>\r\n		<span style="font-size:10.5000pt;font-family:''宋体'';"></span> \r\n	</p>\r\n	<p>\r\n		<span style="font-size:10.5000pt;font-family:''宋体'';">5<span>、邀请你的好友一起发现美丽</span></span><span style="font-size:10.5000pt;font-family:''宋体'';"></span> \r\n	</p>\r\n	<p>\r\n		<span style="font-size:10.5000pt;font-family:''宋体'';"></span> \r\n	</p>\r\n	<p>\r\n		<span style="font-size:10.5000pt;font-family:''宋体'';">6<span>、分享更多好东西</span></span><span style="font-size:10.5000pt;font-family:''宋体'';"></span> \r\n	</p>\r\n	<p>\r\n		<span style="font-size:10.5000pt;font-family:''宋体'';"></span> \r\n	</p>\r\n	<p>\r\n		<span style="font-size:10.5000pt;font-family:''宋体'';"></span> \r\n	</p>\r\n	<p>\r\n		<span style="font-size:10.5000pt;font-family:''宋体'';">欢迎联系使用拼品网，我们随时恭候你的提问和建议。</span><span style="font-size:10.5000pt;font-family:''宋体'';"></span> \r\n	</p>\r\n	<p>\r\n		<span style="font-size:10.5000pt;font-family:''宋体'';">祝您玩的愉快<span>^^</span></span> \r\n	</p>\r\n</div>\r\n<p>\r\n	<br />\r\n</p>'),
(3, 'mail', 1, '找回密码', 'findpwd', '<p>\r\n	尊敬的{$username}:\r\n</p>\r\n<p style="padding-left:30px;">\r\n	您好, 您刚才在 {$site_name} 申请了重置密码，请点击下面的链接进行重置：\r\n</p>\r\n<p style="padding-left:30px;">\r\n	<a href="{$reset_url}">{$reset_url}</a> \r\n</p>\r\n<p style="padding-left:30px;">\r\n	此链接只能使用一次, 如果失效请重新申请. 如果以上链接无法点击，请将它拷贝到浏览器(例如IE)的地址栏中。\r\n</p>\r\n<p style="text-align:right;">\r\n	{$site_name}\r\n</p>\r\n<p style="text-align:right;">\r\n	{$send_time}\r\n</p>');

-- --------------------------------------------------------

--
-- 表的结构 `weixin_nav`
--

CREATE TABLE IF NOT EXISTS `weixin_nav` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `alias` varchar(20) NOT NULL,
  `link` varchar(255) NOT NULL,
  `target` tinyint(1) NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `mod` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `weixin_nav`
--

INSERT INTO `weixin_nav` (`id`, `type`, `name`, `alias`, `link`, `target`, `ordid`, `mod`, `status`) VALUES
(1, 'main', '发现', 'book', '', 0, 255, 'sys', 1),
(2, 'main', '专辑', 'album', '', 0, 255, 'sys', 1),
(3, 'main', '集市', 'cate', '?m=book&a=cate&cid=1', 0, 255, '', 1),
(4, 'bottom', '发现', 'book', '', 0, 255, 'sys', 1),
(5, 'main', '兑换', 'exchange', '', 0, 255, 'sys', 1),
(6, 'bottom', '专辑', 'album', '', 0, 255, 'sys', 1),
(7, 'bottom', '集市', 'cate', '?m=book&a=cate&cid=1', 0, 255, '', 1),
(8, 'bottom', '兑换', 'exchange', '', 0, 255, 'sys', 1);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_oauth`
--

CREATE TABLE IF NOT EXISTS `weixin_oauth` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `config` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `weixin_oauth`
--

INSERT INTO `weixin_oauth` (`id`, `code`, `name`, `config`, `desc`, `author`, `ordid`, `status`) VALUES
(4, 'qq', 'QQ登录', 'a:2:{s:7:"app_key";s:9:"100330010";s:10:"app_secret";s:32:"098381fd5d6a89f44127d61f0f2645da";}', '申请地址：http://connect.opensns.qq.com/', 'PinPHP TEAM', 2, 1),
(7, 'sina', '微博登陆', 'a:2:{s:7:"app_key";s:10:"3115666660";s:10:"app_secret";s:32:"e59677c031210b6d063a2661b6a895cf";}', '申请地址：http://open.weibo.com/', 'PinPHP TEAM', 1, 1),
(8, 'taobao', '淘宝登录', 'a:2:{s:7:"app_key";s:8:"21270789";s:10:"app_secret";s:32:"0c28536510e0b0b429750f478222d549";}', '申请地址：http://open.taobao.com/', 'PinPHP TEAM', 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_order_detail`
--

CREATE TABLE IF NOT EXISTS `weixin_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '订单编号',
  `itemId` int(11) NOT NULL COMMENT '商品ID',
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品名称',
  `img` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '图片路径',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '单价',
  `quantity` int(11) NOT NULL COMMENT '购买数量',
  `shuxing` varchar(125) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=147 ;

--
-- 转存表中的数据 `weixin_order_detail`
--

INSERT INTO `weixin_order_detail` (`id`, `orderId`, `itemId`, `title`, `img`, `price`, `quantity`, `shuxing`) VALUES
(2, '201308071922091735', 120, '粉红大布娃娃 2013夏款蓝白条纹海军风复古翻领短袖连衣裙', '1308/05/51ff3011cca0f.jpg', '159.00', 1, ''),
(3, '201308071926441715', 120, '粉红大布娃娃 2013夏款蓝白条纹海军风复古翻领短袖连衣裙', '1308/05/51ff3011cca0f.jpg', '159.00', 1, ''),
(4, '201308071958511781', 120, '粉红大布娃娃 2013夏款蓝白条纹海军风复古翻领短袖连衣裙', '1308/05/51ff3011cca0f.jpg', '159.00', 1, ''),
(5, '201308081502021656', 122, '测试商品1', '1308/08/52033f4755a0e.jpg', '20.00', 1, ''),
(6, '201312061151471906', 126, '手工陶瓷化妆镜 荷塘清趣单面陶瓷镜', '1312/06/52a13ccd90d97.jpg', '128.00', 1, ''),
(7, '201312061300081003', 126, '手工陶瓷化妆镜 荷塘清趣单面陶瓷镜', '1312/06/52a13ccd90d97.jpg', '128.00', 1, ''),
(8, '201312061633521179', 130, '儿童节创意礼物 苹果水晶内雕', '1312/06/52a184a53e076.jpg', '216.00', 1, ''),
(9, '201312061635191716', 126, '手工陶瓷化妆镜 荷塘清趣单面陶瓷镜', '1312/06/52a13ccd90d97.jpg', '128.00', 1, ''),
(10, '201312061715471584', 125, '韩版可爱小熊水钻毛衣链', '1312/06/52a13bfb50e7e.jpg', '159.00', 1, ''),
(11, '201312061720221961', 125, '韩版可爱小熊水钻毛衣链', '1312/06/52a13bfb50e7e.jpg', '159.00', 1, ''),
(12, '201312061721251222', 127, '气若幽兰奢华双层披肩', '1312/06/52a13e3d41205.jpg', '588.00', 1, ''),
(13, '201312061723131387', 126, '手工陶瓷化妆镜 荷塘清趣单面陶瓷镜', '1312/06/52a13ccd90d97.jpg', '128.00', 1, ''),
(14, '201312061723511812', 125, '韩版可爱小熊水钻毛衣链', '1312/06/52a13bfb50e7e.jpg', '159.00', 1, ''),
(15, '201312061724231302', 131, '定制保健木鱼石杯', '1312/06/52a189a10fbef.jpg', '145.00', 1, ''),
(16, '201312061741491771', 134, '爱牵手白18K金钻石情侣对戒 戒指', '1312/06/52a18b245090f.jpg', '3980.00', 1, ''),
(17, '201312062056531943', 125, '韩版可爱小熊水钻毛衣链', '1312/06/52a13bfb50e7e.jpg', '159.00', 1, ''),
(18, '201312062056531943', 129, '个性定制方形木艺化妆镜', '1312/06/52a18440878e3.jpg', '282.00', 1, ''),
(19, '201312221520071750', 127, '气若幽兰奢华双层披肩', '1312/06/52a13e3d41205.jpg', '588.00', 1, ''),
(20, '201312221520071750', 125, '韩版可爱小熊水钻毛衣链', '1312/06/52a13bfb50e7e.jpg', '159.00', 1, ''),
(21, '201312231418351805', 135, '歌曲', '1312/23/52b7d4f5bb2ee.jpg', '0.01', 1, ''),
(22, '201312231418351805', 125, '韩版可爱小熊水钻毛衣链', '1312/06/52a13bfb50e7e.jpg', '159.00', 1, ''),
(23, '201312231711241171', 125, '韩版可爱小熊水钻毛衣链', '1312/06/52a13bfb50e7e.jpg', '159.00', 1, ''),
(24, '201312232008591931', 126, '手工陶瓷化妆镜 荷塘清趣单面陶瓷镜', '1312/06/52a13ccd90d97.jpg', '128.00', 1, ''),
(25, '201312232008591931', 133, '玫瑰人生施华洛世奇水晶化妆镜礼盒', '1312/06/52a18a5ac1492.jpg', '128.00', 99, ''),
(26, '201312240952361957', 135, '歌曲', '1312/23/52b7d4f5bb2ee.jpg', '0.01', 3, ''),
(27, '201312241054081049', 130, '儿童节创意礼物 苹果水晶内雕', '1312/06/52a184a53e076.jpg', '216.00', 2, ''),
(28, '201312241054081049', 136, '小星星', '1312/24/52b8ef4873b78.jpg', '1.00', 2, ''),
(29, '201312241055531192', 134, '爱牵手白18K金钻石情侣对戒 戒指', '1312/06/52a18b245090f.jpg', '3980.00', 2, ''),
(30, '201312241501001365', 135, '歌曲', '1312/23/52b7d4f5bb2ee.jpg', '0.01', 2, ''),
(31, '201312241818051756', 125, '韩版可爱小熊水钻毛衣链', '1312/06/52a13bfb50e7e.jpg', '159.00', 1, ''),
(32, '201312241818391095', 126, '手工陶瓷化妆镜 荷塘清趣单面陶瓷镜', '1312/06/52a13ccd90d97.jpg', '128.00', 1, ''),
(33, '201312241833521857', 126, '手工陶瓷化妆镜 荷塘清趣单面陶瓷镜', '1312/06/52a13ccd90d97.jpg', '128.00', 1, ''),
(34, '201312241835301615', 133, '玫瑰人生施华洛世奇水晶化妆镜礼盒', '1312/06/52a18a5ac1492.jpg', '128.00', 1, ''),
(35, '201312241942521577', 126, '手工陶瓷化妆镜 荷塘清趣单面陶瓷镜', '1312/06/52a13ccd90d97.jpg', '128.00', 1, ''),
(36, '201312251021131035', 126, '手工陶瓷化妆镜 荷塘清趣单面陶瓷镜', '1312/06/52a13ccd90d97.jpg', '128.00', 2, ''),
(37, '201312251155281449', 125, '韩版可爱小熊水钻毛衣链', '1312/06/52a13bfb50e7e.jpg', '159.00', 1, ''),
(38, '201312251905051386', 135, '歌曲', '1312/23/52b7d4f5bb2ee.jpg', '0.01', 2, ''),
(39, '201312251952471400', 135, '歌曲', '1312/23/52b7d4f5bb2ee.jpg', '0.01', 1, ''),
(40, '201312251954251614', 138, '歌曲', '1312/24/52b91bf383fd3.jpg', '0.01', 1, ''),
(41, '201312251958251326', 138, '歌曲', '1312/24/52b91bf383fd3.jpg', '0.01', 1, ''),
(42, '201312252019091916', 135, '歌曲', '1312/23/52b7d4f5bb2ee.jpg', '0.01', 1, ''),
(43, '201312252020361542', 138, '歌曲', '1312/24/52b91bf383fd3.jpg', '0.01', 1, ''),
(44, '201312252107061371', 138, '歌曲', '1312/24/52b91bf383fd3.jpg', '0.01', 1, ''),
(45, '201312261205301214', 126, '手工陶瓷化妆镜 荷塘清趣单面陶瓷镜', '1312/06/52a13ccd90d97.jpg', '128.00', 1, ''),
(46, '201312272003331335', 133, '玫瑰人生施华洛世奇水晶化妆镜礼盒', '1312/06/52a18a5ac1492.jpg', '128.00', 1, ''),
(47, '201312272018201872', 125, '韩版可爱小熊水钻毛衣链', '1312/06/52a13bfb50e7e.jpg', '159.00', 1, ''),
(48, '201312272022231432', 125, '韩版可爱小熊水钻毛衣链', '1312/06/52a13bfb50e7e.jpg', '159.00', 1, ''),
(49, '201312272022471834', 126, '手工陶瓷化妆镜 荷塘清趣单面陶瓷镜', '1312/06/52a13ccd90d97.jpg', '128.00', 1, ''),
(50, '201312272030071112', 138, '歌曲', '1312/24/52b91bf383fd3.jpg', '0.01', 1, ''),
(51, '201312272031371748', 126, '手工陶瓷化妆镜 荷塘清趣单面陶瓷镜', '1312/06/52a13ccd90d97.jpg', '128.00', 1, ''),
(52, '201312301358551101', 125, '韩版可爱小熊水钻毛衣链', '1312/06/52a13bfb50e7e.jpg', '159.00', 1, ''),
(53, '201401131142321692', 126, '手工陶瓷化妆镜 荷塘清趣单面陶瓷镜', '1312/06/52a13ccd90d97.jpg', '128.00', 1, ''),
(54, '201401151228001457', 126, '手工陶瓷化妆镜 荷塘清趣单面陶瓷镜', '1312/06/52a13ccd90d97.jpg', '128.00', 1, ''),
(55, '201401151236461888', 125, '韩版可爱小熊水钻毛衣链', '1312/06/52a13bfb50e7e.jpg', '159.00', 1, ''),
(56, '201401151239391734', 127, '气若幽兰奢华双层披肩', '1312/06/52a13e3d41205.jpg', '588.00', 1, ''),
(57, '201401151245241771', 126, '手工陶瓷化妆镜 荷塘清趣单面陶瓷镜', '1312/06/52a13ccd90d97.jpg', '128.00', 1, ''),
(58, '201401151245451233', 125, '韩版可爱小熊水钻毛衣链', '1312/06/52a13bfb50e7e.jpg', '159.00', 1, ''),
(59, '201402191648381077', 135, '歌曲', '1312/23/52b7d4f5bb2ee.jpg', '0.01', 1, ''),
(60, '201402191649241365', 125, '韩版可爱小熊水钻毛衣链', '1312/06/52a13bfb50e7e.jpg', '159.00', 1, ''),
(61, '201402201722481568', 141, '测试333', '1402/20/53057200a018f.jpg', '11.00', 2, ''),
(62, '201402201722481568', 141, '测试333', '1402/20/53057200a018f.jpg', '11.00', 1, ''),
(63, '201402201722481568', 140, '测试123', '1402/20/5305710625014.jpg', '11.00', 1, ''),
(64, '201402201722481568', 140, '测试123', '1402/20/5305710625014.jpg', '11.00', 2, ''),
(65, '201402201722481568', 140, '测试123', '1402/20/5305710625014.jpg', '11.00', 1, ''),
(66, '201402201722481568', 140, '测试123', '1402/20/5305710625014.jpg', '11.00', 1, ''),
(67, '201402201722481568', 140, '测试123', '1402/20/5305710625014.jpg', '11.00', 1, ''),
(68, '201402201731581953', 138, '歌曲', '1312/24/52b91bf383fd3.jpg', '0.01', 2, ''),
(69, '201402201731581953', 141, '测试333', '1402/20/53057200a018f.jpg', '11.00', 1, ''),
(70, '201402201731581953', 141, '测试333', '1402/20/53057200a018f.jpg', '11.00', 1, ''),
(71, '201402201747021490', 139, '多属性测试商品', '1402/20/530567aee3082.jpg', '12.00', 1, ''),
(72, '201402201747021490', 140, '测试123', '1402/20/5305710625014.jpg', '11.00', 1, ''),
(73, '201402201749391778', 140, '测试123', '1402/20/5305710625014.jpg', '11.00', 1, '2013年|中号'),
(74, '201402201749391778', 141, '测试333', '1402/20/53057200a018f.jpg', '11.00', 1, '中号|红色|丝绸'),
(75, '201402201749391778', 141, '测试333', '1402/20/53057200a018f.jpg', '11.00', 1, '小号|白色|丝绸'),
(76, '201402201759371530', 140, '测试123', '1402/20/5305710625014.jpg', '11.00', 2, '2013年|小号'),
(77, '201402201759371530', 140, '测试123', '1402/20/5305710625014.jpg', '11.00', 1, '2014年|小号'),
(78, '201402201817201883', 140, '测试123', '1402/20/5305710625014.jpg', '11.00', 1, '2013年|小号'),
(79, '201402201817201883', 141, '测试333', '1402/20/53057200a018f.jpg', '11.00', 1, '中号|红色|丝绸'),
(80, '201402201817201883', 141, '测试333', '1402/20/53057200a018f.jpg', '11.00', 1, '小号|红色|丝绸'),
(81, '201402201818151436', 140, '测试123', '1402/20/5305710625014.jpg', '11.00', 1, '2014年|中号'),
(82, '201402201818151436', 140, '测试123', '1402/20/5305710625014.jpg', '11.00', 1, '2013年|中号'),
(83, '201402201818151436', 140, '测试123', '1402/20/5305710625014.jpg', '11.00', 1, '2013年|中号'),
(84, '201402261537481695', 126, '手工陶瓷化妆镜 荷塘清趣单面陶瓷镜', '1312/06/52a13ccd90d97.jpg', '128.00', 1, ''),
(85, '201402261758401864', 138, '歌曲', '1312/24/52b91bf383fd3.jpg', '0.01', 1, ''),
(86, '201402261802031150', 138, '歌曲', '1312/24/52b91bf383fd3.jpg', '0.01', 1, ''),
(87, '201402261803471058', 138, '歌曲', '1312/24/52b91bf383fd3.jpg', '0.01', 1, ''),
(88, '201402261804201411', 138, '歌曲', '1312/24/52b91bf383fd3.jpg', '0.01', 1, ''),
(89, '201402261919341852', 140, '测试123', '1402/20/5305710625014.jpg', '11.00', 1, '2012年|大号'),
(90, '201402261928101038', 140, '测试123', '1402/20/5305710625014.jpg', '11.00', 1, '2012年|大号'),
(91, '201403202253161884', 143, '杜蕾斯 避孕套 活力装安全套', '1403/20/532accb2e5107.jpg', '35.00', 1, ''),
(92, '201403222240211279', 145, '洽洽 160g 五香瓜子', '1403/22/532d94cd71c18.jpg', '5.00', 1, ''),
(93, '201403241801261999', 153, '好牌阿胶蜜枣', '1403/24/532fa2e2b3808.jpg', '5.00', 1, ''),
(94, '201403271108381357', 145, '洽洽 160g 五香瓜子', '1403/22/532d94cd71c18.jpg', '5.00', 1, ''),
(95, '201403272227061533', 145, '洽洽 160g 五香瓜子', '1403/22/532d94cd71c18.jpg', '5.00', 1, ''),
(96, '201403272227061533', 146, '南溪豆腐干 95g', '1403/23/532ea74c5caed.jpg', '2.50', 1, '麻辣味'),
(97, '201403292205121485', 145, '洽洽 160g 五香瓜子', '1403/22/532d94cd71c18.jpg', '5.00', 1, ''),
(98, '201404142312201312', 183, '【赠品二】雪花啤酒1罐+南溪豆腐干2包', '1404/10/5346b1c78d2e5.jpg', '0.00', 1, ''),
(99, '201404142317371468', 182, '【赠品】洽洽五香瓜子1袋+南溪豆腐干1包', '1404/10/5346ad14266d8.jpg', '0.00', 3, ''),
(100, '201404150943271054', 182, '【赠品】洽洽五香瓜子1袋+南溪豆腐干1包', '1404/10/5346ad14266d8.jpg', '0.00', 3, ''),
(101, '201404151141501250', 182, '【赠品一】洽洽五香瓜子1袋+南溪豆腐干2包', '1404/10/5346ad14266d8.jpg', '0.00', 2, ''),
(102, '201405182144561568', 188, '双河葡萄井凉糕【本商城满10元免费送货上门  凭券还可以免费领取凉糕1份】', '1404/22/535611112ea4c.jpg', '3.00', 1, ''),
(103, '201405301746231610', 192, '特仑苏醇纤牛奶250ml×12盒', '1405/26/53832ece26c42.jpg', '68.00', 1, ''),
(104, '201405312152041297', 203, '紫薯黑加仑菠萝味果蔬酸酸乳250ml×12盒', '1405/28/5385f02de6e04.jpg', '0.00', 1, ''),
(105, '201405312307071539', 185, '特仑苏纯牛奶250ml*12盒', '1404/15/534d1068dd990.jpg', '65.00', 1, ''),
(106, '201406010902281381', 185, '特仑苏纯牛奶250ml*12盒', '1404/15/534d1068dd990.jpg', '65.00', 1, ''),
(107, '201406121143181570', 204, '番茄樱桃草莓味果蔬酸酸乳250ml×12盒', '1405/29/5386a2b2905be.jpg', '28.00', 1, ''),
(108, '201406121148211169', 204, '番茄樱桃草莓味果蔬酸酸乳250ml×12盒', '1405/29/5386a2b2905be.jpg', '28.00', 1, ''),
(109, '201406121159141802', 203, '紫薯黑加仑菠萝味果蔬酸酸乳250ml×12盒', '1405/28/5385f02de6e04.jpg', '28.00', 1, ''),
(110, '201406121649581149', 192, '特仑苏醇纤牛奶250ml×12盒', '1405/26/53832ece26c42.jpg', '63.00', 1, ''),
(111, '201406121654141775', 191, '特仑苏低脂牛奶250ml×12盒', '1405/26/53832cac4e349.jpg', '63.00', 1, ''),
(112, '201406121702471258', 191, '特仑苏低脂牛奶250ml×12盒', '1405/26/53832cac4e349.jpg', '63.00', 1, ''),
(113, '201406121721241441', 204, '番茄樱桃草莓味果蔬酸酸乳250ml×12盒', '1405/29/5386a2b2905be.jpg', '28.00', 1, ''),
(114, '201406121722431854', 220, '新养道零乳糖牛奶全脂型250ml×12盒', '1405/31/538976b3a03b6.jpg', '45.00', 1, ''),
(115, '201406121729561967', 197, '早餐奶黑谷粒250ml*12盒', '1405/26/53834ec987cfa.jpg', '32.00', 1, ''),
(116, '201406121741121192', 203, '紫薯黑加仑菠萝味果蔬酸酸乳250ml×12盒', '1405/28/5385f02de6e04.jpg', '28.00', 1, ''),
(117, '201406121747371354', 203, '紫薯黑加仑菠萝味果蔬酸酸乳250ml×12盒', '1405/28/5385f02de6e04.jpg', '28.00', 1, ''),
(118, '201406121753011032', 219, '大眼萌香蕉牛奶饮品190ml*12盒', '1405/31/5388b07a5470e.jpg', '43.00', 1, ''),
(119, '201406121948541600', 222, '新养道零乳糖牛奶珍养型250ml×12盒', '1405/31/53897d5a8fafe.jpg', '46.00', 1, ''),
(120, '201406122200211859', 205, '奶特浓情朱古力奶243ml×12盒 ', '1405/29/5386a7a3be537.jpg', '53.00', 1, ''),
(121, '201406122206091559', 205, '奶特浓情朱古力奶243ml×12盒 ', '1405/29/5386a7a3be537.jpg', '53.00', 1, ''),
(122, '201406122209431955', 193, '未来星佳智型儿童成长牛奶190ml*15盒', '1405/26/5383353c3190b.jpg', '53.00', 1, ''),
(123, '201406122218091920', 203, '紫薯黑加仑菠萝味果蔬酸酸乳250ml×12盒', '1405/28/5385f02de6e04.jpg', '28.00', 1, ''),
(124, '201406131129211535', 185, '特仑苏纯牛奶250ml*12盒', '1404/15/534d1068dd990.jpg', '60.00', 1, ''),
(125, '201406161114491707', 203, '紫薯黑加仑菠萝味果蔬酸酸乳250ml×12盒', '1405/28/5385f02de6e04.jpg', '28.00', 1, ''),
(126, '201406171015061870', 206, '奶特香草口味243ml×12盒', '1405/29/5386a920e0633.jpg', '53.00', 1, ''),
(127, '201406181231281158', 192, '特仑苏醇纤牛奶250ml×12盒', '1405/26/53832ece26c42.jpg', '63.00', 132, ''),
(128, '201406181231281158', 206, '奶特香草口味243ml×12盒', '1405/29/5386a920e0633.jpg', '53.00', 66, ''),
(129, '201406181231281158', 191, '特仑苏低脂牛奶250ml×12盒', '1405/26/53832cac4e349.jpg', '63.00', 1, ''),
(130, '201406181237311196', 208, '真果粒椰果味250ml*12盒 ', '1405/29/5386b186d0a82.jpg', '39.00', 1, ''),
(131, '201406181237311196', 227, '蒙牛AD钙酸酸乳250ml*24盒 ', '1405/31/53898b251ddd1.jpg', '30.00', 33, ''),
(132, '201406181352571959', 218, '纯甄风味酸牛奶200g*12盒（丹麦进口菌种）', '1405/31/5388ae92b1d8b.jpg', '60.00', 1, ''),
(133, '201406181526191741', 203, '紫薯黑加仑菠萝味果蔬酸酸乳250ml×12盒', '1405/28/5385f02de6e04.jpg', '28.00', 16, ''),
(134, '201406201128361980', 185, '特仑苏纯牛奶250ml*12盒', '1404/15/534d1068dd990.jpg', '60.00', 2, ''),
(135, '201406201141451333', 185, '特仑苏纯牛奶250ml*12盒', '1404/15/534d1068dd990.jpg', '60.00', 1, ''),
(136, '201406301635271839', 204, '番茄樱桃草莓味果蔬酸酸乳250ml×12盒', '1405/29/5386a2b2905be.jpg', '28.00', 1, ''),
(137, '201406301638091823', 203, '紫薯黑加仑菠萝味果蔬酸酸乳250ml×12盒', '1405/28/5385f02de6e04.jpg', '28.00', 1, ''),
(138, '201407021204231061', 218, '纯甄风味酸牛奶200g*12盒（丹麦进口菌种）', '1405/31/5388ae92b1d8b.jpg', '60.00', 1, ''),
(139, '201407051741481773', 204, '番茄樱桃草莓味果蔬酸酸乳250ml×12盒', '1405/29/5386a2b2905be.jpg', '28.00', 1, ''),
(140, '201407051837321020', 203, '紫薯黑加仑菠萝味果蔬酸酸乳250ml×12盒', '1405/28/5385f02de6e04.jpg', '28.00', 1, ''),
(141, '201407061555161818', 206, '奶特香草口味243ml×12盒', '1405/29/5386a920e0633.jpg', '53.00', 1, ''),
(142, '201407061612121895', 191, '特仑苏低脂牛奶250ml×12盒', '1405/26/53832cac4e349.jpg', '63.00', 1, ''),
(143, '201407061612121895', 185, '特仑苏纯牛奶250ml*12盒', '1404/15/534d1068dd990.jpg', '60.00', 2, ''),
(144, '201407061615451433', 206, '奶特香草口味243ml×12盒', '1405/29/5386a920e0633.jpg', '53.00', 1, ''),
(145, '201407061617181527', 206, '奶特香草口味243ml×12盒', '1405/29/5386a920e0633.jpg', '53.00', 1, ''),
(146, '201407071538031638', 203, '紫薯黑加仑菠萝味果蔬酸酸乳250ml×12盒', '1405/28/5385f02de6e04.jpg', '28.00', 2, '');

-- --------------------------------------------------------

--
-- 表的结构 `weixin_score_item`
--

CREATE TABLE IF NOT EXISTS `weixin_score_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cate_id` smallint(4) unsigned NOT NULL,
  `title` varchar(120) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0：实物；1：虚拟',
  `img` varchar(255) NOT NULL,
  `score` int(10) unsigned NOT NULL DEFAULT '0',
  `stock` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_num` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `buy_num` mediumint(8) NOT NULL DEFAULT '0',
  `desc` text NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_score_item_cate`
--

CREATE TABLE IF NOT EXISTS `weixin_score_item_cate` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `weixin_score_item_cate`
--

INSERT INTO `weixin_score_item_cate` (`id`, `name`, `status`, `ordid`) VALUES
(1, '数码', 1, 0),
(2, '美容', 1, 0),
(3, '虚拟', 1, 0),
(4, '生活', 1, 0),
(5, '运动', 1, 0),
(6, '吃完', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_score_log`
--

CREATE TABLE IF NOT EXISTS `weixin_score_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `score` int(10) NOT NULL,
  `add_time` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- 转存表中的数据 `weixin_score_log`
--

INSERT INTO `weixin_score_log` (`id`, `uid`, `uname`, `action`, `score`, `add_time`) VALUES
(1, 9, 'wingsa区', 'login', 10, 1353909837),
(2, 13, '想太多妹子', 'login', 10, 1353909897),
(3, 16, 'Eudora_寻寻', 'login', 10, 1353909964),
(4, 15, 'Prickleman', 'login', 10, 1353910012),
(5, 11, '彩色淘', 'login', 10, 1353910069),
(6, 7, '咕咕是一只猫', 'login', 10, 1353910109),
(7, 12, '跳房子123', 'login', 10, 1353910146),
(8, 17, 'V小莲小莲V', 'login', 10, 1353910177),
(9, 20, '熊小熊zz', 'login', 10, 1353910221),
(10, 6, '起个名字太累', 'login', 10, 1353910265),
(11, 18, '晨雪熙', 'login', 10, 1353910348),
(12, 8, '枕水而眠', 'login', 10, 1353910407),
(13, 19, '安土桃山', 'login', 10, 1353910445),
(14, 10, '设计系小女生', 'login', 10, 1353910499),
(15, 14, '泡芙小米粒', 'login', 10, 1353910539),
(16, 21, 'hjklhklj', 'register', 20, 1374633583),
(17, 21, 'hjklhklj', 'login', 10, 1374633583),
(18, 22, 'dsadsa', 'register', 20, 1374724879),
(19, 22, 'dsadsa', 'login', 10, 1374724879),
(20, 23, 'wooo', 'register', 20, 1374724936),
(21, 23, 'wooo', 'login', 10, 1374724936),
(22, 24, 'cvvv', 'register', 20, 1374724990),
(23, 24, 'cvvv', 'login', 10, 1374724990),
(24, 26, 'Ace', 'register', 20, 1375152929),
(25, 26, 'Ace', 'login', 10, 1375152929),
(26, 27, 'ceshi', 'register', 20, 1375154088),
(27, 27, 'ceshi', 'login', 10, 1375154088),
(28, 28, 'xmyiquan', 'register', 20, 1375176967),
(29, 28, 'xmyiquan', 'login', 10, 1375176967),
(30, 29, 'leguhuwai', 'register', 20, 1375250687),
(31, 29, 'leguhuwai', 'login', 10, 1375250687),
(32, 30, 'leebay0427', 'register', 20, 1386301201),
(33, 30, 'leebay0427', 'login', 10, 1386301201),
(34, 31, 'test', 'register', 20, 1386305926),
(35, 31, 'test', 'login', 10, 1386305926),
(36, 32, 'vega', 'register', 20, 1387696742),
(37, 32, 'vega', 'login', 10, 1387696742),
(38, 33, '123456', 'register', 20, 1387801754),
(39, 33, '123456', 'login', 10, 1387801754),
(40, 36, '520', 'register', 20, 1387879956),
(41, 36, '520', 'login', 10, 1387879956),
(42, 47, 'admin1', 'register', 20, 1388146670),
(43, 47, 'admin1', 'login', 10, 1388146670),
(44, 103, '1234', 'register', 20, 1403067050),
(45, 103, '1234', 'login', 10, 1403067050),
(46, 135, 'zhang', 'register', 20, 1404885080),
(47, 135, 'zhang', 'login', 10, 1404885080);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_score_order`
--

CREATE TABLE IF NOT EXISTS `weixin_score_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(100) NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `item_name` varchar(120) NOT NULL,
  `item_num` mediumint(8) NOT NULL,
  `consignee` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zip` varchar(10) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `order_score` int(10) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_setting`
--

CREATE TABLE IF NOT EXISTS `weixin_setting` (
  `name` varchar(100) NOT NULL,
  `data` text NOT NULL,
  `remark` varchar(255) NOT NULL,
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `weixin_setting`
--

INSERT INTO `weixin_setting` (`name`, `data`, `remark`) VALUES
('site_name', '江安优客来©版权所有 蜀ICP备12021816号-1', ''),
('site_title', '江安优客来微信商城', ''),
('site_keyword', '江安优客来微信商城', ''),
('site_description', '江安优客来微信商城，微信号jianganykl', ''),
('site_status', '1', ''),
('closed_reason', '网站升级中。。', ''),
('site_icp', '', ''),
('statistics_code', '<script type="text/javascript"> var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://"); document.write(unescape("%3Cscript src=''" + _bdhmProtocol + "hm.baidu.com/h.js%3F6e992882d30779c9c5c320e915c75da9'' type=''text/javascript''%3E%3C/script%3E")) </script>', ''),
('statics_url', '', ''),
('mail_server', 'a:5:{s:4:"mode";s:2:"on";s:4:"host";s:11:"smtp.qq.com";s:4:"from";s:16:"376797016@qq.com";s:13:"auth_username";s:17:"1736869342@qq.com";s:13:"auth_password";s:9:"WTXwtx...";}', ''),
('item_check', '0', ''),
('score_rule', 'a:16:{s:8:"register";s:2:"20";s:13:"register_nums";s:1:"1";s:5:"login";s:2:"10";s:10:"login_nums";s:1:"5";s:7:"pubitem";s:2:"20";s:12:"pubitem_nums";s:2:"10";s:8:"likeitem";s:1:"1";s:13:"likeitem_nums";s:2:"20";s:9:"joinalbum";s:1:"2";s:14:"joinalbum_nums";s:2:"10";s:6:"fwitem";s:1:"2";s:11:"fwitem_nums";s:2:"10";s:6:"pubcmt";s:1:"1";s:11:"pubcmt_nums";s:1:"5";s:7:"delitem";s:3:"-20";s:12:"delitem_nums";s:3:"100";}', ''),
('album_cover_items', '5', '专辑封面显示图片数量'),
('integrate_code', 'default', ''),
('integrate_config', '', ''),
('hot_tags', '家居,花园,美食,旅行,创意,建筑,户外,飘窗,卧室,城堡,DIY,萌宠,门厅,衣帽间,婚礼,书房,厨房,客厅,浴室,阳台,工作台,收纳,餐厅,阁楼,儿童房,小空间,性感', ''),
('wall_spage_max', '5', ''),
('wall_spage_size', '50', ''),
('book_page_max', '100', ''),
('default_keyword', '懒得逛了，我搜~', ''),
('album_default_title', '默认专辑', ''),
('avatar_size', '24,32,48,64,100,200', ''),
('attr_allow_exts', 'jpg,gif,png,jpeg,swf', ''),
('attr_allow_size', '2048', ''),
('itemcate_img', 'a:2:{s:5:"width";s:3:"150";s:6:"height";s:3:"170";}', ''),
('reg_protocol', '一、总则\r\n1．1　用户应当同意本协议的条款并按照页面上的提示完成全部的注册程序。用户在进行注册程序过程中点击"立即注册"按钮即表示用户与拼品网公司达成协议，完全接受本协议项下的全部条款。\r\n1．2　用户注册成功后，拼品网将给予每个用户一个用户帐号及相应的密码，该用户帐号和密码由用户负责保管；用户应当对以其用户帐号进行的所有活动和事件负法律责任。\r\n1．3　用户可以使用拼品网各个频道单项服务，当用户使用拼品网各单项服务时，用户的使用行为视为其对该单项服务的服务条款以及拼品网在该单项服务中发出的各类公告的同意。\r\n1．4　拼品网会员服务协议以及各个频道单项服务条款和公告可由拼品网公司随时更新，且无需另行通知。您在使用相关服务时,应关注并遵守其所适用的相关条款。\r\n您在使用拼品网提供的各项服务之前，应仔细阅读本服务协议。如您不同意本服务协议及/或随时对其的修改，您可以主动取消拼品网提供的服务；您一旦使用拼品网产品，即视为您已了解并完全同意本服务协议各项内容，包括拼品网对服务协议随时所做的任何修改，并成为拼品网用户。\r\n二、注册信息和隐私保护\r\n2．1　 拼品网帐号（即拼品网用户ID）的所有权归拼品网，用户完成注册申请手续后，获得拼品网帐号的使用权。用户应提供及时、详尽及准确的个人资料，并不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。如果因注册信息不真实而引起的问题，并对问题发生所带来的后果，拼品网概不负任何责任。\r\n2．2　用户不应将其帐号、密码转让或出借予他人使用。如用户发现其帐号遭他人非法使用，应立即通知拼品网。因黑客行为或用户的保管疏忽导致帐号、密码遭他人非法使用，拼品网不承担任何责任。\r\n2．3　拼品网不对外公开或向第三方提供单个用户的注册资料，除非：\r\n（1）事先获得用户的明确授权；\r\n（2）只有透露你的个人资料，才能提供你所要求的产品和服务；\r\n（3）根据有关的法律法规要求；\r\n（4）按照相关政府主管部门的要求；\r\n（5）为维护拼品网的合法权益。\r\n2．4　在你注册拼品网帐户，使用其他拼品网产品或服务，访问拼品网网页, 或参加促销和有奖游戏时，拼品网会收集你的个人身份识别资料，并会将这些资料用于：改进为你提供的服务及网页内容。\r\n三、使用规则\r\n3．1　用户在使用拼品网服务时，必须遵守中华人民共和国相关法律法规的规定，用户应同意将不会利用本服务进行任何违法或不正当的活动，包括但不限于下列行为∶\r\n（1）上载、展示、张贴、传播或以其它方式传送含有下列内容之一的信息：\r\n1） 反对宪法所确定的基本原则的； 2） 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的； 3） 损害国家荣誉和利益的； 4） 煽动民族仇恨、民族歧视、破坏民族团结的； 5） 破坏国家宗教政策，宣扬邪教和封建迷信的； 6） 散布谣言，扰乱社会秩序，破坏社会稳定的； 7） 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的； 8） 侮辱或者诽谤他人，侵害他人合法权利的； 9） 含有虚假、有害、胁迫、侵害他人隐私、骚扰、侵害、中伤、粗俗、猥亵、或其它道德上令人反感的内容； 10） 含有中国法律、法规、规章、条例以及任何具有法律效力之规范所限制或禁止的其它内容的；\r\n（2）不得为任何非法目的而使用网络服务系统；\r\n（3）不利用拼品网服务从事以下活动：\r\n1) 未经允许，进入计算机信息网络或者使用计算机信息网络资源的；\r\n2) 未经允许，对计算机信息网络功能进行删除、修改或者增加的；\r\n3) 未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加的；\r\n4) 故意制作、传播计算机病毒等破坏性程序的；\r\n5) 其他危害计算机信息网络安全的行为。\r\n3．2　 用户违反本协议或相关的服务条款的规定，导致或产生的任何第三方主张的任何索赔、要求或损失，包括合理的律师费，您同意赔偿拼品网与合作公司、关联公司，并使之免受损害。对此，拼品网有权视用户的行为性质，采取包括但不限于删除用户发布信息内容、暂停使用许可、终止服务、限制使用、回收拼品网帐号、追 究法律责任等措施。对恶意注册拼品网帐号或利用拼品网帐号进行违法活动、捣乱、骚扰、欺骗、其他用户以及其他违反本协议的行为，拼品网有权回收其帐号。同 时，拼品网公司会视司法部门的要求，协助调查。\r\n3．3　用户不得对本服务任何部分或本服务之使用或获得，进行复制、拷贝、出售、转售或用于任何其它商业目的。\r\n3．4　用户须对自己在使用拼品网服务过程中的行为承担法律责任。用户承担法律责任的形式包括但不限于：对受到侵害者进行赔偿，以及在拼品网公司首先承担了因用户行为导致的行政处罚或侵权损害赔偿责任后，用户应给予拼品网公司等额的赔偿。\r\n四、服务内容\r\n4．1　拼品网网络服务的具体内容由拼品网根据实际情况提供。\r\n4．2　除非本服务协议另有其它明示规定，拼品网所推出的新产品、新功能、新服务，均受到本服务协议之规范。\r\n4．3　为使用本服务，您必须能够自行经有法律资格对您提供互联网接入服务的第三方，进入国际互联网，并应自行支付相关服务费用。此外，您必须自行配备及负责与国际联网连线所需之一切必要装备，包括计算机、数据机或其它存取装置。\r\n4．4　鉴于网络服务的特殊性，用户同意拼品网有权不经事先通知，随时变更、中断或终止部分或全部的网络服务（包括收费网络服务）。拼品网不担保网络服务不会中断，对网络服务的及时性、安全性、准确性也都不作担保。\r\n4．5　拼品网需要定期或不定期地对提供网络服务的平台或相关的设备进行检修或者维护，如因此类情况而造成网络服务（包括收费网络服务）在合理时间内的中断，拼品网无需为此承担任何责任。拼品网保留不经事先通知为维修保养、升级或其它目的暂停本服务任何部分的权利。\r\n4．6　 本服务或第三人可提供与其它国际互联网上之网站或资源之链接。由于拼品网无法控制这些网站及资源，您了解并同意，此类网站或资源是否可供利用，拼品网不予负责，存在或源于此类网站或资源之任何内容、广告、产品或其它资料，拼品网亦不予保证或负责。因使用或依赖任何此类网站或资源发布的或经由此类网站或资 源获得的任何内容、商品或服务所产生的任何损害或损失，拼品网不承担任何责任。\r\n4．7　用户明确同意其使用拼品网网络服务所存在的风险将完全由其 自己承担。用户	理解并接受下载或通过拼品网服务取得的任何信息资料取决于用户自己，并由其承担系统受损、资料丢失以及其它任何风险。拼品网对在服务网上得 到的任何商品购物服	务、交易进程、招聘信息，都不作担保。\r\n4．8　3个月未登录的帐号，拼品网保留关闭的权利。\r\n4．9　拼品网有权于任何时间暂时或永久修改或终止本服务（或其任何部分），而无论其通知与否，拼品网对用户和任何第三人均无需承担任何责任。\r\n4．10　终止服务\r\n您同意拼品网得基于其自行之考虑，因任何理由，包含但不限于长时间未使用，或拼品网认为您已经违反本服务协议的文字及精神，终止您的密码、帐号或本服务之使 用（或服务之任何部分），并将您在本服务内任何内容加以移除并删除。您同意依本服务协议任何规定提供之本服务，无需进行事先通知即可中断或终止，您承认并 同意，拼品网可立即关闭或删除您的帐号及您帐号中所有相关信息及文件，及/或禁止继续使用前述文件或本服务。此外，您同意若本服务之使用被中断或终止或您 的帐号及相关信息和文件被关闭或删除，拼品网对您或任何第三人均不承担任何责任。\r\n五、知识产权和其他合法权益（包括但不限于名誉权、商誉权）\r\n5．1　用户专属权利\r\n拼品网尊重他人知识产权和合法权益，呼吁用户也要同样尊重知识产权和他人合法权益。若您认为您的知识产权或其他合法权益被侵犯，请按照以下说明向拼品网提供资料∶\r\n请注意：如果权利通知的陈述失实，权利通知提交者将承担对由此造成的全部法律责任（包括但不限于赔偿各种费用及律师费）。如果上述个人或单位不确定网络上可获取的资料是否侵犯了其知识产权和其他合法权益，拼品网建议该个人或单位首先咨询专业人士。\r\n为了拼品网有效处理上述个人或单位的权利通知，请使用以下格式（包括各条款的序号）：\r\n1. 权利人对涉嫌侵权内容拥有知识产权或其他合法权益和/或依法可以行使知识产权或其他合法权益的权属证明；\r\n2. 请充分、明确地描述被侵犯了知识产权或其他合法权益的情况并请提供涉嫌侵权的第三方网址（如果有）。\r\n3. 请指明涉嫌侵权网页的哪些内容侵犯了第2项中列明的权利。\r\n4. 请提供权利人具体的联络信息，包括姓名、身份证或护照复印件（对自然人）、单位登记证明复印件（对单位）、通信地址、电话号码、传真和电子邮件。\r\n5. 请提供涉嫌侵权内容在信息网络上的位置（如指明您举报的含有侵权内容的出处，即：指网页地址或网页内的位置）以便我们与您举报的含有侵权内容的网页的所有权人/管理人联系。\r\n5．1　 对于用户通过拼品网服务上传到拼品网网站上可公开获取区域的任何内容，用户同意拼品网在全世界范围内具有免费的、永久性的、不可撤销的、非独家的和完全再许可的权利和许可，以使用、复制、修改、改编、出版、翻译、据以创作衍生作品、传播、表演和展示此等内容（整体或部分），和/或将此等内容编入当前已知 的或以后开发的其他任何形式的作品、媒体或技术中。\r\n5．2　拼品网拥有本网站内所有资料的版权。任何被授权的浏览、复制、打印和传播属于本网站内的资料必须符合以下条件：所有的资料和图象均以获得信息为目的；\r\n所有的资料和图象均不得用于商业目的；\r\n所有的资料、图象及其任何部分都必须包括此版权声明；\r\n本网站（www.pinphp.com）所有的产品、技术与所有程序均属于拼品网知识产权，在此并未授权。\r\n“www.pinphp.com”, “拼品网”及相关图形等为拼品网的注册商标。\r\n未经拼品网许可，任何人不得擅自（包括但不限于：以非法的方式复制、传播、展示、镜像、上载、下载）使用。否则，拼品网将依法追究法律责任。\r\n六、青少年用户特别提示\r\n青少年用户必须遵守全国青少年网络文明公约：\r\n要善于网上学习，不浏览不良信息；要诚实友好交流，不侮辱欺诈他人；要增强自护意识，不随意约会网友；要维护网络安全，不破坏网络秩序；要有益身心健康，不沉溺虚拟时空。\r\n七、其他\r\n7．1　本协议的订立、执行和解释及争议的解决均应适用中华人民共和国法律。\r\n7．2　如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向拼品网所在地的人民法院提起诉讼。\r\n7．3　拼品网未行使或执行本服务协议任何权利或规定，不构成对前述权利或权利之放弃。\r\n7．4　如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。\r\n拼品网对本使用协议享有最终解释权。', ''),
('item_cover_comments', '2', ''),
('user_intro_default', '这个家伙太懒，什么都木留下~', ''),
('ipban_switch', '0', ''),
('score_item_img', 'a:4:{s:6:"swidth";s:3:"210";s:7:"sheight";s:3:"210";s:6:"bwidth";s:3:"350";s:7:"bheight";s:3:"350";}', ''),
('seo_config', 'a:6:{s:4:"book";a:3:{s:5:"title";s:23:"{tag_name}-{site_title}";s:8:"keywords";s:23:"逛宝贝，{site_name}";s:11:"description";s:18:"{site_description}";}s:4:"cate";a:3:{s:5:"title";s:23:"{cate_name}-{seo_title}";s:8:"keywords";s:14:"{seo_keywords}";s:11:"description";s:17:"{seo_description}";}s:5:"album";a:3:{s:5:"title";s:6:"专辑";s:8:"keywords";s:47:"{site_name},购物分享,淘宝网购物,专辑";s:11:"description";s:18:"{site_description}";}s:10:"album_cate";a:3:{s:5:"title";s:11:"{seo_title}";s:8:"keywords";s:14:"{seo_keywords}";s:11:"description";s:17:"{seo_description}";}s:12:"album_detail";a:3:{s:5:"title";s:13:"{album_title}";s:8:"keywords";s:13:"{album_intro}";s:11:"description";s:23:"杂志详细Description";}s:4:"item";a:3:{s:5:"title";s:12:"{item_title}";s:8:"keywords";s:10:"{item_tag}";s:11:"description";s:12:"{item_intro}";}}', ''),
('item_img', 'a:2:{s:5:"width";s:3:"210";s:6:"height";s:4:"1000";}', ''),
('item_simg', 'a:2:{s:5:"width";s:3:"100";s:6:"height";s:3:"100";}', ''),
('item_bimg', 'a:2:{s:5:"width";s:3:"468";s:6:"height";s:4:"1000";}', ''),
('attach_path', 'data/upload/', ''),
('wall_distance', '500', ''),
('reg_status', '1', ''),
('reg_closed_reason', '<h1>暂时关闭注册</h1>', ''),
('index_wall', '1', ''),
('weixin_img', '1407/11/53bf889d5ad48.gif', ''),
('weixinshop_img', '1407/11/53bf889d5ba23.gif', ''),
('appid', 'wx0fdf443fd6aedc3e', ''),
('appsecret', 'fcc79b733dbf9c1caf06afe61ec32f66', ''),
('tenpay', '0', ''),
('alipayhome', 'wang376797016@126.com', ''),
('sms_server', '', '短信提醒配置'),
('xianxia', '0', ''),
('wxpay', '0', ''),
('gralipay', '0', ''),
('wxpayset', '', '微信支付配置'),
('wxtx', '0', '微信消息提醒用户下单成功'),
('sms_server', '', '短信提醒配置'),
('xianxia', '0', ''),
('wxpay', '0', ''),
('gralipay', '0', ''),
('wxpayset', '', '微信支付配置'),
('wxtx', '0', '微信消息提醒用户下单成功'),
('site_name', '江安优客来©版权所有 蜀ICP备12021816号-1', ''),
('site_title', '江安优客来微信商城', ''),
('site_keyword', '江安优客来微信商城', ''),
('site_description', '江安优客来微信商城，微信号jianganykl', ''),
('site_status', '1', ''),
('closed_reason', '网站升级中。。', ''),
('site_icp', '', ''),
('statistics_code', '<script type="text/javascript"> var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://"); document.write(unescape("%3Cscript src=''" + _bdhmProtocol + "hm.baidu.com/h.js%3F6e992882d30779c9c5c320e915c75da9'' type=''text/javascript''%3E%3C/script%3E")) </script>', ''),
('statics_url', '', ''),
('mail_server', 'a:5:{s:4:"mode";s:2:"on";s:4:"host";s:11:"smtp.qq.com";s:4:"from";s:16:"376797016@qq.com";s:13:"auth_username";s:17:"1736869342@qq.com";s:13:"auth_password";s:9:"WTXwtx...";}', ''),
('item_check', '0', ''),
('score_rule', 'a:16:{s:8:"register";s:2:"20";s:13:"register_nums";s:1:"1";s:5:"login";s:2:"10";s:10:"login_nums";s:1:"5";s:7:"pubitem";s:2:"20";s:12:"pubitem_nums";s:2:"10";s:8:"likeitem";s:1:"1";s:13:"likeitem_nums";s:2:"20";s:9:"joinalbum";s:1:"2";s:14:"joinalbum_nums";s:2:"10";s:6:"fwitem";s:1:"2";s:11:"fwitem_nums";s:2:"10";s:6:"pubcmt";s:1:"1";s:11:"pubcmt_nums";s:1:"5";s:7:"delitem";s:3:"-20";s:12:"delitem_nums";s:3:"100";}', ''),
('album_cover_items', '5', '专辑封面显示图片数量'),
('integrate_code', 'default', ''),
('integrate_config', '', ''),
('hot_tags', '家居,花园,美食,旅行,创意,建筑,户外,飘窗,卧室,城堡,DIY,萌宠,门厅,衣帽间,婚礼,书房,厨房,客厅,浴室,阳台,工作台,收纳,餐厅,阁楼,儿童房,小空间,性感', ''),
('wall_spage_max', '5', ''),
('wall_spage_size', '50', ''),
('book_page_max', '100', ''),
('default_keyword', '懒得逛了，我搜~', ''),
('album_default_title', '默认专辑', ''),
('avatar_size', '24,32,48,64,100,200', ''),
('attr_allow_exts', 'jpg,gif,png,jpeg,swf', ''),
('attr_allow_size', '2048', ''),
('itemcate_img', 'a:2:{s:5:"width";s:3:"150";s:6:"height";s:3:"170";}', ''),
('reg_protocol', '一、总则\r\n1．1　用户应当同意本协议的条款并按照页面上的提示完成全部的注册程序。用户在进行注册程序过程中点击"立即注册"按钮即表示用户与拼品网公司达成协议，完全接受本协议项下的全部条款。\r\n1．2　用户注册成功后，拼品网将给予每个用户一个用户帐号及相应的密码，该用户帐号和密码由用户负责保管；用户应当对以其用户帐号进行的所有活动和事件负法律责任。\r\n1．3　用户可以使用拼品网各个频道单项服务，当用户使用拼品网各单项服务时，用户的使用行为视为其对该单项服务的服务条款以及拼品网在该单项服务中发出的各类公告的同意。\r\n1．4　拼品网会员服务协议以及各个频道单项服务条款和公告可由拼品网公司随时更新，且无需另行通知。您在使用相关服务时,应关注并遵守其所适用的相关条款。\r\n您在使用拼品网提供的各项服务之前，应仔细阅读本服务协议。如您不同意本服务协议及/或随时对其的修改，您可以主动取消拼品网提供的服务；您一旦使用拼品网产品，即视为您已了解并完全同意本服务协议各项内容，包括拼品网对服务协议随时所做的任何修改，并成为拼品网用户。\r\n二、注册信息和隐私保护\r\n2．1　 拼品网帐号（即拼品网用户ID）的所有权归拼品网，用户完成注册申请手续后，获得拼品网帐号的使用权。用户应提供及时、详尽及准确的个人资料，并不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。如果因注册信息不真实而引起的问题，并对问题发生所带来的后果，拼品网概不负任何责任。\r\n2．2　用户不应将其帐号、密码转让或出借予他人使用。如用户发现其帐号遭他人非法使用，应立即通知拼品网。因黑客行为或用户的保管疏忽导致帐号、密码遭他人非法使用，拼品网不承担任何责任。\r\n2．3　拼品网不对外公开或向第三方提供单个用户的注册资料，除非：\r\n（1）事先获得用户的明确授权；\r\n（2）只有透露你的个人资料，才能提供你所要求的产品和服务；\r\n（3）根据有关的法律法规要求；\r\n（4）按照相关政府主管部门的要求；\r\n（5）为维护拼品网的合法权益。\r\n2．4　在你注册拼品网帐户，使用其他拼品网产品或服务，访问拼品网网页, 或参加促销和有奖游戏时，拼品网会收集你的个人身份识别资料，并会将这些资料用于：改进为你提供的服务及网页内容。\r\n三、使用规则\r\n3．1　用户在使用拼品网服务时，必须遵守中华人民共和国相关法律法规的规定，用户应同意将不会利用本服务进行任何违法或不正当的活动，包括但不限于下列行为∶\r\n（1）上载、展示、张贴、传播或以其它方式传送含有下列内容之一的信息：\r\n1） 反对宪法所确定的基本原则的； 2） 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的； 3） 损害国家荣誉和利益的； 4） 煽动民族仇恨、民族歧视、破坏民族团结的； 5） 破坏国家宗教政策，宣扬邪教和封建迷信的； 6） 散布谣言，扰乱社会秩序，破坏社会稳定的； 7） 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的； 8） 侮辱或者诽谤他人，侵害他人合法权利的； 9） 含有虚假、有害、胁迫、侵害他人隐私、骚扰、侵害、中伤、粗俗、猥亵、或其它道德上令人反感的内容； 10） 含有中国法律、法规、规章、条例以及任何具有法律效力之规范所限制或禁止的其它内容的；\r\n（2）不得为任何非法目的而使用网络服务系统；\r\n（3）不利用拼品网服务从事以下活动：\r\n1) 未经允许，进入计算机信息网络或者使用计算机信息网络资源的；\r\n2) 未经允许，对计算机信息网络功能进行删除、修改或者增加的；\r\n3) 未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加的；\r\n4) 故意制作、传播计算机病毒等破坏性程序的；\r\n5) 其他危害计算机信息网络安全的行为。\r\n3．2　 用户违反本协议或相关的服务条款的规定，导致或产生的任何第三方主张的任何索赔、要求或损失，包括合理的律师费，您同意赔偿拼品网与合作公司、关联公司，并使之免受损害。对此，拼品网有权视用户的行为性质，采取包括但不限于删除用户发布信息内容、暂停使用许可、终止服务、限制使用、回收拼品网帐号、追 究法律责任等措施。对恶意注册拼品网帐号或利用拼品网帐号进行违法活动、捣乱、骚扰、欺骗、其他用户以及其他违反本协议的行为，拼品网有权回收其帐号。同 时，拼品网公司会视司法部门的要求，协助调查。\r\n3．3　用户不得对本服务任何部分或本服务之使用或获得，进行复制、拷贝、出售、转售或用于任何其它商业目的。\r\n3．4　用户须对自己在使用拼品网服务过程中的行为承担法律责任。用户承担法律责任的形式包括但不限于：对受到侵害者进行赔偿，以及在拼品网公司首先承担了因用户行为导致的行政处罚或侵权损害赔偿责任后，用户应给予拼品网公司等额的赔偿。\r\n四、服务内容\r\n4．1　拼品网网络服务的具体内容由拼品网根据实际情况提供。\r\n4．2　除非本服务协议另有其它明示规定，拼品网所推出的新产品、新功能、新服务，均受到本服务协议之规范。\r\n4．3　为使用本服务，您必须能够自行经有法律资格对您提供互联网接入服务的第三方，进入国际互联网，并应自行支付相关服务费用。此外，您必须自行配备及负责与国际联网连线所需之一切必要装备，包括计算机、数据机或其它存取装置。\r\n4．4　鉴于网络服务的特殊性，用户同意拼品网有权不经事先通知，随时变更、中断或终止部分或全部的网络服务（包括收费网络服务）。拼品网不担保网络服务不会中断，对网络服务的及时性、安全性、准确性也都不作担保。\r\n4．5　拼品网需要定期或不定期地对提供网络服务的平台或相关的设备进行检修或者维护，如因此类情况而造成网络服务（包括收费网络服务）在合理时间内的中断，拼品网无需为此承担任何责任。拼品网保留不经事先通知为维修保养、升级或其它目的暂停本服务任何部分的权利。\r\n4．6　 本服务或第三人可提供与其它国际互联网上之网站或资源之链接。由于拼品网无法控制这些网站及资源，您了解并同意，此类网站或资源是否可供利用，拼品网不予负责，存在或源于此类网站或资源之任何内容、广告、产品或其它资料，拼品网亦不予保证或负责。因使用或依赖任何此类网站或资源发布的或经由此类网站或资 源获得的任何内容、商品或服务所产生的任何损害或损失，拼品网不承担任何责任。\r\n4．7　用户明确同意其使用拼品网网络服务所存在的风险将完全由其 自己承担。用户	理解并接受下载或通过拼品网服务取得的任何信息资料取决于用户自己，并由其承担系统受损、资料丢失以及其它任何风险。拼品网对在服务网上得 到的任何商品购物服	务、交易进程、招聘信息，都不作担保。\r\n4．8　3个月未登录的帐号，拼品网保留关闭的权利。\r\n4．9　拼品网有权于任何时间暂时或永久修改或终止本服务（或其任何部分），而无论其通知与否，拼品网对用户和任何第三人均无需承担任何责任。\r\n4．10　终止服务\r\n您同意拼品网得基于其自行之考虑，因任何理由，包含但不限于长时间未使用，或拼品网认为您已经违反本服务协议的文字及精神，终止您的密码、帐号或本服务之使 用（或服务之任何部分），并将您在本服务内任何内容加以移除并删除。您同意依本服务协议任何规定提供之本服务，无需进行事先通知即可中断或终止，您承认并 同意，拼品网可立即关闭或删除您的帐号及您帐号中所有相关信息及文件，及/或禁止继续使用前述文件或本服务。此外，您同意若本服务之使用被中断或终止或您 的帐号及相关信息和文件被关闭或删除，拼品网对您或任何第三人均不承担任何责任。\r\n五、知识产权和其他合法权益（包括但不限于名誉权、商誉权）\r\n5．1　用户专属权利\r\n拼品网尊重他人知识产权和合法权益，呼吁用户也要同样尊重知识产权和他人合法权益。若您认为您的知识产权或其他合法权益被侵犯，请按照以下说明向拼品网提供资料∶\r\n请注意：如果权利通知的陈述失实，权利通知提交者将承担对由此造成的全部法律责任（包括但不限于赔偿各种费用及律师费）。如果上述个人或单位不确定网络上可获取的资料是否侵犯了其知识产权和其他合法权益，拼品网建议该个人或单位首先咨询专业人士。\r\n为了拼品网有效处理上述个人或单位的权利通知，请使用以下格式（包括各条款的序号）：\r\n1. 权利人对涉嫌侵权内容拥有知识产权或其他合法权益和/或依法可以行使知识产权或其他合法权益的权属证明；\r\n2. 请充分、明确地描述被侵犯了知识产权或其他合法权益的情况并请提供涉嫌侵权的第三方网址（如果有）。\r\n3. 请指明涉嫌侵权网页的哪些内容侵犯了第2项中列明的权利。\r\n4. 请提供权利人具体的联络信息，包括姓名、身份证或护照复印件（对自然人）、单位登记证明复印件（对单位）、通信地址、电话号码、传真和电子邮件。\r\n5. 请提供涉嫌侵权内容在信息网络上的位置（如指明您举报的含有侵权内容的出处，即：指网页地址或网页内的位置）以便我们与您举报的含有侵权内容的网页的所有权人/管理人联系。\r\n5．1　 对于用户通过拼品网服务上传到拼品网网站上可公开获取区域的任何内容，用户同意拼品网在全世界范围内具有免费的、永久性的、不可撤销的、非独家的和完全再许可的权利和许可，以使用、复制、修改、改编、出版、翻译、据以创作衍生作品、传播、表演和展示此等内容（整体或部分），和/或将此等内容编入当前已知 的或以后开发的其他任何形式的作品、媒体或技术中。\r\n5．2　拼品网拥有本网站内所有资料的版权。任何被授权的浏览、复制、打印和传播属于本网站内的资料必须符合以下条件：所有的资料和图象均以获得信息为目的；\r\n所有的资料和图象均不得用于商业目的；\r\n所有的资料、图象及其任何部分都必须包括此版权声明；\r\n本网站（www.pinphp.com）所有的产品、技术与所有程序均属于拼品网知识产权，在此并未授权。\r\n“www.pinphp.com”, “拼品网”及相关图形等为拼品网的注册商标。\r\n未经拼品网许可，任何人不得擅自（包括但不限于：以非法的方式复制、传播、展示、镜像、上载、下载）使用。否则，拼品网将依法追究法律责任。\r\n六、青少年用户特别提示\r\n青少年用户必须遵守全国青少年网络文明公约：\r\n要善于网上学习，不浏览不良信息；要诚实友好交流，不侮辱欺诈他人；要增强自护意识，不随意约会网友；要维护网络安全，不破坏网络秩序；要有益身心健康，不沉溺虚拟时空。\r\n七、其他\r\n7．1　本协议的订立、执行和解释及争议的解决均应适用中华人民共和国法律。\r\n7．2　如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向拼品网所在地的人民法院提起诉讼。\r\n7．3　拼品网未行使或执行本服务协议任何权利或规定，不构成对前述权利或权利之放弃。\r\n7．4　如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。\r\n拼品网对本使用协议享有最终解释权。', ''),
('item_cover_comments', '2', ''),
('user_intro_default', '这个家伙太懒，什么都木留下~', ''),
('ipban_switch', '0', ''),
('score_item_img', 'a:4:{s:6:"swidth";s:3:"210";s:7:"sheight";s:3:"210";s:6:"bwidth";s:3:"350";s:7:"bheight";s:3:"350";}', ''),
('seo_config', 'a:6:{s:4:"book";a:3:{s:5:"title";s:23:"{tag_name}-{site_title}";s:8:"keywords";s:23:"逛宝贝，{site_name}";s:11:"description";s:18:"{site_description}";}s:4:"cate";a:3:{s:5:"title";s:23:"{cate_name}-{seo_title}";s:8:"keywords";s:14:"{seo_keywords}";s:11:"description";s:17:"{seo_description}";}s:5:"album";a:3:{s:5:"title";s:6:"专辑";s:8:"keywords";s:47:"{site_name},购物分享,淘宝网购物,专辑";s:11:"description";s:18:"{site_description}";}s:10:"album_cate";a:3:{s:5:"title";s:11:"{seo_title}";s:8:"keywords";s:14:"{seo_keywords}";s:11:"description";s:17:"{seo_description}";}s:12:"album_detail";a:3:{s:5:"title";s:13:"{album_title}";s:8:"keywords";s:13:"{album_intro}";s:11:"description";s:23:"杂志详细Description";}s:4:"item";a:3:{s:5:"title";s:12:"{item_title}";s:8:"keywords";s:10:"{item_tag}";s:11:"description";s:12:"{item_intro}";}}', ''),
('item_img', 'a:2:{s:5:"width";s:3:"210";s:6:"height";s:4:"1000";}', ''),
('item_simg', 'a:2:{s:5:"width";s:3:"100";s:6:"height";s:3:"100";}', ''),
('item_bimg', 'a:2:{s:5:"width";s:3:"468";s:6:"height";s:4:"1000";}', ''),
('attach_path', 'data/upload/', ''),
('wall_distance', '500', ''),
('reg_status', '1', ''),
('reg_closed_reason', '<h1>暂时关闭注册</h1>', ''),
('index_wall', '1', ''),
('weixin_img', '1407/11/53bf889d5ad48.gif', ''),
('weixinshop_img', '1407/11/53bf889d5ba23.gif', ''),
('appid', 'wx0fdf443fd6aedc3e', ''),
('appsecret', 'fcc79b733dbf9c1caf06afe61ec32f66', ''),
('tenpay', '0', ''),
('alipayhome', 'wang376797016@126.com', ''),
('xianxia', '0', ''),
('wxpay', '0', ''),
('gralipay', '0', ''),
('sms_server', 'a:4:{s:4:"mode";s:2:"on";s:5:"phone";s:8:"12121212";s:7:"smsuser";s:4:"ssss";s:11:"smspassword";s:4:"1123";}', '短信提醒配置'),
('wxpayset', 'a:5:{s:5:"appid";s:18:"111111111111111111";s:9:"appsecret";s:19:"2222222222222222222";s:10:"paysignkey";s:18:"333333333333333333";s:9:"partnerid";s:15:"444444444444444";s:10:"partnerkey";s:17:"44444444444444444";}', '微信支付配置'),
('wxtx', '0', '微信消息提醒用户下单成功'),
('site_name', '江安优客来©版权所有 蜀ICP备12021816号-1', ''),
('site_title', '江安优客来微信商城', ''),
('site_keyword', '江安优客来微信商城', ''),
('site_description', '江安优客来微信商城，微信号jianganykl', ''),
('site_status', '1', ''),
('closed_reason', '网站升级中。。', ''),
('site_icp', '', ''),
('statistics_code', '<script type="text/javascript"> var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://"); document.write(unescape("%3Cscript src=''" + _bdhmProtocol + "hm.baidu.com/h.js%3F6e992882d30779c9c5c320e915c75da9'' type=''text/javascript''%3E%3C/script%3E")) </script>', ''),
('statics_url', '', ''),
('mail_server', 'a:5:{s:4:"mode";s:2:"on";s:4:"host";s:11:"smtp.qq.com";s:4:"from";s:16:"376797016@qq.com";s:13:"auth_username";s:17:"1736869342@qq.com";s:13:"auth_password";s:9:"WTXwtx...";}', ''),
('item_check', '0', ''),
('score_rule', 'a:16:{s:8:"register";s:2:"20";s:13:"register_nums";s:1:"1";s:5:"login";s:2:"10";s:10:"login_nums";s:1:"5";s:7:"pubitem";s:2:"20";s:12:"pubitem_nums";s:2:"10";s:8:"likeitem";s:1:"1";s:13:"likeitem_nums";s:2:"20";s:9:"joinalbum";s:1:"2";s:14:"joinalbum_nums";s:2:"10";s:6:"fwitem";s:1:"2";s:11:"fwitem_nums";s:2:"10";s:6:"pubcmt";s:1:"1";s:11:"pubcmt_nums";s:1:"5";s:7:"delitem";s:3:"-20";s:12:"delitem_nums";s:3:"100";}', ''),
('album_cover_items', '5', '专辑封面显示图片数量'),
('integrate_code', 'default', ''),
('integrate_config', '', ''),
('hot_tags', '家居,花园,美食,旅行,创意,建筑,户外,飘窗,卧室,城堡,DIY,萌宠,门厅,衣帽间,婚礼,书房,厨房,客厅,浴室,阳台,工作台,收纳,餐厅,阁楼,儿童房,小空间,性感', ''),
('wall_spage_max', '5', ''),
('wall_spage_size', '50', ''),
('book_page_max', '100', ''),
('default_keyword', '懒得逛了，我搜~', ''),
('album_default_title', '默认专辑', ''),
('avatar_size', '24,32,48,64,100,200', ''),
('attr_allow_exts', 'jpg,gif,png,jpeg,swf', ''),
('attr_allow_size', '2048', ''),
('itemcate_img', 'a:2:{s:5:"width";s:3:"150";s:6:"height";s:3:"170";}', ''),
('reg_protocol', '一、总则\r\n1．1　用户应当同意本协议的条款并按照页面上的提示完成全部的注册程序。用户在进行注册程序过程中点击"立即注册"按钮即表示用户与拼品网公司达成协议，完全接受本协议项下的全部条款。\r\n1．2　用户注册成功后，拼品网将给予每个用户一个用户帐号及相应的密码，该用户帐号和密码由用户负责保管；用户应当对以其用户帐号进行的所有活动和事件负法律责任。\r\n1．3　用户可以使用拼品网各个频道单项服务，当用户使用拼品网各单项服务时，用户的使用行为视为其对该单项服务的服务条款以及拼品网在该单项服务中发出的各类公告的同意。\r\n1．4　拼品网会员服务协议以及各个频道单项服务条款和公告可由拼品网公司随时更新，且无需另行通知。您在使用相关服务时,应关注并遵守其所适用的相关条款。\r\n您在使用拼品网提供的各项服务之前，应仔细阅读本服务协议。如您不同意本服务协议及/或随时对其的修改，您可以主动取消拼品网提供的服务；您一旦使用拼品网产品，即视为您已了解并完全同意本服务协议各项内容，包括拼品网对服务协议随时所做的任何修改，并成为拼品网用户。\r\n二、注册信息和隐私保护\r\n2．1　 拼品网帐号（即拼品网用户ID）的所有权归拼品网，用户完成注册申请手续后，获得拼品网帐号的使用权。用户应提供及时、详尽及准确的个人资料，并不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。如果因注册信息不真实而引起的问题，并对问题发生所带来的后果，拼品网概不负任何责任。\r\n2．2　用户不应将其帐号、密码转让或出借予他人使用。如用户发现其帐号遭他人非法使用，应立即通知拼品网。因黑客行为或用户的保管疏忽导致帐号、密码遭他人非法使用，拼品网不承担任何责任。\r\n2．3　拼品网不对外公开或向第三方提供单个用户的注册资料，除非：\r\n（1）事先获得用户的明确授权；\r\n（2）只有透露你的个人资料，才能提供你所要求的产品和服务；\r\n（3）根据有关的法律法规要求；\r\n（4）按照相关政府主管部门的要求；\r\n（5）为维护拼品网的合法权益。\r\n2．4　在你注册拼品网帐户，使用其他拼品网产品或服务，访问拼品网网页, 或参加促销和有奖游戏时，拼品网会收集你的个人身份识别资料，并会将这些资料用于：改进为你提供的服务及网页内容。\r\n三、使用规则\r\n3．1　用户在使用拼品网服务时，必须遵守中华人民共和国相关法律法规的规定，用户应同意将不会利用本服务进行任何违法或不正当的活动，包括但不限于下列行为∶\r\n（1）上载、展示、张贴、传播或以其它方式传送含有下列内容之一的信息：\r\n1） 反对宪法所确定的基本原则的； 2） 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的； 3） 损害国家荣誉和利益的； 4） 煽动民族仇恨、民族歧视、破坏民族团结的； 5） 破坏国家宗教政策，宣扬邪教和封建迷信的； 6） 散布谣言，扰乱社会秩序，破坏社会稳定的； 7） 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的； 8） 侮辱或者诽谤他人，侵害他人合法权利的； 9） 含有虚假、有害、胁迫、侵害他人隐私、骚扰、侵害、中伤、粗俗、猥亵、或其它道德上令人反感的内容； 10） 含有中国法律、法规、规章、条例以及任何具有法律效力之规范所限制或禁止的其它内容的；\r\n（2）不得为任何非法目的而使用网络服务系统；\r\n（3）不利用拼品网服务从事以下活动：\r\n1) 未经允许，进入计算机信息网络或者使用计算机信息网络资源的；\r\n2) 未经允许，对计算机信息网络功能进行删除、修改或者增加的；\r\n3) 未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加的；\r\n4) 故意制作、传播计算机病毒等破坏性程序的；\r\n5) 其他危害计算机信息网络安全的行为。\r\n3．2　 用户违反本协议或相关的服务条款的规定，导致或产生的任何第三方主张的任何索赔、要求或损失，包括合理的律师费，您同意赔偿拼品网与合作公司、关联公司，并使之免受损害。对此，拼品网有权视用户的行为性质，采取包括但不限于删除用户发布信息内容、暂停使用许可、终止服务、限制使用、回收拼品网帐号、追 究法律责任等措施。对恶意注册拼品网帐号或利用拼品网帐号进行违法活动、捣乱、骚扰、欺骗、其他用户以及其他违反本协议的行为，拼品网有权回收其帐号。同 时，拼品网公司会视司法部门的要求，协助调查。\r\n3．3　用户不得对本服务任何部分或本服务之使用或获得，进行复制、拷贝、出售、转售或用于任何其它商业目的。\r\n3．4　用户须对自己在使用拼品网服务过程中的行为承担法律责任。用户承担法律责任的形式包括但不限于：对受到侵害者进行赔偿，以及在拼品网公司首先承担了因用户行为导致的行政处罚或侵权损害赔偿责任后，用户应给予拼品网公司等额的赔偿。\r\n四、服务内容\r\n4．1　拼品网网络服务的具体内容由拼品网根据实际情况提供。\r\n4．2　除非本服务协议另有其它明示规定，拼品网所推出的新产品、新功能、新服务，均受到本服务协议之规范。\r\n4．3　为使用本服务，您必须能够自行经有法律资格对您提供互联网接入服务的第三方，进入国际互联网，并应自行支付相关服务费用。此外，您必须自行配备及负责与国际联网连线所需之一切必要装备，包括计算机、数据机或其它存取装置。\r\n4．4　鉴于网络服务的特殊性，用户同意拼品网有权不经事先通知，随时变更、中断或终止部分或全部的网络服务（包括收费网络服务）。拼品网不担保网络服务不会中断，对网络服务的及时性、安全性、准确性也都不作担保。\r\n4．5　拼品网需要定期或不定期地对提供网络服务的平台或相关的设备进行检修或者维护，如因此类情况而造成网络服务（包括收费网络服务）在合理时间内的中断，拼品网无需为此承担任何责任。拼品网保留不经事先通知为维修保养、升级或其它目的暂停本服务任何部分的权利。\r\n4．6　 本服务或第三人可提供与其它国际互联网上之网站或资源之链接。由于拼品网无法控制这些网站及资源，您了解并同意，此类网站或资源是否可供利用，拼品网不予负责，存在或源于此类网站或资源之任何内容、广告、产品或其它资料，拼品网亦不予保证或负责。因使用或依赖任何此类网站或资源发布的或经由此类网站或资 源获得的任何内容、商品或服务所产生的任何损害或损失，拼品网不承担任何责任。\r\n4．7　用户明确同意其使用拼品网网络服务所存在的风险将完全由其 自己承担。用户	理解并接受下载或通过拼品网服务取得的任何信息资料取决于用户自己，并由其承担系统受损、资料丢失以及其它任何风险。拼品网对在服务网上得 到的任何商品购物服	务、交易进程、招聘信息，都不作担保。\r\n4．8　3个月未登录的帐号，拼品网保留关闭的权利。\r\n4．9　拼品网有权于任何时间暂时或永久修改或终止本服务（或其任何部分），而无论其通知与否，拼品网对用户和任何第三人均无需承担任何责任。\r\n4．10　终止服务\r\n您同意拼品网得基于其自行之考虑，因任何理由，包含但不限于长时间未使用，或拼品网认为您已经违反本服务协议的文字及精神，终止您的密码、帐号或本服务之使 用（或服务之任何部分），并将您在本服务内任何内容加以移除并删除。您同意依本服务协议任何规定提供之本服务，无需进行事先通知即可中断或终止，您承认并 同意，拼品网可立即关闭或删除您的帐号及您帐号中所有相关信息及文件，及/或禁止继续使用前述文件或本服务。此外，您同意若本服务之使用被中断或终止或您 的帐号及相关信息和文件被关闭或删除，拼品网对您或任何第三人均不承担任何责任。\r\n五、知识产权和其他合法权益（包括但不限于名誉权、商誉权）\r\n5．1　用户专属权利\r\n拼品网尊重他人知识产权和合法权益，呼吁用户也要同样尊重知识产权和他人合法权益。若您认为您的知识产权或其他合法权益被侵犯，请按照以下说明向拼品网提供资料∶\r\n请注意：如果权利通知的陈述失实，权利通知提交者将承担对由此造成的全部法律责任（包括但不限于赔偿各种费用及律师费）。如果上述个人或单位不确定网络上可获取的资料是否侵犯了其知识产权和其他合法权益，拼品网建议该个人或单位首先咨询专业人士。\r\n为了拼品网有效处理上述个人或单位的权利通知，请使用以下格式（包括各条款的序号）：\r\n1. 权利人对涉嫌侵权内容拥有知识产权或其他合法权益和/或依法可以行使知识产权或其他合法权益的权属证明；\r\n2. 请充分、明确地描述被侵犯了知识产权或其他合法权益的情况并请提供涉嫌侵权的第三方网址（如果有）。\r\n3. 请指明涉嫌侵权网页的哪些内容侵犯了第2项中列明的权利。\r\n4. 请提供权利人具体的联络信息，包括姓名、身份证或护照复印件（对自然人）、单位登记证明复印件（对单位）、通信地址、电话号码、传真和电子邮件。\r\n5. 请提供涉嫌侵权内容在信息网络上的位置（如指明您举报的含有侵权内容的出处，即：指网页地址或网页内的位置）以便我们与您举报的含有侵权内容的网页的所有权人/管理人联系。\r\n5．1　 对于用户通过拼品网服务上传到拼品网网站上可公开获取区域的任何内容，用户同意拼品网在全世界范围内具有免费的、永久性的、不可撤销的、非独家的和完全再许可的权利和许可，以使用、复制、修改、改编、出版、翻译、据以创作衍生作品、传播、表演和展示此等内容（整体或部分），和/或将此等内容编入当前已知 的或以后开发的其他任何形式的作品、媒体或技术中。\r\n5．2　拼品网拥有本网站内所有资料的版权。任何被授权的浏览、复制、打印和传播属于本网站内的资料必须符合以下条件：所有的资料和图象均以获得信息为目的；\r\n所有的资料和图象均不得用于商业目的；\r\n所有的资料、图象及其任何部分都必须包括此版权声明；\r\n本网站（www.pinphp.com）所有的产品、技术与所有程序均属于拼品网知识产权，在此并未授权。\r\n“www.pinphp.com”, “拼品网”及相关图形等为拼品网的注册商标。\r\n未经拼品网许可，任何人不得擅自（包括但不限于：以非法的方式复制、传播、展示、镜像、上载、下载）使用。否则，拼品网将依法追究法律责任。\r\n六、青少年用户特别提示\r\n青少年用户必须遵守全国青少年网络文明公约：\r\n要善于网上学习，不浏览不良信息；要诚实友好交流，不侮辱欺诈他人；要增强自护意识，不随意约会网友；要维护网络安全，不破坏网络秩序；要有益身心健康，不沉溺虚拟时空。\r\n七、其他\r\n7．1　本协议的订立、执行和解释及争议的解决均应适用中华人民共和国法律。\r\n7．2　如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向拼品网所在地的人民法院提起诉讼。\r\n7．3　拼品网未行使或执行本服务协议任何权利或规定，不构成对前述权利或权利之放弃。\r\n7．4　如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。\r\n拼品网对本使用协议享有最终解释权。', ''),
('item_cover_comments', '2', ''),
('user_intro_default', '这个家伙太懒，什么都木留下~', ''),
('ipban_switch', '0', ''),
('score_item_img', 'a:4:{s:6:"swidth";s:3:"210";s:7:"sheight";s:3:"210";s:6:"bwidth";s:3:"350";s:7:"bheight";s:3:"350";}', '');
INSERT INTO `weixin_setting` (`name`, `data`, `remark`) VALUES
('seo_config', 'a:6:{s:4:"book";a:3:{s:5:"title";s:23:"{tag_name}-{site_title}";s:8:"keywords";s:23:"逛宝贝，{site_name}";s:11:"description";s:18:"{site_description}";}s:4:"cate";a:3:{s:5:"title";s:23:"{cate_name}-{seo_title}";s:8:"keywords";s:14:"{seo_keywords}";s:11:"description";s:17:"{seo_description}";}s:5:"album";a:3:{s:5:"title";s:6:"专辑";s:8:"keywords";s:47:"{site_name},购物分享,淘宝网购物,专辑";s:11:"description";s:18:"{site_description}";}s:10:"album_cate";a:3:{s:5:"title";s:11:"{seo_title}";s:8:"keywords";s:14:"{seo_keywords}";s:11:"description";s:17:"{seo_description}";}s:12:"album_detail";a:3:{s:5:"title";s:13:"{album_title}";s:8:"keywords";s:13:"{album_intro}";s:11:"description";s:23:"杂志详细Description";}s:4:"item";a:3:{s:5:"title";s:12:"{item_title}";s:8:"keywords";s:10:"{item_tag}";s:11:"description";s:12:"{item_intro}";}}', ''),
('item_img', 'a:2:{s:5:"width";s:3:"210";s:6:"height";s:4:"1000";}', ''),
('item_simg', 'a:2:{s:5:"width";s:3:"100";s:6:"height";s:3:"100";}', ''),
('item_bimg', 'a:2:{s:5:"width";s:3:"468";s:6:"height";s:4:"1000";}', ''),
('attach_path', 'data/upload/', ''),
('wall_distance', '500', ''),
('reg_status', '1', ''),
('reg_closed_reason', '<h1>暂时关闭注册</h1>', ''),
('index_wall', '1', ''),
('weixin_img', '1407/11/53bf889d5ad48.gif', ''),
('weixinshop_img', '1407/11/53bf889d5ba23.gif', ''),
('appid', 'wx0fdf443fd6aedc3e', ''),
('appsecret', 'fcc79b733dbf9c1caf06afe61ec32f66', ''),
('tenpay', '0', ''),
('alipayhome', 'wang376797016@126.com', ''),
('xianxia', '0', ''),
('wxpay', '0', ''),
('gralipay', '0', ''),
('sms_server', 'a:4:{s:4:"mode";s:2:"on";s:5:"phone";s:8:"12121212";s:7:"smsuser";s:4:"ssss";s:11:"smspassword";s:4:"1123";}', '短信提醒配置'),
('wxpayset', 'a:5:{s:5:"appid";s:18:"111111111111111111";s:9:"appsecret";s:19:"2222222222222222222";s:10:"paysignkey";s:18:"333333333333333333";s:9:"partnerid";s:15:"444444444444444";s:10:"partnerkey";s:17:"44444444444444444";}', '微信支付配置'),
('wxtx', '0', '微信消息提醒用户下单成功'),
('site_name', '江安优客来©版权所有 蜀ICP备12021816号-1', ''),
('site_title', '江安优客来微信商城', ''),
('site_keyword', '江安优客来微信商城', ''),
('site_description', '江安优客来微信商城，微信号jianganykl', ''),
('site_status', '1', ''),
('closed_reason', '网站升级中。。', ''),
('site_icp', '', ''),
('statistics_code', '<script type="text/javascript"> var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://"); document.write(unescape("%3Cscript src=''" + _bdhmProtocol + "hm.baidu.com/h.js%3F6e992882d30779c9c5c320e915c75da9'' type=''text/javascript''%3E%3C/script%3E")) </script>', ''),
('statics_url', '', ''),
('mail_server', 'a:5:{s:4:"mode";s:2:"on";s:4:"host";s:11:"smtp.qq.com";s:4:"from";s:16:"376797016@qq.com";s:13:"auth_username";s:17:"1736869342@qq.com";s:13:"auth_password";s:9:"WTXwtx...";}', ''),
('item_check', '0', ''),
('score_rule', 'a:16:{s:8:"register";s:2:"20";s:13:"register_nums";s:1:"1";s:5:"login";s:2:"10";s:10:"login_nums";s:1:"5";s:7:"pubitem";s:2:"20";s:12:"pubitem_nums";s:2:"10";s:8:"likeitem";s:1:"1";s:13:"likeitem_nums";s:2:"20";s:9:"joinalbum";s:1:"2";s:14:"joinalbum_nums";s:2:"10";s:6:"fwitem";s:1:"2";s:11:"fwitem_nums";s:2:"10";s:6:"pubcmt";s:1:"1";s:11:"pubcmt_nums";s:1:"5";s:7:"delitem";s:3:"-20";s:12:"delitem_nums";s:3:"100";}', ''),
('album_cover_items', '5', '专辑封面显示图片数量'),
('integrate_code', 'default', ''),
('integrate_config', '', ''),
('hot_tags', '家居,花园,美食,旅行,创意,建筑,户外,飘窗,卧室,城堡,DIY,萌宠,门厅,衣帽间,婚礼,书房,厨房,客厅,浴室,阳台,工作台,收纳,餐厅,阁楼,儿童房,小空间,性感', ''),
('wall_spage_max', '5', ''),
('wall_spage_size', '50', ''),
('book_page_max', '100', ''),
('default_keyword', '懒得逛了，我搜~', ''),
('album_default_title', '默认专辑', ''),
('avatar_size', '24,32,48,64,100,200', ''),
('attr_allow_exts', 'jpg,gif,png,jpeg,swf', ''),
('attr_allow_size', '2048', ''),
('itemcate_img', 'a:2:{s:5:"width";s:3:"150";s:6:"height";s:3:"170";}', ''),
('reg_protocol', '一、总则\r\n1．1　用户应当同意本协议的条款并按照页面上的提示完成全部的注册程序。用户在进行注册程序过程中点击"立即注册"按钮即表示用户与拼品网公司达成协议，完全接受本协议项下的全部条款。\r\n1．2　用户注册成功后，拼品网将给予每个用户一个用户帐号及相应的密码，该用户帐号和密码由用户负责保管；用户应当对以其用户帐号进行的所有活动和事件负法律责任。\r\n1．3　用户可以使用拼品网各个频道单项服务，当用户使用拼品网各单项服务时，用户的使用行为视为其对该单项服务的服务条款以及拼品网在该单项服务中发出的各类公告的同意。\r\n1．4　拼品网会员服务协议以及各个频道单项服务条款和公告可由拼品网公司随时更新，且无需另行通知。您在使用相关服务时,应关注并遵守其所适用的相关条款。\r\n您在使用拼品网提供的各项服务之前，应仔细阅读本服务协议。如您不同意本服务协议及/或随时对其的修改，您可以主动取消拼品网提供的服务；您一旦使用拼品网产品，即视为您已了解并完全同意本服务协议各项内容，包括拼品网对服务协议随时所做的任何修改，并成为拼品网用户。\r\n二、注册信息和隐私保护\r\n2．1　 拼品网帐号（即拼品网用户ID）的所有权归拼品网，用户完成注册申请手续后，获得拼品网帐号的使用权。用户应提供及时、详尽及准确的个人资料，并不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。如果因注册信息不真实而引起的问题，并对问题发生所带来的后果，拼品网概不负任何责任。\r\n2．2　用户不应将其帐号、密码转让或出借予他人使用。如用户发现其帐号遭他人非法使用，应立即通知拼品网。因黑客行为或用户的保管疏忽导致帐号、密码遭他人非法使用，拼品网不承担任何责任。\r\n2．3　拼品网不对外公开或向第三方提供单个用户的注册资料，除非：\r\n（1）事先获得用户的明确授权；\r\n（2）只有透露你的个人资料，才能提供你所要求的产品和服务；\r\n（3）根据有关的法律法规要求；\r\n（4）按照相关政府主管部门的要求；\r\n（5）为维护拼品网的合法权益。\r\n2．4　在你注册拼品网帐户，使用其他拼品网产品或服务，访问拼品网网页, 或参加促销和有奖游戏时，拼品网会收集你的个人身份识别资料，并会将这些资料用于：改进为你提供的服务及网页内容。\r\n三、使用规则\r\n3．1　用户在使用拼品网服务时，必须遵守中华人民共和国相关法律法规的规定，用户应同意将不会利用本服务进行任何违法或不正当的活动，包括但不限于下列行为∶\r\n（1）上载、展示、张贴、传播或以其它方式传送含有下列内容之一的信息：\r\n1） 反对宪法所确定的基本原则的； 2） 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的； 3） 损害国家荣誉和利益的； 4） 煽动民族仇恨、民族歧视、破坏民族团结的； 5） 破坏国家宗教政策，宣扬邪教和封建迷信的； 6） 散布谣言，扰乱社会秩序，破坏社会稳定的； 7） 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的； 8） 侮辱或者诽谤他人，侵害他人合法权利的； 9） 含有虚假、有害、胁迫、侵害他人隐私、骚扰、侵害、中伤、粗俗、猥亵、或其它道德上令人反感的内容； 10） 含有中国法律、法规、规章、条例以及任何具有法律效力之规范所限制或禁止的其它内容的；\r\n（2）不得为任何非法目的而使用网络服务系统；\r\n（3）不利用拼品网服务从事以下活动：\r\n1) 未经允许，进入计算机信息网络或者使用计算机信息网络资源的；\r\n2) 未经允许，对计算机信息网络功能进行删除、修改或者增加的；\r\n3) 未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加的；\r\n4) 故意制作、传播计算机病毒等破坏性程序的；\r\n5) 其他危害计算机信息网络安全的行为。\r\n3．2　 用户违反本协议或相关的服务条款的规定，导致或产生的任何第三方主张的任何索赔、要求或损失，包括合理的律师费，您同意赔偿拼品网与合作公司、关联公司，并使之免受损害。对此，拼品网有权视用户的行为性质，采取包括但不限于删除用户发布信息内容、暂停使用许可、终止服务、限制使用、回收拼品网帐号、追 究法律责任等措施。对恶意注册拼品网帐号或利用拼品网帐号进行违法活动、捣乱、骚扰、欺骗、其他用户以及其他违反本协议的行为，拼品网有权回收其帐号。同 时，拼品网公司会视司法部门的要求，协助调查。\r\n3．3　用户不得对本服务任何部分或本服务之使用或获得，进行复制、拷贝、出售、转售或用于任何其它商业目的。\r\n3．4　用户须对自己在使用拼品网服务过程中的行为承担法律责任。用户承担法律责任的形式包括但不限于：对受到侵害者进行赔偿，以及在拼品网公司首先承担了因用户行为导致的行政处罚或侵权损害赔偿责任后，用户应给予拼品网公司等额的赔偿。\r\n四、服务内容\r\n4．1　拼品网网络服务的具体内容由拼品网根据实际情况提供。\r\n4．2　除非本服务协议另有其它明示规定，拼品网所推出的新产品、新功能、新服务，均受到本服务协议之规范。\r\n4．3　为使用本服务，您必须能够自行经有法律资格对您提供互联网接入服务的第三方，进入国际互联网，并应自行支付相关服务费用。此外，您必须自行配备及负责与国际联网连线所需之一切必要装备，包括计算机、数据机或其它存取装置。\r\n4．4　鉴于网络服务的特殊性，用户同意拼品网有权不经事先通知，随时变更、中断或终止部分或全部的网络服务（包括收费网络服务）。拼品网不担保网络服务不会中断，对网络服务的及时性、安全性、准确性也都不作担保。\r\n4．5　拼品网需要定期或不定期地对提供网络服务的平台或相关的设备进行检修或者维护，如因此类情况而造成网络服务（包括收费网络服务）在合理时间内的中断，拼品网无需为此承担任何责任。拼品网保留不经事先通知为维修保养、升级或其它目的暂停本服务任何部分的权利。\r\n4．6　 本服务或第三人可提供与其它国际互联网上之网站或资源之链接。由于拼品网无法控制这些网站及资源，您了解并同意，此类网站或资源是否可供利用，拼品网不予负责，存在或源于此类网站或资源之任何内容、广告、产品或其它资料，拼品网亦不予保证或负责。因使用或依赖任何此类网站或资源发布的或经由此类网站或资 源获得的任何内容、商品或服务所产生的任何损害或损失，拼品网不承担任何责任。\r\n4．7　用户明确同意其使用拼品网网络服务所存在的风险将完全由其 自己承担。用户	理解并接受下载或通过拼品网服务取得的任何信息资料取决于用户自己，并由其承担系统受损、资料丢失以及其它任何风险。拼品网对在服务网上得 到的任何商品购物服	务、交易进程、招聘信息，都不作担保。\r\n4．8　3个月未登录的帐号，拼品网保留关闭的权利。\r\n4．9　拼品网有权于任何时间暂时或永久修改或终止本服务（或其任何部分），而无论其通知与否，拼品网对用户和任何第三人均无需承担任何责任。\r\n4．10　终止服务\r\n您同意拼品网得基于其自行之考虑，因任何理由，包含但不限于长时间未使用，或拼品网认为您已经违反本服务协议的文字及精神，终止您的密码、帐号或本服务之使 用（或服务之任何部分），并将您在本服务内任何内容加以移除并删除。您同意依本服务协议任何规定提供之本服务，无需进行事先通知即可中断或终止，您承认并 同意，拼品网可立即关闭或删除您的帐号及您帐号中所有相关信息及文件，及/或禁止继续使用前述文件或本服务。此外，您同意若本服务之使用被中断或终止或您 的帐号及相关信息和文件被关闭或删除，拼品网对您或任何第三人均不承担任何责任。\r\n五、知识产权和其他合法权益（包括但不限于名誉权、商誉权）\r\n5．1　用户专属权利\r\n拼品网尊重他人知识产权和合法权益，呼吁用户也要同样尊重知识产权和他人合法权益。若您认为您的知识产权或其他合法权益被侵犯，请按照以下说明向拼品网提供资料∶\r\n请注意：如果权利通知的陈述失实，权利通知提交者将承担对由此造成的全部法律责任（包括但不限于赔偿各种费用及律师费）。如果上述个人或单位不确定网络上可获取的资料是否侵犯了其知识产权和其他合法权益，拼品网建议该个人或单位首先咨询专业人士。\r\n为了拼品网有效处理上述个人或单位的权利通知，请使用以下格式（包括各条款的序号）：\r\n1. 权利人对涉嫌侵权内容拥有知识产权或其他合法权益和/或依法可以行使知识产权或其他合法权益的权属证明；\r\n2. 请充分、明确地描述被侵犯了知识产权或其他合法权益的情况并请提供涉嫌侵权的第三方网址（如果有）。\r\n3. 请指明涉嫌侵权网页的哪些内容侵犯了第2项中列明的权利。\r\n4. 请提供权利人具体的联络信息，包括姓名、身份证或护照复印件（对自然人）、单位登记证明复印件（对单位）、通信地址、电话号码、传真和电子邮件。\r\n5. 请提供涉嫌侵权内容在信息网络上的位置（如指明您举报的含有侵权内容的出处，即：指网页地址或网页内的位置）以便我们与您举报的含有侵权内容的网页的所有权人/管理人联系。\r\n5．1　 对于用户通过拼品网服务上传到拼品网网站上可公开获取区域的任何内容，用户同意拼品网在全世界范围内具有免费的、永久性的、不可撤销的、非独家的和完全再许可的权利和许可，以使用、复制、修改、改编、出版、翻译、据以创作衍生作品、传播、表演和展示此等内容（整体或部分），和/或将此等内容编入当前已知 的或以后开发的其他任何形式的作品、媒体或技术中。\r\n5．2　拼品网拥有本网站内所有资料的版权。任何被授权的浏览、复制、打印和传播属于本网站内的资料必须符合以下条件：所有的资料和图象均以获得信息为目的；\r\n所有的资料和图象均不得用于商业目的；\r\n所有的资料、图象及其任何部分都必须包括此版权声明；\r\n本网站（www.pinphp.com）所有的产品、技术与所有程序均属于拼品网知识产权，在此并未授权。\r\n“www.pinphp.com”, “拼品网”及相关图形等为拼品网的注册商标。\r\n未经拼品网许可，任何人不得擅自（包括但不限于：以非法的方式复制、传播、展示、镜像、上载、下载）使用。否则，拼品网将依法追究法律责任。\r\n六、青少年用户特别提示\r\n青少年用户必须遵守全国青少年网络文明公约：\r\n要善于网上学习，不浏览不良信息；要诚实友好交流，不侮辱欺诈他人；要增强自护意识，不随意约会网友；要维护网络安全，不破坏网络秩序；要有益身心健康，不沉溺虚拟时空。\r\n七、其他\r\n7．1　本协议的订立、执行和解释及争议的解决均应适用中华人民共和国法律。\r\n7．2　如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向拼品网所在地的人民法院提起诉讼。\r\n7．3　拼品网未行使或执行本服务协议任何权利或规定，不构成对前述权利或权利之放弃。\r\n7．4　如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。\r\n拼品网对本使用协议享有最终解释权。', ''),
('item_cover_comments', '2', ''),
('user_intro_default', '这个家伙太懒，什么都木留下~', ''),
('ipban_switch', '0', ''),
('score_item_img', 'a:4:{s:6:"swidth";s:3:"210";s:7:"sheight";s:3:"210";s:6:"bwidth";s:3:"350";s:7:"bheight";s:3:"350";}', ''),
('seo_config', 'a:6:{s:4:"book";a:3:{s:5:"title";s:23:"{tag_name}-{site_title}";s:8:"keywords";s:23:"逛宝贝，{site_name}";s:11:"description";s:18:"{site_description}";}s:4:"cate";a:3:{s:5:"title";s:23:"{cate_name}-{seo_title}";s:8:"keywords";s:14:"{seo_keywords}";s:11:"description";s:17:"{seo_description}";}s:5:"album";a:3:{s:5:"title";s:6:"专辑";s:8:"keywords";s:47:"{site_name},购物分享,淘宝网购物,专辑";s:11:"description";s:18:"{site_description}";}s:10:"album_cate";a:3:{s:5:"title";s:11:"{seo_title}";s:8:"keywords";s:14:"{seo_keywords}";s:11:"description";s:17:"{seo_description}";}s:12:"album_detail";a:3:{s:5:"title";s:13:"{album_title}";s:8:"keywords";s:13:"{album_intro}";s:11:"description";s:23:"杂志详细Description";}s:4:"item";a:3:{s:5:"title";s:12:"{item_title}";s:8:"keywords";s:10:"{item_tag}";s:11:"description";s:12:"{item_intro}";}}', ''),
('item_img', 'a:2:{s:5:"width";s:3:"210";s:6:"height";s:4:"1000";}', ''),
('item_simg', 'a:2:{s:5:"width";s:3:"100";s:6:"height";s:3:"100";}', ''),
('item_bimg', 'a:2:{s:5:"width";s:3:"468";s:6:"height";s:4:"1000";}', ''),
('attach_path', 'data/upload/', ''),
('wall_distance', '500', ''),
('reg_status', '1', ''),
('reg_closed_reason', '<h1>暂时关闭注册</h1>', ''),
('index_wall', '1', ''),
('weixin_img', '1407/11/53bf889d5ad48.gif', ''),
('weixinshop_img', '1407/11/53bf889d5ba23.gif', ''),
('appid', 'wx0fdf443fd6aedc3e', ''),
('appsecret', 'fcc79b733dbf9c1caf06afe61ec32f66', ''),
('tenpay', '0', ''),
('alipayhome', 'wang376797016@126.com', ''),
('sms_server', '', '短信提醒配置'),
('xianxia', '0', ''),
('wxpay', '0', ''),
('gralipay', '0', ''),
('wxpayset', '', '微信支付配置'),
('wxtx', '0', '微信消息提醒用户下单成功'),
('sms_server', '', '短信提醒配置'),
('xianxia', '0', ''),
('wxpay', '0', ''),
('gralipay', '0', ''),
('wxpayset', '', '微信支付配置'),
('wxtx', '0', '微信消息提醒用户下单成功'),
('site_name', '江安优客来©版权所有 蜀ICP备12021816号-1', ''),
('site_title', '江安优客来微信商城', ''),
('site_keyword', '江安优客来微信商城', ''),
('site_description', '江安优客来微信商城，微信号jianganykl', ''),
('site_status', '1', ''),
('closed_reason', '网站升级中。。', ''),
('site_icp', '', ''),
('statistics_code', '<script type="text/javascript"> var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://"); document.write(unescape("%3Cscript src=''" + _bdhmProtocol + "hm.baidu.com/h.js%3F6e992882d30779c9c5c320e915c75da9'' type=''text/javascript''%3E%3C/script%3E")) </script>', ''),
('statics_url', '', ''),
('mail_server', 'a:5:{s:4:"mode";s:2:"on";s:4:"host";s:11:"smtp.qq.com";s:4:"from";s:16:"376797016@qq.com";s:13:"auth_username";s:17:"1736869342@qq.com";s:13:"auth_password";s:9:"WTXwtx...";}', ''),
('item_check', '0', ''),
('score_rule', 'a:16:{s:8:"register";s:2:"20";s:13:"register_nums";s:1:"1";s:5:"login";s:2:"10";s:10:"login_nums";s:1:"5";s:7:"pubitem";s:2:"20";s:12:"pubitem_nums";s:2:"10";s:8:"likeitem";s:1:"1";s:13:"likeitem_nums";s:2:"20";s:9:"joinalbum";s:1:"2";s:14:"joinalbum_nums";s:2:"10";s:6:"fwitem";s:1:"2";s:11:"fwitem_nums";s:2:"10";s:6:"pubcmt";s:1:"1";s:11:"pubcmt_nums";s:1:"5";s:7:"delitem";s:3:"-20";s:12:"delitem_nums";s:3:"100";}', ''),
('album_cover_items', '5', '专辑封面显示图片数量'),
('integrate_code', 'default', ''),
('integrate_config', '', ''),
('hot_tags', '家居,花园,美食,旅行,创意,建筑,户外,飘窗,卧室,城堡,DIY,萌宠,门厅,衣帽间,婚礼,书房,厨房,客厅,浴室,阳台,工作台,收纳,餐厅,阁楼,儿童房,小空间,性感', ''),
('wall_spage_max', '5', ''),
('wall_spage_size', '50', ''),
('book_page_max', '100', ''),
('default_keyword', '懒得逛了，我搜~', ''),
('album_default_title', '默认专辑', ''),
('avatar_size', '24,32,48,64,100,200', ''),
('attr_allow_exts', 'jpg,gif,png,jpeg,swf', ''),
('attr_allow_size', '2048', ''),
('itemcate_img', 'a:2:{s:5:"width";s:3:"150";s:6:"height";s:3:"170";}', ''),
('reg_protocol', '一、总则\r\n1．1　用户应当同意本协议的条款并按照页面上的提示完成全部的注册程序。用户在进行注册程序过程中点击"立即注册"按钮即表示用户与拼品网公司达成协议，完全接受本协议项下的全部条款。\r\n1．2　用户注册成功后，拼品网将给予每个用户一个用户帐号及相应的密码，该用户帐号和密码由用户负责保管；用户应当对以其用户帐号进行的所有活动和事件负法律责任。\r\n1．3　用户可以使用拼品网各个频道单项服务，当用户使用拼品网各单项服务时，用户的使用行为视为其对该单项服务的服务条款以及拼品网在该单项服务中发出的各类公告的同意。\r\n1．4　拼品网会员服务协议以及各个频道单项服务条款和公告可由拼品网公司随时更新，且无需另行通知。您在使用相关服务时,应关注并遵守其所适用的相关条款。\r\n您在使用拼品网提供的各项服务之前，应仔细阅读本服务协议。如您不同意本服务协议及/或随时对其的修改，您可以主动取消拼品网提供的服务；您一旦使用拼品网产品，即视为您已了解并完全同意本服务协议各项内容，包括拼品网对服务协议随时所做的任何修改，并成为拼品网用户。\r\n二、注册信息和隐私保护\r\n2．1　 拼品网帐号（即拼品网用户ID）的所有权归拼品网，用户完成注册申请手续后，获得拼品网帐号的使用权。用户应提供及时、详尽及准确的个人资料，并不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。如果因注册信息不真实而引起的问题，并对问题发生所带来的后果，拼品网概不负任何责任。\r\n2．2　用户不应将其帐号、密码转让或出借予他人使用。如用户发现其帐号遭他人非法使用，应立即通知拼品网。因黑客行为或用户的保管疏忽导致帐号、密码遭他人非法使用，拼品网不承担任何责任。\r\n2．3　拼品网不对外公开或向第三方提供单个用户的注册资料，除非：\r\n（1）事先获得用户的明确授权；\r\n（2）只有透露你的个人资料，才能提供你所要求的产品和服务；\r\n（3）根据有关的法律法规要求；\r\n（4）按照相关政府主管部门的要求；\r\n（5）为维护拼品网的合法权益。\r\n2．4　在你注册拼品网帐户，使用其他拼品网产品或服务，访问拼品网网页, 或参加促销和有奖游戏时，拼品网会收集你的个人身份识别资料，并会将这些资料用于：改进为你提供的服务及网页内容。\r\n三、使用规则\r\n3．1　用户在使用拼品网服务时，必须遵守中华人民共和国相关法律法规的规定，用户应同意将不会利用本服务进行任何违法或不正当的活动，包括但不限于下列行为∶\r\n（1）上载、展示、张贴、传播或以其它方式传送含有下列内容之一的信息：\r\n1） 反对宪法所确定的基本原则的； 2） 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的； 3） 损害国家荣誉和利益的； 4） 煽动民族仇恨、民族歧视、破坏民族团结的； 5） 破坏国家宗教政策，宣扬邪教和封建迷信的； 6） 散布谣言，扰乱社会秩序，破坏社会稳定的； 7） 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的； 8） 侮辱或者诽谤他人，侵害他人合法权利的； 9） 含有虚假、有害、胁迫、侵害他人隐私、骚扰、侵害、中伤、粗俗、猥亵、或其它道德上令人反感的内容； 10） 含有中国法律、法规、规章、条例以及任何具有法律效力之规范所限制或禁止的其它内容的；\r\n（2）不得为任何非法目的而使用网络服务系统；\r\n（3）不利用拼品网服务从事以下活动：\r\n1) 未经允许，进入计算机信息网络或者使用计算机信息网络资源的；\r\n2) 未经允许，对计算机信息网络功能进行删除、修改或者增加的；\r\n3) 未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加的；\r\n4) 故意制作、传播计算机病毒等破坏性程序的；\r\n5) 其他危害计算机信息网络安全的行为。\r\n3．2　 用户违反本协议或相关的服务条款的规定，导致或产生的任何第三方主张的任何索赔、要求或损失，包括合理的律师费，您同意赔偿拼品网与合作公司、关联公司，并使之免受损害。对此，拼品网有权视用户的行为性质，采取包括但不限于删除用户发布信息内容、暂停使用许可、终止服务、限制使用、回收拼品网帐号、追 究法律责任等措施。对恶意注册拼品网帐号或利用拼品网帐号进行违法活动、捣乱、骚扰、欺骗、其他用户以及其他违反本协议的行为，拼品网有权回收其帐号。同 时，拼品网公司会视司法部门的要求，协助调查。\r\n3．3　用户不得对本服务任何部分或本服务之使用或获得，进行复制、拷贝、出售、转售或用于任何其它商业目的。\r\n3．4　用户须对自己在使用拼品网服务过程中的行为承担法律责任。用户承担法律责任的形式包括但不限于：对受到侵害者进行赔偿，以及在拼品网公司首先承担了因用户行为导致的行政处罚或侵权损害赔偿责任后，用户应给予拼品网公司等额的赔偿。\r\n四、服务内容\r\n4．1　拼品网网络服务的具体内容由拼品网根据实际情况提供。\r\n4．2　除非本服务协议另有其它明示规定，拼品网所推出的新产品、新功能、新服务，均受到本服务协议之规范。\r\n4．3　为使用本服务，您必须能够自行经有法律资格对您提供互联网接入服务的第三方，进入国际互联网，并应自行支付相关服务费用。此外，您必须自行配备及负责与国际联网连线所需之一切必要装备，包括计算机、数据机或其它存取装置。\r\n4．4　鉴于网络服务的特殊性，用户同意拼品网有权不经事先通知，随时变更、中断或终止部分或全部的网络服务（包括收费网络服务）。拼品网不担保网络服务不会中断，对网络服务的及时性、安全性、准确性也都不作担保。\r\n4．5　拼品网需要定期或不定期地对提供网络服务的平台或相关的设备进行检修或者维护，如因此类情况而造成网络服务（包括收费网络服务）在合理时间内的中断，拼品网无需为此承担任何责任。拼品网保留不经事先通知为维修保养、升级或其它目的暂停本服务任何部分的权利。\r\n4．6　 本服务或第三人可提供与其它国际互联网上之网站或资源之链接。由于拼品网无法控制这些网站及资源，您了解并同意，此类网站或资源是否可供利用，拼品网不予负责，存在或源于此类网站或资源之任何内容、广告、产品或其它资料，拼品网亦不予保证或负责。因使用或依赖任何此类网站或资源发布的或经由此类网站或资 源获得的任何内容、商品或服务所产生的任何损害或损失，拼品网不承担任何责任。\r\n4．7　用户明确同意其使用拼品网网络服务所存在的风险将完全由其 自己承担。用户	理解并接受下载或通过拼品网服务取得的任何信息资料取决于用户自己，并由其承担系统受损、资料丢失以及其它任何风险。拼品网对在服务网上得 到的任何商品购物服	务、交易进程、招聘信息，都不作担保。\r\n4．8　3个月未登录的帐号，拼品网保留关闭的权利。\r\n4．9　拼品网有权于任何时间暂时或永久修改或终止本服务（或其任何部分），而无论其通知与否，拼品网对用户和任何第三人均无需承担任何责任。\r\n4．10　终止服务\r\n您同意拼品网得基于其自行之考虑，因任何理由，包含但不限于长时间未使用，或拼品网认为您已经违反本服务协议的文字及精神，终止您的密码、帐号或本服务之使 用（或服务之任何部分），并将您在本服务内任何内容加以移除并删除。您同意依本服务协议任何规定提供之本服务，无需进行事先通知即可中断或终止，您承认并 同意，拼品网可立即关闭或删除您的帐号及您帐号中所有相关信息及文件，及/或禁止继续使用前述文件或本服务。此外，您同意若本服务之使用被中断或终止或您 的帐号及相关信息和文件被关闭或删除，拼品网对您或任何第三人均不承担任何责任。\r\n五、知识产权和其他合法权益（包括但不限于名誉权、商誉权）\r\n5．1　用户专属权利\r\n拼品网尊重他人知识产权和合法权益，呼吁用户也要同样尊重知识产权和他人合法权益。若您认为您的知识产权或其他合法权益被侵犯，请按照以下说明向拼品网提供资料∶\r\n请注意：如果权利通知的陈述失实，权利通知提交者将承担对由此造成的全部法律责任（包括但不限于赔偿各种费用及律师费）。如果上述个人或单位不确定网络上可获取的资料是否侵犯了其知识产权和其他合法权益，拼品网建议该个人或单位首先咨询专业人士。\r\n为了拼品网有效处理上述个人或单位的权利通知，请使用以下格式（包括各条款的序号）：\r\n1. 权利人对涉嫌侵权内容拥有知识产权或其他合法权益和/或依法可以行使知识产权或其他合法权益的权属证明；\r\n2. 请充分、明确地描述被侵犯了知识产权或其他合法权益的情况并请提供涉嫌侵权的第三方网址（如果有）。\r\n3. 请指明涉嫌侵权网页的哪些内容侵犯了第2项中列明的权利。\r\n4. 请提供权利人具体的联络信息，包括姓名、身份证或护照复印件（对自然人）、单位登记证明复印件（对单位）、通信地址、电话号码、传真和电子邮件。\r\n5. 请提供涉嫌侵权内容在信息网络上的位置（如指明您举报的含有侵权内容的出处，即：指网页地址或网页内的位置）以便我们与您举报的含有侵权内容的网页的所有权人/管理人联系。\r\n5．1　 对于用户通过拼品网服务上传到拼品网网站上可公开获取区域的任何内容，用户同意拼品网在全世界范围内具有免费的、永久性的、不可撤销的、非独家的和完全再许可的权利和许可，以使用、复制、修改、改编、出版、翻译、据以创作衍生作品、传播、表演和展示此等内容（整体或部分），和/或将此等内容编入当前已知 的或以后开发的其他任何形式的作品、媒体或技术中。\r\n5．2　拼品网拥有本网站内所有资料的版权。任何被授权的浏览、复制、打印和传播属于本网站内的资料必须符合以下条件：所有的资料和图象均以获得信息为目的；\r\n所有的资料和图象均不得用于商业目的；\r\n所有的资料、图象及其任何部分都必须包括此版权声明；\r\n本网站（www.pinphp.com）所有的产品、技术与所有程序均属于拼品网知识产权，在此并未授权。\r\n“www.pinphp.com”, “拼品网”及相关图形等为拼品网的注册商标。\r\n未经拼品网许可，任何人不得擅自（包括但不限于：以非法的方式复制、传播、展示、镜像、上载、下载）使用。否则，拼品网将依法追究法律责任。\r\n六、青少年用户特别提示\r\n青少年用户必须遵守全国青少年网络文明公约：\r\n要善于网上学习，不浏览不良信息；要诚实友好交流，不侮辱欺诈他人；要增强自护意识，不随意约会网友；要维护网络安全，不破坏网络秩序；要有益身心健康，不沉溺虚拟时空。\r\n七、其他\r\n7．1　本协议的订立、执行和解释及争议的解决均应适用中华人民共和国法律。\r\n7．2　如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向拼品网所在地的人民法院提起诉讼。\r\n7．3　拼品网未行使或执行本服务协议任何权利或规定，不构成对前述权利或权利之放弃。\r\n7．4　如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。\r\n拼品网对本使用协议享有最终解释权。', ''),
('item_cover_comments', '2', ''),
('user_intro_default', '这个家伙太懒，什么都木留下~', ''),
('ipban_switch', '0', ''),
('score_item_img', 'a:4:{s:6:"swidth";s:3:"210";s:7:"sheight";s:3:"210";s:6:"bwidth";s:3:"350";s:7:"bheight";s:3:"350";}', ''),
('seo_config', 'a:6:{s:4:"book";a:3:{s:5:"title";s:23:"{tag_name}-{site_title}";s:8:"keywords";s:23:"逛宝贝，{site_name}";s:11:"description";s:18:"{site_description}";}s:4:"cate";a:3:{s:5:"title";s:23:"{cate_name}-{seo_title}";s:8:"keywords";s:14:"{seo_keywords}";s:11:"description";s:17:"{seo_description}";}s:5:"album";a:3:{s:5:"title";s:6:"专辑";s:8:"keywords";s:47:"{site_name},购物分享,淘宝网购物,专辑";s:11:"description";s:18:"{site_description}";}s:10:"album_cate";a:3:{s:5:"title";s:11:"{seo_title}";s:8:"keywords";s:14:"{seo_keywords}";s:11:"description";s:17:"{seo_description}";}s:12:"album_detail";a:3:{s:5:"title";s:13:"{album_title}";s:8:"keywords";s:13:"{album_intro}";s:11:"description";s:23:"杂志详细Description";}s:4:"item";a:3:{s:5:"title";s:12:"{item_title}";s:8:"keywords";s:10:"{item_tag}";s:11:"description";s:12:"{item_intro}";}}', ''),
('item_img', 'a:2:{s:5:"width";s:3:"210";s:6:"height";s:4:"1000";}', ''),
('item_simg', 'a:2:{s:5:"width";s:3:"100";s:6:"height";s:3:"100";}', ''),
('item_bimg', 'a:2:{s:5:"width";s:3:"468";s:6:"height";s:4:"1000";}', ''),
('attach_path', 'data/upload/', ''),
('wall_distance', '500', ''),
('reg_status', '1', ''),
('reg_closed_reason', '<h1>暂时关闭注册</h1>', ''),
('index_wall', '1', ''),
('weixin_img', '1407/11/53bf889d5ad48.gif', ''),
('weixinshop_img', '1407/11/53bf889d5ba23.gif', ''),
('appid', 'wx0fdf443fd6aedc3e', ''),
('appsecret', 'fcc79b733dbf9c1caf06afe61ec32f66', ''),
('tenpay', '0', ''),
('alipayhome', 'wang376797016@126.com', ''),
('xianxia', '0', ''),
('wxpay', '0', ''),
('gralipay', '0', ''),
('sms_server', 'a:4:{s:4:"mode";s:2:"on";s:5:"phone";s:8:"12121212";s:7:"smsuser";s:4:"ssss";s:11:"smspassword";s:4:"1123";}', '短信提醒配置'),
('wxpayset', 'a:5:{s:5:"appid";s:18:"111111111111111111";s:9:"appsecret";s:19:"2222222222222222222";s:10:"paysignkey";s:18:"333333333333333333";s:9:"partnerid";s:15:"444444444444444";s:10:"partnerkey";s:17:"44444444444444444";}', '微信支付配置'),
('wxtx', '0', '微信消息提醒用户下单成功'),
('site_name', '江安优客来©版权所有 蜀ICP备12021816号-1', ''),
('site_title', '江安优客来微信商城', ''),
('site_keyword', '江安优客来微信商城', ''),
('site_description', '江安优客来微信商城，微信号jianganykl', ''),
('site_status', '1', ''),
('closed_reason', '网站升级中。。', ''),
('site_icp', '', ''),
('statistics_code', '<script type="text/javascript"> var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://"); document.write(unescape("%3Cscript src=''" + _bdhmProtocol + "hm.baidu.com/h.js%3F6e992882d30779c9c5c320e915c75da9'' type=''text/javascript''%3E%3C/script%3E")) </script>', ''),
('statics_url', '', ''),
('mail_server', 'a:5:{s:4:"mode";s:2:"on";s:4:"host";s:11:"smtp.qq.com";s:4:"from";s:16:"376797016@qq.com";s:13:"auth_username";s:17:"1736869342@qq.com";s:13:"auth_password";s:9:"WTXwtx...";}', ''),
('item_check', '0', ''),
('score_rule', 'a:16:{s:8:"register";s:2:"20";s:13:"register_nums";s:1:"1";s:5:"login";s:2:"10";s:10:"login_nums";s:1:"5";s:7:"pubitem";s:2:"20";s:12:"pubitem_nums";s:2:"10";s:8:"likeitem";s:1:"1";s:13:"likeitem_nums";s:2:"20";s:9:"joinalbum";s:1:"2";s:14:"joinalbum_nums";s:2:"10";s:6:"fwitem";s:1:"2";s:11:"fwitem_nums";s:2:"10";s:6:"pubcmt";s:1:"1";s:11:"pubcmt_nums";s:1:"5";s:7:"delitem";s:3:"-20";s:12:"delitem_nums";s:3:"100";}', ''),
('album_cover_items', '5', '专辑封面显示图片数量'),
('integrate_code', 'default', ''),
('integrate_config', '', ''),
('hot_tags', '家居,花园,美食,旅行,创意,建筑,户外,飘窗,卧室,城堡,DIY,萌宠,门厅,衣帽间,婚礼,书房,厨房,客厅,浴室,阳台,工作台,收纳,餐厅,阁楼,儿童房,小空间,性感', ''),
('wall_spage_max', '5', ''),
('wall_spage_size', '50', ''),
('book_page_max', '100', ''),
('default_keyword', '懒得逛了，我搜~', ''),
('album_default_title', '默认专辑', ''),
('avatar_size', '24,32,48,64,100,200', ''),
('attr_allow_exts', 'jpg,gif,png,jpeg,swf', ''),
('attr_allow_size', '2048', ''),
('itemcate_img', 'a:2:{s:5:"width";s:3:"150";s:6:"height";s:3:"170";}', '');
INSERT INTO `weixin_setting` (`name`, `data`, `remark`) VALUES
('reg_protocol', '一、总则\r\n1．1　用户应当同意本协议的条款并按照页面上的提示完成全部的注册程序。用户在进行注册程序过程中点击"立即注册"按钮即表示用户与拼品网公司达成协议，完全接受本协议项下的全部条款。\r\n1．2　用户注册成功后，拼品网将给予每个用户一个用户帐号及相应的密码，该用户帐号和密码由用户负责保管；用户应当对以其用户帐号进行的所有活动和事件负法律责任。\r\n1．3　用户可以使用拼品网各个频道单项服务，当用户使用拼品网各单项服务时，用户的使用行为视为其对该单项服务的服务条款以及拼品网在该单项服务中发出的各类公告的同意。\r\n1．4　拼品网会员服务协议以及各个频道单项服务条款和公告可由拼品网公司随时更新，且无需另行通知。您在使用相关服务时,应关注并遵守其所适用的相关条款。\r\n您在使用拼品网提供的各项服务之前，应仔细阅读本服务协议。如您不同意本服务协议及/或随时对其的修改，您可以主动取消拼品网提供的服务；您一旦使用拼品网产品，即视为您已了解并完全同意本服务协议各项内容，包括拼品网对服务协议随时所做的任何修改，并成为拼品网用户。\r\n二、注册信息和隐私保护\r\n2．1　 拼品网帐号（即拼品网用户ID）的所有权归拼品网，用户完成注册申请手续后，获得拼品网帐号的使用权。用户应提供及时、详尽及准确的个人资料，并不断更新注册资料，符合及时、详尽准确的要求。所有原始键入的资料将引用为注册资料。如果因注册信息不真实而引起的问题，并对问题发生所带来的后果，拼品网概不负任何责任。\r\n2．2　用户不应将其帐号、密码转让或出借予他人使用。如用户发现其帐号遭他人非法使用，应立即通知拼品网。因黑客行为或用户的保管疏忽导致帐号、密码遭他人非法使用，拼品网不承担任何责任。\r\n2．3　拼品网不对外公开或向第三方提供单个用户的注册资料，除非：\r\n（1）事先获得用户的明确授权；\r\n（2）只有透露你的个人资料，才能提供你所要求的产品和服务；\r\n（3）根据有关的法律法规要求；\r\n（4）按照相关政府主管部门的要求；\r\n（5）为维护拼品网的合法权益。\r\n2．4　在你注册拼品网帐户，使用其他拼品网产品或服务，访问拼品网网页, 或参加促销和有奖游戏时，拼品网会收集你的个人身份识别资料，并会将这些资料用于：改进为你提供的服务及网页内容。\r\n三、使用规则\r\n3．1　用户在使用拼品网服务时，必须遵守中华人民共和国相关法律法规的规定，用户应同意将不会利用本服务进行任何违法或不正当的活动，包括但不限于下列行为∶\r\n（1）上载、展示、张贴、传播或以其它方式传送含有下列内容之一的信息：\r\n1） 反对宪法所确定的基本原则的； 2） 危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的； 3） 损害国家荣誉和利益的； 4） 煽动民族仇恨、民族歧视、破坏民族团结的； 5） 破坏国家宗教政策，宣扬邪教和封建迷信的； 6） 散布谣言，扰乱社会秩序，破坏社会稳定的； 7） 散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的； 8） 侮辱或者诽谤他人，侵害他人合法权利的； 9） 含有虚假、有害、胁迫、侵害他人隐私、骚扰、侵害、中伤、粗俗、猥亵、或其它道德上令人反感的内容； 10） 含有中国法律、法规、规章、条例以及任何具有法律效力之规范所限制或禁止的其它内容的；\r\n（2）不得为任何非法目的而使用网络服务系统；\r\n（3）不利用拼品网服务从事以下活动：\r\n1) 未经允许，进入计算机信息网络或者使用计算机信息网络资源的；\r\n2) 未经允许，对计算机信息网络功能进行删除、修改或者增加的；\r\n3) 未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加的；\r\n4) 故意制作、传播计算机病毒等破坏性程序的；\r\n5) 其他危害计算机信息网络安全的行为。\r\n3．2　 用户违反本协议或相关的服务条款的规定，导致或产生的任何第三方主张的任何索赔、要求或损失，包括合理的律师费，您同意赔偿拼品网与合作公司、关联公司，并使之免受损害。对此，拼品网有权视用户的行为性质，采取包括但不限于删除用户发布信息内容、暂停使用许可、终止服务、限制使用、回收拼品网帐号、追 究法律责任等措施。对恶意注册拼品网帐号或利用拼品网帐号进行违法活动、捣乱、骚扰、欺骗、其他用户以及其他违反本协议的行为，拼品网有权回收其帐号。同 时，拼品网公司会视司法部门的要求，协助调查。\r\n3．3　用户不得对本服务任何部分或本服务之使用或获得，进行复制、拷贝、出售、转售或用于任何其它商业目的。\r\n3．4　用户须对自己在使用拼品网服务过程中的行为承担法律责任。用户承担法律责任的形式包括但不限于：对受到侵害者进行赔偿，以及在拼品网公司首先承担了因用户行为导致的行政处罚或侵权损害赔偿责任后，用户应给予拼品网公司等额的赔偿。\r\n四、服务内容\r\n4．1　拼品网网络服务的具体内容由拼品网根据实际情况提供。\r\n4．2　除非本服务协议另有其它明示规定，拼品网所推出的新产品、新功能、新服务，均受到本服务协议之规范。\r\n4．3　为使用本服务，您必须能够自行经有法律资格对您提供互联网接入服务的第三方，进入国际互联网，并应自行支付相关服务费用。此外，您必须自行配备及负责与国际联网连线所需之一切必要装备，包括计算机、数据机或其它存取装置。\r\n4．4　鉴于网络服务的特殊性，用户同意拼品网有权不经事先通知，随时变更、中断或终止部分或全部的网络服务（包括收费网络服务）。拼品网不担保网络服务不会中断，对网络服务的及时性、安全性、准确性也都不作担保。\r\n4．5　拼品网需要定期或不定期地对提供网络服务的平台或相关的设备进行检修或者维护，如因此类情况而造成网络服务（包括收费网络服务）在合理时间内的中断，拼品网无需为此承担任何责任。拼品网保留不经事先通知为维修保养、升级或其它目的暂停本服务任何部分的权利。\r\n4．6　 本服务或第三人可提供与其它国际互联网上之网站或资源之链接。由于拼品网无法控制这些网站及资源，您了解并同意，此类网站或资源是否可供利用，拼品网不予负责，存在或源于此类网站或资源之任何内容、广告、产品或其它资料，拼品网亦不予保证或负责。因使用或依赖任何此类网站或资源发布的或经由此类网站或资 源获得的任何内容、商品或服务所产生的任何损害或损失，拼品网不承担任何责任。\r\n4．7　用户明确同意其使用拼品网网络服务所存在的风险将完全由其 自己承担。用户	理解并接受下载或通过拼品网服务取得的任何信息资料取决于用户自己，并由其承担系统受损、资料丢失以及其它任何风险。拼品网对在服务网上得 到的任何商品购物服	务、交易进程、招聘信息，都不作担保。\r\n4．8　3个月未登录的帐号，拼品网保留关闭的权利。\r\n4．9　拼品网有权于任何时间暂时或永久修改或终止本服务（或其任何部分），而无论其通知与否，拼品网对用户和任何第三人均无需承担任何责任。\r\n4．10　终止服务\r\n您同意拼品网得基于其自行之考虑，因任何理由，包含但不限于长时间未使用，或拼品网认为您已经违反本服务协议的文字及精神，终止您的密码、帐号或本服务之使 用（或服务之任何部分），并将您在本服务内任何内容加以移除并删除。您同意依本服务协议任何规定提供之本服务，无需进行事先通知即可中断或终止，您承认并 同意，拼品网可立即关闭或删除您的帐号及您帐号中所有相关信息及文件，及/或禁止继续使用前述文件或本服务。此外，您同意若本服务之使用被中断或终止或您 的帐号及相关信息和文件被关闭或删除，拼品网对您或任何第三人均不承担任何责任。\r\n五、知识产权和其他合法权益（包括但不限于名誉权、商誉权）\r\n5．1　用户专属权利\r\n拼品网尊重他人知识产权和合法权益，呼吁用户也要同样尊重知识产权和他人合法权益。若您认为您的知识产权或其他合法权益被侵犯，请按照以下说明向拼品网提供资料∶\r\n请注意：如果权利通知的陈述失实，权利通知提交者将承担对由此造成的全部法律责任（包括但不限于赔偿各种费用及律师费）。如果上述个人或单位不确定网络上可获取的资料是否侵犯了其知识产权和其他合法权益，拼品网建议该个人或单位首先咨询专业人士。\r\n为了拼品网有效处理上述个人或单位的权利通知，请使用以下格式（包括各条款的序号）：\r\n1. 权利人对涉嫌侵权内容拥有知识产权或其他合法权益和/或依法可以行使知识产权或其他合法权益的权属证明；\r\n2. 请充分、明确地描述被侵犯了知识产权或其他合法权益的情况并请提供涉嫌侵权的第三方网址（如果有）。\r\n3. 请指明涉嫌侵权网页的哪些内容侵犯了第2项中列明的权利。\r\n4. 请提供权利人具体的联络信息，包括姓名、身份证或护照复印件（对自然人）、单位登记证明复印件（对单位）、通信地址、电话号码、传真和电子邮件。\r\n5. 请提供涉嫌侵权内容在信息网络上的位置（如指明您举报的含有侵权内容的出处，即：指网页地址或网页内的位置）以便我们与您举报的含有侵权内容的网页的所有权人/管理人联系。\r\n5．1　 对于用户通过拼品网服务上传到拼品网网站上可公开获取区域的任何内容，用户同意拼品网在全世界范围内具有免费的、永久性的、不可撤销的、非独家的和完全再许可的权利和许可，以使用、复制、修改、改编、出版、翻译、据以创作衍生作品、传播、表演和展示此等内容（整体或部分），和/或将此等内容编入当前已知 的或以后开发的其他任何形式的作品、媒体或技术中。\r\n5．2　拼品网拥有本网站内所有资料的版权。任何被授权的浏览、复制、打印和传播属于本网站内的资料必须符合以下条件：所有的资料和图象均以获得信息为目的；\r\n所有的资料和图象均不得用于商业目的；\r\n所有的资料、图象及其任何部分都必须包括此版权声明；\r\n本网站（www.pinphp.com）所有的产品、技术与所有程序均属于拼品网知识产权，在此并未授权。\r\n“www.pinphp.com”, “拼品网”及相关图形等为拼品网的注册商标。\r\n未经拼品网许可，任何人不得擅自（包括但不限于：以非法的方式复制、传播、展示、镜像、上载、下载）使用。否则，拼品网将依法追究法律责任。\r\n六、青少年用户特别提示\r\n青少年用户必须遵守全国青少年网络文明公约：\r\n要善于网上学习，不浏览不良信息；要诚实友好交流，不侮辱欺诈他人；要增强自护意识，不随意约会网友；要维护网络安全，不破坏网络秩序；要有益身心健康，不沉溺虚拟时空。\r\n七、其他\r\n7．1　本协议的订立、执行和解释及争议的解决均应适用中华人民共和国法律。\r\n7．2　如双方就本协议内容或其执行发生任何争议，双方应尽量友好协商解决；协商不成时，任何一方均可向拼品网所在地的人民法院提起诉讼。\r\n7．3　拼品网未行使或执行本服务协议任何权利或规定，不构成对前述权利或权利之放弃。\r\n7．4　如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。\r\n拼品网对本使用协议享有最终解释权。', ''),
('item_cover_comments', '2', ''),
('user_intro_default', '这个家伙太懒，什么都木留下~', ''),
('ipban_switch', '0', ''),
('score_item_img', 'a:4:{s:6:"swidth";s:3:"210";s:7:"sheight";s:3:"210";s:6:"bwidth";s:3:"350";s:7:"bheight";s:3:"350";}', ''),
('seo_config', 'a:6:{s:4:"book";a:3:{s:5:"title";s:23:"{tag_name}-{site_title}";s:8:"keywords";s:23:"逛宝贝，{site_name}";s:11:"description";s:18:"{site_description}";}s:4:"cate";a:3:{s:5:"title";s:23:"{cate_name}-{seo_title}";s:8:"keywords";s:14:"{seo_keywords}";s:11:"description";s:17:"{seo_description}";}s:5:"album";a:3:{s:5:"title";s:6:"专辑";s:8:"keywords";s:47:"{site_name},购物分享,淘宝网购物,专辑";s:11:"description";s:18:"{site_description}";}s:10:"album_cate";a:3:{s:5:"title";s:11:"{seo_title}";s:8:"keywords";s:14:"{seo_keywords}";s:11:"description";s:17:"{seo_description}";}s:12:"album_detail";a:3:{s:5:"title";s:13:"{album_title}";s:8:"keywords";s:13:"{album_intro}";s:11:"description";s:23:"杂志详细Description";}s:4:"item";a:3:{s:5:"title";s:12:"{item_title}";s:8:"keywords";s:10:"{item_tag}";s:11:"description";s:12:"{item_intro}";}}', ''),
('item_img', 'a:2:{s:5:"width";s:3:"210";s:6:"height";s:4:"1000";}', ''),
('item_simg', 'a:2:{s:5:"width";s:3:"100";s:6:"height";s:3:"100";}', ''),
('item_bimg', 'a:2:{s:5:"width";s:3:"468";s:6:"height";s:4:"1000";}', ''),
('attach_path', 'data/upload/', ''),
('wall_distance', '500', ''),
('reg_status', '1', ''),
('reg_closed_reason', '<h1>暂时关闭注册</h1>', ''),
('index_wall', '1', ''),
('weixin_img', '1407/11/53bf889d5ad48.gif', ''),
('weixinshop_img', '1407/11/53bf889d5ba23.gif', ''),
('appid', 'wx0fdf443fd6aedc3e', ''),
('appsecret', 'fcc79b733dbf9c1caf06afe61ec32f66', ''),
('tenpay', '0', ''),
('alipayhome', 'wang376797016@126.com', ''),
('xianxia', '0', ''),
('wxpay', '0', ''),
('gralipay', '0', ''),
('sms_server', 'a:4:{s:4:"mode";s:2:"on";s:5:"phone";s:8:"12121212";s:7:"smsuser";s:4:"ssss";s:11:"smspassword";s:4:"1123";}', '短信提醒配置'),
('wxpayset', 'a:5:{s:5:"appid";s:18:"111111111111111111";s:9:"appsecret";s:19:"2222222222222222222";s:10:"paysignkey";s:18:"333333333333333333";s:9:"partnerid";s:15:"444444444444444";s:10:"partnerkey";s:17:"44444444444444444";}', '微信支付配置'),
('wxtx', '0', '微信消息提醒用户下单成功');

-- --------------------------------------------------------

--
-- 表的结构 `weixin_tag`
--

CREATE TABLE IF NOT EXISTS `weixin_tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=602 ;

--
-- 转存表中的数据 `weixin_tag`
--

INSERT INTO `weixin_tag` (`id`, `name`) VALUES
(1, '外套'),
(2, '毛衣'),
(3, 'T恤'),
(4, '西装'),
(5, '风衣'),
(6, '卫衣'),
(7, '马甲'),
(8, '牛仔裤'),
(9, '小脚裤'),
(10, '哈伦裤'),
(11, '打底裤'),
(12, '五分裤'),
(13, '蕾丝'),
(14, '牛仔'),
(15, '打底'),
(16, '镂空'),
(17, '拼接'),
(18, '紧身'),
(19, '格子'),
(20, '水洗'),
(21, '高腰'),
(22, '磨旧'),
(23, '宽松'),
(24, '清新'),
(25, '欧美'),
(26, '韩系'),
(27, '甜美'),
(28, '复古'),
(29, '简约'),
(30, '英伦'),
(31, '珊瑚绒'),
(32, '莫代尔'),
(33, '纯棉'),
(34, '全棉'),
(35, '毛呢'),
(36, '针织'),
(37, '毛绒'),
(38, '雪纺'),
(39, '黑色'),
(40, '黄色'),
(41, '绿色'),
(42, '红色'),
(43, '粉色'),
(44, '紫色'),
(45, '白色'),
(46, '蓝色'),
(47, '翻领'),
(48, '毛呢大衣'),
(49, '冬装'),
(50, '专柜'),
(51, '正品'),
(52, '新款'),
(53, '一身'),
(54, '浪漫'),
(55, '韩版大'),
(56, '纯色'),
(57, '短外套'),
(58, '羊毛'),
(59, '秋装'),
(60, '球衫'),
(61, '立领'),
(62, '修身'),
(63, '长袖'),
(64, '麂皮'),
(65, '加厚'),
(66, '棉质'),
(67, '蝙蝠'),
(68, '休闲'),
(69, '带帽'),
(70, '棉衣'),
(71, '袋鼠'),
(72, '拉链'),
(73, '街头'),
(74, '女装'),
(75, '春秋'),
(76, '宣言'),
(77, '1016111'),
(78, '开衫'),
(79, '短款'),
(80, '运动休闲'),
(81, '通勤'),
(82, '亮色'),
(83, '时尚'),
(84, '胸花'),
(85, '线下'),
(86, '春装'),
(87, '夹克'),
(88, '中长'),
(89, '双排'),
(90, '小西装'),
(91, '帅气'),
(92, '无袖'),
(93, '皱褶'),
(94, '品牌女装'),
(95, '夏装'),
(96, '低跟鞋'),
(97, '细跟鞋'),
(98, '牛津鞋'),
(99, '中跟鞋'),
(100, '染发膏'),
(101, '单鞋'),
(102, '蓬蓬粉'),
(103, '发膜'),
(104, '粗跟鞋'),
(105, '弹力素'),
(106, '坡跟鞋'),
(107, '发蜡'),
(108, '平底鞋'),
(109, '马丁靴'),
(110, '假发'),
(111, '高跟鞋'),
(112, '护手霜'),
(113, '短靴'),
(114, '身体乳'),
(115, '美颈霜'),
(116, '沐浴露'),
(117, '手工皂'),
(118, '眼线膏'),
(119, '唇彩'),
(120, '眉笔'),
(121, '眼影'),
(122, '腮红'),
(123, '口红'),
(124, '蜜粉'),
(125, '粉饼'),
(126, 'BB霜'),
(127, '睫毛膏'),
(128, '指甲油'),
(129, '香水'),
(130, '药妆'),
(131, '吸油面纸'),
(132, '隔离霜'),
(133, '精油'),
(134, '爽肤水'),
(135, '眼霜'),
(136, '面膜'),
(137, '床上用品'),
(138, '洗面奶'),
(139, '卸妆油'),
(140, '喷雾'),
(141, '防晒霜'),
(142, '补水'),
(143, '控油'),
(144, '美白'),
(145, '遮瑕'),
(146, '去角质'),
(147, '祛痘'),
(148, '保湿'),
(149, '洁面'),
(150, '去黑头'),
(151, '收毛孔'),
(152, '去眼袋'),
(153, '倩碧'),
(154, '雅漾'),
(155, '资生堂'),
(156, '娇韵诗'),
(157, '欧舒丹'),
(158, '兰蔻'),
(159, '水宝宝'),
(160, '雅诗兰黛'),
(161, '丝芙兰'),
(162, '露得清'),
(163, '收纳'),
(164, '台灯'),
(165, '时钟'),
(166, '吊灯'),
(167, '吸顶灯'),
(168, '杯子'),
(169, '置物架'),
(170, '香薰'),
(171, '地毯'),
(172, '落地灯'),
(173, '桌布'),
(174, '摆件'),
(175, '墙贴'),
(176, '烛台'),
(177, '书柜'),
(178, '储物罐'),
(179, '烹饪'),
(180, '烘焙'),
(181, '锅具'),
(182, '饭盒'),
(183, '筷子'),
(184, '勺'),
(185, '茶具'),
(186, '水壶'),
(187, '盘碟'),
(188, '调味瓶'),
(189, '餐巾'),
(190, '餐垫'),
(191, '梳妆'),
(192, '家居鞋'),
(193, '窗帘'),
(194, '斗柜'),
(195, '衣柜'),
(196, '床头柜'),
(197, '茶几'),
(198, '搁板'),
(199, '电视柜'),
(200, '椅子'),
(201, '桌子'),
(202, '坐垫'),
(203, '沙发垫'),
(204, '照片墙'),
(205, '相框'),
(206, '沙发'),
(207, '挂钩'),
(208, '马桶刷'),
(209, '衣架'),
(210, '皂盒'),
(211, '浴室垫'),
(212, '浴室套件'),
(213, '浴帘'),
(214, '毛巾'),
(215, '袜套'),
(216, '电子表'),
(217, '邮差'),
(218, '单肩包'),
(219, '女包'),
(220, '真皮'),
(221, '英国'),
(222, '小包'),
(223, '牛皮'),
(224, '信封'),
(225, '包邮'),
(226, '单肩'),
(227, '斜挎'),
(228, '女士'),
(229, '学院'),
(230, 'MIYI'),
(231, '剑桥'),
(232, '糖果'),
(233, '链条'),
(234, '宴会'),
(235, '秋冬'),
(236, '2012'),
(237, '斜挎包'),
(238, '大包'),
(239, '包包'),
(240, '特价'),
(241, '手提包'),
(242, '挎包'),
(243, '清仓'),
(244, '购物'),
(245, '古风'),
(246, '机车包'),
(247, '手提'),
(248, '鸵鸟'),
(249, '单肩斜跨'),
(250, '可爱'),
(251, '斜纹'),
(252, '晚宴'),
(253, '新娘'),
(254, '结婚'),
(255, '卡其色'),
(256, '米逸'),
(257, '手包'),
(258, '鳄鱼纹'),
(259, '复古包'),
(260, '翻盖'),
(261, '水桶'),
(262, '韩版'),
(263, '简约主义'),
(264, 'MIYI2012'),
(265, '漆皮'),
(266, '磨砂'),
(267, '发带'),
(268, '礼帽'),
(269, '锁骨链'),
(270, '鸭舌帽'),
(271, '贝雷帽'),
(272, '呢大衣'),
(273, '榴莲'),
(274, '秋冬装'),
(275, '预售'),
(276, '气质'),
(277, '20281'),
(278, '特卖'),
(279, 'LLS1009'),
(280, '秋季'),
(281, '20072'),
(282, '韩版波'),
(283, 'RENEEVON'),
(284, '公主'),
(285, '20398'),
(286, '肩章'),
(287, '牛角'),
(288, '定金'),
(289, '假领'),
(290, '发饰'),
(291, '脚链'),
(292, '腰链'),
(293, '手镯'),
(294, '手链'),
(295, '耳环'),
(296, '戒指'),
(297, '耳钉'),
(298, '高帮'),
(299, '松糕'),
(300, '帆布鞋'),
(301, '休闲鞋'),
(302, '帆布'),
(303, '女式'),
(304, '鞋子'),
(305, '学生'),
(306, '韩版潮'),
(307, '女款'),
(308, '系带'),
(309, '金币'),
(310, '情侣'),
(311, '经典'),
(312, '男女'),
(313, '学生鞋'),
(314, '印花'),
(315, '星星'),
(316, '越狱'),
(317, '米勒'),
(318, '松糕鞋'),
(319, '系列'),
(320, 'ca276'),
(321, '星旗'),
(322, '条纹'),
(323, '高帮鞋'),
(324, '女鞋'),
(325, '高鞋'),
(326, '韩版厚'),
(327, '秋冬季'),
(328, '子学'),
(329, '布鞋'),
(330, '项链'),
(331, '平底'),
(332, '雪地靴'),
(333, '棉鞋'),
(334, '冬季'),
(335, '2011'),
(336, '墨镜'),
(337, '钥匙链'),
(338, '腰带'),
(339, '手套'),
(340, '头花'),
(341, '毛衣链'),
(342, '瘦腿袜'),
(343, '发箍'),
(344, '手表'),
(345, '帽子'),
(346, '围巾'),
(347, '哥特'),
(348, '个性'),
(349, '朋克'),
(350, '花朵'),
(351, '玉'),
(352, '24K金'),
(353, '水晶'),
(354, '玫瑰金'),
(355, '银饰'),
(356, '马鞍包'),
(357, '相机包'),
(358, '信封包'),
(359, '剑桥包'),
(360, '豆豆鞋'),
(361, '运动鞋'),
(362, '厚底鞋'),
(363, '工装鞋'),
(364, '长靴'),
(365, '复古鞋'),
(366, '马靴'),
(367, '布洛克鞋'),
(368, '及裸靴'),
(369, '细跟'),
(370, '圆头'),
(371, '铆钉'),
(372, '豹纹'),
(373, '粉红'),
(374, '玫红'),
(375, '深红'),
(376, '防水台'),
(377, '防水'),
(378, '流苏'),
(379, '粗跟'),
(380, '尖头'),
(381, '坡跟'),
(382, '厚底'),
(383, '撞色'),
(384, '优雅'),
(385, '名媛'),
(386, '百搭'),
(387, '医生包'),
(388, '笑脸包'),
(389, '波士顿包'),
(390, '邮差包'),
(391, '行李箱'),
(392, '水桶包'),
(393, '帆布包'),
(394, '链条包'),
(395, '手拿包'),
(396, '钱包'),
(397, '双肩包'),
(398, '代购'),
(399, '菱形格'),
(400, '菱形'),
(401, '外贸'),
(402, '金属'),
(403, '透明'),
(404, '棉麻'),
(405, '羊皮'),
(406, 'PU'),
(407, '灰黑'),
(408, '兰色'),
(409, '浅蓝'),
(410, '深蓝'),
(411, '淡蓝'),
(412, '果绿'),
(413, '浅绿'),
(414, '深绿'),
(415, '深紫'),
(416, '灰白'),
(417, '浅黄'),
(418, '米黄'),
(419, '跟鞋'),
(420, '短袖'),
(421, '男装'),
(422, '西哲'),
(423, '男士'),
(424, '男款'),
(425, '短袖T恤'),
(426, '美国'),
(427, '2013'),
(428, '一派'),
(429, '公子'),
(430, '品质'),
(431, '奶牛'),
(432, '休闲潮'),
(433, '变色'),
(434, '圆领'),
(435, '牛奶'),
(436, '衣服'),
(437, '防晒'),
(438, '防紫外线'),
(439, '披肩'),
(440, '超薄'),
(441, '罩衫'),
(442, '针织衫'),
(443, '空调'),
(444, '运动套装'),
(445, '衣装'),
(446, '休闲套装'),
(447, '运动服'),
(448, '夏季'),
(449, '时尚休闲'),
(450, '套装'),
(451, '加大'),
(452, '金丝绒'),
(453, '天鹅绒'),
(454, 'tinee'),
(455, '生缘'),
(456, '高档'),
(457, '刺绣'),
(458, '夏天'),
(459, '蝙蝠衫'),
(460, '新品'),
(461, '上衣'),
(462, '女生'),
(463, '罗兰'),
(464, '天猫'),
(465, '中大'),
(466, '绣花'),
(467, '韩版名'),
(468, '春夏'),
(469, '皇后'),
(470, '图案'),
(471, '口袋'),
(472, '圆点'),
(473, '连帽'),
(474, '韩国'),
(475, '现货'),
(476, '泡泡'),
(477, '26320'),
(478, '体恤'),
(479, 'B0601'),
(480, '艾路丝'),
(481, '情侣装'),
(482, '沙滩'),
(483, '女裙'),
(484, '件套'),
(485, 'asdsadsad'),
(486, '测试'),
(487, '是的'),
(488, '擦擦'),
(489, '11'),
(490, '11111'),
(491, '呵呵'),
(492, 'ass'),
(493, 'sssssssssss'),
(494, 'asss'),
(495, 'asdsa'),
(496, 'asdsad'),
(497, 'cc2111'),
(498, 'cccccccccccc'),
(499, 'ccc'),
(500, 'cccccccccccccc'),
(501, '111111111111'),
(502, 'asdsd'),
(503, 'cccc'),
(504, 'ccccccc'),
(505, '斯米尔'),
(506, '男鞋'),
(507, '板鞋'),
(508, '透气'),
(509, '流行'),
(510, 'Simier'),
(511, '1039'),
(512, '原来'),
(513, '撒旦'),
(514, '阿萨德'),
(515, 'sad'),
(516, '2222'),
(517, '连衣裙'),
(518, '碎花'),
(519, '裙子'),
(520, '兔子'),
(521, '流氓'),
(522, '43155'),
(523, '实打实'),
(524, '蓝白'),
(525, '布娃娃'),
(526, '海军'),
(527, '夏款'),
(528, 'cccccccccc'),
(529, '商品'),
(530, 'CCCCCCCC'),
(531, '水钻'),
(532, '子长'),
(533, '厚金'),
(534, '奥地利'),
(535, '材质'),
(536, '超强'),
(537, '尺寸'),
(538, '保色，'),
(539, '80CM'),
(540, '5CM'),
(541, '化妆镜'),
(542, '清趣'),
(543, '陶瓷'),
(544, '荷塘'),
(545, '单面'),
(546, '手工'),
(547, '幽兰'),
(548, '双层'),
(549, '奢华'),
(550, '抱枕'),
(551, '靠垫'),
(552, '照片'),
(553, 'DIY'),
(554, '木艺'),
(555, '方形'),
(556, '定制'),
(557, '水晶内雕'),
(558, '创意'),
(559, '儿童节'),
(560, '礼物'),
(561, '苹果'),
(562, '木鱼石'),
(563, '保健'),
(564, '成双成对'),
(565, '碗筷'),
(566, '喜庆'),
(567, '施华'),
(568, '礼盒'),
(569, '玫瑰'),
(570, '人生'),
(571, '洛世奇'),
(572, '对戒'),
(573, '牵手'),
(574, '钻石'),
(575, '18K'),
(576, '心心相印'),
(577, '路程'),
(578, '闪烁'),
(579, '见证'),
(580, '甜蜜'),
(581, '爱情'),
(582, '设计'),
(583, '歌曲'),
(584, '小星星'),
(585, '圆圆满满'),
(586, '欢庆'),
(587, '祝福'),
(588, '乐和'),
(589, '属于'),
(590, '宝贝'),
(591, '景德镇'),
(592, '陶瓷工艺'),
(593, '出名'),
(594, '增添'),
(595, '一道'),
(596, '风景'),
(597, '制品'),
(598, '美丽'),
(599, '属性'),
(600, '123'),
(601, '333');

-- --------------------------------------------------------

--
-- 表的结构 `weixin_topic`
--

CREATE TABLE IF NOT EXISTS `weixin_topic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `content` varchar(255) NOT NULL,
  `extra` text NOT NULL,
  `src_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '引用内容类型',
  `src_id` int(10) unsigned NOT NULL COMMENT '引用内容ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0，原创；1，转发；',
  `comments` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数量',
  `forwards` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '转发数量',
  `add_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=106 ;

--
-- 转存表中的数据 `weixin_topic`
--

INSERT INTO `weixin_topic` (`id`, `uid`, `uname`, `content`, `extra`, `src_type`, `src_id`, `type`, `comments`, `forwards`, `add_time`) VALUES
(1, 14, '泡芙小米粒', '浪漫一身 2012冬装新款 专柜正品 韩版大翻领格纹毛呢大衣外套', 'http://img03.taobaocdn.com/bao/uploaded/i3/T1o2R8XdRtXXcjNLgV_020417.jpg', 0, 1, 0, 0, 0, 1353896347),
(2, 10, '设计系小女生', '浪漫一身 2012冬装新款 专柜正品 欧美范 羊毛毛纯色呢短外套', 'http://img03.taobaocdn.com/bao/uploaded/i3/T1L.urXiFJXXa2x2w2_043755.jpg', 0, 2, 0, 0, 0, 1353896347),
(3, 19, '安土桃山', '浪漫一身 2012秋装新款 专柜正品 休闲长袖薄外套修身立领棒球衫', 'http://img01.taobaocdn.com/bao/uploaded/i1/T1FGLNXmJbXXbjSLvb_093718.jpg', 0, 3, 0, 0, 0, 1353896347),
(4, 8, '枕水而眠', '浪漫一身 2012冬装新款 欧美仿麂皮翻领长袖 修身加厚短外套', 'http://img02.taobaocdn.com/bao/uploaded/i2/T1Fw5FXmxmXXc2RowZ_034012.jpg', 0, 4, 0, 0, 0, 1353896347),
(5, 8, '枕水而眠', '浪漫一身 2012秋装新款 韩版蝙蝠袖长袖 假两件休闲棉质马甲外套', 'http://img04.taobaocdn.com/bao/uploaded/i4/T1tmvLXnhmXXXxzzQW_024228.jpg', 0, 5, 0, 0, 0, 1353896347),
(6, 18, '晨雪熙', '浪漫一身  直筒带帽休闲加薄长款棉衣外套', 'http://img01.taobaocdn.com/bao/uploaded/i1/T1dmCzXaxgXXcNQv71_040909.jpg', 0, 6, 0, 0, 0, 1353896348),
(7, 6, '起个名字太累', '浪漫一身 2012秋装新款 修身街头运动 拉链带帽拼接袋鼠兜短外套', 'http://img01.taobaocdn.com/bao/uploaded/i1/T1yhLQXnVqXXXEh_71_042519.jpg', 0, 7, 0, 0, 0, 1353896348),
(8, 18, '晨雪熙', '浪漫宣言新款春秋修身单扣长袖女装短外套1016111', 'http://img03.taobaocdn.com/bao/uploaded/i3/T1ssGRXeVoXXXa7CQ5_060120.jpg', 0, 8, 0, 0, 0, 1353896348),
(9, 20, '熊小熊zz', '浪漫一身 2012秋装新款 专柜正品 韩版蝙蝠袖西装式针织开衫外套', 'http://img01.taobaocdn.com/bao/uploaded/i1/T1hP1mXjRrXXcK2PU3_050554.jpg', 0, 9, 0, 0, 0, 1353896348),
(10, 8, '枕水而眠', '浪漫一身 2012秋装新款 直筒运动休闲长袖 短款立领拉链纯色外套', 'http://img01.taobaocdn.com/bao/uploaded/i1/T1As6HXiBmXXcXtaPb_093121.jpg', 0, 10, 0, 0, 0, 1353896348),
(11, 18, '晨雪熙', '浪漫一身 2012秋装新款 宽松加厚运动休闲 带拉链连帽毛衣外套', 'http://img01.taobaocdn.com/bao/uploaded/i1/T1_fvTXbdjXXc3i8E1_042214.jpg', 0, 11, 0, 0, 0, 1353896348),
(12, 20, '熊小熊zz', '浪漫一身 2012冬装新款 专柜正品 通勤简约 柳钉拼接时尚短外套', 'http://img04.taobaocdn.com/bao/uploaded/i4/T1vdvYXktiXXb1Opc__104853.jpg', 0, 12, 0, 0, 0, 1353896348),
(13, 14, '泡芙小米粒', '浪漫一身 2012秋装新款 专柜正品 亮色带帽长袖休闲格子外套', 'http://img02.taobaocdn.com/bao/uploaded/i2/T1h4F7XbdAXXce_eEZ_032143.jpg', 0, 13, 0, 0, 0, 1353896348),
(14, 14, '泡芙小米粒', '浪漫一身 2012秋装新款 通勤OL开衫V领长袖 纯色百搭时尚小外套', 'http://img04.taobaocdn.com/bao/uploaded/i4/T1qdnCXlBhXXbCT873_051140.jpg', 0, 14, 0, 0, 0, 1353896349),
(15, 8, '枕水而眠', '浪漫一身 线下专柜正品 2012春装一粒扣短款西装 韩版胸花短外套', 'http://img01.taobaocdn.com/bao/uploaded/i1/T1QEO7XcBdXXXWXn.U_015911.jpg', 0, 15, 0, 0, 0, 1353896349),
(16, 18, '晨雪熙', '浪漫一身 线下 专柜正品 2012春装翻领长袖中长款 夹克风衣外套女', 'http://img02.taobaocdn.com/bao/uploaded/i2/T1DReVXjtbXXcISRE9_104415.jpg', 0, 16, 0, 0, 0, 1353896349),
(17, 10, '设计系小女生', '浪漫一身 2012秋装新款 线下 专柜正品 韩版双排扣风衣外套', 'http://img03.taobaocdn.com/bao/uploaded/i3/T1Xo6dXhptXXb5KSA9_104530.jpg', 0, 17, 0, 0, 0, 1353896349),
(18, 17, 'V小莲小莲V', '浪漫一身 2012秋装新款 通勤长袖翻领  OL时尚帅气小西装式短外套', 'http://img03.taobaocdn.com/bao/uploaded/i3/T1ms_UXi0bXXb4juQ1_041036.jpg', 0, 18, 0, 0, 0, 1353896349),
(19, 6, '起个名字太累', '浪漫一身 冬装 专柜正品 羊毛毛呢短外套  外套 女装长袖', 'http://img02.taobaocdn.com/bao/uploaded/i2/T1V_KxXkXuXXX2Qls4_053710.jpg', 0, 19, 0, 0, 0, 1353896349),
(20, 18, '晨雪熙', '浪漫一身 品牌女装 专柜正品 春夏装中长款抽皱褶无袖短外套', 'http://img01.taobaocdn.com/bao/uploaded/i1/T1vN18Xe8wXXabtx7U_014829.jpg', 0, 20, 0, 0, 0, 1353896349),
(21, 12, '跳房子123', 'MIYI 英国2013新款头层牛皮撞色真皮女包小包单肩包信封邮差包邮', 'http://img04.taobaocdn.com/bao/uploaded/i4/T1oAbZXkldXXcH5ug2_043616.jpg', 0, 21, 0, 0, 0, 1353902316),
(22, 7, '咕咕是一只猫', 'MIYI 2012英伦复古学院风牛皮撞色邮差包 时尚单肩斜挎潮包女士包', 'http://img02.taobaocdn.com/bao/uploaded/i2/T1qrdqXXlwXXa_4U38_101909.jpg', 0, 22, 0, 0, 0, 1353902316),
(23, 11, '彩色淘', 'MIYI 英伦学院风复古糖果色牛皮剑桥包 单肩包时尚女包 小包潮包', 'http://img03.taobaocdn.com/bao/uploaded/i3/T1yj1xXg01XXX_.NQ8_100702.jpg', 0, 23, 0, 0, 0, 1353902316),
(24, 11, '彩色淘', 'MIYI 2012新款秋冬头层牛皮女包菱格链条包单肩包 真皮女包宴会包', 'http://img02.taobaocdn.com/bao/uploaded/i2/T1DsrnXbRkXXanw8_b_124847.jpg', 0, 24, 0, 0, 0, 1353902316),
(25, 7, '咕咕是一只猫', 'MIYI 2012秋冬新款欧美时尚牛皮邮差包单肩斜挎包 复古百搭女大包', 'http://img01.taobaocdn.com/bao/uploaded/i1/T18U_SXklkXXcPno7._084022.jpg', 0, 25, 0, 0, 0, 1353902316),
(26, 15, 'Prickleman', 'MIYI秋冬新款牛皮复古OL通勤单肩斜挎女包包英伦潮款特价包邮', 'http://img04.taobaocdn.com/bao/uploaded/i4/T1_HC7XhlwXXbMVu7W_023330.jpg', 0, 26, 0, 0, 0, 1353902316),
(27, 11, '彩色淘', '【清仓】MIYI 简约手提包女包 单肩牛皮大包通勤包 购物包肩挎包', 'http://img03.taobaocdn.com/bao/uploaded/i3/T1rnuWXbXwXXaT3dnb_093439.jpg', 0, 27, 0, 0, 0, 1353902316),
(28, 8, '枕水而眠', 'MIYI 秋冬新款复古风撞色手提包单肩包斜挎包包 机车包邮差包女包', 'http://img01.taobaocdn.com/bao/uploaded/i1/T1sPfKXcxbXXXPQIYb_123402.jpg', 0, 28, 0, 0, 0, 1353902317),
(29, 16, 'Eudora_寻寻', 'MIYI 欧美鸵鸟纹头层牛皮单肩包斜跨复古女包邮差包 手提真皮女包', 'http://img04.taobaocdn.com/bao/uploaded/i4/T1gz6JXj8iXXblFxU8_100704.jpg', 0, 29, 0, 0, 0, 1353902317),
(30, 20, '熊小熊zz', 'MIYI时尚可爱复古学院风糖果色单肩斜跨女包包小包牛皮邮差包特价', 'http://img02.taobaocdn.com/bao/uploaded/i2/T1m397XXJlXXaqnVg0_033805.jpg', 0, 30, 0, 0, 0, 1353902317),
(31, 12, '跳房子123', 'MIYI 红色斜纹牛皮单肩包包女包 2012新款潮包结婚包新娘包晚宴包', 'http://img02.taobaocdn.com/bao/uploaded/i2/T1X697XjXbXXcMnfM._112229.jpg', 0, 31, 0, 0, 0, 1353902317),
(32, 12, '跳房子123', 'MIYI米逸 新款英伦小包卡其色单肩包复古牛皮撞色复古女包邮差包', 'http://img04.taobaocdn.com/bao/uploaded/i4/T1DxC8Xi4eXXXO8ZZ5_054947.jpg', 0, 32, 0, 0, 0, 1353902317),
(33, 14, '泡芙小米粒', 'MIYI新款鳄鱼纹翻盖潮手包牛皮女包单肩包复古包小包包 清仓包邮', 'http://img04.taobaocdn.com/bao/uploaded/i4/T1wBy7XflaXXX6UvwV_020442.jpg', 0, 33, 0, 0, 0, 1353902317),
(34, 10, '设计系小女生', 'MIYI 2012秋冬新款头层牛皮手提包单肩包水桶真皮女包通勤包包邮', 'http://img01.taobaocdn.com/bao/uploaded/i1/T1tWOuXmFTXXXbvKDb_093608.jpg', 0, 34, 0, 0, 0, 1353902317),
(35, 20, '熊小熊zz', 'MIYI单肩小包2012新款潮时尚韩版休闲牛皮欧美红色新娘手拿女包包', 'http://img01.taobaocdn.com/bao/uploaded/i1/T1xtK1XnlkXXaGp4E6_062100.jpg', 0, 35, 0, 0, 0, 1353902318),
(36, 6, '起个名字太累', 'MIYI韩版新款真皮女包包2012新款潮女包水桶通勤斜挎单肩机车包邮', 'http://img02.taobaocdn.com/bao/uploaded/i2/T1Ad58XctiXXcyC0s8_100130.jpg', 0, 36, 0, 0, 0, 1353902318),
(37, 13, '想太多妹子', 'MIYI 2012秋冬新款欧美头层牛皮单肩斜挎包 韩版真皮女包通勤包包', 'http://img02.taobaocdn.com/bao/uploaded/i2/T1O9mQXndwXXXD_O.0_035651.jpg', 0, 37, 0, 0, 0, 1353902318),
(38, 6, '起个名字太累', 'MIYI2012新款全牛皮简约主义韩版糖果女包包复古手提大包单肩包', 'http://img01.taobaocdn.com/bao/uploaded/i1/T17FtRXaBGXXa3dJs6_061244.jpg', 0, 38, 0, 0, 0, 1353902318),
(39, 17, 'V小莲小莲V', 'MIYI 鳄鱼纹晚宴包链条包单肩包 牛皮潮女包漆皮菱格包 清仓包邮', 'http://img01.taobaocdn.com/bao/uploaded/i1/T1h8HdXXXkXXcz7r.4_051921.jpg', 0, 39, 0, 0, 0, 1353902318),
(40, 20, '熊小熊zz', 'MIYI休闲糖果色邮差包韩版撞色单肩斜挎包磨砂牛皮复古包包女包', 'http://img04.taobaocdn.com/bao/uploaded/i4/T1.Ly7XmhmXXcoBArb_124637.jpg', 0, 40, 0, 0, 0, 1353902318),
(41, 13, '想太多妹子', '预售款 榴莲家秋冬装新款呢大衣女 双排扣气质呢大衣外套20281', 'http://img04.taobaocdn.com/bao/uploaded/i4/T1srf5Xm8XXXXV8lI__110350.jpg', 0, 41, 0, 0, 0, 1353902490),
(42, 8, '枕水而眠', '特卖款2012秋冬新款榴莲家 风衣帅气外套 带帽风衣外套LLS1009', 'http://img02.taobaocdn.com/bao/uploaded/i2/T1x7C0XhxqXXbW6xwT_012127.jpg', 0, 42, 0, 0, 0, 1353902490),
(43, 20, '熊小熊zz', '榴莲家2012秋季女装 韩版波点翻袖小西装外套 修身休闲西装 20072', 'http://img02.taobaocdn.com/bao/uploaded/i2/T1Ag54XbtuXXXfz.I5_060343.jpg', 0, 43, 0, 0, 0, 1353902490),
(44, 18, '晨雪熙', '预售款 榴莲家2012秋冬新款 RENEEVON★秋款绝美公主外套20398', 'http://img04.taobaocdn.com/bao/uploaded/i4/T1ugbYXkpdXXa56jsZ_033049.jpg', 0, 44, 0, 0, 0, 1353902490),
(45, 13, '想太多妹子', '预售定金 榴莲家 英伦双排扣毛呢外套牛角扣肩章羊毛呢大衣20459', 'http://img03.taobaocdn.com/bao/uploaded/i3/T1M463XeBdXXb0fkM9_074304.jpg', 0, 45, 0, 0, 0, 1353902490),
(46, 6, '起个名字太累', '远步正品 韩版潮 厚底松糕高帮帆布鞋子 学生休闲鞋 女式帆布鞋', 'http://img04.taobaocdn.com/bao/uploaded/i4/T1ZArWXkllXXX.ujTX_085705.jpg', 0, 46, 0, 0, 0, 1353902641),
(47, 11, '彩色淘', '淘金币 【远步正品】 经典糖果低帮系带韩版帆布鞋 潮 男女款情侣', 'http://img01.taobaocdn.com/bao/uploaded/i1/T1EzLEXaFlXXcpN3g3_050111.jpg', 0, 47, 0, 0, 0, 1353902641),
(48, 11, '彩色淘', '【一淘专享价】远步经典糖果低帮系带韩版帆布鞋 潮 男女款情侣鞋', 'http://img01.taobaocdn.com/bao/uploaded/i1/T16.j3XdlbXXa8hGnb_123051.jpg', 0, 48, 0, 0, 0, 1353902641),
(49, 13, '想太多妹子', '【远步正品】 男女帆布鞋韩版 高帮 学生情侣鞋', 'http://img03.taobaocdn.com/bao/uploaded/i3/T1qYjFXbXfXXXvyygU_015147.jpg', 0, 49, 0, 0, 0, 1353902641),
(50, 13, '想太多妹子', '【远步正品】2012秋冬新款 星星印花女式低帮帆布鞋学生鞋', 'http://img01.taobaocdn.com/bao/uploaded/i1/T1K_vfXlJaXXakVJ37_064254.jpg', 0, 50, 0, 0, 0, 1353902642),
(51, 12, '跳房子123', '【远步正品】男女款 越狱 低帮帆布鞋 情侣鞋', 'http://img02.taobaocdn.com/bao/uploaded/i2/T1RR2RXkNcXXceltU7_063938.jpg', 0, 51, 0, 0, 0, 1353902642),
(52, 6, '起个名字太累', '【远步正品】 越狱米勒系列厚底帆布鞋松糕鞋 欧美ca276', 'http://img01.taobaocdn.com/bao/uploaded/i1/T1wnqyXXNfXXa2j1I0_034801.jpg', 0, 52, 0, 0, 0, 1353902642),
(53, 14, '泡芙小米粒', '淘金币 【远步正品】 2012新款 星旗条纹男女帆布鞋情侣鞋子', 'http://img03.taobaocdn.com/bao/uploaded/i3/T197PPXgVoXXcy8OM._112623.jpg', 0, 53, 0, 0, 0, 1353902642),
(54, 8, '枕水而眠', '【远步正品】2012秋冬新款 英伦印花松糕厚底高帮鞋 松糕鞋女款', 'http://img04.taobaocdn.com/bao/uploaded/i4/T1ac2vXcRvXXXE1hsU_014747.jpg', 0, 54, 0, 0, 0, 1353902642),
(55, 17, 'V小莲小莲V', '【远步正品】2012秋冬新款 韩版星星印花女式低帮帆布鞋学生鞋', 'http://img02.taobaocdn.com/bao/uploaded/i2/T1E2O9XhFvXXbOmjZW_024241.jpg', 0, 55, 0, 0, 0, 1353902642),
(56, 9, 'wingsa区', '【远步正品】2012秋冬新款男女帆布鞋韩版 女 潮 高帮 学生情侣鞋', 'http://img04.taobaocdn.com/bao/uploaded/i4/T1l3fIXkFgXXc53Jk9_102745.jpg', 0, 56, 0, 0, 0, 1353902642),
(57, 16, 'Eudora_寻寻', '【远步正品】2012秋冬新款 印花高帮帆布鞋 韩版 学生女鞋', 'http://img01.taobaocdn.com/bao/uploaded/i1/T1msjzXfFmXXbavIAU_013829.jpg', 0, 57, 0, 0, 0, 1353902642),
(58, 19, '安土桃山', '【远步正品】 加厚松高鞋休闲棉帆布鞋 韩版厚底帆松糕鞋', 'http://img01.taobaocdn.com/bao/uploaded/i1/T1RKfEXkxkXXc.bh3U_014824.jpg', 0, 58, 0, 0, 0, 1353902643),
(59, 6, '起个名字太累', '【远步正品】2012秋冬季印花高帮帆布鞋 韩版 学生女鞋', 'http://img02.taobaocdn.com/bao/uploaded/i2/T1_tHLXn4fXXXLjDMT_013219.jpg', 0, 59, 0, 0, 0, 1353902643),
(60, 18, '晨雪熙', '远步正品 韩版潮 厚底松糕鞋 高帮布鞋子学生休闲鞋 女鞋帆布鞋', 'http://img03.taobaocdn.com/bao/uploaded/i3/T1A4n_XglcXXcUv5g0_035537.jpg', 0, 60, 0, 0, 0, 1353902643),
(61, 9, 'wingsa区', '【远步正品】2012秋冬新款时尚女士平底加绒中筒雪地靴 包邮', 'http://img02.taobaocdn.com/bao/uploaded/i2/T1MDaHXc0rXXaonAs9_104246.jpg', 0, 61, 0, 0, 0, 1353902643),
(62, 10, '设计系小女生', '【远步正品】  2011冬季时尚女士平底雪地靴 棉鞋', 'http://img03.taobaocdn.com/bao/uploaded/i3/T1hG1IXelfXXcX4o.9_105150.jpg', 0, 62, 0, 0, 0, 1353902643),
(63, 9, 'wingsa区', '尚西哲 男士短袖t恤 男夏装男T恤 韩版男装 t恤 大码男装短袖条纹', 'http://img02.taobaocdn.com/bao/uploaded/i2/12582025820267890/T1bjmYXzxdXXXXXXXX_!!0-item_pic.jpg', 0, 63, 0, 0, 0, 1374050935),
(64, 17, 'V小莲小莲V', '凡兔夏装男t恤男装时尚男款t男恤短袖修身男士短袖T恤衫 纯棉包邮', 'http://img02.taobaocdn.com/bao/uploaded/i2/12109022512073394/T1PLJ3XEpcXXXXXXXX_!!0-item_pic.jpg', 0, 64, 0, 0, 0, 1374050935),
(65, 20, '熊小熊zz', 't恤男短袖韩版2013新款夏装男装潮牌正品代购美国男士短袖af男t恤', 'http://img01.taobaocdn.com/bao/uploaded/i1/14456024842364836/T13LJuFkBfXXXXXXXX_!!0-item_pic.jpg', 0, 65, 0, 0, 0, 1374050935),
(66, 18, '晨雪熙', '公子一派 2013新款男士V领短袖T恤品质男装纯棉男士T恤修身男T恤', 'http://img02.taobaocdn.com/bao/uploaded/i2/18118024057573261/T1zhO3XDhbXXXXXXXX_!!0-item_pic.jpg', 0, 66, 0, 0, 0, 1374050935),
(67, 16, 'Eudora_寻寻', '奶牛的梦 短袖男装夏装2013新款 男t恤休闲翻领珠地棉男士短袖T恤', 'http://img03.taobaocdn.com/bao/uploaded/i3/14022024525063591/T1XJusXE0eXXXXXXXX_!!0-item_pic.jpg', 0, 67, 0, 0, 0, 1374050935),
(68, 17, 'V小莲小莲V', '凡兔男士短袖t恤 男 短袖韩版休闲潮 渐变色t男恤 短袖 男装包邮', 'http://img02.taobaocdn.com/bao/uploaded/i2/12109021282260613/T1phB5Xs4XXXXXXXXX_!!0-item_pic.jpg', 0, 68, 0, 0, 0, 1374050936),
(69, 17, 'V小莲小莲V', '2013夏装新款女装韩版大码修身纯棉圆领短袖女士T恤白色半袖t桖女', 'http://img03.taobaocdn.com/bao/uploaded/i3/19292023702975097/T1oh9JXqxeXXXXXXXX_!!0-item_pic.jpg', 0, 69, 0, 0, 0, 1374050954),
(70, 17, 'V小莲小莲V', '叠语 2013新款韩版糖果色潮 宽松圆领牛奶丝短袖女士T恤 简约显瘦', 'http://img01.taobaocdn.com/bao/uploaded/i1/19443027148759978/T1n1xHFoBbXXXXXXXX_!!0-item_pic.jpg', 0, 70, 0, 0, 0, 1374050954),
(71, 17, 'V小莲小莲V', '依嬅莎 2013新款夏装韩版女装专柜正品女士T恤显瘦条纹短袖t恤 女', 'http://img04.taobaocdn.com/bao/uploaded/i4/17601022601388672/T1niWsXDpfXXXXXXXX_!!0-item_pic.jpg', 0, 71, 0, 0, 0, 1374050954),
(72, 9, 'wingsa区', '2013新款夏装韩版短袖潮女装上衣服胖MM大码宽松中长款短袖女t恤', 'http://img01.taobaocdn.com/bao/uploaded/i1/13873036405076498/T1THxmFm8XXXXXXXXX_!!0-item_pic.jpg', 0, 72, 0, 0, 0, 1374050955),
(73, 11, '彩色淘', '防紫外线防晒衣长袖透明正品防晒服开衫超薄外套俊军披肩女防晒衫', 'http://img04.taobaocdn.com/bao/uploaded/i4/17801023056701550/T1TiOJXERbXXXXXXXX_!!0-item_pic.jpg', 0, 73, 0, 0, 0, 1374050975),
(74, 15, 'Prickleman', '正品 防晒衣长袖透明蕾丝超薄外套女 夏防紫外线防晒衫开衫防晒服', 'http://img02.taobaocdn.com/bao/uploaded/i2/T1ctjsXf4gXXXA2Yvb_093214.jpg', 0, 74, 0, 0, 0, 1374050975),
(75, 11, '彩色淘', '韩版防晒衫 无扣披肩 防晒衣 空调开衫罩衫超薄 针织衫外套 女夏', 'http://img04.taobaocdn.com/bao/uploaded/i4/12179025445503052/T1oHNyFl8iXXXXXXXX_!!0-item_pic.jpg', 0, 75, 0, 0, 0, 1374050975),
(76, 14, '泡芙小米粒', '韩版新款夏装中长款带帽长袖透明防晒衣空调衫防晒衫披肩开衫外套', 'http://img01.taobaocdn.com/bao/uploaded/i1/15957022531960761/T1lBuqXB4fXXXXXXXX_!!0-item_pic.jpg', 0, 76, 0, 0, 0, 1374050975),
(77, 20, '熊小熊zz', '休闲套装夏季韩版时尚女 短袖运动服运动套装夏装 大码女装卫衣装', 'http://img04.taobaocdn.com/bao/uploaded/i4/19109019960887092/T1cFFxXsVfXXXXXXXX_!!0-item_pic.jpg', 0, 77, 0, 0, 0, 1374050990),
(78, 8, '枕水而眠', '2013新款女装夏装韩版短袖时尚休闲运动套装加大码胖mm套装运动服', 'http://img01.taobaocdn.com/bao/uploaded/i1/19526021830466963/T1KW5dXxlcXXXXXXXX_!!0-item_pic.jpg', 0, 78, 0, 0, 0, 1374050990),
(79, 16, 'Eudora_寻寻', '笠莎春秋韩版天鹅绒运动套装女金丝绒大码卫衣套装休闲套装运动服', 'http://img03.taobaocdn.com/bao/uploaded/i3/10261021377723980/T1GbZ_Xl0cXXXXXXXX_!!0-item_pic.jpg', 0, 79, 0, 0, 0, 1374050990),
(80, 16, 'Eudora_寻寻', 'tinee天鹅绒运动套装女款春秋休闲套装女韩版金丝绒大码卫衣套装', 'http://img01.taobaocdn.com/bao/uploaded/i1/11492021659317504/T1TyOaXCXbXXXXXXXX_!!0-item_pic.jpg', 0, 80, 0, 0, 0, 1374050990),
(81, 10, '设计系小女生', '奕生缘2013新款 高档纯棉V领纯色修身白色韩版t恤短袖女夏装大码', 'http://img04.taobaocdn.com/bao/uploaded/i4/13411024173381739/T1IppqFbNXXXXXXXXX_!!0-item_pic.jpg', 0, 81, 0, 0, 0, 1374053759),
(82, 11, '彩色淘', '2013夏天新款女装翻领纯棉T恤女短袖韩版修身POLO衫刺绣t恤女士t', 'http://img03.taobaocdn.com/bao/uploaded/i3/12912023572419619/T1PXyaXu4cXXXXXXXX_!!0-item_pic.jpg', 0, 82, 0, 0, 0, 1374053759),
(83, 6, '起个名字太累', '新品2013胖mm显瘦款莫代尔蝙蝠衫宽松韩版短袖夏装 女 大码T恤', 'http://img03.taobaocdn.com/bao/uploaded/i3/17241035052144126/T1ANX.Xz4iXXXXXXXX_!!0-item_pic.jpg', 0, 83, 0, 0, 0, 1374053759),
(84, 8, '枕水而眠', '短袖女t恤2013夏装韩版新款小清新女装宽松甜美上衣女生白色t桖', 'http://img04.taobaocdn.com/bao/uploaded/i4/15843024126370724/T1Fq9QXstiXXXXXXXX_!!0-item_pic.jpg', 0, 84, 0, 0, 0, 1374053759),
(85, 18, '晨雪熙', '欧罗兰2013夏季新款女装韩版宽松圆领大码纯棉短袖中长款t恤女', 'http://img01.taobaocdn.com/bao/uploaded/i1/13331035721128449/T1bG5JXB8iXXXXXXXX_!!0-item_pic.jpg', 0, 85, 0, 0, 0, 1374053759),
(86, 18, '晨雪熙', '年中大促天猫 夏装 韩版名族风时尚修身大码绣花女装棉短袖t恤女', 'http://img04.taobaocdn.com/bao/uploaded/i4/10114024878170152/T162pAFoBcXXXXXXXX_!!0-item_pic.jpg', 0, 86, 0, 0, 0, 1374053759),
(87, 7, '咕咕是一只猫', '春夏新品潮爆图案印花双口袋纯棉宽松大版蝙蝠T恤 CC皇后家C0062', 'http://img01.taobaocdn.com/bao/uploaded/i1/10917022951369205/T1wfGxXCxiXXXXXXXX_!!0-item_pic.jpg', 0, 87, 0, 0, 0, 1374053759),
(88, 19, '安土桃山', '印迪洋时2013夏季新品女装韩版修身大码圆点印花连帽短袖T恤女', 'http://img01.taobaocdn.com/bao/uploaded/i1/12816023555462640/T18JONXApeXXXXXXXX_!!0-item_pic.jpg', 0, 88, 0, 0, 0, 1374053759),
(89, 6, '起个名字太累', '2013夏装女装韩国代购潮现货7分泡泡袖胖MM大码长款宽松女t恤短袖', 'http://img03.taobaocdn.com/bao/uploaded/i3/18997020551833232/T1DaRKXCReXXXXXXXX_!!0-item_pic.jpg', 0, 89, 0, 0, 0, 1374053759),
(90, 17, 'V小莲小莲V', '2013夏装韩版女款新款大码上衣网纱打底衫纯色短袖t恤短袖26320', 'http://img01.taobaocdn.com/bao/uploaded/i1/11867023623831451/T14UeRXDdXXXXXXXXX_!!0-item_pic.jpg', 0, 90, 0, 0, 0, 1374053759),
(91, 18, '晨雪熙', '哥弟专柜正品2013新款夏装新品大码女装短袖T恤 女式韩版修身上衣', 'http://img04.taobaocdn.com/bao/uploaded/i4/15721024181492800/T1wMS5Xy4cXXXXXXXX_!!0-item_pic.jpg', 0, 91, 0, 0, 0, 1374053760),
(92, 17, 'V小莲小莲V', '夏装新款2013大码女装 胖mm夏装韩版修身显瘦打底衫宽松短袖t恤', 'http://img04.taobaocdn.com/bao/uploaded/i4/13434022985138156/T1Lz1zXtXXXXXXXXXX_!!0-item_pic.jpg', 0, 92, 0, 0, 0, 1374053760),
(93, 10, '设计系小女生', '2013夏装新款韩版女装 时尚修身百搭体恤圆领印花纯棉女士T恤短袖', 'http://image.taobao.com/bao/uploaded/i4/19292023009681721/T1pgyHXEJfXXXXXXXX_!!2-item_pic.png', 0, 93, 0, 0, 0, 1374053760),
(94, 9, 'wingsa区', '艾路丝婷2013夏装新款大码韩版女装修身体恤短袖打底衫T恤女B0601', 'http://img03.taobaocdn.com/bao/uploaded/i3/13541025066567942/T1PPWEXxpfXXXXXXXX_!!0-item_pic.jpg', 0, 94, 0, 0, 0, 1374053760),
(95, 19, '安土桃山', '都衣舞尔情侣装短袖撞色拼接夏装新款韩国男女大码T恤沙滩情侣衫', 'http://img04.taobaocdn.com/bao/uploaded/i4/18075021709325472/T1L8N.XudgXXXXXXXX_!!0-item_pic.jpg', 0, 95, 0, 0, 0, 1374053760),
(96, 9, 'wingsa区', '包邮特价2013女士夏装纯色t恤/韩版修身V领白色短袖t恤女/胖mm潮', 'http://img02.taobaocdn.com/bao/uploaded/i2/14997021759858927/T1RF1XXAddXXXXXXXX_!!0-item_pic.jpg', 0, 96, 0, 0, 0, 1374053760),
(97, 17, 'V小莲小莲V', '包邮2013男T女裙女t女恤短袖情侣装夏装长款打底衫女韩版情侣T恤', 'http://img04.taobaocdn.com/bao/uploaded/i4/12239024730307672/T14HWxXqpbXXXXXXXX_!!0-item_pic.jpg', 0, 97, 0, 0, 0, 1374053760),
(98, 10, '设计系小女生', '2013夏装新款 韩版大码修身 圆领雪纺袖印花 纯棉短袖女T恤 夏', 'http://img02.taobaocdn.com/bao/uploaded/i2/12023026773167605/T14VXuFiNgXXXXXXXX_!!0-item_pic.jpg', 0, 98, 0, 0, 0, 1374053760),
(99, 17, 'V小莲小莲V', '2013夏装新款情侣装两件套女裙韩国版新品时尚撞色拼接男短袖T恤', 'http://img03.taobaocdn.com/bao/uploaded/i3/10519034815428119/T1GVSyXDFaXXXXXXXX_!!0-item_pic.jpg', 0, 99, 0, 0, 0, 1374053760),
(100, 11, '彩色淘', '2013夏装新款 韩版女装纯棉修身百搭圆领短袖T恤女 大码白色半袖', 'http://img04.taobaocdn.com/bao/uploaded/i4/18861022761956552/T1RGWvXvhfXXXXXXXX_!!0-item_pic.jpg', 0, 100, 0, 0, 0, 1374053760),
(101, 9, 'wingsa区', 'sadasdsadsadsad', '1307/18/51e7a67871098.gif', 0, 101, 0, 0, 0, 1374135928),
(102, 8, '枕水而眠', '测试', '1307/18/51e7ad7789d26.jpg', 0, 102, 0, 0, 0, 1374137719),
(103, 18, '晨雪熙', 'Simier斯米尔流行男鞋潮鞋夏季透气低帮鞋男休闲鞋男英伦板鞋1039', 'http://img03.taobaocdn.com/bao/uploaded/i3/19490024699170259/T1QmRxFX8aXXXXXXXX_!!0-item_pic.jpg', 0, 110, 0, 0, 0, 1374216640),
(104, 11, '彩色淘', '缀爱依 连衣裙 夏季 韩版 新款女装小碎花休闲修身雪纺连衣裙裙子', 'http://img01.taobaocdn.com/bao/uploaded/i1/16534025602603614/T1nUSPXq0hXXXXXXXX_!!0-item_pic.jpg', 0, 115, 0, 0, 0, 1374829008),
(105, 11, '彩色淘', '2013情侣装夏装 流氓兔子韩版短袖纯棉打底衫情侣t恤修身男女款', 'http://img01.taobaocdn.com/bao/uploaded/i1/12542025078365981/T14i8OFohXXXXXXXXX_!!0-item_pic.jpg', 0, 116, 0, 0, 0, 1375070862);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_topic_at`
--

CREATE TABLE IF NOT EXISTS `weixin_topic_at` (
  `uid` int(10) unsigned NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`uid`,`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_topic_comment`
--

CREATE TABLE IF NOT EXISTS `weixin_topic_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  `author_uid` int(10) unsigned NOT NULL,
  `content` varchar(255) NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_topic_index`
--

CREATE TABLE IF NOT EXISTS `weixin_topic_index` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `tid` int(10) unsigned NOT NULL COMMENT '信息ID',
  `author_id` int(10) unsigned NOT NULL COMMENT '发布者ID',
  `add_time` int(10) unsigned NOT NULL,
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_topic_relation`
--

CREATE TABLE IF NOT EXISTS `weixin_topic_relation` (
  `tid` int(10) unsigned NOT NULL COMMENT '信息ID',
  `src_tid` int(10) unsigned NOT NULL COMMENT '被引用信息ID',
  `author_uid` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '操作类型(1,转发)',
  PRIMARY KEY (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_user`
--

CREATE TABLE IF NOT EXISTS `weixin_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uc_uid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '0',
  `email` varchar(50) NOT NULL,
  `gender` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1男，0女',
  `tags` varchar(50) NOT NULL COMMENT '个人标签',
  `intro` varchar(500) NOT NULL,
  `byear` smallint(4) unsigned NOT NULL,
  `bmonth` tinyint(2) unsigned NOT NULL,
  `bday` tinyint(2) unsigned NOT NULL,
  `province` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `score` int(10) unsigned NOT NULL DEFAULT '0',
  `score_level` int(10) unsigned NOT NULL DEFAULT '0',
  `cover` varchar(255) NOT NULL,
  `reg_ip` varchar(15) NOT NULL,
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_ip` varchar(15) DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `shares` int(10) unsigned DEFAULT '0',
  `likes` int(10) unsigned DEFAULT '0',
  `follows` int(10) unsigned DEFAULT '0',
  `fans` int(10) unsigned DEFAULT '0',
  `albums` int(10) unsigned DEFAULT '0',
  `daren` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_user_address`
--

CREATE TABLE IF NOT EXISTS `weixin_user_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `consignee` varchar(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `sheng` varchar(50) DEFAULT NULL,
  `shi` varchar(50) DEFAULT NULL,
  `qu` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- 转存表中的数据 `weixin_user_address`
--

INSERT INTO `weixin_user_address` (`id`, `uid`, `consignee`, `address`, `mobile`, `sheng`, `shi`, `qu`) VALUES
(22, 26, 'Ace', '金沙花园', '12345678910', '福建省', '厦门市', '思明区'),
(21, 1, '周建群', '金沙花园', '15880765056', '福建省', '厦门市', '思明区'),
(20, 27, 'ff', 'fefefefefe', '11111111111', '福建省', '厦门市', '思明区'),
(23, 30, 'leebay', '西城路西城小区-B-1608', '15802986427', '北京市', '市辖区', '东城区'),
(26, 31, '甄军国', '我千万千万', '13458475598', '天津市', '市辖区', '东丽区'),
(25, 32, 'wp', 'djdn', '13501159554', '北京市', '市辖区', '西城区'),
(27, 36, '张树林', '丁庄', '18609528895', '河北省', '石家庄市', '新华区'),
(28, 34, '白龙', '不就默默', '11588745566', '北京市', '市辖区', '东城区'),
(29, 47, 'FAG', 'FR E', '180562458154', '山西省', '太原市', '杏花岭区'),
(30, 48, '官方丰都', '一封信都', '1869776445', '山西省', '太原市', '尖草坪区'),
(31, 51, '东方红', '发呵呵', '13458835178', '北京市', '市辖县', '密云县'),
(33, 59, '王语嫣', '美景家园6栋1单元601', '15181160977', '四川省', '宜宾市', '江安县'),
(34, 72, '胡伟', '竹都大道东段翠峰园', '18081399790', '四川省', '宜宾市', '江安县'),
(35, 73, '陈羽', '42米大道翠峰园汇通小额贷款公司', '15283664558', '四川省', '宜宾市', '江安县'),
(36, 74, '邓晓娟', '江安县竹都大道汇通公司', '15082603453', '四川省', '宜宾市', '市辖区'),
(37, 61, '133', '美景家园', '13684151124', '四川省', '宜宾市', '江安县'),
(39, 133, '毛利率', '吧榴莲控', '13468835189', '北京市', '市辖县', '密云县'),
(40, 134, '文章', '天堂路78号', '136181818181', '北京市', '市辖区', '东城区');

-- --------------------------------------------------------

--
-- 表的结构 `weixin_user_bind`
--

CREATE TABLE IF NOT EXISTS `weixin_user_bind` (
  `uid` int(10) unsigned NOT NULL,
  `type` varchar(60) NOT NULL,
  `keyid` varchar(100) NOT NULL,
  `info` text NOT NULL,
  KEY `uid` (`uid`),
  KEY `uid_type` (`uid`,`type`),
  KEY `type_keyid` (`type`,`keyid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_user_follow`
--

CREATE TABLE IF NOT EXISTS `weixin_user_follow` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `follow_uid` int(10) unsigned NOT NULL COMMENT '被关注者ID',
  `add_time` int(10) unsigned NOT NULL,
  `mutually` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`follow_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_user_msgtip`
--

CREATE TABLE IF NOT EXISTS `weixin_user_msgtip` (
  `uid` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1:关注，2:提到，3:私信，4:通知',
  `num` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_user_stat`
--

CREATE TABLE IF NOT EXISTS `weixin_user_stat` (
  `uid` int(10) unsigned NOT NULL,
  `action` varchar(20) NOT NULL,
  `num` int(10) unsigned NOT NULL,
  `last_time` int(10) unsigned NOT NULL,
  UNIQUE KEY `uid_type` (`uid`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `weixin_user_stat`
--

INSERT INTO `weixin_user_stat` (`uid`, `action`, `num`, `last_time`) VALUES
(9, 'login', 1, 1353909837),
(13, 'login', 1, 1353909897),
(16, 'login', 1, 1353909964),
(15, 'login', 1, 1353910012),
(11, 'login', 1, 1353910069),
(7, 'login', 1, 1353910109),
(12, 'login', 1, 1353910146),
(17, 'login', 1, 1353910177),
(20, 'login', 1, 1353910221),
(6, 'login', 1, 1353910265),
(18, 'login', 1, 1353910348),
(8, 'login', 1, 1353910407),
(19, 'login', 1, 1353910445),
(10, 'login', 1, 1353910499),
(14, 'login', 1, 1353910539),
(21, 'register', 1, 1374633583),
(21, 'login', 1, 1374633583),
(22, 'register', 1, 1374724879),
(22, 'login', 1, 1374724879),
(23, 'register', 1, 1374724936),
(23, 'login', 1, 1374724936),
(24, 'register', 1, 1374724990),
(24, 'login', 1, 1374724990),
(26, 'register', 1, 1375152929),
(26, 'login', 1, 1375152929),
(27, 'register', 1, 1375154088),
(27, 'login', 1, 1375154088),
(28, 'register', 1, 1375176967),
(28, 'login', 1, 1375176967),
(29, 'register', 1, 1375250687),
(29, 'login', 1, 1375250687),
(30, 'register', 1, 1386301201),
(30, 'login', 1, 1386301201),
(31, 'register', 1, 1386305926),
(31, 'login', 1, 1386305926),
(32, 'register', 1, 1387696742),
(32, 'login', 1, 1387696742),
(33, 'register', 1, 1387801754),
(33, 'login', 1, 1387801754),
(36, 'register', 1, 1387879956),
(36, 'login', 1, 1387879956),
(47, 'register', 1, 1388146670),
(47, 'login', 1, 1388146670),
(103, 'register', 1, 1403067050),
(103, 'login', 1, 1403067050),
(135, 'register', 1, 1404885080),
(135, 'login', 1, 1404885080);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
