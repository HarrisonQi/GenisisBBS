/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.5.37 : Database - bbs_admin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bbs_admin` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bbs_admin`;

/*Table structure for table `login_log` */

DROP TABLE IF EXISTS `login_log`;

CREATE TABLE `login_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登陆时间',
  `ip` varchar(30) NOT NULL COMMENT '登陆IP',
  `device` varchar(200) DEFAULT NULL COMMENT '设备',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4;

/*Data for the table `login_log` */

insert  into `login_log`(`id`,`user_id`,`login_time`,`ip`,`device`) values 
(1,4,'2018-01-19 17:50:44','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(2,4,'2018-01-19 17:51:37','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(3,4,'2018-01-19 17:54:59','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(4,4,'2018-01-19 18:01:51','0:0:0:0:0:0:0:1','Win64'),
(5,4,'2018-01-19 18:07:26','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(6,4,'2018-01-19 18:24:16','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(7,4,'2018-01-19 18:32:37','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(8,4,'2018-01-19 18:32:58','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(9,4,'2018-01-19 20:07:36','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(10,4,'2018-01-19 20:53:28','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(11,4,'2018-01-20 10:49:24','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(12,4,'2018-01-20 11:13:57','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(13,4,'2018-01-20 11:50:44','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(14,4,'2018-01-20 11:54:05','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(15,4,'2018-01-20 14:00:54','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(16,4,'2018-01-20 14:03:04','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(17,3,'2018-01-20 14:21:55','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(18,4,'2018-01-20 15:04:02','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(19,3,'2018-01-20 16:09:58','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(20,4,'2018-01-20 18:30:48','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(21,3,'2018-01-20 19:06:34','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(22,4,'2018-01-20 20:13:21','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(23,4,'2018-01-20 20:16:14','0:0:0:0:0:0:0:1','Win64'),
(24,4,'2018-01-21 10:07:31','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(25,4,'2018-01-21 13:25:29','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(26,4,'2018-01-24 10:12:07','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(27,4,'2018-01-24 13:49:59','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(28,4,'2018-01-24 13:56:08','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(29,4,'2018-01-24 14:00:49','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(30,4,'2018-01-24 14:01:06','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(31,4,'2018-01-24 14:07:04','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(32,4,'2018-01-24 14:45:35','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(33,4,'2018-01-24 15:32:07','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(34,4,'2018-01-24 15:33:58','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(35,4,'2018-01-24 15:49:06','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(36,4,'2018-01-24 16:51:49','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(37,4,'2018-01-24 17:28:27','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(38,4,'2018-01-24 17:39:12','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(39,4,'2018-01-24 18:53:04','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(40,4,'2018-01-24 20:33:56','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'),
(41,4,'2018-01-25 11:48:10','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.119 Safari/537.36'),
(42,4,'2018-01-25 11:56:35','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.119 Safari/537.36'),
(43,4,'2018-01-25 18:55:14','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.119 Safari/537.36'),
(44,4,'2018-01-31 19:06:35','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.119 Safari/537.36'),
(45,2,'2018-01-31 20:14:32','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.119 Safari/537.36'),
(46,2,'2018-01-31 20:16:54','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.119 Safari/537.36'),
(47,4,'2018-02-02 15:28:24','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(48,1,'2018-02-02 20:21:00','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(49,1,'2018-02-02 20:25:27','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(50,1,'2018-02-02 21:25:08','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(51,4,'2018-02-02 22:44:04','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(52,4,'2018-02-02 22:45:51','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(53,4,'2018-02-02 22:45:59','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(54,4,'2018-02-02 22:53:12','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(55,4,'2018-02-02 22:54:50','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(56,4,'2018-02-02 22:55:00','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(57,4,'2018-02-03 10:17:27','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(58,4,'2018-02-03 12:07:16','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(59,4,'2018-02-08 19:37:41','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(60,4,'2018-02-08 20:17:40','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(61,4,'2018-02-08 21:04:12','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(62,4,'2018-02-08 21:15:00','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(63,4,'2018-02-08 21:18:10','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(64,4,'2018-02-08 21:18:26','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(65,4,'2018-02-08 21:25:18','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(66,4,'2018-02-08 21:33:42','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(67,4,'2018-02-08 21:41:53','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(68,4,'2018-02-08 21:43:03','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(69,1,'2018-02-08 22:31:35','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(70,1,'2018-02-08 23:06:40','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(71,1,'2018-02-09 11:17:36','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(72,1,'2018-02-09 12:21:04','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(73,1,'2018-02-09 12:22:44','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(74,1,'2018-02-09 12:32:29','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(75,6,'2018-02-09 12:36:54','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(76,6,'2018-02-09 15:25:36','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(77,6,'2018-02-09 15:29:52','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(78,6,'2018-02-09 15:43:54','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(79,6,'2018-02-09 15:50:19','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.140 Safari/537.36'),
(80,1,'2018-04-15 10:13:09','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(81,1,'2018-04-15 10:20:05','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(82,1,'2018-04-15 10:23:39','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(83,1,'2018-04-15 10:39:32','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(84,1,'2018-04-15 10:41:49','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(85,1,'2018-04-15 11:20:25','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(86,1,'2018-04-15 11:30:39','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(87,1,'2018-04-15 11:32:39','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(88,1,'2018-04-15 13:52:32','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(89,1,'2018-04-15 14:00:37','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(90,1,'2018-04-15 14:20:40','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(91,1,'2018-04-15 18:30:31','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(92,1,'2018-04-15 18:35:36','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(93,1,'2018-04-15 19:44:38','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(94,1,'2018-04-15 19:49:06','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(95,1,'2018-04-15 19:50:59','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(96,1,'2018-04-15 20:45:28','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(97,8,'2018-04-15 20:47:25','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(98,9,'2018-04-15 20:54:50','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(99,9,'2018-04-15 20:58:57','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(100,1,'2018-04-20 20:40:34','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(101,1,'2018-04-20 20:41:48','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36'),
(102,1,'2018-04-20 20:54:29','0:0:0:0:0:0:0:1','WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36');

/*Table structure for table `reply` */

DROP TABLE IF EXISTS `reply`;

CREATE TABLE `reply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '回复id',
  `topic_id` int(11) NOT NULL COMMENT '主题id',
  `reply_user_id` int(11) NOT NULL COMMENT '用户id',
  `content` text CHARACTER SET utf8mb4 NOT NULL COMMENT '回复内容',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `device` varchar(20) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '设备',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `reply` */

