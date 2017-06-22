
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `ipv6`
--
CREATE DATABASE IF NOT EXISTS `ipv6` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ipv6`;

-- --------------------------------------------------------

--
-- 表的结构 `feature`
--

DROP TABLE IF EXISTS `feature`;
CREATE TABLE IF NOT EXISTS `feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feature_name` varchar(255) NOT NULL COMMENT '特征名称',
  `min_cc_count` int(11) NOT NULL DEFAULT '0' COMMENT '最小并发数',
  `pck_times` int(11) NOT NULL DEFAULT '0' COMMENT '请求的频率',
  `mark` varchar(255) DEFAULT NULL,
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ip`
--

DROP TABLE IF EXISTS `ip`;
CREATE TABLE IF NOT EXISTS `ip` (
  `id` int(11) NOT NULL COMMENT '主键',
  `ip_addr` varchar(255) NOT NULL COMMENT 'ip地址',
  `level` int(11) NOT NULL COMMENT '等级，转换为字母',
  `ip_type` int(11) NOT NULL COMMENT 'IP地址类型，4代表ipv4 6代表ipv6',
  `count` int(11) NOT NULL DEFAULT '1' COMMENT '访问次数',
  `last_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后访问时间',
  `count_size` bigint(20) NOT NULL COMMENT '总共访问字节数',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `ext1` varchar(255) NOT NULL,
  `ext2` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip_addr` (`ip_addr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ip6`
--

DROP TABLE IF EXISTS `ip6`;
CREATE TABLE IF NOT EXISTS `ip6` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL COMMENT 'ip地址',
  `pck_count` int(11) NOT NULL DEFAULT '0' COMMENT '该IP发包总数',
  `max_cc_count` int(11) NOT NULL DEFAULT '0' COMMENT '最大并发数',
  `total_con_time` int(11) NOT NULL DEFAULT '0' COMMENT '总连接时间',
  `ip_attr` int(11) NOT NULL DEFAULT '0' COMMENT '1代表正常，2代表异常',
  `total_data_size` bigint(20) NOT NULL DEFAULT '0' COMMENT '请求的数据总大小',
  `mark` varchar(255) DEFAULT NULL,
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipid` int(11) NOT NULL COMMENT '外键，该数据包的ip属性',
  `port` int(11) NOT NULL COMMENT '发送该数据的端口',
  `max_concurrent` int(11) NOT NULL COMMENT '当前并发数',
  `data_size` int(11) NOT NULL COMMENT '请求的数据大小',
  `requestid` int(11) DEFAULT NULL COMMENT '外键，请求的页面编号',
  `featureid` int(11) DEFAULT NULL COMMENT '外键，该数据包的特征编号',
  `request_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '请求时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `mark` varchar(255) DEFAULT NULL,
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=526 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `request`
--

DROP TABLE IF EXISTS `request`;
CREATE TABLE IF NOT EXISTS `request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `request_name` varchar(255) NOT NULL,
  `request_url` varchar(255) NOT NULL,
  `request_important` float NOT NULL DEFAULT '0',
  `mark` varchar(255) DEFAULT NULL,
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;