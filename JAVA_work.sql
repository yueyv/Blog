/*
 Navicat Premium Data Transfer

 Source Server         : yueyv
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : bpvank

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 22/11/2022 17:02:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for articleinfo
-- ----------------------------
DROP TABLE IF EXISTS `articleinfo`;
CREATE TABLE `articleinfo`  (
  `articleId` int NOT NULL AUTO_INCREMENT COMMENT '文章编号',
  `userId` int NOT NULL COMMENT '编写用户编号',
  `userName` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '编写用户名称',
  `articleTitle` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章标题',
  `articleClassifyId` int NOT NULL COMMENT '文章分类id',
  `articleClassifyName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章分类名称',
  `articleDase` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章描述',
  `articleImgLitimg` blob NOT NULL COMMENT '文章缩略图',
  `articleContent` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章内容',
  `publishTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发表时间',
  `articleState` int NOT NULL COMMENT '文章状态',
  `articlePass` int NULL DEFAULT 1 COMMENT '后台审核是否通过',
  `commentState` int NOT NULL COMMENT '评论状态',
  `click` int NOT NULL DEFAULT 0 COMMENT '阅读次数',
  `review` int NOT NULL DEFAULT 0 COMMENT '评论次数',
  PRIMARY KEY (`articleId`) USING BTREE,
  INDEX `fk_articleInfo_userId`(`userId`) USING BTREE,
  INDEX `fk_articleInfo_articleClassifyId`(`articleClassifyId`) USING BTREE,
  CONSTRAINT `fk_articleInfo_userId` FOREIGN KEY (`userId`) REFERENCES `userinfo` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of articleinfo
-- ----------------------------
INSERT INTO `articleinfo` VALUES (1, 1, 'admin', 'JAVAEE课程设计', 6, '其他', 'let\'s go', '', '<p>测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1</p>', '2022-11-22 10:10:46', 1, 2, 1, 5, 0);
INSERT INTO `articleinfo` VALUES (61, 1, 'admin', 'day01', 1, '技术', '测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1', '', '<p>测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1测试文章1</p>', '2022-11-22 10:21:33', 1, 2, 1, 1, 0);
INSERT INTO `articleinfo` VALUES (62, 1, 'admin', 'day02', 2, '资源', '测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2', '', '<p>测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2测试文章2</p>', '2022-11-22 10:21:55', 1, 2, 1, 0, 0);
INSERT INTO `articleinfo` VALUES (63, 1, 'admin', 'day03', 3, '杂文', '测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3', '', '<p>测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3测试文章3</p>', '2022-11-22 10:22:13', 1, 2, 1, 0, 0);
INSERT INTO `articleinfo` VALUES (64, 1, 'admin', 'day04', 4, '生活', '测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4', '', '<p>测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4测试文章4</p>', '2022-11-22 10:22:27', 1, 2, 1, 0, 0);
INSERT INTO `articleinfo` VALUES (65, 1, 'admin', 'day05', 5, '情感', '测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5', '', '<p>测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5测试文章5</p>', '2022-11-22 10:22:40', 1, 2, 1, 0, 0);

-- ----------------------------
-- Table structure for backstagemenuinfo
-- ----------------------------
DROP TABLE IF EXISTS `backstagemenuinfo`;
CREATE TABLE `backstagemenuinfo`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `chineseName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单中文名称',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单标题',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `parentMenuId` int NULL DEFAULT NULL COMMENT '父菜单id',
  `menuStatus` tinyint NULL DEFAULT NULL COMMENT '菜单是否可见',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '后台菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of backstagemenuinfo
-- ----------------------------
INSERT INTO `backstagemenuinfo` VALUES (1, 'backstageHome', '后台首页', 'Bpvank - 后台首页', '/backstageHome', 'House', 0, 1);
INSERT INTO `backstagemenuinfo` VALUES (2, 'articleOperation', '文章操作', 'Bpvank - 文章操作', '/articleOperation', 'Reading', 0, 1);
INSERT INTO `backstagemenuinfo` VALUES (3, 'addArticle', '新建文章', 'Bpvank - 新建文章', '/addArticle', 'EditPen', 2, 1);
INSERT INTO `backstagemenuinfo` VALUES (4, 'articleManager', '文章管理', 'Bpvank - 文章管理', '/articleManager', 'Edit', 2, 1);
INSERT INTO `backstagemenuinfo` VALUES (5, 'classifyManager', '分类管理', 'Bpvank - 分类管理', '/classifyManager', 'FolderOpened', 2, 0);
INSERT INTO `backstagemenuinfo` VALUES (6, 'commentManager', '评论管理', 'Bpvank - 评论管理', '/commentManager', 'ChatDotSquare', 0, 1);
INSERT INTO `backstagemenuinfo` VALUES (7, 'userManager', '用户管理', 'Bpvank - 用户管理', '/userManager', 'MagicStick', 0, 0);
INSERT INTO `backstagemenuinfo` VALUES (8, 'linkManager', '链接管理', 'Bpvank - 链接管理', '/linkManager', 'Link', 0, 0);
INSERT INTO `backstagemenuinfo` VALUES (9, 'personSetup', '个人设置', 'Bpvank - 个人设置', '/personSetup', 'User', 0, 1);
INSERT INTO `backstagemenuinfo` VALUES (10, 'systemSetup', '系统设置', 'Bpvank - 系统设置', '/systemSetup', 'Setting', 0, 0);

-- ----------------------------
-- Table structure for classifyinfo
-- ----------------------------
DROP TABLE IF EXISTS `classifyinfo`;
CREATE TABLE `classifyinfo`  (
  `classifyIntroduce` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类介绍',
  `classifyId` int NOT NULL AUTO_INCREMENT COMMENT '分类编号',
  `classifyName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名称',
  `articleNumber` int NOT NULL DEFAULT 0 COMMENT '文章数量',
  `color1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '渐变色1',
  `color2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '渐变色2',
  PRIMARY KEY (`classifyId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '分类管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of classifyinfo
-- ----------------------------
INSERT INTO `classifyinfo` VALUES ('技术类', 1, '技术', 1, '#6D80FE', '#23D2FD');
INSERT INTO `classifyinfo` VALUES ('资源类', 2, '资源', 1, '#FBF40F', '#FFA9AB');
INSERT INTO `classifyinfo` VALUES ('杂文类', 3, '杂文', 1, '#09B0E8', '#29F49A');
INSERT INTO `classifyinfo` VALUES ('生活类', 4, '生活', 1, '#717CFE', '#FC83EC');
INSERT INTO `classifyinfo` VALUES ('情感类', 5, '情感', 1, '#535b9a', '#30bcd7');
INSERT INTO `classifyinfo` VALUES ('other', 6, '其他', 1, '#FF988B', '#FF6B88');

-- ----------------------------
-- Table structure for commentinfo
-- ----------------------------
DROP TABLE IF EXISTS `commentinfo`;
CREATE TABLE `commentinfo`  (
  `commentId` int NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `articleId` int NOT NULL COMMENT '文章代号',
  `userId` int NOT NULL COMMENT '评论用户编号',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论内容',
  `parentId` int NULL DEFAULT 0 COMMENT '父评论',
  `commentDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论日期',
  PRIMARY KEY (`commentId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of commentinfo
-- ----------------------------

-- ----------------------------
-- Table structure for effects
-- ----------------------------
DROP TABLE IF EXISTS `effects`;
CREATE TABLE `effects`  (
  `effects01` tinyint(1) NULL DEFAULT 0 COMMENT '特效1',
  `effects02` tinyint(1) NULL DEFAULT 0 COMMENT '特效2'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of effects
-- ----------------------------
INSERT INTO `effects` VALUES (0, 0);

-- ----------------------------
-- Table structure for logininfo
-- ----------------------------
DROP TABLE IF EXISTS `logininfo`;
CREATE TABLE `logininfo`  (
  `loginId` int NOT NULL COMMENT '登录的用户编号',
  `loginTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '登录时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '登录管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of logininfo
-- ----------------------------
INSERT INTO `logininfo` VALUES (1, '2022-11-21 20:36:40');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `messageId` int NOT NULL AUTO_INCREMENT COMMENT '留言编号',
  `messageName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '留言昵称',
  `messageQQ` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '留言QQ',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '留言内容',
  `replyContent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '回复留言内容',
  `messageDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '留言日期',
  PRIMARY KEY (`messageId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for systemsetup
-- ----------------------------
DROP TABLE IF EXISTS `systemsetup`;
CREATE TABLE `systemsetup`  (
  `effects02` tinyint(1) NULL DEFAULT 0 COMMENT '特效2',
  `effects01` tinyint(1) NULL DEFAULT 0 COMMENT '特效1',
  `stickArticle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '置顶',
  `allArticle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章展示',
  `featuredArticle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '左侧精选文章',
  `technologyArticle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '左侧技术专区文章',
  `resourceArticle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '右侧资源专区文章',
  `advertising1` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '左侧广告图1',
  `advertisingLink1` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '左侧广告链接1',
  `advertising2` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '右侧广告图1',
  `advertisingLink2` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '左侧广告链接1',
  `advertising3` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '右侧广告图2',
  `advertisingLink3` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '左侧广告链接1'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of systemsetup
-- ----------------------------
INSERT INTO `systemsetup` VALUES (0, 0, '1', '[61,1,62]', '[1,61,62,63,64,65]', '[61]', '[62]', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for urlinfo
-- ----------------------------
DROP TABLE IF EXISTS `urlinfo`;
CREATE TABLE `urlinfo`  (
  `urlId` int NOT NULL AUTO_INCREMENT COMMENT '链接编号',
  `urlName` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站名称',
  `urlAddres` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站地址',
  `urlReferral` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站介绍',
  `urlLitimg` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '网站缩略图',
  `webmasterEmail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '站长邮箱',
  `urlPass` int NULL DEFAULT 1 COMMENT '后台审核是否通过',
  `urlType` int NULL DEFAULT NULL COMMENT '链接类型',
  PRIMARY KEY (`urlId`) USING BTREE,
  UNIQUE INDEX `urlAddres`(`urlAddres`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '链接管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of urlinfo
-- ----------------------------

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `userId` int NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `userType` int NOT NULL DEFAULT 1 COMMENT '用户类型',
  `userName` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `userPass` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `userEmail` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '邮箱',
  `userRegdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `userSignature` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '个性签名',
  `userIcon` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '个人头像',
  PRIMARY KEY (`userId`) USING BTREE,
  UNIQUE INDEX `userName`(`userName`) USING BTREE,
  UNIQUE INDEX `userEmail`(`userEmail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '注册用户管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES (1, 0, 'admin', '123456', 'yueyvlunhui@gmail.com', '2022-11-22 10:10:56', 'JAVAEE课程设计', '');

SET FOREIGN_KEY_CHECKS = 1;
