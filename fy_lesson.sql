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

 Date: 09/04/2019 18:22:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ims_fy_lesson_aliyun_upload
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_aliyun_upload`;
CREATE TABLE `ims_fy_lesson_aliyun_upload`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '公众号id',
  `uid` int(11) NULL DEFAULT NULL COMMENT '会员id',
  `teacherid` int(11) NULL DEFAULT NULL COMMENT '讲师id(讲师id为空表示后台上传)',
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `videoid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频ID',
  `object` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` decimal(10, 2) NULL DEFAULT NULL COMMENT '视频大小',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `teacherid`(`teacherid`) USING BTREE,
  INDEX `videoid`(`videoid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '阿里云点播存储' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_article
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_article`;
CREATE TABLE `ims_fy_lesson_article`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '公众号id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `author` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `linkurl` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原文链接',
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享图片',
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分享描述',
  `isshow` tinyint(1) NULL DEFAULT 1 COMMENT '前台展示 0.关闭 1.开启',
  `displayorder` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '排序 数值越大越靠前',
  `view` int(11) NOT NULL DEFAULT 0 COMMENT '访问量',
  `addtime` int(10) NULL DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_title`(`title`) USING BTREE,
  INDEX `idx_author`(`author`) USING BTREE,
  INDEX `idx_isshow`(`isshow`) USING BTREE,
  INDEX `idx_addtime`(`addtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_banner
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_banner`;
CREATE TABLE `ims_fy_lesson_banner`  (
  `banner_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号编号',
  `banner_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告位名称',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片路径',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片链接',
  `is_pc` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0.移动端 1.PC端',
  `is_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0.不显示 1.显示',
  `banner_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '图片类型 0.首页轮播图 1.底部课程广告',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `displayorder` int(4) NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`banner_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图片表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_blacklist
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_blacklist`;
CREATE TABLE `ims_fy_lesson_blacklist`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '公众号id',
  `uid` int(11) NULL DEFAULT NULL COMMENT '会员编号',
  `addtime` int(10) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_openid`(`uid`) USING BTREE,
  INDEX `idx_addtime`(`addtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '黑名单' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_fy_lesson_cashlog
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_cashlog`;
CREATE TABLE `ims_fy_lesson_cashlog`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `cash_type` tinyint(1) NOT NULL COMMENT '提现方式 1.管理员审核 2.自动到账',
  `cash_way` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1.提现到余额  2.提现到微信钱包 3.提现到支付宝',
  `pay_account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提现帐号',
  `uid` int(11) NULL DEFAULT NULL COMMENT '会员id',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '粉丝编号',
  `cash_num` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '提现金额',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态 0.待审核 1.提现成功 -1.审核未通过',
  `disposetime` int(10) NOT NULL DEFAULT 0 COMMENT '处理时间',
  `partner_trade_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户订单号',
  `payment_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信订单号',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '管理员备注',
  `lesson_type` tinyint(1) NOT NULL COMMENT '提现类型 1.分销佣金提现 2.课程收入提现',
  `addtime` int(10) NOT NULL COMMENT '申请时间',
  `pay_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '账号户主姓名',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_cash_type`(`cash_type`) USING BTREE,
  INDEX `idx_cash_way`(`cash_way`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_openid`(`openid`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_lesson_type`(`lesson_type`) USING BTREE,
  INDEX `idx_addtime`(`addtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '佣金提现' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_category
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_category`;
CREATE TABLE `ims_fy_lesson_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属帐号',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `parentid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID,0为第一级',
  `ico` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图标',
  `link` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义链接',
  `displayorder` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示在首页(仅对一级分类生效)',
  `addtime` int(10) NULL DEFAULT NULL COMMENT '添加时间',
  `is_hot` tinyint(1) NOT NULL DEFAULT 0 COMMENT '热门推荐 0.否 1.是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_code
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_code`;
CREATE TABLE `ims_fy_lesson_code`  (
  `code_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '公众号id',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码',
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '验证码',
  `is_use` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否使用 0.未使用 1.已使用',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`code_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '验证码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_collect
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_collect`;
CREATE TABLE `ims_fy_lesson_collect`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `outid` int(11) NOT NULL COMMENT '外部编号(课程编号或讲师编号)',
  `ctype` tinyint(1) NOT NULL COMMENT '收藏类型 1.课程 2.讲师',
  `addtime` int(10) NOT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_ctype`(`ctype`) USING BTREE,
  INDEX `idx_addtime`(`addtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收藏' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_fy_lesson_commission_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_commission_level`;
CREATE TABLE `ims_fy_lesson_commission_level`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `levelname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分销等级名称',
  `commission1` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '一级分销佣金比例',
  `commission2` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '二级分销佣金比例',
  `commission3` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '三级分销佣金比例',
  `updatemoney` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '升级条件(分销佣金满多少)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_levelname`(`levelname`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分销等级' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_commission_log
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_commission_log`;
CREATE TABLE `ims_fy_lesson_commission_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '公众号id',
  `orderid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单id',
  `uid` int(11) NULL DEFAULT NULL COMMENT '会员id',
  `nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `bookname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `change_num` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '变动数目',
  `grade` tinyint(1) NULL DEFAULT NULL COMMENT '佣金等级',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变动说明',
  `addtime` int(10) NULL DEFAULT NULL COMMENT '变动时间',
  `company_income` tinyint(1) NOT NULL DEFAULT 0 COMMENT '机构收入 0.否 1.是',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_orderid`(`orderid`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_nickname`(`nickname`) USING BTREE,
  INDEX `idx_bookname`(`bookname`) USING BTREE,
  INDEX `idx_grade`(`grade`) USING BTREE,
  INDEX `idx_addtime`(`addtime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '佣金日志' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ims_fy_lesson_commission_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_commission_setting`;
CREATE TABLE `ims_fy_lesson_commission_setting`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `vip_sale` tinyint(1) NULL DEFAULT 0 COMMENT 'VIP订单分销开关',
  `vipdesc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'vip服务描述',
  `sharelink` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '链接分享',
  `sharelesson` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '分享课程',
  `shareteacher` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '分享讲师',
  `is_sale` tinyint(1) NULL DEFAULT 0 COMMENT '分销功能 0.关闭 1.开启',
  `self_sale` tinyint(1) NULL DEFAULT 0 COMMENT '分销内购 0.关闭 1.开启',
  `sale_rank` tinyint(1) NULL DEFAULT 1 COMMENT '分销身份 1.任何人 2.VIP身份',
  `commission` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '默认课程佣金比例',
  `level` tinyint(1) NULL DEFAULT 3 COMMENT '分销等级',
  `cash_type` tinyint(1) NULL DEFAULT 1 COMMENT '提现处理方式 1.管理员审核 2.自动到账',
  `cash_way` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '提现方式',
  `cash_lower_vip` decimal(10, 2) NULL DEFAULT 1.00 COMMENT 'VIP提现最低额度 0.关闭',
  `mchid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信支付商户号',
  `mchkey` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信支付商户支付密钥',
  `serverIp` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器Ip',
  `agent_status` tinyint(1) NULL DEFAULT 1 COMMENT '分销商状态 0.关闭 1.开启 2.冻结',
  `agent_condition` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '分销商条件 1.消费金额满x元  2.消费订单满x笔  3.注册满x天',
  `sale_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '推广海报页面说明',
  `rec_income` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '直接推荐奖励',
  `addtime` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  `cash_lower_common` decimal(10, 2) NOT NULL DEFAULT 1.00 COMMENT '普通用户最低提现额度 0.为关闭',
  `cash_lower_teacher` decimal(10, 2) NOT NULL DEFAULT 1.00 COMMENT '讲师最低提现额度 0.关闭',
  `qrcode_cache` tinyint(1) NOT NULL DEFAULT 1 COMMENT '会员海报缓存 0.不缓存  1.缓存',
  `upgrade_condition` tinyint(1) NOT NULL DEFAULT 1 COMMENT '分销升级条件 1.累计佣金 2.支付订单额 3.支付订单笔数',
  `font` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '分享文字(以json格式保存)',
  `hidden_sale` tinyint(1) NOT NULL DEFAULT 0 COMMENT '隐藏前台分销按钮 0.否 1.是',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分销设置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_coupon`;
CREATE TABLE `ims_fy_lesson_coupon`  (
  `card_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `password` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠码密钥',
  `amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠码面值',
  `validity` int(10) NOT NULL COMMENT '有效期',
  `conditions` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '使用条件(满x元可用)',
  `is_use` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态 0.未使用 1.已使用',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `uid` int(11) NULL DEFAULT NULL COMMENT '会员编号',
  `ordersn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `use_time` int(10) NULL DEFAULT NULL COMMENT '使用时间',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`card_id`) USING BTREE,
  UNIQUE INDEX `idx_ordersn`(`ordersn`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_password`(`password`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_validity`(`validity`) USING BTREE,
  INDEX `idx_addtime`(`addtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10000001 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程优惠码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_discount
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_discount`;
CREATE TABLE `ims_fy_lesson_discount`  (
  `discount_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '公众号编号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '活动描述内容',
  `member_discount` tinyint(1) NOT NULL DEFAULT 0 COMMENT '同时享受会员折扣 0.否 1.是',
  `starttime` int(11) NULL DEFAULT NULL COMMENT '开始时间',
  `endtime` int(11) NULL DEFAULT NULL COMMENT '结束时间',
  `displayorder` int(4) NOT NULL DEFAULT 0 COMMENT '排序',
  `addtime` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`discount_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时折扣活动' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ims_fy_lesson_discount_lesson
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_discount_lesson`;
CREATE TABLE `ims_fy_lesson_discount_lesson`  (
  `discount_lesson_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '公众号编号',
  `discount_id` int(11) NULL DEFAULT NULL COMMENT '折扣活动编号',
  `lesson_id` int(11) NULL DEFAULT NULL COMMENT '课程编号',
  `discount` int(4) NULL DEFAULT 0 COMMENT '课程折扣 单位%',
  `member_discount` tinyint(1) NULL DEFAULT 0 COMMENT '同时享受会员折扣 0.否 1.是',
  `starttime` int(11) NOT NULL DEFAULT 0 COMMENT '开始时间',
  `endtime` int(11) NOT NULL DEFAULT 0 COMMENT '结束时间',
  `addtime` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`discount_lesson_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `discount_id`(`discount_id`) USING BTREE,
  INDEX `lesson_id`(`lesson_id`) USING BTREE,
  INDEX `starttime`(`starttime`) USING BTREE,
  INDEX `endtime`(`endtime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时折扣课程' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ims_fy_lesson_evaluate
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_evaluate`;
CREATE TABLE `ims_fy_lesson_evaluate`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `orderid` int(11) UNSIGNED NOT NULL COMMENT '订单id',
  `ordersn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `lessonid` int(11) NOT NULL COMMENT '课程id',
  `bookname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `teacherid` int(11) NULL DEFAULT NULL COMMENT '讲师id(与haoshu_teacher表的id字段对应)',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员昵称',
  `grade` tinyint(1) NOT NULL COMMENT '评价 1.好评 2.中评 3.差评',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评价内容',
  `reply` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评价回复',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '评论状态 -1.审核未通过 0.待审核 1.审核通过',
  `addtime` int(10) NOT NULL COMMENT '评价时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_orderid`(`orderid`) USING BTREE,
  INDEX `idx_ordersn`(`ordersn`) USING BTREE,
  INDEX `idx_lessonid`(`lessonid`) USING BTREE,
  INDEX `idx_bookname`(`bookname`) USING BTREE,
  INDEX `idx_teacherid`(`teacherid`) USING BTREE,
  INDEX `idx_grade`(`grade`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评价课程' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_history
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_history`;
CREATE TABLE `ims_fy_lesson_history`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `lessonid` int(11) NOT NULL COMMENT '课程id',
  `addtime` int(10) NOT NULL COMMENT '最后进入时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_addtime`(`addtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 88 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程足迹' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_fy_lesson_inform
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_inform`;
CREATE TABLE `ims_fy_lesson_inform`  (
  `inform_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '公众号id',
  `lesson_id` int(11) NULL DEFAULT NULL COMMENT '课程id',
  `book_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '模版消息内容(json格式保存)',
  `user_type` tinyint(1) NULL DEFAULT NULL COMMENT '用户类型 1.全部会员 2.VIP会员 3.购买过该讲师的会员',
  `inform_number` int(11) NULL DEFAULT NULL COMMENT '发送总量',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态 1.发送中 0.发送完毕',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`inform_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `lesson_id`(`lesson_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程通知主表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ims_fy_lesson_inform_fans
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_inform_fans`;
CREATE TABLE `ims_fy_lesson_inform_fans`  (
  `inform_fans_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '公众号id',
  `inform_id` int(11) NULL DEFAULT NULL COMMENT '通知id',
  `openid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '粉丝编号',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`inform_fans_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `inform_id`(`inform_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课程通知粉丝表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ims_fy_lesson_market
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_market`;
CREATE TABLE `ims_fy_lesson_market`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL,
  `deduct_switch` tinyint(1) NULL DEFAULT 0 COMMENT '积分抵扣开关',
  `deduct_money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '1积分抵扣金额',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `reg_give` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '注册赠送优惠券',
  `recommend` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '推荐下级赠送优惠券',
  `recommend_time` int(11) NOT NULL DEFAULT 0 COMMENT '最多可获取次数 0.不限制',
  `buy_lesson` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '购买课程赠送优惠券',
  `buy_lesson_time` int(11) NOT NULL DEFAULT 0 COMMENT '最多可获取次数 0.不限制',
  `share_lesson` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '分享课程赠送优惠券',
  `share_lesson_time` int(11) NOT NULL DEFAULT 0 COMMENT '最多可获取次数 0.不限制',
  `coupon_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '优惠券页面说明',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_mcoupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_mcoupon`;
CREATE TABLE `ims_fy_lesson_mcoupon`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '优惠券面值',
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' 优惠券封面图',
  `validity_type` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '有效期 1.固定有效期 2.自增有效期',
  `days1` int(11) NOT NULL COMMENT '固定有效期',
  `days2` int(11) NOT NULL COMMENT '自增有效期(天)',
  `conditions` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '使用条件 满x元可使用',
  `is_exchange` tinyint(1) NOT NULL DEFAULT 0 COMMENT '支持积分兑换 0.不支持 1.支持',
  `exchange_integral` int(11) NOT NULL COMMENT '每张优惠券兑换积分',
  `max_exchange` int(11) NOT NULL COMMENT '每位用户最大兑换数量',
  `total_exchange` int(11) NOT NULL COMMENT '总共优惠券张数',
  `already_exchange` int(11) NOT NULL COMMENT '已兑换数量',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '使用条件 指定分类课程使用 0.为全部课程',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态 0.下架 1.上架',
  `displayorder` int(4) NOT NULL DEFAULT 0 COMMENT '排序',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `receive_link` tinyint(1) NOT NULL DEFAULT 0 COMMENT '链接领取 0.不支持 1.支持',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_member
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_member`;
CREATE TABLE `ims_fy_lesson_member`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `studentno` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员号',
  `gohome` tinyint(1) NOT NULL DEFAULT 0 COMMENT '学员是否进群 0.未进群 1.已进群',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '粉丝标识',
  `parentid` int(11) NULL DEFAULT NULL COMMENT '推荐人id',
  `leaderunion` tinyint(1) NOT NULL DEFAULT 0 COMMENT '联合发起人身份 0.否 1.是',
  `nopay_commission` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '未结算佣金',
  `pay_commission` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '已结算佣金',
  `nopay_lesson` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '未提现课程收入',
  `pay_lesson` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '已提现课程收入',
  `vip` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否vip 0.否 1.是',
  `validity` bigint(11) NOT NULL DEFAULT 0 COMMENT 'vip有效期',
  `pastnotice` int(10) NOT NULL DEFAULT 0 COMMENT 'vip服务过期前最新通知时间',
  `agent_level` int(11) NOT NULL DEFAULT 0 COMMENT '分销代理级别',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '分销状态 0.冻结 1.开启',
  `uptime` int(10) NOT NULL COMMENT '更新时间',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `payment_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '购买订单总额',
  `payment_order` int(11) NOT NULL DEFAULT 0 COMMENT '购买订单笔数',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_openid`(`openid`) USING BTREE,
  INDEX `idx_parentid`(`parentid`) USING BTREE,
  INDEX `idx_vip`(`vip`) USING BTREE,
  INDEX `idx_validity`(`validity`) USING BTREE,
  INDEX `idx_pastnotice`(`pastnotice`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_addtime`(`addtime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 152 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ims_fy_lesson_member_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_member_coupon`;
CREATE TABLE `ims_fy_lesson_member_coupon`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL COMMENT '会员id',
  `amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '优惠券面值',
  `conditions` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '使用条件',
  `validity` int(11) NULL DEFAULT NULL COMMENT '有效期',
  `category_id` int(11) NOT NULL COMMENT '指定分类课程可用',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠券密码(优惠码转换过来的)',
  `ordersn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用订单号',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态 -1.已过期 0.未使用 1.已使用',
  `source` tinyint(1) NOT NULL COMMENT '来源 1.优惠码转换 2.购买课程赠送 3.邀请下级成员赠送 4.分享课程赠送 5.积分兑换',
  `coupon_id` int(11) NULL DEFAULT NULL COMMENT '优惠券id(兑换)',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `validity`(`validity`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `source`(`source`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员优惠券' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_member_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_member_order`;
CREATE TABLE `ims_fy_lesson_member_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `acid` int(11) NULL DEFAULT 0,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `ordersn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `level_id` int(11) NOT NULL COMMENT 'vip会员等级id(与fy_lesson_vip_level表id对应)',
  `level_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'VIP等级名称',
  `viptime` decimal(10, 2) NULL DEFAULT NULL COMMENT '会员服务时间',
  `vipmoney` decimal(10, 2) NOT NULL COMMENT '会员服务价格',
  `paytype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '支付方式',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '订单状态 0.未支付 1.已支付',
  `paytime` int(10) NULL DEFAULT 0 COMMENT '订单支付时间',
  `member1` int(11) NOT NULL COMMENT '一级代理会员id',
  `commission1` decimal(10, 2) NOT NULL COMMENT '一级代理佣金',
  `member2` int(11) NOT NULL COMMENT '二级代理会员id',
  `commission2` decimal(10, 2) NOT NULL COMMENT '二级代理佣金',
  `member3` int(11) NOT NULL COMMENT '三级代理会员id',
  `commission3` decimal(10, 2) NOT NULL COMMENT '三级代理佣金',
  `refer_id` int(11) NULL DEFAULT NULL COMMENT '充值卡id(与vip卡的id对应)',
  `addtime` int(10) NOT NULL COMMENT '订单添加时间',
  `update_time` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `integral` int(11) NOT NULL DEFAULT 0 COMMENT '赠送积分',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_paytype`(`paytype`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_refer_id`(`refer_id`) USING BTREE,
  INDEX `idx_addtime`(`addtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'VIP订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_member_recommend
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_member_recommend`;
CREATE TABLE `ims_fy_lesson_member_recommend`  (
  `recommend_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号编号',
  `unionid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员unionid',
  `parentid` int(11) NOT NULL COMMENT '推荐人编号',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `uid` int(11) NULL DEFAULT NULL COMMENT '会员id',
  PRIMARY KEY (`recommend_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '推荐会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_member_vip
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_member_vip`;
CREATE TABLE `ims_fy_lesson_member_vip`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `level_id` int(11) NULL DEFAULT NULL COMMENT 'vip等级id',
  `validity` int(11) NULL DEFAULT NULL COMMENT '有效期',
  `discount` int(4) NULL DEFAULT 100 COMMENT '折扣',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `level_id`(`level_id`) USING BTREE,
  INDEX `validity`(`validity`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已购买VIP' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_fy_lesson_order
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_order`;
CREATE TABLE `ims_fy_lesson_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `acid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `ordersn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `lessonid` int(11) NOT NULL COMMENT '课程id',
  `bookname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `marketprice` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '原价',
  `coupon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程优惠码',
  `coupon_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠码面值',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '课程价格',
  `spec_day` int(4) NULL DEFAULT NULL COMMENT '课程规格(多少天内有效)',
  `teacherid` int(11) NULL DEFAULT NULL COMMENT '讲师id(与haoshu_teacher表的id字段对应)',
  `teacher_income` tinyint(3) NOT NULL DEFAULT 0 COMMENT '讲师收入(课程价格分成%)',
  `integral` int(4) NOT NULL DEFAULT 0 COMMENT '赠送积分',
  `deduct_integral` int(11) NOT NULL DEFAULT 0 COMMENT '积分抵扣数量',
  `paytype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '支付方式',
  `paytime` int(10) NOT NULL DEFAULT 0 COMMENT '支付时间',
  `validity` int(11) NOT NULL DEFAULT 0 COMMENT '有效期 在有效期内可观看学习课程',
  `member1` int(11) NOT NULL DEFAULT 0 COMMENT '一级代理会员id',
  `commission1` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '一级佣金',
  `member2` int(11) NOT NULL DEFAULT 0 COMMENT '二级代理会员id',
  `commission2` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '二级佣金',
  `member3` int(11) NOT NULL DEFAULT 0 COMMENT '三级代理会员id',
  `commission3` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '三级佣金',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '订单状态 -1.已取消 0.未支付 1.已支付 2.已评价',
  `addtime` int(10) NULL DEFAULT NULL COMMENT '下单时间',
  `lesson_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '课程类型 0.普通课程  1.预约课程',
  `appoint_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '预约信息(json格式保存)',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `company_uid` int(11) NOT NULL DEFAULT 0 COMMENT '机构uid',
  `company_income` tinyint(3) NOT NULL DEFAULT 0 COMMENT '机构收入(课程价格分成%)',
  `spec_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程规格名称',
  `order_cdkey` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '核销密码',
  `is_verify` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0.未核销 1.已核销(报名课程线下核销使用)',
  `verify_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '核销信息(核销人、核销时间)',
  `give_uid` int(11) NULL DEFAULT NULL COMMENT '转赠会员id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_acid`(`acid`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_ordersn`(`ordersn`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_lessonid`(`lessonid`) USING BTREE,
  INDEX `idx_bookname`(`bookname`) USING BTREE,
  INDEX `idx_teacherid`(`teacherid`) USING BTREE,
  INDEX `idx_paytype`(`paytype`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_addtime`(`addtime`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1000010020 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程订单' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ims_fy_lesson_parent
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_parent`;
CREATE TABLE `ims_fy_lesson_parent`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号ID',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父分类id',
  `cid` int(11) NOT NULL COMMENT '分类ID',
  `bookname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名称',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '课程价格',
  `isdiscount` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否开启该课程折扣',
  `vipdiscount` int(3) NOT NULL DEFAULT 0 COMMENT 'vip会员折扣',
  `integral` int(11) NOT NULL DEFAULT 0 COMMENT '购买赠送积分',
  `deduct_integral` int(11) NOT NULL DEFAULT 0 COMMENT '积分最多抵扣数量',
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程封图',
  `poster` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '视频播放封面图',
  `descript` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '课程介绍',
  `difficulty` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程难度',
  `stock` int(11) NOT NULL COMMENT '库存',
  `buynum` int(11) NOT NULL DEFAULT 0 COMMENT '正常购买人数',
  `virtual_buynum` int(11) NOT NULL DEFAULT 0 COMMENT '虚拟购买人数',
  `score` decimal(5, 2) NOT NULL COMMENT '课程好评率',
  `teacherid` int(11) NOT NULL COMMENT '主讲老师id',
  `commission` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '佣金比例',
  `displayorder` int(4) NOT NULL DEFAULT 0 COMMENT '课程排序',
  `status` tinyint(1) NOT NULL COMMENT '课程状态 -1.暂停销售 0.下架 1.上架 2.审核中',
  `recommendid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推荐板块id',
  `vipview` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '免费学习的VIP等级集合',
  `teacher_income` tinyint(3) NOT NULL DEFAULT 0 COMMENT '讲师分成%',
  `link` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自定义链接',
  `validity` int(11) NOT NULL DEFAULT 0 COMMENT '有效期 即购买时起多少天内有效',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  `share` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '分享信息',
  `support_coupon` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否支持优惠券抵扣 0.不支持 1.支持',
  `integral_rate` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '赠送积分比例',
  `visit_number` int(11) NOT NULL DEFAULT 0 COMMENT '访问人数',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '章节最后更新时间',
  `ico_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程标识',
  `lesson_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '课程类型 0.普通课程  1.预约课程',
  `buynow_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '立即购买信息(json格式保存)',
  `section_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '连载状态 0.更新中 1.已完结',
  `company_income` tinyint(3) NOT NULL DEFAULT 0 COMMENT '机构分成%',
  `appoint_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '预约报名信息(json格式保存)',
  `saler_uids` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '报名课程核销人员uid(以json格式存储)',
  `poster_config` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '课程海报配置',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_cid`(`cid`) USING BTREE,
  INDEX `idx_bookname`(`bookname`) USING BTREE,
  INDEX `idx_teacherid`(`teacherid`) USING BTREE,
  INDEX `idx_displayorder`(`displayorder`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_recommendid`(`recommendid`) USING BTREE,
  INDEX `idx_addtime`(`addtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_playrecord
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_playrecord`;
CREATE TABLE `ims_fy_lesson_playrecord`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '公众号id',
  `uid` int(11) NULL DEFAULT NULL COMMENT '会员id',
  `lessonid` int(11) NULL DEFAULT NULL COMMENT '课程id',
  `sectionid` int(11) NULL DEFAULT NULL COMMENT '章节id',
  `playtime` int(11) NOT NULL DEFAULT 0 COMMENT '上次播放时间 单位：秒',
  `addtime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_addtime`(`addtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '播放记录' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_fy_lesson_qcloud_upload
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_qcloud_upload`;
CREATE TABLE `ims_fy_lesson_qcloud_upload`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '公众号id',
  `uid` int(11) NULL DEFAULT NULL COMMENT '会员id',
  `teacherid` int(11) NULL DEFAULT NULL COMMENT '讲师id(讲师id为空表示后台上传)',
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `com_name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '完整文件名',
  `sys_link` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原始链接',
  `size` decimal(10, 2) NULL DEFAULT NULL COMMENT '视频大小',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `teacherid`(`teacherid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '腾讯云存储文件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_qcloudvod_upload
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_qcloudvod_upload`;
CREATE TABLE `ims_fy_lesson_qcloudvod_upload`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '公众号id',
  `uid` int(11) NULL DEFAULT NULL COMMENT '会员id',
  `teacherid` int(11) NULL DEFAULT NULL COMMENT '讲师id(讲师id为空表示后台上传)',
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `videoid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频ID',
  `videourl` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频原始地址',
  `size` decimal(10, 2) NULL DEFAULT NULL COMMENT '视频大小',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `teacherid`(`teacherid`) USING BTREE,
  INDEX `videoid`(`videoid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '腾讯云点播存储' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_qiniu_upload
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_qiniu_upload`;
CREATE TABLE `ims_fy_lesson_qiniu_upload`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `uid` int(11) NULL DEFAULT NULL COMMENT '会员编号',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '粉丝编号',
  `teacher` int(11) NULL DEFAULT NULL COMMENT '讲师编号',
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `com_name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '完成文件名',
  `qiniu_url` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件链接',
  `size` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  `addtime` int(10) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_teacher`(`teacher`) USING BTREE,
  INDEX `idx_name`(`name`(333)) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '七牛上传记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_recommend
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_recommend`;
CREATE TABLE `ims_fy_lesson_recommend`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `rec_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块名称',
  `show_style` tinyint(1) NOT NULL DEFAULT 1 COMMENT '显示样式 1.单课程模式 2.课程+专题模式 3.专题模式',
  `displayorder` int(4) NULL DEFAULT NULL COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否显示',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  `limit_number` int(4) NOT NULL DEFAULT 6 COMMENT '首页显示数量',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_is_show`(`is_show`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '推荐板块' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_setting
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_setting`;
CREATE TABLE `ims_fy_lesson_setting`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'app端logo',
  `manageopenid` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '新订单提醒(管理员)',
  `sitename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `copyright` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '版权',
  `closespace` int(4) NOT NULL DEFAULT 60 COMMENT '关闭未付款订单时间间隔',
  `closelast` int(10) NOT NULL DEFAULT 0 COMMENT '上次执行关闭未付款订单时间',
  `savetype` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0.其他存储方式 1.七牛云存储 2.腾讯云存储',
  `qiniu` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '七牛云存储参数',
  `qcloud` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '腾讯云存储',
  `isfollow` tinyint(1) NOT NULL DEFAULT 0 COMMENT '引导关注公众号 0.关闭 1.开启',
  `qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公众号二维码',
  `mustinfo` tinyint(1) NOT NULL DEFAULT 0 COMMENT '下单前必须完善手机号码和姓名',
  `user_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '填写选项(以json格式保存)',
  `mobilechange` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开启修改手机链接 0.关闭 1.开启',
  `autogood` int(4) NOT NULL DEFAULT 0 COMMENT '超时自动好评 默认0为关闭',
  `posterbg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '推广海报背景图',
  `teacherlist` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0.不显示 1.讲师列表  2.VIP会员  3.优惠券中心',
  `category_ico` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所有分类图标',
  `self_diy` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '个人中心自定义栏目',
  `stock_config` tinyint(1) NULL DEFAULT 0 COMMENT '是否启用库存 0.否 1.是',
  `video_player` tinyint(1) NOT NULL DEFAULT 0 COMMENT '视频播放器 0.默认 1.ckPlay',
  `lesson_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '课程详情页默认显示',
  `follow_word` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '引导关注提示语',
  `audit_evaluate` tinyint(1) NOT NULL DEFAULT 0 COMMENT '课程评价是否需要审核  0.否 1.是',
  `visit_limit` tinyint(1) NOT NULL DEFAULT 0 COMMENT '非微信端访问 0.不允许 1.允许',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  `login_visit` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '需要登录访问的控制器',
  `poster_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '推广海报样式 1.直接进入微课堂  2.直接进入公众号',
  `show_newlesson` tinyint(2) NOT NULL DEFAULT 0 COMMENT '首页显示最新课程数量',
  `lesson_follow_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程页强制关注标题',
  `lesson_follow_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程页强制关注描述',
  `sale_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '推广海报页面说明',
  `dayu_sms` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '大于短信配置信息',
  `modify_mobile` tinyint(1) NOT NULL DEFAULT 0 COMMENT '修改手机号码',
  `poster_config` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '海报参数设置',
  `qun_service` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '加群客服人员',
  `index_verify` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '首页验证绑定选项',
  `search_box` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '首页搜索框',
  `show_teacher_income` tinyint(1) NOT NULL DEFAULT 1 COMMENT '后台发布课程显示讲师分成',
  `company_income` tinyint(1) NOT NULL DEFAULT 0 COMMENT '机构分成 0.关闭 1.开启',
  `appoint_mustinfo` tinyint(1) NOT NULL DEFAULT 0 COMMENT '报名课程需完善会员信息  0.否 1.是',
  `aliyun` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '阿里云点播参数',
  `qcloudvod` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '腾讯云点播参数',
  `common` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公共设置',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '基本设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_son
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_son`;
CREATE TABLE `ims_fy_lesson_son`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `parentid` int(11) NOT NULL COMMENT '课程关联id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '章节名称',
  `savetype` tinyint(1) NOT NULL COMMENT '存储方式 0.其他存储 1.七牛存储 2.内嵌播放代码模式',
  `sectiontype` tinyint(1) NOT NULL DEFAULT 1 COMMENT '章节类型 1.视频章节 2.图文章节',
  `videourl` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '章节视频url',
  `videotime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '视频时长',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '章节内容',
  `displayorder` int(4) NOT NULL DEFAULT 0,
  `is_free` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为试听章节 0.否 1.是',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否显示 0.隐藏 1.显示',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  `auto_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '自动上架 0.关闭 1.开启',
  `show_time` int(11) NOT NULL DEFAULT 0 COMMENT '自动上架时间',
  `test_time` int(4) NOT NULL DEFAULT 0 COMMENT '试听时间(单位:秒，0为关闭)',
  `images` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '章节封面图',
  `title_id` int(11) NOT NULL DEFAULT 0 COMMENT '目录ID(与课程目录表title_id对应)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_parentid`(`parentid`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程章节' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_spec
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_spec`;
CREATE TABLE `ims_fy_lesson_spec`  (
  `spec_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `lessonid` int(11) NOT NULL COMMENT '课程id',
  `spec_day` int(11) NULL DEFAULT NULL COMMENT '有效期(天)',
  `spec_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '规格价格',
  `spec_stock` int(11) NULL DEFAULT NULL COMMENT '库存',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `spec_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规格名称',
  `spec_sort` int(3) NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`spec_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程规格' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_static
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_static`;
CREATE TABLE `ims_fy_lesson_static`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `lessonOrder_num` int(11) NOT NULL DEFAULT 0 COMMENT '课程订单总量',
  `lessonOrder_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '课程订单总额',
  `vipOrder_num` int(11) NOT NULL DEFAULT 0 COMMENT 'vip订单总量',
  `vipOrder_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT 'VIP订单总额',
  `static_time` int(11) NOT NULL COMMENT '统计日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '财务统计' ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for ims_fy_lesson_syslog
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_syslog`;
CREATE TABLE `ims_fy_lesson_syslog`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '公众号id',
  `admin_uid` int(11) NULL DEFAULT NULL COMMENT '管理员id',
  `admin_username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员昵称',
  `log_type` tinyint(1) NULL DEFAULT NULL COMMENT '操作类型 1.增加 2.删除 3更新',
  `function` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作的功能',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作描述',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作IP地址',
  `addtime` int(10) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_admin_uid`(`admin_uid`) USING BTREE,
  INDEX `idx_log_type`(`log_type`) USING BTREE,
  INDEX `idx_function`(`function`) USING BTREE,
  INDEX `idx_addtime`(`addtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 122 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_teacher
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_teacher`;
CREATE TABLE `ims_fy_lesson_teacher`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '会员id',
  `account` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '讲师登录帐号',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '讲师登录密码',
  `teacher` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '讲师名称',
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '讲师QQ',
  `qqgroup` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '讲师QQ群',
  `qqgroupLink` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ群加群链接',
  `weixin_qrcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_letter` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '讲师名称首字母拼音',
  `teacherdes` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '讲师介绍',
  `teacherphoto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '讲师相片',
  `status` tinyint(1) NOT NULL DEFAULT 2 COMMENT '讲师状态 -1.审核不通过 1.正常 2.审核中',
  `upload` tinyint(1) NOT NULL DEFAULT 1 COMMENT '上传权限 0.禁止 1.允许',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `displayorder` int(4) NOT NULL DEFAULT 0 COMMENT '排序',
  `teacher_income` tinyint(2) NOT NULL DEFAULT 0 COMMENT '讲师分成(单位%)',
  `company_uid` int(11) NOT NULL DEFAULT 0 COMMENT '机构uid',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_account`(`account`) USING BTREE,
  INDEX `idx_status`(`status`) USING BTREE,
  INDEX `idx_upload`(`upload`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '讲师信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_teacher_income
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_teacher_income`;
CREATE TABLE `ims_fy_lesson_teacher_income`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NULL DEFAULT NULL COMMENT '公众号id',
  `uid` int(11) NULL DEFAULT NULL COMMENT '会员id',
  `teacher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '讲师名称',
  `ordersn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `bookname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程名称',
  `orderprice` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '订单价格',
  `teacher_income` tinyint(3) NULL DEFAULT NULL COMMENT '讲师分成',
  `income_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '讲师实际收入',
  `addtime` int(10) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_teacher`(`teacher`) USING BTREE,
  INDEX `idx_ordersn`(`ordersn`) USING BTREE,
  INDEX `idx_bookname`(`bookname`) USING BTREE,
  INDEX `idx_addtime`(`addtime`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '讲师收入' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_title
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_title`;
CREATE TABLE `ims_fy_lesson_title`  (
  `title_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目录名称',
  `lesson_id` int(11) NOT NULL COMMENT '课程id',
  `displayorder` int(4) NULL DEFAULT 0 COMMENT '排序',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`title_id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE,
  INDEX `lesson_id`(`lesson_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程目录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_tplmessage
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_tplmessage`;
CREATE TABLE `ims_fy_lesson_tplmessage`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `buysucc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户购买成功通知',
  `cnotice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '佣金提醒',
  `newjoin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下级代理商加入提醒',
  `newlesson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程通知',
  `neworder` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单通知(管理员)',
  `newcash` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提现申请通知(管理员)',
  `apply_teacher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请讲师入驻审核通知',
  `receive_coupon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠券到账通知',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `buysucc_format` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '购买成功模版消息格式',
  `cnotice_format` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '佣金提醒模版消息格式',
  `newjoin_format` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '下级代理商加入模版消息格式',
  `neworder_format` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '订单通知(管理员)模版消息格式',
  `newcash_format` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '提现申请通知模版消息格式',
  `apply_teacher_format` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '讲师申请通知模版消息格式',
  `receive_coupon_format` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '优惠券到账模版消息格式',
  `teacher_notice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '讲师申请结果通知',
  `teacher_notice_format` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '讲师申请结果通知模版消息格式',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniacid`(`uniacid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模版消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_vip_level
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_vip_level`;
CREATE TABLE `ims_fy_lesson_vip_level`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) UNSIGNED NOT NULL COMMENT '公众号id',
  `level_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'vip等级名称',
  `level_validity` int(11) NULL DEFAULT NULL COMMENT '有效期',
  `level_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `discount` int(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '购买课程折扣 0.没有折扣',
  `sort` int(4) NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '显示状态 0.隐藏  1.显示',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `integral` int(11) NOT NULL DEFAULT 0 COMMENT '赠送积分',
  `commission` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '佣金比例',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_is_show`(`is_show`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'VIP等级' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ims_fy_lesson_vipcard
-- ----------------------------
DROP TABLE IF EXISTS `ims_fy_lesson_vipcard`;
CREATE TABLE `ims_fy_lesson_vipcard`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL COMMENT '公众号id',
  `card_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卡号',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务卡密码',
  `level_id` int(11) NOT NULL COMMENT 'VIP等级ID',
  `viptime` decimal(10, 2) NULL DEFAULT NULL COMMENT '服务卡时长',
  `is_use` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态 0.未使用 1.已使用',
  `nickname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `uid` int(11) NULL DEFAULT NULL COMMENT '会员id',
  `ordersn` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用订单编号(对应vip订单表的ordersn)',
  `use_time` int(10) NULL DEFAULT NULL COMMENT '使用时间',
  `validity` int(10) NULL DEFAULT NULL COMMENT '有效期',
  `addtime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uniacid`(`uniacid`) USING BTREE,
  INDEX `idx_card_id`(`card_id`) USING BTREE,
  INDEX `idx_is_use`(`is_use`) USING BTREE,
  INDEX `idx_uid`(`uid`) USING BTREE,
  INDEX `idx_nickname`(`nickname`) USING BTREE,
  INDEX `idx_ordersn`(`ordersn`) USING BTREE,
  INDEX `idx_validity`(`validity`) USING BTREE,
  INDEX `idx_use_time`(`use_time`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 501 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'VIP服务卡' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