insert  into `reply`(`id`,`topic_id`,`reply_user_id`,`content`,`create_time`,`update_time`,`device`) values 
(1,2,2,'测试评论1','2018-01-19 21:13:59','2018-02-09 15:51:48',NULL),
(2,2,2,'测试留言2','2018-01-19 21:38:10','2018-01-19 01:07:07',NULL),
(3,2,1,'测试评论1366576','2018-01-19 21:39:16','2018-02-09 15:52:06',NULL),
(4,4,4,'测试评论1287','2018-01-20 11:54:11','2018-02-09 15:53:31',NULL),
(5,4,4,'测试评论7689','2018-01-20 11:54:17','2018-02-09 15:52:15',NULL),
(6,2,4,'测试评论64567575','2018-01-20 11:54:34','2018-02-09 15:52:23',NULL),
(7,1,4,'测试评论7654323','2018-01-20 14:03:18','2018-02-09 15:52:32',NULL),
(8,3,3,'测试评论8655','2018-01-20 15:03:14','2018-02-09 15:53:23',NULL),
(9,5,3,'测试评论2465','2018-01-20 16:10:37','2018-02-09 15:52:41',NULL),
(10,7,4,'version ( HTTP/1.1 or HTTP/2 ) \r\n不错！','2018-01-20 20:14:15','2018-01-20 20:14:15',NULL),
(11,7,4,'测试评论787','2018-01-20 20:14:21','2018-02-09 15:52:52',NULL),
(12,7,4,'要是 server 也是一行 cli 代码就好了','2018-01-20 20:14:30','2018-01-20 20:14:30',NULL),
(13,8,4,'这不是队列么……','2018-01-21 13:27:22','2018-01-21 13:27:22',NULL),
(14,8,4,'活太轻，放队列里去感觉没那么大必要 :-)','2018-01-21 13:27:32','2018-01-21 13:27:32',NULL),
(15,8,4,'测试评论4324','2018-01-24 14:01:52','2018-02-09 15:54:15',NULL),
(16,9,4,'测试评论6578','2018-01-24 19:06:52','2018-02-09 15:53:04',NULL),
(17,11,2,'测试评论5466','2018-01-31 20:21:27','2018-02-09 15:54:42',NULL),
(18,11,2,'http://mvnrepository.com/','2018-01-31 20:23:44','2018-01-31 20:23:44',NULL),
(19,7,4,'测试评论1230','2018-02-08 21:18:57','2018-02-09 15:53:13',NULL),
(20,7,4,'测试评论3453','2018-02-08 21:19:03','2018-02-09 15:54:09',NULL),
(21,7,4,'测试评论6475','2018-02-08 21:19:07','2018-02-09 15:54:03',NULL),
(22,1,4,'测试评论54436','2018-02-08 21:41:58','2018-02-09 15:53:56',NULL),
(23,9,4,'测试评论5524','2018-02-08 21:43:09','2018-02-09 15:53:49',NULL),
(24,9,4,'测试评论6754','2018-02-08 21:43:40','2018-02-09 15:53:43',NULL),
(26,12,1,'测试评论65465','2018-02-09 11:18:08','2018-02-09 15:54:30',NULL),
(27,12,6,'测试评论4364','2018-02-09 12:38:03','2018-02-09 15:54:24',NULL),
(28,12,6,'嗯嗯','2018-02-09 15:46:39','2018-02-09 15:46:39',NULL);

