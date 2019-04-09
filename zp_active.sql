/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : we7

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 09/04/2019 18:18:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_active
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_active`;
CREATE TABLE `ims_weixinmao_zp_active`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '公众号id',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章内容',
  `sort` int(10) NULL DEFAULT 0,
  `pid` int(10) NULL DEFAULT 0,
  `hits` int(10) NULL DEFAULT 0,
  `status` tinyint(10) NULL DEFAULT 0,
  `thumb` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` float(10, 2) NULL DEFAULT 0.00,
  `begintime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mainwork` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fuwork` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_activerecord
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_activerecord`;
CREATE TABLE `ims_weixinmao_zp_activerecord`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '公众号id',
  `uid` int(10) NULL DEFAULT 0,
  `aid` int(10) NULL DEFAULT 0,
  `companyid` int(10) NULL DEFAULT 0,
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `status` tinyint(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 163 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_adv
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_adv`;
CREATE TABLE `ims_weixinmao_zp_adv`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NULL DEFAULT 0,
  `advname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  `toway` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `appid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `indx_weid`(`weid`) USING BTREE,
  INDEX `indx_enabled`(`enabled`) USING BTREE,
  INDEX `indx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_agent
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_agent`;
CREATE TABLE `ims_weixinmao_zp_agent`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '公众号id',
  `uid` int(10) NULL DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weixin` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `status` tinyint(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 121 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_agent_record
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_agent_record`;
CREATE TABLE `ims_weixinmao_zp_agent_record`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '公众号id',
  `uid` int(10) NULL DEFAULT NULL,
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 132 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_area
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_area`;
CREATE TABLE `ims_weixinmao_zp_area`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sort` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  `cityid` tinyint(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `indx_weid`(`uniacid`) USING BTREE,
  INDEX `indx_enabled`(`enabled`) USING BTREE,
  INDEX `indx_displayorder`(`sort`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_weixinmao_zp_area
-- ----------------------------
INSERT INTO `ims_weixinmao_zp_area` VALUES (30, 84, '石门', 9, 1, 17);
INSERT INTO `ims_weixinmao_zp_area` VALUES (31, 84, '洲泉', 7, 1, 17);
INSERT INTO `ims_weixinmao_zp_area` VALUES (32, 84, '高桥', 8, 1, 17);
INSERT INTO `ims_weixinmao_zp_area` VALUES (33, 84, '崇福', 5, 1, 17);
INSERT INTO `ims_weixinmao_zp_area` VALUES (34, 84, '屠甸', 6, 1, 17);
INSERT INTO `ims_weixinmao_zp_area` VALUES (35, 84, '大麻', 11, 1, 17);
INSERT INTO `ims_weixinmao_zp_area` VALUES (36, 84, '河山', 10, 1, 17);
INSERT INTO `ims_weixinmao_zp_area` VALUES (37, 84, '其他', 12, 1, 17);
INSERT INTO `ims_weixinmao_zp_area` VALUES (29, 84, '乌镇', 4, 1, 17);
INSERT INTO `ims_weixinmao_zp_area` VALUES (28, 84, '濮院', 0, 1, 17);
INSERT INTO `ims_weixinmao_zp_area` VALUES (38, 84, '龙翔街道', 3, 1, 19);
INSERT INTO `ims_weixinmao_zp_area` VALUES (26, 84, '凤鸣街道', 2, 1, 19);
INSERT INTO `ims_weixinmao_zp_area` VALUES (25, 84, '梧桐街道', 1, 1, 19);
INSERT INTO `ims_weixinmao_zp_area` VALUES (39, 104, '城区', 0, 1, 30);
INSERT INTO `ims_weixinmao_zp_area` VALUES (40, 104, '开发区', 0, 1, 30);

-- ----------------------------
-- Table structure for ims_weixinmao_zp_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_category`;
CREATE TABLE `ims_weixinmao_zp_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `weid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属帐号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类图片',
  `parentid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID,0为第一级',
  `isrecommand` int(10) NULL DEFAULT 0,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类介绍',
  `displayorder` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否开启',
  `model` int(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_weixinmao_zp_category
-- ----------------------------
INSERT INTO `ims_weixinmao_zp_category` VALUES (8, 104, '教育培训', '', 0, 0, '', 0, 1, 0);
INSERT INTO `ims_weixinmao_zp_category` VALUES (9, 104, '零售业', '', 0, 0, '', 0, 1, 0);
INSERT INTO `ims_weixinmao_zp_category` VALUES (10, 104, '房地产', '', 0, 0, '', 0, 1, 0);
INSERT INTO `ims_weixinmao_zp_category` VALUES (11, 104, '开发区企业', '', 0, 0, '', 0, 1, 0);
INSERT INTO `ims_weixinmao_zp_category` VALUES (12, 104, '会计出纳', '', 0, 0, '', 0, 1, 0);

-- ----------------------------
-- Table structure for ims_weixinmao_zp_city
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_city`;
CREATE TABLE `ims_weixinmao_zp_city`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sort` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  `ishot` tinyint(10) NULL DEFAULT 0,
  `firstname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ison` tinyint(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `indx_weid`(`uniacid`) USING BTREE,
  INDEX `indx_enabled`(`enabled`) USING BTREE,
  INDEX `indx_displayorder`(`sort`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_weixinmao_zp_city
-- ----------------------------
INSERT INTO `ims_weixinmao_zp_city` VALUES (17, 84, '濮院镇', 0, 1, 1, 'P', 0);
INSERT INTO `ims_weixinmao_zp_city` VALUES (19, 84, '桐乡市', 0, 1, 1, 'T', 0);
INSERT INTO `ims_weixinmao_zp_city` VALUES (20, 84, '乌镇镇', 0, 1, 1, 'W', 0);
INSERT INTO `ims_weixinmao_zp_city` VALUES (21, 84, '石门镇', 0, 1, 0, 'S', 0);
INSERT INTO `ims_weixinmao_zp_city` VALUES (22, 84, '洲泉镇', 0, 1, 0, 'Z', 0);
INSERT INTO `ims_weixinmao_zp_city` VALUES (23, 84, '高桥镇', 0, 1, 0, 'G', 0);
INSERT INTO `ims_weixinmao_zp_city` VALUES (24, 84, '崇福镇', 0, 1, 0, 'C', 0);
INSERT INTO `ims_weixinmao_zp_city` VALUES (25, 84, '屠甸镇', 0, 1, 0, 'T', 0);
INSERT INTO `ims_weixinmao_zp_city` VALUES (26, 84, '大麻镇', 0, 1, 0, 'D', 0);
INSERT INTO `ims_weixinmao_zp_city` VALUES (27, 84, '河山镇', 0, 1, 0, 'H', 0);
INSERT INTO `ims_weixinmao_zp_city` VALUES (29, 84, '其他城市', 0, 1, 0, '#', 0);
INSERT INTO `ims_weixinmao_zp_city` VALUES (30, 104, '广德', 0, 1, 1, 'GD', 1);

-- ----------------------------
-- Table structure for ims_weixinmao_zp_company
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_company`;
CREATE TABLE `ims_weixinmao_zp_company`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `companyname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `companycate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `companytype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `companyworker` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mastername` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `createtime` int(10) NOT NULL DEFAULT 0,
  `endtime` int(10) NOT NULL DEFAULT 0,
  `thumb` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `areaid` int(10) NOT NULL DEFAULT 0,
  `status` tinyint(10) NOT NULL DEFAULT 0,
  `sort` int(10) NOT NULL DEFAULT 0,
  `uniacid` int(10) NOT NULL DEFAULT 0,
  `isrecommand` tinyint(10) NOT NULL DEFAULT 0,
  `lng` decimal(10, 6) NULL DEFAULT 0.000000,
  `lat` decimal(10, 6) NULL DEFAULT 0.000000,
  `notenum` int(10) NULL DEFAULT 0,
  `cityid` tinyint(10) NULL DEFAULT 0,
  `cardimg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jobnum` int(10) NULL DEFAULT 0,
  `roleid` int(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 73 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_companyaccount
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_companyaccount`;
CREATE TABLE `ims_weixinmao_zp_companyaccount`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '公众号id',
  `uid` int(10) NULL DEFAULT NULL,
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `status` tinyint(10) NULL DEFAULT 0,
  `logintime` int(10) NOT NULL DEFAULT 0,
  `companyid` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 119 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_companyrole
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_companyrole`;
CREATE TABLE `ims_weixinmao_zp_companyrole`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` float(10, 2) NULL DEFAULT 0.00,
  `days` mediumint(10) NULL DEFAULT 0,
  `sort` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  `jobnum` int(10) NULL DEFAULT 0,
  `notenum` int(10) NULL DEFAULT 0,
  `isinit` tinyint(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `indx_weid`(`uniacid`) USING BTREE,
  INDEX `indx_enabled`(`enabled`) USING BTREE,
  INDEX `indx_displayorder`(`sort`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_content
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_content`;
CREATE TABLE `ims_weixinmao_zp_content`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '公众号id',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章内容',
  `sort` int(10) NULL DEFAULT 0,
  `pid` int(10) NULL DEFAULT 0,
  `sid` int(10) NULL DEFAULT 0,
  `hits` int(10) NULL DEFAULT 0,
  `status` tinyint(10) NULL DEFAULT 0,
  `thumb` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_intro
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_intro`;
CREATE TABLE `ims_weixinmao_zp_intro`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '公众号id',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章内容',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logo` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `opentime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lng` decimal(10, 6) NULL DEFAULT 0.000000,
  `lat` decimal(10, 6) NULL DEFAULT 0.000000,
  `qq` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ischeck` tinyint(10) NULL DEFAULT 0,
  `iscompany` tinyint(10) NULL DEFAULT 1,
  `isnote` tinyint(10) NULL DEFAULT 1,
  `notenum` int(10) NULL DEFAULT 0,
  `issms` tinyint(10) NULL DEFAULT 0,
  `smsaccount` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `smspwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_invaterecord
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_invaterecord`;
CREATE TABLE `ims_weixinmao_zp_invaterecord`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '公众号id',
  `uid` int(10) NULL DEFAULT 0,
  `companyid` int(10) NULL DEFAULT 0,
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `status` tinyint(10) NULL DEFAULT 0,
  `invatetime` int(10) NULL DEFAULT 0,
  `islook` tinyint(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 156 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_job
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_job`;
CREATE TABLE `ims_weixinmao_zp_job`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `jobtitle` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `worktype` mediumint(10) NOT NULL DEFAULT 0,
  `num` int(10) NULL DEFAULT 0,
  `sex` tinyint(10) NULL DEFAULT 0,
  `age` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `special` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `vprice` float(20, 2) NULL DEFAULT 0.00,
  `companyid` int(10) NULL DEFAULT 0,
  `createtime` int(10) NULL DEFAULT 0,
  `sort` int(10) NULL DEFAULT 0,
  `status` tinyint(10) NULL DEFAULT 0,
  `uniacid` int(10) NULL DEFAULT 0,
  `isrecommand` tinyint(10) NULL DEFAULT 0,
  `money` float(10, 2) NOT NULL DEFAULT 0.00,
  `education` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `express` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jobtype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dmoney` float(10, 2) NULL DEFAULT 0.00,
  `endtime` int(10) NULL DEFAULT 0,
  `toptime` int(10) NULL DEFAULT 0,
  `noteprice` float(10, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`id`, `special`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 89 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_jobcate
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_jobcate`;
CREATE TABLE `ims_weixinmao_zp_jobcate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `sort` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `indx_weid`(`uniacid`) USING BTREE,
  INDEX `indx_enabled`(`enabled`) USING BTREE,
  INDEX `indx_displayorder`(`sort`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_jobnote
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_jobnote`;
CREATE TABLE `ims_weixinmao_zp_jobnote`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '公众号id',
  `uid` int(10) NULL DEFAULT NULL,
  `jobtitle` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` tinyint(10) NULL DEFAULT 1,
  `tel` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `education` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `express` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `currentstatus` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `worktype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jobcateid` mediumint(9) NOT NULL DEFAULT 0,
  `money` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `areaid` mediumint(10) NOT NULL DEFAULT 0,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `refreshtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '刷新时间',
  `status` tinyint(10) NULL DEFAULT 0,
  `avatarUrl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cityid` tinyint(10) NULL DEFAULT 0,
  `shareid` int(10) NULL DEFAULT 0,
  `tid` int(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 119 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_jobprice
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_jobprice`;
CREATE TABLE `ims_weixinmao_zp_jobprice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `beginprice` int(10) NULL DEFAULT 0,
  `endprice` int(10) NULL DEFAULT 0,
  `sort` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `indx_weid`(`uniacid`) USING BTREE,
  INDEX `indx_enabled`(`enabled`) USING BTREE,
  INDEX `indx_displayorder`(`sort`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_jobrecord
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_jobrecord`;
CREATE TABLE `ims_weixinmao_zp_jobrecord`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '公众号id',
  `uid` int(10) NULL DEFAULT 0,
  `jobid` int(10) NULL DEFAULT 0,
  `companyid` int(10) NULL DEFAULT 0,
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `status` tinyint(10) NULL DEFAULT 0,
  `invatetime` int(10) NULL DEFAULT 0,
  `shareid` int(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 121 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_jobsave
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_jobsave`;
CREATE TABLE `ims_weixinmao_zp_jobsave`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '公众号id',
  `uid` int(10) NULL DEFAULT 0,
  `jobid` int(10) NULL DEFAULT 0,
  `companyid` int(10) NULL DEFAULT 0,
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `status` tinyint(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 126 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_lookrecord
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_lookrecord`;
CREATE TABLE `ims_weixinmao_zp_lookrecord`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `companyid` int(10) NULL DEFAULT 0,
  `noteid` int(10) NULL DEFAULT 0,
  `createtime` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `indx_weid`(`uniacid`) USING BTREE,
  INDEX `indx_enabled`(`createtime`) USING BTREE,
  INDEX `indx_displayorder`(`noteid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_moneyrecord
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_moneyrecord`;
CREATE TABLE `ims_weixinmao_zp_moneyrecord`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '公众号id',
  `uid` int(10) NULL DEFAULT 0,
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `status` tinyint(10) NULL DEFAULT 0,
  `dmoney` float(10, 2) NULL DEFAULT 0.00 COMMENT '操作待收益',
  `dtotalmoney` float(10, 2) NULL DEFAULT 0.00 COMMENT '待收益结余',
  `money` float(10, 2) NULL DEFAULT 0.00 COMMENT '操作余额',
  `totalmoney` float(10, 2) NULL DEFAULT 0.00 COMMENT '可提结余',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` int(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 180 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_msgidlist
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_msgidlist`;
CREATE TABLE `ims_weixinmao_zp_msgidlist`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '公众号id',
  `uid` int(10) NULL DEFAULT NULL,
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `status` tinyint(10) NULL DEFAULT 0,
  `companyid` int(10) NULL DEFAULT 0,
  `form_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 170 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_msgtpl
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_msgtpl`;
CREATE TABLE `ims_weixinmao_zp_msgtpl`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NULL DEFAULT 0,
  `msgid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `msgcontent` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `enabled` int(11) NULL DEFAULT 0,
  `msgtype` tinyint(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `indx_weid`(`weid`) USING BTREE,
  INDEX `indx_enabled`(`enabled`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_nav
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_nav`;
CREATE TABLE `ims_weixinmao_zp_nav`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NULL DEFAULT 0,
  `advname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `displayorder` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `indx_weid`(`weid`) USING BTREE,
  INDEX `indx_enabled`(`enabled`) USING BTREE,
  INDEX `indx_displayorder`(`displayorder`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ims_weixinmao_zp_nav
-- ----------------------------
INSERT INTO `ims_weixinmao_zp_nav` VALUES (12, 84, '找工作', 'toFindjob', 'images/84/2018/07/l1qw8xNY6FQmjx41V42MqWU72jf1Mu.png', 0, 0);
INSERT INTO `ims_weixinmao_zp_nav` VALUES (13, 84, '招聘会', 'toActive', 'images/84/2018/07/ht6t6U6v1zZ2u121t9vpB11Fl61dbf.png', 0, 0);
INSERT INTO `ims_weixinmao_zp_nav` VALUES (14, 84, '发布简历', 'toMyNote', 'images/84/2018/07/FdvCg7411sd7hSShsqhDs4DDSz7pxq.png', 0, 0);
INSERT INTO `ims_weixinmao_zp_nav` VALUES (15, 84, '职场资讯', 'toArticle', 'images/84/2018/07/TYwHhLQ2uHuH9s2WZ9OL92XS0S92a1.png', 0, 0);

-- ----------------------------
-- Table structure for ims_weixinmao_zp_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_order`;
CREATE TABLE `ims_weixinmao_zp_order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '公众号id',
  `pid` int(10) NULL DEFAULT 0,
  `uid` int(10) NULL DEFAULT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` float(10, 2) NULL DEFAULT 0.00,
  `paytime` int(10) NULL DEFAULT 0,
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `paid` tinyint(10) NULL DEFAULT 0,
  `status` tinyint(10) NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyid` int(10) NULL DEFAULT 0,
  `toplistid` int(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 203 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_partjob
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_partjob`;
CREATE TABLE `ims_weixinmao_zp_partjob`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `jobtitle` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `worktype` mediumint(10) NOT NULL DEFAULT 0,
  `num` int(10) NULL DEFAULT 0,
  `sex` tinyint(10) NULL DEFAULT 0,
  `age` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `special` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `vprice` float(20, 2) NULL DEFAULT 0.00,
  `companyid` int(10) NULL DEFAULT 0,
  `createtime` int(10) NULL DEFAULT 0,
  `sort` int(10) NULL DEFAULT 0,
  `status` tinyint(10) NULL DEFAULT 0,
  `uniacid` int(10) NULL DEFAULT 0,
  `isrecommand` tinyint(10) NULL DEFAULT 0,
  `money` float(10, 2) NOT NULL DEFAULT 0.00,
  `education` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `express` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jobtype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dmoney` float(10, 2) NULL DEFAULT 0.00,
  `beginjobdate` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endjobdate` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `beginjobtime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `endjobtime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `workaddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `special`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_payjoblist
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_payjoblist`;
CREATE TABLE `ims_weixinmao_zp_payjoblist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` float(10, 2) NULL DEFAULT 0.00,
  `days` mediumint(10) NULL DEFAULT 0,
  `sort` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `indx_weid`(`uniacid`) USING BTREE,
  INDEX `indx_enabled`(`enabled`) USING BTREE,
  INDEX `indx_displayorder`(`sort`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_paytoplist
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_paytoplist`;
CREATE TABLE `ims_weixinmao_zp_paytoplist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` float(10, 2) NULL DEFAULT 0.00,
  `days` mediumint(10) NULL DEFAULT 0,
  `sort` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `indx_weid`(`uniacid`) USING BTREE,
  INDEX `indx_enabled`(`enabled`) USING BTREE,
  INDEX `indx_displayorder`(`sort`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_regmoney
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_regmoney`;
CREATE TABLE `ims_weixinmao_zp_regmoney`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '公众号id',
  `uid` int(10) NULL DEFAULT NULL,
  `jobname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jobtel` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `status` tinyint(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 124 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_regsub
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_regsub`;
CREATE TABLE `ims_weixinmao_zp_regsub`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '公众号id',
  `uid` int(10) NULL DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `status` tinyint(10) NULL DEFAULT 0,
  `date` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jobdate` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 122 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_sharerecord
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_sharerecord`;
CREATE TABLE `ims_weixinmao_zp_sharerecord`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '公众号id',
  `uid` int(10) NULL DEFAULT 0,
  `jobid` int(10) NULL DEFAULT 0,
  `companyid` int(10) NULL DEFAULT 0,
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `status` tinyint(10) NULL DEFAULT 0,
  `view` int(10) NULL DEFAULT 0,
  `sendnum` int(10) NULL DEFAULT 0,
  `usednum` int(10) NULL DEFAULT 0,
  `money` float(10, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 179 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_toplist
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_toplist`;
CREATE TABLE `ims_weixinmao_zp_toplist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT 0,
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` float(10, 2) NULL DEFAULT 0.00,
  `days` mediumint(10) NULL DEFAULT 0,
  `sort` int(11) NULL DEFAULT 0,
  `enabled` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `indx_weid`(`uniacid`) USING BTREE,
  INDEX `indx_enabled`(`enabled`) USING BTREE,
  INDEX `indx_displayorder`(`sort`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_weixinmao_zp_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `ims_weixinmao_zp_userinfo`;
CREATE TABLE `ims_weixinmao_zp_userinfo`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uniacid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '公众号id',
  `uid` int(10) NULL DEFAULT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `status` tinyint(10) NULL DEFAULT 0,
  `avatarUrl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `companyid` int(10) NULL DEFAULT 0,
  `agentid` int(11) NULL DEFAULT 0,
  `openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 116 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
