/*
 Navicat Premium Data Transfer

 Source Server         : 本地MySQL
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : community

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 14/12/2021 04:04:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for building
-- ----------------------------
DROP TABLE IF EXISTS `building`;
CREATE TABLE `building`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `numbers` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uints` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of building
-- ----------------------------
INSERT INTO `building` VALUES (1, '16栋', '1单元', '无1');
INSERT INTO `building` VALUES (7, '17栋', '2单元', '无1');
INSERT INTO `building` VALUES (11, '18栋', '2单元', '无');

-- ----------------------------
-- Table structure for carcharge
-- ----------------------------
DROP TABLE IF EXISTS `carcharge`;
CREATE TABLE `carcharge`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `pay_date` datetime(0) NULL DEFAULT NULL,
  `end_date` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money` double(10, 2) NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL,
  `owner_id` int(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收费类型',
  `park_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carcharge
-- ----------------------------
INSERT INTO `carcharge` VALUES (2, '2020-09-30 16:00:00', '2020-12-31', 1200.00, 1, 1, '221', '停车费', 1);
INSERT INTO `carcharge` VALUES (3, '2020-09-30 16:00:00', '2020-12-31', 1200.00, 1, 2, '221', '停车费', 2);
INSERT INTO `carcharge` VALUES (8, '2020-10-31 16:00:00', '2020-11-30', 300.00, 0, 1, '112', '停车费', 1);

-- ----------------------------
-- Table structure for clockin
-- ----------------------------
DROP TABLE IF EXISTS `clockin`;
CREATE TABLE `clockin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `clock_in_time` datetime(0) NULL DEFAULT NULL,
  `owner_id` int(0) NULL DEFAULT NULL,
  `house_id` int(0) NULL DEFAULT NULL,
  `building_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clockin
-- ----------------------------
INSERT INTO `clockin` VALUES (1, '2021-04-01 02:42:55', 1, 1, 1);
INSERT INTO `clockin` VALUES (4, '2021-04-20 14:59:13', 2, 2, 7);
INSERT INTO `clockin` VALUES (11, '2021-04-25 07:22:02', 1, 1, 1);
INSERT INTO `clockin` VALUES (12, '2021-04-26 07:22:29', 2, 2, 7);
INSERT INTO `clockin` VALUES (14, '2021-04-27 07:34:24', 1, 1, 1);
INSERT INTO `clockin` VALUES (15, '2021-04-27 07:35:23', 2, 2, 7);

-- ----------------------------
-- Table structure for clockinnew
-- ----------------------------
DROP TABLE IF EXISTS `clockinnew`;
CREATE TABLE `clockinnew`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `report_date` datetime(0) NULL DEFAULT NULL,
  `owner_id` int(0) NULL DEFAULT NULL,
  `type1` int(0) NULL DEFAULT NULL COMMENT '是否为疑似病例如咳嗽，发热（0或1）',
  `type2` int(0) NULL DEFAULT NULL COMMENT '是否确诊为肺炎病例',
  `today_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clockinnew
-- ----------------------------
INSERT INTO `clockinnew` VALUES (1, '2021-04-26 13:20:32', 2, 0, 0, '江西省南昌市御景花园小区16栋1单元601', '无');
INSERT INTO `clockinnew` VALUES (3, '2021-04-25 14:34:06', 2, 0, 0, '江西省南昌市御景花园小区16栋1单元601', '无');
INSERT INTO `clockinnew` VALUES (6, '2021-04-26 16:00:00', 2, 0, 0, '测试', '');
INSERT INTO `clockinnew` VALUES (16, '2021-04-27 16:00:00', 2, 0, 0, '测试', '无');
INSERT INTO `clockinnew` VALUES (17, '2021-04-27 16:00:00', 1, 1, 0, '测试', 'v二十');

-- ----------------------------
-- Table structure for complaint
-- ----------------------------
DROP TABLE IF EXISTS `complaint`;
CREATE TABLE `complaint`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `com_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `com_date` datetime(0) NULL DEFAULT NULL,
  `handle_date` datetime(0) NULL DEFAULT NULL,
  `owner_id` int(0) NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL,
  `clr` int(0) NULL DEFAULT NULL COMMENT '处理人',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of complaint
-- ----------------------------
INSERT INTO `complaint` VALUES (1, '1', '2020-11-22 11:47:46', NULL, 1, 1, NULL, '垃圾经常乱放');
INSERT INTO `complaint` VALUES (2, '2', '2020-11-17 11:48:15', '2020-11-21 11:48:21', 1, 1, 111, '绿植被拔了');
INSERT INTO `complaint` VALUES (4, '1', '2020-11-24 14:21:01', NULL, 2, 0, NULL, '垃圾乱放没解决');

-- ----------------------------
-- Table structure for complaint_type
-- ----------------------------
DROP TABLE IF EXISTS `complaint_type`;
CREATE TABLE `complaint_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of complaint_type
-- ----------------------------
INSERT INTO `complaint_type` VALUES (1, '垃圾乱放', NULL, NULL);
INSERT INTO `complaint_type` VALUES (2, '绿植太差', NULL, NULL);

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `storey` int(0) NULL DEFAULT NULL,
  `numbers` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL,
  `into_date` datetime(0) NULL DEFAULT NULL,
  `building_id` int(0) NULL DEFAULT NULL,
  `remarks` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area` double(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES (1, NULL, '401', 1, '2020-10-01 09:27:52', 1, NULL, 80.00);
INSERT INTO `house` VALUES (2, NULL, '402', 1, '2020-11-04 16:00:00', 7, '', 90.00);
INSERT INTO `house` VALUES (3, NULL, '201', 1, '2020-11-17 15:52:58', 1, NULL, 100.00);
INSERT INTO `house` VALUES (4, NULL, '602', 1, '2021-05-05 16:00:00', 11, '', 98.00);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `content` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fbdate` datetime(0) NULL DEFAULT NULL,
  `fbr` int(0) NULL DEFAULT NULL,
  `remarks` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for owner
-- ----------------------------
DROP TABLE IF EXISTS `owner`;
CREATE TABLE `owner`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `identity` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `house_id` int(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(28) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of owner
-- ----------------------------
INSERT INTO `owner` VALUES (1, 'marry', '15270892323', '女', '433123456787', 1, NULL, '123456');
INSERT INTO `owner` VALUES (2, 'cuijianhui', '13767134678', '男', '433123456788', 2, NULL, '123456');
INSERT INTO `owner` VALUES (9, 'test', '15270839876', '男', '587968932', 4, '', '123456');
INSERT INTO `owner` VALUES (14, 'test02', '18848848551', '男', '123456789456', 1, '111111', '123456');

-- ----------------------------
-- Table structure for parking
-- ----------------------------
DROP TABLE IF EXISTS `parking`;
CREATE TABLE `parking`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `numbers` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL,
  `owner_id` int(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of parking
-- ----------------------------
INSERT INTO `parking` VALUES (1, 'A10001', 1, 1, '');
INSERT INTO `parking` VALUES (2, 'A10002', 1, 2, '');

-- ----------------------------
-- Table structure for property_info
-- ----------------------------
DROP TABLE IF EXISTS `property_info`;
CREATE TABLE `property_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `type_id` int(0) NULL DEFAULT NULL,
  `money` double(10, 2) NULL DEFAULT NULL,
  `start_date` datetime(0) NULL DEFAULT NULL,
  `end_date` datetime(0) NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL,
  `house_id` int(0) NULL DEFAULT NULL,
  `remarks` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of property_info
-- ----------------------------
INSERT INTO `property_info` VALUES (1, 2, 900.00, '2020-10-01 09:28:11', '2020-12-29 16:00:00', 1, 1, '啊水水');
INSERT INTO `property_info` VALUES (4, 1, 208.00, '2020-09-30 16:00:00', '2020-12-30 16:00:00', 1, 1, '物业费');
INSERT INTO `property_info` VALUES (5, 3, 100.00, '2020-11-13 16:00:00', '2020-11-13 16:00:00', 1, 1, 'wu ');
INSERT INTO `property_info` VALUES (7, 2, 450.00, '2020-11-29 16:00:00', '2020-11-19 16:00:00', 0, 3, 'ceshi');
INSERT INTO `property_info` VALUES (23, 1, 208.00, '2020-09-30 16:00:00', '2020-12-30 16:00:00', 0, 1, 'ceshi');
INSERT INTO `property_info` VALUES (24, 1, 234.00, '2020-09-30 16:00:00', '2020-12-30 16:00:00', 0, 2, 'ceshi');
INSERT INTO `property_info` VALUES (25, 1, 260.00, '2020-09-30 16:00:00', '2020-12-30 16:00:00', 1, 3, 'ceshi');
INSERT INTO `property_info` VALUES (26, 3, 190.00, '2021-04-19 16:00:00', '2021-04-19 16:00:00', 0, 3, 'xxxxx');
INSERT INTO `property_info` VALUES (27, 3, 61.50, '2021-05-05 16:00:00', '2021-05-05 16:00:00', 0, 4, '');

-- ----------------------------
-- Table structure for property_type
-- ----------------------------
DROP TABLE IF EXISTS `property_type`;
CREATE TABLE `property_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double(10, 2) NULL DEFAULT NULL,
  `unit` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of property_type
-- ----------------------------
INSERT INTO `property_type` VALUES (1, '物业费', 2.60, '一平方', NULL);
INSERT INTO `property_type` VALUES (2, '水费', 4.50, '一吨', NULL);
INSERT INTO `property_type` VALUES (3, '电费', 0.50, '一度', NULL);
INSERT INTO `property_type` VALUES (4, '车位费', 260.00, '一个', NULL);

-- ----------------------------
-- Table structure for records
-- ----------------------------
DROP TABLE IF EXISTS `records`;
CREATE TABLE `records`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `type_id` int(0) NULL DEFAULT NULL,
  `num` double(5, 2) NULL DEFAULT NULL,
  `num2` double(5, 2) NULL DEFAULT NULL,
  `house_id` int(0) NULL DEFAULT NULL,
  `up_time` datetime(0) NULL DEFAULT NULL,
  `on_time` datetime(0) NULL DEFAULT NULL,
  `check_time` datetime(0) NULL DEFAULT NULL,
  `meter` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of records
-- ----------------------------
INSERT INTO `records` VALUES (1, 2, 200.00, 300.00, 1, '2020-10-01 09:28:11', '2020-11-06 09:28:16', '2020-11-12 09:28:23', '张三', '无');
INSERT INTO `records` VALUES (2, 2, 100.00, 200.00, 1, '2020-09-23 10:34:48', '2020-10-31 10:34:57', '2020-10-30 10:35:05', 'yx', '');
INSERT INTO `records` VALUES (9, 3, 0.00, 123.00, 4, '2021-05-05 16:00:00', '2021-05-05 16:00:00', '2021-05-06 13:48:56', 'zhangsan', '');

-- ----------------------------
-- Table structure for repair
-- ----------------------------
DROP TABLE IF EXISTS `repair`;
CREATE TABLE `repair`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `com_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `com_date` datetime(0) NULL DEFAULT NULL,
  `handle_date` datetime(0) NULL DEFAULT NULL,
  `owner_id` int(0) NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL,
  `clr` int(0) NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of repair
-- ----------------------------
INSERT INTO `repair` VALUES (1, '1', '2020-11-19 11:47:37', '2020-11-21 11:47:41', 1, 1, 1, '11');
INSERT INTO `repair` VALUES (2, '1', '2020-11-18 11:48:02', '2020-11-27 11:48:06', 1, 0, 1, '11');
INSERT INTO `repair` VALUES (3, '2', '2020-11-10 11:48:45', '2020-11-27 11:48:48', 1, 1, 1, '11');
INSERT INTO `repair` VALUES (4, '3', '2020-11-11 14:56:31', '2020-11-27 14:56:35', 1, 0, 1, '22');
INSERT INTO `repair` VALUES (6, '3', '2020-11-11 14:56:31', '2020-11-22 06:14:52', 1, 0, 1, '22');
INSERT INTO `repair` VALUES (7, '3', '2020-11-11 14:56:31', '2020-11-27 14:56:35', 1, 1, 1, '22');
INSERT INTO `repair` VALUES (8, '4', '2020-11-23 10:00:07', '2020-11-25 10:00:13', 1, 1, 1, '33');
INSERT INTO `repair` VALUES (9, '4', '2020-11-23 10:00:07', '2020-11-25 10:00:13', 2, 1, 1, '33');
INSERT INTO `repair` VALUES (10, '4', '2020-11-23 10:00:07', '2020-11-25 10:00:13', 1, 1, 1, '33');
INSERT INTO `repair` VALUES (13, '7', '2020-11-05 10:00:59', '2020-11-28 10:01:03', 1, 1, 1, '22');
INSERT INTO `repair` VALUES (14, '3', '2021-04-29 10:54:02', NULL, 2, 0, NULL, '电梯坏了');

-- ----------------------------
-- Table structure for repairtype
-- ----------------------------
DROP TABLE IF EXISTS `repairtype`;
CREATE TABLE `repairtype`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarks` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of repairtype
-- ----------------------------
INSERT INTO `repairtype` VALUES (1, '公共部位维修', NULL, 1);
INSERT INTO `repairtype` VALUES (2, '共用设施设备 ', NULL, 1);
INSERT INTO `repairtype` VALUES (3, '电梯', NULL, 1);
INSERT INTO `repairtype` VALUES (4, '自用部位维修', NULL, 1);
INSERT INTO `repairtype` VALUES (5, '门窗维修', NULL, 1);
INSERT INTO `repairtype` VALUES (6, '电话维修', NULL, 1);
INSERT INTO `repairtype` VALUES (7, '电路维修', NULL, 1);

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(0) NULL DEFAULT NULL,
  `remarks` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES (1, 'admin', 'admin', 1, NULL);
INSERT INTO `userinfo` VALUES (2, 'cuijianhui', '123456', 0, NULL);
INSERT INTO `userinfo` VALUES (3, 'marry', '123456', 0, NULL);
INSERT INTO `userinfo` VALUES (12, 'test', '123456', 0, '');
INSERT INTO `userinfo` VALUES (17, 'test02', '123456', 0, '111111');

SET FOREIGN_KEY_CHECKS = 1;
