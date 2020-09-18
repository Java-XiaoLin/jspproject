/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : dept_inf

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 18/09/2020 10:41:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dept_inf
-- ----------------------------
DROP TABLE IF EXISTS `dept_inf`;
CREATE TABLE `dept_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept_inf
-- ----------------------------
INSERT INTO `dept_inf` VALUES (1, '技术部', '技术部');
INSERT INTO `dept_inf` VALUES (2, '运营部', '运营部');
INSERT INTO `dept_inf` VALUES (3, '财务部', '财务部');
INSERT INTO `dept_inf` VALUES (4, '总公办', '总公办');
INSERT INTO `dept_inf` VALUES (5, '市场部', '市场部');
INSERT INTO `dept_inf` VALUES (6, '教学部', '教学部');
INSERT INTO `dept_inf` VALUES (7, 'aaaa', 'aaaa');
INSERT INTO `dept_inf` VALUES (8, '舍管部', '管理宿舍');
INSERT INTO `dept_inf` VALUES (9, '游戏部', '333');

-- ----------------------------
-- Table structure for document_inf
-- ----------------------------
DROP TABLE IF EXISTS `document_inf`;
CREATE TABLE `document_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `filename` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_document_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_document_user` FOREIGN KEY (`user_id`) REFERENCES `user_inf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of document_inf
-- ----------------------------
INSERT INTO `document_inf` VALUES (4, '配置文件1', 'IP地址.txt', '配置', '2017-06-06 10:20:54', 1);

-- ----------------------------
-- Table structure for employee_inf
-- ----------------------------
DROP TABLE IF EXISTS `employee_inf`;
CREATE TABLE `employee_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `card_id` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `post_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qq_num` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `emall` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` int(11) NOT NULL DEFAULT 1,
  `party` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` datetime(0) NULL DEFAULT NULL,
  `race` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `education` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `speciality` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hobby` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_emp_dept`(`dept_id`) USING BTREE,
  INDEX `fk_emp_job`(`job_id`) USING BTREE,
  CONSTRAINT `fk_emp_dept` FOREIGN KEY (`dept_id`) REFERENCES `dept_inf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_emp_job` FOREIGN KEY (`job_id`) REFERENCES `job_inf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee_inf
-- ----------------------------
INSERT INTO `employee_inf` VALUES (1, 1, 8, '李洋洋', '4328011988', '山东菏泽', '510000', '020-7777777', '18864803272', '1591992570', '1591992570@qq.com', 0, '共青团员', '1996-10-01 08:58:22', '汉', '本科', '计算机', '爬山', '无', '2017-05-23 08:59:21');
INSERT INTO `employee_inf` VALUES (2, 2, 1, '刘冠麟', '4328011999', '山东临沂', '520000', '020-5555555', '18864803252', '1886456823', '18864803252@163.com', 1, '共青团员', '2017-05-23 09:01:17', '汉', '本科', '计算机', NULL, '', '2017-05-23 09:01:41');
INSERT INTO `employee_inf` VALUES (3, 1, 2, '孙建军', '4328011555', '山东儿童', '530000', '020-6666666', '15687543225', '1521321454', '12154521445@163.com', 1, '共青团员', '2017-05-23 09:03:12', '汉', '本科', '计算机', '撩妹', '无', '2017-05-23 09:03:32');

-- ----------------------------
-- Table structure for job_inf
-- ----------------------------
DROP TABLE IF EXISTS `job_inf`;
CREATE TABLE `job_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of job_inf
-- ----------------------------
INSERT INTO `job_inf` VALUES (1, '总经理', '职员');
INSERT INTO `job_inf` VALUES (2, 'java开发工程师', 'java开发工程师');
INSERT INTO `job_inf` VALUES (3, 'java中级开发工程师', 'java中级开发工程师');
INSERT INTO `job_inf` VALUES (4, 'java高级开发工程师', 'java高级开发工程第');
INSERT INTO `job_inf` VALUES (5, '系统管理员', '系统管理员');
INSERT INTO `job_inf` VALUES (6, '架构师', '架构师');
INSERT INTO `job_inf` VALUES (7, '主管', '主管');
INSERT INTO `job_inf` VALUES (8, '经理', '经理');
INSERT INTO `job_inf` VALUES (9, '总经理', '总经理');
INSERT INTO `job_inf` VALUES (10, '学生', '学生');
INSERT INTO `job_inf` VALUES (11, '大师', '222');

-- ----------------------------
-- Table structure for notice_inf
-- ----------------------------
DROP TABLE IF EXISTS `notice_inf`;
CREATE TABLE `notice_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_date` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_notice_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_notice_user` FOREIGN KEY (`user_id`) REFERENCES `user_inf` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice_inf
-- ----------------------------
INSERT INTO `notice_inf` VALUES (1, '放假啦', '六一快乐哈', '2017-06-01 23:00:48', 1);

-- ----------------------------
-- Table structure for user_inf
-- ----------------------------
DROP TABLE IF EXISTS `user_inf`;
CREATE TABLE `user_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `createdate` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_inf
-- ----------------------------
INSERT INTO `user_inf` VALUES (1, 'xxx', '555555', 1, '2020-09-15 19:06:06', '游戏主播');
INSERT INTO `user_inf` VALUES (4, 'admin', '999', 0, '2020-06-05 21:07:06', 'admin');

SET FOREIGN_KEY_CHECKS = 1;
