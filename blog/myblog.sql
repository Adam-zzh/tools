/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : myblog

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 14/05/2021 20:21:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `PID` bigint(20) NULL DEFAULT NULL COMMENT '父级id',
  `ICON` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `TYPE` tinyint(2) NULL DEFAULT 0 COMMENT '权限类型 0：菜单 1：按钮',
  `NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `URL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源url',
  `SORT` int(10) NULL DEFAULT NULL COMMENT '排序字段',
  `VALUE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限值',
  `FULLPATH` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '树状解构路线',
  `STATUS` tinyint(2) NULL DEFAULT 1 COMMENT '是否可用 0：禁用 1：可用',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES (1, 0, NULL, 0, '基础配置', '/basicConfig', 1, 'basicConfig', NULL, 1, '2021-04-27 22:39:07');
INSERT INTO `t_permission` VALUES (2, 1, NULL, 0, '用户管理', '/user/sdasd/1', 2, 'user:userManage', NULL, 1, '2021-04-29 00:32:15');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `ID` bigint(24) NOT NULL COMMENT '主键',
  `ROLE_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `STATUS` tinyint(2) NULL DEFAULT 1 COMMENT '是否可用 0：禁用 1：可用',
  `SORT` int(10) NULL DEFAULT NULL COMMENT '排序字段',
  `DESCRIPTION` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `CREATE_TIME` date NULL DEFAULT NULL COMMENT '创建时间',
  `ROLE_CODE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色code',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '管理员', 1, 1, '我是管理员角色', '2021-04-25', 'ROLE_ADMIN');
INSERT INTO `t_role` VALUES (2, '管理员', 1, 2, '我是管理员角色', '2021-04-25', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission`  (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `ROLE_ID` bigint(20) NULL DEFAULT NULL COMMENT '角色id',
  `PERMISSION_ID` bigint(20) NULL DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `idx_roleId`(`ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES (1, 1, 1);
INSERT INTO `t_role_permission` VALUES (2, 1, 2);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `ID` bigint(24) NOT NULL COMMENT '主键',
  `USER_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `ACCOUNT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登陆账号',
  `PASSWORD` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `USER_TYPE` tinyint(2) NOT NULL DEFAULT 0 COMMENT '用户类型0：普通用户   1：系统管理员',
  `STATUS` tinyint(2) NULL DEFAULT 1 COMMENT '是否可用 0：禁用 1：可用',
  `USER_EMAIL` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户邮箱',
  `USER_PROFILE_PHOTO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `USER_PHONE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户手机号',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `lOGIN_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `RMK` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `idx_account`(`ACCOUNT`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', 'admin', '$2a$10$avwtdb5Y0EAEEF3hGgkE3.fdXBH2q5D3maz5hMllJbuqN/.jLsnNG', 1, 1, '964389@qq.com', NULL, '15612130015', '2021-04-25 22:24:42', '2021-04-29 23:36:55', '我是MC水观音');
INSERT INTO `t_user` VALUES (1388434861433425920, '菩提花', 'zzh', '$2a$10$Zoq8UrhHgmZ/cMfQT4HDBeKKPVEN8IFN3qXDHmXc4ZgnXuXD/y3YS', 0, 1, '964389099@qq.com', 'iconzzh', '15612130015', '2021-05-01 18:07:21', '2021-05-11 23:56:44', '我是一只小老虎');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `ID` bigint(20) NOT NULL COMMENT '主键',
  `ROLE_ID` bigint(20) NULL DEFAULT NULL COMMENT '角色id',
  `USER_ID` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `idx_userId`(`USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 1, 1);
INSERT INTO `t_user_role` VALUES (2, 2, 1);

SET FOREIGN_KEY_CHECKS = 1;
