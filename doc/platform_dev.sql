/*
Navicat MySQL Data Transfer

Source Server         : tykj
Source Server Version : 50720
Source Host           : 47.93.203.59:3306
Source Database       : platform_dev

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-04-23 09:01:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for news_comment
-- ----------------------------
DROP TABLE IF EXISTS `news_comment`;
CREATE TABLE `news_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `news_id` int(11) DEFAULT NULL COMMENT '新闻id',
  `comment_details` text COMMENT '评论内容',
  `comment_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '评论时间',
  `comment_uid` int(11) DEFAULT NULL COMMENT '用户id',
  `anonymity_info` tinyint(4) DEFAULT NULL COMMENT '匿名信息：1不显示用户名，0显示用户名',
  `identify` bigint(20) DEFAULT NULL COMMENT '标识索引备注',
  `sys_user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `comment_ip` varchar(255) DEFAULT NULL COMMENT '用户的ip地址(保留字段)',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `fk_message` (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='新闻评论表';

-- ----------------------------
-- Records of news_comment
-- ----------------------------
INSERT INTO `news_comment` VALUES ('1', '1', '1', null, '1', '1', '1', null, '1');
INSERT INTO `news_comment` VALUES ('2', '5', '14', null, '55', '0', '565', null, '55');
INSERT INTO `news_comment` VALUES ('3', null, '6', '1970-01-01 08:00:00', '6', '1', '1', null, '6');

-- ----------------------------
-- Table structure for news_message
-- ----------------------------
DROP TABLE IF EXISTS `news_message`;
CREATE TABLE `news_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '新闻id ',
  `title` varchar(255) DEFAULT NULL COMMENT '新闻标题',
  `details` text COMMENT '新闻内容',
  `author` varchar(255) DEFAULT NULL COMMENT '新闻作者',
  `release_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发布日期',
  `type_id` int(11) DEFAULT NULL COMMENT '类型id',
  `click_rate` bigint(20) DEFAULT NULL COMMENT '点击量',
  `show_top` tinyint(4) DEFAULT '1' COMMENT '是否头条：0否，1是',
  `show_hot` tinyint(4) DEFAULT '1' COMMENT '是否热点：0否，1是',
  `news_image_url` varchar(255) DEFAULT NULL COMMENT '新闻图片url',
  `last_comment_id` int(11) DEFAULT NULL COMMENT '最后评论者id',
  `last_comment_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '最后评论时间',
  `comment_count` bigint(20) DEFAULT NULL COMMENT '评论次数',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `update_by` varchar(255) DEFAULT NULL COMMENT '更新者',
  `identify` bigint(20) DEFAULT NULL COMMENT '标识索引备注',
  `sys_user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_message
-- ----------------------------
INSERT INTO `news_message` VALUES ('7', '2', '2', '2', '2018-01-29 15:43:04', '2', null, '1', '0', null, null, '2018-01-29 15:43:04', null, '2018-01-29 15:43:04', null, '5', '4');
INSERT INTO `news_message` VALUES ('13', '112', '测试内容', '211', '2018-01-04 00:00:00', '3', null, '1', '1', null, null, null, null, '2018-01-10 00:00:00', null, '1', '1');
INSERT INTO `news_message` VALUES ('14', '666666666666', '<p>范德萨范德萨范德萨根深蒂固</p>', '666666666666', '2018-01-29 00:00:00', '3', null, '0', '1', 'http://p2n8ypmnw.bkt.clouddn.com/20180129/1803237724edd0.jpg', null, '2018-02-02 11:00:20', null, '2018-02-02 11:00:20', null, '1', '1');
INSERT INTO `news_message` VALUES ('84', '大风大', '<p>范德萨范德萨规范的撒广东省噶啥的嘎嘎是</p>', '双方都', '2018-03-23 12:02:31', '5', null, '1', '1', 'http://p2n8ypmnw.bkt.clouddn.com/20180323/091545985eaff1.png', null, null, null, null, null, '1', '1');

-- ----------------------------
-- Table structure for news_type
-- ----------------------------
DROP TABLE IF EXISTS `news_type`;
CREATE TABLE `news_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '新闻类型id',
  `type_name` varchar(255) DEFAULT NULL COMMENT '类型名称',
  `superior_id` int(11) DEFAULT NULL COMMENT '上一级类型id',
  `tier_id` int(11) DEFAULT NULL COMMENT '层级id',
  `sort_index` tinyint(4) DEFAULT NULL COMMENT '排序索引',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `identify` bigint(20) DEFAULT NULL COMMENT '身份标识',
  `sys_user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='新闻类型表';

-- ----------------------------
-- Records of news_type
-- ----------------------------
INSERT INTO `news_type` VALUES ('2', '娱乐新闻', '1', '1', '2', '', null, null);
INSERT INTO `news_type` VALUES ('3', '体育新闻', '3', '3', '33', '3', '1', null);
INSERT INTO `news_type` VALUES ('4', '财经新闻', null, null, null, null, '1', '1');
INSERT INTO `news_type` VALUES ('5', '海外新闻', '0', null, null, null, '1', '1');

-- ----------------------------
-- Table structure for nideshop_ad
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_ad`;
CREATE TABLE `nideshop_ad` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `ad_position_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '广告类型',
  `media_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(60) DEFAULT '',
  `link` varchar(255) DEFAULT '',
  `image_url` text,
  `content` varchar(255) DEFAULT '',
  `end_time` datetime DEFAULT NULL,
  `enabled` tinyint(3) unsigned DEFAULT '1',
  `identify` bigint(20) DEFAULT NULL COMMENT '标识索引备注',
  `sys_user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`),
  KEY `position_id` (`ad_position_id`),
  KEY `enabled` (`enabled`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='广告详细细信';

-- ----------------------------
-- Records of nideshop_ad
-- ----------------------------
INSERT INTO `nideshop_ad` VALUES ('14', '2', '0', '首页轮播图1', null, 'http://p2n8ypmnw.bkt.clouddn.com/20180409/15033642a2755.jpg', null, '2018-05-30 00:00:00', '1', '5', '2');
INSERT INTO `nideshop_ad` VALUES ('9', '2', '0', 'banner2', '', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/112817489b52ab.jpg', '闪购女神焕新家', '2018-05-11 00:00:00', '1', '1', '1');
INSERT INTO `nideshop_ad` VALUES ('8', '2', '0', 'banner1', '../catalog/catalog', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/111055653a05f.jpg', 'oppor15', '2018-05-11 00:00:00', '1', '1', '1');
INSERT INTO `nideshop_ad` VALUES ('10', '2', '0', 'banner3', '', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/11314795ecb45.jpg', '冰箱洗衣机家装焕新季', '2018-05-11 00:00:00', '1', '1', '1');
INSERT INTO `nideshop_ad` VALUES ('11', '2', '0', 'banner4', '', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/11394226450c7a.jpg', '乐事大牌风暴', '2018-05-11 00:00:00', '1', '1', '1');
INSERT INTO `nideshop_ad` VALUES ('15', '2', '0', '首页轮播图3', null, 'http://p2n8ypmnw.bkt.clouddn.com/20180409/150434322acead.jpg', null, '2018-05-30 00:00:00', '1', '5', '2');
INSERT INTO `nideshop_ad` VALUES ('13', '2', '0', '首页轮播图1', '', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/145102606256aa.jpg', null, '2018-05-30 00:00:00', '1', '5', '2');
INSERT INTO `nideshop_ad` VALUES ('12', '2', '0', 'banner5', null, 'http://p2n8ypmnw.bkt.clouddn.com/20180402/114653519af4f1.jpg', '春季上新，感恩回馈', '2018-05-11 00:00:00', '1', '1', '1');
INSERT INTO `nideshop_ad` VALUES ('16', '2', '0', '首页轮播图4', null, 'http://p2n8ypmnw.bkt.clouddn.com/20180409/15051083a2211.jpg', null, '2018-05-30 00:00:00', '1', '5', '2');

-- ----------------------------
-- Table structure for nideshop_ad_position
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_ad_position`;
CREATE TABLE `nideshop_ad_position` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(60) NOT NULL DEFAULT '''' COMMENT '名称',
  `width` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '宽度',
  `height` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '高度',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `identify` bigint(20) DEFAULT NULL COMMENT '标识索引备注',
  `sys_user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='广告类型';

-- ----------------------------
-- Records of nideshop_ad_position
-- ----------------------------
INSERT INTO `nideshop_ad_position` VALUES ('2', '首页轮播图', '200', '760', '小程序首页轮播广告位。', '1', '1');
INSERT INTO `nideshop_ad_position` VALUES ('5', '首页轮播图', '200', '750', '首页轮播图', '5', '2');

-- ----------------------------
-- Table structure for nideshop_address
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_address`;
CREATE TABLE `nideshop_address` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned DEFAULT '0' COMMENT '会员ID',
  `user_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '收货人姓名',
  `tel_number` varchar(60) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '手机',
  `postal_Code` varchar(50) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '邮编',
  `national_Code` varchar(50) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '收货地址国家码',
  `province_Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '省',
  `city_Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '市',
  `county_Name` varchar(50) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '区',
  `detail_Info` varchar(120) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '详细收货地址信息',
  `is_default` int(8) DEFAULT NULL,
  `identify` bigint(20) DEFAULT NULL COMMENT '标识索引备注',
  `sys_user_id` bigint(20) DEFAULT NULL COMMENT '后台用户ID',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of nideshop_address
-- ----------------------------
INSERT INTO `nideshop_address` VALUES ('4', '36', '孙雪明', '18888888888', '201100', null, '上海市', '闵行区', '', '中春路明谷科技园', '1', '1', '1');
INSERT INTO `nideshop_address` VALUES ('5', '35', 'zcl', '18999999999', '000000', null, '上海市', '闵行区', '', '中春路地铁站2号口', '1', '1', null);
INSERT INTO `nideshop_address` VALUES ('6', '35', '1111zcl', '12345678952', '000000', null, '北京市', '朝阳区', '', 'wsdsdqwdq', '0', '1', null);
INSERT INTO `nideshop_address` VALUES ('8', '37', '1111', '17601232521', '20000', null, '山西省', '阳泉市', '郊区', '11111', '1', '1', null);
INSERT INTO `nideshop_address` VALUES ('9', '40', '11', '17601232521', '2222', null, '北京市', '东城区', '', '222', '1', '1', null);

-- ----------------------------
-- Table structure for nideshop_attribute
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_attribute`;
CREATE TABLE `nideshop_attribute` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `attribute_category_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品类型',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '属性名称',
  `input_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '当添加商品时,该属性的添加类别; 0为手功输入;1为选择输入;2为多行文本输入',
  `value` text NOT NULL COMMENT '即选择输入,则attr_name对应的值的取值就是该这字段值 ',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cat_id` (`attribute_category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for nideshop_attribute_category
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_attribute_category`;
CREATE TABLE `nideshop_attribute_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(60) NOT NULL DEFAULT '',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1开启; 0关闭;',
  `identify` bigint(20) DEFAULT NULL COMMENT '标识索引备注',
  `sys_user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1036010 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_attribute_category
-- ----------------------------
INSERT INTO `nideshop_attribute_category` VALUES ('1036003', '毛衣', '1', null, null);
INSERT INTO `nideshop_attribute_category` VALUES ('1036004', '上衣', '1', null, null);
INSERT INTO `nideshop_attribute_category` VALUES ('1036005', '裤', '1', null, null);
INSERT INTO `nideshop_attribute_category` VALUES ('1036006', '鞋', '1', null, null);
INSERT INTO `nideshop_attribute_category` VALUES ('1036007', '夹克', '1', null, null);
INSERT INTO `nideshop_attribute_category` VALUES ('1036008', '家电', '1', '1', '6');
INSERT INTO `nideshop_attribute_category` VALUES ('1036009', '服装', '1', '5', '2');

-- ----------------------------
-- Table structure for nideshop_brand
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_brand`;
CREATE TABLE `nideshop_brand` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌名称',
  `list_pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `simple_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50' COMMENT '排序',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '显示',
  `floor_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `app_list_pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT 'app显示图片',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '新品牌',
  `new_pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `new_sort_order` tinyint(2) unsigned NOT NULL DEFAULT '10' COMMENT '排序',
  `identify` bigint(20) DEFAULT NULL COMMENT '标识索引备注',
  `sys_user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`),
  KEY `is_show` (`is_show`)
) ENGINE=MyISAM AUTO_INCREMENT=1046017 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_brand
-- ----------------------------
INSERT INTO `nideshop_brand` VALUES ('1046013', 'DEMO', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/105837216cfd32.png', 'DEMO', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1058598223cca4.png', '0', '1', '11.00', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/105944890a2e56.png', '1', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/105916263db184.png', '11', '1', '1');
INSERT INTO `nideshop_brand` VALUES ('1046014', '潮衣库', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/093438818ce10d.jpg', '潮衣库', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/093452359d29c7.jpg', '2', '1', '100.00', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/093502187ff8cb.jpg', '1', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/0935101364850c.jpg', '2', '1', '1');
INSERT INTO `nideshop_brand` VALUES ('1046015', '小米', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/15211763917493.png', '小米，为发烧而生。', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/152133898478a9.png', '0', '1', '9.00', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1522084274efc7.png', '0', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/152213578561f5.png', '2', '1', '6');
INSERT INTO `nideshop_brand` VALUES ('1046016', 'H&amp;M', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/17335111679e88.png', 'H&amp;M品牌名是由“Hennes”女装与“Mauritz”男装品牌合并，各取第一个字母而成“H&amp;M”。', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1735114539c02b.png', '0', '1', '111.00', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/173526685b7095.png', '1', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/17353153585723.png', '1', '5', '2');

-- ----------------------------
-- Table structure for nideshop_cart
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_cart`;
CREATE TABLE `nideshop_cart` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员Id',
  `session_id` char(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'sessionId',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品Id',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品序列号',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '产品Id',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '产品名称',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `retail_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '零售价格',
  `number` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '数量',
  `goods_specifition_name_value` text COMMENT '规格属性组成的字符串，用来显示用',
  `goods_specifition_ids` varchar(60) DEFAULT '' COMMENT 'product表对应的goods_specifition_ids',
  `checked` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `list_pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`)
) ENGINE=MyISAM AUTO_INCREMENT=288 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_cart
-- ----------------------------

-- ----------------------------
-- Table structure for nideshop_category
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_category`;
CREATE TABLE `nideshop_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(90) NOT NULL DEFAULT '',
  `keywords` varchar(255) DEFAULT '',
  `front_desc` varchar(255) DEFAULT '',
  `parent_id` int(11) unsigned zerofill DEFAULT '00000000000',
  `sort_order` tinyint(1) unsigned DEFAULT '50',
  `show_index` tinyint(1) DEFAULT '0',
  `is_show` tinyint(1) unsigned DEFAULT '1',
  `banner_url` varchar(255) DEFAULT '',
  `icon_url` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `wap_banner_url` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `front_name` varchar(255) DEFAULT NULL,
  `identify` bigint(20) DEFAULT NULL COMMENT '标识索引备注(部门权限ID)',
  `sys_user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1036045 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_category
-- ----------------------------
INSERT INTO `nideshop_category` VALUES ('1036016', '男装', null, null, '00000000000', '1', null, '1', '', '', '', '', 'L1', '0', null, '1', null);
INSERT INTO `nideshop_category` VALUES ('1036018', '时尚羽绒', null, null, '00001036016', '3', null, '1', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/181528166dbd38.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/1813388598e641.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/1815591683787b.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/1819023354d59b.jpg', 'L2', '0', null, '1', null);
INSERT INTO `nideshop_category` VALUES ('1036021', '女装', null, null, '00000000000', '2', null, '1', '', '', '', '', 'L1', '0', null, '1', null);
INSERT INTO `nideshop_category` VALUES ('1036022', '修身夹克', null, null, '00001036016', '4', null, '1', '', '', '', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/182640440d49c.jpg', 'L2', '0', null, '1', null);
INSERT INTO `nideshop_category` VALUES ('1036023', '外套', null, null, '00001036021', null, null, '1', '', '', '', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/1828207eb914.jpg', 'L2', '0', null, '1', null);
INSERT INTO `nideshop_category` VALUES ('1036024', '连衣裙', null, null, '00001036021', null, null, '1', '', '', '', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/1835207597a543.jpg', 'L2', '0', null, '1', null);
INSERT INTO `nideshop_category` VALUES ('1036025', '毛衣', null, null, '00001036021', null, null, '1', '', '', '', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/183120171e91d3.jpg', 'L2', '0', null, '1', null);
INSERT INTO `nideshop_category` VALUES ('1036028', '衬衫', '衬衫', '衬衫', '00001036016', '2', null, '1', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/093728739e6444.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/093732518047bf.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/093736860bd492.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/09374034650c7.jpg', 'L2', '0', null, '1', '1');
INSERT INTO `nideshop_category` VALUES ('1036029', '西裤', '西裤', '西裤', '00001036016', '3', '3', '1', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/100920613d6be3.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/100929615933b1.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/10093623086c32.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1009395953559d.jpg', 'L2', '0', null, '1', '1');
INSERT INTO `nideshop_category` VALUES ('1036030', 'T恤', 'T恤', 'T恤', '00001036016', '4', '3', '1', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1011007224e69d.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/101103746b0cc5.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/101108247df438.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1011119087a8c2.jpg', 'L2', '0', null, '1', '1');
INSERT INTO `nideshop_category` VALUES ('1036031', '鞋', '小白鞋', '小白鞋', '00001036016', '5', '4', '1', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/101200566fb63c.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/101203115d9fc2.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/10120623236330.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1012095811626b.jpg', 'L2', '0', null, '1', '1');
INSERT INTO `nideshop_category` VALUES ('1036032', '家电', '家用电器', '家用电器', '00000000000', null, null, '1', '', '', '', '', 'L1', '0', null, '1', '6');
INSERT INTO `nideshop_category` VALUES ('1036033', '电视', '电视 数字电视', '电视 数字电视', '00001036032', null, null, '1', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/15093747156006.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/15094250014cf8.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/15094646443739.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1509525136cf39.jpg', 'L2', '0', null, '1', '6');
INSERT INTO `nideshop_category` VALUES ('1036034', '手机', '手机 电话', '手机电话', '00001036032', '2', '2', '1', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1515451677397.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/15154876926aea.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/151551526b1b9b.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/151555190311de.jpg', 'L2', '0', null, '1', '6');
INSERT INTO `nideshop_category` VALUES ('1036035', '洗衣机', '洗衣机', '洗衣机', '00001036032', '3', '3', '1', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1516344102f76a.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/15163775809a11.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/15164169696497.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/151644610efea8.jpg', 'L2', '0', null, '1', '6');
INSERT INTO `nideshop_category` VALUES ('1036036', '冰箱', '冰箱', '冰箱', '00001036032', '4', '4', '1', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/151719851ba2f1.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/15172453316372.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/15173347324f17.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/15173722abb21.jpg', 'L2', '0', null, '1', '6');
INSERT INTO `nideshop_category` VALUES ('1036037', '男装', '男装', '男装', '00000000000', null, null, '1', '', '', '', '', 'L1', '0', null, '5', '2');
INSERT INTO `nideshop_category` VALUES ('1036038', '女装', '女装', '女装', '00000000000', '2', '2', '1', '', '', '', '', 'L1', '0', null, '5', '2');
INSERT INTO `nideshop_category` VALUES ('1036039', '夹克', '夹克', '夹克', '00001036037', null, null, '1', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/17230721285c9e.png', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/172311997fa104.png', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/17231520208252.png', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/172320285fc561.png', 'L2', '0', null, '5', '2');
INSERT INTO `nideshop_category` VALUES ('1036040', '运动', '运动', '运动', '00001036037', '2', '2', '1', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1725084907e4bd.png', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/17251338afedc.png', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/17251749b2789.png', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/17252063645c4d.png', 'L2', '0', null, '5', '2');
INSERT INTO `nideshop_category` VALUES ('1036041', '钟表', '钟表', '钟表', '00001036037', '3', '3', '1', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/172638376b0b74.png', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1726419335036e.png', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/172645124de294.png', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/172647906c5337.png', 'L2', '0', null, '5', '2');
INSERT INTO `nideshop_category` VALUES ('1036042', '风衣', '风衣', '风衣', '00001036038', null, null, '1', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1728173235f9a6.png', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/172820809d80b3.png', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1728245507aed3.png', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/172827853591cf.png', 'L2', '0', null, '5', '2');
INSERT INTO `nideshop_category` VALUES ('1036043', '女鞋', '女鞋', '女鞋', '00001036038', '2', '2', '1', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/172917924efaeb.png', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/17292319823617.png', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/172933781547ac.png', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/172942681acb9c.png', 'L2', '0', null, '5', '2');
INSERT INTO `nideshop_category` VALUES ('1036044', '珠宝首饰', '珠宝首饰', '珠宝首饰', '00001036038', '3', '3', '1', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1730146610222e.png', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/17301770574dbc.png', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/173023748e90e8.png', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1730271045c78.png', 'L2', '0', null, '5', '2');

-- ----------------------------
-- Table structure for nideshop_channel
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_channel`;
CREATE TABLE `nideshop_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `icon_url` varchar(255) NOT NULL DEFAULT '',
  `sort_order` int(4) unsigned NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_channel
-- ----------------------------

-- ----------------------------
-- Table structure for nideshop_collect
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_collect`;
CREATE TABLE `nideshop_collect` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户Id',
  `value_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '产品Id',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_attention` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否提醒',
  `type_id` int(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`value_id`),
  KEY `is_attention` (`is_attention`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_collect
-- ----------------------------
INSERT INTO `nideshop_collect` VALUES ('76', '27', '2', '1516156748', '0', '0');
INSERT INTO `nideshop_collect` VALUES ('77', '26', '4', '1516165801', '0', '0');
INSERT INTO `nideshop_collect` VALUES ('78', '27', '4', '1516165840', '0', '0');
INSERT INTO `nideshop_collect` VALUES ('79', '27', '3', '1516165868', '0', '0');
INSERT INTO `nideshop_collect` VALUES ('81', '35', '10', '1522656993', '0', '0');
INSERT INTO `nideshop_collect` VALUES ('84', '35', '12', '1522657021', '0', '0');
INSERT INTO `nideshop_collect` VALUES ('86', '35', '20', '1523253805', '0', '0');

-- ----------------------------
-- Table structure for nideshop_comment
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_comment`;
CREATE TABLE `nideshop_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `value_id` int(11) DEFAULT '0',
  `content` varchar(6550) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '储存为base64编码',
  `add_time` bigint(12) unsigned DEFAULT '0' COMMENT '记录时间',
  `status` tinyint(3) unsigned DEFAULT '0' COMMENT '状态',
  `user_id` int(11) DEFAULT '0' COMMENT '会员Id',
  PRIMARY KEY (`id`),
  KEY `id_value` (`value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of nideshop_comment
-- ----------------------------

-- ----------------------------
-- Table structure for nideshop_comment_picture
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_comment_picture`;
CREATE TABLE `nideshop_comment_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `comment_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评价Id',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '评价图片',
  `sort_order` tinyint(1) unsigned NOT NULL DEFAULT '5' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_comment_picture
-- ----------------------------

-- ----------------------------
-- Table structure for nideshop_coupon
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_coupon`;
CREATE TABLE `nideshop_coupon` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT '',
  `type_money` decimal(10,2) DEFAULT '0.00',
  `send_type` tinyint(3) unsigned DEFAULT '0',
  `min_amount` decimal(10,2) unsigned DEFAULT '0.00',
  `max_amount` decimal(10,2) unsigned DEFAULT '0.00',
  `send_start_date` datetime DEFAULT NULL,
  `send_end_date` datetime DEFAULT NULL,
  `use_start_date` datetime DEFAULT NULL,
  `use_end_date` datetime DEFAULT NULL,
  `min_goods_amount` decimal(10,2) unsigned DEFAULT '0.00',
  `min_transmit_num` int(4) DEFAULT NULL COMMENT '转发次数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for nideshop_coupon_goods
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_coupon_goods`;
CREATE TABLE `nideshop_coupon_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `coupon_id` int(11) NOT NULL COMMENT '优惠券Id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='优惠券关联商品';

-- ----------------------------
-- Records of nideshop_coupon_goods
-- ----------------------------

-- ----------------------------
-- Table structure for nideshop_feedback
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_feedback`;
CREATE TABLE `nideshop_feedback` (
  `msg_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员Id',
  `user_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '会员会员名称',
  `mobile` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '手机',
  `feed_Type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '反馈类型',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '详细内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `add_time` datetime DEFAULT NULL COMMENT '反馈时间',
  PRIMARY KEY (`msg_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of nideshop_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for nideshop_footprint
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_footprint`;
CREATE TABLE `nideshop_footprint` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '会员Id',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '记录时间',
  `referrer` int(11) DEFAULT NULL COMMENT '转发人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=342 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_footprint
-- ----------------------------
INSERT INTO `nideshop_footprint` VALUES ('5', '27', '2', '1516152641', '0');
INSERT INTO `nideshop_footprint` VALUES ('6', '27', '1', '1516152683', '0');
INSERT INTO `nideshop_footprint` VALUES ('7', '27', '2', '1516152721', '0');
INSERT INTO `nideshop_footprint` VALUES ('8', '27', '1', '1516152838', '0');
INSERT INTO `nideshop_footprint` VALUES ('9', '27', '2', '1516154050', '0');
INSERT INTO `nideshop_footprint` VALUES ('10', '27', '2', '1516154069', '0');
INSERT INTO `nideshop_footprint` VALUES ('11', '27', '7', '1516154411', '0');
INSERT INTO `nideshop_footprint` VALUES ('12', '27', '2', '1516154594', '0');
INSERT INTO `nideshop_footprint` VALUES ('13', '27', '2', '1516154614', '0');
INSERT INTO `nideshop_footprint` VALUES ('14', '27', '2', '1516154915', '0');
INSERT INTO `nideshop_footprint` VALUES ('15', '27', '2', '1516155049', '0');
INSERT INTO `nideshop_footprint` VALUES ('16', '27', '2', '1516156112', '0');
INSERT INTO `nideshop_footprint` VALUES ('17', '27', '2', '1516156135', '0');
INSERT INTO `nideshop_footprint` VALUES ('18', '27', '2', '1516156459', '0');
INSERT INTO `nideshop_footprint` VALUES ('19', '27', '2', '1516156513', '0');
INSERT INTO `nideshop_footprint` VALUES ('20', '27', '2', '1516156574', '0');
INSERT INTO `nideshop_footprint` VALUES ('21', '27', '2', '1516156584', '0');
INSERT INTO `nideshop_footprint` VALUES ('22', '27', '2', '1516156653', '0');
INSERT INTO `nideshop_footprint` VALUES ('23', '27', '2', '1516156674', '0');
INSERT INTO `nideshop_footprint` VALUES ('24', '27', '2', '1516156689', '0');
INSERT INTO `nideshop_footprint` VALUES ('25', '27', '2', '1516156737', '0');
INSERT INTO `nideshop_footprint` VALUES ('26', '27', '2', '1516156758', '0');
INSERT INTO `nideshop_footprint` VALUES ('27', '26', '2', '1516157682', '0');
INSERT INTO `nideshop_footprint` VALUES ('28', '27', '3', '1516158120', '0');
INSERT INTO `nideshop_footprint` VALUES ('29', '27', '2', '1516158129', '0');
INSERT INTO `nideshop_footprint` VALUES ('30', '27', '3', '1516158131', '0');
INSERT INTO `nideshop_footprint` VALUES ('31', '27', '2', '1516158148', '0');
INSERT INTO `nideshop_footprint` VALUES ('32', '27', '3', '1516158151', '0');
INSERT INTO `nideshop_footprint` VALUES ('33', '27', '3', '1516158154', '0');
INSERT INTO `nideshop_footprint` VALUES ('34', '27', '3', '1516158168', '0');
INSERT INTO `nideshop_footprint` VALUES ('35', '27', '3', '1516158180', '0');
INSERT INTO `nideshop_footprint` VALUES ('36', '27', '2', '1516158182', '0');
INSERT INTO `nideshop_footprint` VALUES ('37', '27', '2', '1516158192', '0');
INSERT INTO `nideshop_footprint` VALUES ('38', '27', '2', '1516158322', '0');
INSERT INTO `nideshop_footprint` VALUES ('39', '27', '3', '1516158721', '0');
INSERT INTO `nideshop_footprint` VALUES ('40', '27', '2', '1516158728', '0');
INSERT INTO `nideshop_footprint` VALUES ('41', '26', '3', '1516159297', '0');
INSERT INTO `nideshop_footprint` VALUES ('42', '27', '3', '1516159591', '0');
INSERT INTO `nideshop_footprint` VALUES ('43', '27', '4', '1516159856', '0');
INSERT INTO `nideshop_footprint` VALUES ('44', '27', '3', '1516159874', '0');
INSERT INTO `nideshop_footprint` VALUES ('45', '27', '6', '1516160143', '0');
INSERT INTO `nideshop_footprint` VALUES ('46', '27', '3', '1516160154', '0');
INSERT INTO `nideshop_footprint` VALUES ('47', '27', '2', '1516160163', '0');
INSERT INTO `nideshop_footprint` VALUES ('48', '27', '5', '1516160175', '0');
INSERT INTO `nideshop_footprint` VALUES ('49', '26', '3', '1516160254', '0');
INSERT INTO `nideshop_footprint` VALUES ('50', '26', '4', '1516160469', '0');
INSERT INTO `nideshop_footprint` VALUES ('51', '27', '6', '1516165579', '0');
INSERT INTO `nideshop_footprint` VALUES ('52', '26', '4', '1516165800', '0');
INSERT INTO `nideshop_footprint` VALUES ('53', '27', '5', '1516165839', '0');
INSERT INTO `nideshop_footprint` VALUES ('54', '27', '4', '1516165847', '0');
INSERT INTO `nideshop_footprint` VALUES ('55', '27', '3', '1516165866', '0');
INSERT INTO `nideshop_footprint` VALUES ('56', '27', '2', '1516165870', '0');
INSERT INTO `nideshop_footprint` VALUES ('57', '27', '2', '1516166026', '0');
INSERT INTO `nideshop_footprint` VALUES ('58', '27', '3', '1516170689', '0');
INSERT INTO `nideshop_footprint` VALUES ('59', '26', '4', '1516182117', '0');
INSERT INTO `nideshop_footprint` VALUES ('60', '26', '4', '1516182197', '0');
INSERT INTO `nideshop_footprint` VALUES ('61', '26', '3', '1516182203', '0');
INSERT INTO `nideshop_footprint` VALUES ('62', '26', '2', '1516182932', '0');
INSERT INTO `nideshop_footprint` VALUES ('63', '26', '2', '1516182969', '0');
INSERT INTO `nideshop_footprint` VALUES ('64', '26', '2', '1516183317', '0');
INSERT INTO `nideshop_footprint` VALUES ('65', '27', '4', '1516183348', '0');
INSERT INTO `nideshop_footprint` VALUES ('66', '27', '3', '1516183360', '0');
INSERT INTO `nideshop_footprint` VALUES ('67', '28', '2', '1522120365', '0');
INSERT INTO `nideshop_footprint` VALUES ('68', '28', '2', '1522121727', '0');
INSERT INTO `nideshop_footprint` VALUES ('69', '28', '6', '1522121739', '0');
INSERT INTO `nideshop_footprint` VALUES ('70', '30', '2', '1522127801', '0');
INSERT INTO `nideshop_footprint` VALUES ('71', '35', '2', '1522128811', '0');
INSERT INTO `nideshop_footprint` VALUES ('72', '35', '2', '1522129293', '0');
INSERT INTO `nideshop_footprint` VALUES ('73', '35', '2', '1522129553', '0');
INSERT INTO `nideshop_footprint` VALUES ('74', '35', '2', '1522129993', '0');
INSERT INTO `nideshop_footprint` VALUES ('75', '35', '2', '1522132197', '0');
INSERT INTO `nideshop_footprint` VALUES ('76', '35', '2', '1522135273', '0');
INSERT INTO `nideshop_footprint` VALUES ('77', '35', '4', '1522135333', '0');
INSERT INTO `nideshop_footprint` VALUES ('78', '35', '2', '1522137320', '0');
INSERT INTO `nideshop_footprint` VALUES ('79', '35', '6', '1522137430', '0');
INSERT INTO `nideshop_footprint` VALUES ('80', '35', '2', '1522138422', '0');
INSERT INTO `nideshop_footprint` VALUES ('81', '35', '5', '1522138451', '0');
INSERT INTO `nideshop_footprint` VALUES ('82', '35', '2', '1522138516', '0');
INSERT INTO `nideshop_footprint` VALUES ('83', '35', '6', '1522138523', '0');
INSERT INTO `nideshop_footprint` VALUES ('84', '35', '6', '1522139030', '0');
INSERT INTO `nideshop_footprint` VALUES ('85', '35', '2', '1522139724', '0');
INSERT INTO `nideshop_footprint` VALUES ('86', '35', '5', '1522139731', '0');
INSERT INTO `nideshop_footprint` VALUES ('87', '35', '6', '1522139750', '0');
INSERT INTO `nideshop_footprint` VALUES ('88', '35', '4', '1522146724', '0');
INSERT INTO `nideshop_footprint` VALUES ('89', '35', '2', '1522202724', '0');
INSERT INTO `nideshop_footprint` VALUES ('90', '35', '5', '1522218261', '0');
INSERT INTO `nideshop_footprint` VALUES ('91', '35', '2', '1522220919', '0');
INSERT INTO `nideshop_footprint` VALUES ('92', '35', '6', '1522220927', '0');
INSERT INTO `nideshop_footprint` VALUES ('93', '35', '6', '1522464873', '0');
INSERT INTO `nideshop_footprint` VALUES ('94', '35', '6', '1522465201', '0');
INSERT INTO `nideshop_footprint` VALUES ('95', '35', '6', '1522465291', '0');
INSERT INTO `nideshop_footprint` VALUES ('96', '35', '6', '1522465502', '0');
INSERT INTO `nideshop_footprint` VALUES ('97', '35', '6', '1522466088', '0');
INSERT INTO `nideshop_footprint` VALUES ('98', '35', '6', '1522466875', '0');
INSERT INTO `nideshop_footprint` VALUES ('99', '35', '6', '1522483796', '0');
INSERT INTO `nideshop_footprint` VALUES ('100', '35', '5', '1522484970', '0');
INSERT INTO `nideshop_footprint` VALUES ('101', '35', '6', '1522484989', '0');
INSERT INTO `nideshop_footprint` VALUES ('102', '35', '6', '1522485960', '0');
INSERT INTO `nideshop_footprint` VALUES ('103', '35', '6', '1522485974', '0');
INSERT INTO `nideshop_footprint` VALUES ('104', '35', '3', '1522487058', '0');
INSERT INTO `nideshop_footprint` VALUES ('105', '35', '3', '1522487704', '0');
INSERT INTO `nideshop_footprint` VALUES ('106', '35', '5', '1522491932', '0');
INSERT INTO `nideshop_footprint` VALUES ('107', '35', '2', '1522635218', '0');
INSERT INTO `nideshop_footprint` VALUES ('108', '35', '6', '1522635645', '0');
INSERT INTO `nideshop_footprint` VALUES ('109', '35', '6', '1522636196', '0');
INSERT INTO `nideshop_footprint` VALUES ('110', '35', '10', '1522637311', '0');
INSERT INTO `nideshop_footprint` VALUES ('111', '35', '10', '1522637377', '0');
INSERT INTO `nideshop_footprint` VALUES ('112', '35', '10', '1522637385', '0');
INSERT INTO `nideshop_footprint` VALUES ('113', '35', '10', '1522637490', '0');
INSERT INTO `nideshop_footprint` VALUES ('114', '35', '10', '1522637512', '0');
INSERT INTO `nideshop_footprint` VALUES ('115', '35', '11', '1522638484', '0');
INSERT INTO `nideshop_footprint` VALUES ('116', '35', '11', '1522638711', '0');
INSERT INTO `nideshop_footprint` VALUES ('117', '35', '11', '1522638725', '0');
INSERT INTO `nideshop_footprint` VALUES ('118', '35', '11', '1522638764', '0');
INSERT INTO `nideshop_footprint` VALUES ('119', '35', '11', '1522639225', '0');
INSERT INTO `nideshop_footprint` VALUES ('120', '35', '10', '1522639951', '0');
INSERT INTO `nideshop_footprint` VALUES ('121', '35', '11', '1522641578', '0');
INSERT INTO `nideshop_footprint` VALUES ('122', '35', '10', '1522641585', '0');
INSERT INTO `nideshop_footprint` VALUES ('123', '36', '12', '1522645282', '0');
INSERT INTO `nideshop_footprint` VALUES ('124', '35', '12', '1522645494', '0');
INSERT INTO `nideshop_footprint` VALUES ('125', '35', '12', '1522645528', '0');
INSERT INTO `nideshop_footprint` VALUES ('126', '36', '11', '1522645564', '0');
INSERT INTO `nideshop_footprint` VALUES ('127', '36', '11', '1522645565', '0');
INSERT INTO `nideshop_footprint` VALUES ('128', '36', '11', '1522645596', '0');
INSERT INTO `nideshop_footprint` VALUES ('129', '36', '11', '1522645620', '0');
INSERT INTO `nideshop_footprint` VALUES ('130', '36', '12', '1522646642', '0');
INSERT INTO `nideshop_footprint` VALUES ('131', '36', '11', '1522646695', '0');
INSERT INTO `nideshop_footprint` VALUES ('132', '35', '13', '1522647573', '0');
INSERT INTO `nideshop_footprint` VALUES ('133', '35', '12', '1522647609', '0');
INSERT INTO `nideshop_footprint` VALUES ('134', '36', '13', '1522647719', '0');
INSERT INTO `nideshop_footprint` VALUES ('135', '36', '13', '1522648021', '0');
INSERT INTO `nideshop_footprint` VALUES ('136', '36', '13', '1522648039', '0');
INSERT INTO `nideshop_footprint` VALUES ('137', '36', '14', '1522648045', '0');
INSERT INTO `nideshop_footprint` VALUES ('138', '36', '14', '1522648806', '0');
INSERT INTO `nideshop_footprint` VALUES ('139', '36', '13', '1522648814', '0');
INSERT INTO `nideshop_footprint` VALUES ('140', '35', '14', '1522648893', '0');
INSERT INTO `nideshop_footprint` VALUES ('141', '36', '14', '1522648899', '0');
INSERT INTO `nideshop_footprint` VALUES ('142', '36', '13', '1522649550', '0');
INSERT INTO `nideshop_footprint` VALUES ('143', '35', '13', '1522649673', '0');
INSERT INTO `nideshop_footprint` VALUES ('144', '35', '14', '1522649677', '0');
INSERT INTO `nideshop_footprint` VALUES ('145', '36', '13', '1522649700', '0');
INSERT INTO `nideshop_footprint` VALUES ('146', '36', '13', '1522650124', '0');
INSERT INTO `nideshop_footprint` VALUES ('147', '36', '13', '1522651152', '0');
INSERT INTO `nideshop_footprint` VALUES ('148', '36', '13', '1522651511', '0');
INSERT INTO `nideshop_footprint` VALUES ('149', '35', '13', '1522651797', '0');
INSERT INTO `nideshop_footprint` VALUES ('150', '35', '11', '1522651802', '0');
INSERT INTO `nideshop_footprint` VALUES ('151', '35', '13', '1522651881', '0');
INSERT INTO `nideshop_footprint` VALUES ('152', '35', '11', '1522651893', '0');
INSERT INTO `nideshop_footprint` VALUES ('153', '35', '12', '1522651900', '0');
INSERT INTO `nideshop_footprint` VALUES ('154', '35', '10', '1522651955', '0');
INSERT INTO `nideshop_footprint` VALUES ('155', '36', '10', '1522651999', '0');
INSERT INTO `nideshop_footprint` VALUES ('156', '36', '10', '1522652182', '0');
INSERT INTO `nideshop_footprint` VALUES ('157', '36', '10', '1522652218', '0');
INSERT INTO `nideshop_footprint` VALUES ('158', '36', '10', '1522652242', '0');
INSERT INTO `nideshop_footprint` VALUES ('159', '36', '10', '1522652472', '0');
INSERT INTO `nideshop_footprint` VALUES ('160', '36', '10', '1522652578', '0');
INSERT INTO `nideshop_footprint` VALUES ('161', '35', '14', '1522653774', '0');
INSERT INTO `nideshop_footprint` VALUES ('162', '35', '12', '1522654861', '0');
INSERT INTO `nideshop_footprint` VALUES ('163', '35', '10', '1522655021', '0');
INSERT INTO `nideshop_footprint` VALUES ('164', '35', '10', '1522655171', '0');
INSERT INTO `nideshop_footprint` VALUES ('165', '35', '14', '1522656268', '0');
INSERT INTO `nideshop_footprint` VALUES ('166', '35', '10', '1522656864', '0');
INSERT INTO `nideshop_footprint` VALUES ('167', '35', '10', '1522656885', '0');
INSERT INTO `nideshop_footprint` VALUES ('168', '35', '10', '1522656991', '0');
INSERT INTO `nideshop_footprint` VALUES ('169', '35', '12', '1522657000', '0');
INSERT INTO `nideshop_footprint` VALUES ('170', '36', '10', '1522661915', '0');
INSERT INTO `nideshop_footprint` VALUES ('171', '35', '14', '1522664500', '0');
INSERT INTO `nideshop_footprint` VALUES ('172', '35', '14', '1522664538', '0');
INSERT INTO `nideshop_footprint` VALUES ('173', '36', '14', '1522664606', '0');
INSERT INTO `nideshop_footprint` VALUES ('174', '36', '14', '1522665070', '0');
INSERT INTO `nideshop_footprint` VALUES ('175', '36', '13', '1522665083', '0');
INSERT INTO `nideshop_footprint` VALUES ('176', '36', '12', '1522665096', '0');
INSERT INTO `nideshop_footprint` VALUES ('177', '36', '10', '1522665517', '0');
INSERT INTO `nideshop_footprint` VALUES ('178', '36', '14', '1522665529', '0');
INSERT INTO `nideshop_footprint` VALUES ('179', '36', '13', '1522718759', '0');
INSERT INTO `nideshop_footprint` VALUES ('180', '36', '14', '1522718764', '0');
INSERT INTO `nideshop_footprint` VALUES ('181', '35', '14', '1522719135', '0');
INSERT INTO `nideshop_footprint` VALUES ('182', '36', '14', '1522722102', '0');
INSERT INTO `nideshop_footprint` VALUES ('183', '36', '13', '1522722134', '0');
INSERT INTO `nideshop_footprint` VALUES ('184', '35', '13', '1522737175', '0');
INSERT INTO `nideshop_footprint` VALUES ('185', '35', '12', '1522743370', '0');
INSERT INTO `nideshop_footprint` VALUES ('186', '35', '14', '1522743458', '0');
INSERT INTO `nideshop_footprint` VALUES ('187', '35', '14', '1522743501', '0');
INSERT INTO `nideshop_footprint` VALUES ('188', '35', '12', '1522747043', '0');
INSERT INTO `nideshop_footprint` VALUES ('189', '35', '12', '1522747049', '0');
INSERT INTO `nideshop_footprint` VALUES ('190', '35', '11', '1522747057', '0');
INSERT INTO `nideshop_footprint` VALUES ('191', '36', '14', '1522747999', '0');
INSERT INTO `nideshop_footprint` VALUES ('192', '36', '13', '1522748103', '0');
INSERT INTO `nideshop_footprint` VALUES ('193', '36', '12', '1522748108', '0');
INSERT INTO `nideshop_footprint` VALUES ('194', '36', '14', '1522750409', '0');
INSERT INTO `nideshop_footprint` VALUES ('195', '36', '11', '1522750423', '0');
INSERT INTO `nideshop_footprint` VALUES ('196', '36', '13', '1522751177', '0');
INSERT INTO `nideshop_footprint` VALUES ('197', '36', '12', '1522751188', '0');
INSERT INTO `nideshop_footprint` VALUES ('198', '36', '13', '1522804541', '0');
INSERT INTO `nideshop_footprint` VALUES ('199', '36', '12', '1522808503', '0');
INSERT INTO `nideshop_footprint` VALUES ('200', '36', '11', '1522808600', '0');
INSERT INTO `nideshop_footprint` VALUES ('201', '36', '14', '1522809332', '0');
INSERT INTO `nideshop_footprint` VALUES ('202', '36', '14', '1522809832', '0');
INSERT INTO `nideshop_footprint` VALUES ('203', '36', '14', '1522810175', '0');
INSERT INTO `nideshop_footprint` VALUES ('204', '36', '14', '1522810786', '0');
INSERT INTO `nideshop_footprint` VALUES ('205', '36', '14', '1522812341', '0');
INSERT INTO `nideshop_footprint` VALUES ('206', '36', '13', '1522812850', '0');
INSERT INTO `nideshop_footprint` VALUES ('207', '36', '11', '1522813227', '0');
INSERT INTO `nideshop_footprint` VALUES ('208', '36', '11', '1522813361', '0');
INSERT INTO `nideshop_footprint` VALUES ('209', '36', '14', '1522813652', '0');
INSERT INTO `nideshop_footprint` VALUES ('210', '36', '14', '1522814559', '0');
INSERT INTO `nideshop_footprint` VALUES ('211', '36', '14', '1522816648', '0');
INSERT INTO `nideshop_footprint` VALUES ('212', '36', '12', '1522816716', '0');
INSERT INTO `nideshop_footprint` VALUES ('213', '36', '12', '1522816751', '0');
INSERT INTO `nideshop_footprint` VALUES ('214', '36', '14', '1522816853', '0');
INSERT INTO `nideshop_footprint` VALUES ('215', '36', '12', '1522816863', '0');
INSERT INTO `nideshop_footprint` VALUES ('216', '36', '13', '1522817124', '0');
INSERT INTO `nideshop_footprint` VALUES ('217', '36', '14', '1522817861', '0');
INSERT INTO `nideshop_footprint` VALUES ('218', '36', '14', '1522817943', '0');
INSERT INTO `nideshop_footprint` VALUES ('219', '36', '14', '1522818306', '0');
INSERT INTO `nideshop_footprint` VALUES ('220', '36', '14', '1522819337', '0');
INSERT INTO `nideshop_footprint` VALUES ('221', '36', '14', '1522820242', '0');
INSERT INTO `nideshop_footprint` VALUES ('222', '36', '10', '1522820818', '0');
INSERT INTO `nideshop_footprint` VALUES ('223', '36', '14', '1522820955', '0');
INSERT INTO `nideshop_footprint` VALUES ('224', '36', '13', '1522821099', '0');
INSERT INTO `nideshop_footprint` VALUES ('225', '36', '11', '1522822457', '0');
INSERT INTO `nideshop_footprint` VALUES ('226', '36', '12', '1522823124', '0');
INSERT INTO `nideshop_footprint` VALUES ('227', '36', '12', '1522823449', '0');
INSERT INTO `nideshop_footprint` VALUES ('228', '36', '13', '1522825355', '0');
INSERT INTO `nideshop_footprint` VALUES ('229', '36', '12', '1522827421', '0');
INSERT INTO `nideshop_footprint` VALUES ('230', '36', '14', '1522827560', '0');
INSERT INTO `nideshop_footprint` VALUES ('231', '36', '13', '1522830651', '0');
INSERT INTO `nideshop_footprint` VALUES ('232', '36', '12', '1522831110', '0');
INSERT INTO `nideshop_footprint` VALUES ('233', '36', '13', '1522831479', '0');
INSERT INTO `nideshop_footprint` VALUES ('234', '36', '13', '1522832558', '0');
INSERT INTO `nideshop_footprint` VALUES ('235', '36', '13', '1522833369', '0');
INSERT INTO `nideshop_footprint` VALUES ('236', '36', '12', '1522835374', '0');
INSERT INTO `nideshop_footprint` VALUES ('237', '36', '14', '1522835779', '0');
INSERT INTO `nideshop_footprint` VALUES ('238', '36', '14', '1522837529', '0');
INSERT INTO `nideshop_footprint` VALUES ('239', '36', '14', '1522838174', '0');
INSERT INTO `nideshop_footprint` VALUES ('240', '36', '13', '1523149567', '0');
INSERT INTO `nideshop_footprint` VALUES ('241', '36', '14', '1523149723', '0');
INSERT INTO `nideshop_footprint` VALUES ('242', '36', '12', '1523149936', '0');
INSERT INTO `nideshop_footprint` VALUES ('243', '35', '12', '1523150762', '0');
INSERT INTO `nideshop_footprint` VALUES ('244', '35', '12', '1523150952', '0');
INSERT INTO `nideshop_footprint` VALUES ('245', '35', '12', '1523151055', '0');
INSERT INTO `nideshop_footprint` VALUES ('246', '35', '10', '1523151079', '0');
INSERT INTO `nideshop_footprint` VALUES ('247', '35', '11', '1523151250', '0');
INSERT INTO `nideshop_footprint` VALUES ('248', '35', '14', '1523151298', '0');
INSERT INTO `nideshop_footprint` VALUES ('249', '35', '13', '1523151444', '0');
INSERT INTO `nideshop_footprint` VALUES ('250', '35', '14', '1523153150', '0');
INSERT INTO `nideshop_footprint` VALUES ('251', '35', '13', '1523153232', '0');
INSERT INTO `nideshop_footprint` VALUES ('252', '35', '13', '1523153262', '0');
INSERT INTO `nideshop_footprint` VALUES ('253', '35', '14', '1523153291', '0');
INSERT INTO `nideshop_footprint` VALUES ('254', '35', '14', '1523153468', '0');
INSERT INTO `nideshop_footprint` VALUES ('255', '35', '13', '1523153567', '0');
INSERT INTO `nideshop_footprint` VALUES ('256', '35', '15', '1523153688', '0');
INSERT INTO `nideshop_footprint` VALUES ('257', '35', '14', '1523153692', '0');
INSERT INTO `nideshop_footprint` VALUES ('258', '35', '12', '1523153713', '0');
INSERT INTO `nideshop_footprint` VALUES ('259', '35', '10', '1523153747', '0');
INSERT INTO `nideshop_footprint` VALUES ('260', '35', '12', '1523153785', '0');
INSERT INTO `nideshop_footprint` VALUES ('261', '35', '13', '1523153941', '0');
INSERT INTO `nideshop_footprint` VALUES ('262', '35', '13', '1523154106', '0');
INSERT INTO `nideshop_footprint` VALUES ('263', '35', '15', '1523154173', '0');
INSERT INTO `nideshop_footprint` VALUES ('264', '35', '14', '1523154188', '0');
INSERT INTO `nideshop_footprint` VALUES ('265', '35', '15', '1523155131', '0');
INSERT INTO `nideshop_footprint` VALUES ('266', '35', '13', '1523155181', '0');
INSERT INTO `nideshop_footprint` VALUES ('267', '35', '16', '1523155259', '0');
INSERT INTO `nideshop_footprint` VALUES ('268', '35', '16', '1523155264', '0');
INSERT INTO `nideshop_footprint` VALUES ('269', '35', '14', '1523155297', '0');
INSERT INTO `nideshop_footprint` VALUES ('270', '35', '13', '1523155915', '0');
INSERT INTO `nideshop_footprint` VALUES ('271', '37', '13', '1523156187', '0');
INSERT INTO `nideshop_footprint` VALUES ('272', '37', '14', '1523156379', '0');
INSERT INTO `nideshop_footprint` VALUES ('273', '36', '18', '1523158488', '0');
INSERT INTO `nideshop_footprint` VALUES ('274', '36', '15', '1523158509', '0');
INSERT INTO `nideshop_footprint` VALUES ('275', '37', '16', '1523158564', '0');
INSERT INTO `nideshop_footprint` VALUES ('276', '37', '15', '1523158574', '0');
INSERT INTO `nideshop_footprint` VALUES ('277', '35', '15', '1523170772', '0');
INSERT INTO `nideshop_footprint` VALUES ('278', '37', '16', '1523171950', '0');
INSERT INTO `nideshop_footprint` VALUES ('279', '37', '15', '1523172349', '0');
INSERT INTO `nideshop_footprint` VALUES ('280', '37', '15', '1523172350', '0');
INSERT INTO `nideshop_footprint` VALUES ('281', '37', '18', '1523172484', '0');
INSERT INTO `nideshop_footprint` VALUES ('282', '37', '17', '1523172526', '0');
INSERT INTO `nideshop_footprint` VALUES ('283', '37', '18', '1523172556', '0');
INSERT INTO `nideshop_footprint` VALUES ('284', '37', '16', '1523172571', '0');
INSERT INTO `nideshop_footprint` VALUES ('285', '37', '15', '1523172588', '0');
INSERT INTO `nideshop_footprint` VALUES ('286', '40', '18', '1523173264', '0');
INSERT INTO `nideshop_footprint` VALUES ('287', '40', '18', '1523173659', '0');
INSERT INTO `nideshop_footprint` VALUES ('288', '40', '16', '1523173701', '0');
INSERT INTO `nideshop_footprint` VALUES ('289', '35', '10', '1523174759', '0');
INSERT INTO `nideshop_footprint` VALUES ('290', '36', '18', '1523175845', '0');
INSERT INTO `nideshop_footprint` VALUES ('291', '36', '19', '1523176050', '0');
INSERT INTO `nideshop_footprint` VALUES ('292', '36', '19', '1523176090', '0');
INSERT INTO `nideshop_footprint` VALUES ('293', '36', '19', '1523176229', '0');
INSERT INTO `nideshop_footprint` VALUES ('294', '36', '18', '1523176614', '0');
INSERT INTO `nideshop_footprint` VALUES ('295', '36', '17', '1523176689', '0');
INSERT INTO `nideshop_footprint` VALUES ('296', '36', '18', '1523176912', '0');
INSERT INTO `nideshop_footprint` VALUES ('297', '36', '17', '1523176927', '0');
INSERT INTO `nideshop_footprint` VALUES ('298', '36', '16', '1523176935', '0');
INSERT INTO `nideshop_footprint` VALUES ('299', '35', '19', '1523177338', '0');
INSERT INTO `nideshop_footprint` VALUES ('300', '35', '10', '1523177367', '0');
INSERT INTO `nideshop_footprint` VALUES ('301', '36', '13', '1523177462', '0');
INSERT INTO `nideshop_footprint` VALUES ('302', '36', '18', '1523177578', '0');
INSERT INTO `nideshop_footprint` VALUES ('303', '36', '18', '1523178791', '0');
INSERT INTO `nideshop_footprint` VALUES ('304', '36', '18', '1523178982', '0');
INSERT INTO `nideshop_footprint` VALUES ('305', '36', '18', '1523180215', '0');
INSERT INTO `nideshop_footprint` VALUES ('306', '35', '10', '1523244743', '0');
INSERT INTO `nideshop_footprint` VALUES ('307', '35', '17', '1523244826', '0');
INSERT INTO `nideshop_footprint` VALUES ('308', '35', '20', '1523253801', '0');
INSERT INTO `nideshop_footprint` VALUES ('309', '35', '18', '1523261217', '0');
INSERT INTO `nideshop_footprint` VALUES ('310', '36', '18', '1523261482', '0');
INSERT INTO `nideshop_footprint` VALUES ('311', '36', '18', '1523261929', '0');
INSERT INTO `nideshop_footprint` VALUES ('312', '35', '18', '1523263094', '0');
INSERT INTO `nideshop_footprint` VALUES ('313', '36', '18', '1523263639', '0');
INSERT INTO `nideshop_footprint` VALUES ('314', '36', '18', '1523263744', '0');
INSERT INTO `nideshop_footprint` VALUES ('315', '36', '19', '1523263747', '0');
INSERT INTO `nideshop_footprint` VALUES ('316', '36', '20', '1523266250', '0');
INSERT INTO `nideshop_footprint` VALUES ('317', '35', '16', '1523346210', '0');
INSERT INTO `nideshop_footprint` VALUES ('318', '35', '17', '1523346220', '0');
INSERT INTO `nideshop_footprint` VALUES ('319', '36', '18', '1523353207', '0');
INSERT INTO `nideshop_footprint` VALUES ('320', '35', '18', '1523435229', '0');
INSERT INTO `nideshop_footprint` VALUES ('321', '35', '19', '1523842478', '0');
INSERT INTO `nideshop_footprint` VALUES ('322', '35', '16', '1523842730', '0');
INSERT INTO `nideshop_footprint` VALUES ('323', '35', '16', '1523842766', '0');
INSERT INTO `nideshop_footprint` VALUES ('324', '36', '18', '1523843577', '0');
INSERT INTO `nideshop_footprint` VALUES ('325', '36', '18', '1523843729', '0');
INSERT INTO `nideshop_footprint` VALUES ('326', '36', '18', '1523843761', '0');
INSERT INTO `nideshop_footprint` VALUES ('327', '35', '18', '1523850290', '0');
INSERT INTO `nideshop_footprint` VALUES ('328', '35', '18', '1523935149', '0');
INSERT INTO `nideshop_footprint` VALUES ('329', '36', '18', '1523935165', '0');
INSERT INTO `nideshop_footprint` VALUES ('330', '36', '19', '1523935670', '0');
INSERT INTO `nideshop_footprint` VALUES ('331', '35', '15', '1523943876', '0');
INSERT INTO `nideshop_footprint` VALUES ('332', '35', '19', '1523944512', '0');
INSERT INTO `nideshop_footprint` VALUES ('333', '35', '19', '1523944523', '0');
INSERT INTO `nideshop_footprint` VALUES ('334', '35', '19', '1523950785', '0');
INSERT INTO `nideshop_footprint` VALUES ('335', '36', '18', '1524024103', '0');
INSERT INTO `nideshop_footprint` VALUES ('336', '36', '19', '1524140378', '0');
INSERT INTO `nideshop_footprint` VALUES ('337', '35', '18', '1524196145', '0');
INSERT INTO `nideshop_footprint` VALUES ('338', '36', '18', '1524196195', '0');
INSERT INTO `nideshop_footprint` VALUES ('339', '35', '18', '1524220598', '0');
INSERT INTO `nideshop_footprint` VALUES ('340', '35', '19', '1524220692', '0');
INSERT INTO `nideshop_footprint` VALUES ('341', '35', '18', '1524225144', '0');

-- ----------------------------
-- Table structure for nideshop_goods
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_goods`;
CREATE TABLE `nideshop_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) unsigned DEFAULT '0',
  `goods_sn` varchar(60) DEFAULT '',
  `name` varchar(120) NOT NULL DEFAULT '',
  `brand_id` int(11) unsigned DEFAULT '0',
  `goods_number` mediumint(8) unsigned DEFAULT '0',
  `keywords` varchar(255) DEFAULT '',
  `goods_brief` varchar(255) DEFAULT '',
  `goods_desc` text,
  `is_on_sale` tinyint(1) unsigned DEFAULT '1',
  `add_time` datetime DEFAULT NULL,
  `sort_order` smallint(4) unsigned DEFAULT '100',
  `is_delete` tinyint(1) unsigned DEFAULT '0',
  `attribute_category` int(11) unsigned DEFAULT '0',
  `counter_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '专柜价格',
  `extra_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '附加价格',
  `is_new` tinyint(1) unsigned DEFAULT '0',
  `goods_unit` varchar(45) DEFAULT NULL COMMENT '商品单位',
  `primary_pic_url` varchar(255) DEFAULT NULL COMMENT '商品主图',
  `list_pic_url` varchar(255) DEFAULT NULL COMMENT '商品列表图',
  `retail_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '零售价格',
  `sell_volume` int(11) unsigned DEFAULT '0' COMMENT '销售量',
  `primary_product_id` int(11) unsigned DEFAULT '0' COMMENT '主sku　product_id',
  `unit_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '单位价格，单价',
  `promotion_desc` varchar(255) DEFAULT NULL,
  `promotion_tag` varchar(45) DEFAULT NULL,
  `app_exclusive_price` decimal(10,2) unsigned DEFAULT NULL COMMENT 'APP专享价',
  `is_app_exclusive` tinyint(1) unsigned DEFAULT NULL COMMENT '是否是APP专属',
  `is_limited` tinyint(1) unsigned DEFAULT NULL,
  `is_hot` tinyint(1) unsigned DEFAULT '0',
  `market_price` decimal(10,2) DEFAULT '0.00',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '修改人ID',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_user_dept_id` bigint(20) DEFAULT NULL,
  `identify` bigint(20) DEFAULT NULL COMMENT '标识索引备注',
  `sys_user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`),
  KEY `goods_sn` (`goods_sn`),
  KEY `cat_id` (`category_id`),
  KEY `brand_id` (`brand_id`),
  KEY `goods_number` (`goods_number`),
  KEY `sort_order` (`sort_order`)
) ENGINE=MyISAM AUTO_INCREMENT=1181004 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_goods
-- ----------------------------
INSERT INTO `nideshop_goods` VALUES ('12', '1036025', '10003', 'xzoo连衣裙长袖2018春季新款时尚修身两件套装V领蕾丝A字沙滩裙子', '1046013', '222', '连衣裙', null, '<p><img src=\"https://img30.360buyimg.com/imgzone/jfs/t18283/38/933509807/34985/aaefdf39/5ab3176aN21c8e5c8.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t17437/325/920829886/78585/2d1bb875/5ab3176bN7e054b7d.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img11.360buyimg.com/imgzone/jfs/t19174/51/944313676/77992/8a2af3b4/5ab3176cN4d7799a3.jpg\" alt=\"\" class=\"fr-fin\"><br><br><br><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t19627/18/1092295495/113119/dc6e8d49/5ab89d18Nbf204e39.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"https://img30.360buyimg.com/popWareDetail/jfs/t18226/81/1009302366/155164/a4dfefd6/5ab60b4bN590ac121.jpg\" alt=\"\" usemap=\"#ff\" border=\"0\" class=\"fr-fin\"><img src=\"https://img11.360buyimg.com/imgzone/jfs/t16906/83/944969005/28570/eeedc847/5ab3176dNb4f2579c.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t17524/341/950864629/29601/f3546396/5ab3176cNf0cbe782.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t14902/301/2598589502/90811/aa771be7/5ab3176fN2feb2c1a.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t18997/276/946710874/118790/162faccc/5ab31770N86c592d1.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t18919/278/979575572/91352/cc6b93ca/5ab31772Nec650665.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img12.360buyimg.com/imgzone/jfs/t17533/257/926386353/103599/ea871d67/5ab31774Naa935a46.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img11.360buyimg.com/imgzone/jfs/t16723/345/959687143/64997/4572963/5ab31775N2415bb04.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img13.360buyimg.com/imgzone/jfs/t19300/284/952358588/75828/2f82c42f/5ab31778N13cdfacd.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img12.360buyimg.com/imgzone/jfs/t15619/214/2623266797/78772/3744f477/5ab3177aNfcaf8248.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t14674/91/2704977217/99563/3224b6b8/5ab3177cN5e05d5f2.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img13.360buyimg.com/imgzone/jfs/t19471/236/940847486/96816/a7ef4365/5ab3177dNcc96af07.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t17539/359/918564484/95197/a3be4d3f/5ab3177dNa1f361d9.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t16126/189/2466695780/79169/aba88f4b/5ab3177eN126a97cd.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img11.360buyimg.com/imgzone/jfs/t17347/88/927014660/118164/3ab368b1/5ab31780Nf795fdad.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t15709/27/2561283217/113928/f6919f76/5ab31781Nc4a8dc09.jpg\" alt=\"\" class=\"fr-fin\"><br></p>', '1', '2018-04-02 13:00:51', '100', '0', '1036003', null, null, '1', null, 'http://p2n8ypmnw.bkt.clouddn.com/20180402/125728832c80df.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1258048908b5f5.jpg', '255.00', null, '286', null, '2018春季新款时尚修身两件套装V领蕾丝A字沙滩裙子 白色', null, null, '0', '0', '0', '255.00', '1', '1', '2018-04-02 14:00:22', null, '1', '1');
INSERT INTO `nideshop_goods` VALUES ('11', '1036025', '10002', '芊蕊 休闲套装女新款牛仔外套女初高中学生少女春秋装新款休闲套装牛仔两件套 白色 M', '1046013', '111', '休闲女装', null, '<p><img src=\"https://img20.360buyimg.com/imgzone/jfs/t16747/335/686672371/100825/7282c1a8/5a9e9f7aN5c52fe06.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img13.360buyimg.com/imgzone/jfs/t19516/66/664572379/100887/7ffae31a/5a9e9f7cN82c84f9d.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t15943/180/2284506539/94128/13c664cb/5a9e9f7cNe5db076e.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img13.360buyimg.com/imgzone/jfs/t19420/85/700368131/102131/3a109d7e/5a9e9f7cN312b1cd6.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t16243/264/2323118142/99455/4f88440f/5a9e9f7cNa241574e.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img20.360buyimg.com/imgzone/jfs/t18424/277/703545898/97247/9b626d1d/5a9e9f7dN4ba7eb41.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t17170/68/671749300/90990/b1faf865/5a9e9f7dNc7ad4fe6.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img20.360buyimg.com/imgzone/jfs/t14359/112/2455447324/81327/b9c694f6/5a9e9f7dN8e720be6.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t19207/340/664945235/99694/448ea8ca/5a9e9f7dN554f9cd4.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t19273/249/690734682/96252/17a9b3d0/5a9e9f7dNb09955d2.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t18316/74/685566165/81829/c47c15c8/5a9e9f7eN84041cbb.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img11.360buyimg.com/imgzone/jfs/t15352/275/2361654770/92666/253b2ca9/5a9e9f7eN73c80ac8.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img13.360buyimg.com/imgzone/jfs/t17221/294/652065544/102382/b7d639fa/5a9e9f7eNd6006213.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t19036/110/679740141/102317/1c7cf877/5a9e9f7fN70598dd3.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t12535/221/2510786211/95791/73281944/5a9e9f7fN152463d4.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img12.360buyimg.com/imgzone/jfs/t17908/320/675131551/89496/c939f536/5a9e9f7fNdbfbdacb.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img20.360buyimg.com/imgzone/jfs/t16894/314/654675742/102247/477e952d/5a9e9f7fN5a420b2c.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t14851/262/2268105836/100483/7d5bf18/5a9e9f80N2220298f.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t19618/279/678086751/96142/2a323d77/5a9e9f80N208e9487.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t19153/334/637306267/95897/39267271/5a9e9f7fN3d63aa69.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t14431/271/2439982220/101651/f64fb8e4/5a9e9f80N8d7c15b6.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img12.360buyimg.com/imgzone/jfs/t19552/269/661766866/91548/765bd997/5a9e9f81Nd65fd6c2.jpg\" alt=\"\" class=\"fr-fin\"><br></p>', '1', '2018-04-02 11:02:16', '100', '0', '1036003', null, null, '1', null, 'http://p2n8ypmnw.bkt.clouddn.com/20180402/11013455347557.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/11013894ba1fb.jpg', '299.00', null, '285', null, '休闲女装', null, null, '0', '0', '0', '299.00', '1', '1', '2018-04-02 14:00:12', null, '1', '1');
INSERT INTO `nideshop_goods` VALUES ('10', '1036024', '100001', '纳斯鲁 短外套女2018年春季新款女装韩版修身时尚优雅短外套 图片色 M', '1046012', '100', '女装', null, '<p><br><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t3088/189/2242030181/234920/4732bccb/57de93faN439ced1b.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t5770/365/8059278499/537729/e8b5aa11/5976c334N104f75cc.png\" alt=\"\" class=\"fr-fin\"><br><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t6829/138/446811411/48390/f2cb5f1a/5976c3d6Nc34971e6.png\" alt=\"\" class=\"fr-fin\"><br><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t5749/342/8021048695/44397/43144da6/5976c32cNdb943aee.png\" alt=\"\" class=\"fr-fin\"><br><br><br><br><br><br><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t3013/232/2631840656/373822/17942814/57de93fdN9f3a70f3.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t3052/140/2224176018/408775/a4097aef/57de93feN146629d6.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t3043/212/2621171243/372476/f7e9efad/57de9400N00aabacf.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t3286/93/2339938235/431506/c1bab573/57de9401Ne6234413.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t3154/132/2246013385/432621/121d2615/57de9403Nb8d5a973.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t3250/15/2265584737/547051/88f0ffcf/57de9405Ncd6cc433.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t3253/67/2264595507/341395/19fbbce5/57de9406Nbebfd56b.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t3169/21/2318750316/408756/5d3d41f/57de9408N57d18a5f.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t3115/318/2279216191/364392/be40433d/57de9409Ndc8c5818.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t3085/182/2241749732/349436/e070cf78/57de940aNe8edf101.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t3127/312/2314009392/538292/bf0deddf/57de940cNb0160621.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t3163/153/2304627392/538292/bf0deddf/57de940fN8aad03a6.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t3289/149/2198299087/357046/a6e87c3d/57de9410Na3d965f3.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t3109/16/2272754668/339287/438640a0/57de9411N51d5eaf0.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t3097/357/2273141447/267024/f5607aee/57de9412Nfb63f5f3.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t3277/116/2276907869/216734/527e229f/57de9413N365cdbf2.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t3040/138/2663043124/204558/a8f30c4e/57de9414N2b2bed7c.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t3271/250/2235035342/207206/521fcca8/57de9415N084df965.jpg\" alt=\"\" class=\"fr-fin\"><br></p>', '1', '2018-04-02 10:35:58', '100', '0', null, null, null, '1', null, 'http://p2n8ypmnw.bkt.clouddn.com/20180402/103516494cf057.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/10355283613063.jpg', '199.00', null, '284', null, '春季女装', null, null, '0', '0', '1', '199.00', '1', '1', '2018-04-03 15:59:05', null, '1', '1');
INSERT INTO `nideshop_goods` VALUES ('13', '1036025', '10004', '熙世界自然腰九分裤女2018夏装新款直筒裤简约休闲裤子女103LK020', '1046013', '127', '裤', null, '<p><img src=\"https://img11.360buyimg.com/imgzone/jfs/t6076/156/7906954576/72258/70401e71/5982d231Na9ba9c95.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img11.360buyimg.com/imgzone/jfs/t5599/226/9168524258/63411/1fc3781d/5982d23fN1c7a08ba.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img14.360buyimg.com/imgzone/jfs/t6919/185/1548250945/26903/11951e22/5982d23bN3aa8b6e4.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img14.360buyimg.com/imgzone/jfs/t5659/259/9153484221/51811/7e955a6b/5982d23fNd7444245.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img20.360buyimg.com/imgzone/jfs/t7066/325/662020631/36307/fc0978c8/5982d240N445a8c57.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t6889/9/1582533538/41181/9ae2be86/5982d241N18499e83.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t6097/136/7939771246/44230/aa1b3d0f/5982d238N8b33c1fc.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img11.360buyimg.com/imgzone/jfs/t7036/205/1570351430/55329/1648d98a/5982d241Ne7a4744f.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img12.360buyimg.com/imgzone/jfs/t6796/207/1546515081/61021/b9a293b8/5982d242Na292e974.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t7060/222/1595366076/44321/ee40f34d/5982d242N7c2c8094.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t6808/362/1559458468/56712/5af3f792/5982d242N5bd9943f.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img14.360buyimg.com/imgzone/jfs/t6976/212/1542309739/53679/e4521c0a/5982d243N062356a9.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t6892/346/1614405382/46339/519b6a7d/5982d243N6e280ecd.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img20.360buyimg.com/imgzone/jfs/t5677/144/9237248928/15750/4a6418fe/5982d240N0b4a24a5.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img14.360buyimg.com/imgzone/jfs/t5722/136/9118242203/41661/c6942731/5982d241N2002e1c4.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img14.360buyimg.com/imgzone/jfs/t6037/161/7879580238/52080/429bff55/5982d244N23480f10.jpg\" alt=\"\" class=\"fr-fin\"><br></p>', '1', '2018-04-02 13:33:44', '100', '0', '1036003', null, null, '1', null, 'http://p2n8ypmnw.bkt.clouddn.com/20180402/133305518d352d.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135851122bfbcf.jpg', '89.00', null, '287', null, '2018夏装新款直筒裤', null, null, '0', '0', '0', '89.00', '1', '1', '2018-04-02 14:00:31', null, '1', '1');
INSERT INTO `nideshop_goods` VALUES ('14', '1036025', '10005', '单蜜短外套女装2018春季新款夹克韩版开衫上衣 卡其 M', '1046013', '199', '上衣', null, '<p><img src=\"https://img10.360buyimg.com/imgzone/jfs/t15394/104/2254996193/54322/ced16b2d/5a7e7745N47deb724.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img11.360buyimg.com/imgzone/jfs/t17338/152/478933742/56235/7735e084/5a7e7745N96d72fd6.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img13.360buyimg.com/imgzone/jfs/t19108/59/481896915/82093/ed6a370a/5a7e7745N2e17181e.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img12.360buyimg.com/imgzone/jfs/t16993/303/465291415/57846/d057c1c4/5a7e7747N1dfcf8e3.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t16408/292/2077839220/56633/f3b434e6/5a7e7748N8e72aeda.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img13.360buyimg.com/imgzone/jfs/t18514/186/477415331/57341/69dd1011/5a7e7749N53e0cd68.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t18877/60/461522186/59472/c9c6055d/5a7e7749Neec58ec0.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img11.360buyimg.com/imgzone/jfs/t17734/33/462778826/48908/49a99998/5a7e774cN4f1a6740.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img20.360buyimg.com/imgzone/jfs/t15079/174/2244619637/52155/da516de4/5a7e774dN09c8387e.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t16093/358/2027591775/51188/71ce576f/5a7e774dNaf222d68.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t17926/290/494382695/57173/89da17ea/5a7e774fN9abf4d1c.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img12.360buyimg.com/imgzone/jfs/t15037/71/2223722481/44379/3bf29ec9/5a7e7750Neaa8c2b8.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img20.360buyimg.com/imgzone/jfs/t14758/238/2219245898/64402/f9127050/5a7e7757Nccef6ff1.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img13.360buyimg.com/imgzone/jfs/t15103/85/2225096817/55098/b9ee1b9d/5a7e775dNef3707e6.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t14734/246/2230910508/56962/d4e42f56/5a7e775dN674db9bc.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t17506/210/460731598/59471/6b6e834c/5a7e7760Nbbddc610.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t15685/182/2088400107/55747/5fd93d3e/5a7e7760Ndc647fd8.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img11.360buyimg.com/imgzone/jfs/t15715/309/2101006729/56445/c5ff09b3/5a7e7761Nbef732b1.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img12.360buyimg.com/imgzone/jfs/t14452/67/2122106374/55427/2abb9847/5a7e7762N860928e2.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t14683/222/2226898782/59526/9d62c456/5a7e7763Ne4c7b49d.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img12.360buyimg.com/imgzone/jfs/t15742/196/2092703270/57488/7b237290/5a7e7763N9bd8fd9b.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t14971/153/2215599404/58571/194c523a/5a7e7763Nf075bb65.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img30.360buyimg.com/imgzone/jfs/t19468/140/470225083/55281/fe56b66d/5a7e7763Nb212a051.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img13.360buyimg.com/imgzone/jfs/t15262/86/2236634739/50893/582958d4/5a7e7764N321ee9c9.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img11.360buyimg.com/imgzone/jfs/t14443/81/2227278794/50075/74a3f37/5a7e7764N146e19b5.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img20.360buyimg.com/imgzone/jfs/t16597/131/484289664/54675/ba17ac57/5a7e7765N2e81e1f4.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t14947/211/2221823277/61097/ca447a81/5a7e7765Ne52069ed.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img12.360buyimg.com/imgzone/jfs/t19495/243/478820631/61371/a72c854a/5a7e7765N3ada9478.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img13.360buyimg.com/imgzone/jfs/t19177/311/471674226/62262/19449ad/5a7e7766N429a3906.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img13.360buyimg.com/imgzone/jfs/t18808/71/456003974/65133/70defb5d/5a7e7767Nf89b6d59.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img13.360buyimg.com/imgzone/jfs/t19246/318/471324858/46035/518360a7/5a7e7768N13c08e89.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t14905/228/2219947395/37810/3473ad60/5a7e7768Nf445955c.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t14884/74/2249948835/42425/fd28f7b/5a7e7769N6b3e3cd1.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img11.360buyimg.com/imgzone/jfs/t15535/114/2086259533/38351/ee3c3ecd/5a7e7769N63fc3f06.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img11.360buyimg.com/imgzone/jfs/t14989/69/2259169337/40291/f94605ac/5a7e776aNdb4c94ce.jpg\" alt=\"\" class=\"fr-fin\"><br></p>', '1', '2018-04-02 13:46:30', '100', '0', '1036004', null, null, '1', null, 'http://p2n8ypmnw.bkt.clouddn.com/20180402/13452689855fb.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135917348f898a.jpg', '138.88', null, '288', null, '2018春季新款夹克韩版开衫上衣', null, null, '0', '0', '0', '138.88', '1', '1', '2018-04-03 15:48:00', null, '1', '1');
INSERT INTO `nideshop_goods` VALUES ('15', '1036028', '10006', '法国雨露棉麻宽松合体男式衬衫 天空蓝;宽松版 S(16588A)', '1046014', '999', '衬衫', '衬衫', '<table width=\"750\" border=\"0\"><tbody><tr><td><img src=\"//img10.360buyimg.com/imgzone/jfs/t11329/201/2341016328/206534/8ba90362/5a1fcf3bN15179bef.jpg\" alt=\"\" class=\"fr-fin\"></td></tr><tr><td><img src=\"//img10.360buyimg.com/imgzone/jfs/t12604/117/1434171671/305024/cf527d4f/5a1fcf3bNd6800516.jpg\" alt=\"\" class=\"fr-fin\"></td></tr><tr><td><img src=\"//img10.360buyimg.com/imgzone/jfs/t12268/323/1414305191/542619/7818a405/5a1fcf3bN50b11363.jpg\" alt=\"\" class=\"fr-fin\"></td></tr><tr><td><img src=\"//img10.360buyimg.com/imgzone/jfs/t13630/72/1407971470/251800/dc3aa8d2/5a1fcf3bNc47ec5f2.jpg\" alt=\"\" class=\"fr-fin\"></td></tr><tr><td><img src=\"//img10.360buyimg.com/imgzone/jfs/t12133/270/1409167058/318085/a7ac24c5/5a1fcf3bN94c012f0.jpg\" alt=\"\" class=\"fr-fin\"></td></tr><tr><td><img src=\"//img10.360buyimg.com/imgzone/jfs/t12676/48/1388501758/201842/c4caf45c/5a1fcf3bN7c9d7d74.jpg\" alt=\"\" class=\"fr-fin\"></td></tr><tr><td><img src=\"//img10.360buyimg.com/imgzone/jfs/t12154/356/1418223885/105440/e692e8de/5a1fcf37N952a76f6.jpg\" alt=\"\" class=\"fr-fin\"></td></tr><tr><td><img src=\"//img10.360buyimg.com/imgzone/jfs/t12865/193/1396589337/137639/23938c46/5a1fcf24N1d74df7d.jpg\" alt=\"\" class=\"fr-fin\"></td></tr><tr><td><img src=\"//img10.360buyimg.com/imgzone/jfs/t12559/118/1384574684/344363/36c96ab0/5a1fcf7dN4a16a7a0.jpg\" alt=\"\" class=\"fr-fin\"></td></tr><tr><td><img src=\"//img10.360buyimg.com/imgzone/jfs/t12619/210/1381648005/317144/9de2ec32/5a1fcf77N74ad92f6.jpg\" alt=\"\" class=\"fr-fin\"></td></tr><tr><td><img src=\"//img10.360buyimg.com/imgzone/jfs/t12241/207/1447063578/274168/f595bc75/5a1fcf7cNd46558e5.jpg\" alt=\"\" class=\"fr-fin\"></td></tr></tbody></table>', '1', '2018-04-08 10:14:33', '100', '0', '1036004', null, null, '1', null, 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1014259844eaa1.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/10143170220e29.jpg', '249.00', null, '289', null, '衬衫', null, null, '0', '0', '0', '249.00', '1', '1', '2018-04-08 10:59:44', null, '1', '1');
INSERT INTO `nideshop_goods` VALUES ('17', '1036029', '10008', 'By Creations Lite Reda110支纯羊毛面料西裤 男士暗格子正装裤 灰蓝色西裤 46', '1046014', '999', '裤子 西裤', '裤子 西裤', '<p><br><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t14206/125/2705291480/175952/3394dce/5ab07a47Nb1dbcf77.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t18040/84/917418453/114416/e596ca6c/5ab07a47N280f9f53.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t18709/112/915777620/236547/4bfa2259/5ab07a47Ncefec328.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t14410/24/2691476661/209041/a6944439/5ab07a46N1cc22070.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t18928/134/888175322/205875/ef987b49/5ab07a48N99ab3250.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t16918/134/894624760/191544/d292a5bb/5ab07a49N751eff35.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t17578/173/926510607/702487/b4d1eb06/5ab07a49Nb5b41b1d.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t18016/281/897153401/858260/ebb569d9/5ab07a4aNe7b1fff1.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t17917/43/821238871/265498/df2fd42a/5ab07a48Nb051fcb7.jpg\" alt=\"\" class=\"fr-fin\"><br><img src=\"//img30.360buyimg.com/popWareDetail/jfs/t16456/122/2554964809/89467/c35653a5/5ab07a4aNad670fe3.jpg\" alt=\"\" class=\"fr-fin\"><br></p>', '1', '2018-04-08 11:18:37', '100', '0', '1036005', null, null, '1', null, 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1117496329753c.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1117535084c0a2.jpg', '1180.00', null, '291', null, '裤子 西裤', null, null, '0', '0', '0', '1180.00', '1', '1', '2018-04-08 11:18:37', null, '1', '1');
INSERT INTO `nideshop_goods` VALUES ('16', '1036030', '10007', 'A21以纯线上品牌2018夏季新品男装短袖T恤男圆领修身弹力短袖男t恤4821330159 特白 17588AL', '1046014', '999', 'T恤', 'T恤', '<p><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t18625/90/828464551/258024/d6f7fb55/5aa8e4dfNa61c7bc9.jpg\" alt=\"\" class=\"fr-fin\"></p><p><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t15517/189/2483357566/232024/dbe39ef3/5aa8e4deN1c88911f.jpg\" alt=\"\" class=\"fr-fin\"></p><p><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t15628/189/2315700164/240004/551bf67d/5aa8e4deNbca0e45d.jpg\" alt=\"\" class=\"fr-fin\"></p><p><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t19333/301/803557798/359196/54664f6/5aa8e523Nff260a19.jpg\" alt=\"\" class=\"fr-fin\"></p><p><img src=\"https://img10.360buyimg.com/imgzone/jfs/t15367/337/1271853221/6693/5bfa0a4e/5a4b3aeeN66e1b4fe.jpg\" alt=\" 尺码表版头.jpg\" class=\"fr-fin\"></p><table width=\"790\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" data-type=\"table\"><tbody><tr style=\"color:#000;font-size:28px;font-family:\'黑体\';font-weight:bold;min-width:10%;text-align:center;\"><td colspan=\"5\" style=\"color:#000;font-family:\'黑体\';font-weight:bold;font-size:28px;min-width:10%;height:45px;text-align:center;\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t15808/119/1479475812/6096/4ad2dc06/5a54253aN0c387f84.jpg\" alt=\" 上装肩宽XS-XL-女.jpg\" class=\"fr-fin\"></td></tr><tr style=\"color:#000;font-size:18px;font-family:\'黑体\';font-weight:bold;min-width:10%;text-align:center;\" height=\"45\"><td height=\"45px\">S(165/80A)            </td><td x:num=\"88\" height=\"19\" width=\"85\">88</td><td x:num=\"62.5\" height=\"19\" width=\"72\">62.5</td><td x:num=\"18.5\" height=\"19\" width=\"72\">18.5</td><td x:num=\"41\" height=\"19\" width=\"72\">41</td></tr><tr style=\"color:#000;font-size:18px;font-family:\'黑体\';font-weight:bold;min-width:10%;height:45px;text-align:center;\"><td height=\"45px\">&nbsp;M(170/84A)            </td><td x:num=\"93\" height=\"19\" width=\"85\">93</td><td x:num=\"65\" height=\"19\" width=\"72\">65</td><td x:num=\"19\" height=\"19\" width=\"72\">19</td><td x:num=\"43\" height=\"19\" width=\"72\">43</td></tr><tr style=\"color:#000;font-size:18px;font-family:\'黑体\';font-weight:bold;min-width:10%;height:45px;text-align:center;\"><td height=\"45px\"> L(175/88A)            </td><td x:num=\"98\" height=\"19\" width=\"85\">98</td><td x:num=\"67\" height=\"19\" width=\"72\">67</td><td x:num=\"20\" height=\"19\" width=\"72\">20</td><td x:num=\"45.5\" height=\"19\" width=\"72\">45.5</td></tr><tr style=\"color:#000;font-size:18px;font-family:\'黑体\';font-weight:bold;min-width:10%;height:45px;text-align:center;\"><td height=\"45px\">XL(180/92A)</td><td x:num=\"103\" height=\"19\" width=\"85\">103</td><td x:num=\"70\" height=\"19\" width=\"72\">70</td><td x:num=\"21\" height=\"19\" width=\"72\">21</td><td x:num=\"47\" height=\"19\" width=\"72\">47</td></tr><tr style=\"color:#000;font-size:18px;font-family:\'黑体\';font-weight:bold;min-width:10%;height:45px;text-align:center;\"><td height=\"45px\">XXL(185/96A)</td><td x:num=\"109\" height=\"19\" width=\"85\">109</td><td x:num=\"73\" height=\"19\" width=\"72\">73</td><td x:num=\"21.5\" height=\"19\" width=\"72\">21.5</td><td x:num=\"49\" height=\"19\" width=\"72\">49</td></tr><tr style=\"color:#000;font-size:18px;font-family:\'黑体\';font-weight:bold;min-width:10%;height:45px;text-align:center;\"><td height=\"45px\" colspan=\"5\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t15568/341/1151094692/4649/d4b37164/5a4b3ad0N1fa890fd.jpg\" alt=\" 人工测量说明.jpg\" class=\"fr-fin\"></td></tr><tr><td width=\"158\"><br></td><td width=\"158\"><br></td><td width=\"158\"><br></td><td width=\"158\"><br></td><td width=\"158\"><br></td></tr></tbody></table><p>&gt;</p><p><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t15679/140/2373849478/33281/9b0af8a7/5aa8e536N52df517a.jpg\" alt=\"\" class=\"fr-fin\"></p><p><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t17671/149/814770455/239085/ac32d2ce/5aa8e53fNe94fadfb.jpg\" alt=\"\" class=\"fr-fin\"></p><p><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t14815/4/2576856104/289094/aca25f1c/5aa8e53fNcfa92c02.jpg\" alt=\"\" class=\"fr-fin\"></p><p><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t15619/119/2442969800/74162/7a830fa7/5aa8e545N444d86de.jpg\" alt=\"\" class=\"fr-fin\"></p><p><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t17926/189/792482549/294184/1a6f9e09/5aa8e55dN9a95c5a3.jpg\" alt=\"\" class=\"fr-fin\"></p><p><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t19114/97/781575572/266283/f3190c8d/5aa8e55dN20492d3b.jpg\" alt=\"\" class=\"fr-fin\"></p><p><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t19444/193/819811443/71530/aaa8d1ca/5aa8e563N401d0818.jpg\" alt=\"\" class=\"fr-fin\"></p><p><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t17002/336/815707174/282206/3c6b93a1/5aa8e593N31d298f9.jpg\" alt=\"\" class=\"fr-fin\"></p><p><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t17548/295/801639782/251748/7cee90ef/5aa8e593Nb014a515.jpg\" alt=\"\" class=\"fr-fin\"></p><p><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t19723/282/813781602/55398/63f87b5b/5aa8e592N83c39d2f.jpg\" alt=\"\" class=\"fr-fin\"></p><p><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t16963/233/783246991/227332/b104264b/5aa8e59eNcaec2330.jpg\" alt=\"\" class=\"fr-fin\"></p><p><img src=\"https://img30.360buyimg.com/popWaterMark/jfs/t19504/297/843890508/270319/a5554300/5aa8e59eNd6558972.jpg\" alt=\"\" class=\"fr-fin\"></p>', '1', '2018-04-08 10:35:12', '100', '0', '1036004', null, null, '1', null, 'http://p2n8ypmnw.bkt.clouddn.com/20180408/10342034bca94.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/10342659476f99.jpg', '79.00', null, '290', null, 'T恤', null, null, '0', '0', '0', '79.00', '1', '1', '2018-04-08 10:59:35', null, '1', '1');
INSERT INTO `nideshop_goods` VALUES ('18', '1036031', '10009', '热风Hotwind男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '1046014', '999', '热风 白鞋 男鞋', '热风 白鞋 男鞋', '<p><img src=\"https://img30.360buyimg.com/imgzone/jfs/t17614/26/1313424752/202878/6ed61b8c/5ac47ee7N47cb87c2.jpg\" width=\"790\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t14752/23/2216393162/119319/9bc179c8/5a7c1214N9ec23370.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t15217/144/2205930036/73754/3c4db42b/5a7c1215Na9280494.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t18586/238/453961280/30880/f00f6996/5a7964f4N93f56c12.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t18874/35/455122638/34120/3ac330b3/5a79651fN267f1bea.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t18892/117/392681492/44724/1316327/5a73d899Nc1be29d3.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t17455/212/465358953/211604/902ad41b/5a7c1218N1bb63d9d.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t16222/163/1848010828/331841/fc31110c/5a7c121aN16f718d1.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t14365/340/2223635932/211954/7526a3da/5a7c121cN4dd63b3e.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t15256/41/2265656618/329306/8711ea4e/5a7c121eNedc59813.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t16279/49/1939101944/78317/3861fb61/5a7c1220N4fa0bd3f.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t16771/273/448264871/78303/e3ada803/5a7c1221Na8417362.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t19465/146/451899943/78672/be278f7b/5a7c1222N05db7345.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t15952/51/2088132452/54647/eee52c60/5a7c1223Nbff998a0.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t14776/341/2211679991/74299/5dd1be2f/5a7c1225Nd692f20d.jpg\" alt=\"\" class=\"fr-fin\"><img src=\"https://img10.360buyimg.com/imgzone/jfs/t16117/357/2058901614/228243/bc57a6a8/5a7c1227N0f74b4ed.jpg\" alt=\"\" class=\"fr-fin\"><!-- [192.168.0.1, 172.16.69.90, 127.0.0.1] --><br></p>', '1', '2018-04-08 11:28:26', '100', '0', '1036006', null, null, '1', null, 'http://p2n8ypmnw.bkt.clouddn.com/20180408/11281736533de7.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg', '0.01', null, '292', null, '热风 白鞋 男鞋', null, null, '0', '0', '0', '0.01', '1', '1', '2018-04-08 16:52:18', null, '1', '1');
INSERT INTO `nideshop_goods` VALUES ('20', null, '1010100', 'test', null, '111', 'test', null, '<p>test</p>', '1', '2018-04-09 13:58:34', '100', '0', null, null, null, '1', null, 'http://p2n8ypmnw.bkt.clouddn.com/20180409/135814879aa4ce.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1358183574d23e.jpg', '111.00', null, '294', null, 'test', null, null, '0', '0', '1', '111.00', '2', '2', '2018-04-09 13:59:57', null, '5', '2');
INSERT INTO `nideshop_goods` VALUES ('19', '1036033', 'L55M5-AZ', '小米（MI）电视 55英寸 4K 智能WiFi网络平板 智能语音 液晶电视机 标准版 4A（L55M5-AZ/AD）', '1046015', '999', null, null, '<p><br>    好电视，真听话<br>    <br>    在人工智能的时代，好电视机不仅是画质好性能好，还要足够懂你。有了聪明的人工智能语音，老人不再为找片发愁，小孩也不会缠着你给他找动画片，想看什么说出来，老人小孩都可以轻松找到自己想看的。<br>    <br>    4K超清屏<br>    <br>    人工智能语音<br>    <br>    2GB+8GB&nbsp;大存储<br>    <br>    PatchWall<br>    <br>    海量片源<br>    <br>    DOLBY+DTS<br>    <img src=\"//img30.360buyimg.com/sku/jfs/t4813/16/1886750508/3461/6c991934/58f57ccfNb3801c29.jpg\" alt=\"小米（MI）小米电视4A 标准版 55英寸 HDR 2GB+8GB 四核64位处理器 4K智能语音网络液晶平板电视（L55M5-AZ）-京东\" class=\"fr-fin\">    <img src=\"//img30.360buyimg.com/sku/jfs/t4558/107/2977273449/3436/308de914/58f57ccfN2115802a.jpg\" alt=\"小米（MI）小米电视4A 标准版 55英寸 HDR 2GB+8GB 四核64位处理器 4K智能语音网络液晶平板电视（L55M5-AZ）-京东\" class=\"fr-fin\">  <br>    人工智能语音<br>    <br>    爱学习的PatchWall<br>学会了听你的话<br>    <br>    （注：可支持语音搜索）<br>  <br>    想看什么想知道什么，告诉它<br>    <br>    影片推荐<br>    <br>    组合条件<br>    <br>    明星搜片<br>    <br>    多轮递进<br>    <br>    *识别明星脸<br>    <br>    播放控制<br>    <br>    天气查询<br>    <br>    影视百科<br>    <br>    \"我英语不好，给我推荐<br>几部美国电影吧\"<br>    <br>    \"给我推荐一些影片，我不想看<br>国外的，不想看恐怖片，更不要<br>付费的，要火的\"<br>    <br>    \"我想看胡歌的电视剧\"<br>\"不要古装的\"<br>\"跟靳东、王凯一起演的\"<br>    <br>    \"我想看小李子获得<br>奥斯卡的电影\"<br>    <br>    \"快进到第&nbsp;54&nbsp;分&nbsp;21&nbsp;秒\"<br>    <br>    \"邓超的老婆是谁\"<br>    <br>    \"北京今天天气怎么样\"<br>    <img src=\"//img30.360buyimg.com/sku/jfs/t4564/214/674479919/3686/f0aa591a/58d34b3eN6573866d.png\" alt=\"小米（MI）小米电视4A 标准版 55英寸 HDR 2GB+8GB 四核64位处理器 4K智能语音网络液晶平板电视（L55M5-AZ）-京东\" class=\"fr-fin\">    <br>    （注：可支持语音搜索）<br>  <img src=\"//img30.360buyimg.com/sku/jfs/t3253/98/9354255891/2724/472a919/58d34d14Nda56a5bb.png\" alt=\"小米（MI）小米电视4A 标准版 55英寸 HDR 2GB+8GB 四核64位处理器 4K智能语音网络液晶平板电视（L55M5-AZ）-京东\" class=\"fr-fin\">    <br>    计时关机<br>    <br>    \"10分钟后关机\"<br>  <br>    全新的影音体验<br>    <br>    细节多了，噪点少了<br>还有杜比音效和&nbsp;2&nbsp;项画质黑科技<br>    <br>    4K超高分辨率<br>    <br>    HDR／HLG<br>    <br>    第六代画质引擎<br>  <br>    &nbsp;&nbsp;&nbsp;画质黑科技“双子星”<br>暗的更暗，亮的更亮<br>    <br>    同步支持的&nbsp;HDR10&nbsp;和&nbsp;Hybrid&nbsp;Log-Gamma，提供了更多的动态范围和图像细节，使得暗部更暗，亮部更亮，让画面栩栩如生。<br>  <br>    第&nbsp;6&nbsp;代画质引擎<br>比上一代有&nbsp;4&nbsp;处升级<br>    <br>    优化锯齿<br>    <br>    提升明暗对比度<br>    <br>    动态降噪&nbsp;<br>    <br>    降低振铃<br>    <br>    增加方向滤波器，改善<br>图像放大产生的锯齿<br>    <br>    改善的&nbsp;DNLP&nbsp;算法，明暗<br>对比度更高，画面更通透<br>    <br>    将不重叠的噪波自动滤出，<br>画面更纯净细腻<br>    <br>    增加&nbsp;D-ring&nbsp;模块<br>降低振铃效果<br>    <img src=\"//img30.360buyimg.com/sku/jfs/t4522/238/684077637/12642/efeb5b01/58d355eeNada86d5e.png\" alt=\"小米（MI）小米电视4A 标准版 55英寸 HDR 2GB+8GB 四核64位处理器 4K智能语音网络液晶平板电视（L55M5-AZ）-京东\" class=\"fr-fin\">    <br>    内容持续增长<br>    <br>    大人老人小孩<br>每个人都能找到喜欢的内容<br>    <br>    64位处理器+超大存储<br>    <br>    装得下你爱的应用<br>更能满足你对速度的追求<br>    <br>    4&nbsp;核高性能&nbsp;CPU<br>    <br>    5&nbsp;核高性能&nbsp;GPU<br>    <br>    2GB&nbsp;DDR4&nbsp;高速内存<br>    <br>    8GB大闪存<br>    <br>    更酷的设计<br>    <br>    黑的漂亮的黑科技<br>    <br>    推荐电视机观看距离<br>    <br>    该距离为推荐观看距离，在实际观看中，<br>电视尺寸越大效果越好。<br>    <br>    43英寸<br>    <br>    48-50英寸<br>    <br>    55-60英寸<br>    <br>    65-70英寸<br>        <img src=\"//img30.360buyimg.com/sku/jfs/t3163/182/9604702943/229518/44cc4692/58d4de69N22615250.jpg\" alt=\"小米（MI）小米电视4A 标准版 55英寸 HDR 2GB+8GB 四核64位处理器 4K智能语音网络液晶平板电视（L55M5-AZ）-京东\" class=\"fr-fin\"><!-- 2018-03-13 08:29:00 --><br></p>', '1', '2018-04-08 15:41:32', '100', '0', '1036008', null, null, '1', null, 'http://p2n8ypmnw.bkt.clouddn.com/20180408/15375673764e1.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1538082839129.jpg', '2599.00', null, '293', null, null, null, null, '0', '0', '0', '2599.00', '6', '6', '2018-04-08 15:48:51', null, '1', '6');
INSERT INTO `nideshop_goods` VALUES ('21', '1036037', 'H&M00001', 'H&M男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '1046016', '999', null, null, '', '1', '2018-04-09 17:40:24', '100', '0', '1036009', null, null, '1', null, 'http://p2n8ypmnw.bkt.clouddn.com/20180409/17394836197d8.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/173950508d2ce2.jpg', '222.00', null, '295', null, null, null, null, '0', '0', '0', '222.00', '2', '2', '2018-04-09 17:48:11', null, '5', '2');
INSERT INTO `nideshop_goods` VALUES ('22', '1036038', 'H&M00001', 'H&M女装2018春季新款夹克韩版开衫上衣 卡其 M', '1046016', '333', null, null, '', '1', '2018-04-09 17:44:16', '100', '0', '1036009', null, null, '1', null, 'http://p2n8ypmnw.bkt.clouddn.com/20180409/174407230763db.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1744142767f750.jpg', '333.00', null, '296', null, null, null, null, '0', '0', '0', '333.00', '2', '2', '2018-04-09 17:47:55', null, '5', '2');
INSERT INTO `nideshop_goods` VALUES ('23', '1036037', 'H&M00002', 'H&M2018夏季新品男装短袖T恤男圆领修身弹力短袖男t恤4821330159 特白 17588AL', '1046016', '666', null, null, '', '1', '2018-04-09 17:45:34', '100', '0', '1036009', null, null, '1', null, 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1745278110c624.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/174532536a1ad9.jpg', '666.00', null, '297', null, null, null, null, '0', '0', '0', '666.00', '2', '2', '2018-04-09 17:47:39', null, '5', '2');
INSERT INTO `nideshop_goods` VALUES ('24', '1036038', 'H&M00004', 'H&M连衣裙', '1046016', '888', null, null, '', '1', '2018-04-09 17:47:18', '100', '0', '1036009', null, null, '1', null, 'http://p2n8ypmnw.bkt.clouddn.com/20180409/174656316dec5b.jpg', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1746597983c788.jpg', '888.00', null, '298', null, null, null, null, '0', '0', '0', '888.00', '2', '2', '2018-04-09 17:47:18', null, '5', '2');

-- ----------------------------
-- Table structure for nideshop_goods_attribute
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_goods_attribute`;
CREATE TABLE `nideshop_goods_attribute` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品Id',
  `attribute_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '属性Id',
  `value` text NOT NULL COMMENT '属性值',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `attr_id` (`attribute_id`)
) ENGINE=MyISAM AUTO_INCREMENT=872 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_goods_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for nideshop_goods_bargain
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_goods_bargain`;
CREATE TABLE `nideshop_goods_bargain` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '砍价大图',
  `item_pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '活动条例图片',
  `goods_id` int(11) NOT NULL,
  `sort_order` int(11) unsigned zerofill NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `assist_count` int(4) NOT NULL DEFAULT '0' COMMENT '最低拉取几人',
  KEY `topic_id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_goods_bargain
-- ----------------------------

-- ----------------------------
-- Table structure for nideshop_goods_crash
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_goods_crash`;
CREATE TABLE `nideshop_goods_crash` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) NOT NULL COMMENT '商品Id',
  `goods_crash_id` int(11) NOT NULL COMMENT '搭配商品Id',
  `product_crash_id` int(11) NOT NULL COMMENT '搭配产品Id',
  `retail_crash_price` decimal(10,2) NOT NULL COMMENT '搭配商品价格，需要小于原始价格',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=gbk COMMENT='商品搭配减';

-- ----------------------------
-- Records of nideshop_goods_crash
-- ----------------------------
INSERT INTO `nideshop_goods_crash` VALUES ('4', '10', '10', '284', '100.00');

-- ----------------------------
-- Table structure for nideshop_goods_gallery
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_goods_gallery`;
CREATE TABLE `nideshop_goods_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品id',
  `img_url` longblob COMMENT '图片',
  `img_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '描述',
  `sort_order` int(11) DEFAULT '5' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=819 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of nideshop_goods_gallery
-- ----------------------------
INSERT INTO `nideshop_goods_gallery` VALUES ('748', '13', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430322F31383234313738383836616364612E6A7067, '正面', '6');
INSERT INTO `nideshop_goods_gallery` VALUES ('749', '13', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430322F31383235323834363837366137392E6A7067, '细节图1', '5');
INSERT INTO `nideshop_goods_gallery` VALUES ('750', '13', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430322F31383235343839373035653939632E6A7067, '细节图2', '4');
INSERT INTO `nideshop_goods_gallery` VALUES ('751', '13', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430322F31383236303834373833633837662E6A7067, '背面', '3');
INSERT INTO `nideshop_goods_gallery` VALUES ('752', '13', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430322F31383236333938333962363366362E6A7067, '直面图', '2');
INSERT INTO `nideshop_goods_gallery` VALUES ('753', '13', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430322F31383236353831323565323665332E6A7067, '腰身细节', '1');
INSERT INTO `nideshop_goods_gallery` VALUES ('754', '12', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430322F31383238343439343834323430332E6A7067, '正面', '5');
INSERT INTO `nideshop_goods_gallery` VALUES ('755', '12', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430322F31383239313035343832646462332E6A7067, '侧面', '4');
INSERT INTO `nideshop_goods_gallery` VALUES ('756', '12', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430322F31383239333639363534366331372E6A7067, '全身图', '3');
INSERT INTO `nideshop_goods_gallery` VALUES ('757', '12', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430322F313833303135333063363662622E6A7067, '细节图', '2');
INSERT INTO `nideshop_goods_gallery` VALUES ('758', '12', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430322F31383330343238363030383933662E6A7067, '细节图', '1');
INSERT INTO `nideshop_goods_gallery` VALUES ('764', '14', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430322F31383032333033373831373530662E6A7067, '主图', '5');
INSERT INTO `nideshop_goods_gallery` VALUES ('765', '14', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430322F31383033313731393864303630322E6A7067, '背面图片', '4');
INSERT INTO `nideshop_goods_gallery` VALUES ('766', '14', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430322F31383034343236313064386261312E6A7067, '侧面', '3');
INSERT INTO `nideshop_goods_gallery` VALUES ('767', '14', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430322F31383035303639353039316430392E6A7067, '正面', '2');
INSERT INTO `nideshop_goods_gallery` VALUES ('768', '14', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430322F31383035333138323834663161612E6A7067, '斜身图', '1');
INSERT INTO `nideshop_goods_gallery` VALUES ('769', '10', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430322F31373338303435313932626164382E6A7067, '主图', '4');
INSERT INTO `nideshop_goods_gallery` VALUES ('770', '10', 0x68747470733A2F2F6D2E333630627579696D672E636F6D2F6E31322F73383238783832385F6A66732F74393630312F3130342F323037383436363731302F3232323237392F38646634626135312F35396565633037344E64396364663037312E6A7067217137302E6A7067, null, '3');
INSERT INTO `nideshop_goods_gallery` VALUES ('771', '10', 0x68747470733A2F2F6D2E333630627579696D672E636F6D2F6E31322F6A66732F7431303439322F3233382F323130313133383337352F3133353631312F64313838353866302F35396565633036334E36363138393330342E6A7067217137302E6A7067, null, '2');
INSERT INTO `nideshop_goods_gallery` VALUES ('772', '10', 0x68747470733A2F2F6D2E333630627579696D672E636F6D2F6E31322F6A66732F7431303034382F3237322F323039323838353736302F3135393939312F38316532623436622F35396565633038304E34396435613433632E6A7067217137302E6A7067, null, '1');
INSERT INTO `nideshop_goods_gallery` VALUES ('788', '16', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F31303435303233393732323764382E6A7067, null, '5');
INSERT INTO `nideshop_goods_gallery` VALUES ('789', '16', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F31303434353031303265663932622E6A7067, null, '4');
INSERT INTO `nideshop_goods_gallery` VALUES ('790', '16', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F31303434333638343261313338372E6A7067, null, '3');
INSERT INTO `nideshop_goods_gallery` VALUES ('791', '16', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F31303434323731323061353134662E6A7067, null, '2');
INSERT INTO `nideshop_goods_gallery` VALUES ('792', '16', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F31303434303038303461336263392E6A7067, null, '1');
INSERT INTO `nideshop_goods_gallery` VALUES ('793', '15', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F31303233343031323964626165372E6A7067, '主图', '5');
INSERT INTO `nideshop_goods_gallery` VALUES ('794', '15', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F313032343333383964333235322E6A7067, '效果图1', '4');
INSERT INTO `nideshop_goods_gallery` VALUES ('795', '15', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F31303235303432353936393230392E6A7067, '效果图2', '3');
INSERT INTO `nideshop_goods_gallery` VALUES ('796', '15', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F31303235323333313461663861392E6A7067, '效果图3', '2');
INSERT INTO `nideshop_goods_gallery` VALUES ('797', '15', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F31303235343336383031376363312E6A7067, '列表图', '1');
INSERT INTO `nideshop_goods_gallery` VALUES ('798', '17', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F31313230343534333636316361342E6A7067, null, '5');
INSERT INTO `nideshop_goods_gallery` VALUES ('799', '17', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F31313230353733373836323231372E6A7067, '', '4');
INSERT INTO `nideshop_goods_gallery` VALUES ('800', '17', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F31313231313136333636376638322E6A7067, null, '3');
INSERT INTO `nideshop_goods_gallery` VALUES ('801', '17', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F31313231323035383465663161302E6A7067, null, '2');
INSERT INTO `nideshop_goods_gallery` VALUES ('802', '17', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F313132313337313062366362352E6A7067, null, '1');
INSERT INTO `nideshop_goods_gallery` VALUES ('808', '19', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F31353539323832353764623937362E6A7067, '列表轮播图1', '6');
INSERT INTO `nideshop_goods_gallery` VALUES ('809', '19', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F31363032303739323936613532372E6A7067, null, '5');
INSERT INTO `nideshop_goods_gallery` VALUES ('810', '19', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F31363032323135353932653562302E6A7067, null, '4');
INSERT INTO `nideshop_goods_gallery` VALUES ('811', '19', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F31363032333436343532396262332E6A7067, null, '3');
INSERT INTO `nideshop_goods_gallery` VALUES ('812', '19', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F31363032353139383564626464662E6A7067, null, '2');
INSERT INTO `nideshop_goods_gallery` VALUES ('813', '19', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F31363033303535383239323232662E6A7067, null, '1');
INSERT INTO `nideshop_goods_gallery` VALUES ('814', '18', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F313133333030373832613931642E6A7067, null, '1');
INSERT INTO `nideshop_goods_gallery` VALUES ('815', '18', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F31313332343631363665633037362E6A7067, '', '2');
INSERT INTO `nideshop_goods_gallery` VALUES ('816', '18', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F31313332333138343939656633622E6A7067, null, '3');
INSERT INTO `nideshop_goods_gallery` VALUES ('817', '18', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F31313332313633343539346462662E6A7067, null, '4');
INSERT INTO `nideshop_goods_gallery` VALUES ('818', '18', 0x687474703A2F2F70326E3879706D6E772E626B742E636C6F7564646E2E636F6D2F32303138303430382F31313332303334313530333062622E6A7067, null, '5');

-- ----------------------------
-- Table structure for nideshop_goods_group
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_goods_group`;
CREATE TABLE `nideshop_goods_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '团购大图',
  `item_pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '活动条例图片',
  `read_count` int(11) DEFAULT NULL,
  `goods_id` int(11) NOT NULL,
  `sort_order` int(11) unsigned zerofill DEFAULT NULL,
  `subtitle` varchar(255) NOT NULL,
  KEY `topic_id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=316 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_goods_group
-- ----------------------------
INSERT INTO `nideshop_goods_group` VALUES ('315', '三人成团 优享春季女装爆款', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/10433089803889.jpg', null, '10', '00000011111', '优享春季女装爆款');

-- ----------------------------
-- Table structure for nideshop_goods_issue
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_goods_issue`;
CREATE TABLE `nideshop_goods_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(500) DEFAULT NULL,
  `answer` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_goods_issue
-- ----------------------------

-- ----------------------------
-- Table structure for nideshop_goods_specification
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_goods_specification`;
CREATE TABLE `nideshop_goods_specification` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0',
  `specification_id` int(11) unsigned NOT NULL DEFAULT '0',
  `value` varchar(50) DEFAULT '',
  `pic_url` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `specification_id` (`specification_id`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='商品对应规格表值表';

-- ----------------------------
-- Records of nideshop_goods_specification
-- ----------------------------
INSERT INTO `nideshop_goods_specification` VALUES ('23', '11', '2', '蓝色', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/11031793d57e7.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('22', '11', '4', '230g', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/110255442ba47c.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('17', '10', '2', '藏青色', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1049087396ffe1.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('18', '10', '1', 'M', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1049252797771d.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('19', '10', '1', 'xxL', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1050385433c3da.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('20', '10', '1', 'xL', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1050555892508a.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('21', '10', '2', '原色', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/105118578fb1c3.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('16', '10', '4', '350g', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/10385771316332.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('24', '11', '2', '蓝粉搭配', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1103394288811d.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('25', '11', '1', 'M', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1103547863d5b5.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('26', '11', '1', 'S', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1104116619003c.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('27', '11', '1', 'xL', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1106508545a71.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('28', '11', '1', 'XXL', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1107086554d615.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('41', '12', '1', 'L', null);
INSERT INTO `nideshop_goods_specification` VALUES ('42', '12', '1', 'XL', null);
INSERT INTO `nideshop_goods_specification` VALUES ('39', '12', '1', 'S', null);
INSERT INTO `nideshop_goods_specification` VALUES ('40', '12', '1', 'M', null);
INSERT INTO `nideshop_goods_specification` VALUES ('38', '12', '1', 'XS', null);
INSERT INTO `nideshop_goods_specification` VALUES ('37', '12', '2', '暗桔红', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/132147282b3c36.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('36', '12', '2', '白色', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/132114247cbe7d.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('43', '13', '2', '午夜黑', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/13341071877c28.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('44', '13', '1', 'XS', null);
INSERT INTO `nideshop_goods_specification` VALUES ('45', '13', '1', 'S', null);
INSERT INTO `nideshop_goods_specification` VALUES ('46', '13', '1', 'M', null);
INSERT INTO `nideshop_goods_specification` VALUES ('47', '13', '1', 'L', null);
INSERT INTO `nideshop_goods_specification` VALUES ('48', '13', '1', 'XL', null);
INSERT INTO `nideshop_goods_specification` VALUES ('49', '13', '1', 'XXL', null);
INSERT INTO `nideshop_goods_specification` VALUES ('50', '14', '2', '卡其', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1348143539f67f.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('51', '14', '2', '绿色', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1348463885c053.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('52', '14', '2', '白色', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1349014082b9e0.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('53', '14', '1', 'S', null);
INSERT INTO `nideshop_goods_specification` VALUES ('54', '14', '1', 'M', null);
INSERT INTO `nideshop_goods_specification` VALUES ('55', '14', '1', 'L', null);
INSERT INTO `nideshop_goods_specification` VALUES ('56', '14', '1', 'XL', null);
INSERT INTO `nideshop_goods_specification` VALUES ('57', '14', '1', 'XXL', null);
INSERT INTO `nideshop_goods_specification` VALUES ('58', '15', '2', '天空蓝', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1017164464c64c.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('59', '15', '2', '牛仔蓝', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/101838396e0ab3.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('60', '15', '2', '藏蓝色', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1019522303a029.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('61', '15', '1', 'S(165/88A)', null);
INSERT INTO `nideshop_goods_specification` VALUES ('62', '15', '1', 'M(170/92A)', null);
INSERT INTO `nideshop_goods_specification` VALUES ('63', '15', '1', 'L(175/96A)', null);
INSERT INTO `nideshop_goods_specification` VALUES ('64', '15', '1', 'XL(180/100A)', null);
INSERT INTO `nideshop_goods_specification` VALUES ('65', '15', '1', 'XXL(185/104A)', null);
INSERT INTO `nideshop_goods_specification` VALUES ('66', '16', '2', '白色', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/103820177045bd.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('67', '16', '2', '杏色', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/104132276120db.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('68', '16', '1', '165/80A/S', null);
INSERT INTO `nideshop_goods_specification` VALUES ('69', '16', '1', '170/84A/M', null);
INSERT INTO `nideshop_goods_specification` VALUES ('70', '16', '1', '175/88A/L', null);
INSERT INTO `nideshop_goods_specification` VALUES ('71', '16', '1', '180/92A/XL', null);
INSERT INTO `nideshop_goods_specification` VALUES ('72', '16', '1', '185/96A/XXL', null);
INSERT INTO `nideshop_goods_specification` VALUES ('73', '17', '2', '灰蓝色西裤', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1119115619942c.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('74', '17', '1', '44', null);
INSERT INTO `nideshop_goods_specification` VALUES ('75', '17', '1', '46', null);
INSERT INTO `nideshop_goods_specification` VALUES ('76', '17', '1', '48', null);
INSERT INTO `nideshop_goods_specification` VALUES ('77', '17', '1', '50', null);
INSERT INTO `nideshop_goods_specification` VALUES ('78', '17', '1', '52', null);
INSERT INTO `nideshop_goods_specification` VALUES ('79', '17', '1', '54', null);
INSERT INTO `nideshop_goods_specification` VALUES ('80', '18', '2', '04白色', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1130044777a736.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('81', '18', '1', '38偏大一码', null);
INSERT INTO `nideshop_goods_specification` VALUES ('82', '18', '1', '39偏大一码', null);
INSERT INTO `nideshop_goods_specification` VALUES ('83', '18', '1', '40', null);
INSERT INTO `nideshop_goods_specification` VALUES ('84', '18', '1', '41偏大一码', null);
INSERT INTO `nideshop_goods_specification` VALUES ('85', '18', '1', '42偏大一码', null);
INSERT INTO `nideshop_goods_specification` VALUES ('86', '18', '1', '43偏大一码', null);
INSERT INTO `nideshop_goods_specification` VALUES ('87', '18', '1', '44偏大一码', null);
INSERT INTO `nideshop_goods_specification` VALUES ('88', '19', '9', '55英寸', null);
INSERT INTO `nideshop_goods_specification` VALUES ('89', '19', '8', '亚光黑', null);
INSERT INTO `nideshop_goods_specification` VALUES ('90', '19', '11', '14.2kg', null);
INSERT INTO `nideshop_goods_specification` VALUES ('91', '21', '12', '白色', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1741113751a2df.jpg');
INSERT INTO `nideshop_goods_specification` VALUES ('92', '21', '13', '38', null);
INSERT INTO `nideshop_goods_specification` VALUES ('93', '21', '13', '39', null);
INSERT INTO `nideshop_goods_specification` VALUES ('94', '21', '13', '40', null);
INSERT INTO `nideshop_goods_specification` VALUES ('95', '21', '13', '41', null);

-- ----------------------------
-- Table structure for nideshop_keywords
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_keywords`;
CREATE TABLE `nideshop_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '热销',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '默认',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '显示',
  `sort_order` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `scheme_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '关键词的跳转链接',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '类型',
  `identify` bigint(20) DEFAULT NULL COMMENT '标识索引备注',
  `sys_user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='热闹关键词表';

-- ----------------------------
-- Records of nideshop_keywords
-- ----------------------------
INSERT INTO `nideshop_keywords` VALUES ('1', '青春', '1', '1', '1', '100', '', '0', null, null);

-- ----------------------------
-- Table structure for nideshop_order
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_order`;
CREATE TABLE `nideshop_order` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(32) DEFAULT '',
  `user_id` mediumint(8) unsigned DEFAULT '0',
  `order_status` int(3) unsigned DEFAULT '0',
  `shipping_status` tinyint(1) unsigned DEFAULT '0',
  `pay_status` tinyint(1) unsigned DEFAULT '0',
  `consignee` varchar(60) DEFAULT '',
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT '',
  `mobile` varchar(60) DEFAULT '',
  `postscript` varchar(255) DEFAULT '',
  `shipping_id` tinyint(3) DEFAULT '0',
  `shipping_name` varchar(120) DEFAULT '',
  `pay_id` varchar(64) DEFAULT '0',
  `pay_name` varchar(120) DEFAULT '',
  `shipping_fee` decimal(10,2) DEFAULT '0.00',
  `actual_price` decimal(10,2) DEFAULT '0.00' COMMENT '实际需要支付的金额',
  `integral` int(10) unsigned DEFAULT '0',
  `integral_money` decimal(10,2) DEFAULT '0.00',
  `order_price` decimal(10,2) DEFAULT '0.00' COMMENT '订单总价',
  `goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品总价',
  `add_time` datetime DEFAULT NULL,
  `confirm_time` datetime DEFAULT NULL,
  `pay_time` datetime DEFAULT NULL,
  `freight_price` int(10) unsigned DEFAULT '0' COMMENT '配送费用',
  `coupon_id` mediumint(8) unsigned DEFAULT '0' COMMENT '使用的优惠券id',
  `parent_id` mediumint(8) unsigned DEFAULT '0',
  `coupon_price` decimal(10,2) DEFAULT NULL,
  `callback_status` enum('true','false') DEFAULT 'true',
  `shipping_no` varchar(32) DEFAULT NULL,
  `full_cut_price` decimal(10,2) DEFAULT NULL,
  `order_type` varchar(1) DEFAULT NULL,
  `store_id` bigint(11) DEFAULT NULL COMMENT '多店铺id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`),
  KEY `user_id` (`user_id`),
  KEY `order_status` (`order_status`),
  KEY `shipping_status` (`shipping_status`),
  KEY `pay_status` (`pay_status`),
  KEY `shipping_id` (`shipping_id`),
  KEY `pay_id` (`pay_id`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_order
-- ----------------------------
INSERT INTO `nideshop_order` VALUES ('66', '20180404141440032070264', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, null, null, '0.00', '299.00', '0', '0.00', '299.00', '299.00', '2018-04-04 14:14:40', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('67', '20180404142532718847594', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, null, null, '0.00', '255.00', '0', '0.00', '255.00', '255.00', '2018-04-04 14:25:33', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('68', '20180404143058414369751', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, null, null, '0.00', '255.00', '0', '0.00', '255.00', '255.00', '2018-04-04 14:30:58', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('69', '20180404150253183335227', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, null, null, '0.00', '89.00', '0', '0.00', '89.00', '89.00', '2018-04-04 15:02:53', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('70', '20180404153719217356768', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, null, null, '0.00', '255.00', '0', '0.00', '255.00', '255.00', '2018-04-04 15:37:19', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('71', '20180404153935964734397', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, null, null, '0.00', '138.88', '0', '0.00', '138.88', '138.88', '2018-04-04 15:39:36', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('72', '20180404164208596286265', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, null, null, '0.00', '255.00', '0', '0.00', '255.00', '255.00', '2018-04-04 16:42:09', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('73', '20180404164448217009993', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, null, null, '0.00', '89.00', '0', '0.00', '89.00', '89.00', '2018-04-04 16:44:48', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('74', '20180404170420332457683', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, null, null, '0.00', '89.00', '0', '0.00', '89.00', '89.00', '2018-04-04 17:04:20', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('75', '20180404171620793017468', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, null, null, '0.00', '89.00', '0', '0.00', '89.00', '89.00', '2018-04-04 17:16:21', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('76', '20180404174941159054973', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, null, null, '0.00', '255.00', '0', '0.00', '255.00', '255.00', '2018-04-04 17:49:41', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('77', '20180404175629198438987', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, null, null, '0.00', '138.88', '0', '0.00', '138.88', '138.88', '2018-04-04 17:56:29', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('78', '20180404182546937019342', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, null, null, '0.00', '138.88', '0', '0.00', '138.88', '138.88', '2018-04-04 18:25:47', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('79', '20180404183618447696830', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, null, null, '0.00', '138.88', '0', '0.00', '138.88', '138.88', '2018-04-04 18:36:18', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('80', '20180408090636819554256', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, null, null, '0.00', '89.00', '0', '0.00', '89.00', '89.00', '2018-04-08 09:06:37', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('81', '20180408091232320333989', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, null, null, '0.00', '255.00', '0', '0.00', '255.00', '255.00', '2018-04-08 09:12:32', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('82', '20180408092646926302087', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, null, null, '0.00', '255.00', '0', '0.00', '255.00', '255.00', '2018-04-08 09:26:47', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('83', '20180408092918913205239', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, null, null, '0.00', '255.00', '0', '0.00', '255.00', '255.00', '2018-04-08 09:29:19', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('84', '20180408092938962711636', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '2018-04-08 09:29:39', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('85', '20180408093100896871265', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, null, null, '0.00', '255.00', '0', '0.00', '255.00', '255.00', '2018-04-08 09:31:01', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('86', '20180408093132745453456', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, null, null, '0.00', '199.00', '0', '0.00', '199.00', '199.00', '2018-04-08 09:31:33', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('87', '20180408093419688860226', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, null, null, '0.00', '299.00', '0', '0.00', '299.00', '299.00', '2018-04-08 09:34:20', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('88', '20180408093500809214733', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, null, null, '0.00', '138.88', '0', '0.00', '138.88', '138.88', '2018-04-08 09:35:01', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('89', '20180408093755292138443', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, null, null, '0.00', '267.00', '0', '0.00', '267.00', '267.00', '2018-04-08 09:37:59', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('90', '20180408100316558384256', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '2018-04-08 10:03:17', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('91', '20180408100328214842699', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '2018-04-08 10:03:28', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('92', '20180408100524868974267', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '2018-04-08 10:05:25', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('93', '20180408100558771175660', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, null, null, '0.00', '138.88', '0', '0.00', '138.88', '138.88', '2018-04-08 10:05:59', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('94', '20180408100717913187968', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, null, null, '0.00', '89.00', '0', '0.00', '89.00', '89.00', '2018-04-08 10:07:18', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('95', '20180408100752008398355', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, null, null, '0.00', '89.00', '0', '0.00', '89.00', '89.00', '2018-04-08 10:07:52', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('96', '20180408100815822646178', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, null, null, '0.00', '138.88', '0', '0.00', '138.88', '138.88', '2018-04-08 10:08:16', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('97', '20180408101111677110036', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, null, null, '0.00', '277.76', '0', '0.00', '277.76', '277.76', '2018-04-08 10:11:12', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('98', '20180408101250532775570', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, 'wx08101315086733da43dacef30383841254', null, '0.00', '89.00', '0', '0.00', '89.00', '89.00', '2018-04-08 10:12:51', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('99', '20180408101458829261216', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, null, null, '0.00', '138.88', '0', '0.00', '138.88', '138.88', '2018-04-08 10:14:59', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('100', '20180408101522156083277', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, null, null, '0.00', '255.00', '0', '0.00', '255.00', '255.00', '2018-04-08 10:15:22', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('101', '20180408101550658709534', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, null, null, '0.00', '199.00', '0', '0.00', '199.00', '199.00', '2018-04-08 10:15:51', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('102', '20180408101628309370457', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, null, null, '0.00', '255.00', '0', '0.00', '255.00', '255.00', '2018-04-08 10:16:28', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('103', '20180408101904934438007', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, 'wx08102025435694821f11c40b2224969618', null, '0.00', '89.00', '0', '0.00', '89.00', '89.00', '2018-04-08 10:19:05', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('104', '20180408102157684583663', '35', '101', '0', '0', '1111zcl', null, '北京市', '朝阳区', '', 'wsdsdqwdq', '12345678952', null, '0', null, null, null, '0.00', '89.00', '0', '0.00', '89.00', '89.00', '2018-04-08 10:21:58', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('105', '20180408102315679542363', '35', '101', '0', '0', '1111zcl', null, '北京市', '朝阳区', '', 'wsdsdqwdq', '12345678952', null, '0', null, null, null, '0.00', '138.88', '0', '0.00', '138.88', '138.88', '2018-04-08 10:23:16', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('106', '20180408104205637011069', '35', '101', '0', '0', '1111zcl', null, '北京市', '朝阳区', '', 'wsdsdqwdq', '12345678952', null, '0', null, null, null, '0.00', '227.88', '0', '0.00', '227.88', '227.88', '2018-04-08 10:42:06', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('107', '20180408105206325822467', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, null, null, '0.00', '89.00', '0', '0.00', '89.00', '89.00', '2018-04-08 10:52:06', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('108', '20180408110024951956602', '37', '101', '0', '0', '1111', null, '山西省', '阳泉市', '郊区', '11111', '17601232521', null, '0', null, null, null, '0.00', '861.64', '0', '0.00', '861.64', '861.64', '2018-04-08 11:00:25', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('109', '20180408113521985584737', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, null, null, '0.00', '249.00', '0', '0.00', '249.00', '249.00', '2018-04-08 11:35:22', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('110', '20180408151916921215466', '37', '101', '0', '0', '1111', null, '山西省', '阳泉市', '郊区', '11111', '17601232521', null, '0', null, null, null, '0.00', '217.88', '0', '0.00', '217.88', '217.88', '2018-04-08 15:19:17', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('111', '20180408152555403525568', '37', '101', '0', '0', '1111', null, '山西省', '阳泉市', '郊区', '11111', '17601232521', null, '0', null, null, null, '0.00', '249.00', '0', '0.00', '249.00', '249.00', '2018-04-08 15:25:55', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('112', '20180408152809740223629', '37', '101', '0', '0', '1111', null, '山西省', '阳泉市', '郊区', '11111', '17601232521', null, '0', null, null, null, '0.00', '139.00', '0', '0.00', '139.00', '139.00', '2018-04-08 15:28:10', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('113', '20180408152858420720164', '37', '101', '0', '0', '1111', null, '山西省', '阳泉市', '郊区', '11111', '17601232521', null, '0', null, 'wx0815285895652361f09ad2cb4290403958', null, '0.00', '1180.00', '0', '0.00', '1180.00', '1180.00', '2018-04-08 15:28:58', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('114', '20180408152919713074389', '37', '101', '0', '0', '1111', null, '山西省', '阳泉市', '郊区', '11111', '17601232521', null, '0', null, 'wx081529272781938e055b6b8a1709025234', null, '0.00', '139.00', '0', '0.00', '139.00', '139.00', '2018-04-08 15:29:20', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('115', '20180408152937822274748', '37', '101', '0', '0', '1111', null, '山西省', '阳泉市', '郊区', '11111', '17601232521', null, '0', null, 'wx08152938405685518a6afea53082918031', null, '0.00', '79.00', '0', '0.00', '79.00', '79.00', '2018-04-08 15:29:38', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('116', '20180408152952764843666', '37', '101', '0', '0', '1111', null, '山西省', '阳泉市', '郊区', '11111', '17601232521', null, '0', null, 'wx08152953327089e895a3482e3400749671', null, '0.00', '249.00', '0', '0.00', '249.00', '249.00', '2018-04-08 15:29:53', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('117', '20180408154751116126883', '40', '101', '0', '0', '11', null, '北京市', '东城区', '', '222', '17601232521', null, '0', null, 'wx081547526096221c2a7acd981913825001', null, '0.00', '139.00', '0', '0.00', '139.00', '139.00', '2018-04-08 15:47:51', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('118', '20180408154826057332015', '40', '101', '0', '0', '11', null, '北京市', '东城区', '', '222', '17601232521', null, '0', null, 'wx081548266347031b4639c0071967277732', null, '0.00', '79.00', '0', '0.00', '79.00', '79.00', '2018-04-08 15:48:26', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('119', '20180408160605988689628', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, 'wx08160610957147beffdb6c3e0329157751', null, '0.00', '199.00', '0', '0.00', '199.00', '199.00', '2018-04-08 16:06:06', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('120', '20180408162440530552152', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, 'wx0816244172512510a4a7643a2603985199', null, '0.00', '139.00', '0', '0.00', '139.00', '139.00', '2018-04-08 16:24:41', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('121', '20180408164912275712662', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, 'wx081649180379011d50e9f89c0775494635', null, '0.00', '2599.00', '0', '0.00', '2599.00', '2599.00', '2018-04-08 16:49:12', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('122', '20180408164931377390518', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, 'wx0816493222152917474f04102266300618', null, '0.00', '199.00', '0', '0.00', '199.00', '199.00', '2018-04-08 16:49:31', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('123', '20180408165107303529072', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, 'wx08165108409703ae500381e63222813794', null, '0.00', '89.00', '0', '0.00', '89.00', '89.00', '2018-04-08 16:51:07', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('124', '20180408165305421649209', '36', '300', '1', '2', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '91', '亚马逊物流', 'wx08165306428878966149606e0000944718', null, '0.00', '0.01', '0', '0.00', '0.01', '0.01', '2018-04-08 16:53:05', null, null, '0', '0', null, '0.00', null, '1010101111', null, null, '1');
INSERT INTO `nideshop_order` VALUES ('125', '20180408171316106279677', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, 'wx081713171752993119016cad1233545256', null, '0.00', '0.01', '0', '0.00', '0.01', '0.01', '2018-04-08 17:13:16', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('126', '20180408171626928077128', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, 'wx081716279753695bee742d2f1903543044', null, '0.00', '0.01', '0', '0.00', '0.01', '0.01', '2018-04-08 17:16:27', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('127', '20180408173703577597256', '36', '300', '1', '2', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '1', '安捷快递', 'wx08173704820123819479fb160614276603', null, '0.00', '0.01', '0', '0.00', '0.01', '0.01', '2018-04-08 17:37:04', null, '2018-04-08 17:38:57', '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('128', '20180409113236548338119', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, 'wx091132436260332ae4f843d73056938222', null, '0.00', '199.00', '0', '0.00', '199.00', '199.00', '2018-04-09 11:32:37', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('129', '20180409113300689294553', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, null, null, '0.00', '0.00', '0', '0.00', '0.00', '0.00', '2018-04-09 11:33:01', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('130', '20180409113351084144098', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, 'wx09113406974010eb38dc805e1884034993', null, '0.00', '1180.00', '0', '0.00', '1180.00', '1180.00', '2018-04-09 11:33:51', null, '2018-04-09 11:34:10', '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('131', '20180409160703669119023', '35', '300', '1', '2', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '91', '亚马逊物流', 'wx091607057537090e749a57e42846661909', null, '0.00', '0.01', '0', '0.00', '0.01', '0.01', '2018-04-09 16:07:04', null, '2018-04-09 16:07:39', '0', '0', null, '0.00', null, '77998855', null, null, '1');
INSERT INTO `nideshop_order` VALUES ('132', '20180409161127512646383', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, null, null, '0.00', '0.01', '0', '0.00', '0.01', '0.01', '2018-04-09 16:11:28', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('133', '20180409161852863772029', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, null, null, '0.00', '0.01', '0', '0.00', '0.01', '0.01', '2018-04-09 16:18:53', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('134', '20180409164742923698639', '36', '201', '0', '2', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, 'wx0916474499575301285806d81960577227', null, '0.00', '0.01', '0', '0.00', '0.01', '0.01', '2018-04-09 16:47:43', null, '2018-04-09 16:48:26', '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('135', '20180409164910599328022', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, null, null, '0.00', '2599.00', '0', '0.00', '2599.00', '2599.00', '2018-04-09 16:49:11', null, null, '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('136', '20180410154402215018683', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, 'wx101544042970053b9c93bf403425383080', null, '0.00', '1180.00', '0', '0.00', '1180.00', '1180.00', '2018-04-10 15:44:02', null, '2018-04-10 15:44:17', '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('137', '20180410174012218440372', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, 'wx10174015479270e76c6c3c7d3609178459', null, '0.00', '0.01', '0', '0.00', '0.01', '0.01', '2018-04-10 17:13:12', null, '2018-04-10 17:40:17', '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('138', '20180416093932423279794', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, 'wx160939342240833d66ada5ab0817474811', null, '0.00', '158.01', '0', '0.00', '158.01', '158.01', '2018-04-16 09:39:32', null, '2018-04-16 09:39:37', '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('139', '20180416100306574050612', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, 'wx161003074427836da2ad5a5a3902987196', null, '0.00', '0.01', '0', '0.00', '0.01', '0.01', '2018-04-16 10:03:07', null, '2018-04-16 10:03:08', '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('140', '20180416100306600681982', '36', '101', '0', '0', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '0', null, 'wx16100307454092187e17a0e83522015530', null, '0.00', '0.01', '0', '0.00', '0.01', '0.01', '2018-04-16 10:03:07', null, '2018-04-16 10:03:11', '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('141', '20180417111939122094904', '35', '201', '0', '2', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, 'wx17111941397501a4e40e69b70668104444', null, '0.00', '0.01', '0', '0.00', '0.01', '0.01', '2018-04-17 11:19:39', null, '2018-04-17 11:20:03', '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('142', '20180420114918700030626', '35', '101', '0', '0', '1111zcl', null, '北京市', '朝阳区', '', 'wsdsdqwdq', '12345678952', null, '0', null, 'wx2011492006992794f112b20e4283030080', null, '0.00', '2599.01', '0', '0.00', '2599.01', '2599.01', '2018-04-20 11:49:19', null, '2018-04-20 11:49:25', '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('143', '20180420114931238470619', '35', '402', '2', '2', '1111zcl', null, '北京市', '朝阳区', '', 'wsdsdqwdq', '12345678952', null, '88', '中通速递', 'wx2011493153223550936efa953111155334', null, '0.00', '0.01', '0', '0.00', '0.01', '0.01', '2018-04-20 11:49:31', '2018-04-20 11:52:48', '2018-04-20 11:49:39', '0', '0', null, '0.00', null, '12121111111', null, null, '1');
INSERT INTO `nideshop_order` VALUES ('144', '20180420115036721195300', '36', '402', '2', '2', '孙雪明', null, '上海市', '闵行区', '', '中春路明谷科技园', '18888888888', null, '74', '韵达快递', 'wx201154092183054d91c80f934224994167', null, '0.00', '0.01', '0', '0.00', '0.01', '0.01', '2018-04-20 11:50:37', '2018-04-20 11:58:02', '2018-04-20 11:54:17', '0', '0', null, '0.00', null, '131131313131', null, null, '1');
INSERT INTO `nideshop_order` VALUES ('145', '20180420183658637258098', '35', '201', '0', '2', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, 'wx2018365909131861cdc8f2633577614717', null, '0.00', '0.01', '0', '0.00', '0.01', '0.01', '2018-04-20 18:36:59', null, '2018-04-20 18:37:13', '0', '0', null, '0.00', null, null, null, null, '1');
INSERT INTO `nideshop_order` VALUES ('146', '20180420195235140369117', '35', '101', '0', '0', 'zcl', null, '上海市', '闵行区', '', '中春路地铁站2号口', '18999999999', null, '0', null, 'wx2019523541919567426830ba2763703785', null, '0.00', '0.01', '0', '0.00', '0.01', '0.01', '2018-04-20 19:52:35', null, '2018-04-20 19:52:42', '0', '0', null, '0.00', null, null, null, null, '1');

-- ----------------------------
-- Table structure for nideshop_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_order_goods`;
CREATE TABLE `nideshop_order_goods` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '订单Id',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(120) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_sn` varchar(60) NOT NULL DEFAULT '' COMMENT '商品序列号',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '产品Id',
  `number` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '商品数量',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `retail_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '零售价格',
  `goods_specifition_name_value` text COMMENT '商品规格详情',
  `is_real` tinyint(1) unsigned DEFAULT '0' COMMENT '虚拟商品',
  `goods_specifition_ids` varchar(255) DEFAULT '' COMMENT '商品规格Ids',
  `list_pic_url` varchar(255) DEFAULT '' COMMENT '图片链接',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_order_goods
-- ----------------------------
INSERT INTO `nideshop_order_goods` VALUES ('80', '66', '11', '芊蕊 休闲套装女新款牛仔外套女初高中学生少女春秋装新款休闲套装牛仔两件套 白色 M', '10002', '285', '1', '299.00', '299.00', 'S　蓝色　230g', null, '26_23_22', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/11013894ba1fb.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('81', '67', '12', 'xzoo连衣裙长袖2018春季新款时尚修身两件套装V领蕾丝A字沙滩裙子', '10003', '286', '1', '255.00', '255.00', 'S　暗桔红', null, '39_37', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1258048908b5f5.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('82', '68', '12', 'xzoo连衣裙长袖2018春季新款时尚修身两件套装V领蕾丝A字沙滩裙子', '10003', '286', '1', '255.00', '255.00', 'XL　暗桔红', null, '42_37', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1258048908b5f5.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('83', '69', '13', '熙世界自然腰九分裤女2018夏装新款直筒裤简约休闲裤子女103LK020', '10004', '287', '1', '89.00', '89.00', 'M　午夜黑', null, '46_43', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135851122bfbcf.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('84', '70', '12', 'xzoo连衣裙长袖2018春季新款时尚修身两件套装V领蕾丝A字沙滩裙子', '10003', '286', '1', '255.00', '255.00', 'L　暗桔红', null, '41_37', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1258048908b5f5.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('85', '71', '14', '单蜜短外套女装2018春季新款夹克韩版开衫上衣 卡其 M', '10005', '288', '1', '138.88', '138.88', 'L　卡其', null, '55_50', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135917348f898a.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('86', '72', '12', 'xzoo连衣裙长袖2018春季新款时尚修身两件套装V领蕾丝A字沙滩裙子', '10003', '286', '1', '255.00', '255.00', 'L　暗桔红', null, '41_37', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1258048908b5f5.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('87', '73', '13', '熙世界自然腰九分裤女2018夏装新款直筒裤简约休闲裤子女103LK020', '10004', '287', '1', '89.00', '89.00', 'L　午夜黑', null, '47_43', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135851122bfbcf.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('88', '74', '13', '熙世界自然腰九分裤女2018夏装新款直筒裤简约休闲裤子女103LK020', '10004', '287', '1', '89.00', '89.00', 'M　午夜黑', null, '46_43', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135851122bfbcf.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('89', '75', '13', '熙世界自然腰九分裤女2018夏装新款直筒裤简约休闲裤子女103LK020', '10004', '287', '1', '89.00', '89.00', 'M　午夜黑', null, '46_43', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135851122bfbcf.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('90', '76', '12', 'xzoo连衣裙长袖2018春季新款时尚修身两件套装V领蕾丝A字沙滩裙子', '10003', '286', '1', '255.00', '255.00', 'L　暗桔红', null, '41_37', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1258048908b5f5.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('91', '77', '14', '单蜜短外套女装2018春季新款夹克韩版开衫上衣 卡其 M', '10005', '288', '1', '138.88', '138.88', 'M　卡其', null, '54_50', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135917348f898a.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('92', '78', '14', '单蜜短外套女装2018春季新款夹克韩版开衫上衣 卡其 M', '10005', '288', '1', '138.88', '138.88', 'XL　卡其', null, '56_50', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135917348f898a.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('93', '79', '14', '单蜜短外套女装2018春季新款夹克韩版开衫上衣 卡其 M', '10005', '288', '1', '138.88', '138.88', 'S　卡其', null, '53_50', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135917348f898a.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('94', '80', '13', '熙世界自然腰九分裤女2018夏装新款直筒裤简约休闲裤子女103LK020', '10004', '287', '1', '89.00', '89.00', 'XS　午夜黑', null, '44_43', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135851122bfbcf.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('95', '81', '12', 'xzoo连衣裙长袖2018春季新款时尚修身两件套装V领蕾丝A字沙滩裙子', '10003', '286', '1', '255.00', '255.00', 'L　白色', null, '41_36', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1258048908b5f5.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('96', '82', '12', 'xzoo连衣裙长袖2018春季新款时尚修身两件套装V领蕾丝A字沙滩裙子', '10003', '286', '1', '255.00', '255.00', 'L　暗桔红', null, '41_37', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1258048908b5f5.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('97', '83', '12', 'xzoo连衣裙长袖2018春季新款时尚修身两件套装V领蕾丝A字沙滩裙子', '10003', '286', '1', '255.00', '255.00', 'XS　暗桔红', null, '38_37', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1258048908b5f5.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('98', '85', '12', 'xzoo连衣裙长袖2018春季新款时尚修身两件套装V领蕾丝A字沙滩裙子', '10003', '286', '1', '255.00', '255.00', 'XS　白色', null, '38_36', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1258048908b5f5.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('99', '86', '10', '纳斯鲁 短外套女2018年春季新款女装韩版修身时尚优雅短外套 图片色 M', '10001', '284', '1', '199.00', '199.00', 'xL　原色　350g', null, '20_21_16', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/10355283613063.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('100', '87', '11', '芊蕊 休闲套装女新款牛仔外套女初高中学生少女春秋装新款休闲套装牛仔两件套 白色 M', '10002', '285', '1', '299.00', '299.00', 'xL　蓝色　230g', null, '27_23_22', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/11013894ba1fb.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('101', '88', '14', '单蜜短外套女装2018春季新款夹克韩版开衫上衣 卡其 M', '10005', '288', '1', '138.88', '138.88', 'S　卡其', null, '53_50', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135917348f898a.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('102', '89', '13', '熙世界自然腰九分裤女2018夏装新款直筒裤简约休闲裤子女103LK020', '10004', '287', '3', '89.00', '89.00', 'XS　午夜黑', null, '44_43', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135851122bfbcf.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('103', '93', '14', '单蜜短外套女装2018春季新款夹克韩版开衫上衣 卡其 M', '10005', '288', '1', '138.88', '138.88', 'XL　白色', null, '56_52', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135917348f898a.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('104', '94', '13', '熙世界自然腰九分裤女2018夏装新款直筒裤简约休闲裤子女103LK020', '10004', '287', '1', '89.00', '89.00', 'XXL　午夜黑', null, '49_43', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135851122bfbcf.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('105', '95', '13', '熙世界自然腰九分裤女2018夏装新款直筒裤简约休闲裤子女103LK020', '10004', '287', '1', '89.00', '89.00', 'XS　午夜黑', null, '44_43', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135851122bfbcf.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('106', '96', '14', '单蜜短外套女装2018春季新款夹克韩版开衫上衣 卡其 M', '10005', '288', '1', '138.88', '138.88', 'S　卡其', null, '53_50', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135917348f898a.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('107', '97', '14', '单蜜短外套女装2018春季新款夹克韩版开衫上衣 卡其 M', '10005', '288', '2', '138.88', '138.88', 'S　卡其', null, '53_50', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135917348f898a.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('108', '98', '13', '熙世界自然腰九分裤女2018夏装新款直筒裤简约休闲裤子女103LK020', '10004', '287', '1', '89.00', '89.00', 'XS　午夜黑', null, '44_43', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135851122bfbcf.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('109', '99', '14', '单蜜短外套女装2018春季新款夹克韩版开衫上衣 卡其 M', '10005', '288', '1', '138.88', '138.88', 'XXL　绿色', null, '57_51', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135917348f898a.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('110', '100', '12', 'xzoo连衣裙长袖2018春季新款时尚修身两件套装V领蕾丝A字沙滩裙子', '10003', '286', '1', '255.00', '255.00', 'XS　白色', null, '38_36', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1258048908b5f5.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('111', '101', '10', '纳斯鲁 短外套女2018年春季新款女装韩版修身时尚优雅短外套 图片色 M', '10001', '284', '1', '199.00', '199.00', 'M　藏青色　350g', null, '18_17_16', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/10355283613063.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('112', '102', '12', 'xzoo连衣裙长袖2018春季新款时尚修身两件套装V领蕾丝A字沙滩裙子', '10003', '286', '1', '255.00', '255.00', 'L　暗桔红', null, '41_37', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1258048908b5f5.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('113', '103', '13', '熙世界自然腰九分裤女2018夏装新款直筒裤简约休闲裤子女103LK020', '10004', '287', '1', '89.00', '89.00', 'XS　午夜黑', null, '44_43', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135851122bfbcf.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('114', '104', '13', '熙世界自然腰九分裤女2018夏装新款直筒裤简约休闲裤子女103LK020', '10004', '287', '1', '89.00', '89.00', 'XS　午夜黑', null, '44_43', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135851122bfbcf.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('115', '105', '14', '单蜜短外套女装2018春季新款夹克韩版开衫上衣 卡其 M', '10005', '288', '1', '138.88', '138.88', 'XL　绿色', null, '56_51', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135917348f898a.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('116', '106', '14', '单蜜短外套女装2018春季新款夹克韩版开衫上衣 卡其 M', '10005', '288', '1', '138.88', '138.88', 'S　卡其', null, '53_50', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135917348f898a.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('117', '106', '13', '熙世界自然腰九分裤女2018夏装新款直筒裤简约休闲裤子女103LK020', '10004', '287', '1', '89.00', '89.00', 'XS　午夜黑', null, '44_43', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135851122bfbcf.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('118', '107', '13', '熙世界自然腰九分裤女2018夏装新款直筒裤简约休闲裤子女103LK020', '10004', '287', '1', '89.00', '89.00', 'L　午夜黑', null, '47_43', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135851122bfbcf.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('119', '108', '14', '单蜜短外套女装2018春季新款夹克韩版开衫上衣 卡其 M', '10005', '288', '3', '138.88', '138.88', 'M　绿色', null, '54_51', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135917348f898a.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('120', '108', '13', '熙世界自然腰九分裤女2018夏装新款直筒裤简约休闲裤子女103LK020', '10004', '287', '5', '89.00', '89.00', 'S　午夜黑', null, '45_43', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135851122bfbcf.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('121', '109', '15', '法国雨露棉麻宽松合体男式衬衫 天空蓝;宽松版 S(16588A)', '10006', '289', '1', '249.00', '249.00', 'S(165/88A)　藏蓝色', null, '61_60', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/10143170220e29.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('122', '110', '16', 'A21以纯线上品牌2018夏季新品男装短袖T恤男圆领修身弹力短袖男t恤4821330159 特白 17588AL', '10007', '290', '1', '79.00', '79.00', '185/96A/XXL　白色', null, '72_66', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/10342659476f99.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('123', '110', '14', '单蜜短外套女装2018春季新款夹克韩版开衫上衣 卡其 M', '10005', '288', '1', '138.88', '138.88', 'M　绿色', null, '54_51', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135917348f898a.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('124', '111', '15', '法国雨露棉麻宽松合体男式衬衫 天空蓝;宽松版 S(16588A)', '10006', '289', '1', '249.00', '249.00', 'S(165/88A)　天空蓝', null, '61_58', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/10143170220e29.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('125', '112', '18', '热风Hotwind男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '10009', '292', '1', '139.00', '139.00', '41偏大一码　04白色', null, '84_80', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('126', '113', '17', 'By Creations Lite Reda110支纯羊毛面料西裤 男士暗格子正装裤 灰蓝色西裤 46', '10008', '291', '1', '1180.00', '1180.00', '52　灰蓝色西裤', null, '78_73', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1117535084c0a2.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('127', '114', '18', '热风Hotwind男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '10009', '292', '1', '139.00', '139.00', '40　04白色', null, '83_80', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('128', '115', '16', 'A21以纯线上品牌2018夏季新品男装短袖T恤男圆领修身弹力短袖男t恤4821330159 特白 17588AL', '10007', '290', '1', '79.00', '79.00', '170/84A/M　白色', null, '69_66', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/10342659476f99.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('129', '116', '15', '法国雨露棉麻宽松合体男式衬衫 天空蓝;宽松版 S(16588A)', '10006', '289', '1', '249.00', '249.00', 'S(165/88A)　天空蓝', null, '61_58', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/10143170220e29.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('130', '117', '18', '热风Hotwind男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '10009', '292', '1', '139.00', '139.00', '40　04白色', null, '83_80', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('131', '118', '16', 'A21以纯线上品牌2018夏季新品男装短袖T恤男圆领修身弹力短袖男t恤4821330159 特白 17588AL', '10007', '290', '1', '79.00', '79.00', '170/84A/M　白色', null, '69_66', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/10342659476f99.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('132', '119', '10', '纳斯鲁 短外套女2018年春季新款女装韩版修身时尚优雅短外套 图片色 M', '10001', '284', '1', '199.00', '199.00', 'M　原色　350g', null, '18_21_16', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/10355283613063.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('133', '120', '18', '热风Hotwind男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '10009', '292', '1', '139.00', '139.00', '41偏大一码　04白色', null, '84_80', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('134', '121', '19', '小米（MI）电视 55英寸 4K 智能WiFi网络平板 智能语音 液晶电视机 标准版 4A（L55M5-AZ/AD）', 'L55M5-AZ', '293', '1', '2599.00', '2599.00', '亚光黑　55英寸　14.2kg', null, '89_88_90', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1538082839129.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('135', '122', '10', '纳斯鲁 短外套女2018年春季新款女装韩版修身时尚优雅短外套 图片色 M', '10001', '284', '1', '199.00', '199.00', 'M　原色　350g', null, '18_21_16', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/10355283613063.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('136', '123', '13', '熙世界自然腰九分裤女2018夏装新款直筒裤简约休闲裤子女103LK020', '10004', '287', '1', '89.00', '89.00', 'XS　午夜黑', null, '44_43', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135851122bfbcf.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('137', '124', '18', '热风Hotwind男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '10009', '292', '1', '0.01', '0.01', '41偏大一码　04白色', null, '84_80', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('138', '125', '18', '热风Hotwind男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '10009', '292', '1', '0.01', '0.01', '39偏大一码　04白色', null, '82_80', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('139', '126', '18', '热风Hotwind男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '10009', '292', '1', '0.01', '0.01', '39偏大一码　04白色', null, '82_80', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('140', '127', '18', '热风Hotwind男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '10009', '292', '1', '0.01', '0.01', '44偏大一码　04白色', null, '87_80', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('141', '128', '10', '纳斯鲁 短外套女2018年春季新款女装韩版修身时尚优雅短外套 图片色 M', '10001', '284', '1', '199.00', '199.00', 'xL　藏青色　350g', null, '20_17_16', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/10355283613063.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('142', '130', '17', 'By Creations Lite Reda110支纯羊毛面料西裤 男士暗格子正装裤 灰蓝色西裤 46', '10008', '291', '1', '1180.00', '1180.00', '48　灰蓝色西裤', null, '76_73', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1117535084c0a2.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('143', '131', '18', '热风Hotwind男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '10009', '292', '1', '0.01', '0.01', '38偏大一码　04白色', null, '81_80', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('144', '132', '18', '热风Hotwind男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '10009', '292', '1', '0.01', '0.01', '39偏大一码　04白色', null, '82_80', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('145', '133', '18', '热风Hotwind男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '10009', '292', '1', '0.01', '0.01', '43偏大一码　04白色', null, '86_80', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('146', '134', '18', '热风Hotwind男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '10009', '292', '1', '0.01', '0.01', '44偏大一码　04白色', null, '87_80', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('147', '135', '19', '小米（MI）电视 55英寸 4K 智能WiFi网络平板 智能语音 液晶电视机 标准版 4A（L55M5-AZ/AD）', 'L55M5-AZ', '293', '1', '2599.00', '2599.00', '亚光黑　55英寸　14.2kg', null, '89_88_90', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1538082839129.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('148', '136', '17', 'By Creations Lite Reda110支纯羊毛面料西裤 男士暗格子正装裤 灰蓝色西裤 46', '10008', '291', '1', '1180.00', '1180.00', '48　灰蓝色西裤', null, '76_73', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1117535084c0a2.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('149', '137', '18', '热风Hotwind男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '10009', '292', '1', '0.01', '0.01', '43偏大一码　04白色', null, '86_80', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('150', '138', '16', 'A21以纯线上品牌2018夏季新品男装短袖T恤男圆领修身弹力短袖男t恤4821330159 特白 17588AL', '10007', '290', '2', '79.00', '79.00', '170/84A/M　杏色', null, '69_67', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/10342659476f99.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('151', '138', '18', '热风Hotwind男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '10009', '292', '1', '0.01', '0.01', '44偏大一码　04白色', null, '87_80', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('152', '139', '18', '热风Hotwind男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '10009', '292', '1', '0.01', '0.01', '43偏大一码　04白色', null, '86_80', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('153', '140', '18', '热风Hotwind男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '10009', '292', '1', '0.01', '0.01', '43偏大一码　04白色', null, '86_80', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('154', '141', '18', '热风Hotwind男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '10009', '292', '1', '0.01', '0.01', '42偏大一码　04白色', null, '85_80', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('155', '142', '18', '热风Hotwind男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '10009', '292', '1', '0.01', '0.01', '41偏大一码　04白色', null, '84_80', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('156', '142', '19', '小米（MI）电视 55英寸 4K 智能WiFi网络平板 智能语音 液晶电视机 标准版 4A（L55M5-AZ/AD）', 'L55M5-AZ', '293', '1', '2599.00', '2599.00', '亚光黑　55英寸　14.2kg', null, '89_88_90', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1538082839129.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('157', '143', '18', '热风Hotwind男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '10009', '292', '1', '0.01', '0.01', '41偏大一码　04白色', null, '84_80', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('158', '144', '18', '热风Hotwind男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '10009', '292', '1', '0.01', '0.01', '41偏大一码　04白色', null, '84_80', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('159', '145', '18', '热风Hotwind男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '10009', '292', '1', '0.01', '0.01', '41偏大一码　04白色', null, '84_80', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg');
INSERT INTO `nideshop_order_goods` VALUES ('160', '146', '18', '热风Hotwind男鞋新款低帮男士系带休闲鞋H14M8106 04白色 41偏大一码', '10009', '292', '1', '0.01', '0.01', '43偏大一码　04白色', null, '86_80', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg');

-- ----------------------------
-- Table structure for nideshop_product
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_product`;
CREATE TABLE `nideshop_product` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` mediumint(8) unsigned DEFAULT '0' COMMENT '商品Id',
  `goods_specification_ids` varchar(50) DEFAULT '' COMMENT '商品规格ids',
  `goods_sn` varchar(60) DEFAULT '' COMMENT '商品序列号',
  `goods_number` mediumint(8) unsigned DEFAULT '0' COMMENT '商品编码',
  `retail_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '零售价格',
  `market_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '团购价格',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=299 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_product
-- ----------------------------
INSERT INTO `nideshop_product` VALUES ('290', '16', null, '10007', '999', '79.00', '79.00');
INSERT INTO `nideshop_product` VALUES ('289', '15', null, '10006', '999', '249.00', '249.00');
INSERT INTO `nideshop_product` VALUES ('288', '14', null, '10005', '199', '138.88', '138.88');
INSERT INTO `nideshop_product` VALUES ('287', '13', null, '10004', '127', '89.00', '89.00');
INSERT INTO `nideshop_product` VALUES ('286', '12', null, '10003', '222', '255.00', '255.00');
INSERT INTO `nideshop_product` VALUES ('285', '11', null, '10002', '111', '299.00', '299.00');
INSERT INTO `nideshop_product` VALUES ('295', '21', null, 'H&M00001', '999', '222.00', '222.00');
INSERT INTO `nideshop_product` VALUES ('294', '20', null, '1010100', null, null, null);
INSERT INTO `nideshop_product` VALUES ('293', '19', null, 'L55M5-AZ', '999', '2599.00', '2599.00');
INSERT INTO `nideshop_product` VALUES ('292', '18', null, '10009', '999', '0.01', '0.01');
INSERT INTO `nideshop_product` VALUES ('291', '17', null, '10008', '999', '1180.00', '1180.00');
INSERT INTO `nideshop_product` VALUES ('298', '24', null, 'H&M00004', '888', '888.00', '888.00');
INSERT INTO `nideshop_product` VALUES ('297', '23', null, 'H&M00002', '666', '666.00', '666.00');
INSERT INTO `nideshop_product` VALUES ('296', '22', null, 'H&M00001', '333', '333.00', '333.00');
INSERT INTO `nideshop_product` VALUES ('284', '10', null, '10001', '100', '199.00', '199.00');

-- ----------------------------
-- Table structure for nideshop_related_goods
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_related_goods`;
CREATE TABLE `nideshop_related_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品Id',
  `related_goods_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联商品id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_related_goods
-- ----------------------------

-- ----------------------------
-- Table structure for nideshop_search_history
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_search_history`;
CREATE TABLE `nideshop_search_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` char(50) NOT NULL COMMENT '关键字',
  `from` varchar(45) DEFAULT '' COMMENT '搜索来源，如PC、小程序、APP等',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '搜索时间',
  `user_id` varchar(45) DEFAULT NULL COMMENT '会员Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_search_history
-- ----------------------------
INSERT INTO `nideshop_search_history` VALUES ('57', '青春', '', '1522146740', '');
INSERT INTO `nideshop_search_history` VALUES ('58', 'testtest', '', '1523935951', '');
INSERT INTO `nideshop_search_history` VALUES ('59', 'wew', '', '1523936783', '');

-- ----------------------------
-- Table structure for nideshop_shipping
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_shipping`;
CREATE TABLE `nideshop_shipping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `status` int(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '状态 0正常 1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_shipping
-- ----------------------------
INSERT INTO `nideshop_shipping` VALUES ('1', 'AJ', '安捷快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('2', 'ANE', '安能物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('3', 'AXD', '安信达快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('4', 'BQXHM', '北青小红帽', '1');
INSERT INTO `nideshop_shipping` VALUES ('5', 'BFDF', '百福东方', '1');
INSERT INTO `nideshop_shipping` VALUES ('6', 'BTWL', '百世快运', '1');
INSERT INTO `nideshop_shipping` VALUES ('7', 'CCES', 'CCES快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('8', 'CITY100', '城市100', '1');
INSERT INTO `nideshop_shipping` VALUES ('9', 'COE', 'COE东方快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('10', 'CSCY', '长沙创一', '1');
INSERT INTO `nideshop_shipping` VALUES ('11', 'CDSTKY', '成都善途速运', '1');
INSERT INTO `nideshop_shipping` VALUES ('12', 'DBL', '德邦', '0');
INSERT INTO `nideshop_shipping` VALUES ('13', 'DSWL', 'D速物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('14', 'DTWL', '大田物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('15', 'EMS', 'EMS', '0');
INSERT INTO `nideshop_shipping` VALUES ('16', 'FAST', '快捷速递', '1');
INSERT INTO `nideshop_shipping` VALUES ('17', 'FEDEX', 'FEDEX联邦(国内件）', '1');
INSERT INTO `nideshop_shipping` VALUES ('18', 'FEDEX_GJ', 'FEDEX联邦(国际件）', '1');
INSERT INTO `nideshop_shipping` VALUES ('19', 'FKD', '飞康达', '1');
INSERT INTO `nideshop_shipping` VALUES ('20', 'GDEMS', '广东邮政', '1');
INSERT INTO `nideshop_shipping` VALUES ('21', 'GSD', '共速达', '1');
INSERT INTO `nideshop_shipping` VALUES ('22', 'GTO', '国通快递', '0');
INSERT INTO `nideshop_shipping` VALUES ('23', 'GTSD', '高铁速递', '1');
INSERT INTO `nideshop_shipping` VALUES ('24', 'HFWL', '汇丰物流', '0');
INSERT INTO `nideshop_shipping` VALUES ('25', 'HHTT', '天天快递', '0');
INSERT INTO `nideshop_shipping` VALUES ('26', 'HLWL', '恒路物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('27', 'HOAU', '天地华宇', '1');
INSERT INTO `nideshop_shipping` VALUES ('28', 'hq568', '华强物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('29', 'HTKY', '百世快递', '0');
INSERT INTO `nideshop_shipping` VALUES ('30', 'HXLWL', '华夏龙物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('31', 'HYLSD', '好来运快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('32', 'JGSD', '京广速递', '1');
INSERT INTO `nideshop_shipping` VALUES ('33', 'JIUYE', '九曳供应链', '1');
INSERT INTO `nideshop_shipping` VALUES ('34', 'JJKY', '佳吉快运', '1');
INSERT INTO `nideshop_shipping` VALUES ('35', 'JLDT', '嘉里物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('36', 'JTKD', '捷特快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('37', 'JXD', '急先达', '1');
INSERT INTO `nideshop_shipping` VALUES ('38', 'JYKD', '晋越快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('39', 'JYM', '加运美', '1');
INSERT INTO `nideshop_shipping` VALUES ('40', 'JYWL', '佳怡物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('41', 'KYWL', '跨越物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('42', 'LB', '龙邦快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('43', 'LHT', '联昊通速递', '1');
INSERT INTO `nideshop_shipping` VALUES ('44', 'MHKD', '民航快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('45', 'MLWL', '明亮物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('46', 'NEDA', '能达速递', '1');
INSERT INTO `nideshop_shipping` VALUES ('47', 'PADTF', '平安达腾飞快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('48', 'QCKD', '全晨快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('49', 'QFKD', '全峰快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('50', 'QRT', '全日通快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('51', 'RFD', '如风达', '0');
INSERT INTO `nideshop_shipping` VALUES ('52', 'SAD', '赛澳递', '1');
INSERT INTO `nideshop_shipping` VALUES ('53', 'SAWL', '圣安物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('54', 'SBWL', '盛邦物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('55', 'SDWL', '上大物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('56', 'SF', '顺丰快递', '0');
INSERT INTO `nideshop_shipping` VALUES ('57', 'SFWL', '盛丰物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('58', 'SHWL', '盛辉物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('59', 'ST', '速通物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('60', 'STO', '申通快递', '0');
INSERT INTO `nideshop_shipping` VALUES ('61', 'STWL', '速腾快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('62', 'SURE', '速尔快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('63', 'TSSTO', '唐山申通', '1');
INSERT INTO `nideshop_shipping` VALUES ('64', 'UAPEX', '全一快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('65', 'UC', '优速快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('66', 'WJWL', '万家物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('67', 'WXWL', '万象物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('68', 'XBWL', '新邦物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('69', 'XFEX', '信丰快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('70', 'XYT', '希优特', '1');
INSERT INTO `nideshop_shipping` VALUES ('71', 'XJ', '新杰物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('72', 'YADEX', '源安达快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('73', 'YCWL', '远成物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('74', 'YD', '韵达快递', '0');
INSERT INTO `nideshop_shipping` VALUES ('75', 'YDH', '义达国际物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('76', 'YFEX', '越丰物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('77', 'YFHEX', '原飞航物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('78', 'YFSD', '亚风快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('79', 'YTKD', '运通快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('80', 'YTO', '圆通速递', '0');
INSERT INTO `nideshop_shipping` VALUES ('81', 'YXKD', '亿翔快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('82', 'YZPY', '邮政平邮/小包', '1');
INSERT INTO `nideshop_shipping` VALUES ('83', 'ZENY', '增益快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('84', 'ZHQKD', '汇强快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('85', 'ZJS', '宅急送', '1');
INSERT INTO `nideshop_shipping` VALUES ('86', 'ZTE', '众通快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('87', 'ZTKY', '中铁快运', '1');
INSERT INTO `nideshop_shipping` VALUES ('88', 'ZTO', '中通速递', '0');
INSERT INTO `nideshop_shipping` VALUES ('89', 'ZTWL', '中铁物流', '0');
INSERT INTO `nideshop_shipping` VALUES ('90', 'ZYWL', '中邮物流', '0');
INSERT INTO `nideshop_shipping` VALUES ('91', 'AMAZON', '亚马逊物流', '0');
INSERT INTO `nideshop_shipping` VALUES ('92', 'SUBIDA', '速必达物流', '1');
INSERT INTO `nideshop_shipping` VALUES ('93', 'RFEX', '瑞丰速递', '1');
INSERT INTO `nideshop_shipping` VALUES ('94', 'QUICK', '快客快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('95', 'CJKD', '城际快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('96', 'CNPEX', 'CNPEX中邮快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('97', 'HOTSCM', '鸿桥供应链', '1');
INSERT INTO `nideshop_shipping` VALUES ('98', 'HPTEX', '海派通物流公司', '1');
INSERT INTO `nideshop_shipping` VALUES ('99', 'AYCA', '澳邮专线', '1');
INSERT INTO `nideshop_shipping` VALUES ('100', 'PANEX', '泛捷快递', '1');
INSERT INTO `nideshop_shipping` VALUES ('101', 'PCA', 'PCA Express', '1');
INSERT INTO `nideshop_shipping` VALUES ('102', 'UEQ', 'UEQ Express', '1');

-- ----------------------------
-- Table structure for nideshop_sms_log
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_sms_log`;
CREATE TABLE `nideshop_sms_log` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `log_date` bigint(20) DEFAULT NULL,
  `sms_code` varchar(12) DEFAULT NULL,
  `send_status` bigint(20) DEFAULT NULL,
  `sms_text` varchar(255) DEFAULT NULL COMMENT '1成功 0失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_sms_log
-- ----------------------------

-- ----------------------------
-- Table structure for nideshop_specification
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_specification`;
CREATE TABLE `nideshop_specification` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '规范名称',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `identify` bigint(20) DEFAULT NULL COMMENT '标识索引备注(部门权限ID)',
  `sys_user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='规格表';

-- ----------------------------
-- Records of nideshop_specification
-- ----------------------------
INSERT INTO `nideshop_specification` VALUES ('1', '尺寸', '1', null, null);
INSERT INTO `nideshop_specification` VALUES ('2', '颜色', '2', null, null);
INSERT INTO `nideshop_specification` VALUES ('4', '重量', '3', null, null);
INSERT INTO `nideshop_specification` VALUES ('7', '产品型号', '1', '1', '6');
INSERT INTO `nideshop_specification` VALUES ('8', '产品颜色', '2', '1', '6');
INSERT INTO `nideshop_specification` VALUES ('9', '屏幕尺寸', '3', '1', '6');
INSERT INTO `nideshop_specification` VALUES ('10', '上市日期', '4', '1', '6');
INSERT INTO `nideshop_specification` VALUES ('11', '重量(含底座)', '5', '1', '6');
INSERT INTO `nideshop_specification` VALUES ('12', '颜色', '1', '5', '2');
INSERT INTO `nideshop_specification` VALUES ('13', '尺码', '2', '5', '2');
INSERT INTO `nideshop_specification` VALUES ('14', '重量', '3', '5', '2');

-- ----------------------------
-- Table structure for nideshop_store_configure
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_store_configure`;
CREATE TABLE `nideshop_store_configure` (
  `store_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '店铺ID（主键唯一）',
  `store_name` varchar(100) DEFAULT NULL COMMENT '店铺名称（一般为部门一级名称）',
  `dept_parent_id` bigint(11) DEFAULT NULL COMMENT '存放部门（店铺/公司）一级ID',
  `app_id` varchar(100) DEFAULT NULL COMMENT '小程序APPID',
  `app_secret` varchar(100) DEFAULT NULL COMMENT '小程序AppSecret',
  `much_Id` varchar(100) DEFAULT NULL COMMENT '微信支付商户号',
  `pay_sing_key` varchar(100) DEFAULT NULL COMMENT '微信支付秘钥',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 （0 营业   1 休息  2 冻结 ）',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '逻辑删除（0 正常  1 删除）',
  `ph` varchar(255) DEFAULT NULL COMMENT '客服电话',
  `latitude` varchar(255) DEFAULT NULL COMMENT '纬度',
  `longitude` varchar(255) DEFAULT NULL COMMENT '经度',
  `address` varchar(255) DEFAULT NULL COMMENT '地址信息',
  `create_by` varchar(50) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_store_configure
-- ----------------------------
INSERT INTO `nideshop_store_configure` VALUES ('1', 'DEMO', '1', 'wxbc649f25caf7512e', 'c75ba2fa22f202e53d452fa916ffd31b', '1496716192', '726520f78a6d5cc0127e7da9fb778ff4', '0', '0', '13838888388', '31.142685', '121.352394', '上海市中春路明谷科技园', null, null, 'admin', '2018-04-16 17:16:07', '关于我们');
INSERT INTO `nideshop_store_configure` VALUES ('2', 'test', '5', null, null, null, null, '1', '0', null, null, null, null, null, null, null, null, '关于我们');
INSERT INTO `nideshop_store_configure` VALUES ('10', '999', '999', '999', '999', '999', '999', '0', '0', null, null, null, null, 'admin', '2018-04-12 10:34:53', 'admin', '2018-04-12 10:34:53', '关于我们');
INSERT INTO `nideshop_store_configure` VALUES ('11', '测试店铺', '1', 'gasgsagas', 'sagsgasdgdas', '132341633', 'dsagadsgsad', '0', '0', '15845687895', '31.142685', '121.352394', '上海市中春路明谷科技园', 'admin', '2018-04-17 14:52:56', 'admin', '2018-04-17 14:52:56', '关于我们');

-- ----------------------------
-- Table structure for nideshop_topic
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_topic`;
CREATE TABLE `nideshop_topic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL DEFAULT '''''' COMMENT '活动主题',
  `content` text COMMENT '活动内容',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '化名',
  `item_pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '活动条例图片',
  `subtitle` varchar(255) NOT NULL DEFAULT '''' COMMENT '子标题',
  `topic_category_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '活动类别',
  `price_info` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '活动价格',
  `read_count` varchar(255) NOT NULL DEFAULT '0',
  `scene_pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '场景图片链接',
  `topic_template_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '活动模板Id',
  `topic_tag_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '活动标签Id',
  `identify` bigint(20) DEFAULT NULL COMMENT '标识索引备注',
  `sys_user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  KEY `topic_id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_topic
-- ----------------------------

-- ----------------------------
-- Table structure for nideshop_topic_category
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_topic_category`;
CREATE TABLE `nideshop_topic_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '活动类别主题',
  `pic_url` varchar(255) NOT NULL DEFAULT '' COMMENT '活动类别图片链接',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_topic_category
-- ----------------------------

-- ----------------------------
-- Table structure for nideshop_user
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_user`;
CREATE TABLE `nideshop_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(32) DEFAULT '',
  `gender` tinyint(1) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `register_time` datetime DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `last_login_ip` varchar(15) DEFAULT '',
  `user_level_id` tinyint(3) DEFAULT NULL,
  `nickname` varchar(60) DEFAULT '',
  `mobile` varchar(20) DEFAULT '',
  `register_ip` varchar(45) DEFAULT '',
  `avatar` varchar(255) DEFAULT '',
  `weixin_openid` varchar(50) DEFAULT '',
  `store_id` varchar(50) DEFAULT NULL COMMENT '店铺Id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_user
-- ----------------------------
INSERT INTO `nideshop_user` VALUES ('35', '微信用户ocqzj3qgvx5m', 'ozvkm0ZTQW2_DiMjEQxEktOnl_5I', '1', null, '2018-03-27 13:31:43', '2018-04-20 18:26:37', '127.0.0.1', null, '湛长磊', null, '127.0.0.1', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLbuXiafdYFyFkaLtTZAZyfJn6T3qialHomNNh2TtP8VTaj8y66IoFQaNrnib6Deiceme37Yzcd7L0N5Q/0', 'ozvkm0ZTQW2_DiMjEQxEktOnl_5I', '1');
INSERT INTO `nideshop_user` VALUES ('36', '微信用户p239626am5ju', 'ozvkm0QDrjpOI-VYfpwidVBIXhyQ', '1', null, '2018-03-27 17:44:35', '2018-04-20 11:56:25', '127.0.0.1', null, 'Position ²', '12323232323', '127.0.0.1', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKLRwAULGDqmGO3qfHWXWf1yyHucDYLnPUIW7Nia4ibqtOpm3BORSFqWrxCiaykQxBibHS5vQgWmdJLSg/0', 'ozvkm0QDrjpOI-VYfpwidVBIXhyQ', '1');
INSERT INTO `nideshop_user` VALUES ('37', '微信用户g71pacpwnutp', 'ozvkm0WKwT5xYPSVPAN6g-9H7zaY', '1', null, '2018-04-08 10:56:18', '2018-04-08 15:27:56', '192.168.0.99', null, '小明', null, '192.168.0.214', 'https://wx.qlogo.cn/mmopen/vi_32/icjJO2j80qdESthpgFq4oNh9QHPmm77Qtia19jibDqRBnR9fHU51K9bqgShZVohdfMJ0djic4eUIKxZG7SIicEibUMQg/0', 'ozvkm0WKwT5xYPSVPAN6g-9H7zaY', '1');
INSERT INTO `nideshop_user` VALUES ('40', '微信用户l43p1uy6yqje', 'ozvkm0eBa27gYswl6DruDPTKbLc0', '1', null, '2018-04-08 15:40:57', '2018-04-08 15:41:00', '192.168.0.99', null, '浩', null, '192.168.0.99', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKQSVtIVJF21Eh10eMu9DEhaUzUZmicUVhITnSFibtTVE6GmXLcqJdTHVnrFeJ6nG4ghYuHIm2PG5tg/0', 'ozvkm0eBa27gYswl6DruDPTKbLc0', '1');

-- ----------------------------
-- Table structure for nideshop_user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_user_coupon`;
CREATE TABLE `nideshop_user_coupon` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` tinyint(3) unsigned DEFAULT '0',
  `coupon_number` varchar(20) DEFAULT '',
  `user_id` int(11) unsigned DEFAULT '0',
  `used_time` datetime DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `order_id` mediumint(8) unsigned DEFAULT '0',
  `source_key` varchar(64) DEFAULT NULL COMMENT '来源key',
  `referrer` int(32) DEFAULT NULL COMMENT '发券人',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_user_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for nideshop_user_level
-- ----------------------------
DROP TABLE IF EXISTS `nideshop_user_level`;
CREATE TABLE `nideshop_user_level` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nideshop_user_level
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('PlatformScheduler', 'TASK_1', 'DEFAULT', null, 'com.platform.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720025636F6D2E706C6174666F726D2E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158BAF593307874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000474657374740008706C6174666F726D74000FE69C89E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);
INSERT INTO `qrtz_job_details` VALUES ('PlatformScheduler', 'TASK_2', 'DEFAULT', null, 'com.platform.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720025636F6D2E706C6174666F726D2E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200084C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000158C377C4607874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000574657374327074000FE697A0E58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000017800);
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', null, 'com.platform.boot.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400B87B226A6F624964223A312C226265616E4E616D65223A22746573745461736B222C226D6574686F644E616D65223A2274657374222C22706172616D73223A22706C6174666F726D222C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C22737461747573223A312C2272656D61726B223A22E69C89E58F82E695B0E6B58BE8AF95222C2263726561746554696D65223A2244656320312C20323031362031313A31363A343620504D227D7800);
INSERT INTO `qrtz_job_details` VALUES ('RenrenScheduler', 'TASK_2', 'DEFAULT', null, 'com.platform.boot.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597400A47B226A6F624964223A322C226265616E4E616D65223A22746573745461736B222C226D6574686F644E616D65223A227465737432222C2263726F6E45787072657373696F6E223A223020302F3330202A202A202A203F222C22737461747573223A312C2272656D61726B223A22E697A0E58F82E695B0E6B58BE8AF95222C2263726561746554696D65223A2244656320332C203230313620323A35353A353620504D227D7800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('PlatformScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('PlatformScheduler', 'TRIGGER_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('PlatformScheduler', '998-PC1516325876471', '1516326302618', '15000');
INSERT INTO `qrtz_scheduler_state` VALUES ('PlatformScheduler', 'ttui-PC1516325900268', '1516326311199', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) DEFAULT NULL COMMENT 'key',
  `value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('3', 'CLOUD_STORAGE_CONFIG_KEY', '{\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"VP3gUD_HbtgQt_EOhEvVBVtk8TNeG8E_e4es2d0u\",\"qiniuBucketName\":\"ds-xcx-image\",\"qiniuDomain\":\"http://p2n8ypmnw.bkt.clouddn.com\",\"qiniuPrefix\":\"\",\"qiniuSecretKey\":\"EVXUjXI4zH9a5hJSgOY5z4jLPMnWi6xPkfeZd2Tu\",\"type\":1}', '0', '云存储配置信息');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', 'DEMO有限公司', '0', '0');
INSERT INTO `sys_dept` VALUES ('2', '1', '技术部', '0', '0');
INSERT INTO `sys_dept` VALUES ('3', '1', '销售部', '0', '0');
INSERT INTO `sys_dept` VALUES ('4', '1', '客服部', '0', '0');
INSERT INTO `sys_dept` VALUES ('5', '0', '上海移动公司', '0', '0');
INSERT INTO `sys_dept` VALUES ('6', '5', '技术部', '0', '0');
INSERT INTO `sys_dept` VALUES ('7', '5', '客服部', '0', '0');
INSERT INTO `sys_dept` VALUES ('8', '2', '开发部', '0', '0');
INSERT INTO `sys_dept` VALUES ('9', '2', '研发部', '0', '0');
INSERT INTO `sys_dept` VALUES ('10', '7', '专线部', '0', '0');
INSERT INTO `sys_dept` VALUES ('11', '7', '酱油部', '0', '0');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1576 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('903', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-16 16:15:00');
INSERT INTO `sys_log` VALUES ('904', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-16 16:27:18');
INSERT INTO `sys_log` VALUES ('905', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-16 16:27:18');
INSERT INTO `sys_log` VALUES ('906', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-16 16:31:36');
INSERT INTO `sys_log` VALUES ('907', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-16 16:31:45');
INSERT INTO `sys_log` VALUES ('908', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-16 16:34:33');
INSERT INTO `sys_log` VALUES ('909', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-16 17:29:25');
INSERT INTO `sys_log` VALUES ('910', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-16 17:29:32');
INSERT INTO `sys_log` VALUES ('911', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-16 17:29:34');
INSERT INTO `sys_log` VALUES ('912', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-16 17:29:34');
INSERT INTO `sys_log` VALUES ('913', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-16 17:29:35');
INSERT INTO `sys_log` VALUES ('914', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-16 17:29:35');
INSERT INTO `sys_log` VALUES ('915', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-16 17:29:35');
INSERT INTO `sys_log` VALUES ('916', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-16 17:29:35');
INSERT INTO `sys_log` VALUES ('917', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-16 17:29:35');
INSERT INTO `sys_log` VALUES ('918', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-16 17:30:26');
INSERT INTO `sys_log` VALUES ('919', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-16 17:43:25');
INSERT INTO `sys_log` VALUES ('920', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-16 18:39:25');
INSERT INTO `sys_log` VALUES ('921', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '116.226.147.238', '2018-01-16 19:16:35');
INSERT INTO `sys_log` VALUES ('922', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-16 19:26:48');
INSERT INTO `sys_log` VALUES ('923', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-16 19:30:54');
INSERT INTO `sys_log` VALUES ('924', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-16 19:33:41');
INSERT INTO `sys_log` VALUES ('925', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-16 19:35:48');
INSERT INTO `sys_log` VALUES ('926', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-17 09:16:33');
INSERT INTO `sys_log` VALUES ('927', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-17 10:24:28');
INSERT INTO `sys_log` VALUES ('928', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '116.226.147.238', '2018-01-17 10:43:15');
INSERT INTO `sys_log` VALUES ('929', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '116.226.147.238', '2018-01-17 14:06:38');
INSERT INTO `sys_log` VALUES ('930', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-17 14:32:53');
INSERT INTO `sys_log` VALUES ('931', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-17 16:10:22');
INSERT INTO `sys_log` VALUES ('932', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-17 16:24:36');
INSERT INTO `sys_log` VALUES ('933', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-17 18:19:45');
INSERT INTO `sys_log` VALUES ('934', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-17 18:35:52');
INSERT INTO `sys_log` VALUES ('935', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-17 18:42:29');
INSERT INTO `sys_log` VALUES ('936', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-17 18:42:38');
INSERT INTO `sys_log` VALUES ('937', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-18 09:02:59');
INSERT INTO `sys_log` VALUES ('938', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-18 09:13:22');
INSERT INTO `sys_log` VALUES ('939', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-18 09:16:13');
INSERT INTO `sys_log` VALUES ('940', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-18 10:24:09');
INSERT INTO `sys_log` VALUES ('941', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-18 10:35:46');
INSERT INTO `sys_log` VALUES ('942', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-18 11:01:37');
INSERT INTO `sys_log` VALUES ('943', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-18 11:01:38');
INSERT INTO `sys_log` VALUES ('944', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-18 11:10:19');
INSERT INTO `sys_log` VALUES ('945', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-18 11:12:57');
INSERT INTO `sys_log` VALUES ('946', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-18 11:38:04');
INSERT INTO `sys_log` VALUES ('947', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-18 11:40:26');
INSERT INTO `sys_log` VALUES ('948', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-18 12:02:03');
INSERT INTO `sys_log` VALUES ('949', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-18 12:02:07');
INSERT INTO `sys_log` VALUES ('950', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-18 12:43:38');
INSERT INTO `sys_log` VALUES ('951', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-18 15:04:43');
INSERT INTO `sys_log` VALUES ('952', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-18 16:42:36');
INSERT INTO `sys_log` VALUES ('953', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-18 18:12:30');
INSERT INTO `sys_log` VALUES ('954', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-18 18:16:17');
INSERT INTO `sys_log` VALUES ('955', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-18 18:27:01');
INSERT INTO `sys_log` VALUES ('956', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-18 18:30:19');
INSERT INTO `sys_log` VALUES ('957', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-19 09:46:38');
INSERT INTO `sys_log` VALUES ('958', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-19 09:59:52');
INSERT INTO `sys_log` VALUES ('959', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-19 10:05:05');
INSERT INTO `sys_log` VALUES ('960', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-19 10:33:39');
INSERT INTO `sys_log` VALUES ('961', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-19 10:40:37');
INSERT INTO `sys_log` VALUES ('962', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-19 10:43:52');
INSERT INTO `sys_log` VALUES ('963', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-19 13:40:31');
INSERT INTO `sys_log` VALUES ('964', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-19 14:53:38');
INSERT INTO `sys_log` VALUES ('965', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-19 14:53:42');
INSERT INTO `sys_log` VALUES ('966', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-19 14:53:50');
INSERT INTO `sys_log` VALUES ('967', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-19 14:56:50');
INSERT INTO `sys_log` VALUES ('968', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-19 15:03:16');
INSERT INTO `sys_log` VALUES ('969', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-19 15:25:55');
INSERT INTO `sys_log` VALUES ('970', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-19 15:30:30');
INSERT INTO `sys_log` VALUES ('971', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-19 16:31:57');
INSERT INTO `sys_log` VALUES ('972', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-19 16:33:13');
INSERT INTO `sys_log` VALUES ('973', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-19 16:43:24');
INSERT INTO `sys_log` VALUES ('974', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-19 16:45:46');
INSERT INTO `sys_log` VALUES ('975', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-19 16:51:08');
INSERT INTO `sys_log` VALUES ('976', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-19 16:55:23');
INSERT INTO `sys_log` VALUES ('977', '\"amin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"amin\"', '127.0.0.1', '2018-01-19 17:03:13');
INSERT INTO `sys_log` VALUES ('978', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-19 17:03:35');
INSERT INTO `sys_log` VALUES ('979', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-19 17:23:32');
INSERT INTO `sys_log` VALUES ('980', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-19 18:02:16');
INSERT INTO `sys_log` VALUES ('981', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-19 18:19:36');
INSERT INTO `sys_log` VALUES ('982', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-22 09:09:23');
INSERT INTO `sys_log` VALUES ('983', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-22 09:18:39');
INSERT INTO `sys_log` VALUES ('984', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-22 09:34:25');
INSERT INTO `sys_log` VALUES ('985', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-22 09:39:36');
INSERT INTO `sys_log` VALUES ('986', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-22 09:54:54');
INSERT INTO `sys_log` VALUES ('987', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-22 10:04:44');
INSERT INTO `sys_log` VALUES ('988', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-22 13:15:31');
INSERT INTO `sys_log` VALUES ('989', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-22 13:17:55');
INSERT INTO `sys_log` VALUES ('990', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-22 15:13:24');
INSERT INTO `sys_log` VALUES ('991', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-22 15:51:40');
INSERT INTO `sys_log` VALUES ('992', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-22 17:36:02');
INSERT INTO `sys_log` VALUES ('993', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-22 18:04:37');
INSERT INTO `sys_log` VALUES ('994', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-22 18:15:40');
INSERT INTO `sys_log` VALUES ('995', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-23 09:12:03');
INSERT INTO `sys_log` VALUES ('996', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-23 09:52:29');
INSERT INTO `sys_log` VALUES ('997', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-23 13:51:19');
INSERT INTO `sys_log` VALUES ('998', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-23 14:59:56');
INSERT INTO `sys_log` VALUES ('999', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-23 15:00:42');
INSERT INTO `sys_log` VALUES ('1000', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-23 15:01:05');
INSERT INTO `sys_log` VALUES ('1001', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-23 16:39:00');
INSERT INTO `sys_log` VALUES ('1002', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-23 18:24:45');
INSERT INTO `sys_log` VALUES ('1003', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-23 18:40:07');
INSERT INTO `sys_log` VALUES ('1004', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-23 18:40:12');
INSERT INTO `sys_log` VALUES ('1005', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-24 09:25:28');
INSERT INTO `sys_log` VALUES ('1006', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-24 15:31:10');
INSERT INTO `sys_log` VALUES ('1007', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-24 15:31:18');
INSERT INTO `sys_log` VALUES ('1008', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-26 10:35:22');
INSERT INTO `sys_log` VALUES ('1009', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-26 10:38:31');
INSERT INTO `sys_log` VALUES ('1010', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"envelope-open-o\",\"leaf\":false,\"name\":\"资讯管理\",\"orderNum\":6,\"parentId\":366,\"parentName\":\"CMS模块\",\"selected\":false,\"status\":0,\"type\":0}', '127.0.0.1', '2018-01-26 10:42:31');
INSERT INTO `sys_log` VALUES ('1011', 'admin', '保存角色', 'com.platform.controller.SysRoleController.save()', '{\"deptId\":9,\"deptIdList\":[9],\"deptName\":\"研发部\",\"menuIdList\":[375,376,377,378,222,223,224,225,226,227,259,260,261,262,263,307,308,309,310,311,297,298,299,300,301,254,256,257,258,255,315,316,317,318,319,325,326,327,328,329,331,332,333,334,335,357,289,290,291,292,293,352,353,354,355,356,342,343,344,345,346,347,348,349,350,351,361,362,363,364,365,336,341,337,338,339,340,358,359,1,2,15,16,17,18,3,19,20,21,22,368,369,370,371,372,373,4,23,24,25,26,6,7,8,9,10,11,12,13,14,30,302,303,304,305,306,27,29,379,5,28],\"remark\":\"DEMO技术研发部001\",\"roleName\":\"tyjsyf001\"}', '0:0:0:0:0:0:0:1', '2018-01-26 10:45:37');
INSERT INTO `sys_log` VALUES ('1012', 'admin', '修改角色', 'com.platform.controller.SysRoleController.update()', '{\"createTime\":1516934737000,\"createUserId\":1,\"deptId\":9,\"deptIdList\":[9],\"deptName\":\"研发部\",\"menuIdList\":[375,376,377,378,222,223,224,225,226,227,259,260,261,262,263,307,308,309,310,311,297,298,299,300,301,254,256,257,258,255,315,316,317,318,319,325,326,327,328,329,331,332,333,334,335,357,289,290,291,292,293,352,353,354,355,356,342,343,344,345,346,347,348,349,350,351,361,362,363,364,365,336,341,337,338,339,340,358,359,1,2,15,16,17,18,3,19,20,21,22,368,369,370,371,372,373,4,23,24,25,26,6,7,8,9,10,11,12,13,14,30,302,303,304,305,306,27,29,379,5,28],\"remark\":\"DEMO技术研发部001\",\"roleId\":6,\"roleName\":\"tyjsyf001大队长\"}', '0:0:0:0:0:0:0:1', '2018-01-26 10:46:15');
INSERT INTO `sys_log` VALUES ('1013', 'admin', '保存用户', 'com.platform.controller.SysUserController.save()', '{\"deptId\":9,\"deptName\":\"研发部\",\"email\":\"test@aliyun.com\",\"mobile\":\"18525852582\",\"roleIdList\":[6],\"status\":1,\"username\":\"test\"}', '0:0:0:0:0:0:0:1', '2018-01-26 10:47:12');
INSERT INTO `sys_log` VALUES ('1014', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"leaf\":false,\"name\":\"新增\",\"orderNum\":0,\"parentId\":380,\"parentName\":\"资讯管理\",\"selected\":false,\"status\":0,\"type\":2}', '127.0.0.1', '2018-01-26 10:48:11');
INSERT INTO `sys_log` VALUES ('1015', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"leaf\":false,\"name\":\"新增\",\"orderNum\":0,\"parentId\":380,\"parentName\":\"资讯管理\",\"selected\":false,\"status\":0,\"type\":2}', '127.0.0.1', '2018-01-26 10:48:40');
INSERT INTO `sys_log` VALUES ('1016', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-01-26 10:49:47');
INSERT INTO `sys_log` VALUES ('1017', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-26 10:50:06');
INSERT INTO `sys_log` VALUES ('1018', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-01-26 10:51:31');
INSERT INTO `sys_log` VALUES ('1019', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"th-list\",\"leaf\":false,\"menuId\":380,\"name\":\"资讯管理\",\"orderNum\":6,\"parentId\":366,\"parentName\":\"CMS模块\",\"perms\":\"\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"sys/news.html\"}', '127.0.0.1', '2018-01-26 10:58:52');
INSERT INTO `sys_log` VALUES ('1020', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-26 11:22:36');
INSERT INTO `sys_log` VALUES ('1021', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"hacker-news\",\"leaf\":false,\"menuId\":380,\"name\":\"资讯管理\",\"orderNum\":6,\"parentId\":366,\"parentName\":\"CMS模块\",\"perms\":\"\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"sys/news.html\"}', '127.0.0.1', '2018-01-26 11:27:52');
INSERT INTO `sys_log` VALUES ('1022', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-tasks\",\"leaf\":false,\"menuId\":380,\"name\":\"资讯管理\",\"orderNum\":6,\"parentId\":366,\"parentName\":\"CMS模块\",\"perms\":\"\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"sys/news.html\"}', '127.0.0.1', '2018-01-26 11:30:21');
INSERT INTO `sys_log` VALUES ('1023', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-newspaper-o\",\"leaf\":false,\"menuId\":380,\"name\":\"资讯管理\",\"orderNum\":6,\"parentId\":366,\"parentName\":\"CMS模块\",\"perms\":\"\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"sys/news.html\"}', '127.0.0.1', '2018-01-26 11:33:23');
INSERT INTO `sys_log` VALUES ('1024', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"leaf\":false,\"name\":\"查看\",\"orderNum\":0,\"parentId\":380,\"parentName\":\"资讯管理\",\"selected\":false,\"status\":0,\"type\":2}', '127.0.0.1', '2018-01-26 11:35:41');
INSERT INTO `sys_log` VALUES ('1025', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"leaf\":false,\"name\":\"新增\",\"orderNum\":0,\"parentId\":380,\"parentName\":\"资讯管理\",\"selected\":false,\"status\":0,\"type\":2}', '127.0.0.1', '2018-01-26 11:36:08');
INSERT INTO `sys_log` VALUES ('1026', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"leaf\":false,\"name\":\"修改\",\"orderNum\":0,\"parentId\":380,\"parentName\":\"资讯管理\",\"selected\":false,\"status\":0,\"type\":2}', '127.0.0.1', '2018-01-26 11:36:39');
INSERT INTO `sys_log` VALUES ('1027', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"leaf\":false,\"name\":\"删除\",\"orderNum\":0,\"parentId\":380,\"parentName\":\"资讯管理\",\"selected\":false,\"status\":0,\"type\":2}', '127.0.0.1', '2018-01-26 11:36:59');
INSERT INTO `sys_log` VALUES ('1028', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"leaf\":false,\"menuId\":381,\"name\":\"查询\",\"orderNum\":0,\"parentId\":380,\"parentName\":\"资讯管理\",\"selected\":false,\"status\":0,\"type\":2}', '127.0.0.1', '2018-01-26 11:42:44');
INSERT INTO `sys_log` VALUES ('1029', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-26 15:21:31');
INSERT INTO `sys_log` VALUES ('1030', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-commenting\",\"leaf\":false,\"name\":\"评论管理\",\"orderNum\":0,\"parentId\":366,\"parentName\":\"CMS模块\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"sys/comment\"}', '127.0.0.1', '2018-01-26 15:45:51');
INSERT INTO `sys_log` VALUES ('1031', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-newspaper-o\",\"leaf\":false,\"menuId\":380,\"name\":\"新闻资讯\",\"orderNum\":6,\"parentId\":366,\"parentName\":\"CMS模块\",\"perms\":\"\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"sys/news.html\"}', '127.0.0.1', '2018-01-26 15:46:57');
INSERT INTO `sys_log` VALUES ('1032', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-newspaper-o\",\"leaf\":false,\"menuId\":380,\"name\":\"新闻资讯\",\"orderNum\":0,\"parentId\":366,\"parentName\":\"CMS模块\",\"perms\":\"\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"sys/news.html\"}', '127.0.0.1', '2018-01-26 15:48:04');
INSERT INTO `sys_log` VALUES ('1033', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-commenting\",\"leaf\":false,\"menuId\":385,\"name\":\"评论管理\",\"orderNum\":1,\"parentId\":366,\"parentName\":\"CMS模块\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"sys/comment\"}', '127.0.0.1', '2018-01-26 15:49:11');
INSERT INTO `sys_log` VALUES ('1034', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-th-list\",\"leaf\":false,\"name\":\"新闻类型\",\"orderNum\":1,\"parentId\":366,\"parentName\":\"CMS模块\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"sys/newstype\"}', '127.0.0.1', '2018-01-26 15:54:37');
INSERT INTO `sys_log` VALUES ('1035', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-commenting\",\"leaf\":false,\"menuId\":385,\"name\":\"评论管理\",\"orderNum\":2,\"parentId\":366,\"parentName\":\"CMS模块\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"sys/newscomment\"}', '127.0.0.1', '2018-01-26 15:57:35');
INSERT INTO `sys_log` VALUES ('1036', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-newspaper-o\",\"leaf\":false,\"menuId\":380,\"name\":\"新闻资讯\",\"orderNum\":0,\"parentId\":366,\"parentName\":\"CMS模块\",\"perms\":\"\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"sys/news/news.html\"}', '127.0.0.1', '2018-01-26 16:04:18');
INSERT INTO `sys_log` VALUES ('1037', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-26 16:06:53');
INSERT INTO `sys_log` VALUES ('1038', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-26 16:32:02');
INSERT INTO `sys_log` VALUES ('1039', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-27 09:01:51');
INSERT INTO `sys_log` VALUES ('1040', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-27 10:11:15');
INSERT INTO `sys_log` VALUES ('1041', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-27 10:35:45');
INSERT INTO `sys_log` VALUES ('1042', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-27 11:33:35');
INSERT INTO `sys_log` VALUES ('1043', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-27 12:02:51');
INSERT INTO `sys_log` VALUES ('1044', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-27 12:41:42');
INSERT INTO `sys_log` VALUES ('1045', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"leaf\":false,\"name\":\"查看\",\"orderNum\":0,\"parentId\":386,\"parentName\":\"新闻类型\",\"perms\":\"newstype:list,newstype:info\",\"selected\":false,\"status\":0,\"type\":2}', '127.0.0.1', '2018-01-27 12:47:38');
INSERT INTO `sys_log` VALUES ('1046', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"leaf\":false,\"name\":\"新增\",\"orderNum\":0,\"parentId\":386,\"parentName\":\"新闻类型\",\"perms\":\"newstype:save\",\"selected\":false,\"status\":0,\"type\":2}', '127.0.0.1', '2018-01-27 12:48:31');
INSERT INTO `sys_log` VALUES ('1047', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"leaf\":false,\"name\":\"修改\",\"orderNum\":0,\"parentId\":386,\"parentName\":\"新闻类型\",\"perms\":\"newstype:update\",\"selected\":false,\"status\":0,\"type\":2}', '127.0.0.1', '2018-01-27 12:49:04');
INSERT INTO `sys_log` VALUES ('1048', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"leaf\":false,\"name\":\"删除\",\"orderNum\":0,\"parentId\":386,\"parentName\":\"新闻类型\",\"perms\":\"newstype:delete\",\"selected\":false,\"status\":0,\"type\":2}', '127.0.0.1', '2018-01-27 12:50:54');
INSERT INTO `sys_log` VALUES ('1049', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"leaf\":false,\"name\":\"查看\",\"orderNum\":0,\"parentId\":385,\"parentName\":\"评论管理\",\"perms\":\"newscomment:list,newscomment:info\",\"selected\":false,\"status\":0,\"type\":2}', '127.0.0.1', '2018-01-27 12:52:00');
INSERT INTO `sys_log` VALUES ('1050', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"leaf\":false,\"name\":\"新增\",\"orderNum\":0,\"parentId\":385,\"parentName\":\"评论管理\",\"perms\":\"newscomment:save\",\"selected\":false,\"status\":0,\"type\":2}', '127.0.0.1', '2018-01-27 12:52:31');
INSERT INTO `sys_log` VALUES ('1051', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"leaf\":false,\"name\":\"修改\",\"orderNum\":0,\"parentId\":385,\"parentName\":\"评论管理\",\"perms\":\"newscomment:update\",\"selected\":false,\"status\":0,\"type\":2}', '127.0.0.1', '2018-01-27 12:53:01');
INSERT INTO `sys_log` VALUES ('1052', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"leaf\":false,\"name\":\"删除\",\"orderNum\":0,\"parentId\":385,\"parentName\":\"评论管理\",\"perms\":\"newscomment:delete\",\"selected\":false,\"status\":0,\"type\":2}', '127.0.0.1', '2018-01-27 12:53:30');
INSERT INTO `sys_log` VALUES ('1053', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-27 13:01:33');
INSERT INTO `sys_log` VALUES ('1054', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-27 14:26:40');
INSERT INTO `sys_log` VALUES ('1055', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-27 14:39:23');
INSERT INTO `sys_log` VALUES ('1056', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"leaf\":false,\"name\":\"会员管理\",\"orderNum\":0,\"parentId\":0,\"parentName\":\"一级菜单\",\"selected\":false,\"status\":0,\"type\":0}', '0:0:0:0:0:0:0:1', '2018-01-27 15:13:28');
INSERT INTO `sys_log` VALUES ('1057', 'admin', '删除菜单', 'com.platform.controller.SysMenuController.delete()', '[395]', '0:0:0:0:0:0:0:1', '2018-01-27 15:13:47');
INSERT INTO `sys_log` VALUES ('1058', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-27 15:24:43');
INSERT INTO `sys_log` VALUES ('1059', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-27 15:25:54');
INSERT INTO `sys_log` VALUES ('1060', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-27 15:27:05');
INSERT INTO `sys_log` VALUES ('1061', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-01-27 15:29:05');
INSERT INTO `sys_log` VALUES ('1062', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-27 16:04:22');
INSERT INTO `sys_log` VALUES ('1063', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-01-27 16:05:56');
INSERT INTO `sys_log` VALUES ('1064', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-27 16:09:56');
INSERT INTO `sys_log` VALUES ('1065', 'admin', '修改角色', 'com.platform.controller.SysRoleController.update()', '{\"createTime\":1516934737000,\"createUserId\":1,\"deptId\":6,\"deptIdList\":[9],\"deptName\":\"技术部\",\"menuIdList\":[375,376,377,378,200,207,208,209,210,211,201,202,203,204,205,249,250,251,252,253,264,265,266,280,281,282,283,284,285,286,287,288,212,213,214,215,216,222,223,224,225,226,227,259,260,261,262,263,307,308,309,310,311,297,298,299,300,301,254,256,257,258,255,315,316,317,318,319,325,326,327,328,329,331,332,333,334,335,357,289,290,291,292,293,352,353,354,355,356,342,343,344,345,346,347,348,349,350,351,361,362,363,364,365,336,341,337,338,339,340,358,359,1,2,15,16,17,18,3,19,20,21,22,368,369,370,371,372,373,4,23,24,25,26,6,7,8,9,10,11,12,13,14,30,302,303,304,305,306,27,29,379,5,28],\"remark\":\"移动\",\"roleId\":6,\"roleName\":\"tyjsyf001大队长\"}', '0:0:0:0:0:0:0:1', '2018-01-27 16:12:32');
INSERT INTO `sys_log` VALUES ('1066', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-01-27 16:12:45');
INSERT INTO `sys_log` VALUES ('1067', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-27 16:13:54');
INSERT INTO `sys_log` VALUES ('1068', 'admin', '修改角色', 'com.platform.controller.SysRoleController.update()', '{\"createTime\":1516934737000,\"createUserId\":1,\"deptId\":11,\"deptIdList\":[5,11],\"deptName\":\"酱油部\",\"menuIdList\":[375,376,377,378,200,207,208,209,210,211,201,202,203,204,205,249,250,251,252,253,264,265,266,280,281,282,283,284,285,286,287,288,212,213,214,215,216,222,223,224,225,226,227,259,260,261,262,263,307,308,309,310,311,297,298,299,300,301,254,256,257,258,255,315,316,317,318,319,325,326,327,328,329,331,332,333,334,335,357,289,290,291,292,293,352,353,354,355,356,342,343,344,345,346,347,348,349,350,351,361,362,363,364,365,336,341,337,338,339,340,358,359,1,2,15,16,17,18,3,19,20,21,22,368,369,370,371,372,373,4,23,24,25,26,6,7,8,9,10,11,12,13,14,30,302,303,304,305,306,27,29,379,5,28],\"remark\":\"移动\",\"roleId\":6,\"roleName\":\"tyjsyf001大队长\"}', '0:0:0:0:0:0:0:1', '2018-01-27 16:15:01');
INSERT INTO `sys_log` VALUES ('1069', 'admin', '修改用户', 'com.platform.controller.SysUserController.update()', '{\"createTime\":1516934832000,\"createUserId\":1,\"deptId\":11,\"deptName\":\"酱油部\",\"email\":\"test@aliyun.com\",\"mobile\":\"18525852582\",\"roleIdList\":[6],\"status\":1,\"userId\":2,\"username\":\"test\"}', '0:0:0:0:0:0:0:1', '2018-01-27 16:15:27');
INSERT INTO `sys_log` VALUES ('1070', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-01-27 16:15:54');
INSERT INTO `sys_log` VALUES ('1071', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-01-27 16:16:09');
INSERT INTO `sys_log` VALUES ('1072', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-01-27 16:16:20');
INSERT INTO `sys_log` VALUES ('1073', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-01-27 16:16:26');
INSERT INTO `sys_log` VALUES ('1074', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-01-27 16:16:35');
INSERT INTO `sys_log` VALUES ('1075', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-01-27 16:17:01');
INSERT INTO `sys_log` VALUES ('1076', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-27 16:17:21');
INSERT INTO `sys_log` VALUES ('1077', 'admin', '修改角色', 'com.platform.controller.SysRoleController.update()', '{\"createTime\":1516934737000,\"createUserId\":1,\"deptId\":5,\"deptIdList\":[5,6,7,10,11],\"deptName\":\"上海移动公司\",\"menuIdList\":[375,376,377,378,200,207,208,209,210,211,201,202,203,204,205,249,250,251,252,253,264,265,266,280,281,282,283,284,285,286,287,288,212,213,214,215,216,222,223,224,225,226,227,259,260,261,262,263,307,308,309,310,311,297,298,299,300,301,254,256,257,258,255,315,316,317,318,319,325,326,327,328,329,331,332,333,334,335,357,289,290,291,292,293,352,353,354,355,356,342,343,344,345,346,347,348,349,350,351,361,362,363,364,365,336,341,337,338,339,340,358,359,1,2,15,16,17,18,3,19,20,21,22,368,369,370,371,372,373,4,23,24,25,26,6,7,8,9,10,11,12,13,14,30,302,303,304,305,306,27,29,379,5,28],\"remark\":\"移动\",\"roleId\":6,\"roleName\":\"tyjsyf001大队长\"}', '0:0:0:0:0:0:0:1', '2018-01-27 16:20:00');
INSERT INTO `sys_log` VALUES ('1078', 'admin', '修改用户', 'com.platform.controller.SysUserController.update()', '{\"createTime\":1516934832000,\"createUserId\":1,\"deptId\":11,\"deptName\":\"酱油部\",\"email\":\"test@aliyun.com\",\"mobile\":\"18525852582\",\"roleIdList\":[6],\"status\":1,\"userId\":2,\"username\":\"test\"}', '0:0:0:0:0:0:0:1', '2018-01-27 16:20:17');
INSERT INTO `sys_log` VALUES ('1079', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-01-27 16:20:42');
INSERT INTO `sys_log` VALUES ('1080', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-01-27 16:21:19');
INSERT INTO `sys_log` VALUES ('1081', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-01-27 16:21:58');
INSERT INTO `sys_log` VALUES ('1082', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-01-27 16:22:31');
INSERT INTO `sys_log` VALUES ('1083', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-01-27 16:23:52');
INSERT INTO `sys_log` VALUES ('1084', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-27 16:32:22');
INSERT INTO `sys_log` VALUES ('1085', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-01-27 16:43:41');
INSERT INTO `sys_log` VALUES ('1086', 'test', '修改密码', 'com.platform.controller.SysUserController.password()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-27 16:44:16');
INSERT INTO `sys_log` VALUES ('1087', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-01-27 16:44:27');
INSERT INTO `sys_log` VALUES ('1088', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-27 16:48:26');
INSERT INTO `sys_log` VALUES ('1089', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-27 16:57:36');
INSERT INTO `sys_log` VALUES ('1090', 'admin', '修改角色', 'com.platform.controller.SysRoleController.update()', '{\"createTime\":1516934737000,\"createUserId\":1,\"deptId\":5,\"deptIdList\":[5,6,7,10,11],\"deptName\":\"上海移动公司\",\"menuIdList\":[375,376,377,378,200,207,208,209,210,211,201,202,203,204,205,249,250,251,252,253,264,265,266,280,281,282,283,284,285,286,287,288,212,213,214,215,216,222,223,224,225,226,227,259,260,261,262,263,307,308,309,310,311,297,298,299,300,301,254,256,257,258,255,315,316,317,318,319,325,326,327,328,329,331,332,333,334,335,357,289,290,291,292,293,352,353,354,355,356,342,343,344,345,346,347,348,349,350,351,361,362,363,364,365,336,341,337,338,339,340,358,359,366,380,381,382,383,384,386,387,388,389,390,385,391,392,393,394,1,2,15,16,17,18,3,19,20,21,22,368,369,370,371,372,373,4,23,24,25,26,6,7,8,9,10,11,12,13,14,30,302,303,304,305,306,27,29,379,5,28],\"remark\":\"移动\",\"roleId\":6,\"roleName\":\"tyjsyf001大队长\"}', '0:0:0:0:0:0:0:1', '2018-01-27 16:59:12');
INSERT INTO `sys_log` VALUES ('1091', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-01-27 16:59:25');
INSERT INTO `sys_log` VALUES ('1092', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-27 17:02:06');
INSERT INTO `sys_log` VALUES ('1093', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '127.0.0.1', '2018-01-27 17:03:31');
INSERT INTO `sys_log` VALUES ('1094', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-27 17:04:52');
INSERT INTO `sys_log` VALUES ('1095', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '127.0.0.1', '2018-01-27 17:10:56');
INSERT INTO `sys_log` VALUES ('1096', 'test', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-01-27 17:22:59');
INSERT INTO `sys_log` VALUES ('1097', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-01-27 17:30:18');
INSERT INTO `sys_log` VALUES ('1098', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-01-27 17:32:52');
INSERT INTO `sys_log` VALUES ('1099', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-27 17:33:19');
INSERT INTO `sys_log` VALUES ('1100', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-27 17:37:51');
INSERT INTO `sys_log` VALUES ('1101', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-27 18:05:52');
INSERT INTO `sys_log` VALUES ('1102', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-27 18:14:02');
INSERT INTO `sys_log` VALUES ('1103', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-28 09:33:16');
INSERT INTO `sys_log` VALUES ('1104', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-28 10:51:16');
INSERT INTO `sys_log` VALUES ('1105', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-28 10:55:09');
INSERT INTO `sys_log` VALUES ('1106', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-28 12:07:25');
INSERT INTO `sys_log` VALUES ('1107', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-28 12:44:56');
INSERT INTO `sys_log` VALUES ('1108', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-28 12:45:06');
INSERT INTO `sys_log` VALUES ('1109', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-28 12:46:20');
INSERT INTO `sys_log` VALUES ('1110', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-28 14:57:06');
INSERT INTO `sys_log` VALUES ('1111', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-28 15:14:30');
INSERT INTO `sys_log` VALUES ('1112', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-28 15:37:32');
INSERT INTO `sys_log` VALUES ('1113', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-28 15:37:42');
INSERT INTO `sys_log` VALUES ('1114', 'admin', '保存角色', 'com.platform.controller.SysRoleController.save()', '{\"deptId\":7,\"deptIdList\":[],\"deptName\":\"客服部\",\"menuIdList\":[375,376,377,378,200,207,208,209,210,211,201,202,203,204,205,249,250,251,252,253,264,265,266,280,281,282,283,284,285,286,287,288,212,213,214,215,216,222,223,224,225,226,227,259,260,261,262,263,307,308,309,310,311,297,298,299,300,301,254,256,257,258,255,315,316,317,318,319,325,326,327,328,329,331,332,333,334,335,357,289,290,291,292,293,352,353,354,355,356,342,343,344,345,346,347,348,349,350,351,361,362,363,364,365,336,341,337,338,339,340,358,359,374,294,360,295,296,243,238,239,240,241,242,233,234,235,236,237,244,330,245,246,247,248,275,276,277,278,279,270,271,272,273,274,366,380,381,382,383,384,386,387,388,389,390,385,391,392,393,394,1,2,15,16,17,18,3,19,20,21,22,368,369,370,371,372,373,4,23,24,25,26,6,7,8,9,10,11,12,13,14,30,302,303,304,305,306,27,29,379,5,28],\"remark\":\"移动\",\"roleName\":\"客服经理\"}', '0:0:0:0:0:0:0:1', '2018-01-28 15:39:37');
INSERT INTO `sys_log` VALUES ('1115', 'admin', '保存用户', 'com.platform.controller.SysUserController.save()', '{\"deptId\":7,\"deptName\":\"客服部\",\"email\":\"123@qq.com\",\"mobile\":\"12345678999\",\"roleIdList\":[7],\"status\":1,\"username\":\"kfjl\"}', '0:0:0:0:0:0:0:1', '2018-01-28 15:40:30');
INSERT INTO `sys_log` VALUES ('1116', '\"kfjl\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"kfjl\"', '0:0:0:0:0:0:0:1', '2018-01-28 15:41:05');
INSERT INTO `sys_log` VALUES ('1117', '\"kfjl\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"kfjl\"', '0:0:0:0:0:0:0:1', '2018-01-28 15:41:12');
INSERT INTO `sys_log` VALUES ('1118', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-28 15:42:17');
INSERT INTO `sys_log` VALUES ('1119', 'admin', '修改角色', 'com.platform.controller.SysRoleController.update()', '{\"createTime\":1517125177000,\"createUserId\":1,\"deptId\":7,\"deptIdList\":[6],\"deptName\":\"客服部\",\"menuIdList\":[375,376,377,378,200,207,208,209,210,211,201,202,203,204,205,249,250,251,252,253,264,265,266,280,281,282,283,284,285,286,287,288,212,213,214,215,216,222,223,224,225,226,227,259,260,261,262,263,307,308,309,310,311,297,298,299,300,301,254,256,257,258,255,315,316,317,318,319,325,326,327,328,329,331,332,333,334,335,357,289,290,291,292,293,352,353,354,355,356,342,343,344,345,346,347,348,349,350,351,361,362,363,364,365,336,341,337,338,339,340,358,359,374,294,360,295,296,243,238,239,240,241,242,233,234,235,236,237,244,330,245,246,247,248,275,276,277,278,279,270,271,272,273,274,366,380,381,382,383,384,386,387,388,389,390,385,391,392,393,394,1,2,15,16,17,18,3,19,20,21,22,368,369,370,371,372,373,4,23,24,25,26,6,7,8,9,10,11,12,13,14,30,302,303,304,305,306,27,29,379,5,28],\"remark\":\"移动\",\"roleId\":7,\"roleName\":\"客服经理\"}', '0:0:0:0:0:0:0:1', '2018-01-28 15:42:41');
INSERT INTO `sys_log` VALUES ('1120', '\"kfjl\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"kfjl\"', '0:0:0:0:0:0:0:1', '2018-01-28 15:42:57');
INSERT INTO `sys_log` VALUES ('1121', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-28 15:44:31');
INSERT INTO `sys_log` VALUES ('1122', 'admin', '保存角色', 'com.platform.controller.SysRoleController.save()', '{\"deptId\":5,\"deptIdList\":[5],\"deptName\":\"上海移动公司\",\"menuIdList\":[366,380,381,382,383,384,386,387,388,389,390,385,391,392,393,394],\"remark\":\"移动\",\"roleName\":\"移动顶级部门\"}', '0:0:0:0:0:0:0:1', '2018-01-28 16:17:08');
INSERT INTO `sys_log` VALUES ('1123', 'admin', '保存用户', 'com.platform.controller.SysUserController.save()', '{\"deptId\":5,\"deptName\":\"上海移动公司\",\"email\":\"111@qq.com\",\"mobile\":\"12312312311\",\"roleIdList\":[8],\"status\":1,\"username\":\"001\"}', '0:0:0:0:0:0:0:1', '2018-01-28 16:17:45');
INSERT INTO `sys_log` VALUES ('1124', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '127.0.0.1', '2018-01-28 16:18:02');
INSERT INTO `sys_log` VALUES ('1125', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '0:0:0:0:0:0:0:1', '2018-01-28 16:18:45');
INSERT INTO `sys_log` VALUES ('1126', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-28 16:22:40');
INSERT INTO `sys_log` VALUES ('1127', 'admin', '保存角色', 'com.platform.controller.SysRoleController.save()', '{\"deptId\":10,\"deptIdList\":[10],\"deptName\":\"专线部\",\"menuIdList\":[366,380,381,382,383,384,386,387,388,389,390,385,391,392,393,394],\"remark\":\"移动下de用户\",\"roleName\":\"移动下de用户\"}', '127.0.0.1', '2018-01-28 16:25:22');
INSERT INTO `sys_log` VALUES ('1128', 'admin', '保存用户', 'com.platform.controller.SysUserController.save()', '{\"deptId\":10,\"deptName\":\"专线部\",\"email\":\"yugu@wsd.com\",\"mobile\":\"12312312312\",\"roleIdList\":[9],\"status\":1,\"username\":\"002\"}', '127.0.0.1', '2018-01-28 16:25:55');
INSERT INTO `sys_log` VALUES ('1129', '\"002\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"002\"', '127.0.0.1', '2018-01-28 16:26:12');
INSERT INTO `sys_log` VALUES ('1130', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-28 16:56:33');
INSERT INTO `sys_log` VALUES ('1131', '\"002\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"002\"', '0:0:0:0:0:0:0:1', '2018-01-28 16:57:54');
INSERT INTO `sys_log` VALUES ('1132', '\"002\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"002\"', '0:0:0:0:0:0:0:1', '2018-01-28 17:08:42');
INSERT INTO `sys_log` VALUES ('1133', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '0:0:0:0:0:0:0:1', '2018-01-28 17:09:48');
INSERT INTO `sys_log` VALUES ('1134', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '0:0:0:0:0:0:0:1', '2018-01-28 17:09:57');
INSERT INTO `sys_log` VALUES ('1135', '\"002\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"002\"', '0:0:0:0:0:0:0:1', '2018-01-28 17:12:02');
INSERT INTO `sys_log` VALUES ('1136', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-28 17:12:27');
INSERT INTO `sys_log` VALUES ('1137', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-28 17:24:08');
INSERT INTO `sys_log` VALUES ('1138', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '0:0:0:0:0:0:0:1', '2018-01-28 17:30:35');
INSERT INTO `sys_log` VALUES ('1139', '\"002\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"002\"', '0:0:0:0:0:0:0:1', '2018-01-28 17:30:55');
INSERT INTO `sys_log` VALUES ('1140', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-28 17:59:55');
INSERT INTO `sys_log` VALUES ('1141', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '0:0:0:0:0:0:0:1', '2018-01-28 18:21:20');
INSERT INTO `sys_log` VALUES ('1142', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-29 09:00:59');
INSERT INTO `sys_log` VALUES ('1143', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-29 09:17:59');
INSERT INTO `sys_log` VALUES ('1144', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-29 10:22:17');
INSERT INTO `sys_log` VALUES ('1145', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-29 10:22:22');
INSERT INTO `sys_log` VALUES ('1146', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-29 10:25:56');
INSERT INTO `sys_log` VALUES ('1147', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-29 11:18:19');
INSERT INTO `sys_log` VALUES ('1148', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-29 11:18:27');
INSERT INTO `sys_log` VALUES ('1149', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-29 11:18:34');
INSERT INTO `sys_log` VALUES ('1150', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-29 11:18:37');
INSERT INTO `sys_log` VALUES ('1151', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-29 14:03:07');
INSERT INTO `sys_log` VALUES ('1152', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-29 14:23:04');
INSERT INTO `sys_log` VALUES ('1153', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-29 14:39:03');
INSERT INTO `sys_log` VALUES ('1154', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-29 14:45:15');
INSERT INTO `sys_log` VALUES ('1155', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-29 14:49:42');
INSERT INTO `sys_log` VALUES ('1156', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-29 14:53:00');
INSERT INTO `sys_log` VALUES ('1157', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-29 15:06:12');
INSERT INTO `sys_log` VALUES ('1158', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '0:0:0:0:0:0:0:1', '2018-01-29 15:15:45');
INSERT INTO `sys_log` VALUES ('1159', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-29 15:16:01');
INSERT INTO `sys_log` VALUES ('1160', 'admin', '修改角色', 'com.platform.controller.SysRoleController.update()', '{\"createTime\":1517127922000,\"createUserId\":1,\"deptId\":10,\"deptIdList\":[10],\"deptName\":\"专线部\",\"menuIdList\":[357,289,290,291,292,293,352,353,354,355,356,342,343,344,345,346,347,348,349,350,351,361,362,363,364,365,336,341,337,338,339,340,358,359,366,380,381,382,383,384,386,387,388,389,390,385,391,392,393,394],\"remark\":\"移动下de用户\",\"roleId\":9,\"roleName\":\"移动下de用户\"}', '0:0:0:0:0:0:0:1', '2018-01-29 15:16:51');
INSERT INTO `sys_log` VALUES ('1161', 'admin', '修改角色', 'com.platform.controller.SysRoleController.update()', '{\"createTime\":1517127429000,\"createUserId\":1,\"deptId\":5,\"deptIdList\":[5],\"deptName\":\"上海移动公司\",\"menuIdList\":[357,289,290,291,292,293,352,353,354,355,356,342,343,344,345,346,347,348,349,350,351,361,362,363,364,365,336,341,337,338,339,340,358,359,366,380,381,382,383,384,386,387,388,389,390,385,391,392,393,394],\"remark\":\"移动\",\"roleId\":8,\"roleName\":\"移动顶级部门\"}', '0:0:0:0:0:0:0:1', '2018-01-29 15:17:20');
INSERT INTO `sys_log` VALUES ('1162', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '0:0:0:0:0:0:0:1', '2018-01-29 15:17:40');
INSERT INTO `sys_log` VALUES ('1163', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '0:0:0:0:0:0:0:1', '2018-01-29 15:32:44');
INSERT INTO `sys_log` VALUES ('1164', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '0:0:0:0:0:0:0:1', '2018-01-29 15:32:52');
INSERT INTO `sys_log` VALUES ('1165', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-29 15:41:07');
INSERT INTO `sys_log` VALUES ('1166', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-29 15:52:21');
INSERT INTO `sys_log` VALUES ('1167', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '0:0:0:0:0:0:0:1', '2018-01-29 15:57:40');
INSERT INTO `sys_log` VALUES ('1168', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '0:0:0:0:0:0:0:1', '2018-01-29 15:59:58');
INSERT INTO `sys_log` VALUES ('1169', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-29 16:06:22');
INSERT INTO `sys_log` VALUES ('1170', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-29 16:23:09');
INSERT INTO `sys_log` VALUES ('1171', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-29 16:23:22');
INSERT INTO `sys_log` VALUES ('1172', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-29 16:30:25');
INSERT INTO `sys_log` VALUES ('1173', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-29 17:32:36');
INSERT INTO `sys_log` VALUES ('1174', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-29 17:44:01');
INSERT INTO `sys_log` VALUES ('1175', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-29 18:01:20');
INSERT INTO `sys_log` VALUES ('1176', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-29 18:07:54');
INSERT INTO `sys_log` VALUES ('1177', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '127.0.0.1', '2018-01-30 09:40:21');
INSERT INTO `sys_log` VALUES ('1178', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-30 09:42:40');
INSERT INTO `sys_log` VALUES ('1179', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-30 11:52:11');
INSERT INTO `sys_log` VALUES ('1180', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-30 13:02:00');
INSERT INTO `sys_log` VALUES ('1181', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-30 13:02:06');
INSERT INTO `sys_log` VALUES ('1182', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-30 13:39:21');
INSERT INTO `sys_log` VALUES ('1183', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-30 14:13:39');
INSERT INTO `sys_log` VALUES ('1184', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-30 14:40:05');
INSERT INTO `sys_log` VALUES ('1185', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-30 14:47:21');
INSERT INTO `sys_log` VALUES ('1186', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-30 14:57:49');
INSERT INTO `sys_log` VALUES ('1187', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-30 15:00:32');
INSERT INTO `sys_log` VALUES ('1188', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-30 15:21:10');
INSERT INTO `sys_log` VALUES ('1189', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-30 15:27:56');
INSERT INTO `sys_log` VALUES ('1190', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-30 15:28:06');
INSERT INTO `sys_log` VALUES ('1191', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-30 15:35:58');
INSERT INTO `sys_log` VALUES ('1192', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-30 15:42:58');
INSERT INTO `sys_log` VALUES ('1193', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-30 16:09:35');
INSERT INTO `sys_log` VALUES ('1194', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-30 17:27:42');
INSERT INTO `sys_log` VALUES ('1195', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-30 17:30:59');
INSERT INTO `sys_log` VALUES ('1196', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-30 18:06:26');
INSERT INTO `sys_log` VALUES ('1197', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-30 18:31:22');
INSERT INTO `sys_log` VALUES ('1198', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-31 09:26:25');
INSERT INTO `sys_log` VALUES ('1199', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-31 10:12:33');
INSERT INTO `sys_log` VALUES ('1200', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-31 10:49:22');
INSERT INTO `sys_log` VALUES ('1201', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '0:0:0:0:0:0:0:1', '2018-01-31 11:18:14');
INSERT INTO `sys_log` VALUES ('1202', '\"002\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"002\"', '0:0:0:0:0:0:0:1', '2018-01-31 11:19:08');
INSERT INTO `sys_log` VALUES ('1203', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-31 11:26:21');
INSERT INTO `sys_log` VALUES ('1204', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-31 11:58:27');
INSERT INTO `sys_log` VALUES ('1205', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '0:0:0:0:0:0:0:1', '2018-01-31 13:36:47');
INSERT INTO `sys_log` VALUES ('1206', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-31 13:36:59');
INSERT INTO `sys_log` VALUES ('1207', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-01-31 13:47:40');
INSERT INTO `sys_log` VALUES ('1208', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-31 13:54:41');
INSERT INTO `sys_log` VALUES ('1209', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-31 14:08:21');
INSERT INTO `sys_log` VALUES ('1210', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-31 17:13:52');
INSERT INTO `sys_log` VALUES ('1211', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-31 17:22:23');
INSERT INTO `sys_log` VALUES ('1212', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-31 17:32:47');
INSERT INTO `sys_log` VALUES ('1213', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-31 17:32:53');
INSERT INTO `sys_log` VALUES ('1214', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-31 17:57:19');
INSERT INTO `sys_log` VALUES ('1215', '\"002\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"002\"', '0:0:0:0:0:0:0:1', '2018-01-31 17:57:29');
INSERT INTO `sys_log` VALUES ('1216', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-01-31 18:12:08');
INSERT INTO `sys_log` VALUES ('1217', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-01 10:09:45');
INSERT INTO `sys_log` VALUES ('1218', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-01 10:43:15');
INSERT INTO `sys_log` VALUES ('1219', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-01 11:12:13');
INSERT INTO `sys_log` VALUES ('1220', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-01 11:42:46');
INSERT INTO `sys_log` VALUES ('1221', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-01 13:48:19');
INSERT INTO `sys_log` VALUES ('1222', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-02-01 14:24:15');
INSERT INTO `sys_log` VALUES ('1223', '\"002\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"002\"', '0:0:0:0:0:0:0:1', '2018-02-01 16:13:33');
INSERT INTO `sys_log` VALUES ('1224', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-02-02 09:22:11');
INSERT INTO `sys_log` VALUES ('1225', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-02 09:36:51');
INSERT INTO `sys_log` VALUES ('1226', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '0:0:0:0:0:0:0:1', '2018-02-02 11:33:51');
INSERT INTO `sys_log` VALUES ('1227', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-02 13:52:42');
INSERT INTO `sys_log` VALUES ('1228', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-02-02 13:59:06');
INSERT INTO `sys_log` VALUES ('1229', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-02 14:07:13');
INSERT INTO `sys_log` VALUES ('1230', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-02-02 16:43:31');
INSERT INTO `sys_log` VALUES ('1231', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-02 17:20:41');
INSERT INTO `sys_log` VALUES ('1232', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-02 17:55:44');
INSERT INTO `sys_log` VALUES ('1233', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-02 17:59:24');
INSERT INTO `sys_log` VALUES ('1234', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-02 18:07:32');
INSERT INTO `sys_log` VALUES ('1235', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-02 18:20:56');
INSERT INTO `sys_log` VALUES ('1236', 'admin', '修改角色', 'com.platform.controller.SysRoleController.update()', '{\"createTime\":1505666415000,\"createUserId\":1,\"deptId\":1,\"deptIdList\":[1],\"deptName\":\"DEMO有限公司\",\"menuIdList\":[375,376,377,378,200,207,208,209,210,211,201,202,203,204,205,249,250,251,252,253,264,265,266,280,281,282,283,284,285,286,287,288,212,213,214,215,216,222,223,224,225,226,227,259,260,261,262,263,307,308,309,310,311,297,298,299,300,301,254,256,257,258,255,315,316,317,318,319,325,326,327,328,329,331,332,333,334,335,357,289,290,291,292,293,352,353,354,355,356,342,343,344,345,346,347,348,349,350,351,361,362,363,364,365,336,341,337,338,339,340,358,359,374,294,360,295,296,243,238,239,240,241,242,233,234,235,236,237,244,330,245,246,247,248,275,276,277,278,279,270,271,272,273,274,312,313,366,380,381,382,383,384,386,387,388,389,390,385,391,392,393,394,314,1,2,15,16,17,18,3,19,20,21,22,368,369,370,371,372,373,4,23,24,25,26,6,7,8,9,10,11,12,13,14,30,302,303,304,305,306,395,396,397,398,399,27,29,379,5,28,31,367,206],\"remark\":\"超级管理员\",\"roleId\":5,\"roleName\":\"超级管理员\"}', '127.0.0.1', '2018-02-02 18:24:49');
INSERT INTO `sys_log` VALUES ('1237', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-file-code-o\",\"identify\":0,\"leaf\":false,\"menuId\":395,\"name\":\"多店铺设置\",\"orderNum\":6,\"parentId\":1,\"parentName\":\"系统管理\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"store/storeconfigure.html\"}', '127.0.0.1', '2018-02-02 18:25:36');
INSERT INTO `sys_log` VALUES ('1238', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-02-02 18:39:50');
INSERT INTO `sys_log` VALUES ('1239', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-03 10:11:47');
INSERT INTO `sys_log` VALUES ('1240', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-02-03 10:48:32');
INSERT INTO `sys_log` VALUES ('1241', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-02-03 10:59:16');
INSERT INTO `sys_log` VALUES ('1242', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-02-03 11:15:36');
INSERT INTO `sys_log` VALUES ('1243', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '0:0:0:0:0:0:0:1', '2018-02-03 11:16:45');
INSERT INTO `sys_log` VALUES ('1244', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '0:0:0:0:0:0:0:1', '2018-02-03 11:25:18');
INSERT INTO `sys_log` VALUES ('1245', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-03 16:00:54');
INSERT INTO `sys_log` VALUES ('1246', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-02-03 16:55:24');
INSERT INTO `sys_log` VALUES ('1247', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '0:0:0:0:0:0:0:1', '2018-02-03 17:04:16');
INSERT INTO `sys_log` VALUES ('1248', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-02-03 17:04:34');
INSERT INTO `sys_log` VALUES ('1249', 'admin', '修改角色', 'com.platform.controller.SysRoleController.update()', '{\"createTime\":1517127429000,\"createUserId\":1,\"deptId\":5,\"deptIdList\":[5],\"deptName\":\"上海移动公司\",\"menuIdList\":[357,289,290,291,292,293,352,353,354,355,356,342,343,344,345,346,347,348,349,350,351,361,362,363,364,365,336,341,337,338,339,340,358,359,374,294,360,295,296,366,380,381,382,383,384,386,387,388,389,390,385,391,392,393,394],\"remark\":\"移动\",\"roleId\":8,\"roleName\":\"移动顶级部门\"}', '0:0:0:0:0:0:0:1', '2018-02-03 17:06:10');
INSERT INTO `sys_log` VALUES ('1250', 'admin', '修改角色', 'com.platform.controller.SysRoleController.update()', '{\"createTime\":1517127922000,\"createUserId\":1,\"deptId\":10,\"deptIdList\":[10],\"deptName\":\"专线部\",\"menuIdList\":[357,289,290,291,292,293,352,353,354,355,356,342,343,344,345,346,347,348,349,350,351,361,362,363,364,365,336,341,337,338,339,340,358,359,374,294,360,295,296,366,380,381,382,383,384,386,387,388,389,390,385,391,392,393,394],\"remark\":\"移动下de用户\",\"roleId\":9,\"roleName\":\"移动下de用户\"}', '0:0:0:0:0:0:0:1', '2018-02-03 17:06:32');
INSERT INTO `sys_log` VALUES ('1251', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '0:0:0:0:0:0:0:1', '2018-02-03 17:06:45');
INSERT INTO `sys_log` VALUES ('1252', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '0:0:0:0:0:0:0:1', '2018-02-03 17:11:03');
INSERT INTO `sys_log` VALUES ('1253', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '0:0:0:0:0:0:0:1', '2018-02-03 17:12:55');
INSERT INTO `sys_log` VALUES ('1254', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '0:0:0:0:0:0:0:1', '2018-02-03 17:46:03');
INSERT INTO `sys_log` VALUES ('1255', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-02-03 17:55:29');
INSERT INTO `sys_log` VALUES ('1256', '\"002\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"002\"', '0:0:0:0:0:0:0:1', '2018-02-04 09:42:05');
INSERT INTO `sys_log` VALUES ('1257', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-04 09:53:53');
INSERT INTO `sys_log` VALUES ('1258', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-04 10:29:07');
INSERT INTO `sys_log` VALUES ('1259', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-04 10:30:12');
INSERT INTO `sys_log` VALUES ('1260', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-04 10:30:17');
INSERT INTO `sys_log` VALUES ('1261', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-04 13:48:05');
INSERT INTO `sys_log` VALUES ('1262', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '0:0:0:0:0:0:0:1', '2018-02-04 14:14:36');
INSERT INTO `sys_log` VALUES ('1263', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-02-04 15:54:03');
INSERT INTO `sys_log` VALUES ('1264', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-05 16:54:10');
INSERT INTO `sys_log` VALUES ('1265', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-25 09:35:19');
INSERT INTO `sys_log` VALUES ('1266', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-25 09:35:27');
INSERT INTO `sys_log` VALUES ('1267', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-25 09:35:39');
INSERT INTO `sys_log` VALUES ('1268', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-25 09:35:54');
INSERT INTO `sys_log` VALUES ('1269', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-25 09:36:32');
INSERT INTO `sys_log` VALUES ('1270', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-25 09:36:44');
INSERT INTO `sys_log` VALUES ('1271', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-25 09:38:28');
INSERT INTO `sys_log` VALUES ('1272', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-25 09:40:55');
INSERT INTO `sys_log` VALUES ('1273', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-25 09:41:21');
INSERT INTO `sys_log` VALUES ('1274', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-25 09:41:27');
INSERT INTO `sys_log` VALUES ('1275', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-25 09:41:51');
INSERT INTO `sys_log` VALUES ('1276', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-02-26 09:24:50');
INSERT INTO `sys_log` VALUES ('1277', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-02-27 09:08:13');
INSERT INTO `sys_log` VALUES ('1278', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-02-27 09:26:37');
INSERT INTO `sys_log` VALUES ('1279', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-03-07 09:25:20');
INSERT INTO `sys_log` VALUES ('1280', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-03-07 15:32:35');
INSERT INTO `sys_log` VALUES ('1281', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-03-07 17:49:00');
INSERT INTO `sys_log` VALUES ('1282', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-03-22 15:17:37');
INSERT INTO `sys_log` VALUES ('1283', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-22 15:23:18');
INSERT INTO `sys_log` VALUES ('1284', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-22 15:23:27');
INSERT INTO `sys_log` VALUES ('1285', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-22 15:24:27');
INSERT INTO `sys_log` VALUES ('1286', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-weixin\",\"identify\":0,\"leaf\":false,\"menuId\":312,\"name\":\"微信公众号\",\"orderNum\":6,\"parentId\":0,\"parentName\":\"一级菜单\",\"selected\":false,\"status\":1,\"type\":0}', '127.0.0.1', '2018-03-22 15:27:50');
INSERT INTO `sys_log` VALUES ('1287', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-weixin\",\"identify\":0,\"leaf\":false,\"menuId\":312,\"name\":\"微信公众号\",\"orderNum\":6,\"parentId\":0,\"parentName\":\"一级菜单\",\"selected\":false,\"status\":0,\"type\":0}', '127.0.0.1', '2018-03-22 15:29:32');
INSERT INTO `sys_log` VALUES ('1288', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-weixin\",\"identify\":0,\"leaf\":false,\"menuId\":312,\"name\":\"微信公众号\",\"orderNum\":6,\"parentId\":312,\"parentName\":\"微信公众号\",\"selected\":false,\"status\":0,\"type\":0}', '127.0.0.1', '2018-03-22 15:30:54');
INSERT INTO `sys_log` VALUES ('1289', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-22 15:33:23');
INSERT INTO `sys_log` VALUES ('1290', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-22 15:33:30');
INSERT INTO `sys_log` VALUES ('1291', 'admin', '修改角色', 'com.platform.controller.SysRoleController.update()', '{\"createTime\":1505666415000,\"createUserId\":1,\"deptId\":1,\"deptIdList\":[1],\"deptName\":\"DEMO有限公司\",\"menuIdList\":[375,376,377,378,200,207,208,209,210,211,201,202,203,204,205,249,250,251,252,253,264,265,266,280,281,282,283,284,285,286,287,288,212,213,214,215,216,222,223,224,225,226,227,259,260,261,262,263,307,308,309,310,311,297,298,299,300,301,254,256,257,258,255,315,316,317,318,319,325,326,327,328,329,331,332,333,334,335,357,289,290,291,292,293,352,353,354,355,356,342,343,344,345,346,347,348,349,350,351,361,362,363,364,365,336,341,337,338,339,340,358,359,374,294,360,295,296,243,238,239,240,241,242,233,234,235,236,237,244,330,245,246,247,248,275,276,277,278,279,270,271,272,273,274,366,380,381,382,383,384,386,387,388,389,390,385,391,392,393,394,1,2,15,16,17,18,3,19,20,21,22,368,369,370,371,372,373,4,23,24,25,26,6,7,8,9,10,11,12,13,14,30,302,303,304,305,306,395,396,397,398,399,27,29,379,5,28],\"remark\":\"超级管理员\",\"roleId\":5,\"roleName\":\"超级管理员\"}', '127.0.0.1', '2018-03-22 15:34:41');
INSERT INTO `sys_log` VALUES ('1292', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-03-22 15:36:02');
INSERT INTO `sys_log` VALUES ('1293', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-22 15:36:09');
INSERT INTO `sys_log` VALUES ('1294', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-weixin\",\"identify\":0,\"leaf\":false,\"menuId\":312,\"name\":\"微信公众号\",\"orderNum\":6,\"parentId\":31,\"parentName\":\"功能测试\",\"selected\":false,\"status\":0,\"type\":0}', '127.0.0.1', '2018-03-22 15:39:02');
INSERT INTO `sys_log` VALUES ('1295', 'admin', '修改角色', 'com.platform.controller.SysRoleController.update()', '{\"createTime\":1505666415000,\"createUserId\":1,\"deptId\":1,\"deptIdList\":[1],\"deptName\":\"DEMO有限公司\",\"menuIdList\":[375,376,377,378,200,207,208,209,210,211,201,202,203,204,205,249,250,251,252,253,264,265,266,280,281,282,283,284,285,286,287,288,212,213,214,215,216,222,223,224,225,226,227,259,260,261,262,263,307,308,309,310,311,297,298,299,300,301,254,256,257,258,255,315,316,317,318,319,325,326,327,328,329,331,332,333,334,335,357,289,290,291,292,293,352,353,354,355,356,342,343,344,345,346,347,348,349,350,351,361,362,363,364,365,336,341,337,338,339,340,358,359,374,294,360,295,296,243,238,239,240,241,242,233,234,235,236,237,244,330,245,246,247,248,275,276,277,278,279,270,271,272,273,274,366,380,381,382,383,384,385,391,392,393,394,1,2,15,16,17,18,3,19,20,21,22,368,369,370,371,372,373,4,23,24,25,26,6,7,8,9,10,11,12,13,14,30,302,303,304,305,306,395,396,397,398,399,27,29,379,5,28],\"remark\":\"超级管理员\",\"roleId\":5,\"roleName\":\"超级管理员\"}', '127.0.0.1', '2018-03-22 15:57:29');
INSERT INTO `sys_log` VALUES ('1296', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-03-22 16:09:35');
INSERT INTO `sys_log` VALUES ('1297', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-03-22 16:16:45');
INSERT INTO `sys_log` VALUES ('1298', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-03-22 16:41:41');
INSERT INTO `sys_log` VALUES ('1299', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-22 17:08:50');
INSERT INTO `sys_log` VALUES ('1300', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-22 17:35:55');
INSERT INTO `sys_log` VALUES ('1301', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-23 09:13:00');
INSERT INTO `sys_log` VALUES ('1302', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-23 10:17:39');
INSERT INTO `sys_log` VALUES ('1303', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-23 10:27:09');
INSERT INTO `sys_log` VALUES ('1304', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-23 10:51:10');
INSERT INTO `sys_log` VALUES ('1305', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-23 10:56:15');
INSERT INTO `sys_log` VALUES ('1306', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-23 14:09:38');
INSERT INTO `sys_log` VALUES ('1307', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-23 14:09:46');
INSERT INTO `sys_log` VALUES ('1308', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-23 14:09:50');
INSERT INTO `sys_log` VALUES ('1309', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-23 15:26:27');
INSERT INTO `sys_log` VALUES ('1310', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-23 17:16:33');
INSERT INTO `sys_log` VALUES ('1311', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-23 17:41:42');
INSERT INTO `sys_log` VALUES ('1312', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-23 18:08:30');
INSERT INTO `sys_log` VALUES ('1313', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-23 18:16:04');
INSERT INTO `sys_log` VALUES ('1314', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-23 18:27:09');
INSERT INTO `sys_log` VALUES ('1315', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-26 09:38:28');
INSERT INTO `sys_log` VALUES ('1316', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-26 09:38:33');
INSERT INTO `sys_log` VALUES ('1317', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-26 13:59:07');
INSERT INTO `sys_log` VALUES ('1318', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-26 13:59:07');
INSERT INTO `sys_log` VALUES ('1319', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-26 13:59:07');
INSERT INTO `sys_log` VALUES ('1320', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-26 16:32:32');
INSERT INTO `sys_log` VALUES ('1321', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-27 09:42:48');
INSERT INTO `sys_log` VALUES ('1322', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-27 17:29:25');
INSERT INTO `sys_log` VALUES ('1323', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-27 17:43:29');
INSERT INTO `sys_log` VALUES ('1324', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-27 18:08:43');
INSERT INTO `sys_log` VALUES ('1325', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-27 18:29:10');
INSERT INTO `sys_log` VALUES ('1326', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-28 09:21:18');
INSERT INTO `sys_log` VALUES ('1327', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-28 09:32:14');
INSERT INTO `sys_log` VALUES ('1328', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-28 09:32:18');
INSERT INTO `sys_log` VALUES ('1329', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-28 13:58:42');
INSERT INTO `sys_log` VALUES ('1330', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-28 13:58:47');
INSERT INTO `sys_log` VALUES ('1331', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-28 15:30:43');
INSERT INTO `sys_log` VALUES ('1332', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-28 15:33:58');
INSERT INTO `sys_log` VALUES ('1333', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-28 15:36:06');
INSERT INTO `sys_log` VALUES ('1334', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-28 16:19:54');
INSERT INTO `sys_log` VALUES ('1335', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-28 16:22:02');
INSERT INTO `sys_log` VALUES ('1336', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-28 16:40:16');
INSERT INTO `sys_log` VALUES ('1337', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-29 09:32:08');
INSERT INTO `sys_log` VALUES ('1338', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-29 09:49:14');
INSERT INTO `sys_log` VALUES ('1339', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-29 10:10:21');
INSERT INTO `sys_log` VALUES ('1340', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-29 10:19:50');
INSERT INTO `sys_log` VALUES ('1341', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-29 13:54:18');
INSERT INTO `sys_log` VALUES ('1342', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-29 14:51:20');
INSERT INTO `sys_log` VALUES ('1343', 'admin', '保存用户', 'com.platform.controller.SysUserController.save()', '{\"deptId\":1,\"deptName\":\"DEMO有限公司\",\"email\":\"gffg@qqq.cooj\",\"mobile\":\"11111111111\",\"roleIdList\":[6],\"status\":1,\"username\":\"ty\"}', '127.0.0.1', '2018-03-29 14:52:42');
INSERT INTO `sys_log` VALUES ('1344', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-03-29 14:53:10');
INSERT INTO `sys_log` VALUES ('1345', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-03-29 14:53:15');
INSERT INTO `sys_log` VALUES ('1346', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-03-29 14:53:21');
INSERT INTO `sys_log` VALUES ('1347', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-03-29 14:53:58');
INSERT INTO `sys_log` VALUES ('1348', 'ty', '修改密码', 'com.platform.controller.SysUserController.password()', '\"admin\"', '127.0.0.1', '2018-03-29 14:54:08');
INSERT INTO `sys_log` VALUES ('1349', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-03-29 14:54:19');
INSERT INTO `sys_log` VALUES ('1350', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-03-29 14:56:28');
INSERT INTO `sys_log` VALUES ('1351', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-03-29 14:56:32');
INSERT INTO `sys_log` VALUES ('1352', '\"002\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"002\"', '127.0.0.1', '2018-03-29 14:57:07');
INSERT INTO `sys_log` VALUES ('1353', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-29 14:57:27');
INSERT INTO `sys_log` VALUES ('1354', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-29 14:58:17');
INSERT INTO `sys_log` VALUES ('1355', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-03-29 14:59:52');
INSERT INTO `sys_log` VALUES ('1356', 'admin', '修改角色', 'com.platform.controller.SysRoleController.update()', '{\"createTime\":1517127922000,\"createUserId\":1,\"deptId\":10,\"deptIdList\":[10],\"deptName\":\"专线部\",\"menuIdList\":[375,376,377,378,200,207,208,209,210,211,201,202,203,204,205,249,250,251,252,253,264,265,266,280,281,282,283,284,285,286,287,288,212,213,214,215,216,357,289,290,291,292,293,352,353,354,355,356,342,343,344,345,346,347,348,349,350,351,361,362,363,364,365,336,341,337,338,339,340,358,359,374,294,360,295,296,366,380,381,382,383,384,386,387,388,389,390,385,391,392,393,394],\"remark\":\"移动下de用户\",\"roleId\":9,\"roleName\":\"移动下de用户\"}', '127.0.0.1', '2018-03-29 15:02:53');
INSERT INTO `sys_log` VALUES ('1357', '\"002\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"002\"', '127.0.0.1', '2018-03-29 15:03:05');
INSERT INTO `sys_log` VALUES ('1358', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-03-29 15:16:20');
INSERT INTO `sys_log` VALUES ('1359', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-29 16:21:44');
INSERT INTO `sys_log` VALUES ('1360', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-29 16:33:55');
INSERT INTO `sys_log` VALUES ('1361', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-29 17:09:10');
INSERT INTO `sys_log` VALUES ('1362', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-29 17:14:08');
INSERT INTO `sys_log` VALUES ('1363', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-30 09:10:30');
INSERT INTO `sys_log` VALUES ('1364', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-03-30 09:32:53');
INSERT INTO `sys_log` VALUES ('1365', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-03-30 09:38:50');
INSERT INTO `sys_log` VALUES ('1366', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-03-30 10:09:27');
INSERT INTO `sys_log` VALUES ('1367', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-03-30 10:09:32');
INSERT INTO `sys_log` VALUES ('1368', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-03-30 10:09:46');
INSERT INTO `sys_log` VALUES ('1369', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-03-30 10:09:51');
INSERT INTO `sys_log` VALUES ('1370', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-03-30 13:42:18');
INSERT INTO `sys_log` VALUES ('1371', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-03-30 15:18:29');
INSERT INTO `sys_log` VALUES ('1372', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-04-02 09:10:27');
INSERT INTO `sys_log` VALUES ('1373', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-04-02 09:24:23');
INSERT INTO `sys_log` VALUES ('1374', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-02 09:43:13');
INSERT INTO `sys_log` VALUES ('1375', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '127.0.0.1', '2018-04-02 09:43:53');
INSERT INTO `sys_log` VALUES ('1376', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-02 09:44:05');
INSERT INTO `sys_log` VALUES ('1377', 'admin', '修改角色', 'com.platform.controller.SysRoleController.update()', '{\"createTime\":1517127429000,\"createUserId\":1,\"deptId\":5,\"deptIdList\":[5],\"deptName\":\"上海移动公司\",\"menuIdList\":[200,207,208,209,210,211,201,202,203,204,205,249,250,251,252,253,264,265,266,280,281,282,283,284,285,286,287,288,212,213,214,215,216,357,289,290,291,292,293,352,353,354,355,356,342,343,344,345,346,347,348,349,350,351,361,362,363,364,365,336,341,337,338,339,340,358,359,374,294,360,295,296,366,380,381,382,383,384,386,387,388,389,390,385,391,392,393,394],\"remark\":\"移动\",\"roleId\":8,\"roleName\":\"移动顶级部门\"}', '127.0.0.1', '2018-04-02 09:45:19');
INSERT INTO `sys_log` VALUES ('1378', '\"001\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"001\"', '127.0.0.1', '2018-04-02 09:45:33');
INSERT INTO `sys_log` VALUES ('1379', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-02 09:50:19');
INSERT INTO `sys_log` VALUES ('1380', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-04-02 10:30:39');
INSERT INTO `sys_log` VALUES ('1381', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-02 12:27:21');
INSERT INTO `sys_log` VALUES ('1382', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-02 12:41:56');
INSERT INTO `sys_log` VALUES ('1383', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-02 13:54:09');
INSERT INTO `sys_log` VALUES ('1384', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-04-02 13:56:00');
INSERT INTO `sys_log` VALUES ('1385', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-02 15:07:43');
INSERT INTO `sys_log` VALUES ('1386', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-image\",\"identify\":0,\"leaf\":false,\"name\":\"商品图片\",\"orderNum\":0,\"parentId\":357,\"parentName\":\"编辑商品\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"shop/goodsgallery.html\"}', '127.0.0.1', '2018-04-02 16:13:16');
INSERT INTO `sys_log` VALUES ('1387', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-image\",\"identify\":0,\"leaf\":false,\"menuId\":401,\"name\":\"商品图片\",\"orderNum\":2,\"parentId\":357,\"parentName\":\"编辑商品\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"shop/goodsgallery.html\"}', '127.0.0.1', '2018-04-02 16:15:24');
INSERT INTO `sys_log` VALUES ('1388', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-commenting\",\"identify\":0,\"leaf\":false,\"menuId\":336,\"name\":\"用户评论\",\"orderNum\":7,\"parentId\":357,\"parentName\":\"编辑商品\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"shop/comment.html\"}', '127.0.0.1', '2018-04-02 16:16:18');
INSERT INTO `sys_log` VALUES ('1389', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-image\",\"identify\":0,\"leaf\":false,\"menuId\":401,\"name\":\"商品图片\",\"orderNum\":7,\"parentId\":357,\"parentName\":\"编辑商品\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"shop/goodsgallery.html\"}', '127.0.0.1', '2018-04-02 16:17:35');
INSERT INTO `sys_log` VALUES ('1390', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-02 16:19:34');
INSERT INTO `sys_log` VALUES ('1391', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"identify\":0,\"leaf\":false,\"name\":\"查看\",\"orderNum\":0,\"parentId\":401,\"parentName\":\"商品图片\",\"selected\":false,\"status\":0,\"type\":2}', '127.0.0.1', '2018-04-02 16:25:50');
INSERT INTO `sys_log` VALUES ('1392', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"identify\":0,\"leaf\":false,\"name\":\"上传\",\"orderNum\":0,\"parentId\":401,\"parentName\":\"商品图片\",\"selected\":false,\"status\":0,\"type\":2}', '127.0.0.1', '2018-04-02 16:27:10');
INSERT INTO `sys_log` VALUES ('1393', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"identify\":0,\"leaf\":false,\"name\":\"修改\",\"orderNum\":0,\"parentId\":401,\"parentName\":\"商品图片\",\"selected\":false,\"status\":0,\"type\":2}', '127.0.0.1', '2018-04-02 16:27:45');
INSERT INTO `sys_log` VALUES ('1394', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-02 16:44:37');
INSERT INTO `sys_log` VALUES ('1395', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"identify\":0,\"leaf\":false,\"name\":\"删除\",\"orderNum\":0,\"parentId\":401,\"parentName\":\"商品图片\",\"selected\":false,\"status\":0,\"type\":2}', '127.0.0.1', '2018-04-02 16:45:23');
INSERT INTO `sys_log` VALUES ('1396', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-04-02 17:17:46');
INSERT INTO `sys_log` VALUES ('1397', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-04-02 18:16:58');
INSERT INTO `sys_log` VALUES ('1398', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-04-02 18:18:21');
INSERT INTO `sys_log` VALUES ('1399', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-04-02 18:20:44');
INSERT INTO `sys_log` VALUES ('1400', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-02 18:21:28');
INSERT INTO `sys_log` VALUES ('1401', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-04-03 09:09:32');
INSERT INTO `sys_log` VALUES ('1402', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-03 09:10:10');
INSERT INTO `sys_log` VALUES ('1403', 'admin', '修改角色', 'com.platform.controller.SysRoleController.update()', '{\"createTime\":1516934737000,\"createUserId\":1,\"deptId\":5,\"deptIdList\":[5,6,7,10,11],\"deptName\":\"上海移动公司\",\"menuIdList\":[375,376,377,378,200,207,208,209,210,211,201,202,203,204,205,249,250,251,252,253,264,265,266,280,281,282,283,284,285,286,287,288,212,213,214,215,216,222,223,224,225,226,227,259,260,261,262,263,307,308,309,310,311,297,298,299,300,301,254,256,257,258,255,315,316,317,318,319,325,326,327,328,329,331,332,333,334,335,357,289,290,291,292,293,352,353,354,355,356,401,402,403,404,405,342,343,344,345,346,347,348,349,350,351,361,362,363,364,365,336,341,337,338,339,340,358,359,366,380,381,382,383,384,386,387,388,389,390,385,391,392,393,394,1,2,15,16,17,18,3,19,20,21,22,368,369,370,371,372,373,4,23,24,25,26,6,7,8,9,10,11,12,13,14,30,302,303,304,305,306,27,29,379,5,28],\"remark\":\"移动\",\"roleId\":6,\"roleName\":\"tyjsyf001大队长\"}', '127.0.0.1', '2018-04-03 09:12:40');
INSERT INTO `sys_log` VALUES ('1404', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-04-03 09:13:27');
INSERT INTO `sys_log` VALUES ('1405', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-03 09:17:38');
INSERT INTO `sys_log` VALUES ('1406', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-04-03 09:32:52');
INSERT INTO `sys_log` VALUES ('1407', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-03 10:33:16');
INSERT INTO `sys_log` VALUES ('1408', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-03 10:33:20');
INSERT INTO `sys_log` VALUES ('1409', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-03 13:42:22');
INSERT INTO `sys_log` VALUES ('1410', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-04-03 14:27:45');
INSERT INTO `sys_log` VALUES ('1411', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-04-03 15:00:31');
INSERT INTO `sys_log` VALUES ('1412', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-03 15:00:51');
INSERT INTO `sys_log` VALUES ('1413', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-04-03 15:02:04');
INSERT INTO `sys_log` VALUES ('1414', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-03 15:19:45');
INSERT INTO `sys_log` VALUES ('1415', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-04-03 15:56:22');
INSERT INTO `sys_log` VALUES ('1416', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-04-03 15:56:25');
INSERT INTO `sys_log` VALUES ('1417', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-03 16:51:42');
INSERT INTO `sys_log` VALUES ('1418', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-03 17:36:08');
INSERT INTO `sys_log` VALUES ('1419', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-04 13:54:20');
INSERT INTO `sys_log` VALUES ('1420', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-08 09:31:09');
INSERT INTO `sys_log` VALUES ('1421', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-08 09:31:09');
INSERT INTO `sys_log` VALUES ('1422', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-08 09:31:09');
INSERT INTO `sys_log` VALUES ('1423', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-08 10:08:01');
INSERT INTO `sys_log` VALUES ('1424', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-08 10:08:02');
INSERT INTO `sys_log` VALUES ('1425', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-08 10:08:06');
INSERT INTO `sys_log` VALUES ('1426', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-08 11:02:44');
INSERT INTO `sys_log` VALUES ('1427', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-04-08 11:48:53');
INSERT INTO `sys_log` VALUES ('1428', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-04-08 11:49:04');
INSERT INTO `sys_log` VALUES ('1429', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-04-08 12:38:24');
INSERT INTO `sys_log` VALUES ('1430', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-04-08 15:33:32');
INSERT INTO `sys_log` VALUES ('1431', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-04-08 15:38:40');
INSERT INTO `sys_log` VALUES ('1432', 'admin', '保存角色', 'com.platform.controller.SysRoleController.save()', '{\"deptId\":11,\"deptIdList\":[5,6,7,10,11],\"deptName\":\"酱油部\",\"menuIdList\":[375,376,377,378,200,207,208,209,210,211,201,202,203,204,205,249,250,251,252,253,264,265,266,280,281,282,283,284,285,286,287,288,212,213,214,215,216],\"remark\":\"酱油\",\"roleName\":\"移动酱油\"}', '0:0:0:0:0:0:0:1', '2018-04-08 15:39:55');
INSERT INTO `sys_log` VALUES ('1433', 'admin', '修改用户', 'com.platform.controller.SysUserController.update()', '{\"createTime\":1516934832000,\"createUserId\":1,\"deptId\":11,\"deptName\":\"酱油部\",\"email\":\"test@aliyun.com\",\"mobile\":\"18525852582\",\"roleIdList\":[10],\"status\":1,\"userId\":2,\"username\":\"test\"}', '0:0:0:0:0:0:0:1', '2018-04-08 15:40:16');
INSERT INTO `sys_log` VALUES ('1434', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-04-08 15:40:30');
INSERT INTO `sys_log` VALUES ('1435', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-04-08 15:40:39');
INSERT INTO `sys_log` VALUES ('1436', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-04-08 15:40:48');
INSERT INTO `sys_log` VALUES ('1437', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-04-08 15:41:18');
INSERT INTO `sys_log` VALUES ('1438', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-04-08 15:41:33');
INSERT INTO `sys_log` VALUES ('1439', 'admin', '修改角色', 'com.platform.controller.SysRoleController.update()', '{\"createTime\":1523173196000,\"createUserId\":1,\"deptId\":11,\"deptIdList\":[5,6,7,10,11],\"deptName\":\"酱油部\",\"menuIdList\":[375,376,377,378,200,207,208,209,210,211,201,202,203,204,205,249,250,251,252,253,264,265,266,280,281,282,283,284,285,286,287,288,212,213,214,215,216,222,223,224,225,226,227,259,260,261,262,263,307,308,309,310,311,297,298,299,300,301,254,256,257,258,255,315,316,317,318,319,325,326,327,328,329,331,332,333,334,335,357,289,290,291,292,293,352,353,354,355,356,401,402,403,404,405,342,343,344,345,346,347,348,349,350,351,361,362,363,364,365,336,341,337,338,339,340,358,359,374,294,360,295,296,243,238,239,240,241,242,233,234,235,236,237,244,330,245,246,247,248,275,276,277,278,279,270,271,272,273,274,366,380,381,382,383,384,386,387,388,389,390,385,391,392,393,394,1,2,15,16,17,18,3,19,20,21,22,368,369,370,371,372,373,4,23,24,25,26,6,7,8,9,10,11,12,13,14,30,302,303,304,305,306,395,396,397,398,399,27,29,379,5,28],\"remark\":\"酱油\",\"roleId\":10,\"roleName\":\"移动酱油\"}', '0:0:0:0:0:0:0:1', '2018-04-08 15:42:36');
INSERT INTO `sys_log` VALUES ('1440', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-04-08 15:42:53');
INSERT INTO `sys_log` VALUES ('1441', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-04-08 16:22:35');
INSERT INTO `sys_log` VALUES ('1442', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-08 16:39:20');
INSERT INTO `sys_log` VALUES ('1443', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-08 16:51:46');
INSERT INTO `sys_log` VALUES ('1444', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-04-08 17:43:06');
INSERT INTO `sys_log` VALUES ('1445', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-04-08 18:03:44');
INSERT INTO `sys_log` VALUES ('1446', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-04-08 18:03:55');
INSERT INTO `sys_log` VALUES ('1447', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-04-08 18:16:44');
INSERT INTO `sys_log` VALUES ('1448', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-04-09 08:59:26');
INSERT INTO `sys_log` VALUES ('1449', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-04-09 09:21:30');
INSERT INTO `sys_log` VALUES ('1450', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-04-09 10:04:13');
INSERT INTO `sys_log` VALUES ('1451', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-04-09 10:08:52');
INSERT INTO `sys_log` VALUES ('1452', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-04-09 10:14:00');
INSERT INTO `sys_log` VALUES ('1453', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-04-09 10:17:46');
INSERT INTO `sys_log` VALUES ('1454', '\"ty\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ty\"', '127.0.0.1', '2018-04-09 10:29:13');
INSERT INTO `sys_log` VALUES ('1455', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '0:0:0:0:0:0:0:1', '2018-04-09 13:56:51');
INSERT INTO `sys_log` VALUES ('1456', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-04-09 14:07:23');
INSERT INTO `sys_log` VALUES ('1457', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '127.0.0.1', '2018-04-09 14:15:57');
INSERT INTO `sys_log` VALUES ('1458', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-04-09 14:18:24');
INSERT INTO `sys_log` VALUES ('1459', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '127.0.0.1', '2018-04-09 14:31:44');
INSERT INTO `sys_log` VALUES ('1460', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '127.0.0.1', '2018-04-09 14:31:53');
INSERT INTO `sys_log` VALUES ('1461', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '127.0.0.1', '2018-04-09 14:42:27');
INSERT INTO `sys_log` VALUES ('1462', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '127.0.0.1', '2018-04-09 15:00:46');
INSERT INTO `sys_log` VALUES ('1463', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '127.0.0.1', '2018-04-09 15:52:13');
INSERT INTO `sys_log` VALUES ('1464', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '127.0.0.1', '2018-04-09 16:52:09');
INSERT INTO `sys_log` VALUES ('1465', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '127.0.0.1', '2018-04-09 17:10:16');
INSERT INTO `sys_log` VALUES ('1466', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '127.0.0.1', '2018-04-09 17:21:05');
INSERT INTO `sys_log` VALUES ('1467', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-09 18:12:28');
INSERT INTO `sys_log` VALUES ('1468', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-10 10:41:26');
INSERT INTO `sys_log` VALUES ('1469', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-10 10:41:28');
INSERT INTO `sys_log` VALUES ('1470', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-10 10:41:32');
INSERT INTO `sys_log` VALUES ('1471', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '127.0.0.1', '2018-04-10 11:50:55');
INSERT INTO `sys_log` VALUES ('1472', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-10 14:25:21');
INSERT INTO `sys_log` VALUES ('1473', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-04-10 16:23:04');
INSERT INTO `sys_log` VALUES ('1474', 'admin', '保存定时任务', 'com.platform.controller.ScheduleJobController.save()', '{\"beanName\":\"testTask\",\"cronExpression\":\"0 0/5 14 * * ?\",\"methodName\":\"orderCancel\"}', '0:0:0:0:0:0:0:1', '2018-04-10 16:25:25');
INSERT INTO `sys_log` VALUES ('1475', 'admin', '保存定时任务', 'com.platform.controller.ScheduleJobController.save()', '{\"beanName\":\"testTask\",\"cronExpression\":\"0 0/5 14 * * ?\",\"methodName\":\"orderCancel\",\"params\":\"id\"}', '0:0:0:0:0:0:0:1', '2018-04-10 16:25:51');
INSERT INTO `sys_log` VALUES ('1476', 'admin', '保存定时任务', 'com.platform.controller.ScheduleJobController.save()', '{\"beanName\":\"testTask\",\"cronExpression\":\"0 0/5 14 * * ?\",\"methodName\":\"orderCancel\",\"params\":\"id\",\"remark\":\"test\"}', '0:0:0:0:0:0:0:1', '2018-04-10 16:26:10');
INSERT INTO `sys_log` VALUES ('1477', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-04-11 15:03:04');
INSERT INTO `sys_log` VALUES ('1478', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-04-11 16:23:20');
INSERT INTO `sys_log` VALUES ('1479', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-11 16:53:21');
INSERT INTO `sys_log` VALUES ('1480', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-04-11 17:44:10');
INSERT INTO `sys_log` VALUES ('1481', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-12 09:19:24');
INSERT INTO `sys_log` VALUES ('1482', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-12 09:36:45');
INSERT INTO `sys_log` VALUES ('1483', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-12 09:36:50');
INSERT INTO `sys_log` VALUES ('1484', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-12 09:49:27');
INSERT INTO `sys_log` VALUES ('1485', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '127.0.0.1', '2018-04-12 09:50:54');
INSERT INTO `sys_log` VALUES ('1486', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '127.0.0.1', '2018-04-12 09:50:58');
INSERT INTO `sys_log` VALUES ('1487', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-12 09:52:27');
INSERT INTO `sys_log` VALUES ('1488', 'admin', '修改角色', 'com.platform.controller.SysRoleController.update()', '{\"createTime\":1516934737000,\"createUserId\":1,\"deptId\":5,\"deptIdList\":[5,6,7,10,11],\"deptName\":\"上海移动公司\",\"menuIdList\":[375,376,377,378,200,207,208,209,210,211,201,202,203,204,205,249,250,251,252,253,264,265,266,280,281,282,283,284,285,286,287,288,212,213,214,215,216,222,223,224,225,226,227,259,260,261,262,263,307,308,309,310,311,297,298,299,300,301,254,256,257,258,255,315,316,317,318,319,325,326,327,328,329,331,332,333,334,335,357,289,290,291,292,293,352,353,354,355,356,401,402,403,404,405,342,343,344,345,346,347,348,349,350,351,361,362,363,364,365,336,341,337,338,339,340,358,359,366,380,381,382,383,384,386,387,388,389,390,385,391,392,393,394,1,2,15,16,17,18,3,19,20,21,22,368,369,370,371,372,373,4,23,24,25,26,6,7,8,9,10,11,12,13,14,30,302,303,304,305,306,395,396,397,398,399,27,29,379,5,28],\"remark\":\"移动\",\"roleId\":6,\"roleName\":\"tyjsyf001大队长\"}', '127.0.0.1', '2018-04-12 09:54:57');
INSERT INTO `sys_log` VALUES ('1489', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '127.0.0.1', '2018-04-12 09:55:18');
INSERT INTO `sys_log` VALUES ('1490', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '127.0.0.1', '2018-04-12 10:01:36');
INSERT INTO `sys_log` VALUES ('1491', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '127.0.0.1', '2018-04-12 10:01:40');
INSERT INTO `sys_log` VALUES ('1492', '\"test\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"test\"', '127.0.0.1', '2018-04-12 10:01:52');
INSERT INTO `sys_log` VALUES ('1493', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-12 10:02:54');
INSERT INTO `sys_log` VALUES ('1494', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-04-12 10:28:26');
INSERT INTO `sys_log` VALUES ('1495', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-12 12:26:47');
INSERT INTO `sys_log` VALUES ('1496', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-12 14:44:44');
INSERT INTO `sys_log` VALUES ('1497', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-04-12 15:51:46');
INSERT INTO `sys_log` VALUES ('1498', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-04-12 15:51:50');
INSERT INTO `sys_log` VALUES ('1499', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-12 16:58:55');
INSERT INTO `sys_log` VALUES ('1500', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-map-pin\",\"identify\":0,\"leaf\":false,\"menuId\":379,\"name\":\"地区管理\",\"orderNum\":8,\"parentId\":1,\"parentName\":\"系统管理\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"sys/region.html\"}', '127.0.0.1', '2018-04-12 17:03:12');
INSERT INTO `sys_log` VALUES ('1501', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-12 17:07:36');
INSERT INTO `sys_log` VALUES ('1502', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-map-pin\",\"identify\":0,\"leaf\":false,\"menuId\":379,\"name\":\"地区管理\",\"orderNum\":8,\"parentId\":1,\"parentName\":\"系统管理\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"sys/region.html\"}', '127.0.0.1', '2018-04-12 17:09:14');
INSERT INTO `sys_log` VALUES ('1503', 'admin', '修改角色', 'com.platform.controller.SysRoleController.update()', '{\"createTime\":1505666415000,\"createUserId\":1,\"deptId\":1,\"deptIdList\":[1],\"deptName\":\"DEMO有限公司\",\"menuIdList\":[375,376,377,378,200,207,208,209,210,211,201,202,203,204,205,249,250,251,252,253,264,265,266,280,281,282,283,284,285,286,287,288,212,213,214,215,216,222,223,224,225,226,227,259,260,261,262,263,307,308,309,310,311,297,298,299,300,301,254,256,257,258,255,315,316,317,318,319,325,326,327,328,329,331,332,333,334,335,357,289,290,291,292,293,352,353,354,355,356,342,343,344,345,346,347,348,349,350,351,361,362,363,364,365,336,341,337,338,339,340,358,359,374,294,360,295,296,243,238,239,240,241,242,233,234,235,236,237,244,330,245,246,247,248,275,276,277,278,279,270,271,272,273,274,366,380,381,382,383,384,386,387,388,389,390,385,391,392,393,394,1,2,15,16,17,18,3,19,20,21,22,368,369,370,371,372,373,4,23,24,25,26,6,7,8,9,10,11,12,13,14,30,302,303,304,305,306,395,396,397,398,399,27,29,379,5,28],\"remark\":\"超级管理员\",\"roleId\":5,\"roleName\":\"超级管理员\"}', '127.0.0.1', '2018-04-12 17:13:34');
INSERT INTO `sys_log` VALUES ('1504', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-map-pin\",\"identify\":0,\"leaf\":false,\"menuId\":379,\"name\":\"地区管理\",\"orderNum\":8,\"parentId\":1,\"parentName\":\"系统管理\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"sys/region.html\"}', '127.0.0.1', '2018-04-12 17:15:07');
INSERT INTO `sys_log` VALUES ('1505', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-12 17:24:58');
INSERT INTO `sys_log` VALUES ('1506', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-map-pin\",\"identify\":0,\"leaf\":false,\"menuId\":379,\"name\":\"地区管理\",\"orderNum\":8,\"parentId\":1,\"parentName\":\"系统管理\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"sys/region.html\"}', '127.0.0.1', '2018-04-12 17:25:36');
INSERT INTO `sys_log` VALUES ('1507', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-map-pin\",\"identify\":0,\"leaf\":false,\"menuId\":379,\"name\":\"地区管理\",\"orderNum\":8,\"parentId\":1,\"parentName\":\"系统管理\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"sys/region.html\"}', '127.0.0.1', '2018-04-12 17:25:40');
INSERT INTO `sys_log` VALUES ('1508', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-map-pin\",\"identify\":0,\"leaf\":false,\"menuId\":379,\"name\":\"地区管理\",\"orderNum\":8,\"parentId\":1,\"parentName\":\"系统管理\",\"selected\":false,\"status\":1,\"type\":1,\"url\":\"sys/region.html\"}', '127.0.0.1', '2018-04-12 18:11:47');
INSERT INTO `sys_log` VALUES ('1509', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-map-pin\",\"identify\":0,\"leaf\":false,\"menuId\":379,\"name\":\"地区管理\",\"orderNum\":8,\"parentId\":1,\"parentName\":\"系统管理\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"sys/region.html\"}', '127.0.0.1', '2018-04-12 18:14:18');
INSERT INTO `sys_log` VALUES ('1510', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-map-pin\",\"identify\":0,\"leaf\":false,\"menuId\":379,\"name\":\"地区管理\",\"orderNum\":8,\"parentId\":1,\"parentName\":\"系统管理\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"sys/region.html\"}', '127.0.0.1', '2018-04-12 18:14:18');
INSERT INTO `sys_log` VALUES ('1511', 'admin', '保存菜单', 'com.platform.controller.SysMenuController.save()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"identify\":0,\"leaf\":false,\"name\":\"测试菜单\",\"orderNum\":0,\"parentId\":31,\"parentName\":\"功能测试\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"sys/test.html\"}', '127.0.0.1', '2018-04-12 18:20:58');
INSERT INTO `sys_log` VALUES ('1512', 'admin', '删除菜单', 'com.platform.controller.SysMenuController.delete()', '[406]', '127.0.0.1', '2018-04-12 18:21:16');
INSERT INTO `sys_log` VALUES ('1513', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-13 09:12:41');
INSERT INTO `sys_log` VALUES ('1514', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"identify\":0,\"leaf\":false,\"menuId\":375,\"name\":\"删除\",\"orderNum\":0,\"parentId\":379,\"parentName\":\"地区管理\",\"perms\":\"sys:region:delete\",\"selected\":false,\"status\":0,\"type\":2}', '127.0.0.1', '2018-04-13 09:13:29');
INSERT INTO `sys_log` VALUES ('1515', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-13 09:23:11');
INSERT INTO `sys_log` VALUES ('1516', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-map-pin\",\"identify\":0,\"leaf\":false,\"menuId\":379,\"name\":\"地区管理\",\"orderNum\":8,\"parentId\":1,\"parentName\":\"系统管理\",\"selected\":false,\"status\":0,\"type\":1,\"url\":\"sys/region.html\"}', '127.0.0.1', '2018-04-13 09:24:27');
INSERT INTO `sys_log` VALUES ('1517', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-13 10:51:24');
INSERT INTO `sys_log` VALUES ('1518', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-13 11:18:32');
INSERT INTO `sys_log` VALUES ('1519', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-04-16 09:33:30');
INSERT INTO `sys_log` VALUES ('1520', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-16 09:35:10');
INSERT INTO `sys_log` VALUES ('1521', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-cc-visa\",\"identify\":0,\"leaf\":false,\"menuId\":249,\"name\":\"会员优惠劵\",\"orderNum\":2,\"parentId\":200,\"parentName\":\"会员管理\",\"selected\":false,\"status\":1,\"type\":1,\"url\":\"shop/usercoupon.html\"}', '127.0.0.1', '2018-04-16 09:36:22');
INSERT INTO `sys_log` VALUES ('1522', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-venus-double\",\"identify\":0,\"leaf\":false,\"menuId\":347,\"name\":\"商品满减搭配\",\"orderNum\":4,\"parentId\":357,\"parentName\":\"编辑商品\",\"selected\":false,\"status\":1,\"type\":1,\"url\":\"shop/goodscrash.html\"}', '127.0.0.1', '2018-04-16 09:37:42');
INSERT INTO `sys_log` VALUES ('1523', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-question-circle-o\",\"identify\":0,\"leaf\":false,\"menuId\":315,\"name\":\"商品问答\",\"orderNum\":6,\"parentId\":222,\"parentName\":\"商城配置\",\"selected\":false,\"status\":1,\"type\":1,\"url\":\"shop/goodsissue.html\"}', '127.0.0.1', '2018-04-16 09:39:08');
INSERT INTO `sys_log` VALUES ('1524', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-mail-reply-all\",\"identify\":0,\"leaf\":false,\"menuId\":325,\"name\":\"反馈\",\"orderNum\":6,\"parentId\":222,\"parentName\":\"商城配置\",\"selected\":false,\"status\":1,\"type\":1,\"url\":\"shop/feedback.html\"}', '127.0.0.1', '2018-04-16 09:39:22');
INSERT INTO `sys_log` VALUES ('1525', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-commenting\",\"identify\":0,\"leaf\":false,\"menuId\":336,\"name\":\"用户评论\",\"orderNum\":6,\"parentId\":357,\"parentName\":\"编辑商品\",\"selected\":false,\"status\":1,\"type\":1,\"url\":\"shop/comment.html\"}', '127.0.0.1', '2018-04-16 09:41:34');
INSERT INTO `sys_log` VALUES ('1526', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-group\",\"identify\":0,\"leaf\":false,\"menuId\":361,\"name\":\"团购设置\",\"orderNum\":5,\"parentId\":357,\"parentName\":\"编辑商品\",\"selected\":false,\"status\":1,\"type\":1,\"url\":\"shop/goodsgroup.html\"}', '127.0.0.1', '2018-04-16 09:41:51');
INSERT INTO `sys_log` VALUES ('1527', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-cc-visa\",\"identify\":0,\"leaf\":false,\"menuId\":244,\"name\":\"优惠劵管理\",\"orderNum\":2,\"parentId\":243,\"parentName\":\"推广管理\",\"selected\":false,\"status\":1,\"type\":1,\"url\":\"shop/coupon.html\"}', '127.0.0.1', '2018-04-16 09:42:44');
INSERT INTO `sys_log` VALUES ('1528', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-weixin\",\"identify\":0,\"leaf\":false,\"menuId\":312,\"name\":\"微信公众号\",\"orderNum\":6,\"parentId\":0,\"parentName\":\"一级菜单\",\"selected\":false,\"status\":1,\"type\":0}', '127.0.0.1', '2018-04-16 09:42:55');
INSERT INTO `sys_log` VALUES ('1529', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-truck\",\"identify\":0,\"leaf\":false,\"menuId\":313,\"name\":\"进销存\",\"orderNum\":6,\"parentId\":0,\"parentName\":\"一级菜单\",\"selected\":false,\"status\":1,\"type\":0}', '127.0.0.1', '2018-04-16 09:43:08');
INSERT INTO `sys_log` VALUES ('1530', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-line-chart\",\"identify\":0,\"leaf\":false,\"menuId\":314,\"name\":\"统计报表\",\"orderNum\":7,\"parentId\":0,\"parentName\":\"一级菜单\",\"selected\":false,\"status\":1,\"type\":0}', '127.0.0.1', '2018-04-16 09:43:34');
INSERT INTO `sys_log` VALUES ('1531', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-bug\",\"identify\":0,\"leaf\":false,\"menuId\":31,\"name\":\"功能测试\",\"orderNum\":11,\"parentId\":0,\"parentName\":\"一级菜单\",\"selected\":false,\"status\":1,\"type\":0}', '127.0.0.1', '2018-04-16 09:43:49');
INSERT INTO `sys_log` VALUES ('1532', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-tasks\",\"identify\":0,\"leaf\":false,\"menuId\":6,\"name\":\"定时任务\",\"orderNum\":5,\"parentId\":1,\"parentName\":\"系统管理\",\"selected\":false,\"status\":1,\"type\":1,\"url\":\"sys/schedule.html\"}', '127.0.0.1', '2018-04-16 09:45:16');
INSERT INTO `sys_log` VALUES ('1533', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-file-image-o\",\"identify\":0,\"leaf\":false,\"menuId\":30,\"name\":\"文件上传\",\"orderNum\":6,\"parentId\":1,\"parentName\":\"系统管理\",\"perms\":\"sys:oss:all\",\"selected\":false,\"status\":1,\"type\":1,\"url\":\"sys/oss.html\"}', '127.0.0.1', '2018-04-16 09:45:34');
INSERT INTO `sys_log` VALUES ('1534', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-book\",\"identify\":0,\"leaf\":false,\"menuId\":302,\"name\":\"通用字典表\",\"orderNum\":6,\"parentId\":1,\"parentName\":\"系统管理\",\"selected\":false,\"status\":1,\"type\":1,\"url\":\"sys/macro.html\"}', '127.0.0.1', '2018-04-16 09:45:53');
INSERT INTO `sys_log` VALUES ('1535', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-sun-o\",\"identify\":0,\"leaf\":false,\"menuId\":27,\"name\":\"系统参数\",\"orderNum\":7,\"parentId\":1,\"parentName\":\"系统管理\",\"perms\":\"sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete\",\"selected\":false,\"status\":1,\"type\":1,\"url\":\"sys/config.html\"}', '127.0.0.1', '2018-04-16 09:46:08');
INSERT INTO `sys_log` VALUES ('1536', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-file-text-o\",\"identify\":0,\"leaf\":false,\"menuId\":29,\"name\":\"系统日志\",\"orderNum\":8,\"parentId\":1,\"parentName\":\"系统管理\",\"perms\":\"sys:log:list\",\"selected\":false,\"status\":1,\"type\":1,\"url\":\"sys/log.html\"}', '127.0.0.1', '2018-04-16 09:46:25');
INSERT INTO `sys_log` VALUES ('1537', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-map-pin\",\"identify\":0,\"leaf\":false,\"menuId\":379,\"name\":\"地区管理\",\"orderNum\":8,\"parentId\":1,\"parentName\":\"系统管理\",\"selected\":false,\"status\":1,\"type\":1,\"url\":\"sys/region.html\"}', '127.0.0.1', '2018-04-16 09:46:56');
INSERT INTO `sys_log` VALUES ('1538', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-linux\",\"identify\":0,\"leaf\":false,\"menuId\":5,\"name\":\"SQL监控\",\"orderNum\":9,\"parentId\":1,\"parentName\":\"系统管理\",\"selected\":false,\"status\":1,\"type\":1,\"url\":\"druid/sql.html\"}', '127.0.0.1', '2018-04-16 09:47:10');
INSERT INTO `sys_log` VALUES ('1539', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-rocket\",\"identify\":0,\"leaf\":false,\"menuId\":28,\"name\":\"代码生成器\",\"orderNum\":10,\"parentId\":1,\"parentName\":\"系统管理\",\"perms\":\"sys:generator:list,sys:generator:code\",\"selected\":false,\"status\":1,\"type\":1,\"url\":\"sys/generator.html\"}', '127.0.0.1', '2018-04-16 09:47:27');
INSERT INTO `sys_log` VALUES ('1540', 'admin', '修改菜单', 'com.platform.controller.SysMenuController.update()', '{\"checked\":false,\"disableCheckbox\":false,\"disabled\":false,\"expand\":false,\"icon\":\"fa fa-leanpub\",\"identify\":0,\"leaf\":false,\"menuId\":366,\"name\":\"新闻管理\",\"orderNum\":6,\"parentId\":0,\"parentName\":\"一级菜单\",\"selected\":false,\"status\":0,\"type\":0}', '127.0.0.1', '2018-04-16 09:48:26');
INSERT INTO `sys_log` VALUES ('1541', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-16 10:07:21');
INSERT INTO `sys_log` VALUES ('1542', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-16 11:47:32');
INSERT INTO `sys_log` VALUES ('1543', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-16 13:24:55');
INSERT INTO `sys_log` VALUES ('1544', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-16 14:36:38');
INSERT INTO `sys_log` VALUES ('1545', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-16 14:57:05');
INSERT INTO `sys_log` VALUES ('1546', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-16 15:00:23');
INSERT INTO `sys_log` VALUES ('1547', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-16 17:01:59');
INSERT INTO `sys_log` VALUES ('1548', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-04-16 17:33:20');
INSERT INTO `sys_log` VALUES ('1549', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-17 10:07:38');
INSERT INTO `sys_log` VALUES ('1550', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-17 10:39:34');
INSERT INTO `sys_log` VALUES ('1551', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-17 11:03:10');
INSERT INTO `sys_log` VALUES ('1552', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-17 11:18:06');
INSERT INTO `sys_log` VALUES ('1553', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-17 11:18:12');
INSERT INTO `sys_log` VALUES ('1554', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '0:0:0:0:0:0:0:1', '2018-04-17 11:20:44');
INSERT INTO `sys_log` VALUES ('1555', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-17 14:31:17');
INSERT INTO `sys_log` VALUES ('1556', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-17 14:51:33');
INSERT INTO `sys_log` VALUES ('1557', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-17 15:36:56');
INSERT INTO `sys_log` VALUES ('1558', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-18 10:46:01');
INSERT INTO `sys_log` VALUES ('1559', '\"ADMIN\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"ADMIN\"', '127.0.0.1', '2018-04-18 10:56:47');
INSERT INTO `sys_log` VALUES ('1560', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-18 10:56:59');
INSERT INTO `sys_log` VALUES ('1561', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-19 12:37:46');
INSERT INTO `sys_log` VALUES ('1562', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-19 12:57:24');
INSERT INTO `sys_log` VALUES ('1563', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-20 11:50:21');
INSERT INTO `sys_log` VALUES ('1564', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-20 11:55:17');
INSERT INTO `sys_log` VALUES ('1565', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-20 13:28:33');
INSERT INTO `sys_log` VALUES ('1566', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-20 13:37:55');
INSERT INTO `sys_log` VALUES ('1567', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-20 13:59:16');
INSERT INTO `sys_log` VALUES ('1568', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-20 13:59:21');
INSERT INTO `sys_log` VALUES ('1569', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-20 13:59:25');
INSERT INTO `sys_log` VALUES ('1570', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-20 14:44:38');
INSERT INTO `sys_log` VALUES ('1571', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-20 14:45:23');
INSERT INTO `sys_log` VALUES ('1572', 'admin', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-20 14:45:33');
INSERT INTO `sys_log` VALUES ('1573', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-20 14:49:36');
INSERT INTO `sys_log` VALUES ('1574', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-20 14:59:15');
INSERT INTO `sys_log` VALUES ('1575', '\"admin\"', '登录', 'com.platform.controller.SysLoginController.login()', '\"admin\"', '127.0.0.1', '2018-04-20 15:15:00');

-- ----------------------------
-- Table structure for sys_macro
-- ----------------------------
DROP TABLE IF EXISTS `sys_macro`;
CREATE TABLE `sys_macro` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(255) DEFAULT NULL COMMENT '父级id',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `value` varchar(2000) DEFAULT NULL COMMENT '值',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态，0：隐藏   1：显示',
  `type` tinyint(20) DEFAULT NULL COMMENT '类型,0:目录，1:参数配置',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `gmt_create` date DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` date DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=gbk COMMENT='通用字典表';

-- ----------------------------
-- Records of sys_macro
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `status` int(1) DEFAULT NULL,
  `identify` bigint(20) DEFAULT NULL COMMENT '身份标识',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=407 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '0', '系统管理', null, null, '0', 'fa fa-cog', '11', '0', null);
INSERT INTO `sys_menu` VALUES ('2', '1', '管理员列表', 'sys/user.html', null, '1', 'fa fa-user', '1', '0', null);
INSERT INTO `sys_menu` VALUES ('3', '1', '角色管理', 'sys/role.html', null, '1', 'fa fa-user-secret', '2', '0', null);
INSERT INTO `sys_menu` VALUES ('4', '1', '菜单管理', 'sys/menu.html', null, '1', 'fa fa-folder-open', '4', '0', null);
INSERT INTO `sys_menu` VALUES ('5', '1', 'SQL监控', 'druid/sql.html', null, '1', 'fa fa-linux', '9', '1', '0');
INSERT INTO `sys_menu` VALUES ('6', '1', '定时任务', 'sys/schedule.html', null, '1', 'fa fa-tasks', '5', '1', '0');
INSERT INTO `sys_menu` VALUES ('7', '6', '查看', null, 'sys:schedule:list,sys:schedule:info', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('8', '6', '新增', null, 'sys:schedule:save', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('9', '6', '修改', null, 'sys:schedule:update', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('10', '6', '删除', null, 'sys:schedule:delete', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('11', '6', '暂停', null, 'sys:schedule:pause', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('12', '6', '恢复', null, 'sys:schedule:resume', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('13', '6', '立即执行', null, 'sys:schedule:run', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('14', '6', '日志列表', null, 'sys:schedule:log', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('15', '2', '查看', null, 'sys:user:list,sys:user:info', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('16', '2', '新增', null, 'sys:user:save,sys:role:select', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('17', '2', '修改', null, 'sys:user:update,sys:role:select', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('18', '2', '删除', null, 'sys:user:delete', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('19', '3', '查看', null, 'sys:role:list,sys:role:info', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('20', '3', '新增', null, 'sys:role:save,sys:menu:perms', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('21', '3', '修改', null, 'sys:role:update,sys:menu:perms', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('22', '3', '删除', null, 'sys:role:delete', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('23', '4', '查看', null, 'sys:menu:list,sys:menu:info', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('24', '4', '新增', null, 'sys:menu:save,sys:menu:select', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('25', '4', '修改', null, 'sys:menu:update,sys:menu:select', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('26', '4', '删除', null, 'sys:menu:delete', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('27', '1', '系统参数', 'sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '7', '1', '0');
INSERT INTO `sys_menu` VALUES ('28', '1', '代码生成器', 'sys/generator.html', 'sys:generator:list,sys:generator:code', '1', 'fa fa-rocket', '10', '1', '0');
INSERT INTO `sys_menu` VALUES ('29', '1', '系统日志', 'sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '8', '1', '0');
INSERT INTO `sys_menu` VALUES ('30', '1', '文件上传', 'sys/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '6', '1', '0');
INSERT INTO `sys_menu` VALUES ('31', '0', '功能测试', null, null, '0', 'fa fa-bug', '11', '1', '0');
INSERT INTO `sys_menu` VALUES ('200', '0', '会员管理', null, null, '0', 'fa fa-user-circle-o', '1', '0', null);
INSERT INTO `sys_menu` VALUES ('201', '200', '会员管理', 'shop/shopuser.html', null, '1', 'fa fa-user-md', '1', '0', null);
INSERT INTO `sys_menu` VALUES ('202', '201', '查看', null, 'user:list,user:info', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('203', '201', '新增', null, 'user:save', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('204', '201', '修改', null, 'user:update', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('205', '201', '删除', null, 'user:delete', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('206', '31', 'iviewDemo', 'test/iviewDemo.html', null, '1', 'fa fa-etsy', '0', '0', null);
INSERT INTO `sys_menu` VALUES ('207', '200', '会员等级', 'shop/userlevel.html', null, '1', 'fa fa-star-o', '0', '1', null);
INSERT INTO `sys_menu` VALUES ('208', '207', '查看', null, 'userlevel:list,userlevel:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('209', '207', '新增', null, 'userlevel:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('210', '207', '修改', null, 'userlevel:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('211', '207', '删除', null, 'userlevel:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('212', '200', '收货地址管理', 'shop/address.html', null, '1', 'fa fa-map-marker', '6', '0', null);
INSERT INTO `sys_menu` VALUES ('213', '212', '查看', null, 'address:list,address:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('214', '212', '新增', null, 'address:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('215', '212', '修改', null, 'address:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('216', '212', '删除', null, 'address:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('222', '0', '商城配置', null, null, '0', 'fa fa-shopping-cart', '2', '0', null);
INSERT INTO `sys_menu` VALUES ('223', '222', '商品属性种类', 'shop/attributecategory.html', null, '1', 'fa fa-sun-o', '0', '0', null);
INSERT INTO `sys_menu` VALUES ('224', '223', '查看', null, 'attributecategory:list,attributecategory:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('225', '223', '新增', null, 'attributecategory:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('226', '223', '修改', null, 'attributecategory:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('227', '223', '删除', null, 'attributecategory:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('233', '243', '广告列表', 'shop/ad.html', null, '1', 'fa fa-pencil', '1', '0', null);
INSERT INTO `sys_menu` VALUES ('234', '233', '查看', null, 'ad:list,ad:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('235', '233', '新增', null, 'ad:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('236', '233', '修改', null, 'ad:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('237', '233', '删除', null, 'ad:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('238', '243', '广告位置', 'shop/adposition.html', null, '1', 'fa fa-map-pin', '0', '0', null);
INSERT INTO `sys_menu` VALUES ('239', '238', '查看', null, 'adposition:list,adposition:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('240', '238', '新增', null, 'adposition:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('241', '238', '修改', null, 'adposition:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('242', '238', '删除', null, 'adposition:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('243', '0', '推广管理', null, null, '0', 'fa fa-hand-paper-o', '5', '0', null);
INSERT INTO `sys_menu` VALUES ('244', '243', '优惠劵管理', 'shop/coupon.html', null, '1', 'fa fa-cc-visa', '2', '1', '0');
INSERT INTO `sys_menu` VALUES ('245', '244', '查看', null, 'coupon:list,coupon:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('246', '244', '新增', null, 'coupon:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('247', '244', '修改', null, 'coupon:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('248', '244', '删除', null, 'coupon:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('249', '200', '会员优惠劵', 'shop/usercoupon.html', null, '1', 'fa fa-cc-visa', '2', '1', '0');
INSERT INTO `sys_menu` VALUES ('250', '249', '查看', null, 'usercoupon:list,usercoupon:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('251', '249', '新增', null, 'usercoupon:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('252', '249', '修改', null, 'usercoupon:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('253', '249', '删除', null, 'usercoupon:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('254', '222', '品牌制造商', 'shop/brand.html', null, '1', 'fa fa-registered', '5', '0', null);
INSERT INTO `sys_menu` VALUES ('255', '254', '查看', null, 'brand:list,brand:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('256', '254', '新增', null, 'brand:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('257', '254', '修改', null, 'brand:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('258', '254', '删除', null, 'brand:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('259', '222', '商品规格', 'shop/specification.html', null, '1', 'fa fa-hand-rock-o', '1', '0', null);
INSERT INTO `sys_menu` VALUES ('260', '259', '查看', null, 'specification:list,specification:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('261', '259', '新增', null, 'specification:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('262', '259', '修改', null, 'specification:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('263', '259', '删除', null, 'specification:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('264', '200', '会员收藏', 'shop/collect.html', null, '1', 'fa fa-star', '3', '0', null);
INSERT INTO `sys_menu` VALUES ('265', '264', '查看', null, 'collect:list,collect:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('266', '264', '删除', null, 'collect:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('270', '243', '专题管理', 'shop/topic.html', null, '1', 'fa fa-ticket', '5', '1', null);
INSERT INTO `sys_menu` VALUES ('271', '270', '查看', null, 'topic:list,topic:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('272', '270', '新增', null, 'topic:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('273', '270', '修改', null, 'topic:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('274', '270', '删除', null, 'topic:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('275', '243', '专题分类', 'shop/topiccategory.html', null, '1', 'fa fa-tint', '4', '1', null);
INSERT INTO `sys_menu` VALUES ('276', '275', '查看', null, 'topiccategory:list,topiccategory:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('277', '275', '新增', null, 'topiccategory:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('278', '275', '修改', null, 'topiccategory:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('279', '275', '删除', null, 'topiccategory:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('280', '200', '会员足迹', 'shop/footprint.html', null, '1', 'fa fa-history', '6', '0', null);
INSERT INTO `sys_menu` VALUES ('281', '280', '查看', null, 'footprint:list,footprint:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('282', '280', '删除', null, 'footprint:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('283', '200', '搜索历史', 'shop/searchhistory.html', null, '1', 'fa fa-search', '6', '0', null);
INSERT INTO `sys_menu` VALUES ('284', '283', '查看', null, 'searchhistory:list,searchhistory:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('285', '283', '删除', null, 'searchhistory:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('286', '200', '购物车', 'shop/cart.html', null, '1', 'fa fa-shopping-cart', '6', '0', null);
INSERT INTO `sys_menu` VALUES ('287', '286', '查看', null, 'cart:list,cart:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('288', '286', '删除', null, 'cart:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('289', '357', '所有商品', 'shop/goods.html', null, '1', 'fa fa-shopping-bag', '1', '0', null);
INSERT INTO `sys_menu` VALUES ('290', '289', '查看', null, 'goods:list,goods:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('291', '289', '新增', null, 'goods:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('292', '289', '修改', null, 'goods:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('293', '289', '删除', null, 'goods:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('294', '374', '所有管理', 'shop/order.html', null, '1', 'fa fa-sitemap', '6', '0', null);
INSERT INTO `sys_menu` VALUES ('295', '294', '查看', null, 'order:list,order:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('296', '294', '发货', null, 'order:sendGoods', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('297', '222', '商品类型', 'shop/category.html', null, '1', 'fa fa-ship', '3', '0', null);
INSERT INTO `sys_menu` VALUES ('298', '297', '查看', null, 'category:list,category:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('299', '297', '新增', null, 'category:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('300', '297', '修改', null, 'category:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('301', '297', '删除', null, 'category:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('302', '1', '通用字典表', 'sys/macro.html', null, '1', 'fa fa-book', '6', '1', '0');
INSERT INTO `sys_menu` VALUES ('303', '302', '查看', null, 'sys:macro:list,sys:macro:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('304', '302', '新增', null, 'sys:macro:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('305', '302', '修改', null, 'sys:macro:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('306', '302', '删除', null, 'sys:macro:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('307', '222', '渠道管理', 'shop/channel.html', null, '1', 'fa fa-road', '2', '1', null);
INSERT INTO `sys_menu` VALUES ('308', '307', '查看', null, 'channel:list,channel:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('309', '307', '新增', null, 'channel:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('310', '307', '修改', null, 'channel:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('311', '307', '删除', null, 'channel:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('312', '0', '微信公众号', null, null, '0', 'fa fa-weixin', '6', '1', '0');
INSERT INTO `sys_menu` VALUES ('313', '0', '进销存', null, null, '0', 'fa fa-truck', '6', '1', '0');
INSERT INTO `sys_menu` VALUES ('314', '0', '统计报表', null, null, '0', 'fa fa-line-chart', '7', '1', '0');
INSERT INTO `sys_menu` VALUES ('315', '222', '商品问答', 'shop/goodsissue.html', null, '1', 'fa fa-question-circle-o', '6', '1', '0');
INSERT INTO `sys_menu` VALUES ('316', '315', '查看', null, 'goodsissue:list,goodsissue:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('317', '315', '新增', null, 'goodsissue:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('318', '315', '修改', null, 'goodsissue:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('319', '315', '删除', null, 'goodsissue:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('325', '222', '反馈', 'shop/feedback.html', null, '1', 'fa fa-mail-reply-all', '6', '1', '0');
INSERT INTO `sys_menu` VALUES ('326', '325', '查看', null, 'feedback:list,feedback:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('327', '325', '新增', null, 'feedback:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('328', '325', '修改', null, 'feedback:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('329', '325', '删除', null, 'feedback:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('330', '244', '发放', null, 'coupon:publish', '2', null, '4', '0', null);
INSERT INTO `sys_menu` VALUES ('331', '222', '关键词', 'shop/keywords.html', null, '1', 'fa fa-underline', '6', '0', null);
INSERT INTO `sys_menu` VALUES ('332', '331', '查看', null, 'keywords:list,keywords:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('333', '331', '新增', null, 'keywords:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('334', '331', '修改', null, 'keywords:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('335', '331', '删除', null, 'keywords:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('336', '357', '用户评论', 'shop/comment.html', null, '1', 'fa fa-commenting', '6', '1', '0');
INSERT INTO `sys_menu` VALUES ('337', '336', '查看', null, 'comment:list,comment:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('338', '336', '新增', null, 'comment:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('339', '336', '修改', null, 'comment:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('340', '336', '删除', null, 'comment:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('341', '336', '修改状态', null, 'comment:toggleStatus', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('342', '357', '产品设置', 'shop/product.html', null, '1', 'fa fa-paypal', '3', '0', null);
INSERT INTO `sys_menu` VALUES ('343', '342', '查看', null, 'product:list,product:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('344', '342', '新增', null, 'product:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('345', '342', '修改', null, 'product:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('346', '342', '删除', null, 'product:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('347', '357', '商品满减搭配', 'shop/goodscrash.html', null, '1', 'fa fa-venus-double', '4', '1', '0');
INSERT INTO `sys_menu` VALUES ('348', '347', '查看', null, 'goodscrash:list,goodscrash:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('349', '347', '新增', null, 'goodscrash:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('350', '347', '修改', null, 'goodscrash:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('351', '347', '删除', null, 'goodscrash:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('352', '357', '商品规格', 'shop/goodsspecification.html', null, '1', 'fa fa-deafness', '2', '0', null);
INSERT INTO `sys_menu` VALUES ('353', '352', '查看', null, 'goodsspecification:list,goodsspecification:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('354', '352', '新增', null, 'goodsspecification:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('355', '352', '修改', null, 'goodsspecification:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('356', '352', '删除', null, 'goodsspecification:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('357', '0', '编辑商品', null, null, '0', 'fa fa-edit', '3', '0', null);
INSERT INTO `sys_menu` VALUES ('358', '357', '商品回收站', 'shop/goodshistory.html', '', '1', 'fa fa-history', '12', '0', null);
INSERT INTO `sys_menu` VALUES ('359', '358', '恢复', null, 'goods:back', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('360', '294', '确认收获', null, 'order:confirm', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('361', '357', '团购设置', 'shop/goodsgroup.html', null, '1', 'fa fa-group', '5', '1', '0');
INSERT INTO `sys_menu` VALUES ('362', '361', '查看', null, 'goodsgroup:list,goodsgroup:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('363', '361', '新增', null, 'goodsgroup:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('364', '361', '修改', null, 'goodsgroup:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('365', '361', '删除', null, 'goodsgroup:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('366', '0', '新闻管理', null, null, '0', 'fa fa-leanpub', '6', '0', '0');
INSERT INTO `sys_menu` VALUES ('367', '31', 'jsp页面测试', 'test/toTest', null, '1', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('368', '1', '部门管理', 'sys/dept.html', null, '1', 'fa fa-sitemap', '3', '0', null);
INSERT INTO `sys_menu` VALUES ('369', '368', '查看', null, 'sys:dept:list,sys:dept:info', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('370', '368', '新增', null, 'sys:dept:save', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('371', '368', '修改', null, 'sys:dept:update', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('372', '368', '删除', null, 'sys:dept:delete', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('373', '368', '选择部门', null, 'sys:dept:select', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('374', '0', '订单管理', null, null, '0', 'fa fa-first-order', '4', '0', null);
INSERT INTO `sys_menu` VALUES ('375', '379', '删除', null, 'sys:region:delete', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('376', '379', '修改', '', 'sys:region:update', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('377', '379', '新增', null, 'sys:region:save', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('378', '379', '查看', null, 'sys:region:list,sys:region:info', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('379', '1', '地区管理', 'sys/region.html', null, '1', 'fa fa-map-pin', '8', '1', '0');
INSERT INTO `sys_menu` VALUES ('380', '366', '新闻资讯', 'news/newsmessage.html', '', '1', 'fa fa-newspaper-o', '0', '0', null);
INSERT INTO `sys_menu` VALUES ('381', '380', '查看', null, 'newsmessage:list,newsmessage:info', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('382', '380', '新增', null, 'newsmessage:save', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('383', '380', '修改', null, 'newsmessage:update', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('384', '380', '删除', null, 'newsmessage:delete', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('385', '366', '评论管理', 'news/newscomment.html', '', '1', 'fa fa-commenting', '2', '0', null);
INSERT INTO `sys_menu` VALUES ('386', '366', '新闻类型', 'news/newstype.html', null, '1', 'fa fa-th-list', '1', '0', null);
INSERT INTO `sys_menu` VALUES ('387', '386', '查看', null, 'newstype:list,newstype:info', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('388', '386', '新增', null, 'newstype:save', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('389', '386', '修改', null, 'newstype:update', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('390', '386', '删除', null, 'newstype:delete', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('391', '385', '查看', null, 'newscomment:list,newscomment:info', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('392', '385', '新增', null, 'newscomment:save', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('393', '385', '修改', null, 'newscomment:update', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('394', '385', '删除', null, 'newscomment:delete', '2', null, '0', '0', null);
INSERT INTO `sys_menu` VALUES ('395', '1', '多店铺设置', 'store/storeconfigure.html', null, '1', 'fa fa-file-code-o', '6', '0', null);
INSERT INTO `sys_menu` VALUES ('396', '395', '查看', null, 'storeconfigure:list,storeconfigure:info', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('397', '395', '新增', null, 'storeconfigure:save', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('398', '395', '修改', null, 'storeconfigure:update', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('399', '395', '删除', null, 'storeconfigure:delete', '2', null, '6', '0', null);
INSERT INTO `sys_menu` VALUES ('401', '357', '商品图片', 'shop/goodsgallery.html', null, '1', 'fa fa-image', '2', '0', '0');
INSERT INTO `sys_menu` VALUES ('402', '401', '查看', null, 'goodsgallery:list,goodsgallery:info', '2', null, '6', '0', '0');
INSERT INTO `sys_menu` VALUES ('403', '401', '上传', null, 'goodsgallery:save', '2', null, '6', '0', '0');
INSERT INTO `sys_menu` VALUES ('404', '401', '修改', null, 'goodsgallery:update', '2', null, '6', '0', '0');
INSERT INTO `sys_menu` VALUES ('405', '401', '删除', null, 'goodsgallery:delete', '2', null, '6', '0', '0');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=364 DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
INSERT INTO `sys_oss` VALUES ('17', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/1813388598e641.jpg', '2018-01-16 18:13:39');
INSERT INTO `sys_oss` VALUES ('18', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/181528166dbd38.jpg', '2018-01-16 18:15:29');
INSERT INTO `sys_oss` VALUES ('19', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/1815591683787b.jpg', '2018-01-16 18:15:59');
INSERT INTO `sys_oss` VALUES ('20', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/1817235551be00.jpg', '2018-01-16 18:17:24');
INSERT INTO `sys_oss` VALUES ('21', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/1819023354d59b.jpg', '2018-01-16 18:19:02');
INSERT INTO `sys_oss` VALUES ('22', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/1823138359514b.jpg', '2018-01-16 18:23:14');
INSERT INTO `sys_oss` VALUES ('23', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/1824435183b651.jpg', '2018-01-16 18:24:44');
INSERT INTO `sys_oss` VALUES ('24', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/182640440d49c.jpg', '2018-01-16 18:26:41');
INSERT INTO `sys_oss` VALUES ('25', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/1828207eb914.jpg', '2018-01-16 18:28:20');
INSERT INTO `sys_oss` VALUES ('26', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/1830376798cfc3.jpg', '2018-01-16 18:30:38');
INSERT INTO `sys_oss` VALUES ('27', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/183120171e91d3.jpg', '2018-01-16 18:31:20');
INSERT INTO `sys_oss` VALUES ('28', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/1835207597a543.jpg', '2018-01-16 18:35:21');
INSERT INTO `sys_oss` VALUES ('29', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/184054543843db.jpg', '2018-01-16 18:40:55');
INSERT INTO `sys_oss` VALUES ('30', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/1842177827d73e.jpg', '2018-01-16 18:42:18');
INSERT INTO `sys_oss` VALUES ('31', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/191610485b0357.jpg', '2018-01-16 19:16:11');
INSERT INTO `sys_oss` VALUES ('32', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/19161443648cb8.jpg', '2018-01-16 19:16:14');
INSERT INTO `sys_oss` VALUES ('33', 'http://p2n8ypmnw.bkt.clouddn.com/20180116/1916207899003f.jpg', '2018-01-16 19:16:21');
INSERT INTO `sys_oss` VALUES ('34', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/093013281d06a6.jpg', '2018-01-17 09:30:15');
INSERT INTO `sys_oss` VALUES ('35', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/093103763a5426.jpg', '2018-01-17 09:31:04');
INSERT INTO `sys_oss` VALUES ('36', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/09450715ab16.jpg', '2018-01-17 09:45:08');
INSERT INTO `sys_oss` VALUES ('37', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/09465191380b51.jpg', '2018-01-17 09:46:52');
INSERT INTO `sys_oss` VALUES ('38', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/0954008305a007.jpg', '2018-01-17 09:54:01');
INSERT INTO `sys_oss` VALUES ('39', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1001581667310f.jpg', '2018-01-17 10:01:59');
INSERT INTO `sys_oss` VALUES ('40', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1001581387510e.jpg', '2018-01-17 10:01:59');
INSERT INTO `sys_oss` VALUES ('41', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/100158137acf93.jpg', '2018-01-17 10:01:59');
INSERT INTO `sys_oss` VALUES ('42', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/100158137ca76b.jpg', '2018-01-17 10:01:59');
INSERT INTO `sys_oss` VALUES ('43', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/100209623199de.jpg', '2018-01-17 10:02:10');
INSERT INTO `sys_oss` VALUES ('44', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/10022395789edc.jpg', '2018-01-17 10:02:24');
INSERT INTO `sys_oss` VALUES ('45', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1002332994da9e.jpg', '2018-01-17 10:02:33');
INSERT INTO `sys_oss` VALUES ('46', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/10023962417c1e.jpg', '2018-01-17 10:02:40');
INSERT INTO `sys_oss` VALUES ('47', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/100527369f16df.jpg', '2018-01-17 10:05:28');
INSERT INTO `sys_oss` VALUES ('48', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/10054822672439.jpg', '2018-01-17 10:05:48');
INSERT INTO `sys_oss` VALUES ('49', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/10061274277cff.jpg', '2018-01-17 10:06:13');
INSERT INTO `sys_oss` VALUES ('50', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/100645914c2db8.jpg', '2018-01-17 10:06:46');
INSERT INTO `sys_oss` VALUES ('51', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/100742718bad3e.jpg', '2018-01-17 10:07:43');
INSERT INTO `sys_oss` VALUES ('52', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/100811154b4f88.jpg', '2018-01-17 10:08:11');
INSERT INTO `sys_oss` VALUES ('53', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/100919791bc4f1.jpg', '2018-01-17 10:09:20');
INSERT INTO `sys_oss` VALUES ('54', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/100940999b07f5.jpg', '2018-01-17 10:09:41');
INSERT INTO `sys_oss` VALUES ('55', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/101004662f6ce3.jpg', '2018-01-17 10:10:05');
INSERT INTO `sys_oss` VALUES ('56', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/101028430e585c.jpg', '2018-01-17 10:10:29');
INSERT INTO `sys_oss` VALUES ('57', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/102105387e1357.jpg', '2018-01-17 10:21:06');
INSERT INTO `sys_oss` VALUES ('58', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/10261237551e97.jpg', '2018-01-17 10:26:13');
INSERT INTO `sys_oss` VALUES ('59', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/10295470436cc7.jpg', '2018-01-17 10:29:55');
INSERT INTO `sys_oss` VALUES ('60', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/102954707c3a8d.jpg', '2018-01-17 10:29:55');
INSERT INTO `sys_oss` VALUES ('61', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/102954763dea7b.jpg', '2018-01-17 10:29:55');
INSERT INTO `sys_oss` VALUES ('62', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1029546964d314.jpg', '2018-01-17 10:29:55');
INSERT INTO `sys_oss` VALUES ('63', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/103002792b1832.jpg', '2018-01-17 10:30:03');
INSERT INTO `sys_oss` VALUES ('64', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1030072823bd60.jpg', '2018-01-17 10:30:07');
INSERT INTO `sys_oss` VALUES ('65', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/10301686c11a8.jpg', '2018-01-17 10:30:16');
INSERT INTO `sys_oss` VALUES ('66', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/103036416e2c25.jpg', '2018-01-17 10:30:37');
INSERT INTO `sys_oss` VALUES ('67', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/103048775d028b.jpg', '2018-01-17 10:30:49');
INSERT INTO `sys_oss` VALUES ('68', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/103101470b5c6.jpg', '2018-01-17 10:31:01');
INSERT INTO `sys_oss` VALUES ('69', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/103112837dfdc.jpg', '2018-01-17 10:31:12');
INSERT INTO `sys_oss` VALUES ('70', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/10312078092470.jpg', '2018-01-17 10:31:21');
INSERT INTO `sys_oss` VALUES ('71', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/103142109e1524.jpg', '2018-01-17 10:31:42');
INSERT INTO `sys_oss` VALUES ('72', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1032066905ffc2.jpg', '2018-01-17 10:32:07');
INSERT INTO `sys_oss` VALUES ('73', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1032251943bd4.jpg', '2018-01-17 10:32:25');
INSERT INTO `sys_oss` VALUES ('74', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1032366012fe30.jpg', '2018-01-17 10:32:37');
INSERT INTO `sys_oss` VALUES ('75', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1032519398fe42.jpg', '2018-01-17 10:32:52');
INSERT INTO `sys_oss` VALUES ('76', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1033086343048b.jpg', '2018-01-17 10:33:09');
INSERT INTO `sys_oss` VALUES ('77', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1033209615e71.jpg', '2018-01-17 10:33:20');
INSERT INTO `sys_oss` VALUES ('78', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/103329649b403a.jpg', '2018-01-17 10:33:30');
INSERT INTO `sys_oss` VALUES ('79', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/103332133bc4be.jpg', '2018-01-17 10:33:32');
INSERT INTO `sys_oss` VALUES ('80', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1033371729e125.jpg', '2018-01-17 10:33:37');
INSERT INTO `sys_oss` VALUES ('81', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/103346291c1b9.jpg', '2018-01-17 10:33:46');
INSERT INTO `sys_oss` VALUES ('82', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/10334970715402.jpg', '2018-01-17 10:33:50');
INSERT INTO `sys_oss` VALUES ('83', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1033522858c0ea.jpg', '2018-01-17 10:33:52');
INSERT INTO `sys_oss` VALUES ('84', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/103354806121a9.jpg', '2018-01-17 10:33:55');
INSERT INTO `sys_oss` VALUES ('85', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/10360335c88ca.jpg', '2018-01-17 10:36:04');
INSERT INTO `sys_oss` VALUES ('86', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/10370167589bce.jpg', '2018-01-17 10:37:02');
INSERT INTO `sys_oss` VALUES ('87', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/103716220cb8af.jpg', '2018-01-17 10:37:16');
INSERT INTO `sys_oss` VALUES ('88', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/103728774bb0fc.jpg', '2018-01-17 10:37:29');
INSERT INTO `sys_oss` VALUES ('89', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/10504255ca9f2.jpg', '2018-01-17 10:50:43');
INSERT INTO `sys_oss` VALUES ('90', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1052145282f1c5.jpg', '2018-01-17 10:52:15');
INSERT INTO `sys_oss` VALUES ('91', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/105240665a8b3f.jpg', '2018-01-17 10:52:41');
INSERT INTO `sys_oss` VALUES ('92', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1100275722da9e.jpg', '2018-01-17 11:00:28');
INSERT INTO `sys_oss` VALUES ('93', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/112049116855a7.jpg', '2018-01-17 11:20:50');
INSERT INTO `sys_oss` VALUES ('94', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/112049113ae338.jpg', '2018-01-17 11:20:50');
INSERT INTO `sys_oss` VALUES ('95', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/11204911181d35.jpg', '2018-01-17 11:20:50');
INSERT INTO `sys_oss` VALUES ('96', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/112049112b5a72.jpg', '2018-01-17 11:20:50');
INSERT INTO `sys_oss` VALUES ('97', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1120491158cb47.jpg', '2018-01-17 11:20:50');
INSERT INTO `sys_oss` VALUES ('98', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/11205529946caa.jpg', '2018-01-17 11:20:55');
INSERT INTO `sys_oss` VALUES ('99', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1121004964c92e.jpg', '2018-01-17 11:21:01');
INSERT INTO `sys_oss` VALUES ('100', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/112105680c07ad.jpg', '2018-01-17 11:21:06');
INSERT INTO `sys_oss` VALUES ('101', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1121097266614b.jpg', '2018-01-17 11:21:10');
INSERT INTO `sys_oss` VALUES ('102', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/112113698eeefb.jpg', '2018-01-17 11:21:14');
INSERT INTO `sys_oss` VALUES ('103', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/112503754d41b2.jpg', '2018-01-17 11:25:04');
INSERT INTO `sys_oss` VALUES ('104', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/11251065740f84.jpg', '2018-01-17 11:25:11');
INSERT INTO `sys_oss` VALUES ('105', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1125188329afec.jpg', '2018-01-17 11:25:19');
INSERT INTO `sys_oss` VALUES ('106', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/11252519748efc.jpg', '2018-01-17 11:25:25');
INSERT INTO `sys_oss` VALUES ('107', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/112527980f5c9c.jpg', '2018-01-17 11:25:28');
INSERT INTO `sys_oss` VALUES ('108', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1125299649c3b0.jpg', '2018-01-17 11:25:30');
INSERT INTO `sys_oss` VALUES ('109', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1125324448f383.jpg', '2018-01-17 11:25:33');
INSERT INTO `sys_oss` VALUES ('110', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1125344543c58a.jpg', '2018-01-17 11:25:35');
INSERT INTO `sys_oss` VALUES ('111', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/11253872740225.jpg', '2018-01-17 11:25:39');
INSERT INTO `sys_oss` VALUES ('112', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1125413080d6dc.jpg', '2018-01-17 11:25:41');
INSERT INTO `sys_oss` VALUES ('113', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/1130277342a7fa.jpg', '2018-01-17 11:30:28');
INSERT INTO `sys_oss` VALUES ('114', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/11342561377a01.jpg', '2018-01-17 11:34:26');
INSERT INTO `sys_oss` VALUES ('115', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/113441405f6d15.jpg', '2018-01-17 11:34:41');
INSERT INTO `sys_oss` VALUES ('116', 'http://p2n8ypmnw.bkt.clouddn.com/20180117/113457472b40ba.jpg', '2018-01-17 11:34:58');
INSERT INTO `sys_oss` VALUES ('117', 'http://p2n8ypmnw.bkt.clouddn.com/20180129/10215798482c13.png', '2018-01-29 10:21:58');
INSERT INTO `sys_oss` VALUES ('118', 'http://p2n8ypmnw.bkt.clouddn.com/20180129/1022365100afc6.png', '2018-01-29 10:22:37');
INSERT INTO `sys_oss` VALUES ('119', 'http://p2n8ypmnw.bkt.clouddn.com/20180129/10241063581a4a.png', '2018-01-29 10:24:11');
INSERT INTO `sys_oss` VALUES ('120', 'http://p2n8ypmnw.bkt.clouddn.com/20180129/140444480133b7.png', '2018-01-29 14:04:45');
INSERT INTO `sys_oss` VALUES ('121', 'http://p2n8ypmnw.bkt.clouddn.com/20180129/14192298142e48.png', '2018-01-29 14:19:23');
INSERT INTO `sys_oss` VALUES ('122', 'http://p2n8ypmnw.bkt.clouddn.com/20180129/14313721681b82.jpg', '2018-01-29 14:31:37');
INSERT INTO `sys_oss` VALUES ('123', 'http://p2n8ypmnw.bkt.clouddn.com/20180129/143942255d6fdb.jpg', '2018-01-29 14:39:42');
INSERT INTO `sys_oss` VALUES ('124', 'http://p2n8ypmnw.bkt.clouddn.com/20180129/14532661305f86.jpg', '2018-01-29 14:53:27');
INSERT INTO `sys_oss` VALUES ('125', 'http://p2n8ypmnw.bkt.clouddn.com/20180129/150049481bd552.jpg', '2018-01-29 15:00:50');
INSERT INTO `sys_oss` VALUES ('126', 'http://p2n8ypmnw.bkt.clouddn.com/20180129/150941720c6ef2.png', '2018-01-29 15:09:42');
INSERT INTO `sys_oss` VALUES ('127', 'http://p2n8ypmnw.bkt.clouddn.com/20180129/15094944328f8c.png', '2018-01-29 15:09:50');
INSERT INTO `sys_oss` VALUES ('128', 'http://p2n8ypmnw.bkt.clouddn.com/20180129/163947389b5b51.jpg', '2018-01-29 16:39:48');
INSERT INTO `sys_oss` VALUES ('129', 'http://p2n8ypmnw.bkt.clouddn.com/20180129/17444373bfaee.png', '2018-01-29 17:44:43');
INSERT INTO `sys_oss` VALUES ('130', 'http://p2n8ypmnw.bkt.clouddn.com/20180129/1803237724edd0.jpg', '2018-01-29 18:03:24');
INSERT INTO `sys_oss` VALUES ('131', 'http://p2n8ypmnw.bkt.clouddn.com/20180129/18081945641b72.png', '2018-01-29 18:08:20');
INSERT INTO `sys_oss` VALUES ('132', 'http://p2n8ypmnw.bkt.clouddn.com/20180130/150345821491f9.png', '2018-01-30 15:03:47');
INSERT INTO `sys_oss` VALUES ('133', 'http://p2n8ypmnw.bkt.clouddn.com/20180130/1537001863eb63.png', '2018-01-30 15:37:01');
INSERT INTO `sys_oss` VALUES ('134', 'http://p2n8ypmnw.bkt.clouddn.com/20180130/1547287526a01c.png', '2018-01-30 15:47:30');
INSERT INTO `sys_oss` VALUES ('135', 'http://p2n8ypmnw.bkt.clouddn.com/20180131/145540128fb19e.jpg', '2018-01-31 14:55:41');
INSERT INTO `sys_oss` VALUES ('136', 'http://p2n8ypmnw.bkt.clouddn.com/20180323/091545985eaff1.png', '2018-03-23 09:15:47');
INSERT INTO `sys_oss` VALUES ('137', 'http://p2n8ypmnw.bkt.clouddn.com/20180323/09155856526e97.png', '2018-03-23 09:15:59');
INSERT INTO `sys_oss` VALUES ('138', 'http://p2n8ypmnw.bkt.clouddn.com/20180323/17421958823a61.png', '2018-03-23 17:42:20');
INSERT INTO `sys_oss` VALUES ('139', 'http://p2n8ypmnw.bkt.clouddn.com/20180327/181050251f70df.jpg', '2018-03-27 18:10:51');
INSERT INTO `sys_oss` VALUES ('140', 'http://p2n8ypmnw.bkt.clouddn.com/20180327/18114818472cce.jpg', '2018-03-27 18:11:48');
INSERT INTO `sys_oss` VALUES ('141', 'http://p2n8ypmnw.bkt.clouddn.com/20180327/181516679f4f2d.jpg', '2018-03-27 18:15:17');
INSERT INTO `sys_oss` VALUES ('142', 'http://p2n8ypmnw.bkt.clouddn.com/20180327/18153583675b5e.jpg', '2018-03-27 18:15:36');
INSERT INTO `sys_oss` VALUES ('143', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/103516494cf057.jpg', '2018-04-02 10:35:17');
INSERT INTO `sys_oss` VALUES ('144', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/10355283613063.jpg', '2018-04-02 10:35:53');
INSERT INTO `sys_oss` VALUES ('145', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/10385771316332.jpg', '2018-04-02 10:38:58');
INSERT INTO `sys_oss` VALUES ('146', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/10432332238b5e.jpg', '2018-04-02 10:43:23');
INSERT INTO `sys_oss` VALUES ('147', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/104328530ca997.jpg', '2018-04-02 10:43:29');
INSERT INTO `sys_oss` VALUES ('148', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/10433089803889.jpg', '2018-04-02 10:43:31');
INSERT INTO `sys_oss` VALUES ('149', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1049087396ffe1.jpg', '2018-04-02 10:49:09');
INSERT INTO `sys_oss` VALUES ('150', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1049252797771d.jpg', '2018-04-02 10:49:25');
INSERT INTO `sys_oss` VALUES ('151', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1050385433c3da.jpg', '2018-04-02 10:50:39');
INSERT INTO `sys_oss` VALUES ('152', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1050555892508a.jpg', '2018-04-02 10:50:56');
INSERT INTO `sys_oss` VALUES ('153', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/105118578fb1c3.jpg', '2018-04-02 10:51:19');
INSERT INTO `sys_oss` VALUES ('154', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/105837216cfd32.png', '2018-04-02 10:58:37');
INSERT INTO `sys_oss` VALUES ('155', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1058598223cca4.png', '2018-04-02 10:59:00');
INSERT INTO `sys_oss` VALUES ('156', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/105916263db184.png', '2018-04-02 10:59:16');
INSERT INTO `sys_oss` VALUES ('157', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/105944890a2e56.png', '2018-04-02 10:59:45');
INSERT INTO `sys_oss` VALUES ('158', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/11013455347557.jpg', '2018-04-02 11:01:35');
INSERT INTO `sys_oss` VALUES ('159', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/11013894ba1fb.jpg', '2018-04-02 11:01:38');
INSERT INTO `sys_oss` VALUES ('160', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/110255442ba47c.jpg', '2018-04-02 11:02:56');
INSERT INTO `sys_oss` VALUES ('161', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/11031793d57e7.jpg', '2018-04-02 11:03:17');
INSERT INTO `sys_oss` VALUES ('162', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1103394288811d.jpg', '2018-04-02 11:03:40');
INSERT INTO `sys_oss` VALUES ('163', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1103547863d5b5.jpg', '2018-04-02 11:03:55');
INSERT INTO `sys_oss` VALUES ('164', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1104116619003c.jpg', '2018-04-02 11:04:12');
INSERT INTO `sys_oss` VALUES ('165', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1106508545a71.jpg', '2018-04-02 11:06:50');
INSERT INTO `sys_oss` VALUES ('166', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1107086554d615.jpg', '2018-04-02 11:07:09');
INSERT INTO `sys_oss` VALUES ('167', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/111055653a05f.jpg', '2018-04-02 11:10:55');
INSERT INTO `sys_oss` VALUES ('168', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/112817489b52ab.jpg', '2018-04-02 11:28:18');
INSERT INTO `sys_oss` VALUES ('169', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/11314795ecb45.jpg', '2018-04-02 11:31:47');
INSERT INTO `sys_oss` VALUES ('170', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/11394226450c7a.jpg', '2018-04-02 11:39:42');
INSERT INTO `sys_oss` VALUES ('171', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/114653519af4f1.jpg', '2018-04-02 11:46:54');
INSERT INTO `sys_oss` VALUES ('172', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/125728832c80df.jpg', '2018-04-02 12:57:29');
INSERT INTO `sys_oss` VALUES ('173', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/12580050ceaa1.jpg', '2018-04-02 12:58:00');
INSERT INTO `sys_oss` VALUES ('174', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1258048908b5f5.jpg', '2018-04-02 12:58:05');
INSERT INTO `sys_oss` VALUES ('175', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/13024898d1644.jpg', '2018-04-02 13:02:48');
INSERT INTO `sys_oss` VALUES ('176', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1302559425ffa6.jpg', '2018-04-02 13:02:56');
INSERT INTO `sys_oss` VALUES ('177', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/13034640760084.jpg', '2018-04-02 13:03:47');
INSERT INTO `sys_oss` VALUES ('178', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/130530991cf97f.jpg', '2018-04-02 13:05:31');
INSERT INTO `sys_oss` VALUES ('179', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/13054855601334.jpg', '2018-04-02 13:05:49');
INSERT INTO `sys_oss` VALUES ('180', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1313146348c4b6.jpg', '2018-04-02 13:13:15');
INSERT INTO `sys_oss` VALUES ('181', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/13155111761ed9.jpg', '2018-04-02 13:15:51');
INSERT INTO `sys_oss` VALUES ('182', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/132114247cbe7d.jpg', '2018-04-02 13:21:14');
INSERT INTO `sys_oss` VALUES ('183', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/132147282b3c36.jpg', '2018-04-02 13:21:47');
INSERT INTO `sys_oss` VALUES ('184', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/133305518d352d.jpg', '2018-04-02 13:33:06');
INSERT INTO `sys_oss` VALUES ('185', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/13341071877c28.jpg', '2018-04-02 13:34:11');
INSERT INTO `sys_oss` VALUES ('186', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/13452689855fb.jpg', '2018-04-02 13:45:26');
INSERT INTO `sys_oss` VALUES ('187', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1348143539f67f.jpg', '2018-04-02 13:48:15');
INSERT INTO `sys_oss` VALUES ('188', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1348463885c053.jpg', '2018-04-02 13:48:47');
INSERT INTO `sys_oss` VALUES ('189', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1349014082b9e0.jpg', '2018-04-02 13:49:02');
INSERT INTO `sys_oss` VALUES ('190', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135851122bfbcf.jpg', '2018-04-02 13:58:52');
INSERT INTO `sys_oss` VALUES ('191', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/135917348f898a.jpg', '2018-04-02 13:59:17');
INSERT INTO `sys_oss` VALUES ('192', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1407552599d004.jpg', '2018-04-02 14:07:55');
INSERT INTO `sys_oss` VALUES ('193', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/15082491252a45.jpg', '2018-04-02 15:08:25');
INSERT INTO `sys_oss` VALUES ('194', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/150824912f31ee.jpg', '2018-04-02 15:08:25');
INSERT INTO `sys_oss` VALUES ('195', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/150824912f7020.jpg', '2018-04-02 15:08:25');
INSERT INTO `sys_oss` VALUES ('215', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/17373091412066.jpg', '2018-04-02 17:37:31');
INSERT INTO `sys_oss` VALUES ('216', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1738045192bad8.jpg', '2018-04-02 17:38:05');
INSERT INTO `sys_oss` VALUES ('217', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1802303781750f.jpg', '2018-04-02 18:02:30');
INSERT INTO `sys_oss` VALUES ('218', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/180317198d0602.jpg', '2018-04-02 18:03:17');
INSERT INTO `sys_oss` VALUES ('219', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/180442610d8ba1.jpg', '2018-04-02 18:04:43');
INSERT INTO `sys_oss` VALUES ('220', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/18050695091d09.jpg', '2018-04-02 18:05:07');
INSERT INTO `sys_oss` VALUES ('221', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1805318284f1aa.jpg', '2018-04-02 18:05:32');
INSERT INTO `sys_oss` VALUES ('222', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/182118810f239.jpg', '2018-04-02 18:21:19');
INSERT INTO `sys_oss` VALUES ('223', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1824178886acda.jpg', '2018-04-02 18:24:18');
INSERT INTO `sys_oss` VALUES ('224', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/18252846876a79.jpg', '2018-04-02 18:25:29');
INSERT INTO `sys_oss` VALUES ('225', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1825489705e99c.jpg', '2018-04-02 18:25:49');
INSERT INTO `sys_oss` VALUES ('226', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1826084783c87f.jpg', '2018-04-02 18:26:09');
INSERT INTO `sys_oss` VALUES ('227', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/182639839b63f6.jpg', '2018-04-02 18:26:40');
INSERT INTO `sys_oss` VALUES ('228', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/182658125e26e3.jpg', '2018-04-02 18:26:58');
INSERT INTO `sys_oss` VALUES ('229', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/18284494842403.jpg', '2018-04-02 18:28:45');
INSERT INTO `sys_oss` VALUES ('230', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1829105482ddb3.jpg', '2018-04-02 18:29:11');
INSERT INTO `sys_oss` VALUES ('231', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/18293696546c17.jpg', '2018-04-02 18:29:37');
INSERT INTO `sys_oss` VALUES ('232', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/18301530c66bb.jpg', '2018-04-02 18:30:15');
INSERT INTO `sys_oss` VALUES ('233', 'http://p2n8ypmnw.bkt.clouddn.com/20180402/1830428600893f.jpg', '2018-04-02 18:30:43');
INSERT INTO `sys_oss` VALUES ('234', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/093438818ce10d.jpg', '2018-04-08 09:34:39');
INSERT INTO `sys_oss` VALUES ('235', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/093452359d29c7.jpg', '2018-04-08 09:34:53');
INSERT INTO `sys_oss` VALUES ('236', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/093502187ff8cb.jpg', '2018-04-08 09:35:02');
INSERT INTO `sys_oss` VALUES ('237', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/0935101364850c.jpg', '2018-04-08 09:35:11');
INSERT INTO `sys_oss` VALUES ('238', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/093728739e6444.jpg', '2018-04-08 09:37:29');
INSERT INTO `sys_oss` VALUES ('239', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/093732518047bf.jpg', '2018-04-08 09:37:33');
INSERT INTO `sys_oss` VALUES ('240', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/093736860bd492.jpg', '2018-04-08 09:37:37');
INSERT INTO `sys_oss` VALUES ('241', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/09374034650c7.jpg', '2018-04-08 09:37:40');
INSERT INTO `sys_oss` VALUES ('242', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/100920613d6be3.jpg', '2018-04-08 10:09:21');
INSERT INTO `sys_oss` VALUES ('243', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/100929615933b1.jpg', '2018-04-08 10:09:30');
INSERT INTO `sys_oss` VALUES ('244', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/10093623086c32.jpg', '2018-04-08 10:09:36');
INSERT INTO `sys_oss` VALUES ('245', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1009395953559d.jpg', '2018-04-08 10:09:40');
INSERT INTO `sys_oss` VALUES ('246', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1011007224e69d.jpg', '2018-04-08 10:11:01');
INSERT INTO `sys_oss` VALUES ('247', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/101103746b0cc5.jpg', '2018-04-08 10:11:04');
INSERT INTO `sys_oss` VALUES ('248', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/101108247df438.jpg', '2018-04-08 10:11:08');
INSERT INTO `sys_oss` VALUES ('249', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1011119087a8c2.jpg', '2018-04-08 10:11:12');
INSERT INTO `sys_oss` VALUES ('250', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/101200566fb63c.jpg', '2018-04-08 10:12:01');
INSERT INTO `sys_oss` VALUES ('251', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/101203115d9fc2.jpg', '2018-04-08 10:12:03');
INSERT INTO `sys_oss` VALUES ('252', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/10120623236330.jpg', '2018-04-08 10:12:06');
INSERT INTO `sys_oss` VALUES ('253', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1012095811626b.jpg', '2018-04-08 10:12:10');
INSERT INTO `sys_oss` VALUES ('254', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1014259844eaa1.jpg', '2018-04-08 10:14:26');
INSERT INTO `sys_oss` VALUES ('255', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/10143170220e29.jpg', '2018-04-08 10:14:32');
INSERT INTO `sys_oss` VALUES ('256', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1017164464c64c.jpg', '2018-04-08 10:17:17');
INSERT INTO `sys_oss` VALUES ('257', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/101838396e0ab3.jpg', '2018-04-08 10:18:39');
INSERT INTO `sys_oss` VALUES ('258', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1019522303a029.jpg', '2018-04-08 10:19:52');
INSERT INTO `sys_oss` VALUES ('259', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/102340129dbae7.jpg', '2018-04-08 10:23:40');
INSERT INTO `sys_oss` VALUES ('260', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/10243389d3252.jpg', '2018-04-08 10:24:33');
INSERT INTO `sys_oss` VALUES ('261', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/10250425969209.jpg', '2018-04-08 10:25:04');
INSERT INTO `sys_oss` VALUES ('262', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/102523314af8a9.jpg', '2018-04-08 10:25:23');
INSERT INTO `sys_oss` VALUES ('263', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/10254368017cc1.jpg', '2018-04-08 10:25:44');
INSERT INTO `sys_oss` VALUES ('264', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/10342034bca94.jpg', '2018-04-08 10:34:20');
INSERT INTO `sys_oss` VALUES ('265', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/10342659476f99.jpg', '2018-04-08 10:34:27');
INSERT INTO `sys_oss` VALUES ('266', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/103820177045bd.jpg', '2018-04-08 10:38:20');
INSERT INTO `sys_oss` VALUES ('267', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/104132276120db.jpg', '2018-04-08 10:41:33');
INSERT INTO `sys_oss` VALUES ('268', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/104400804a3bc9.jpg', '2018-04-08 10:44:01');
INSERT INTO `sys_oss` VALUES ('269', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/104427120a514f.jpg', '2018-04-08 10:44:27');
INSERT INTO `sys_oss` VALUES ('270', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/104436842a1387.jpg', '2018-04-08 10:44:37');
INSERT INTO `sys_oss` VALUES ('271', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/104450102ef92b.jpg', '2018-04-08 10:44:50');
INSERT INTO `sys_oss` VALUES ('272', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/104502397227d8.jpg', '2018-04-08 10:45:03');
INSERT INTO `sys_oss` VALUES ('273', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1117496329753c.jpg', '2018-04-08 11:17:50');
INSERT INTO `sys_oss` VALUES ('274', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1117535084c0a2.jpg', '2018-04-08 11:17:54');
INSERT INTO `sys_oss` VALUES ('275', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1119115619942c.jpg', '2018-04-08 11:19:12');
INSERT INTO `sys_oss` VALUES ('276', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/11204543661ca4.jpg', '2018-04-08 11:20:46');
INSERT INTO `sys_oss` VALUES ('277', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/11205737862217.jpg', '2018-04-08 11:20:57');
INSERT INTO `sys_oss` VALUES ('278', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/11211163667f82.jpg', '2018-04-08 11:21:12');
INSERT INTO `sys_oss` VALUES ('279', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112120584ef1a0.jpg', '2018-04-08 11:21:21');
INSERT INTO `sys_oss` VALUES ('280', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/11213710b6cb5.jpg', '2018-04-08 11:21:37');
INSERT INTO `sys_oss` VALUES ('281', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/11281736533de7.jpg', '2018-04-08 11:28:17');
INSERT INTO `sys_oss` VALUES ('282', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/112823479d5ef.jpg', '2018-04-08 11:28:23');
INSERT INTO `sys_oss` VALUES ('283', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1130044777a736.jpg', '2018-04-08 11:30:05');
INSERT INTO `sys_oss` VALUES ('284', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/113203415030bb.jpg', '2018-04-08 11:32:04');
INSERT INTO `sys_oss` VALUES ('285', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/11321634594dbf.jpg', '2018-04-08 11:32:16');
INSERT INTO `sys_oss` VALUES ('286', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1132318499ef3b.jpg', '2018-04-08 11:32:32');
INSERT INTO `sys_oss` VALUES ('287', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/113246166ec076.jpg', '2018-04-08 11:32:46');
INSERT INTO `sys_oss` VALUES ('288', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/113300782a91d.jpg', '2018-04-08 11:33:00');
INSERT INTO `sys_oss` VALUES ('289', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/15093747156006.jpg', '2018-04-08 15:09:38');
INSERT INTO `sys_oss` VALUES ('290', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/15094250014cf8.jpg', '2018-04-08 15:09:43');
INSERT INTO `sys_oss` VALUES ('291', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/15094646443739.jpg', '2018-04-08 15:09:47');
INSERT INTO `sys_oss` VALUES ('292', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1509525136cf39.jpg', '2018-04-08 15:09:53');
INSERT INTO `sys_oss` VALUES ('293', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1515451677397.jpg', '2018-04-08 15:15:45');
INSERT INTO `sys_oss` VALUES ('294', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/15154876926aea.jpg', '2018-04-08 15:15:49');
INSERT INTO `sys_oss` VALUES ('295', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/151551526b1b9b.jpg', '2018-04-08 15:15:52');
INSERT INTO `sys_oss` VALUES ('296', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/151555190311de.jpg', '2018-04-08 15:15:56');
INSERT INTO `sys_oss` VALUES ('297', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1516344102f76a.jpg', '2018-04-08 15:16:35');
INSERT INTO `sys_oss` VALUES ('298', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/15163775809a11.jpg', '2018-04-08 15:16:38');
INSERT INTO `sys_oss` VALUES ('299', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/15164169696497.jpg', '2018-04-08 15:16:42');
INSERT INTO `sys_oss` VALUES ('300', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/151644610efea8.jpg', '2018-04-08 15:16:45');
INSERT INTO `sys_oss` VALUES ('301', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/151719851ba2f1.jpg', '2018-04-08 15:17:20');
INSERT INTO `sys_oss` VALUES ('302', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/15172453316372.jpg', '2018-04-08 15:17:25');
INSERT INTO `sys_oss` VALUES ('303', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/15173347324f17.jpg', '2018-04-08 15:17:34');
INSERT INTO `sys_oss` VALUES ('304', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/15173722abb21.jpg', '2018-04-08 15:17:40');
INSERT INTO `sys_oss` VALUES ('305', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/15211763917493.png', '2018-04-08 15:21:18');
INSERT INTO `sys_oss` VALUES ('306', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/152133898478a9.png', '2018-04-08 15:21:34');
INSERT INTO `sys_oss` VALUES ('307', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1522084274efc7.png', '2018-04-08 15:22:09');
INSERT INTO `sys_oss` VALUES ('308', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/152213578561f5.png', '2018-04-08 15:22:14');
INSERT INTO `sys_oss` VALUES ('309', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/15375673764e1.jpg', '2018-04-08 15:37:56');
INSERT INTO `sys_oss` VALUES ('310', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1538082839129.jpg', '2018-04-08 15:38:08');
INSERT INTO `sys_oss` VALUES ('311', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/155928257db976.jpg', '2018-04-08 15:59:28');
INSERT INTO `sys_oss` VALUES ('312', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1602079296a527.jpg', '2018-04-08 16:02:08');
INSERT INTO `sys_oss` VALUES ('313', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1602215592e5b0.jpg', '2018-04-08 16:02:22');
INSERT INTO `sys_oss` VALUES ('314', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/16023464529bb3.jpg', '2018-04-08 16:02:35');
INSERT INTO `sys_oss` VALUES ('315', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/160251985dbddf.jpg', '2018-04-08 16:02:52');
INSERT INTO `sys_oss` VALUES ('316', 'http://p2n8ypmnw.bkt.clouddn.com/20180408/1603055829222f.jpg', '2018-04-08 16:03:06');
INSERT INTO `sys_oss` VALUES ('317', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/135814879aa4ce.jpg', '2018-04-09 13:58:15');
INSERT INTO `sys_oss` VALUES ('318', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1358183574d23e.jpg', '2018-04-09 13:58:18');
INSERT INTO `sys_oss` VALUES ('319', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/145102606256aa.jpg', '2018-04-09 14:51:03');
INSERT INTO `sys_oss` VALUES ('320', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/15033642a2755.jpg', '2018-04-09 15:03:36');
INSERT INTO `sys_oss` VALUES ('321', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/150434322acead.jpg', '2018-04-09 15:04:34');
INSERT INTO `sys_oss` VALUES ('322', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/15051083a2211.jpg', '2018-04-09 15:05:10');
INSERT INTO `sys_oss` VALUES ('323', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/17230721285c9e.png', '2018-04-09 17:23:08');
INSERT INTO `sys_oss` VALUES ('324', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/172311997fa104.png', '2018-04-09 17:23:12');
INSERT INTO `sys_oss` VALUES ('325', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/17231520208252.png', '2018-04-09 17:23:15');
INSERT INTO `sys_oss` VALUES ('326', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/172320285fc561.png', '2018-04-09 17:23:20');
INSERT INTO `sys_oss` VALUES ('327', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1725084907e4bd.png', '2018-04-09 17:25:09');
INSERT INTO `sys_oss` VALUES ('328', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/17251338afedc.png', '2018-04-09 17:25:13');
INSERT INTO `sys_oss` VALUES ('329', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/17251749b2789.png', '2018-04-09 17:25:18');
INSERT INTO `sys_oss` VALUES ('330', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/17252063645c4d.png', '2018-04-09 17:25:21');
INSERT INTO `sys_oss` VALUES ('331', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/172638376b0b74.png', '2018-04-09 17:26:38');
INSERT INTO `sys_oss` VALUES ('332', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1726419335036e.png', '2018-04-09 17:26:42');
INSERT INTO `sys_oss` VALUES ('333', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/172645124de294.png', '2018-04-09 17:26:45');
INSERT INTO `sys_oss` VALUES ('334', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/172647906c5337.png', '2018-04-09 17:26:48');
INSERT INTO `sys_oss` VALUES ('335', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1728173235f9a6.png', '2018-04-09 17:28:17');
INSERT INTO `sys_oss` VALUES ('336', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/172820809d80b3.png', '2018-04-09 17:28:21');
INSERT INTO `sys_oss` VALUES ('337', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1728245507aed3.png', '2018-04-09 17:28:25');
INSERT INTO `sys_oss` VALUES ('338', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/172827853591cf.png', '2018-04-09 17:28:28');
INSERT INTO `sys_oss` VALUES ('339', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/172917924efaeb.png', '2018-04-09 17:29:18');
INSERT INTO `sys_oss` VALUES ('340', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/17292319823617.png', '2018-04-09 17:29:23');
INSERT INTO `sys_oss` VALUES ('341', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/172927102b2456.png', '2018-04-09 17:29:27');
INSERT INTO `sys_oss` VALUES ('342', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/172933781547ac.png', '2018-04-09 17:29:34');
INSERT INTO `sys_oss` VALUES ('343', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/172942681acb9c.png', '2018-04-09 17:29:43');
INSERT INTO `sys_oss` VALUES ('344', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1730146610222e.png', '2018-04-09 17:30:15');
INSERT INTO `sys_oss` VALUES ('345', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/17301770574dbc.png', '2018-04-09 17:30:18');
INSERT INTO `sys_oss` VALUES ('346', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/173023748e90e8.png', '2018-04-09 17:30:24');
INSERT INTO `sys_oss` VALUES ('347', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1730271045c78.png', '2018-04-09 17:30:27');
INSERT INTO `sys_oss` VALUES ('348', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/17335111679e88.png', '2018-04-09 17:33:51');
INSERT INTO `sys_oss` VALUES ('349', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1735114539c02b.png', '2018-04-09 17:35:12');
INSERT INTO `sys_oss` VALUES ('350', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/173526685b7095.png', '2018-04-09 17:35:27');
INSERT INTO `sys_oss` VALUES ('351', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/17353153585723.png', '2018-04-09 17:35:32');
INSERT INTO `sys_oss` VALUES ('352', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/17394836197d8.jpg', '2018-04-09 17:39:48');
INSERT INTO `sys_oss` VALUES ('353', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/173950508d2ce2.jpg', '2018-04-09 17:39:51');
INSERT INTO `sys_oss` VALUES ('354', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1741113751a2df.jpg', '2018-04-09 17:41:11');
INSERT INTO `sys_oss` VALUES ('355', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/174407230763db.jpg', '2018-04-09 17:44:07');
INSERT INTO `sys_oss` VALUES ('356', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1744142767f750.jpg', '2018-04-09 17:44:14');
INSERT INTO `sys_oss` VALUES ('357', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1745278110c624.jpg', '2018-04-09 17:45:28');
INSERT INTO `sys_oss` VALUES ('358', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/174532536a1ad9.jpg', '2018-04-09 17:45:33');
INSERT INTO `sys_oss` VALUES ('359', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/174656316dec5b.jpg', '2018-04-09 17:46:57');
INSERT INTO `sys_oss` VALUES ('360', 'http://p2n8ypmnw.bkt.clouddn.com/20180409/1746597983c788.jpg', '2018-04-09 17:47:00');
INSERT INTO `sys_oss` VALUES ('361', 'http://p2n8ypmnw.bkt.clouddn.com/20180419/1238424184099a.png', '2018-04-19 12:38:44');
INSERT INTO `sys_oss` VALUES ('362', 'http://p2n8ypmnw.bkt.clouddn.com/20180419/12391296afa2a.png', '2018-04-19 12:39:12');
INSERT INTO `sys_oss` VALUES ('363', 'http://p2n8ypmnw.bkt.clouddn.com/20180419/1258272537f17b.png', '2018-04-19 12:58:29');

-- ----------------------------
-- Table structure for sys_region
-- ----------------------------
DROP TABLE IF EXISTS `sys_region`;
CREATE TABLE `sys_region` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `parent_id` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(120) COLLATE utf8_bin NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '2',
  `agency_id` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `agency_id` (`agency_id`),
  KEY `parent_id` (`parent_id`),
  KEY `region_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sys_region
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('5', '超级管理员', '超级管理员', '1', '2017-09-18 00:40:15', '1');
INSERT INTO `sys_role` VALUES ('6', 'tyjsyf001大队长', '移动', '1', '2018-01-26 10:45:37', '5');
INSERT INTO `sys_role` VALUES ('7', '客服经理', '移动', '1', '2018-01-28 15:39:37', '7');
INSERT INTO `sys_role` VALUES ('8', '移动顶级部门', '移动', '1', '2018-01-28 16:17:09', '5');
INSERT INTO `sys_role` VALUES ('9', '移动下de用户', '移动下de用户', '1', '2018-01-28 16:25:22', '10');
INSERT INTO `sys_role` VALUES ('10', '移动酱油', '酱油', '1', '2018-04-08 15:39:56', '11');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='角色与部门对应关系';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('16', '7', '6');
INSERT INTO `sys_role_dept` VALUES ('26', '9', '10');
INSERT INTO `sys_role_dept` VALUES ('27', '8', '5');
INSERT INTO `sys_role_dept` VALUES ('38', '10', '5');
INSERT INTO `sys_role_dept` VALUES ('39', '10', '6');
INSERT INTO `sys_role_dept` VALUES ('40', '10', '7');
INSERT INTO `sys_role_dept` VALUES ('41', '10', '10');
INSERT INTO `sys_role_dept` VALUES ('42', '10', '11');
INSERT INTO `sys_role_dept` VALUES ('43', '6', '5');
INSERT INTO `sys_role_dept` VALUES ('44', '6', '6');
INSERT INTO `sys_role_dept` VALUES ('45', '6', '7');
INSERT INTO `sys_role_dept` VALUES ('46', '6', '10');
INSERT INTO `sys_role_dept` VALUES ('47', '6', '11');
INSERT INTO `sys_role_dept` VALUES ('48', '5', '1');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3134 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1077', '7', '375');
INSERT INTO `sys_role_menu` VALUES ('1078', '7', '376');
INSERT INTO `sys_role_menu` VALUES ('1079', '7', '377');
INSERT INTO `sys_role_menu` VALUES ('1080', '7', '378');
INSERT INTO `sys_role_menu` VALUES ('1081', '7', '200');
INSERT INTO `sys_role_menu` VALUES ('1082', '7', '207');
INSERT INTO `sys_role_menu` VALUES ('1083', '7', '208');
INSERT INTO `sys_role_menu` VALUES ('1084', '7', '209');
INSERT INTO `sys_role_menu` VALUES ('1085', '7', '210');
INSERT INTO `sys_role_menu` VALUES ('1086', '7', '211');
INSERT INTO `sys_role_menu` VALUES ('1087', '7', '201');
INSERT INTO `sys_role_menu` VALUES ('1088', '7', '202');
INSERT INTO `sys_role_menu` VALUES ('1089', '7', '203');
INSERT INTO `sys_role_menu` VALUES ('1090', '7', '204');
INSERT INTO `sys_role_menu` VALUES ('1091', '7', '205');
INSERT INTO `sys_role_menu` VALUES ('1092', '7', '249');
INSERT INTO `sys_role_menu` VALUES ('1093', '7', '250');
INSERT INTO `sys_role_menu` VALUES ('1094', '7', '251');
INSERT INTO `sys_role_menu` VALUES ('1095', '7', '252');
INSERT INTO `sys_role_menu` VALUES ('1096', '7', '253');
INSERT INTO `sys_role_menu` VALUES ('1097', '7', '264');
INSERT INTO `sys_role_menu` VALUES ('1098', '7', '265');
INSERT INTO `sys_role_menu` VALUES ('1099', '7', '266');
INSERT INTO `sys_role_menu` VALUES ('1100', '7', '280');
INSERT INTO `sys_role_menu` VALUES ('1101', '7', '281');
INSERT INTO `sys_role_menu` VALUES ('1102', '7', '282');
INSERT INTO `sys_role_menu` VALUES ('1103', '7', '283');
INSERT INTO `sys_role_menu` VALUES ('1104', '7', '284');
INSERT INTO `sys_role_menu` VALUES ('1105', '7', '285');
INSERT INTO `sys_role_menu` VALUES ('1106', '7', '286');
INSERT INTO `sys_role_menu` VALUES ('1107', '7', '287');
INSERT INTO `sys_role_menu` VALUES ('1108', '7', '288');
INSERT INTO `sys_role_menu` VALUES ('1109', '7', '212');
INSERT INTO `sys_role_menu` VALUES ('1110', '7', '213');
INSERT INTO `sys_role_menu` VALUES ('1111', '7', '214');
INSERT INTO `sys_role_menu` VALUES ('1112', '7', '215');
INSERT INTO `sys_role_menu` VALUES ('1113', '7', '216');
INSERT INTO `sys_role_menu` VALUES ('1114', '7', '222');
INSERT INTO `sys_role_menu` VALUES ('1115', '7', '223');
INSERT INTO `sys_role_menu` VALUES ('1116', '7', '224');
INSERT INTO `sys_role_menu` VALUES ('1117', '7', '225');
INSERT INTO `sys_role_menu` VALUES ('1118', '7', '226');
INSERT INTO `sys_role_menu` VALUES ('1119', '7', '227');
INSERT INTO `sys_role_menu` VALUES ('1120', '7', '259');
INSERT INTO `sys_role_menu` VALUES ('1121', '7', '260');
INSERT INTO `sys_role_menu` VALUES ('1122', '7', '261');
INSERT INTO `sys_role_menu` VALUES ('1123', '7', '262');
INSERT INTO `sys_role_menu` VALUES ('1124', '7', '263');
INSERT INTO `sys_role_menu` VALUES ('1125', '7', '307');
INSERT INTO `sys_role_menu` VALUES ('1126', '7', '308');
INSERT INTO `sys_role_menu` VALUES ('1127', '7', '309');
INSERT INTO `sys_role_menu` VALUES ('1128', '7', '310');
INSERT INTO `sys_role_menu` VALUES ('1129', '7', '311');
INSERT INTO `sys_role_menu` VALUES ('1130', '7', '297');
INSERT INTO `sys_role_menu` VALUES ('1131', '7', '298');
INSERT INTO `sys_role_menu` VALUES ('1132', '7', '299');
INSERT INTO `sys_role_menu` VALUES ('1133', '7', '300');
INSERT INTO `sys_role_menu` VALUES ('1134', '7', '301');
INSERT INTO `sys_role_menu` VALUES ('1135', '7', '254');
INSERT INTO `sys_role_menu` VALUES ('1136', '7', '256');
INSERT INTO `sys_role_menu` VALUES ('1137', '7', '257');
INSERT INTO `sys_role_menu` VALUES ('1138', '7', '258');
INSERT INTO `sys_role_menu` VALUES ('1139', '7', '255');
INSERT INTO `sys_role_menu` VALUES ('1140', '7', '315');
INSERT INTO `sys_role_menu` VALUES ('1141', '7', '316');
INSERT INTO `sys_role_menu` VALUES ('1142', '7', '317');
INSERT INTO `sys_role_menu` VALUES ('1143', '7', '318');
INSERT INTO `sys_role_menu` VALUES ('1144', '7', '319');
INSERT INTO `sys_role_menu` VALUES ('1145', '7', '325');
INSERT INTO `sys_role_menu` VALUES ('1146', '7', '326');
INSERT INTO `sys_role_menu` VALUES ('1147', '7', '327');
INSERT INTO `sys_role_menu` VALUES ('1148', '7', '328');
INSERT INTO `sys_role_menu` VALUES ('1149', '7', '329');
INSERT INTO `sys_role_menu` VALUES ('1150', '7', '331');
INSERT INTO `sys_role_menu` VALUES ('1151', '7', '332');
INSERT INTO `sys_role_menu` VALUES ('1152', '7', '333');
INSERT INTO `sys_role_menu` VALUES ('1153', '7', '334');
INSERT INTO `sys_role_menu` VALUES ('1154', '7', '335');
INSERT INTO `sys_role_menu` VALUES ('1155', '7', '357');
INSERT INTO `sys_role_menu` VALUES ('1156', '7', '289');
INSERT INTO `sys_role_menu` VALUES ('1157', '7', '290');
INSERT INTO `sys_role_menu` VALUES ('1158', '7', '291');
INSERT INTO `sys_role_menu` VALUES ('1159', '7', '292');
INSERT INTO `sys_role_menu` VALUES ('1160', '7', '293');
INSERT INTO `sys_role_menu` VALUES ('1161', '7', '352');
INSERT INTO `sys_role_menu` VALUES ('1162', '7', '353');
INSERT INTO `sys_role_menu` VALUES ('1163', '7', '354');
INSERT INTO `sys_role_menu` VALUES ('1164', '7', '355');
INSERT INTO `sys_role_menu` VALUES ('1165', '7', '356');
INSERT INTO `sys_role_menu` VALUES ('1166', '7', '342');
INSERT INTO `sys_role_menu` VALUES ('1167', '7', '343');
INSERT INTO `sys_role_menu` VALUES ('1168', '7', '344');
INSERT INTO `sys_role_menu` VALUES ('1169', '7', '345');
INSERT INTO `sys_role_menu` VALUES ('1170', '7', '346');
INSERT INTO `sys_role_menu` VALUES ('1171', '7', '347');
INSERT INTO `sys_role_menu` VALUES ('1172', '7', '348');
INSERT INTO `sys_role_menu` VALUES ('1173', '7', '349');
INSERT INTO `sys_role_menu` VALUES ('1174', '7', '350');
INSERT INTO `sys_role_menu` VALUES ('1175', '7', '351');
INSERT INTO `sys_role_menu` VALUES ('1176', '7', '361');
INSERT INTO `sys_role_menu` VALUES ('1177', '7', '362');
INSERT INTO `sys_role_menu` VALUES ('1178', '7', '363');
INSERT INTO `sys_role_menu` VALUES ('1179', '7', '364');
INSERT INTO `sys_role_menu` VALUES ('1180', '7', '365');
INSERT INTO `sys_role_menu` VALUES ('1181', '7', '336');
INSERT INTO `sys_role_menu` VALUES ('1182', '7', '341');
INSERT INTO `sys_role_menu` VALUES ('1183', '7', '337');
INSERT INTO `sys_role_menu` VALUES ('1184', '7', '338');
INSERT INTO `sys_role_menu` VALUES ('1185', '7', '339');
INSERT INTO `sys_role_menu` VALUES ('1186', '7', '340');
INSERT INTO `sys_role_menu` VALUES ('1187', '7', '358');
INSERT INTO `sys_role_menu` VALUES ('1188', '7', '359');
INSERT INTO `sys_role_menu` VALUES ('1189', '7', '374');
INSERT INTO `sys_role_menu` VALUES ('1190', '7', '294');
INSERT INTO `sys_role_menu` VALUES ('1191', '7', '360');
INSERT INTO `sys_role_menu` VALUES ('1192', '7', '295');
INSERT INTO `sys_role_menu` VALUES ('1193', '7', '296');
INSERT INTO `sys_role_menu` VALUES ('1194', '7', '243');
INSERT INTO `sys_role_menu` VALUES ('1195', '7', '238');
INSERT INTO `sys_role_menu` VALUES ('1196', '7', '239');
INSERT INTO `sys_role_menu` VALUES ('1197', '7', '240');
INSERT INTO `sys_role_menu` VALUES ('1198', '7', '241');
INSERT INTO `sys_role_menu` VALUES ('1199', '7', '242');
INSERT INTO `sys_role_menu` VALUES ('1200', '7', '233');
INSERT INTO `sys_role_menu` VALUES ('1201', '7', '234');
INSERT INTO `sys_role_menu` VALUES ('1202', '7', '235');
INSERT INTO `sys_role_menu` VALUES ('1203', '7', '236');
INSERT INTO `sys_role_menu` VALUES ('1204', '7', '237');
INSERT INTO `sys_role_menu` VALUES ('1205', '7', '244');
INSERT INTO `sys_role_menu` VALUES ('1206', '7', '330');
INSERT INTO `sys_role_menu` VALUES ('1207', '7', '245');
INSERT INTO `sys_role_menu` VALUES ('1208', '7', '246');
INSERT INTO `sys_role_menu` VALUES ('1209', '7', '247');
INSERT INTO `sys_role_menu` VALUES ('1210', '7', '248');
INSERT INTO `sys_role_menu` VALUES ('1211', '7', '275');
INSERT INTO `sys_role_menu` VALUES ('1212', '7', '276');
INSERT INTO `sys_role_menu` VALUES ('1213', '7', '277');
INSERT INTO `sys_role_menu` VALUES ('1214', '7', '278');
INSERT INTO `sys_role_menu` VALUES ('1215', '7', '279');
INSERT INTO `sys_role_menu` VALUES ('1216', '7', '270');
INSERT INTO `sys_role_menu` VALUES ('1217', '7', '271');
INSERT INTO `sys_role_menu` VALUES ('1218', '7', '272');
INSERT INTO `sys_role_menu` VALUES ('1219', '7', '273');
INSERT INTO `sys_role_menu` VALUES ('1220', '7', '274');
INSERT INTO `sys_role_menu` VALUES ('1221', '7', '366');
INSERT INTO `sys_role_menu` VALUES ('1222', '7', '380');
INSERT INTO `sys_role_menu` VALUES ('1223', '7', '381');
INSERT INTO `sys_role_menu` VALUES ('1224', '7', '382');
INSERT INTO `sys_role_menu` VALUES ('1225', '7', '383');
INSERT INTO `sys_role_menu` VALUES ('1226', '7', '384');
INSERT INTO `sys_role_menu` VALUES ('1227', '7', '386');
INSERT INTO `sys_role_menu` VALUES ('1228', '7', '387');
INSERT INTO `sys_role_menu` VALUES ('1229', '7', '388');
INSERT INTO `sys_role_menu` VALUES ('1230', '7', '389');
INSERT INTO `sys_role_menu` VALUES ('1231', '7', '390');
INSERT INTO `sys_role_menu` VALUES ('1232', '7', '385');
INSERT INTO `sys_role_menu` VALUES ('1233', '7', '391');
INSERT INTO `sys_role_menu` VALUES ('1234', '7', '392');
INSERT INTO `sys_role_menu` VALUES ('1235', '7', '393');
INSERT INTO `sys_role_menu` VALUES ('1236', '7', '394');
INSERT INTO `sys_role_menu` VALUES ('1237', '7', '1');
INSERT INTO `sys_role_menu` VALUES ('1238', '7', '2');
INSERT INTO `sys_role_menu` VALUES ('1239', '7', '15');
INSERT INTO `sys_role_menu` VALUES ('1240', '7', '16');
INSERT INTO `sys_role_menu` VALUES ('1241', '7', '17');
INSERT INTO `sys_role_menu` VALUES ('1242', '7', '18');
INSERT INTO `sys_role_menu` VALUES ('1243', '7', '3');
INSERT INTO `sys_role_menu` VALUES ('1244', '7', '19');
INSERT INTO `sys_role_menu` VALUES ('1245', '7', '20');
INSERT INTO `sys_role_menu` VALUES ('1246', '7', '21');
INSERT INTO `sys_role_menu` VALUES ('1247', '7', '22');
INSERT INTO `sys_role_menu` VALUES ('1248', '7', '368');
INSERT INTO `sys_role_menu` VALUES ('1249', '7', '369');
INSERT INTO `sys_role_menu` VALUES ('1250', '7', '370');
INSERT INTO `sys_role_menu` VALUES ('1251', '7', '371');
INSERT INTO `sys_role_menu` VALUES ('1252', '7', '372');
INSERT INTO `sys_role_menu` VALUES ('1253', '7', '373');
INSERT INTO `sys_role_menu` VALUES ('1254', '7', '4');
INSERT INTO `sys_role_menu` VALUES ('1255', '7', '23');
INSERT INTO `sys_role_menu` VALUES ('1256', '7', '24');
INSERT INTO `sys_role_menu` VALUES ('1257', '7', '25');
INSERT INTO `sys_role_menu` VALUES ('1258', '7', '26');
INSERT INTO `sys_role_menu` VALUES ('1259', '7', '6');
INSERT INTO `sys_role_menu` VALUES ('1260', '7', '7');
INSERT INTO `sys_role_menu` VALUES ('1261', '7', '8');
INSERT INTO `sys_role_menu` VALUES ('1262', '7', '9');
INSERT INTO `sys_role_menu` VALUES ('1263', '7', '10');
INSERT INTO `sys_role_menu` VALUES ('1264', '7', '11');
INSERT INTO `sys_role_menu` VALUES ('1265', '7', '12');
INSERT INTO `sys_role_menu` VALUES ('1266', '7', '13');
INSERT INTO `sys_role_menu` VALUES ('1267', '7', '14');
INSERT INTO `sys_role_menu` VALUES ('1268', '7', '30');
INSERT INTO `sys_role_menu` VALUES ('1269', '7', '302');
INSERT INTO `sys_role_menu` VALUES ('1270', '7', '303');
INSERT INTO `sys_role_menu` VALUES ('1271', '7', '304');
INSERT INTO `sys_role_menu` VALUES ('1272', '7', '305');
INSERT INTO `sys_role_menu` VALUES ('1273', '7', '306');
INSERT INTO `sys_role_menu` VALUES ('1274', '7', '27');
INSERT INTO `sys_role_menu` VALUES ('1275', '7', '29');
INSERT INTO `sys_role_menu` VALUES ('1276', '7', '379');
INSERT INTO `sys_role_menu` VALUES ('1277', '7', '5');
INSERT INTO `sys_role_menu` VALUES ('1278', '7', '28');
INSERT INTO `sys_role_menu` VALUES ('2143', '9', '375');
INSERT INTO `sys_role_menu` VALUES ('2144', '9', '376');
INSERT INTO `sys_role_menu` VALUES ('2145', '9', '377');
INSERT INTO `sys_role_menu` VALUES ('2146', '9', '378');
INSERT INTO `sys_role_menu` VALUES ('2147', '9', '200');
INSERT INTO `sys_role_menu` VALUES ('2148', '9', '207');
INSERT INTO `sys_role_menu` VALUES ('2149', '9', '208');
INSERT INTO `sys_role_menu` VALUES ('2150', '9', '209');
INSERT INTO `sys_role_menu` VALUES ('2151', '9', '210');
INSERT INTO `sys_role_menu` VALUES ('2152', '9', '211');
INSERT INTO `sys_role_menu` VALUES ('2153', '9', '201');
INSERT INTO `sys_role_menu` VALUES ('2154', '9', '202');
INSERT INTO `sys_role_menu` VALUES ('2155', '9', '203');
INSERT INTO `sys_role_menu` VALUES ('2156', '9', '204');
INSERT INTO `sys_role_menu` VALUES ('2157', '9', '205');
INSERT INTO `sys_role_menu` VALUES ('2158', '9', '249');
INSERT INTO `sys_role_menu` VALUES ('2159', '9', '250');
INSERT INTO `sys_role_menu` VALUES ('2160', '9', '251');
INSERT INTO `sys_role_menu` VALUES ('2161', '9', '252');
INSERT INTO `sys_role_menu` VALUES ('2162', '9', '253');
INSERT INTO `sys_role_menu` VALUES ('2163', '9', '264');
INSERT INTO `sys_role_menu` VALUES ('2164', '9', '265');
INSERT INTO `sys_role_menu` VALUES ('2165', '9', '266');
INSERT INTO `sys_role_menu` VALUES ('2166', '9', '280');
INSERT INTO `sys_role_menu` VALUES ('2167', '9', '281');
INSERT INTO `sys_role_menu` VALUES ('2168', '9', '282');
INSERT INTO `sys_role_menu` VALUES ('2169', '9', '283');
INSERT INTO `sys_role_menu` VALUES ('2170', '9', '284');
INSERT INTO `sys_role_menu` VALUES ('2171', '9', '285');
INSERT INTO `sys_role_menu` VALUES ('2172', '9', '286');
INSERT INTO `sys_role_menu` VALUES ('2173', '9', '287');
INSERT INTO `sys_role_menu` VALUES ('2174', '9', '288');
INSERT INTO `sys_role_menu` VALUES ('2175', '9', '212');
INSERT INTO `sys_role_menu` VALUES ('2176', '9', '213');
INSERT INTO `sys_role_menu` VALUES ('2177', '9', '214');
INSERT INTO `sys_role_menu` VALUES ('2178', '9', '215');
INSERT INTO `sys_role_menu` VALUES ('2179', '9', '216');
INSERT INTO `sys_role_menu` VALUES ('2180', '9', '357');
INSERT INTO `sys_role_menu` VALUES ('2181', '9', '289');
INSERT INTO `sys_role_menu` VALUES ('2182', '9', '290');
INSERT INTO `sys_role_menu` VALUES ('2183', '9', '291');
INSERT INTO `sys_role_menu` VALUES ('2184', '9', '292');
INSERT INTO `sys_role_menu` VALUES ('2185', '9', '293');
INSERT INTO `sys_role_menu` VALUES ('2186', '9', '352');
INSERT INTO `sys_role_menu` VALUES ('2187', '9', '353');
INSERT INTO `sys_role_menu` VALUES ('2188', '9', '354');
INSERT INTO `sys_role_menu` VALUES ('2189', '9', '355');
INSERT INTO `sys_role_menu` VALUES ('2190', '9', '356');
INSERT INTO `sys_role_menu` VALUES ('2191', '9', '342');
INSERT INTO `sys_role_menu` VALUES ('2192', '9', '343');
INSERT INTO `sys_role_menu` VALUES ('2193', '9', '344');
INSERT INTO `sys_role_menu` VALUES ('2194', '9', '345');
INSERT INTO `sys_role_menu` VALUES ('2195', '9', '346');
INSERT INTO `sys_role_menu` VALUES ('2196', '9', '347');
INSERT INTO `sys_role_menu` VALUES ('2197', '9', '348');
INSERT INTO `sys_role_menu` VALUES ('2198', '9', '349');
INSERT INTO `sys_role_menu` VALUES ('2199', '9', '350');
INSERT INTO `sys_role_menu` VALUES ('2200', '9', '351');
INSERT INTO `sys_role_menu` VALUES ('2201', '9', '361');
INSERT INTO `sys_role_menu` VALUES ('2202', '9', '362');
INSERT INTO `sys_role_menu` VALUES ('2203', '9', '363');
INSERT INTO `sys_role_menu` VALUES ('2204', '9', '364');
INSERT INTO `sys_role_menu` VALUES ('2205', '9', '365');
INSERT INTO `sys_role_menu` VALUES ('2206', '9', '336');
INSERT INTO `sys_role_menu` VALUES ('2207', '9', '341');
INSERT INTO `sys_role_menu` VALUES ('2208', '9', '337');
INSERT INTO `sys_role_menu` VALUES ('2209', '9', '338');
INSERT INTO `sys_role_menu` VALUES ('2210', '9', '339');
INSERT INTO `sys_role_menu` VALUES ('2211', '9', '340');
INSERT INTO `sys_role_menu` VALUES ('2212', '9', '358');
INSERT INTO `sys_role_menu` VALUES ('2213', '9', '359');
INSERT INTO `sys_role_menu` VALUES ('2214', '9', '374');
INSERT INTO `sys_role_menu` VALUES ('2215', '9', '294');
INSERT INTO `sys_role_menu` VALUES ('2216', '9', '360');
INSERT INTO `sys_role_menu` VALUES ('2217', '9', '295');
INSERT INTO `sys_role_menu` VALUES ('2218', '9', '296');
INSERT INTO `sys_role_menu` VALUES ('2219', '9', '366');
INSERT INTO `sys_role_menu` VALUES ('2220', '9', '380');
INSERT INTO `sys_role_menu` VALUES ('2221', '9', '381');
INSERT INTO `sys_role_menu` VALUES ('2222', '9', '382');
INSERT INTO `sys_role_menu` VALUES ('2223', '9', '383');
INSERT INTO `sys_role_menu` VALUES ('2224', '9', '384');
INSERT INTO `sys_role_menu` VALUES ('2225', '9', '386');
INSERT INTO `sys_role_menu` VALUES ('2226', '9', '387');
INSERT INTO `sys_role_menu` VALUES ('2227', '9', '388');
INSERT INTO `sys_role_menu` VALUES ('2228', '9', '389');
INSERT INTO `sys_role_menu` VALUES ('2229', '9', '390');
INSERT INTO `sys_role_menu` VALUES ('2230', '9', '385');
INSERT INTO `sys_role_menu` VALUES ('2231', '9', '391');
INSERT INTO `sys_role_menu` VALUES ('2232', '9', '392');
INSERT INTO `sys_role_menu` VALUES ('2233', '9', '393');
INSERT INTO `sys_role_menu` VALUES ('2234', '9', '394');
INSERT INTO `sys_role_menu` VALUES ('2235', '8', '200');
INSERT INTO `sys_role_menu` VALUES ('2236', '8', '207');
INSERT INTO `sys_role_menu` VALUES ('2237', '8', '208');
INSERT INTO `sys_role_menu` VALUES ('2238', '8', '209');
INSERT INTO `sys_role_menu` VALUES ('2239', '8', '210');
INSERT INTO `sys_role_menu` VALUES ('2240', '8', '211');
INSERT INTO `sys_role_menu` VALUES ('2241', '8', '201');
INSERT INTO `sys_role_menu` VALUES ('2242', '8', '202');
INSERT INTO `sys_role_menu` VALUES ('2243', '8', '203');
INSERT INTO `sys_role_menu` VALUES ('2244', '8', '204');
INSERT INTO `sys_role_menu` VALUES ('2245', '8', '205');
INSERT INTO `sys_role_menu` VALUES ('2246', '8', '249');
INSERT INTO `sys_role_menu` VALUES ('2247', '8', '250');
INSERT INTO `sys_role_menu` VALUES ('2248', '8', '251');
INSERT INTO `sys_role_menu` VALUES ('2249', '8', '252');
INSERT INTO `sys_role_menu` VALUES ('2250', '8', '253');
INSERT INTO `sys_role_menu` VALUES ('2251', '8', '264');
INSERT INTO `sys_role_menu` VALUES ('2252', '8', '265');
INSERT INTO `sys_role_menu` VALUES ('2253', '8', '266');
INSERT INTO `sys_role_menu` VALUES ('2254', '8', '280');
INSERT INTO `sys_role_menu` VALUES ('2255', '8', '281');
INSERT INTO `sys_role_menu` VALUES ('2256', '8', '282');
INSERT INTO `sys_role_menu` VALUES ('2257', '8', '283');
INSERT INTO `sys_role_menu` VALUES ('2258', '8', '284');
INSERT INTO `sys_role_menu` VALUES ('2259', '8', '285');
INSERT INTO `sys_role_menu` VALUES ('2260', '8', '286');
INSERT INTO `sys_role_menu` VALUES ('2261', '8', '287');
INSERT INTO `sys_role_menu` VALUES ('2262', '8', '288');
INSERT INTO `sys_role_menu` VALUES ('2263', '8', '212');
INSERT INTO `sys_role_menu` VALUES ('2264', '8', '213');
INSERT INTO `sys_role_menu` VALUES ('2265', '8', '214');
INSERT INTO `sys_role_menu` VALUES ('2266', '8', '215');
INSERT INTO `sys_role_menu` VALUES ('2267', '8', '216');
INSERT INTO `sys_role_menu` VALUES ('2268', '8', '357');
INSERT INTO `sys_role_menu` VALUES ('2269', '8', '289');
INSERT INTO `sys_role_menu` VALUES ('2270', '8', '290');
INSERT INTO `sys_role_menu` VALUES ('2271', '8', '291');
INSERT INTO `sys_role_menu` VALUES ('2272', '8', '292');
INSERT INTO `sys_role_menu` VALUES ('2273', '8', '293');
INSERT INTO `sys_role_menu` VALUES ('2274', '8', '352');
INSERT INTO `sys_role_menu` VALUES ('2275', '8', '353');
INSERT INTO `sys_role_menu` VALUES ('2276', '8', '354');
INSERT INTO `sys_role_menu` VALUES ('2277', '8', '355');
INSERT INTO `sys_role_menu` VALUES ('2278', '8', '356');
INSERT INTO `sys_role_menu` VALUES ('2279', '8', '342');
INSERT INTO `sys_role_menu` VALUES ('2280', '8', '343');
INSERT INTO `sys_role_menu` VALUES ('2281', '8', '344');
INSERT INTO `sys_role_menu` VALUES ('2282', '8', '345');
INSERT INTO `sys_role_menu` VALUES ('2283', '8', '346');
INSERT INTO `sys_role_menu` VALUES ('2284', '8', '347');
INSERT INTO `sys_role_menu` VALUES ('2285', '8', '348');
INSERT INTO `sys_role_menu` VALUES ('2286', '8', '349');
INSERT INTO `sys_role_menu` VALUES ('2287', '8', '350');
INSERT INTO `sys_role_menu` VALUES ('2288', '8', '351');
INSERT INTO `sys_role_menu` VALUES ('2289', '8', '361');
INSERT INTO `sys_role_menu` VALUES ('2290', '8', '362');
INSERT INTO `sys_role_menu` VALUES ('2291', '8', '363');
INSERT INTO `sys_role_menu` VALUES ('2292', '8', '364');
INSERT INTO `sys_role_menu` VALUES ('2293', '8', '365');
INSERT INTO `sys_role_menu` VALUES ('2294', '8', '336');
INSERT INTO `sys_role_menu` VALUES ('2295', '8', '341');
INSERT INTO `sys_role_menu` VALUES ('2296', '8', '337');
INSERT INTO `sys_role_menu` VALUES ('2297', '8', '338');
INSERT INTO `sys_role_menu` VALUES ('2298', '8', '339');
INSERT INTO `sys_role_menu` VALUES ('2299', '8', '340');
INSERT INTO `sys_role_menu` VALUES ('2300', '8', '358');
INSERT INTO `sys_role_menu` VALUES ('2301', '8', '359');
INSERT INTO `sys_role_menu` VALUES ('2302', '8', '374');
INSERT INTO `sys_role_menu` VALUES ('2303', '8', '294');
INSERT INTO `sys_role_menu` VALUES ('2304', '8', '360');
INSERT INTO `sys_role_menu` VALUES ('2305', '8', '295');
INSERT INTO `sys_role_menu` VALUES ('2306', '8', '296');
INSERT INTO `sys_role_menu` VALUES ('2307', '8', '366');
INSERT INTO `sys_role_menu` VALUES ('2308', '8', '380');
INSERT INTO `sys_role_menu` VALUES ('2309', '8', '381');
INSERT INTO `sys_role_menu` VALUES ('2310', '8', '382');
INSERT INTO `sys_role_menu` VALUES ('2311', '8', '383');
INSERT INTO `sys_role_menu` VALUES ('2312', '8', '384');
INSERT INTO `sys_role_menu` VALUES ('2313', '8', '386');
INSERT INTO `sys_role_menu` VALUES ('2314', '8', '387');
INSERT INTO `sys_role_menu` VALUES ('2315', '8', '388');
INSERT INTO `sys_role_menu` VALUES ('2316', '8', '389');
INSERT INTO `sys_role_menu` VALUES ('2317', '8', '390');
INSERT INTO `sys_role_menu` VALUES ('2318', '8', '385');
INSERT INTO `sys_role_menu` VALUES ('2319', '8', '391');
INSERT INTO `sys_role_menu` VALUES ('2320', '8', '392');
INSERT INTO `sys_role_menu` VALUES ('2321', '8', '393');
INSERT INTO `sys_role_menu` VALUES ('2322', '8', '394');
INSERT INTO `sys_role_menu` VALUES ('2535', '10', '375');
INSERT INTO `sys_role_menu` VALUES ('2536', '10', '376');
INSERT INTO `sys_role_menu` VALUES ('2537', '10', '377');
INSERT INTO `sys_role_menu` VALUES ('2538', '10', '378');
INSERT INTO `sys_role_menu` VALUES ('2539', '10', '200');
INSERT INTO `sys_role_menu` VALUES ('2540', '10', '207');
INSERT INTO `sys_role_menu` VALUES ('2541', '10', '208');
INSERT INTO `sys_role_menu` VALUES ('2542', '10', '209');
INSERT INTO `sys_role_menu` VALUES ('2543', '10', '210');
INSERT INTO `sys_role_menu` VALUES ('2544', '10', '211');
INSERT INTO `sys_role_menu` VALUES ('2545', '10', '201');
INSERT INTO `sys_role_menu` VALUES ('2546', '10', '202');
INSERT INTO `sys_role_menu` VALUES ('2547', '10', '203');
INSERT INTO `sys_role_menu` VALUES ('2548', '10', '204');
INSERT INTO `sys_role_menu` VALUES ('2549', '10', '205');
INSERT INTO `sys_role_menu` VALUES ('2550', '10', '249');
INSERT INTO `sys_role_menu` VALUES ('2551', '10', '250');
INSERT INTO `sys_role_menu` VALUES ('2552', '10', '251');
INSERT INTO `sys_role_menu` VALUES ('2553', '10', '252');
INSERT INTO `sys_role_menu` VALUES ('2554', '10', '253');
INSERT INTO `sys_role_menu` VALUES ('2555', '10', '264');
INSERT INTO `sys_role_menu` VALUES ('2556', '10', '265');
INSERT INTO `sys_role_menu` VALUES ('2557', '10', '266');
INSERT INTO `sys_role_menu` VALUES ('2558', '10', '280');
INSERT INTO `sys_role_menu` VALUES ('2559', '10', '281');
INSERT INTO `sys_role_menu` VALUES ('2560', '10', '282');
INSERT INTO `sys_role_menu` VALUES ('2561', '10', '283');
INSERT INTO `sys_role_menu` VALUES ('2562', '10', '284');
INSERT INTO `sys_role_menu` VALUES ('2563', '10', '285');
INSERT INTO `sys_role_menu` VALUES ('2564', '10', '286');
INSERT INTO `sys_role_menu` VALUES ('2565', '10', '287');
INSERT INTO `sys_role_menu` VALUES ('2566', '10', '288');
INSERT INTO `sys_role_menu` VALUES ('2567', '10', '212');
INSERT INTO `sys_role_menu` VALUES ('2568', '10', '213');
INSERT INTO `sys_role_menu` VALUES ('2569', '10', '214');
INSERT INTO `sys_role_menu` VALUES ('2570', '10', '215');
INSERT INTO `sys_role_menu` VALUES ('2571', '10', '216');
INSERT INTO `sys_role_menu` VALUES ('2572', '10', '222');
INSERT INTO `sys_role_menu` VALUES ('2573', '10', '223');
INSERT INTO `sys_role_menu` VALUES ('2574', '10', '224');
INSERT INTO `sys_role_menu` VALUES ('2575', '10', '225');
INSERT INTO `sys_role_menu` VALUES ('2576', '10', '226');
INSERT INTO `sys_role_menu` VALUES ('2577', '10', '227');
INSERT INTO `sys_role_menu` VALUES ('2578', '10', '259');
INSERT INTO `sys_role_menu` VALUES ('2579', '10', '260');
INSERT INTO `sys_role_menu` VALUES ('2580', '10', '261');
INSERT INTO `sys_role_menu` VALUES ('2581', '10', '262');
INSERT INTO `sys_role_menu` VALUES ('2582', '10', '263');
INSERT INTO `sys_role_menu` VALUES ('2583', '10', '307');
INSERT INTO `sys_role_menu` VALUES ('2584', '10', '308');
INSERT INTO `sys_role_menu` VALUES ('2585', '10', '309');
INSERT INTO `sys_role_menu` VALUES ('2586', '10', '310');
INSERT INTO `sys_role_menu` VALUES ('2587', '10', '311');
INSERT INTO `sys_role_menu` VALUES ('2588', '10', '297');
INSERT INTO `sys_role_menu` VALUES ('2589', '10', '298');
INSERT INTO `sys_role_menu` VALUES ('2590', '10', '299');
INSERT INTO `sys_role_menu` VALUES ('2591', '10', '300');
INSERT INTO `sys_role_menu` VALUES ('2592', '10', '301');
INSERT INTO `sys_role_menu` VALUES ('2593', '10', '254');
INSERT INTO `sys_role_menu` VALUES ('2594', '10', '256');
INSERT INTO `sys_role_menu` VALUES ('2595', '10', '257');
INSERT INTO `sys_role_menu` VALUES ('2596', '10', '258');
INSERT INTO `sys_role_menu` VALUES ('2597', '10', '255');
INSERT INTO `sys_role_menu` VALUES ('2598', '10', '315');
INSERT INTO `sys_role_menu` VALUES ('2599', '10', '316');
INSERT INTO `sys_role_menu` VALUES ('2600', '10', '317');
INSERT INTO `sys_role_menu` VALUES ('2601', '10', '318');
INSERT INTO `sys_role_menu` VALUES ('2602', '10', '319');
INSERT INTO `sys_role_menu` VALUES ('2603', '10', '325');
INSERT INTO `sys_role_menu` VALUES ('2604', '10', '326');
INSERT INTO `sys_role_menu` VALUES ('2605', '10', '327');
INSERT INTO `sys_role_menu` VALUES ('2606', '10', '328');
INSERT INTO `sys_role_menu` VALUES ('2607', '10', '329');
INSERT INTO `sys_role_menu` VALUES ('2608', '10', '331');
INSERT INTO `sys_role_menu` VALUES ('2609', '10', '332');
INSERT INTO `sys_role_menu` VALUES ('2610', '10', '333');
INSERT INTO `sys_role_menu` VALUES ('2611', '10', '334');
INSERT INTO `sys_role_menu` VALUES ('2612', '10', '335');
INSERT INTO `sys_role_menu` VALUES ('2613', '10', '357');
INSERT INTO `sys_role_menu` VALUES ('2614', '10', '289');
INSERT INTO `sys_role_menu` VALUES ('2615', '10', '290');
INSERT INTO `sys_role_menu` VALUES ('2616', '10', '291');
INSERT INTO `sys_role_menu` VALUES ('2617', '10', '292');
INSERT INTO `sys_role_menu` VALUES ('2618', '10', '293');
INSERT INTO `sys_role_menu` VALUES ('2619', '10', '352');
INSERT INTO `sys_role_menu` VALUES ('2620', '10', '353');
INSERT INTO `sys_role_menu` VALUES ('2621', '10', '354');
INSERT INTO `sys_role_menu` VALUES ('2622', '10', '355');
INSERT INTO `sys_role_menu` VALUES ('2623', '10', '356');
INSERT INTO `sys_role_menu` VALUES ('2624', '10', '401');
INSERT INTO `sys_role_menu` VALUES ('2625', '10', '402');
INSERT INTO `sys_role_menu` VALUES ('2626', '10', '403');
INSERT INTO `sys_role_menu` VALUES ('2627', '10', '404');
INSERT INTO `sys_role_menu` VALUES ('2628', '10', '405');
INSERT INTO `sys_role_menu` VALUES ('2629', '10', '342');
INSERT INTO `sys_role_menu` VALUES ('2630', '10', '343');
INSERT INTO `sys_role_menu` VALUES ('2631', '10', '344');
INSERT INTO `sys_role_menu` VALUES ('2632', '10', '345');
INSERT INTO `sys_role_menu` VALUES ('2633', '10', '346');
INSERT INTO `sys_role_menu` VALUES ('2634', '10', '347');
INSERT INTO `sys_role_menu` VALUES ('2635', '10', '348');
INSERT INTO `sys_role_menu` VALUES ('2636', '10', '349');
INSERT INTO `sys_role_menu` VALUES ('2637', '10', '350');
INSERT INTO `sys_role_menu` VALUES ('2638', '10', '351');
INSERT INTO `sys_role_menu` VALUES ('2639', '10', '361');
INSERT INTO `sys_role_menu` VALUES ('2640', '10', '362');
INSERT INTO `sys_role_menu` VALUES ('2641', '10', '363');
INSERT INTO `sys_role_menu` VALUES ('2642', '10', '364');
INSERT INTO `sys_role_menu` VALUES ('2643', '10', '365');
INSERT INTO `sys_role_menu` VALUES ('2644', '10', '336');
INSERT INTO `sys_role_menu` VALUES ('2645', '10', '341');
INSERT INTO `sys_role_menu` VALUES ('2646', '10', '337');
INSERT INTO `sys_role_menu` VALUES ('2647', '10', '338');
INSERT INTO `sys_role_menu` VALUES ('2648', '10', '339');
INSERT INTO `sys_role_menu` VALUES ('2649', '10', '340');
INSERT INTO `sys_role_menu` VALUES ('2650', '10', '358');
INSERT INTO `sys_role_menu` VALUES ('2651', '10', '359');
INSERT INTO `sys_role_menu` VALUES ('2652', '10', '374');
INSERT INTO `sys_role_menu` VALUES ('2653', '10', '294');
INSERT INTO `sys_role_menu` VALUES ('2654', '10', '360');
INSERT INTO `sys_role_menu` VALUES ('2655', '10', '295');
INSERT INTO `sys_role_menu` VALUES ('2656', '10', '296');
INSERT INTO `sys_role_menu` VALUES ('2657', '10', '243');
INSERT INTO `sys_role_menu` VALUES ('2658', '10', '238');
INSERT INTO `sys_role_menu` VALUES ('2659', '10', '239');
INSERT INTO `sys_role_menu` VALUES ('2660', '10', '240');
INSERT INTO `sys_role_menu` VALUES ('2661', '10', '241');
INSERT INTO `sys_role_menu` VALUES ('2662', '10', '242');
INSERT INTO `sys_role_menu` VALUES ('2663', '10', '233');
INSERT INTO `sys_role_menu` VALUES ('2664', '10', '234');
INSERT INTO `sys_role_menu` VALUES ('2665', '10', '235');
INSERT INTO `sys_role_menu` VALUES ('2666', '10', '236');
INSERT INTO `sys_role_menu` VALUES ('2667', '10', '237');
INSERT INTO `sys_role_menu` VALUES ('2668', '10', '244');
INSERT INTO `sys_role_menu` VALUES ('2669', '10', '330');
INSERT INTO `sys_role_menu` VALUES ('2670', '10', '245');
INSERT INTO `sys_role_menu` VALUES ('2671', '10', '246');
INSERT INTO `sys_role_menu` VALUES ('2672', '10', '247');
INSERT INTO `sys_role_menu` VALUES ('2673', '10', '248');
INSERT INTO `sys_role_menu` VALUES ('2674', '10', '275');
INSERT INTO `sys_role_menu` VALUES ('2675', '10', '276');
INSERT INTO `sys_role_menu` VALUES ('2676', '10', '277');
INSERT INTO `sys_role_menu` VALUES ('2677', '10', '278');
INSERT INTO `sys_role_menu` VALUES ('2678', '10', '279');
INSERT INTO `sys_role_menu` VALUES ('2679', '10', '270');
INSERT INTO `sys_role_menu` VALUES ('2680', '10', '271');
INSERT INTO `sys_role_menu` VALUES ('2681', '10', '272');
INSERT INTO `sys_role_menu` VALUES ('2682', '10', '273');
INSERT INTO `sys_role_menu` VALUES ('2683', '10', '274');
INSERT INTO `sys_role_menu` VALUES ('2684', '10', '366');
INSERT INTO `sys_role_menu` VALUES ('2685', '10', '380');
INSERT INTO `sys_role_menu` VALUES ('2686', '10', '381');
INSERT INTO `sys_role_menu` VALUES ('2687', '10', '382');
INSERT INTO `sys_role_menu` VALUES ('2688', '10', '383');
INSERT INTO `sys_role_menu` VALUES ('2689', '10', '384');
INSERT INTO `sys_role_menu` VALUES ('2690', '10', '386');
INSERT INTO `sys_role_menu` VALUES ('2691', '10', '387');
INSERT INTO `sys_role_menu` VALUES ('2692', '10', '388');
INSERT INTO `sys_role_menu` VALUES ('2693', '10', '389');
INSERT INTO `sys_role_menu` VALUES ('2694', '10', '390');
INSERT INTO `sys_role_menu` VALUES ('2695', '10', '385');
INSERT INTO `sys_role_menu` VALUES ('2696', '10', '391');
INSERT INTO `sys_role_menu` VALUES ('2697', '10', '392');
INSERT INTO `sys_role_menu` VALUES ('2698', '10', '393');
INSERT INTO `sys_role_menu` VALUES ('2699', '10', '394');
INSERT INTO `sys_role_menu` VALUES ('2700', '10', '1');
INSERT INTO `sys_role_menu` VALUES ('2701', '10', '2');
INSERT INTO `sys_role_menu` VALUES ('2702', '10', '15');
INSERT INTO `sys_role_menu` VALUES ('2703', '10', '16');
INSERT INTO `sys_role_menu` VALUES ('2704', '10', '17');
INSERT INTO `sys_role_menu` VALUES ('2705', '10', '18');
INSERT INTO `sys_role_menu` VALUES ('2706', '10', '3');
INSERT INTO `sys_role_menu` VALUES ('2707', '10', '19');
INSERT INTO `sys_role_menu` VALUES ('2708', '10', '20');
INSERT INTO `sys_role_menu` VALUES ('2709', '10', '21');
INSERT INTO `sys_role_menu` VALUES ('2710', '10', '22');
INSERT INTO `sys_role_menu` VALUES ('2711', '10', '368');
INSERT INTO `sys_role_menu` VALUES ('2712', '10', '369');
INSERT INTO `sys_role_menu` VALUES ('2713', '10', '370');
INSERT INTO `sys_role_menu` VALUES ('2714', '10', '371');
INSERT INTO `sys_role_menu` VALUES ('2715', '10', '372');
INSERT INTO `sys_role_menu` VALUES ('2716', '10', '373');
INSERT INTO `sys_role_menu` VALUES ('2717', '10', '4');
INSERT INTO `sys_role_menu` VALUES ('2718', '10', '23');
INSERT INTO `sys_role_menu` VALUES ('2719', '10', '24');
INSERT INTO `sys_role_menu` VALUES ('2720', '10', '25');
INSERT INTO `sys_role_menu` VALUES ('2721', '10', '26');
INSERT INTO `sys_role_menu` VALUES ('2722', '10', '6');
INSERT INTO `sys_role_menu` VALUES ('2723', '10', '7');
INSERT INTO `sys_role_menu` VALUES ('2724', '10', '8');
INSERT INTO `sys_role_menu` VALUES ('2725', '10', '9');
INSERT INTO `sys_role_menu` VALUES ('2726', '10', '10');
INSERT INTO `sys_role_menu` VALUES ('2727', '10', '11');
INSERT INTO `sys_role_menu` VALUES ('2728', '10', '12');
INSERT INTO `sys_role_menu` VALUES ('2729', '10', '13');
INSERT INTO `sys_role_menu` VALUES ('2730', '10', '14');
INSERT INTO `sys_role_menu` VALUES ('2731', '10', '30');
INSERT INTO `sys_role_menu` VALUES ('2732', '10', '302');
INSERT INTO `sys_role_menu` VALUES ('2733', '10', '303');
INSERT INTO `sys_role_menu` VALUES ('2734', '10', '304');
INSERT INTO `sys_role_menu` VALUES ('2735', '10', '305');
INSERT INTO `sys_role_menu` VALUES ('2736', '10', '306');
INSERT INTO `sys_role_menu` VALUES ('2737', '10', '395');
INSERT INTO `sys_role_menu` VALUES ('2738', '10', '396');
INSERT INTO `sys_role_menu` VALUES ('2739', '10', '397');
INSERT INTO `sys_role_menu` VALUES ('2740', '10', '398');
INSERT INTO `sys_role_menu` VALUES ('2741', '10', '399');
INSERT INTO `sys_role_menu` VALUES ('2742', '10', '27');
INSERT INTO `sys_role_menu` VALUES ('2743', '10', '29');
INSERT INTO `sys_role_menu` VALUES ('2744', '10', '379');
INSERT INTO `sys_role_menu` VALUES ('2745', '10', '5');
INSERT INTO `sys_role_menu` VALUES ('2746', '10', '28');
INSERT INTO `sys_role_menu` VALUES ('2747', '6', '375');
INSERT INTO `sys_role_menu` VALUES ('2748', '6', '376');
INSERT INTO `sys_role_menu` VALUES ('2749', '6', '377');
INSERT INTO `sys_role_menu` VALUES ('2750', '6', '378');
INSERT INTO `sys_role_menu` VALUES ('2751', '6', '200');
INSERT INTO `sys_role_menu` VALUES ('2752', '6', '207');
INSERT INTO `sys_role_menu` VALUES ('2753', '6', '208');
INSERT INTO `sys_role_menu` VALUES ('2754', '6', '209');
INSERT INTO `sys_role_menu` VALUES ('2755', '6', '210');
INSERT INTO `sys_role_menu` VALUES ('2756', '6', '211');
INSERT INTO `sys_role_menu` VALUES ('2757', '6', '201');
INSERT INTO `sys_role_menu` VALUES ('2758', '6', '202');
INSERT INTO `sys_role_menu` VALUES ('2759', '6', '203');
INSERT INTO `sys_role_menu` VALUES ('2760', '6', '204');
INSERT INTO `sys_role_menu` VALUES ('2761', '6', '205');
INSERT INTO `sys_role_menu` VALUES ('2762', '6', '249');
INSERT INTO `sys_role_menu` VALUES ('2763', '6', '250');
INSERT INTO `sys_role_menu` VALUES ('2764', '6', '251');
INSERT INTO `sys_role_menu` VALUES ('2765', '6', '252');
INSERT INTO `sys_role_menu` VALUES ('2766', '6', '253');
INSERT INTO `sys_role_menu` VALUES ('2767', '6', '264');
INSERT INTO `sys_role_menu` VALUES ('2768', '6', '265');
INSERT INTO `sys_role_menu` VALUES ('2769', '6', '266');
INSERT INTO `sys_role_menu` VALUES ('2770', '6', '280');
INSERT INTO `sys_role_menu` VALUES ('2771', '6', '281');
INSERT INTO `sys_role_menu` VALUES ('2772', '6', '282');
INSERT INTO `sys_role_menu` VALUES ('2773', '6', '283');
INSERT INTO `sys_role_menu` VALUES ('2774', '6', '284');
INSERT INTO `sys_role_menu` VALUES ('2775', '6', '285');
INSERT INTO `sys_role_menu` VALUES ('2776', '6', '286');
INSERT INTO `sys_role_menu` VALUES ('2777', '6', '287');
INSERT INTO `sys_role_menu` VALUES ('2778', '6', '288');
INSERT INTO `sys_role_menu` VALUES ('2779', '6', '212');
INSERT INTO `sys_role_menu` VALUES ('2780', '6', '213');
INSERT INTO `sys_role_menu` VALUES ('2781', '6', '214');
INSERT INTO `sys_role_menu` VALUES ('2782', '6', '215');
INSERT INTO `sys_role_menu` VALUES ('2783', '6', '216');
INSERT INTO `sys_role_menu` VALUES ('2784', '6', '222');
INSERT INTO `sys_role_menu` VALUES ('2785', '6', '223');
INSERT INTO `sys_role_menu` VALUES ('2786', '6', '224');
INSERT INTO `sys_role_menu` VALUES ('2787', '6', '225');
INSERT INTO `sys_role_menu` VALUES ('2788', '6', '226');
INSERT INTO `sys_role_menu` VALUES ('2789', '6', '227');
INSERT INTO `sys_role_menu` VALUES ('2790', '6', '259');
INSERT INTO `sys_role_menu` VALUES ('2791', '6', '260');
INSERT INTO `sys_role_menu` VALUES ('2792', '6', '261');
INSERT INTO `sys_role_menu` VALUES ('2793', '6', '262');
INSERT INTO `sys_role_menu` VALUES ('2794', '6', '263');
INSERT INTO `sys_role_menu` VALUES ('2795', '6', '307');
INSERT INTO `sys_role_menu` VALUES ('2796', '6', '308');
INSERT INTO `sys_role_menu` VALUES ('2797', '6', '309');
INSERT INTO `sys_role_menu` VALUES ('2798', '6', '310');
INSERT INTO `sys_role_menu` VALUES ('2799', '6', '311');
INSERT INTO `sys_role_menu` VALUES ('2800', '6', '297');
INSERT INTO `sys_role_menu` VALUES ('2801', '6', '298');
INSERT INTO `sys_role_menu` VALUES ('2802', '6', '299');
INSERT INTO `sys_role_menu` VALUES ('2803', '6', '300');
INSERT INTO `sys_role_menu` VALUES ('2804', '6', '301');
INSERT INTO `sys_role_menu` VALUES ('2805', '6', '254');
INSERT INTO `sys_role_menu` VALUES ('2806', '6', '256');
INSERT INTO `sys_role_menu` VALUES ('2807', '6', '257');
INSERT INTO `sys_role_menu` VALUES ('2808', '6', '258');
INSERT INTO `sys_role_menu` VALUES ('2809', '6', '255');
INSERT INTO `sys_role_menu` VALUES ('2810', '6', '315');
INSERT INTO `sys_role_menu` VALUES ('2811', '6', '316');
INSERT INTO `sys_role_menu` VALUES ('2812', '6', '317');
INSERT INTO `sys_role_menu` VALUES ('2813', '6', '318');
INSERT INTO `sys_role_menu` VALUES ('2814', '6', '319');
INSERT INTO `sys_role_menu` VALUES ('2815', '6', '325');
INSERT INTO `sys_role_menu` VALUES ('2816', '6', '326');
INSERT INTO `sys_role_menu` VALUES ('2817', '6', '327');
INSERT INTO `sys_role_menu` VALUES ('2818', '6', '328');
INSERT INTO `sys_role_menu` VALUES ('2819', '6', '329');
INSERT INTO `sys_role_menu` VALUES ('2820', '6', '331');
INSERT INTO `sys_role_menu` VALUES ('2821', '6', '332');
INSERT INTO `sys_role_menu` VALUES ('2822', '6', '333');
INSERT INTO `sys_role_menu` VALUES ('2823', '6', '334');
INSERT INTO `sys_role_menu` VALUES ('2824', '6', '335');
INSERT INTO `sys_role_menu` VALUES ('2825', '6', '357');
INSERT INTO `sys_role_menu` VALUES ('2826', '6', '289');
INSERT INTO `sys_role_menu` VALUES ('2827', '6', '290');
INSERT INTO `sys_role_menu` VALUES ('2828', '6', '291');
INSERT INTO `sys_role_menu` VALUES ('2829', '6', '292');
INSERT INTO `sys_role_menu` VALUES ('2830', '6', '293');
INSERT INTO `sys_role_menu` VALUES ('2831', '6', '352');
INSERT INTO `sys_role_menu` VALUES ('2832', '6', '353');
INSERT INTO `sys_role_menu` VALUES ('2833', '6', '354');
INSERT INTO `sys_role_menu` VALUES ('2834', '6', '355');
INSERT INTO `sys_role_menu` VALUES ('2835', '6', '356');
INSERT INTO `sys_role_menu` VALUES ('2836', '6', '401');
INSERT INTO `sys_role_menu` VALUES ('2837', '6', '402');
INSERT INTO `sys_role_menu` VALUES ('2838', '6', '403');
INSERT INTO `sys_role_menu` VALUES ('2839', '6', '404');
INSERT INTO `sys_role_menu` VALUES ('2840', '6', '405');
INSERT INTO `sys_role_menu` VALUES ('2841', '6', '342');
INSERT INTO `sys_role_menu` VALUES ('2842', '6', '343');
INSERT INTO `sys_role_menu` VALUES ('2843', '6', '344');
INSERT INTO `sys_role_menu` VALUES ('2844', '6', '345');
INSERT INTO `sys_role_menu` VALUES ('2845', '6', '346');
INSERT INTO `sys_role_menu` VALUES ('2846', '6', '347');
INSERT INTO `sys_role_menu` VALUES ('2847', '6', '348');
INSERT INTO `sys_role_menu` VALUES ('2848', '6', '349');
INSERT INTO `sys_role_menu` VALUES ('2849', '6', '350');
INSERT INTO `sys_role_menu` VALUES ('2850', '6', '351');
INSERT INTO `sys_role_menu` VALUES ('2851', '6', '361');
INSERT INTO `sys_role_menu` VALUES ('2852', '6', '362');
INSERT INTO `sys_role_menu` VALUES ('2853', '6', '363');
INSERT INTO `sys_role_menu` VALUES ('2854', '6', '364');
INSERT INTO `sys_role_menu` VALUES ('2855', '6', '365');
INSERT INTO `sys_role_menu` VALUES ('2856', '6', '336');
INSERT INTO `sys_role_menu` VALUES ('2857', '6', '341');
INSERT INTO `sys_role_menu` VALUES ('2858', '6', '337');
INSERT INTO `sys_role_menu` VALUES ('2859', '6', '338');
INSERT INTO `sys_role_menu` VALUES ('2860', '6', '339');
INSERT INTO `sys_role_menu` VALUES ('2861', '6', '340');
INSERT INTO `sys_role_menu` VALUES ('2862', '6', '358');
INSERT INTO `sys_role_menu` VALUES ('2863', '6', '359');
INSERT INTO `sys_role_menu` VALUES ('2864', '6', '366');
INSERT INTO `sys_role_menu` VALUES ('2865', '6', '380');
INSERT INTO `sys_role_menu` VALUES ('2866', '6', '381');
INSERT INTO `sys_role_menu` VALUES ('2867', '6', '382');
INSERT INTO `sys_role_menu` VALUES ('2868', '6', '383');
INSERT INTO `sys_role_menu` VALUES ('2869', '6', '384');
INSERT INTO `sys_role_menu` VALUES ('2870', '6', '386');
INSERT INTO `sys_role_menu` VALUES ('2871', '6', '387');
INSERT INTO `sys_role_menu` VALUES ('2872', '6', '388');
INSERT INTO `sys_role_menu` VALUES ('2873', '6', '389');
INSERT INTO `sys_role_menu` VALUES ('2874', '6', '390');
INSERT INTO `sys_role_menu` VALUES ('2875', '6', '385');
INSERT INTO `sys_role_menu` VALUES ('2876', '6', '391');
INSERT INTO `sys_role_menu` VALUES ('2877', '6', '392');
INSERT INTO `sys_role_menu` VALUES ('2878', '6', '393');
INSERT INTO `sys_role_menu` VALUES ('2879', '6', '394');
INSERT INTO `sys_role_menu` VALUES ('2880', '6', '1');
INSERT INTO `sys_role_menu` VALUES ('2881', '6', '2');
INSERT INTO `sys_role_menu` VALUES ('2882', '6', '15');
INSERT INTO `sys_role_menu` VALUES ('2883', '6', '16');
INSERT INTO `sys_role_menu` VALUES ('2884', '6', '17');
INSERT INTO `sys_role_menu` VALUES ('2885', '6', '18');
INSERT INTO `sys_role_menu` VALUES ('2886', '6', '3');
INSERT INTO `sys_role_menu` VALUES ('2887', '6', '19');
INSERT INTO `sys_role_menu` VALUES ('2888', '6', '20');
INSERT INTO `sys_role_menu` VALUES ('2889', '6', '21');
INSERT INTO `sys_role_menu` VALUES ('2890', '6', '22');
INSERT INTO `sys_role_menu` VALUES ('2891', '6', '368');
INSERT INTO `sys_role_menu` VALUES ('2892', '6', '369');
INSERT INTO `sys_role_menu` VALUES ('2893', '6', '370');
INSERT INTO `sys_role_menu` VALUES ('2894', '6', '371');
INSERT INTO `sys_role_menu` VALUES ('2895', '6', '372');
INSERT INTO `sys_role_menu` VALUES ('2896', '6', '373');
INSERT INTO `sys_role_menu` VALUES ('2897', '6', '4');
INSERT INTO `sys_role_menu` VALUES ('2898', '6', '23');
INSERT INTO `sys_role_menu` VALUES ('2899', '6', '24');
INSERT INTO `sys_role_menu` VALUES ('2900', '6', '25');
INSERT INTO `sys_role_menu` VALUES ('2901', '6', '26');
INSERT INTO `sys_role_menu` VALUES ('2902', '6', '6');
INSERT INTO `sys_role_menu` VALUES ('2903', '6', '7');
INSERT INTO `sys_role_menu` VALUES ('2904', '6', '8');
INSERT INTO `sys_role_menu` VALUES ('2905', '6', '9');
INSERT INTO `sys_role_menu` VALUES ('2906', '6', '10');
INSERT INTO `sys_role_menu` VALUES ('2907', '6', '11');
INSERT INTO `sys_role_menu` VALUES ('2908', '6', '12');
INSERT INTO `sys_role_menu` VALUES ('2909', '6', '13');
INSERT INTO `sys_role_menu` VALUES ('2910', '6', '14');
INSERT INTO `sys_role_menu` VALUES ('2911', '6', '30');
INSERT INTO `sys_role_menu` VALUES ('2912', '6', '302');
INSERT INTO `sys_role_menu` VALUES ('2913', '6', '303');
INSERT INTO `sys_role_menu` VALUES ('2914', '6', '304');
INSERT INTO `sys_role_menu` VALUES ('2915', '6', '305');
INSERT INTO `sys_role_menu` VALUES ('2916', '6', '306');
INSERT INTO `sys_role_menu` VALUES ('2917', '6', '395');
INSERT INTO `sys_role_menu` VALUES ('2918', '6', '396');
INSERT INTO `sys_role_menu` VALUES ('2919', '6', '397');
INSERT INTO `sys_role_menu` VALUES ('2920', '6', '398');
INSERT INTO `sys_role_menu` VALUES ('2921', '6', '399');
INSERT INTO `sys_role_menu` VALUES ('2922', '6', '27');
INSERT INTO `sys_role_menu` VALUES ('2923', '6', '29');
INSERT INTO `sys_role_menu` VALUES ('2924', '6', '379');
INSERT INTO `sys_role_menu` VALUES ('2925', '6', '5');
INSERT INTO `sys_role_menu` VALUES ('2926', '6', '28');
INSERT INTO `sys_role_menu` VALUES ('2927', '5', '375');
INSERT INTO `sys_role_menu` VALUES ('2928', '5', '376');
INSERT INTO `sys_role_menu` VALUES ('2929', '5', '377');
INSERT INTO `sys_role_menu` VALUES ('2930', '5', '378');
INSERT INTO `sys_role_menu` VALUES ('2931', '5', '200');
INSERT INTO `sys_role_menu` VALUES ('2932', '5', '207');
INSERT INTO `sys_role_menu` VALUES ('2933', '5', '208');
INSERT INTO `sys_role_menu` VALUES ('2934', '5', '209');
INSERT INTO `sys_role_menu` VALUES ('2935', '5', '210');
INSERT INTO `sys_role_menu` VALUES ('2936', '5', '211');
INSERT INTO `sys_role_menu` VALUES ('2937', '5', '201');
INSERT INTO `sys_role_menu` VALUES ('2938', '5', '202');
INSERT INTO `sys_role_menu` VALUES ('2939', '5', '203');
INSERT INTO `sys_role_menu` VALUES ('2940', '5', '204');
INSERT INTO `sys_role_menu` VALUES ('2941', '5', '205');
INSERT INTO `sys_role_menu` VALUES ('2942', '5', '249');
INSERT INTO `sys_role_menu` VALUES ('2943', '5', '250');
INSERT INTO `sys_role_menu` VALUES ('2944', '5', '251');
INSERT INTO `sys_role_menu` VALUES ('2945', '5', '252');
INSERT INTO `sys_role_menu` VALUES ('2946', '5', '253');
INSERT INTO `sys_role_menu` VALUES ('2947', '5', '264');
INSERT INTO `sys_role_menu` VALUES ('2948', '5', '265');
INSERT INTO `sys_role_menu` VALUES ('2949', '5', '266');
INSERT INTO `sys_role_menu` VALUES ('2950', '5', '280');
INSERT INTO `sys_role_menu` VALUES ('2951', '5', '281');
INSERT INTO `sys_role_menu` VALUES ('2952', '5', '282');
INSERT INTO `sys_role_menu` VALUES ('2953', '5', '283');
INSERT INTO `sys_role_menu` VALUES ('2954', '5', '284');
INSERT INTO `sys_role_menu` VALUES ('2955', '5', '285');
INSERT INTO `sys_role_menu` VALUES ('2956', '5', '286');
INSERT INTO `sys_role_menu` VALUES ('2957', '5', '287');
INSERT INTO `sys_role_menu` VALUES ('2958', '5', '288');
INSERT INTO `sys_role_menu` VALUES ('2959', '5', '212');
INSERT INTO `sys_role_menu` VALUES ('2960', '5', '213');
INSERT INTO `sys_role_menu` VALUES ('2961', '5', '214');
INSERT INTO `sys_role_menu` VALUES ('2962', '5', '215');
INSERT INTO `sys_role_menu` VALUES ('2963', '5', '216');
INSERT INTO `sys_role_menu` VALUES ('2964', '5', '222');
INSERT INTO `sys_role_menu` VALUES ('2965', '5', '223');
INSERT INTO `sys_role_menu` VALUES ('2966', '5', '224');
INSERT INTO `sys_role_menu` VALUES ('2967', '5', '225');
INSERT INTO `sys_role_menu` VALUES ('2968', '5', '226');
INSERT INTO `sys_role_menu` VALUES ('2969', '5', '227');
INSERT INTO `sys_role_menu` VALUES ('2970', '5', '259');
INSERT INTO `sys_role_menu` VALUES ('2971', '5', '260');
INSERT INTO `sys_role_menu` VALUES ('2972', '5', '261');
INSERT INTO `sys_role_menu` VALUES ('2973', '5', '262');
INSERT INTO `sys_role_menu` VALUES ('2974', '5', '263');
INSERT INTO `sys_role_menu` VALUES ('2975', '5', '307');
INSERT INTO `sys_role_menu` VALUES ('2976', '5', '308');
INSERT INTO `sys_role_menu` VALUES ('2977', '5', '309');
INSERT INTO `sys_role_menu` VALUES ('2978', '5', '310');
INSERT INTO `sys_role_menu` VALUES ('2979', '5', '311');
INSERT INTO `sys_role_menu` VALUES ('2980', '5', '297');
INSERT INTO `sys_role_menu` VALUES ('2981', '5', '298');
INSERT INTO `sys_role_menu` VALUES ('2982', '5', '299');
INSERT INTO `sys_role_menu` VALUES ('2983', '5', '300');
INSERT INTO `sys_role_menu` VALUES ('2984', '5', '301');
INSERT INTO `sys_role_menu` VALUES ('2985', '5', '254');
INSERT INTO `sys_role_menu` VALUES ('2986', '5', '256');
INSERT INTO `sys_role_menu` VALUES ('2987', '5', '257');
INSERT INTO `sys_role_menu` VALUES ('2988', '5', '258');
INSERT INTO `sys_role_menu` VALUES ('2989', '5', '255');
INSERT INTO `sys_role_menu` VALUES ('2990', '5', '315');
INSERT INTO `sys_role_menu` VALUES ('2991', '5', '316');
INSERT INTO `sys_role_menu` VALUES ('2992', '5', '317');
INSERT INTO `sys_role_menu` VALUES ('2993', '5', '318');
INSERT INTO `sys_role_menu` VALUES ('2994', '5', '319');
INSERT INTO `sys_role_menu` VALUES ('2995', '5', '325');
INSERT INTO `sys_role_menu` VALUES ('2996', '5', '326');
INSERT INTO `sys_role_menu` VALUES ('2997', '5', '327');
INSERT INTO `sys_role_menu` VALUES ('2998', '5', '328');
INSERT INTO `sys_role_menu` VALUES ('2999', '5', '329');
INSERT INTO `sys_role_menu` VALUES ('3000', '5', '331');
INSERT INTO `sys_role_menu` VALUES ('3001', '5', '332');
INSERT INTO `sys_role_menu` VALUES ('3002', '5', '333');
INSERT INTO `sys_role_menu` VALUES ('3003', '5', '334');
INSERT INTO `sys_role_menu` VALUES ('3004', '5', '335');
INSERT INTO `sys_role_menu` VALUES ('3005', '5', '357');
INSERT INTO `sys_role_menu` VALUES ('3006', '5', '289');
INSERT INTO `sys_role_menu` VALUES ('3007', '5', '290');
INSERT INTO `sys_role_menu` VALUES ('3008', '5', '291');
INSERT INTO `sys_role_menu` VALUES ('3009', '5', '292');
INSERT INTO `sys_role_menu` VALUES ('3010', '5', '293');
INSERT INTO `sys_role_menu` VALUES ('3011', '5', '352');
INSERT INTO `sys_role_menu` VALUES ('3012', '5', '353');
INSERT INTO `sys_role_menu` VALUES ('3013', '5', '354');
INSERT INTO `sys_role_menu` VALUES ('3014', '5', '355');
INSERT INTO `sys_role_menu` VALUES ('3015', '5', '356');
INSERT INTO `sys_role_menu` VALUES ('3016', '5', '342');
INSERT INTO `sys_role_menu` VALUES ('3017', '5', '343');
INSERT INTO `sys_role_menu` VALUES ('3018', '5', '344');
INSERT INTO `sys_role_menu` VALUES ('3019', '5', '345');
INSERT INTO `sys_role_menu` VALUES ('3020', '5', '346');
INSERT INTO `sys_role_menu` VALUES ('3021', '5', '347');
INSERT INTO `sys_role_menu` VALUES ('3022', '5', '348');
INSERT INTO `sys_role_menu` VALUES ('3023', '5', '349');
INSERT INTO `sys_role_menu` VALUES ('3024', '5', '350');
INSERT INTO `sys_role_menu` VALUES ('3025', '5', '351');
INSERT INTO `sys_role_menu` VALUES ('3026', '5', '361');
INSERT INTO `sys_role_menu` VALUES ('3027', '5', '362');
INSERT INTO `sys_role_menu` VALUES ('3028', '5', '363');
INSERT INTO `sys_role_menu` VALUES ('3029', '5', '364');
INSERT INTO `sys_role_menu` VALUES ('3030', '5', '365');
INSERT INTO `sys_role_menu` VALUES ('3031', '5', '336');
INSERT INTO `sys_role_menu` VALUES ('3032', '5', '341');
INSERT INTO `sys_role_menu` VALUES ('3033', '5', '337');
INSERT INTO `sys_role_menu` VALUES ('3034', '5', '338');
INSERT INTO `sys_role_menu` VALUES ('3035', '5', '339');
INSERT INTO `sys_role_menu` VALUES ('3036', '5', '340');
INSERT INTO `sys_role_menu` VALUES ('3037', '5', '358');
INSERT INTO `sys_role_menu` VALUES ('3038', '5', '359');
INSERT INTO `sys_role_menu` VALUES ('3039', '5', '374');
INSERT INTO `sys_role_menu` VALUES ('3040', '5', '294');
INSERT INTO `sys_role_menu` VALUES ('3041', '5', '360');
INSERT INTO `sys_role_menu` VALUES ('3042', '5', '295');
INSERT INTO `sys_role_menu` VALUES ('3043', '5', '296');
INSERT INTO `sys_role_menu` VALUES ('3044', '5', '243');
INSERT INTO `sys_role_menu` VALUES ('3045', '5', '238');
INSERT INTO `sys_role_menu` VALUES ('3046', '5', '239');
INSERT INTO `sys_role_menu` VALUES ('3047', '5', '240');
INSERT INTO `sys_role_menu` VALUES ('3048', '5', '241');
INSERT INTO `sys_role_menu` VALUES ('3049', '5', '242');
INSERT INTO `sys_role_menu` VALUES ('3050', '5', '233');
INSERT INTO `sys_role_menu` VALUES ('3051', '5', '234');
INSERT INTO `sys_role_menu` VALUES ('3052', '5', '235');
INSERT INTO `sys_role_menu` VALUES ('3053', '5', '236');
INSERT INTO `sys_role_menu` VALUES ('3054', '5', '237');
INSERT INTO `sys_role_menu` VALUES ('3055', '5', '244');
INSERT INTO `sys_role_menu` VALUES ('3056', '5', '330');
INSERT INTO `sys_role_menu` VALUES ('3057', '5', '245');
INSERT INTO `sys_role_menu` VALUES ('3058', '5', '246');
INSERT INTO `sys_role_menu` VALUES ('3059', '5', '247');
INSERT INTO `sys_role_menu` VALUES ('3060', '5', '248');
INSERT INTO `sys_role_menu` VALUES ('3061', '5', '275');
INSERT INTO `sys_role_menu` VALUES ('3062', '5', '276');
INSERT INTO `sys_role_menu` VALUES ('3063', '5', '277');
INSERT INTO `sys_role_menu` VALUES ('3064', '5', '278');
INSERT INTO `sys_role_menu` VALUES ('3065', '5', '279');
INSERT INTO `sys_role_menu` VALUES ('3066', '5', '270');
INSERT INTO `sys_role_menu` VALUES ('3067', '5', '271');
INSERT INTO `sys_role_menu` VALUES ('3068', '5', '272');
INSERT INTO `sys_role_menu` VALUES ('3069', '5', '273');
INSERT INTO `sys_role_menu` VALUES ('3070', '5', '274');
INSERT INTO `sys_role_menu` VALUES ('3071', '5', '366');
INSERT INTO `sys_role_menu` VALUES ('3072', '5', '380');
INSERT INTO `sys_role_menu` VALUES ('3073', '5', '381');
INSERT INTO `sys_role_menu` VALUES ('3074', '5', '382');
INSERT INTO `sys_role_menu` VALUES ('3075', '5', '383');
INSERT INTO `sys_role_menu` VALUES ('3076', '5', '384');
INSERT INTO `sys_role_menu` VALUES ('3077', '5', '386');
INSERT INTO `sys_role_menu` VALUES ('3078', '5', '387');
INSERT INTO `sys_role_menu` VALUES ('3079', '5', '388');
INSERT INTO `sys_role_menu` VALUES ('3080', '5', '389');
INSERT INTO `sys_role_menu` VALUES ('3081', '5', '390');
INSERT INTO `sys_role_menu` VALUES ('3082', '5', '385');
INSERT INTO `sys_role_menu` VALUES ('3083', '5', '391');
INSERT INTO `sys_role_menu` VALUES ('3084', '5', '392');
INSERT INTO `sys_role_menu` VALUES ('3085', '5', '393');
INSERT INTO `sys_role_menu` VALUES ('3086', '5', '394');
INSERT INTO `sys_role_menu` VALUES ('3087', '5', '1');
INSERT INTO `sys_role_menu` VALUES ('3088', '5', '2');
INSERT INTO `sys_role_menu` VALUES ('3089', '5', '15');
INSERT INTO `sys_role_menu` VALUES ('3090', '5', '16');
INSERT INTO `sys_role_menu` VALUES ('3091', '5', '17');
INSERT INTO `sys_role_menu` VALUES ('3092', '5', '18');
INSERT INTO `sys_role_menu` VALUES ('3093', '5', '3');
INSERT INTO `sys_role_menu` VALUES ('3094', '5', '19');
INSERT INTO `sys_role_menu` VALUES ('3095', '5', '20');
INSERT INTO `sys_role_menu` VALUES ('3096', '5', '21');
INSERT INTO `sys_role_menu` VALUES ('3097', '5', '22');
INSERT INTO `sys_role_menu` VALUES ('3098', '5', '368');
INSERT INTO `sys_role_menu` VALUES ('3099', '5', '369');
INSERT INTO `sys_role_menu` VALUES ('3100', '5', '370');
INSERT INTO `sys_role_menu` VALUES ('3101', '5', '371');
INSERT INTO `sys_role_menu` VALUES ('3102', '5', '372');
INSERT INTO `sys_role_menu` VALUES ('3103', '5', '373');
INSERT INTO `sys_role_menu` VALUES ('3104', '5', '4');
INSERT INTO `sys_role_menu` VALUES ('3105', '5', '23');
INSERT INTO `sys_role_menu` VALUES ('3106', '5', '24');
INSERT INTO `sys_role_menu` VALUES ('3107', '5', '25');
INSERT INTO `sys_role_menu` VALUES ('3108', '5', '26');
INSERT INTO `sys_role_menu` VALUES ('3109', '5', '6');
INSERT INTO `sys_role_menu` VALUES ('3110', '5', '7');
INSERT INTO `sys_role_menu` VALUES ('3111', '5', '8');
INSERT INTO `sys_role_menu` VALUES ('3112', '5', '9');
INSERT INTO `sys_role_menu` VALUES ('3113', '5', '10');
INSERT INTO `sys_role_menu` VALUES ('3114', '5', '11');
INSERT INTO `sys_role_menu` VALUES ('3115', '5', '12');
INSERT INTO `sys_role_menu` VALUES ('3116', '5', '13');
INSERT INTO `sys_role_menu` VALUES ('3117', '5', '14');
INSERT INTO `sys_role_menu` VALUES ('3118', '5', '30');
INSERT INTO `sys_role_menu` VALUES ('3119', '5', '302');
INSERT INTO `sys_role_menu` VALUES ('3120', '5', '303');
INSERT INTO `sys_role_menu` VALUES ('3121', '5', '304');
INSERT INTO `sys_role_menu` VALUES ('3122', '5', '305');
INSERT INTO `sys_role_menu` VALUES ('3123', '5', '306');
INSERT INTO `sys_role_menu` VALUES ('3124', '5', '395');
INSERT INTO `sys_role_menu` VALUES ('3125', '5', '396');
INSERT INTO `sys_role_menu` VALUES ('3126', '5', '397');
INSERT INTO `sys_role_menu` VALUES ('3127', '5', '398');
INSERT INTO `sys_role_menu` VALUES ('3128', '5', '399');
INSERT INTO `sys_role_menu` VALUES ('3129', '5', '27');
INSERT INTO `sys_role_menu` VALUES ('3130', '5', '29');
INSERT INTO `sys_role_menu` VALUES ('3131', '5', '379');
INSERT INTO `sys_role_menu` VALUES ('3132', '5', '5');
INSERT INTO `sys_role_menu` VALUES ('3133', '5', '28');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '939961241@qq.com', '15209831990', '1', '1', '2016-11-11 11:11:11', '1');
INSERT INTO `sys_user` VALUES ('2', 'test', '91b4d142823f7d20c5f08df69122de43f35f057a988d9619f6d3138485c9a203', 'test@aliyun.com', '18525852582', '1', '1', '2018-01-26 10:47:12', '11');
INSERT INTO `sys_user` VALUES ('3', 'kfjl', '91b4d142823f7d20c5f08df69122de43f35f057a988d9619f6d3138485c9a203', '123@qq.com', '12345678999', '1', '1', '2018-01-28 15:40:30', '7');
INSERT INTO `sys_user` VALUES ('4', '001', '91b4d142823f7d20c5f08df69122de43f35f057a988d9619f6d3138485c9a203', '111@qq.com', '12312312311', '1', '1', '2018-01-28 16:17:45', '5');
INSERT INTO `sys_user` VALUES ('5', '002', '91b4d142823f7d20c5f08df69122de43f35f057a988d9619f6d3138485c9a203', 'yugu@wsd.com', '12312312312', '1', '1', '2018-01-28 16:25:55', '10');
INSERT INTO `sys_user` VALUES ('6', 'ty', '91b4d142823f7d20c5f08df69122de43f35f057a988d9619f6d3138485c9a203', 'gffg@qqq.cooj', '11111111111', '1', '1', '2018-03-29 14:52:42', '2');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('56', '1', '5');
INSERT INTO `sys_user_role` VALUES ('63', '3', '7');
INSERT INTO `sys_user_role` VALUES ('64', '4', '8');
INSERT INTO `sys_user_role` VALUES ('65', '5', '9');
INSERT INTO `sys_user_role` VALUES ('66', '6', '6');
INSERT INTO `sys_user_role` VALUES ('67', '2', '10');

-- ----------------------------
-- Table structure for tb_token
-- ----------------------------
DROP TABLE IF EXISTS `tb_token`;
CREATE TABLE `tb_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户Token';

-- ----------------------------
-- Records of tb_token
-- ----------------------------
INSERT INTO `tb_token` VALUES ('26', 'ngexigjg4owxu5ruh2rmv3daczizmx8h', '2018-01-18 04:47:05', '2018-01-17 16:47:05');
INSERT INTO `tb_token` VALUES ('27', 'heutngh42q6c59buhbc74ua0x5i1cac8', '2018-01-18 06:02:26', '2018-01-17 18:02:26');
INSERT INTO `tb_token` VALUES ('28', 'wk1k891c379dpfl4nx4hxj1f4mj113g4', '2018-03-27 23:12:15', '2018-03-27 11:12:15');
INSERT INTO `tb_token` VALUES ('30', 'en5vhuczi14j828oftdg76dtz3x4a7wt', '2018-03-28 01:15:17', '2018-03-27 13:15:17');
INSERT INTO `tb_token` VALUES ('35', 'cs15jvpo25ki6vrdkosfntv7djv93du1', '2018-04-21 06:26:37', '2018-04-20 18:26:37');
INSERT INTO `tb_token` VALUES ('36', 'embucx78ss3mmen4ectyr4jkhuzwmzf2', '2018-04-20 23:56:25', '2018-04-20 11:56:25');
INSERT INTO `tb_token` VALUES ('37', 'gkltgx4iopix8sbfzekc0hg6lhgn7b9c', '2018-04-09 03:27:56', '2018-04-08 15:27:56');
INSERT INTO `tb_token` VALUES ('40', 'v3c06uw15akr2gvsmnxrpbxl501uyzse', '2018-04-09 03:41:00', '2018-04-08 15:41:00');