/*Table structure for table `tab` */

DROP TABLE IF EXISTS `tab`;

CREATE TABLE `tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '板块id',
  `tab_name` varchar(50) NOT NULL COMMENT '板块名',
  `tab_name_en` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tab` */

insert  into `tab`(`id`,`tab_name`,`tab_name_en`) values 
(1,'技术','tech'),
(2,'好玩','play'),
(3,'创意','creative'),
(4,'工作','jobs'),
(5,'交易','deals');

/*Table structure for table `topic` */

DROP TABLE IF EXISTS `topic`;

CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子ID',
  `user_id` int(11) NOT NULL COMMENT '发帖人id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `click` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `tab_id` tinyint(4) NOT NULL COMMENT '发布板块',
  `liang` int(11) DEFAULT '0' COMMENT '点亮',
  `sort` varchar(1) DEFAULT '0' COMMENT '置顶',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

/*Data for the table `topic` */

insert  into `topic`(`id`,`user_id`,`create_time`,`update_time`,`title`,`content`,`click`,`tab_id`,`liang`,`sort`) values 
(1,2,'2018-01-20 20:02:13','2018-02-09 13:21:37','是否有利用云计算进行异地组网的解决方案？','现有一中大型企业，下属子公司需接入母公司内网。\r\n目前使用华为 AR1220-S 组网，使用 l2tp 搭建 vpn。使用路由器到路由器的解决方案，现已超过 10 家子公司，使用路由器通过 l2tp 接入母公司内网系统。\r\n随着公司业务增长，今年预计需增加 30 个点接入母公司网络。（未来可能需增加超过 200 个点，且分布全国各地）\r\n\r\n1.请问 AR1220-S 能否胜任，是否需要更换 AR2220-S 或 AR3220-S。\r\n2.子公司使用什么设备能较稳定连接母公司通过华为搭建的 l2tp 的 vpn。（目前使用过极路由和普联，普联表现较为稳定。因大规模部署需要，请问 TL-ER7520g 能否稳定胜任。 目前 tp 最贵的企业路由器，官网上看的。）\r\n3.大规模异地租网是否有更优方案，如利用云中转等，请各位大神们指点，谢谢。',139,1,0,'0'),
(2,3,'2018-01-20 19:55:19','2018-04-15 13:58:24','你心目中理想的新闻推荐系统是什么样子？','实时?\r\n根据兴趣推荐？\r\n关注的频道优先推荐？\r\n根据天气、位置等客观参数推荐\r\n有收藏功能，能自动根据收藏发现兴趣，从而更好地推荐\r\n让更多的人变成内容的创作者而不是单单的阅读者？',41,1,0,'0'),
(3,2,'2018-01-20 19:52:38','2018-02-08 21:47:28',' 关于“直播答题发钱”辅助工具搜索推荐算法的讨论','最近直播火热，网上也看到很多通过“抓图 - 文字识别 - 百度搜题推荐”的程序介绍，自己也整理了一份 \r\n###########举例###################### \r\n问题：9.中国历史上,在位时间最长的皇帝是? \r\n备选答案： [\'康熙\', \'乾隆\', \'刘彻\'] \r\n\r\nAnswer：	[\'刘彻(9.091%)\', \'康熙(63.636%)\', \'乾隆(27.273%)\'] \r\n####################################### \r\n想问问大家，对搜索答案这块的算法，怎么设计，有什么高见？ \r\n\r\n先抛砖引玉，目前想到的算法： \r\n1. 通过百度网页，请求问题，以答案选项作为关键字，数数判断（主流） \r\n2. 对答案采用“中文分词”，针对答案可能是 xxx-yyy-zzz 无法全字匹配的情况 \r\n3. 对问题进行“中文分词“，逆向搜索，针对 “下面那些不是美国的品牌”这类问题 \r\n\r\n对于 1 已经实现，之前也有人发过存在“不”的情况处理；目前想通过 jieba 实现 2 和 3，但是总感觉这块的思考不是“很专业”，请大家吐槽',23,1,0,'0'),
(4,2,'2018-01-20 20:06:24','2018-02-08 21:24:29','企业级应用开发真的需要 Vue, React 这种东西吗？','本人一直从事后端开发，自带一点前端技能（会用 jquery，extjs 组件）。这两年各种前端框架火爆，让我在完成老板任务时有点迷失。感觉不用 MVVM 这些框架，依然能很快的实现各种业务，而且交接工作也比较简单。\r\n用这些框架要增加学习成本，同行（都是后端自带一点前端技能那种）维护成本。但最终交互给客户的界面，依然是增删改查这些功能以及后台业务表逻辑的串接。而 UI 体验很大程度上又取决于交互视觉设计，而非前端框架。\r\n所以我的问题是：企业级应用开发真的需要 Vue, React 这种东西吗？\r\n各互联网大厂又有多少 to C 页面是基于他们实现，并且提升了交付给客户的价值？\r\n为什么精通 Vue React 的前端，在感觉上比框架本身的发明者还亢奋？',24,1,0,'0'),
(5,3,'2018-01-20 19:55:17','2018-02-08 23:00:42','使用 Nginx 自建 CDN，关于回源问题。','假如 3 台服务器,一台源站，2 个自建 CDN，在 Nginx 配置的时候回源方案目前想到 2 个，但不是很好，请问是否有更好的方案。\r\n\r\nA：源站\r\nB:CDN1\r\nC:CDN2\r\n方案一\r\nCDN 上进行 hosts 回源，但是自建 CDN 一多，这样很麻烦。\r\n\r\n方案二\r\n使用 DNSmasq 自建一个 DNS，然后在 nginx 设置 DNS 来指定回源。\r\n\r\n请问有更好的办法来实现回源吗？尤其是自建 CDN 节点较多的情况下。',37,1,0,'0'),
(6,3,'2018-01-20 16:11:32','2018-02-09 15:14:58','请问各位喜欢用 JOOQ Hibernate Mybatis 其中哪个框架','能说一下喜欢的原因是最好的..',3,1,0,'0'),
(7,4,'2018-01-20 20:13:57','2018-04-15 20:55:03','JDK 9 里的 JDK HTTP Client 的写法','HttpClient client = HttpClient.newHttpClient();\r\nHttpRequest request = HttpRequest.newBuilder()\r\n      .uri(URI.create(\"http://openjdk.java.net/\"))\r\n      .build();\r\nclient.sendAsync(request, asString())\r\n      .thenApply(HttpResponse::body)\r\n      .thenAccept(System.out::println)\r\n      .join();\r\n还可以指定使用 HTTP/2：\r\n\r\nHttpClient client = HttpClient.newBuilder()\r\n      .version(Version.HTTP_2)\r\n      .followRedirects(Redirect.SAME_PROTOCOL)\r\n      .proxy(ProxySelector.of(new InetSocketAddress(\"www-proxy.com\", 8080)))\r\n      .authenticator(Authenticator.getDefault())\r\n      .build();',47,1,0,'0'),
(9,4,'2018-01-24 16:57:44','2018-04-15 20:56:29','腾讯云能不能别给我发优惠券短信了','我对你的优惠券不感兴趣啊，能不能不要发了，每天都发，有时一天还要发好几次',69,2,0,'0'),
(10,4,'2018-01-25 11:52:12','2018-04-15 20:56:48','应用程序在服务器上创建文件目录权限 0777，会有风险吗？','应用程序 App （是 root ）在服务器上创建了一个文件目录，权限设 0777, 会有风险吗？ \r\n（当然，前提是服务器一般不会配除 root 外的其他账户，也不会把这个文件目录直接开给 web server 的公开路径）',15,1,0,'0'),
(11,4,'2018-01-25 12:04:44','2018-04-15 20:46:11','P2P 直播测试，这个数据如何？','',116,1,0,'0'),
(12,4,'2018-02-08 22:17:16','2018-04-15 14:21:08','Genesis祝各位会员新年好','Genesis祝各位会员新年好Genesis祝各位会员新年好',88,1,0,'0'),
(16,1,'2018-04-15 18:30:37','2018-04-15 18:40:20','111111111111111','<p>111111111111</p>',3,1,0,'0'),
(17,1,'2018-04-15 18:35:58','2018-04-15 18:40:21','222','<p>22</p>',0,1,0,'0'),
(22,7,'2018-04-15 20:57:39','2018-04-15 20:59:21','祝大家答辩通过','dxv dgdffg是打发打发刚发',3,1,0,'1'),
(23,7,'2018-04-20 20:18:08','2018-04-20 20:18:08','11111','1111',0,1,0,'1');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户唯一ID',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `phone_num` varchar(15) DEFAULT NULL COMMENT '手机号',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `credit` int(11) NOT NULL COMMENT '积分',
  `avatar` varchar(100) DEFAULT NULL COMMENT '头像url',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户类型,0为普通用户,1为管理员',
  `status` varchar(1) DEFAULT '1' COMMENT '1正常2封禁',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`email`,`phone_num`,`create_time`,`update_time`,`credit`,`avatar`,`type`,`status`) values 
