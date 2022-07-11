SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255)   DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `label` varchar(255)   DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `content` longtext  DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `picture` varchar(255)   DEFAULT NULL,
  `preface` text  ,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 ;

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255)   DEFAULT NULL,
  `com_time` datetime(0) NULL DEFAULT NULL,
  `nickname` varchar(30)   DEFAULT NULL,
  `article_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 ;

-- ----------------------------
-- Table structure for blog_person
-- ----------------------------
DROP TABLE IF EXISTS `blog_person`;
CREATE TABLE `blog_person`  (
  `id` int(11) NOT NULL,
  `introduct` varchar(30)  DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB ;

-- ----------------------------
-- Table structure for blog_user
-- ----------------------------
DROP TABLE IF EXISTS `blog_user`;
CREATE TABLE `blog_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30)  NOT NULL,
  `password` varchar(30)  NOT NULL,
  `email` varchar(30)   DEFAULT NULL,
  `telephone` int(15) NULL DEFAULT NULL,
  `account` varchar(255)   DEFAULT NULL,
  PRIMARY KEY (`id`, `username`) USING BTREE
) ENGINE = InnoDB ;

SET FOREIGN_KEY_CHECKS = 1;
