-- --------------------------------------------------------

--
-- 表的结构 `weixin_ad`
--

DROP TABLE IF EXISTS `weixin_ad`;
CREATE TABLE IF NOT EXISTS `weixin_ad` (
  `id` int(5) NOT NULL auto_increment,
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
  `clicks` int(10) NOT NULL default '0',
  `add_time` int(10) NOT NULL default '0',
  `ordid` tinyint(3) unsigned NOT NULL default '255',
  `status` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_adboard`
--

DROP TABLE IF EXISTS `weixin_adboard`;
CREATE TABLE IF NOT EXISTS `weixin_adboard` (
  `id` smallint(5) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `tpl` varchar(20) NOT NULL,
  `width` smallint(5) NOT NULL,
  `height` smallint(5) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_address`
--

DROP TABLE IF EXISTS `weixin_address`;
CREATE TABLE IF NOT EXISTS `weixin_address` (
  `id` smallint(4) unsigned NOT NULL auto_increment,
  `contacts` varchar(100) default '联系人',
  `Province` varchar(50) default NULL,
  `City` varchar(50) default NULL,
  `Area` varchar(50) default NULL,
  `address` varchar(255) default NULL COMMENT '详细地址',
  `postcode` varchar(30) default NULL COMMENT '邮编',
  `mobile` varchar(50) default NULL COMMENT '手机号码',
  `phone` varchar(50) default NULL COMMENT '电话号码',
  `name` varchar(50) NOT NULL COMMENT '公司名称',
  `isno` varchar(10) default '0' COMMENT '0:否 1:是',
  `status` tinyint(1) unsigned NOT NULL default '1',
  `ordid` tinyint(3) unsigned NOT NULL default '255',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_admin`
--

DROP TABLE IF EXISTS `weixin_admin`;
CREATE TABLE IF NOT EXISTS `weixin_admin` (
  `id` mediumint(6) NOT NULL auto_increment,
  `username` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `role_id` smallint(5) NOT NULL,
  `last_ip` varchar(15) NOT NULL,
  `last_time` int(10) NOT NULL default '0',
  `email` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_name` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_admin_auth`
--

DROP TABLE IF EXISTS `weixin_admin_auth`;
CREATE TABLE IF NOT EXISTS `weixin_admin_auth` (
  `role_id` tinyint(3) NOT NULL,
  `menu_id` smallint(6) NOT NULL,
  KEY `role_id` (`role_id`,`menu_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_admin_role`
--

DROP TABLE IF EXISTS `weixin_admin_role`;
CREATE TABLE IF NOT EXISTS `weixin_admin_role` (
  `id` tinyint(3) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `remark` text NOT NULL,
  `ordid` tinyint(3) NOT NULL,
  `status` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_album`
--

DROP TABLE IF EXISTS `weixin_album`;
CREATE TABLE IF NOT EXISTS `weixin_album` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `cate_id` smallint(4) unsigned NOT NULL default '0',
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `intro` varchar(255) default NULL,
  `banner` varchar(255) default NULL,
  `cover_cache` text NOT NULL,
  `status` tinyint(1) NOT NULL default '1',
  `ordid` tinyint(3) unsigned NOT NULL default '255',
  `likes` int(10) NOT NULL,
  `items` int(10) unsigned NOT NULL default '0',
  `follows` int(10) unsigned NOT NULL default '0',
  `is_index` tinyint(1) unsigned NOT NULL default '0',
  `add_time` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_album_cate`
--

DROP TABLE IF EXISTS `weixin_album_cate`;
CREATE TABLE IF NOT EXISTS `weixin_album_cate` (
  `id` smallint(4) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `img` varchar(255) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL default '255',
  `albums` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL default '1',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_album_comment`
--

DROP TABLE IF EXISTS `weixin_album_comment`;
CREATE TABLE IF NOT EXISTS `weixin_album_comment` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `album_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `info` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_album_follow`
--

DROP TABLE IF EXISTS `weixin_album_follow`;
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

DROP TABLE IF EXISTS `weixin_album_item`;
CREATE TABLE IF NOT EXISTS `weixin_album_item` (
  `album_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `intro` varchar(255) NOT NULL,
  `add_time` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`album_id`,`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_alipay`
--

DROP TABLE IF EXISTS `weixin_alipay`;
CREATE TABLE IF NOT EXISTS `weixin_alipay` (
  `id` int(11) NOT NULL auto_increment,
  `alipayname` varchar(100) character set utf8 default NULL COMMENT '支付宝名称',
  `partner` varchar(100) character set utf8 default NULL COMMENT '合作身份者id',
  `key` varchar(100) character set utf8 default NULL COMMENT '安全检验码',
  `leixing` int(2) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_article`
--

DROP TABLE IF EXISTS `weixin_article`;
CREATE TABLE IF NOT EXISTS `weixin_article` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `cate_id` smallint(4) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `colors` varchar(10) NOT NULL,
  `author` varchar(100) NOT NULL,
  `tags` varchar(100) NOT NULL,
  `img` varchar(255) NOT NULL,
  `intro` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `comments` int(10) unsigned NOT NULL default '0' COMMENT '评论数',
  `hits` int(10) unsigned NOT NULL default '0' COMMENT '浏览数',
  `ordid` tinyint(3) unsigned NOT NULL default '255' COMMENT '排序值',
  `add_time` int(10) unsigned NOT NULL default '0',
  `last_time` int(10) unsigned NOT NULL default '0',
  `status` tinyint(1) unsigned NOT NULL default '1',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_article_cate`
--

DROP TABLE IF EXISTS `weixin_article_cate`;
CREATE TABLE IF NOT EXISTS `weixin_article_cate` (
  `id` smallint(4) unsigned NOT NULL auto_increment,
  `type` tinyint(1) NOT NULL default '0',
  `name` varchar(100) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `img` varchar(255) NOT NULL,
  `pid` smallint(4) unsigned NOT NULL default '0',
  `spid` varchar(50) NOT NULL,
  `ordid` smallint(4) unsigned NOT NULL default '255',
  `status` tinyint(1) NOT NULL default '1',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_article_page`
--

DROP TABLE IF EXISTS `weixin_article_page`;
CREATE TABLE IF NOT EXISTS `weixin_article_page` (
  `cate_id` smallint(4) unsigned NOT NULL default '0',
  `title` varchar(120) NOT NULL,
  `info` text NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  `last_time` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_auto_user`
--

DROP TABLE IF EXISTS `weixin_auto_user`;
CREATE TABLE IF NOT EXISTS `weixin_auto_user` (
  `id` smallint(4) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `users` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_badword`
--

DROP TABLE IF EXISTS `weixin_badword`;
CREATE TABLE IF NOT EXISTS `weixin_badword` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `word_type` tinyint(1) unsigned NOT NULL default '1' COMMENT '1：禁用；2：替换；3：审核',
  `badword` varchar(100) NOT NULL,
  `replaceword` varchar(100) NOT NULL,
  `add_time` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_brandlist`
--

DROP TABLE IF EXISTS `weixin_brandlist`;
CREATE TABLE IF NOT EXISTS `weixin_brandlist` (
  `id` smallint(4) unsigned NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL default '1',
  `ordid` tinyint(3) unsigned NOT NULL default '255',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_custom_menu`
--

DROP TABLE IF EXISTS `weixin_custom_menu`;
CREATE TABLE IF NOT EXISTS `weixin_custom_menu` (
  `id` smallint(4) unsigned NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `tags` varchar(50) NOT NULL,
  `pid` smallint(4) unsigned NOT NULL,
  `spid` varchar(50) NOT NULL,
  `fcolor` varchar(10) NOT NULL,
  `remark` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `items` int(10) unsigned NOT NULL default '0',
  `likes` int(10) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL default '0' COMMENT '0:商品分类 1:标签分类',
  `ordid` tinyint(3) unsigned NOT NULL default '255',
  `status` tinyint(1) NOT NULL,
  `is_index` tinyint(1) NOT NULL default '0',
  `is_default` tinyint(1) unsigned NOT NULL default '0',
  `keyword` varchar(255) default NULL COMMENT '关键词',
  `key` varchar(255) default NULL COMMENT 'key值',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=382 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_delivery`
--

DROP TABLE IF EXISTS `weixin_delivery`;
CREATE TABLE IF NOT EXISTS `weixin_delivery` (
  `id` smallint(4) unsigned NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL default '1',
  `ordid` tinyint(3) unsigned NOT NULL default '255',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_flink`
--

DROP TABLE IF EXISTS `weixin_flink`;
CREATE TABLE IF NOT EXISTS `weixin_flink` (
  `id` smallint(4) unsigned NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `img` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `cate_id` smallint(5) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL default '255',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_flink_cate`
--

DROP TABLE IF EXISTS `weixin_flink_cate`;
CREATE TABLE IF NOT EXISTS `weixin_flink_cate` (
  `id` smallint(4) unsigned NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL default '255',
  `status` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_images`
--

DROP TABLE IF EXISTS `weixin_images`;
CREATE TABLE IF NOT EXISTS `weixin_images` (
  `iid` int(11) unsigned NOT NULL auto_increment,
  `imgurl` varchar(300) NOT NULL,
  PRIMARY KEY  (`iid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_ipban`
--

DROP TABLE IF EXISTS `weixin_ipban`;
CREATE TABLE IF NOT EXISTS `weixin_ipban` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `expires_time` int(10) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_item`
--

DROP TABLE IF EXISTS `weixin_item`;
CREATE TABLE IF NOT EXISTS `weixin_item` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `cate_id` smallint(4) unsigned default NULL,
  `orig_id` smallint(6) NOT NULL,
  `title` varchar(255) default NULL,
  `intro` varchar(255) NOT NULL,
  `img` varchar(255) default NULL,
  `price` decimal(10,2) default NULL,
  `rates` float(8,2) NOT NULL COMMENT '佣金比率xxx.xx%',
  `type` tinyint(1) NOT NULL default '1' COMMENT '1:商品,2:图片',
  `comments` int(10) unsigned NOT NULL default '0' COMMENT '评论数',
  `cmt_taobao_time` int(10) unsigned NOT NULL default '0',
  `add_time` int(10) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL default '255',
  `status` tinyint(1) unsigned NOT NULL default '1',
  `info` text,
  `news` tinyint(4) default '0',
  `tuijian` tinyint(4) default '0',
  `goods_stock` int(11) default '50' COMMENT '库存',
  `buy_num` int(11) default '0' COMMENT '卖出数量',
  `brand` int(11) default '1' COMMENT '品牌',
  `pingyou` decimal(10,2) default '0.00',
  `kuaidi` decimal(10,2) default '0.00',
  `ems` decimal(10,2) default '0.00',
  `free` int(11) default '1',
  `color` varchar(255) default NULL COMMENT '颜色',
  `size` varchar(255) default NULL COMMENT '尺寸',
  PRIMARY KEY  (`id`),
  KEY `cid` (`cate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=142 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_item_attr`
--

DROP TABLE IF EXISTS `weixin_item_attr`;
CREATE TABLE IF NOT EXISTS `weixin_item_attr` (
  `id` int(10) NOT NULL auto_increment,
  `item_id` int(10) NOT NULL,
  `attr_name` varchar(50) NOT NULL,
  `attr_value` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_item_cate`
--

DROP TABLE IF EXISTS `weixin_item_cate`;
CREATE TABLE IF NOT EXISTS `weixin_item_cate` (
  `id` smallint(4) unsigned NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `tags` varchar(50) NOT NULL,
  `pid` smallint(4) unsigned NOT NULL,
  `spid` varchar(50) NOT NULL,
  `img` varchar(255) NOT NULL,
  `fcolor` varchar(10) NOT NULL,
  `remark` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `items` int(10) unsigned NOT NULL default '0',
  `likes` int(10) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL default '0' COMMENT '0:商品分类 1:标签分类',
  `ordid` tinyint(3) unsigned NOT NULL default '255',
  `status` tinyint(1) NOT NULL,
  `is_index` tinyint(1) NOT NULL default '0',
  `is_default` tinyint(1) unsigned NOT NULL default '0',
  `seo_title` varchar(255) NOT NULL,
  `seo_keys` varchar(255) NOT NULL,
  `seo_desc` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=347 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_item_cate_tag`
--

DROP TABLE IF EXISTS `weixin_item_cate_tag`;
CREATE TABLE IF NOT EXISTS `weixin_item_cate_tag` (
  `cate_id` smallint(4) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `weight` tinyint(3) unsigned NOT NULL default '0',
  UNIQUE KEY `cate_id` (`cate_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_item_comment`
--

DROP TABLE IF EXISTS `weixin_item_comment`;
CREATE TABLE IF NOT EXISTS `weixin_item_comment` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `item_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `info` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_item_img`
--

DROP TABLE IF EXISTS `weixin_item_img`;
CREATE TABLE IF NOT EXISTS `weixin_item_img` (
  `id` int(11) NOT NULL auto_increment,
  `item_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `add_time` int(10) NOT NULL default '0',
  `ordid` tinyint(3) unsigned NOT NULL default '255',
  `status` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=537 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_item_like`
--

DROP TABLE IF EXISTS `weixin_item_like`;
CREATE TABLE IF NOT EXISTS `weixin_item_like` (
  `item_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `add_time` int(10) NOT NULL,
  PRIMARY KEY  (`item_id`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_item_order`
--

DROP TABLE IF EXISTS `weixin_item_order`;
CREATE TABLE IF NOT EXISTS `weixin_item_order` (
  `id` int(11) NOT NULL auto_increment,
  `orderId` varchar(50) NOT NULL COMMENT '订单号',
  `add_time` int(11) default NULL COMMENT '下单时间',
  `goods_sumPrice` decimal(10,2) NOT NULL COMMENT '商品总额',
  `order_sumPrice` decimal(10,2) NOT NULL COMMENT '订单总额',
  `note` text character set utf8 COMMENT '客服备注',
  `userId` int(11) NOT NULL COMMENT '用户ID',
  `userName` varchar(50) character set utf8 NOT NULL COMMENT '用户名',
  `address_name` varchar(255) character set utf8 default NULL COMMENT '收货人',
  `mobile` varchar(30) character set utf8 default NULL COMMENT '联系手机',
  `address` varchar(255) character set utf8 default NULL COMMENT '收货地址',
  `status` int(11) NOT NULL default '1' COMMENT '订单状态 1:待付款 2：待发货  3:待收货 4:完成 5:关闭',
  `supportmetho` tinyint(5) default NULL COMMENT '支付方式 1:支付宝 2:货到付款',
  `freetype` int(11) default NULL COMMENT '用户快递方式  1:平邮 2:快递 3:ems 0:卖家包邮',
  `freeprice` decimal(10,2) default '0.00' COMMENT '快递费用',
  `closemsg` varchar(255) character set utf8 default NULL COMMENT '关闭原因',
  `support_time` int(11) default NULL COMMENT '支付时间',
  `sellerRemark` text character set utf8 COMMENT '客服备注',
  `userfree` varchar(50) character set utf8 default '' COMMENT '给用户配送快递方式 0:无需快递',
  `freecode` varchar(100) character set utf8 default NULL COMMENT '快递编号',
  `fahuoaddress` int(11) default NULL COMMENT '发货地址',
  `fahuo_time` int(11) default NULL COMMENT '发货时间',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=63 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_item_orig`
--

DROP TABLE IF EXISTS `weixin_item_orig`;
CREATE TABLE IF NOT EXISTS `weixin_item_orig` (
  `id` int(11) NOT NULL auto_increment,
  `img` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL default '255',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_item_site`
--

DROP TABLE IF EXISTS `weixin_item_site`;
CREATE TABLE IF NOT EXISTS `weixin_item_site` (
  `id` smallint(4) unsigned NOT NULL auto_increment,
  `code` varchar(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `config` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL default '255',
  `status` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_item_tag`
--

DROP TABLE IF EXISTS `weixin_item_tag`;
CREATE TABLE IF NOT EXISTS `weixin_item_tag` (
  `item_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `item_id` (`item_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_keyword`
--

DROP TABLE IF EXISTS `weixin_keyword`;
CREATE TABLE IF NOT EXISTS `weixin_keyword` (
  `kid` int(11) unsigned NOT NULL auto_increment,
  `kename` varchar(300) default NULL,
  `kecontent` varchar(500) default NULL,
  `type` tinyint(1) NOT NULL COMMENT '1:文本 2：图文',
  `kyword` varchar(255) default NULL,
  `titles` varchar(1000) default NULL,
  `imageinfo` varchar(1000) default NULL,
  `linkinfo` varchar(1000) default NULL,
  `ismess` tinyint(1) default NULL,
  `isfollow` tinyint(1) default NULL,
  `iskey` tinyint(1) default NULL,
  PRIMARY KEY  (`kid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=107 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_mail_queue`
--

DROP TABLE IF EXISTS `weixin_mail_queue`;
CREATE TABLE IF NOT EXISTS `weixin_mail_queue` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `mail_to` varchar(120) NOT NULL,
  `mail_subject` varchar(255) NOT NULL,
  `mail_body` text NOT NULL,
  `priority` tinyint(1) unsigned NOT NULL default '1',
  `err_num` tinyint(1) unsigned NOT NULL default '0',
  `add_time` int(10) unsigned NOT NULL,
  `lock_expiry` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_menu`
--

DROP TABLE IF EXISTS `weixin_menu`;
CREATE TABLE IF NOT EXISTS `weixin_menu` (
  `id` smallint(6) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `pid` smallint(6) NOT NULL,
  `module_name` varchar(20) NOT NULL,
  `action_name` varchar(20) NOT NULL,
  `data` varchar(120) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `often` tinyint(1) NOT NULL default '0',
  `ordid` tinyint(3) unsigned NOT NULL default '255',
  `display` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=311 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_message`
--

DROP TABLE IF EXISTS `weixin_message`;
CREATE TABLE IF NOT EXISTS `weixin_message` (
  `id` int(10) NOT NULL auto_increment,
  `ftid` int(10) unsigned NOT NULL,
  `from_id` int(10) NOT NULL,
  `from_name` varchar(50) NOT NULL,
  `to_id` int(10) NOT NULL,
  `to_name` varchar(50) NOT NULL,
  `add_time` int(10) NOT NULL,
  `info` text NOT NULL,
  `status` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_message_tpl`
--

DROP TABLE IF EXISTS `weixin_message_tpl`;
CREATE TABLE IF NOT EXISTS `weixin_message_tpl` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `type` varchar(20) NOT NULL,
  `is_sys` tinyint(1) unsigned NOT NULL default '0',
  `name` varchar(50) NOT NULL,
  `alias` varchar(50) NOT NULL COMMENT '别名',
  `content` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_nav`
--

DROP TABLE IF EXISTS `weixin_nav`;
CREATE TABLE IF NOT EXISTS `weixin_nav` (
  `id` smallint(4) unsigned NOT NULL auto_increment,
  `type` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `alias` varchar(20) NOT NULL,
  `link` varchar(255) NOT NULL,
  `target` tinyint(1) NOT NULL default '1',
  `ordid` tinyint(3) unsigned NOT NULL default '255',
  `mod` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_oauth`
--

DROP TABLE IF EXISTS `weixin_oauth`;
CREATE TABLE IF NOT EXISTS `weixin_oauth` (
  `id` smallint(4) unsigned NOT NULL auto_increment,
  `code` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `config` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL default '255',
  `status` tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_order_detail`
--

DROP TABLE IF EXISTS `weixin_order_detail`;
CREATE TABLE IF NOT EXISTS `weixin_order_detail` (
  `id` int(11) NOT NULL auto_increment,
  `orderId` varchar(50) character set utf8 NOT NULL COMMENT '订单编号',
  `itemId` int(11) NOT NULL COMMENT '商品ID',
  `title` varchar(255) character set utf8 default NULL COMMENT '商品名称',
  `img` varchar(255) character set utf8 default NULL COMMENT '图片路径',
  `price` decimal(10,2) default '0.00' COMMENT '单价',
  `quantity` int(11) NOT NULL COMMENT '购买数量',
  `shuxing` varchar(125) character set utf8 NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=84 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_score_item`
--

DROP TABLE IF EXISTS `weixin_score_item`;
CREATE TABLE IF NOT EXISTS `weixin_score_item` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `cate_id` smallint(4) unsigned NOT NULL,
  `title` varchar(120) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL default '0' COMMENT '0：实物；1：虚拟',
  `img` varchar(255) NOT NULL,
  `score` int(10) unsigned NOT NULL default '0',
  `stock` mediumint(8) unsigned NOT NULL default '0',
  `user_num` mediumint(8) unsigned NOT NULL default '1',
  `buy_num` mediumint(8) NOT NULL default '0',
  `desc` text NOT NULL,
  `ordid` tinyint(3) unsigned NOT NULL default '255',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_score_item_cate`
--

DROP TABLE IF EXISTS `weixin_score_item_cate`;
CREATE TABLE IF NOT EXISTS `weixin_score_item_cate` (
  `id` smallint(4) unsigned NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL default '1',
  `ordid` tinyint(3) unsigned NOT NULL default '255',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_score_log`
--

DROP TABLE IF EXISTS `weixin_score_log`;
CREATE TABLE IF NOT EXISTS `weixin_score_log` (
  `id` int(10) NOT NULL auto_increment,
  `uid` int(10) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `score` int(10) NOT NULL,
  `add_time` int(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_score_order`
--

DROP TABLE IF EXISTS `weixin_score_order`;
CREATE TABLE IF NOT EXISTS `weixin_score_order` (
  `id` int(10) unsigned NOT NULL auto_increment,
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
  `status` tinyint(1) unsigned NOT NULL default '0',
  `add_time` int(10) unsigned NOT NULL,
  `remark` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_setting`
--

DROP TABLE IF EXISTS `weixin_setting`;
CREATE TABLE IF NOT EXISTS `weixin_setting` (
  `name` varchar(100) NOT NULL,
  `data` text NOT NULL,
  `remark` varchar(255) NOT NULL,
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_tag`
--

DROP TABLE IF EXISTS `weixin_tag`;
CREATE TABLE IF NOT EXISTS `weixin_tag` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=602 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_topic`
--

DROP TABLE IF EXISTS `weixin_topic`;
CREATE TABLE IF NOT EXISTS `weixin_topic` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `content` varchar(255) NOT NULL,
  `extra` text NOT NULL,
  `src_type` tinyint(1) unsigned NOT NULL default '0' COMMENT '引用内容类型',
  `src_id` int(10) unsigned NOT NULL COMMENT '引用内容ID',
  `type` tinyint(1) unsigned NOT NULL default '0' COMMENT '0，原创；1，转发；',
  `comments` int(10) unsigned NOT NULL default '0' COMMENT '评论数量',
  `forwards` int(10) unsigned NOT NULL default '0' COMMENT '转发数量',
  `add_time` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=106 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_topic_at`
--

DROP TABLE IF EXISTS `weixin_topic_at`;
CREATE TABLE IF NOT EXISTS `weixin_topic_at` (
  `uid` int(10) unsigned NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`uid`,`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_topic_comment`
--

DROP TABLE IF EXISTS `weixin_topic_comment`;
CREATE TABLE IF NOT EXISTS `weixin_topic_comment` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `uname` varchar(20) NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  `author_uid` int(10) unsigned NOT NULL,
  `content` varchar(255) NOT NULL,
  `add_time` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_topic_index`
--

DROP TABLE IF EXISTS `weixin_topic_index`;
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

DROP TABLE IF EXISTS `weixin_topic_relation`;
CREATE TABLE IF NOT EXISTS `weixin_topic_relation` (
  `tid` int(10) unsigned NOT NULL COMMENT '信息ID',
  `src_tid` int(10) unsigned NOT NULL COMMENT '被引用信息ID',
  `author_uid` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL default '1' COMMENT '操作类型(1,转发)',
  PRIMARY KEY  (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_user`
--

DROP TABLE IF EXISTS `weixin_user`;
CREATE TABLE IF NOT EXISTS `weixin_user` (
  `id` int(10) NOT NULL auto_increment,
  `uc_uid` int(10) unsigned NOT NULL default '0',
  `username` varchar(100) NOT NULL default '0',
  `password` varchar(32) NOT NULL default '0',
  `email` varchar(50) NOT NULL,
  `gender` tinyint(1) NOT NULL default '0' COMMENT '1男，0女',
  `tags` varchar(50) NOT NULL COMMENT '个人标签',
  `intro` varchar(500) NOT NULL,
  `byear` smallint(4) unsigned NOT NULL,
  `bmonth` tinyint(2) unsigned NOT NULL,
  `bday` tinyint(2) unsigned NOT NULL,
  `province` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `score` int(10) unsigned NOT NULL default '0',
  `score_level` int(10) unsigned NOT NULL default '0',
  `cover` varchar(255) NOT NULL,
  `reg_ip` varchar(15) NOT NULL,
  `reg_time` int(10) unsigned NOT NULL default '0',
  `last_time` int(10) unsigned NOT NULL default '0',
  `last_ip` varchar(15) default '0',
  `status` tinyint(1) NOT NULL default '1',
  `shares` int(10) unsigned default '0',
  `likes` int(10) unsigned default '0',
  `follows` int(10) unsigned default '0',
  `fans` int(10) unsigned default '0',
  `albums` int(10) unsigned default '0',
  `daren` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_user_address`
--

DROP TABLE IF EXISTS `weixin_user_address`;
CREATE TABLE IF NOT EXISTS `weixin_user_address` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL,
  `consignee` varchar(20) NOT NULL,
  `address` varchar(255) default NULL,
  `mobile` varchar(30) default NULL,
  `sheng` varchar(50) default NULL,
  `shi` varchar(50) default NULL,
  `qu` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_user_bind`
--

DROP TABLE IF EXISTS `weixin_user_bind`;
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

DROP TABLE IF EXISTS `weixin_user_follow`;
CREATE TABLE IF NOT EXISTS `weixin_user_follow` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `follow_uid` int(10) unsigned NOT NULL COMMENT '被关注者ID',
  `add_time` int(10) unsigned NOT NULL,
  `mutually` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`uid`,`follow_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_user_msgtip`
--

DROP TABLE IF EXISTS `weixin_user_msgtip`;
CREATE TABLE IF NOT EXISTS `weixin_user_msgtip` (
  `uid` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL default '0' COMMENT '1:关注，2:提到，3:私信，4:通知',
  `num` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`uid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `weixin_user_stat`
--

DROP TABLE IF EXISTS `weixin_user_stat`;
CREATE TABLE IF NOT EXISTS `weixin_user_stat` (
  `uid` int(10) unsigned NOT NULL,
  `action` varchar(20) NOT NULL,
  `num` int(10) unsigned NOT NULL,
  `last_time` int(10) unsigned NOT NULL,
  UNIQUE KEY `uid_type` (`uid`,`action`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;