(1,'likky','202CB962AC59075B964B07152D234B70','123456789@126.com','8615712345678','2018-02-08 23:06:40','2018-04-20 20:54:29',50,'/img/avatar/a1.jpg',0,'1'),
(2,'withstars','E10ADC3949BA59ABBE56E057F20F883E','987654321@qq.com','8616978945612','2018-01-31 20:16:54','2018-04-15 16:12:02',10,'/img/avatar/a2.jpg',0,'1'),
(3,'yilia','E10ADC3949BA59ABBE56E057F20F883E','147258369@qq.com','8615963248962','2018-01-20 14:18:58','2018-04-15 16:12:03',0,'/img/avatar/a3.jpg',0,'1'),
(4,'sassy','E10ADC3949BA59ABBE56E057F20F883E','159357846@qq.com','8612543434343','2018-02-08 22:17:16','2018-04-15 16:12:03',156,'/img/avatar/a4.jpg',0,'1'),
(6,'objectc','E10ADC3949BA59ABBE56E057F20F883E','963852741@qq.com','8619345321598','2018-02-09 12:36:39','2018-04-15 16:12:07',7,'/img/avatar/a5.jpg',0,'1'),
(7,'admin','202CB962AC59075B964B07152D234B70',NULL,NULL,'2018-02-09 12:36:39','2018-04-15 18:10:40',7,'/img/avatar/a1.jpg',1,'1'),
(9,'bb','202CB962AC59075B964B07152D234B70','98767665@qq.com','8616786675345','2018-04-15 20:54:46','2018-04-15 20:59:25',6,'/img/avatar/1523796962027-9.jpg',0,'2');

/*Table structure for table `user_collect` */

DROP TABLE IF EXISTS `user_collect`;

CREATE TABLE `user_collect` (
  `userid` varchar(11) DEFAULT NULL,
  `topicid` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_collect` */

insert  into `user_collect`(`userid`,`topicid`) values 
('1','12'),
('9','9');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
