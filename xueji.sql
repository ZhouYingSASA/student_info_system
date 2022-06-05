/*
 Navicat Premium Data Transfer
 Source Server         : localhost mysql
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost
 Source Database       : xueji
 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : utf-8
 Date: 10/27/2019 10:25:14 AM
*/

SET NAMES utf8mb4;

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------

--  Table structure for `admin`

-- ----------------------------

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `username` varchar(60) COLLATE utf8_bin DEFAULT NULL,
    `password` varchar(180) COLLATE utf8_bin DEFAULT NULL,
    `name` varchar(30) COLLATE utf8_bin DEFAULT NULL,
    `role` varchar(30) COLLATE utf8_bin DEFAULT NULL,
    `xy` varchar(50) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 22 DEFAULT CHARSET = utf8 COLLATE = utf8_bin;

-- ----------------------------

--  Records of `admin`

-- ----------------------------

BEGIN;

INSERT INTO
    `admin`
VALUES
    ('1', 'yx', '123456', '管理员', 'admin', 'admin'),
    ('2','sp','123456','食品','user','食品学院'),
    ('3', 'jg', '123456', '经管', 'user', '经济管理学院'),
    ('4', 'gg', '123456', '公管', 'user', '公共管理学院'),
    ('5','xg','123456','信工','user','信息工程学院'),
    ('6', 'rw', '123456', '人文', 'user', '人文学院'),
    ('7','gy','123456','艺术','user','艺术学院'),
    ('8', 'ly', '123456', '旅游', 'user', '旅游学院'),
    ('9', 'wgy', '123456', '外国语', 'user', '外国语学院'),
    ('10', 'ms', '123456', '马思', 'user', '马克思主义学院'),
    ('11', 'lx', '123456', '理学', 'user', '理学院'),
    ('12', 'ty', '123456', '体育', 'user', '体育部'),
    ('13', 'gj', '123456', '国教', 'user', '国际教育学院'),
    ('14', 'jj', '123456', '继教', 'user', '继续教育学院'),
    ('15', 'ys', '123456', '艺术', 'user', '艺术学院');

COMMIT;

-- ----------------------------

--  Table structure for `note`

-- ----------------------------

DROP TABLE IF EXISTS `note`;

CREATE TABLE `note` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `xh` varchar(128) COLLATE utf8_bin DEFAULT NULL,
    `xm` varchar(10) COLLATE utf8_bin DEFAULT NULL,
    `nj` varchar(6) COLLATE utf8_bin DEFAULT NULL,
    `xy` varchar(50) COLLATE utf8_bin DEFAULT NULL,
    `bj` varchar(30) COLLATE utf8_bin DEFAULT NULL,
    `ksh` varchar(20) COLLATE utf8_bin DEFAULT NULL,
    `lqzy` varchar(20) COLLATE utf8_bin DEFAULT NULL,
    `cc` varchar(30) COLLATE utf8_bin DEFAULT NULL,
    `xq` varchar(30) COLLATE utf8_bin DEFAULT NULL,
    `xb` varchar(10) COLLATE utf8_bin DEFAULT NULL,
    `mz` varchar(10) COLLATE utf8_bin DEFAULT NULL,
    `rxrq` date DEFAULT NULL,
    `byrq` date DEFAULT NULL,
    `admin_id` int(11) DEFAULT NULL,
    `status` varchar(12) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `admin_id` (`admin_id`),
    CONSTRAINT `note_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 51 DEFAULT CHARSET = utf8 COLLATE = utf8_bin;

-- ----------------------------

--  Records of `note`

-- ----------------------------

BEGIN;

INSERT INTO
    `note`
VALUES
    (
        '1',
        '19090101001',
        '郑玉荣',
        '19',
        '包装与印刷工程学院',
        '19包装01',
        '19410212153130',
        '包装工程',
        '普通本科',
        '前湖校区',
        '女',
        '汉族',
        '2019-09-01',
        '2023-07-01',
        '7',
        'fuxue'
    ),
    (
        '2',
        '19090101002',
        '李轶琳',
        '19',
        '动物科技学院',
        '19动科02',
        '19410113153223',
        '动物科学',
        '普通本科',
        '前湖校区',
        '女',
        '汉族',
        '2019-09-01',
        '2023-07-01',
        '2',
        null
    );

COMMIT;

-- ----------------------------

--  Table structure for `note_yet`

-- ----------------------------

DROP TABLE IF EXISTS `note_yet`;

CREATE TABLE `note_yet` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `xh` varchar(128) COLLATE utf8_bin DEFAULT NULL,
    `xm` varchar(10) COLLATE utf8_bin DEFAULT NULL,
    `xy` varchar(50) COLLATE utf8_bin DEFAULT NULL,
    `bj` varchar(30) COLLATE utf8_bin DEFAULT NULL,
    `zt` varchar(30) COLLATE utf8_bin DEFAULT NULL,
    `zy` varchar(20) COLLATE utf8_bin DEFAULT NULL,
    `created_date` date DEFAULT NULL,
    `reason` varchar(256) COLLATE utf8_bin DEFAULT NULL,
    `status` varchar(12) COLLATE utf8_bin DEFAULT NULL,
    `home_address` varchar(50) COLLATE utf8_bin DEFAULT NULL,
    `home_tel` varchar(12) COLLATE utf8_bin DEFAULT NULL,
    `per_tel` varchar(12) COLLATE utf8_bin DEFAULT NULL,
    `identity` varchar(18) COLLATE utf8_bin DEFAULT NULL,
    `school_sttime` date DEFAULT NULL,
    `school_endtime` date DEFAULT NULL,
    `bl_date` date DEFAULT NULL,
    `dom_campus` varchar(10) COLLATE utf8_bin DEFAULT NULL,
    `dom_dorm` varchar(20) COLLATE utf8_bin DEFAULT NULL,
    `school` varchar(50) COLLATE utf8_bin DEFAULT NULL,
    `campus` varchar(50) COLLATE utf8_bin DEFAULT NULL,
    `code` varchar(50) COLLATE utf8_bin DEFAULT NULL,
    `sex` varchar(5) COLLATE utf8_bin DEFAULT NULL,
    `leng_school` varchar(8) COLLATE utf8_bin DEFAULT NULL,
    `discipline` varchar(50) COLLATE utf8_bin DEFAULT NULL,
    `classgrade` varchar(20) COLLATE utf8_bin DEFAULT NULL,
    `dorm` varchar(20) COLLATE utf8_bin DEFAULT NULL,
    `admin_id` int(11) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `admin_id` (`admin_id`),
    CONSTRAINT `note_yet_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8 COLLATE = utf8_bin;

-- ----------------------------

--  Records of `note_yet`

-- ----------------------------

BEGIN;

INSERT INTO
    `note_yet`
VALUES
    (
        '1',
        '19090101001',
        '郑玉荣',
        '包装与印刷工程学院',
        '19包装01',
        'fuxue',
        '包装工程',
        '2019-10-25',
        '休学期满，申请复学',
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        '女',
        null,
        null,
        null,
        null,
        '7'
    );

COMMIT;

SET FOREIGN_KEY_CHECKS = 1;