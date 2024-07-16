-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: smartedux
-- ------------------------------------------------------
-- Server version	8.0.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bigcourse`
--

DROP TABLE IF EXISTS `bigcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bigcourse` (
  `CourseID` int NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `CourseName` varchar(255) NOT NULL COMMENT '课程名称',
  `CourseDescription` varchar(500) NOT NULL COMMENT '课程描述',
  `CourseCover` varchar(500) NOT NULL COMMENT '课程封面',
  `CourseDomain` varchar(20) NOT NULL COMMENT '课程涉及领域',
  `CourseImage` varchar(500) NOT NULL COMMENT '课程详情图片',
  `MajorChapters` json NOT NULL COMMENT '大章节',
  `TestPaperID` int DEFAULT NULL,
  `ModuleID` int DEFAULT NULL,
  `StudyPathID` int DEFAULT NULL,
  `courseattachment` varchar(100) DEFAULT NULL COMMENT '课程附件',
  PRIMARY KEY (`CourseID`),
  KEY `bigcourse_testpaper_FK` (`TestPaperID`),
  KEY `bigcourse_studypathmodule_FK` (`ModuleID`),
  KEY `bigcourse_studypath_FK` (`StudyPathID`),
  CONSTRAINT `bigcourse_studypath_FK` FOREIGN KEY (`StudyPathID`) REFERENCES `studypath` (`StudyPathID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bigcourse_studypathmodule_FK` FOREIGN KEY (`ModuleID`) REFERENCES `studypathmodule` (`ModuleID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bigcourse_testpaper_FK` FOREIGN KEY (`TestPaperID`) REFERENCES `testpaper` (`TestPaperID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COMMENT='大课程';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bigcourse`
--

LOCK TABLES `bigcourse` WRITE;
/*!40000 ALTER TABLE `bigcourse` DISABLE KEYS */;
INSERT INTO `bigcourse` VALUES (1,'Web前端：从零开始做网站','本课程专为零基础学员准备，从网页基础深入到网页布局开发。课程内容讲解详细，注重细节，让你从入门到精通，一周时间掌握HTML+CSS网页开发。经过学习与实战，可独立开发出高质量的静态网页项目。','	https://demo-api.meedu.xyz/storage/images/v43GltVoGF95TDaznUIa6fDmYcIDWQJlEOeh5EqN.png','前端开发','https://s2.loli.net/2024/05/27/7xOQMwI93Hsr4Fi.png','[\"HTML 网站的骨架\", \"CSS 网站的美颜\", \"项目网站的部署\"]',1,3,2,'http://8.137.127.161:999//Web前端：从零开始做网站.pdf'),(2,'从零玩转HTML5（跨平台开发）','能够利用所学的html、css、photoshop对已经设计好的企业网站界面设计，手把手教会大家对企业网站进行进行切片制作和DIV+CSS布局，独立完成制作静态网站页面和模板，并完成浏览器兼容性测试。','	https://demo-api.meedu.xyz/storage/images/v9PYbvR7bCZXTSk3scR1GV1gccno1qOlnYB3cRS0.png\r\n','前端开发','https://s2.loli.net/2024/05/27/9vKnFxu1MP62bCg.png','[\"CSS3特性\", \"伸缩布局\"]',3,3,2,''),(3,'零基础吃透微信小程序','本教程目标是从零开始带领读者上手实战小程序开发，课程以微信小程序的核心概念作为主线，介绍配置文件、页面样式文件、JavaScript 的基本知识。并以指南针为例对基本知识进行扩展，另外加上开发工具的安装、小程序发布等内容。','https://demo-api.meedu.xyz/storage/images/N9LKos3c5HZt5MeNW4DFucRXxCPhSLM1ZlDLOtKh.png\r\n','小程序开发','https://s2.loli.net/2024/05/27/zxLKtsVH5afU3Zv.png','[\"小程序基础\", \"小程序进阶\"]',4,5,3,'http://8.137.127.161:999/零基础吃透微信小程序.pdf'),(4,'Vue2+Vue3前端框架入门与实战','如果你之前已经习惯了用jQuery操作DOM，学习Vue.js时请先抛开手动操作DOM的思维，因为Vue.js是数据驱动的，你无需手动操作DOM。 它通过一些特殊的HTML语法，将DOM和数据绑定起来。','https://demo-api.meedu.xyz/storage/images/74sZVx4EcT7das1EqgYaBrQj9HUFe0BXVBD5QyTK.png','前端开发','https://s2.loli.net/2024/05/27/baHchB8dIOFw6rZ.png','[\"课程介绍和开发工具\", \"ES6新特性\"]',5,4,2,''),(5,'SpringCloud实战（k8s&doceker）','本系列课程我将带大家从K8s基础入门到K8s项目实战，一条龙学习路径帮你学透K8s，成为K8s高级工程师，突破年薪30W！','	https://demo-api.meedu.xyz/storage/images/JLyw8tHNwvA62qa3oePHnGAYdp89Q64EUm0Jb9ss.png','后端开发','https://s2.loli.net/2024/05/27/ClK2Tz1Sh4ADwHU.png','[\"docker入门\", \"镜像仓库管理\"]',6,1,1,NULL),(6,'Pytorch深度学习入门与实战','PyTorch框架核心使用方法解读，基于最新算法（论文）展开项目实战，全部内容均基于真实数据集与实际任务需求展开，500+课时，30+大型项目实战，适合转行就业与进阶提升的同学们。','https://demo-api.meedu.xyz/storage/images/em6V36Mb8lHVYO1Pxc2cAXt7wDmKcxFo1Be0OkA2.png','深度学习','https://s2.loli.net/2024/05/27/KJLMT6hjz1ZgdsG.png','[\"Pytorch概述\", \"深度学习基础\"]',7,6,3,NULL),(7,'Go Web开发（进阶实战）','本课程介绍如何用Go语言进行Web应用的开发，将Go语言的特性与Web开发实战组合到一起，帮读者成功地构建跨平台的应用程序，节省Go语言开发Web的宝贵时间。有了这些针对真实问题的解决方案放在手边，大多数编程难题都会迎刃而解。','	https://demo-api.meedu.xyz/storage/images/pONk6mmw4R1NVpUhqu4SArdzG3NaxEcuRqDbDXwY.png','后端开发','https://s2.loli.net/2024/05/27/hXHNrivdJeqBjU1.png','[\"Go操作常见数据库\", \"Go Web开发常用组件\"]',8,6,3,''),(8,'一次性搞定Java入门（高新全栈+安卓）','本课程为Java零基础入门部分，让您快速上手Java编程，为Java网站开发，安卓程序设计与开发打下基础。 本课程已完结，走在技术前沿，用实力说话。','https://demo-api.meedu.xyz/storage/images/1K54to6jXihAkLAEJlauA4jGfKkr8fGxpvDfx5Rv.png','后端开发','https://s2.loli.net/2024/05/27/XYs7vgPy6hHuiwa.png','[\"Java环境安卓配置\", \"Java基本语法\", \"数据类型\", \"变量和常量\"]',9,1,1,NULL),(9,'Python数据分析（机器学习实战）','简单、实用的Python数据分析、数据挖掘视频教程，主要介绍Python在数据处理、数据分析、数据可视化、数据挖掘方面常用的实战方法与技巧。','	https://demo-api.meedu.xyz/storage/images/uoUR9iCcc1DPX1lOwFaL0GbUdw1tvIAAsaolj7n6.png','人工智能','https://s2.loli.net/2024/05/27/zxaVkjg4hbAwsUm.png','[\"人工智能入门指南\", \"Python科学计算库\"]',10,2,1,NULL),(10,'Uni-app实战视频点播小程序','全网最详细的Uniapp实战开发app小程序课程，7大实战开发案例（社区交友，商城，即时通讯，音频小说、网盘、点播、直播）帮助你获得技术优势并提高面试竞争力。','	https://demo-api.meedu.xyz/storage/images/rvX9mXmAEf285HBKb3JFFjvlBkMIVXPQQKGPVrqP.png','移动开发','https://s2.loli.net/2024/05/27/aEUBIO5dgDXcoCr.png','[\"准备工作\", \"项目分析和全局样式\", \"首页开发\", \"后端API开发\"]',11,NULL,NULL,NULL),(11,'微信公众号+小程序快速开发','本课程致力于打造一站式微信开发全方位学习模式，微信开发从入门到精通全套系统课程。从宝贵“实战案例”中总结“踩坑”经验，助你快速搭建微信公众号、小程序，彻底玩转微信开发。','https://demo-api.meedu.xyz/storage/images/VY3SVQog9nmUIPer80vaWea5bakgRJJUd7sA7IVV.png','移动开发','https://s2.loli.net/2024/05/27/iXJKyrIvsNuASF6.png','[\"微信开发基础\", \"公众号小程序实战案例\"]',12,NULL,NULL,NULL),(12,'IOS+Swift零基础教程（2021版iOS14）','课程会介绍需要用到的操作系统和开发工具，和编程语言 Swift 的注释、数据类型、函数、控制流语句（条件和循环）、可选类型、命名类型（枚举、类和结构体）的概念和使用方法，在 Project 项目中通过 .storyboard 文件进行应用的界面的实现，通过 .swift 文件进行应用的功能实现。','https://demo-api.meedu.xyz/storage/images/Qj2kY3vSI3o4rt5YCImxmWmxkNdwYQQYQraINNo5.png','移动开发','https://s2.loli.net/2024/05/27/Hlx1tr57EOfipKD.png','[\"Swift语言入门\", \"实战案例\"]',13,NULL,NULL,NULL),(13,'C++语言基础到进阶','关于内容特点 1、知识点讲解细致入微 2、结合大家平时易出现问题的点，详细解析 3、课程顺序符合思考逻辑，引导大家发现问题并解决问题 4、对于有C++基础的朋友，本系列视频，肯定能让你对C++有新的认识。','https://demo-api.meedu.xyz/storage/images/P0eroC3R9bAwUKvUY1z5HqLpTZdrwaif9qpXEBnC.png','后端开发','https://s2.loli.net/2024/05/27/xltrcYaJmO2SNez.png','[\"C++语言介绍\", \"基本语言\", \"类\"]',14,NULL,NULL,NULL);
/*!40000 ALTER TABLE `bigcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bigcourse_knowledge`
--

DROP TABLE IF EXISTS `bigcourse_knowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bigcourse_knowledge` (
  `BigCourseID` int NOT NULL COMMENT '课程ID',
  `KnowledgeID` int NOT NULL COMMENT '知识点ID',
  KEY `videocourse_FK_1` (`BigCourseID`),
  KEY `knowledge_FK_1` (`KnowledgeID`),
  CONSTRAINT `knowledge_FK_1` FOREIGN KEY (`KnowledgeID`) REFERENCES `knowledge` (`KnowledgeID`),
  CONSTRAINT `videocourse_FK_1` FOREIGN KEY (`BigCourseID`) REFERENCES `videocourse` (`VideoCourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bigcourse_knowledge`
--

LOCK TABLES `bigcourse_knowledge` WRITE;
/*!40000 ALTER TABLE `bigcourse_knowledge` DISABLE KEYS */;
INSERT INTO `bigcourse_knowledge` VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,3),(2,4),(3,31),(3,33),(4,1),(4,2),(4,3),(4,4),(5,5),(5,6),(5,7),(5,8),(6,26),(6,27),(6,28),(7,8),(7,9),(8,10),(8,11),(8,14),(9,12),(10,15),(10,16),(10,17),(11,19),(11,20),(11,21),(11,22),(11,33),(12,23),(12,24),(12,25),(13,13),(13,14),(9,34),(11,30),(5,30);
/*!40000 ALTER TABLE `bigcourse_knowledge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bigcourse_user`
--

DROP TABLE IF EXISTS `bigcourse_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bigcourse_user` (
  `CourseID` int NOT NULL COMMENT '课程ID',
  `UserID` int NOT NULL COMMENT '用户ID',
  `StudyTime` double NOT NULL DEFAULT '0' COMMENT '订阅之后记录学习时长',
  `FinishNum` int DEFAULT NULL,
  `UnfinishNum` int DEFAULT NULL,
  `FinishVideoCourseName` json DEFAULT NULL COMMENT '已经完成学习的小章节课程名',
  KEY `bigcourse_FK` (`CourseID`),
  KEY `user_FK` (`UserID`),
  CONSTRAINT `bigcourse_FK` FOREIGN KEY (`CourseID`) REFERENCES `bigcourse` (`CourseID`),
  CONSTRAINT `user_FK` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户学习大课程情况';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bigcourse_user`
--

LOCK TABLES `bigcourse_user` WRITE;
/*!40000 ALTER TABLE `bigcourse_user` DISABLE KEYS */;
INSERT INTO `bigcourse_user` VALUES (5,10,5.79,1,2,'[\"docker和虚拟机有什么区别\"]'),(6,10,25.080000000000005,1,3,'[\"Pytorch的安装\"]'),(7,11,25.189999999999998,1,3,'[\"Go连接MySQL\"]'),(3,11,0,0,4,NULL),(9,10,19.92,1,4,'[\"人工智能核心-机器学习\"]'),(3,10,0,0,4,NULL),(1,10,5.5,0,8,NULL),(1,12,0,0,8,NULL),(2,12,0,0,4,NULL),(8,10,0,0,8,NULL),(11,10,0,0,4,NULL),(1,11,0,0,8,NULL),(9,11,0,0,5,NULL);
/*!40000 ALTER TABLE `bigcourse_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `CommentID` int NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `Avatar` varchar(500) NOT NULL COMMENT '头像',
  `Name` varchar(10) NOT NULL COMMENT '昵称',
  `CommentTime` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '评论时间',
  `CommentContent` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '评论内容',
  `UserID` int DEFAULT NULL,
  `ImageAndTextID` int DEFAULT NULL,
  `VideoCourseID` int DEFAULT NULL,
  `CourseID` int DEFAULT NULL,
  PRIMARY KEY (`CommentID`),
  KEY `comment_user_FK` (`UserID`),
  KEY `comment_videocourse_FK` (`VideoCourseID`),
  KEY `comment_bigcourse_FK` (`CourseID`),
  KEY `comment_imageandtext_FK` (`ImageAndTextID`),
  CONSTRAINT `comment_bigcourse_FK` FOREIGN KEY (`CourseID`) REFERENCES `bigcourse` (`CourseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_imageandtext_FK` FOREIGN KEY (`ImageAndTextID`) REFERENCES `imageandtext` (`ImageAndTextID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_user_FK` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_videocourse_FK` FOREIGN KEY (`VideoCourseID`) REFERENCES `videocourse` (`VideoCourseID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COMMENT='评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-21','很不错的课程',10,NULL,NULL,1),(2,'http://thirdqq.qlogo.cn/ek_qqapp/AQAiaTtkWG4N7cqBR7LCpBpHXZib6GTS2tm0AXwfGqVAIE2zho0g7NawiaQ6EykAZb3C9aerqIP/100','xxx','2024-05-21','能学到很多',11,NULL,NULL,1),(3,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-21','博观而约取，厚积而薄发',10,NULL,NULL,2),(4,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-21','课程内容不错',10,NULL,NULL,2),(5,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-21','123123',10,NULL,NULL,1),(6,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-21','123123',10,NULL,NULL,1),(7,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-21','还行',10,NULL,NULL,3),(8,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-21','评论',10,NULL,NULL,3),(9,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-21','111',10,NULL,NULL,3),(10,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-21','go web开发很不错',10,NULL,NULL,7),(11,'http://thirdqq.qlogo.cn/ek_qqapp/AQAiaTtkWG4N7cqBR7LCpBpHXZib6GTS2tm0AXwfGqVAIE2zho0g7NawiaQ6EykAZb3C9aerqIP/100','xxx','2024-05-21','xxx的评论',11,NULL,NULL,2),(12,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-22','xhc的评论',10,NULL,37,NULL),(13,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-22','8',10,NULL,37,NULL),(14,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-22','新评论来了',10,NULL,44,NULL),(15,'http://thirdqq.qlogo.cn/ek_qqapp/AQAiaTtkWG4N7cqBR7LCpBpHXZib6GTS2tm0AXwfGqVAIE2zho0g7NawiaQ6EykAZb3C9aerqIP/100','xxx','2024-05-22','zap日志库的介绍很详细',11,NULL,35,NULL),(16,'http://thirdqq.qlogo.cn/ek_qqapp/AQAiaTtkWG4N7cqBR7LCpBpHXZib6GTS2tm0AXwfGqVAIE2zho0g7NawiaQ6EykAZb3C9aerqIP/100','xxx','2024-05-22','gin框架配置很不错',11,NULL,36,NULL),(17,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-26','111',10,NULL,14,NULL);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dialogbox`
--

DROP TABLE IF EXISTS `dialogbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dialogbox` (
  `DialogBoxID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `CreateTime` varchar(100) NOT NULL,
  `DialogBoxName` varchar(100) NOT NULL,
  PRIMARY KEY (`DialogBoxID`),
  KEY `dialogbox_user_FK` (`UserID`),
  CONSTRAINT `dialogbox_user_FK` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb3 COMMENT='智能问答对话框';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dialogbox`
--

LOCK TABLES `dialogbox` WRITE;
/*!40000 ALTER TABLE `dialogbox` DISABLE KEYS */;
INSERT INTO `dialogbox` VALUES (90,10,'2024-05-29 18:28:58','新建对话框'),(93,10,'2024-05-29 18:58:35','新建对话'),(96,11,'2024-05-29 22:12:31','新建对话框'),(99,11,'2024-05-29 22:14:14','新建对话框'),(100,11,'2024-05-30 08:25:57','新建对话框'),(103,11,'2024-05-30 16:05:50','新建对话框');
/*!40000 ALTER TABLE `dialogbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imageandtext`
--

DROP TABLE IF EXISTS `imageandtext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imageandtext` (
  `ImageAndTextID` int NOT NULL AUTO_INCREMENT COMMENT '图文ID',
  `ViewNumber` int NOT NULL COMMENT '浏览次数',
  `LikeNumber` int NOT NULL COMMENT '点赞次数',
  `Title` varchar(20) NOT NULL COMMENT '图文标题',
  `ContentDomain` varchar(10) NOT NULL COMMENT '内容领域',
  `CoverImage` varchar(500) NOT NULL COMMENT '封面图片',
  `ArticleContent` longtext NOT NULL COMMENT '文章内容',
  `ReleaseTime` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`ImageAndTextID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='图文';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imageandtext`
--

LOCK TABLES `imageandtext` WRITE;
/*!40000 ALTER TABLE `imageandtext` DISABLE KEYS */;
INSERT INTO `imageandtext` VALUES (1,116,100,'揭开 AI、机器学习和深度学习的神秘面纱','人工智能','https://meedu-cos.meedu.xyz/images/admin/xbnWzaStcDPNoAnYJ5PIDFHZFIXSOJD7leNSHYv0.jpg','### 什么是人工智能？\n\n纵观人工智能的历史，定义不断被重新定义。人工智能是一个总称（这个想法始于 50 年代）;机器学习是 AI 的一个子集，深度学习是 ML 的一个子集。','2021-10-07 12:45:00'),(2,2,1,'机器人设计与自动化中的计算美学','人工智能','https://meedu-cos.meedu.xyz/images/admin/Ya5MIn4hcdhQr0X0eSiyKqBmv2QaPSeTgKl3B3Wc.jpg','### 什么是计算美学？\n\n计算美学研究使用计算机创建的事物的设计和外观。它相对较新，仍处于起步阶段。然而，它已经对我们思考机器人和自动化的方式产生了重大影响。\n\n计算机美学侧重于计算机如何在没有人为干扰或输入的情况下创建外观完美的设计。这意味着它可以让我们设计机器人，而不必担心它们一旦生产出来的外观或功能。\n\n这使设计师可以自由和灵活地创建他们的产品，因为他们不必担心完成后的外观或功能。这也使他们更容易尝试新的想法和风格，因为这些不会对最终产品的外观或功能产生任何直接影响。\n\n![img](https://meedu-cos.meedu.xyz/images/admin/Ya5MIn4hcdhQr0X0eSiyKqBmv2QaPSeTgKl3B3Wc.jpg)\n\n### 计算美学有几个分支，所有这些都涉及研究和评估计算机生成的图像和动画的图形和符号方面。它们包括：\n\n形式主义：这种方法侧重于图像和动画的形式结构及其美学品质。\n\n后结构主义：这种方法研究社会背景如何塑造图像和动画，这会影响它们的意义和价值。\n\n解构主义：这种方法从批判的角度审视图像和动画，研究它们如何破坏传统的现实或真理概念。\n\n结构主义：这种观点侧重于如何根据特定的结构规则构建图像和动画。\n\n###\n\n### 计算美学给机器人自动化带来了什么？\n\n机器人自动化彻底改变了制造和物流。与此同时，它催生了一个新的计算美学分支，称为机器人信息学。\n\n机器人信息学研究机器人如何与周围环境互动，以及这如何影响其设计的美学。它考虑了诸如如何创建具有视觉吸引力的机器人以及如何确保它们以美观的方式运行等问题。\n\n虽然这一领域的研究仍在进行中，但已经有一些有希望的结果。例如，一项研究表明，人们对具有精心设计的视觉参与机器人的反应更有利。这可能有助于提高行业的效率和生产力，同时为机器人技术创造更积极的形象。\n\n\n\n### 计算美学如何影响机器人编程？\n\n计算美学影响机器人编程的主要方式之一是提供设计和改进机器人的新方法。这些新方法包括人工智能（AI），机器学习（ML）和深度学习（DL）。\n\n所有这些方法都涉及教计算机做曾经不可能的事情。特别是ML是一种人工智能形式，它允许计算机从经验中学习，并根据这种经验随着时间的推移提高其性能。DL类似于ML。不同之处在于，它使机器人能够从数据和其他机器中获取知识。\n\n借助深度学习，机器人可以变得更有创造力——它们可以学习如何创建人类无法自己想出的设计，至少不是不费吹灰之力！\n\n\n\n### 编程如何改善计算美学？\n\n机器人自动化已经证明，它有可能提高工厂运营的效率和准确性，特别是随着机器人在设计领域越来越受欢迎。然而，它也可能导致产生美学上令人不快的物体。\n\n为了避免这种情况，我们必须学习如何正确编程机器人。这将使我们能够创建看起来不错且有效运行的对象。它还将为我们提供以前无法实现的精度和细节水平。有许多具有先进计算美学的机器人，它们在制造、医疗保健和安全领域变得越来越普遍。\n\n在对机器人进行编程以确保计算美学时，需要遵循一些原则：\n\n- 保持程序简单易懂。\n- 确保每个程序都清晰易读。\n- 在整个程序中使用一致的术语。\n- 设计程序，以便可以轻松地将它们从一个环境移植到另一个环境。\n\n一些著名的美观机器人的例子包括谷歌的自动驾驶汽车和Five9的触觉吸尘器。这两种技术都得到了消费者的压倒性认可，这要归功于它们的创新设计和令人印象深刻的功能。\n\n您可能熟悉的其他具有高级计算美学的机器人包括DARPA的智能机器人车辆（IRV）程序和软银机器人公司的Pepper人形机器人。这两种技术因其与人类自然互动的能力而特别引人注目，这使得它们在未来的工作场所中具有潜在的无价价值。\n\n还有其他具有先进计算美学的机器人，而且它们每年都变得越来越普遍。\n\n###\n\n### 以下是一些示例：\n\n人形机器人索菲亚（Sophia）被设计成看起来像人类的外观和感觉，并学习和理解人类的情感。Hanson Robotics开发的机器人可以使用自然语言处理来导航周围环境，这使它们能够以更像人类的方式与人类互动。HAL项目是东京大学科学家和NEC公司之间的合作，HAL是一个人形机器人，可以展示逼真的面部表情和动作。\n\n###\n\n### 计算美学在机器人自动化中的重要性\n\n使用机器人的主要好处之一是，我们可以将它们设计成看起来美观，而不必明确地针对美学进行编程。这是因为机器人的设计过程依赖于与传统设计过程不同的原则。\n\n计算美学在创造具有视觉吸引力的机器人方面起着至关重要的作用。它通过增强用户对机器人的体验来做到这一点，使其变得可爱且易于使用。这使人们能够专注于一项任务，而不是在机器人周围感到害怕或不舒服。\n\n此外，计算美学还有助于我们了解人类如何与物体和系统交互，这可以帮助设计师创建更直观的设计供人类使用。当我们转向越来越复杂的机器和系统时，这一点尤其重要。\n\n除了看起来不错之外，有效和高效的设计应该易于使用。通过研究设计过程的可用性，设计师可以确保他们的机器人易于理解和使用，无论他们使用什么语言或界面。这将使人们更容易与他们互动和共享信息。\n\n###\n\n### 计算美学的下一步将走向何方？\n\n目前对计算美学的研究集中在我们如何设计机器人，并根据人类的感知和认知来设计它们的外观。它研究了机器人的设计如何实现美学目标，例如降低噪音水平或提高乘员舒适度。它还研究了视觉信息处理如何有助于我们对机器人美学的理解。\n\n总体而言，这项研究正在帮助我们了解机器人如何在特定的应用环境中以及更普遍地在生活的不同领域实现理想的结果。它甚至可以使我们有能力开发可以应用于不同学科的新美学范式。','2021-10-07 12:39:00'),(3,5,1,'最受开发人员喜爱的机器学习软件工具','人工智能','https://meedu-cos.meedu.xyz/images/admin/qEeX8v1ygop5yadVeyE8PHxcGk2Qob408aHYYeVk.jpg','人工智能、自迭代数据分析、监督学习和其他机器学习算法中的任何专用软件都被视为机器学习软件。机器学习可用于许多软件应用程序，包括电子邮件分类或人机交互。机器学习软件可用于建模、设计、招聘和会计。它可以使无用的机器人和功能齐全的AI系统之间产生重大差异。了解您应该使用哪个软件包可以帮助您选择。\n\n\n\n### 机器学习软件主要特点\n\n- 有许多模式识别技术，包括分类、回归和模式识别。\n- 图像和文本检索的预测分析。\n- 减小尺寸的功能。\n- 向量机提供帮助。\n- 与Apache SparkMLlib等机器学习库合作。\n- 使用流行的编程语言，如Scala，Java和C++。\n- 使用全栈开源进行机器学习。\n\n![img](https://meedu-cos.meedu.xyz/images/admin/qEeX8v1ygop5yadVeyE8PHxcGk2Qob408aHYYeVk.jpg)\n\n\n\n### 1. 亚马逊ML\n\nAmazon Machine Learning （AML） 是一种基于云的综合机器学习工具，可供所有技能水平和在线应用程序开发人员使用，可供任何级别的开发人员使用。\n\n此托管服务提供机器学习模型和预测。它还集成了来自多个来源的数据，例如Redshift，Amazon S3，RDS和Amazon S3。\n\nAmazon Machine Learning 提供可视化和向导工具。\n\n支持三种类型的模型：二元分类、多类分类和回归。\n\n此工具允许用户使用 MySQL 数据库创建数据源对象。\n\n它还允许用户从 Amazon Redshift 数据创建数据源对象。\n\n###\n\n### 2. 谷歌 ML 套件移动\n\n谷歌的Android团队为移动应用程序开发人员创建了一个ML KIT，该工具包结合了机器学习和技术知识，以创建更具弹性和优化的应用程序，以便在智能手机上运行。\n\n此机器学习软件包可用于执行人脸检测、文本识别和地标检测等任务。\n\n它还有助于图片标签和条形码扫描。您可以通过它访问强大的技术。\n\n它可以在设备上或云中运行，具体取决于您的需求。它可以使用预制模型或现成的解决方案进行软件开发。该套件包括Google的Firebase移动开发平台。\n\n\n\n### 3.苹果核心ML\n\nApple Core ML 是一个使用机器学习来帮助你将机器学习模型集成到移动应用中的平台，可从 Apple 获得。\n\n将机器学习中的文件放入您的项目中，Xcode 将立即生成 Swift 包装器或 Objective-C 代码。此方法易于使用，并且将利用所有 CPU 和 GPU。\n\nCoreML 支持计算机视觉以准确分析图像，GameplayKit 用于评估学习的决策树，自然语言可快速执行自然语言处理。它针对设备上的最佳性能进行了优化。\n\n\n\n### 4. Apache Spark MLlib\n\n这是一个可以在Apache Mesos和Hadoop上扩展的机器学习库。它还可以从多个数据源检索数据。有几种技术可用于对数据进行分类，包括朴素贝叶斯和逻辑回归。回归：一般线性回归也可用。聚类：K 均值是另一种选择。其工作流工具包括 ML 管道创建、特征转换、ML 持久性等。\n\n您可以访问 Hadoop 数据源，如 HDFS、HBase 或本地文件。它很容易与Hadoop操作集成，因为它能够访问Hadoop数据源，如HDFS，HBase或本地文件。MLlib还与Spark API集成，并在Python库和R库中与NumPy很好地配合使用。它具有优于MapReduce的算法。\n\n\n\n### 5. 阿帕奇新加\n\n该程序由新加坡国立大学数据库系统组与浙江大学数据库组合作开发。\n\n该人工智能系统有助于图片识别以及自然语言处理。它支持许多著名的深度学习模型。它由三个主要部分组成：IO 核心、模型和核心。张量抽象可用于创建更复杂的机器学习模型。此应用程序提供了改进的 IO 类来写入、读取、编码和解码文件和数据。此应用程序可用于同步、异步或两者的组合进行训练。\n\n\n\n### 6. 阿帕奇驯象师\n\nApache Mahout是Scala的分布式线性代数框架和Scala DSL。它在数学上具有表现力。Apache 软件基金会的免费开源项目。\n\n创建此框架是为了快速开发统计学家、数学家和数据科学家的算法。它提供机器学习技术，如建议、分类、聚类和分类，以及用于创建可扩展算法的框架。\n\n它包括矢量和矩阵库，并使用MapReduce范式在Apache Hadoop上运行。\n\n\n\n### 7. Accord.NET\n\n它 integrates.Net 具有 C# 音频和图像处理 API 的机器学习基础。它有许多可用于各种目的的库，例如模式识别、数据处理和线性代数。\n\n它还包含协议。统计学、Accord.Math 和 Accord.MachineLearning 类。\n\nAccord.Net 的特点\n\n有 40 多种统计分布估计可用于估计非参数或参数统计。\n\n用于计算机视觉、计算机听力、信号处理和统计的高质量计算机程序。\n\n有超过 35 种假设检验可用，包括单因子和双向方差分析检验。\n\n它支持超过 38 个内核函数。\n\n\n\n### 8. 幕府将军\n\n它是一个开源且免费的机器学习库。它由Gunnar Raetsch & Soeren Sonnenburg于1999年开发。\n\n该软件可以在C++中实现。该软件实际上提供了可用于解决机器学习问题的方法和数据结构。\n\n它支持多种编程语言，包括R，Python和Java，Octave以及C#，Ruby，Lua，Lua，Ruby，C#，Ruby等。\n\nShogun主要关注内核机器，例如回归问题和支持向量机进行分类。您可以连接到 LibLinear 和 LibSVM 等机器学习库。\n\n\n\n### 9. Tensorflow\n\n它是一个开源机器学习库，允许您构建 ML 模型。谷歌创建了Tensorflow。\n\n它提供了广泛的库、工具和资源，使研究人员和开发人员能够开发和部署机器学习系统。\n\n它可以帮助您开发和训练模型。TensorFlow.js是一个将模型转换为html的工具。\n\n它是一个开源软件程序，可用于使用数据流图进行数值计算。它可用于 CPU 和 GPU 以及一系列移动计算设备。\n\n###\n\n### 10. 谷歌云 ML 引擎\n\nGoogle Cloud ML Engine 是一款出色的工具，如果您拥有数十亿或数百万个训练数据点，或者算法需要花费大量时间才能正确执行，则可以为您提供帮助。\n\n它是一个基于云的平台，允许机器学习应用程序开发人员和数据科学家创建和执行高质量的模型。\n\n提供机器学习模型训练、构建、深度学习、预测建模甚至预测的所有可用选项。\n\n此应用程序被许多企业用于各种目的。企业可以使用它来识别卫星图像中的云或更快地响应客户电子邮件。它可以通过多种方式训练复杂的模型。\n\n\n\n### 11. IBM 机器学习\n\nIBM 机器学习服务允许您组合和混合 IBM Watson Studio 和 IBM Watson OpenScale 等技术。\n\n开源软件可用于构建 AI 模型、将模型集成到您的应用程序中并对其进行测试。IBM Machine Learning 提供免费的轻量级计划，其中包括 20 CPUH 的上限和同时优化批处理任务。\n\n\n\n### 12. 羚羊\n\n它建立在Apache Spark和Apache Kafka之上，是lambda架构的一个例子。它用于大规模实时算法。\n\nOrxy2软件开发平台包括用于过滤和打包，回归，分类，聚类和分类的端到端应用程序。Oryx 2.8.0 是此实用程序的最新版本。\n\nOryx 2是指Oryx 1项目的更高级版本。\n\n它有三层协作工作：速度层和批处理层。服务层是第三个。\n\n还包括一个数据传输层，用于跨不同级别传输数据并接收来自外部源的输入。\n\n\n\n### 13. 神经设计师\n\n神经设计器是一种正在兴起的机器学习服务，它允许您跳过编码并使用拖放和点击功能创建框图。与许多其他系统相比，它们以 417K+ 的采样率提供更好的平均 GPU 训练性能。\n\n神经设计器完全用C++编写。这损害了一些可用性优势，以提高性能。\n\n大型数据加载需要出色的内存管理。优化 CPU 和 GPU 性能可实现快速计算。\n\n\n\n### 14. Azure 机器学习\n\nMicrosoft 的 Azure 机器学习允许客户快速轻松地构建、训练、部署和维护机器学习模型。\n\nQA 经理会喜欢使用自动化机器学习快速识别和测试相关方法的能力。它提供了许多增强功能，例如事件处理、应用服务和自动化，任务持续时间长达 500 分钟。\n\n您将获得强大的附加组件选择、较长的试用期和货币积分。\n\n\n\n### 15.蟒蛇\n\nAnaconda是一个支持MLOps周期的框架，被美国国家银行和AT&T以及丰田和高盛使用。\n\nConda 的基本组件包括 Conda 包管理器、无限的企业产品和连接，以及可复制或云存储库和环境管理员。\n\n通过个人订阅，自由职业者很容易。任何人都可以使用它们，它们包括数百个开源框架和工具以及 7500+ Conda 包。\n\n\n\n### 总结\n\n虽然一些机器学习算法可以预先设计为专注于特定领域，但其他算法则允许用户使用任何数据创建自己的模型。\n\n市场上有不同类型的应用软件，我们在这里讨论了机器学习技术的最佳软件工具。\n\n我们研究了使用最广泛的一些机器学习工具，以及如何将它们用于不同的目的。\n\n还有许多其他机器学习库没有进入列表，因为机器学习领域正在增长。','2021-07-21 03:04:00'),(4,4,1,'“互联网+职业技能培训”成技能学习新业态','教育','https://demo-api.meedu.xyz/storage/images/2ZMVoo2fGTcsvBPBRcgb16vyl529ycZxIP8R3LtJ.jpg','人力资源和社会保障部印发《“技能中国行动”实施方案》，指出要加强数字技能培训，普及提升全民数字素养；大力推行“互联网+职业技能培训”，广泛开展新职业新业态新模式从业人员技能培训等。腾讯研究院发布的《中国在线职业教育市场发展报告》显示，预计2021年中国在线教育市场总规模将突破300亿元。其中，在线职业培训是主要驱动力之一，到2021年，将突破1000亿元大关。\n\n![1](https://meedu-cos.meedu.xyz/images/n00fOjf2vha4fuSwyhQewKWpeZHr7MhIys1vdzvF.jpg)\n\n众所周知，职业培训行业受政策影响较大，一旦政策有所调整，整个行业往往牵一发而动全身。受疫情影响，今年上半年的所有职业资格考试均推迟或取消，线下培训全部取消，职培行业可谓是经历了一次大洗牌。\n\n![2](https://meedu-cos.meedu.xyz/images/cOZESubxpytzF9b6Ep6MS52jhzcfeLjPPeELSMlj.jpg)\n\n3月份，人力资源社会保障部、财政部印发关于实施职业技能提升行动“互联网+职业技能培训计划”的通知，并推出“百日免费线上技能培训行动”，鼓励支持广大劳动者参加线上职业技能培训。这一政策的出台，对于在线职培行业无疑是重大利好。那么如何把政策“推手”的最大效应发挥出来，是在线职培平台在行业赛道中脱颖而出的重要砝码。\n\n通过线上职业培训平台，既可以按照章节、主题学习视频、音频、图文课程，下载文档资料，也有直播功能，能够很好地实时互动，大部分用户使用后都觉得线上的课程资源很丰富，呈现形式多样，非常方便实用。对于培训机构来说，也明显感觉有助于取得更好的教学成果。\n\n以打造线上知识服务平台的Meedu系统为例，其为职业培训、公职考试、法律、家政、美妆、中医健康等不同领域的培训机构，搭建PC网校、微信公众号、微信小程序、APP等形式的在线职业培训平台，Meedu为学员提供直播、视频、考试测评、各类营销工具、教务管理等一站式服务，通过这些专业的线上平台，很多地处偏远、当地没有最先进的优质师资的用户，也能够及时在线学习新知识新技术，足不出户就能够提升自己，解决难题。\n\n强烈的市场需求，明朗的政策导向，以及互联网发展普及到前所未有的程度，都为在线职培行业的高速发展创造了有利条件，是机遇亦是挑战。2020年政策与疫情双重刺激下市场的爆发，在线职培行业走向了春天。','2020-07-19 00:25:00'),(5,3,1,'关于新媒体运营你必须知道','新媒体','https://demo-api.meedu.xyz/storage/images/a6BPYp5MaGtF5Z3VsC4l3DaVj3EY5llgHkP3Qfl2.jpg','新媒体运营，为时未晚，不同的平台的玩法也不尽相同。新媒体运营平台根据企业现阶段的目标来定的，用户拉新、品牌曝光或者销售转化，目标不同，选择的平台也就不同。\n\n![1](https://meedu-cos.meedu.xyz/images/zgtZgl6HakFxyLEa0v78lZmN8mTi7VyeVDThQN94.jpg)\n\n公众号弱于拉新，强于品牌和服务；抖音企业号强于获客，目前正在补足私域的短板；视频号是视频化的企业官网，与公众号互为补充；微博做舆情监控和品牌公关；B站做品牌破圈；知乎做精准的流量搜索；小红书做红人投放。\n新品牌/新企业的初期任务是产品曝光。相比订阅制的公众号，采取算法推荐的抖音会更适合冷启动，初期可以结合投DOU+快速获取用户。\n这一阶段可以同时开通公众号，作为产品服务的承接。如果偏向ToC，并且具有强服务属性，如麦当劳、中国移动、招商银行等，那么做服务号，因为它接口功能更加丰富，还可以关联支付、交易。缺点是推送次数少，一个月只有四次，因此用户粘性上可能不强。但这个缺点可以通过私域运营来补足，典型如瑞幸咖啡、完美日记。如果偏向ToB，如腾讯云、神策数据、旷视科技等，那么做订阅号，用于发布行业资讯。当然，如果资源充足的话，可以服务号、订阅号一起做，服务号做服务承接，订阅号做行业发声。关于公众号如何涨粉，基本有三种方法，第一种是投放，直接买流量。前提是软文好（考验写手），选对投放的号（考验投手）。典型如风变科技的Python小课。第二种是线上线下的活动，活动一般会设置利益点来吸引用户。第三种是既有渠道的利用，最常见的就是扫码注册登录即完成服务号关注，大多数工具类软件的企业号都是这么操作的，如创客贴、135编辑器、ProcessOn。\n抖音企业号，中小企业要趁早做，不同企业在短视频营销上有不同的诉求。经营规模成熟的头部企业，重在品牌价值的传递；行业内小有名气但大众认知不足的腰部企业，侧重品牌和效果的协同；初创企业、工商个体等小型公司偏重实际销售效果的引流。另外值得一提的是，7月27日，抖音企业号2.0正式发布，这是抖音专门给企业做的私域经营方案。“超强的公域+到位的私域”，这是很有想象力的。\n\n![2](https://meedu-cos.meedu.xyz/images/oP6a3RAXKVEpB5d7uiBnzJqKZnJ0ZQXMw12u7Xvs.jpg)\n\n行业太垂直要怎么做抖音内容？反其道而行之。\n很多从业者有个思维定式，认为内容越聚焦受众越精准。但事实上，当你没有流量时，你的内容再精准也没用，因为压根都没触达到目标用户。\n所以要换个思维，把内容选题放大。比如做探房，策划的内容就不能局限于有能力买房的小部分人，而是要尽可能面向大众，让他们也能看得津津有味。先让内容爆起来，这样才有机会去触达那小部分精准用户，典型如大白探房。研究抖音上的头部账号，研究抖音上同类型的头部账号，总结它们内容上的规律，然后再结合自己的优势，做微创新。先做爆款，再筛选用户。而不是精准地找到用户。\n\n不论选择哪个平台，企业新媒体的终极目标都是产品，只不过每个平台触达产品的方式和路径有所不同。','2020-07-19 00:19:00');
/*!40000 ALTER TABLE `imageandtext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integralrecord`
--

DROP TABLE IF EXISTS `integralrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integralrecord` (
  `IntegralID` int NOT NULL AUTO_INCREMENT COMMENT '积分记录ID',
  `Score` int NOT NULL COMMENT '获得分数',
  `Source` varchar(10) NOT NULL COMMENT '积分来源',
  `UserID` int NOT NULL,
  `Date` datetime NOT NULL,
  PRIMARY KEY (`IntegralID`),
  KEY `integralrecord_user_FK` (`UserID`),
  CONSTRAINT `integralrecord_user_FK` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COMMENT='积分记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integralrecord`
--

LOCK TABLES `integralrecord` WRITE;
/*!40000 ALTER TABLE `integralrecord` DISABLE KEYS */;
INSERT INTO `integralrecord` VALUES (5,1,'订阅课程',10,'2024-06-26 09:17:38'),(6,1,'考试通过',10,'2024-06-26 09:18:04'),(7,1,'学习课程',10,'2024-06-26 09:18:23'),(8,1,'学习课程',10,'2024-06-27 01:30:22'),(9,1,'考试通过',10,'2024-06-27 01:35:07'),(10,1,'考试通过',10,'2024-06-27 01:43:02'),(11,1,'订阅课程',12,'2024-06-30 01:43:12'),(12,1,'考试通过',12,'2024-06-30 01:50:39'),(13,1,'订阅课程',12,'2024-06-30 01:51:20'),(14,1,'考试通过',12,'2024-06-30 01:51:31'),(15,1,'考试通过',10,'2024-06-30 06:11:42'),(16,1,'考试通过',10,'2024-06-30 08:18:36'),(17,1,'考试通过',10,'2024-06-30 08:44:43'),(18,1,'订阅课程',10,'2024-06-30 08:59:57'),(19,1,'考试通过',10,'2024-06-30 09:01:32'),(20,1,'考试通过',10,'2024-06-30 11:59:17'),(21,1,'考试通过',10,'2024-06-30 12:02:41'),(22,1,'考试通过',10,'2024-06-30 12:03:40'),(23,1,'订阅课程',10,'2024-06-30 12:04:59'),(24,1,'订阅课程',10,'2024-06-30 12:07:47'),(25,1,'订阅课程',11,'2024-07-09 11:26:59'),(26,1,'考试通过',11,'2024-07-09 11:44:10'),(27,1,'学习课程',11,'2024-07-09 11:44:55'),(28,1,'订阅课程',11,'2024-07-09 11:47:25');
/*!40000 ALTER TABLE `integralrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knowledge`
--

DROP TABLE IF EXISTS `knowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `knowledge` (
  `KnowledgeID` int NOT NULL AUTO_INCREMENT COMMENT '知识点ID',
  `KnowledgeName` varchar(20) NOT NULL COMMENT '知识点名称',
  `KnowledgeDomain` varchar(10) NOT NULL COMMENT '知识点设计领域',
  PRIMARY KEY (`KnowledgeID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3 COMMENT='知识点';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knowledge`
--

LOCK TABLES `knowledge` WRITE;
/*!40000 ALTER TABLE `knowledge` DISABLE KEYS */;
INSERT INTO `knowledge` VALUES (1,'HTML','前端开发'),(2,'CSS','前端开发'),(3,'JavaScript','前端开发'),(4,'前端框架','前端开发'),(5,'服务调用','后端开发'),(6,'配置管理','后端开发'),(7,'服务通信','后端开发'),(8,'模板引擎','后端开发'),(9,'Go语言基础','后端开发'),(10,'Java基础','后端开发'),(11,'Java标准库','后端开发'),(12,'设计模式','后端开发'),(13,'C++基础','后端开发'),(14,'类的继承','后端开发'),(15,'uni-app基础','移动开发'),(16,'uni-app网络','移动开发'),(17,'组件开发','移动开发'),(18,'页面跳转','移动开发'),(19,'微信公众号基础','移动开发'),(20,'微信公众号接口','移动开发'),(21,'微信公众号模式','移动开发'),(22,'微信公众号分类','移动开发'),(23,'Swift语言基础','移动开发'),(24,'Swift语言历史','移动开发'),(25,'Swift语言特性','移动开发'),(26,'Python语言基础','人工智能'),(27,'深度学习基础','人工智能'),(28,'网络模型和框架','人工智能'),(30,'云存储','后端开发'),(31,'开发界面','后端开发'),(33,'小程序开发基础','后端开发'),(34,'数据分析','人工智能');
/*!40000 ALTER TABLE `knowledge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qanda`
--

DROP TABLE IF EXISTS `qanda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qanda` (
  `QAndAID` int NOT NULL AUTO_INCREMENT,
  `QuestionContent` varchar(500) NOT NULL COMMENT '提问内容',
  `AnswerContent` longtext NOT NULL COMMENT '回答内容',
  `Time` varchar(100) NOT NULL COMMENT '提问时间',
  `DialogBoxID` int NOT NULL,
  PRIMARY KEY (`QAndAID`),
  KEY `qanda_dialogbox_FK` (`DialogBoxID`),
  CONSTRAINT `qanda_dialogbox_FK` FOREIGN KEY (`DialogBoxID`) REFERENCES `dialogbox` (`DialogBoxID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb3 COMMENT='人工智能提问回答';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qanda`
--

LOCK TABLES `qanda` WRITE;
/*!40000 ALTER TABLE `qanda` DISABLE KEYS */;
INSERT INTO `qanda` VALUES (116,'你是谁？','您好，我是讯飞星火认知大模型，由科大讯飞构建。\n我的存在旨在通过自然语言处理技术与人类进行流畅的交流，提供问题解答和满足广泛的认知智能需求。作为一个先进的人工智能系统，我能够理解和处理各种信息，支持人们在教育、医疗、金融等多个领域内的查询和任务执行。我的设计初衷是为了提高工作效率，促进知识的传播，并通过智能化的交互方式，帮助人们更好地获取和利用信息。','2024-05-29 18:29:10',90),(117,'你认为1+1等于几','在数学中，1+1等于2。这是基于我们使用的数学系统，即阿拉伯数字和基本的算术运算。这个事实是数学的一个基本规则，广泛被接受和使用。','2024-05-29 18:29:39',90),(118,'你可真聪明','谢谢您的认可！我的智能来源于科大讯飞的不断研发和优化。\n我被设计用来理解和处理语言，解答问题，以及协助解决各种认知任务。如果您有其他疑问或需要帮助，我会尽力为您提供支持和服务。','2024-05-29 18:29:59',90),(119,'为我生成一张照片','我可以为您提供如何生成照片的指导，但请注意，我无法直接创建或展示图片。以下是一些建议：\n1. 选择主题和背景：确定您想要拍摄的主题（如人物、风景等）以及背景。\n2. 使用合适的设备：选择一台高质量的相机或智能手机，并确保它处于良好状态。\n3. 设置光线：考虑光线的方向和强度，以确保照片清晰明亮。\n4. 调整相机设置：根据需要调整ISO、光圈和快门速度等相机设置。\n5. 构图和对焦：仔细安排主题在画面中的位置，并确保对焦点准确。\n6. 拍摄照片：按下快门按钮，捕捉您想要的场景。\n7. 后期处理：使用图像编辑软件进行必要的调整，如裁剪、调整亮度/对比度等。\n8. 保存和分享：将照片保存到您的设备上，并与他人分享或打印出来。\n请记住，摄影是一门艺术，需要时间和实践来提高。不断尝试不同的技巧和设置，以找到适合您风格的方法。','2024-05-29 18:51:19',90),(126,'你好','你好！有什么可以帮你的吗？如果你有任何问题或者需要信息，随时欢迎提出。','2024-05-29 18:58:39',93),(127,'你是？','你好！我是讯飞星火认知大模型，一个由科大讯飞构建的认知智能大模型。\n我的主要功能是帮助用户回答问题并且提供信息。','2024-05-29 19:06:07',93),(128,'你是？','你好！我是讯飞星火认知大模型，一个由科大讯飞构建的认知智能大模型。\n我的主要功能是帮助用户回答问题并且提供信息。','2024-05-29 19:08:48',93),(129,'1+1？','1 + 1 = 2','2024-05-29 19:10:40',93),(130,'1+1','1 + 1 = 2','2024-05-29 19:10:47',93),(132,'123','好的，看起来你可能是在测试或探索对话功能。如果你有任何具体的问题或需要帮助，请随时告诉我！如果\"123\"是一个数学问题或者你有其他的意图，也请详细说明，我很乐意帮助解答。','2024-05-29 19:12:45',93),(133,'是的','好的，如果你有其他问题或需要进一步的帮助，请随时告诉我！无论是数学问题、信息查询还是其他任何主题，我都会尽力提供帮助。','2024-05-29 19:13:29',93),(135,'1','如果你是在询问关于数字\"1\"的数学问题，那么这个数字本身是基本的整数之一。如果你有关于数字\"1\"的具体问题或者需要进一步的数学帮助，请详细说明，我会很乐意帮助解答。','2024-05-29 19:16:38',93),(137,'是的','了解，如果你有其他问题或需要进一步的帮助，请随时告诉我！无论是数学问题、信息查询还是其他任何主题，我都会尽力提供帮助。','2024-05-29 19:21:30',90),(138,'好','好的！如果你有任何问题或需要帮助，随时欢迎回来。祝你有一个美好的一天！','2024-05-29 19:23:17',90),(142,'ok','好的，如果你有其他问题或需要进一步的帮助，请随时告诉我！无论是数学问题、信息查询还是其他任何主题，我都会尽力提供帮助。','2024-05-29 19:35:54',93),(146,'你好','你好！有什么我可以帮助你的吗？','2024-05-29 22:12:42',96),(147,'给我介绍一下操作系统','**操作系统是管理计算机硬件与软件资源的系统软件，同时也是提供用户操作界面的程序**','2024-05-29 22:13:04',96),(148,'还有呢','移动操作系统和嵌入式操作系统等。\n\n2.操作系统（Operating System，简称OS）是管理计算机硬件与软件资源的程序，它是系统软件的重要组成部分。以下是一些关于操作系统的详细介绍：\n\n### 1. **组成**\n   - **内核**：内核是操作系统的核心部分，负责处理CPU、内存和输入输出设备的管理和调度工作。\n 基本功能\n- **进程管理**：负责创建、调度和管理进程和线程。\n','2024-05-29 22:13:21',96),(149,'为我编写一段C++的示例代码','```cpp\n#include <iostream>\n\nint main() {\n    std::cout << \"Hello, World!\" << std::endl;\n    return 0;\n}\n```','2024-05-29 22:14:18',99),(154,'嗯。','您好！您似乎想表达一些内容，但目前我还未完全理解您的意图。为了更好地帮助您，请提供更多的信息或具体化您的问题。例如，您可以分享：\n1. 您感兴趣的主题或想要探讨的具体问题。\n2. 您对某个话题的看法或疑问。\n3. 您正在面临的挑战或需要帮助的事项。\n4. 任何其他您希望讨论的内容。\n一旦我了解您的具体需求，我将能够提供更加精准和有用的回答。期待您的进一步说明，谢谢！','2024-05-30 16:06:02',103),(155,'是的','好的，我明白了。您有什么需要帮助的吗？','2024-05-30 16:06:33',103),(156,'请问1+1等于几？','1+1等于2。','2024-05-30 16:17:46',103);
/*!40000 ALTER TABLE `qanda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_knowledge`
--

DROP TABLE IF EXISTS `question_knowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_knowledge` (
  `TestQuestionID` int NOT NULL COMMENT '试题ID',
  `KnowledgeID` int NOT NULL COMMENT '知识点ID',
  KEY `question_knowledge_testquestion_FK` (`TestQuestionID`),
  KEY `question_knowledge_knowledge_FK` (`KnowledgeID`),
  CONSTRAINT `question_knowledge_knowledge_FK` FOREIGN KEY (`KnowledgeID`) REFERENCES `knowledge` (`KnowledgeID`),
  CONSTRAINT `question_knowledge_testquestion_FK` FOREIGN KEY (`TestQuestionID`) REFERENCES `testquestion` (`TestQuestionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_knowledge`
--

LOCK TABLES `question_knowledge` WRITE;
/*!40000 ALTER TABLE `question_knowledge` DISABLE KEYS */;
INSERT INTO `question_knowledge` VALUES (2,3),(2,3),(2,3),(2,3),(2,4),(3,2),(3,3),(3,4),(4,1),(4,2),(4,3),(4,4),(5,1),(4,2),(5,3),(5,4),(6,2),(6,3),(6,4),(7,1),(7,2),(8,1),(8,2),(8,3),(9,1),(9,2),(9,3),(10,1),(10,2),(10,3),(11,5),(11,33),(12,5),(12,6),(12,33),(13,33),(13,31),(14,30),(14,33),(15,33),(15,5),(15,7),(16,3),(16,4),(16,1),(17,1),(17,3),(17,4),(18,1),(18,2),(18,3),(18,4),(19,1),(19,2),(19,3),(19,4),(20,1),(20,2),(20,3),(20,4),(21,5),(21,6),(21,7),(21,8),(22,5),(22,6),(22,7),(23,6),(23,7),(23,8),(24,5),(24,6),(24,7),(24,8),(25,5),(25,6),(25,7),(26,26),(26,27),(27,26),(27,27),(27,28),(28,26),(28,27),(28,28),(29,26),(29,27),(30,26),(30,27),(30,28),(31,6),(31,6),(32,6),(32,9),(33,6),(33,9),(34,6),(34,8),(34,9),(35,6),(35,8),(35,9),(36,10),(36,11),(36,12),(37,10),(37,11),(38,10),(38,11),(38,12),(38,13),(39,10),(39,11),(39,12),(40,10),(40,11),(40,12),(41,26),(42,26),(43,26),(43,34),(44,26),(44,27),(45,10),(45,26),(45,13),(46,15),(46,16),(47,15),(47,16),(48,15),(49,15),(49,18),(50,15),(50,17),(51,19),(51,21),(51,22),(52,19),(52,20),(52,21),(53,19),(53,21),(54,19),(54,20),(55,19),(55,21),(56,10),(56,13),(56,26),(56,23),(57,23),(57,24),(58,10),(58,13),(58,23),(58,26),(59,23),(59,25),(60,23),(60,25),(61,12),(61,13),(62,10),(62,13),(62,14),(62,23),(63,13),(63,12),(64,13),(65,13),(65,14);
/*!40000 ALTER TABLE `question_knowledge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_testpaper`
--

DROP TABLE IF EXISTS `question_testpaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_testpaper` (
  `TestQuestionID` int NOT NULL COMMENT '试卷ID',
  `TestPaperID` int NOT NULL COMMENT '知识点ID',
  `Score` int NOT NULL COMMENT '试题分数',
  `SortNum` int NOT NULL COMMENT '试题序号',
  KEY `question_testpaper_testquestion_FK` (`TestQuestionID`),
  KEY `question_testpaper_testpaper_FK` (`TestPaperID`),
  CONSTRAINT `question_testpaper_testpaper_FK` FOREIGN KEY (`TestPaperID`) REFERENCES `testpaper` (`TestPaperID`),
  CONSTRAINT `question_testpaper_testquestion_FK` FOREIGN KEY (`TestQuestionID`) REFERENCES `testquestion` (`TestQuestionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_testpaper`
--

LOCK TABLES `question_testpaper` WRITE;
/*!40000 ALTER TABLE `question_testpaper` DISABLE KEYS */;
INSERT INTO `question_testpaper` VALUES (1,1,10,1),(2,1,10,2),(3,1,10,3),(4,1,10,4),(5,1,10,5),(1,2,10,1),(2,2,10,2),(3,2,10,3),(4,2,10,4),(5,2,10,5),(6,3,10,1),(7,3,10,2),(8,3,10,3),(9,3,10,4),(10,3,10,5),(11,4,10,1),(12,4,10,2),(13,4,10,3),(14,4,10,4),(15,4,10,5),(16,5,10,1),(17,5,10,2),(18,5,10,3),(19,5,10,4),(20,5,10,5),(21,6,10,1),(22,6,10,2),(23,6,10,3),(24,6,10,4),(25,6,10,5),(26,7,10,1),(27,7,10,2),(28,7,10,3),(29,7,10,4),(30,7,10,5),(31,8,10,1),(32,8,10,2),(33,8,10,3),(34,8,10,4),(35,8,10,5),(36,9,10,1),(37,9,10,2),(38,9,10,3),(39,9,10,4),(40,9,10,5),(41,10,10,1),(42,10,10,2),(43,10,10,3),(44,10,10,4),(45,10,10,5),(46,11,10,1),(47,11,10,2),(48,11,10,3),(49,11,10,4),(50,11,10,5),(51,12,10,1),(52,12,10,2),(53,12,10,3),(54,12,10,4),(55,12,10,5),(56,13,10,1),(57,13,10,2),(58,13,10,3),(59,13,10,4),(60,13,10,5),(61,14,10,1),(62,14,10,2),(63,14,10,3),(64,14,10,4),(65,14,10,5),(3,15,10,1),(10,15,10,2),(12,15,10,3),(15,15,10,4),(4,15,10,5),(35,15,10,6),(19,15,10,7),(9,15,10,8),(21,15,10,9),(33,15,10,10);
/*!40000 ALTER TABLE `question_testpaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studypath`
--

DROP TABLE IF EXISTS `studypath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studypath` (
  `StudyPathID` int NOT NULL AUTO_INCREMENT,
  `StudyPathName` varchar(255) NOT NULL COMMENT '学习路径名字',
  `StudyPathDescription` varchar(500) NOT NULL COMMENT '学习路径描述',
  `StudyPathCover` varchar(500) NOT NULL COMMENT '学习路径封面',
  `StudyPathClassification` varchar(10) NOT NULL COMMENT '学习路径分类',
  `CourseNumber` int NOT NULL COMMENT '课程数量',
  PRIMARY KEY (`StudyPathID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='学习路径';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studypath`
--

LOCK TABLES `studypath` WRITE;
/*!40000 ALTER TABLE `studypath` DISABLE KEYS */;
INSERT INTO `studypath` VALUES (1,'从Java到Python两大王牌语言一次搞定','在Web的迅速发展中，Java被广泛接受并起到了绝对的推动作用。近几年，Python语言也受到了大多数程序员的青睐，本套课程一次搞定两大核心开发语言。','https://meedu-cos.meedu.xyz/images/K2rKWTsz985CgxOCPq7acb5DJtpAeDikuIrNJWTR.png','编程开发',4),(2,'前端工程师0基础从入门到大型项目构建','0基础学前端工程师，打造全栈能力知识体系,从网页搭建再到移动APP，小程序开发，一套课程，直达就业！','https://meedu-cos.meedu.xyz/images/ea0wSNSwa6xvVAb0U34iaxRSlJoNkMaRrlI254FC.png','编程开发',4),(3,'产品运营到数据分析高薪必修课','无论你是零基础的小白、初级用户研究员或是以用户为中心的产品经理、设计师、运营、市场等，学完本套课程，都将成为会“读心术”的用户研究员，牢牢“黏”住用户！','https://meedu-cos.meedu.xyz/images/63eaQMKsRTzfH9XvxY9ugHOFUx4g5K100x9cHVkh.png','产品运营',3);
/*!40000 ALTER TABLE `studypath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studypathmodule`
--

DROP TABLE IF EXISTS `studypathmodule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studypathmodule` (
  `ModuleID` int NOT NULL AUTO_INCREMENT COMMENT '模块ID',
  `ModuleName` varchar(255) NOT NULL COMMENT '模块名称',
  `ModuleDescription` varchar(500) NOT NULL COMMENT '模块描述',
  `StudyPathID` int DEFAULT NULL,
  PRIMARY KEY (`ModuleID`),
  KEY `studypathmodule_studypath_FK` (`StudyPathID`),
  CONSTRAINT `studypathmodule_studypath_FK` FOREIGN KEY (`StudyPathID`) REFERENCES `studypath` (`StudyPathID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='学习路径模块';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studypathmodule`
--

LOCK TABLES `studypathmodule` WRITE;
/*!40000 ALTER TABLE `studypathmodule` DISABLE KEYS */;
INSERT INTO `studypathmodule` VALUES (1,'Java语言核心技术','课程主要内容包括Java语言基础知识、面向对象思想的实现及使用、Java异常处理机制等，通过经典案例为学生打下坚实的语言基础。',1),(2,'Python基础到提高','面向所有希望学习Python编程、进而能够在学习和工作中编写办公自动化、网页信息提取、数据分析处理、人工智能应用、娱乐游戏应用等实用程序的各行业人士。',1),(3,'前端基础入门','掌握H5语法和CSS3的样式，完成静态布局。掌握H5语法和CSS3的样式，完成静态布局。',2),(4,'必学框架到项目实战','Vue.JS 是目前火的前端框架之一,是一个构建数据驱动的 web 界面的渐进式框架。让我们真正的从零开始，真真正正完全系统学习Vue。',2),(5,'用户需求市场研究','本阶段课程帮助你洞察用户心理和行为，提取用户需求，设计出让用户惊艳的产品。',3),(6,'Python+SQL+算法+大数据分析，大厂专家讲师带你从0到1，多项企业级应用实战让你做会写代码的数据分析师！','Python+SQL+算法+大数据分析，大厂专家讲师带你从0到1，多项企业级应用实战让你做会写代码的数据分析师！',3);
/*!40000 ALTER TABLE `studypathmodule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `TeacherID` int NOT NULL AUTO_INCREMENT,
  `TeacherName` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `TeacherPassword` varchar(100) NOT NULL,
  `TeacherPhone` varchar(100) NOT NULL,
  `TeacherToken` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TeacherID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='教师端';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES (1,'教师','$2a$10$lxc3ye77wj4C.3R6cszgxumrYJfNlPM6EufiO7vv0ZIlVv4Zoqzvq','13765782522',NULL);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachermonitor`
--

DROP TABLE IF EXISTS `teachermonitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachermonitor` (
  `TeacherMonitorID` int NOT NULL AUTO_INCREMENT,
  `Type` int NOT NULL COMMENT '1、上课睡觉；2、上课吃东西打哈欠；3、考试违规',
  `UserID` int NOT NULL,
  `Time` datetime DEFAULT NULL,
  PRIMARY KEY (`TeacherMonitorID`),
  KEY `teachermonitor_user_FK` (`UserID`),
  CONSTRAINT `teachermonitor_user_FK` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COMMENT='教师查看学生上课睡觉吃东西以及考试违规次数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachermonitor`
--

LOCK TABLES `teachermonitor` WRITE;
/*!40000 ALTER TABLE `teachermonitor` DISABLE KEYS */;
INSERT INTO `teachermonitor` VALUES (2,3,10,'2024-06-20 00:36:49'),(3,3,10,'2024-06-21 00:35:49'),(4,1,11,'2024-06-21 00:35:49'),(5,2,10,'2024-06-21 00:35:49'),(6,2,11,'2024-06-21 00:35:49'),(7,2,11,'2024-06-20 00:35:49'),(8,2,11,'2024-06-21 00:30:49'),(20,1,10,'2024-06-15 00:35:49'),(21,1,11,'2024-06-15 00:35:49'),(22,2,10,'2024-06-16 00:35:49'),(23,2,11,'2024-06-17 00:35:49'),(24,2,11,'2024-06-18 00:35:49'),(25,2,11,'2024-06-18 00:30:49'),(26,2,10,'2024-06-21 02:38:38'),(27,1,10,'2024-06-25 02:39:17'),(28,3,11,'2024-06-21 02:40:50');
/*!40000 ALTER TABLE `teachermonitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testanalyse`
--

DROP TABLE IF EXISTS `testanalyse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testanalyse` (
  `TestAnalyseID` int NOT NULL AUTO_INCREMENT COMMENT '考试分析ID',
  `QuestionNumber` int NOT NULL COMMENT '题目总数',
  `CorrectQuantity` int NOT NULL COMMENT '正确数量',
  `Accuracy` float DEFAULT NULL COMMENT '正确率',
  `AccuracyProposal` varchar(100) DEFAULT NULL COMMENT '正确率建议',
  `KnowledgeMasterProposal` varchar(100) DEFAULT NULL COMMENT '知识点掌握情况建议',
  `RecommendCourse` varchar(100) DEFAULT NULL COMMENT '推荐课程',
  `TestRecordID` int DEFAULT NULL COMMENT '考试记录ID',
  `UserID` int NOT NULL,
  PRIMARY KEY (`TestAnalyseID`),
  KEY `testanalyse_testrecord_FK` (`TestRecordID`),
  KEY `testanalyse_user_FK` (`UserID`),
  CONSTRAINT `testanalyse_testrecord_FK` FOREIGN KEY (`TestRecordID`) REFERENCES `testrecord` (`TestRecordID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `testanalyse_user_FK` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3 COMMENT='考试分析';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testanalyse`
--

LOCK TABLES `testanalyse` WRITE;
/*!40000 ALTER TABLE `testanalyse` DISABLE KEYS */;
INSERT INTO `testanalyse` VALUES (1,5,2,0.4,'你的正确率很低，需要加强练习！',NULL,NULL,19,10),(2,5,2,0.4,'你的正确率很低，需要加强练习！',NULL,NULL,21,10),(3,5,2,0.4,'你的正确率很低，需要加强练习！',NULL,NULL,22,11),(4,5,2,0.4,'你的正确率很低，需要加强练习！',NULL,NULL,24,11),(5,5,1,0.2,'你的正确率很低，需要加强练习！',NULL,NULL,25,11),(6,5,5,1,'你的正确率很高，继续保持！',NULL,NULL,26,11),(7,5,3,0.6,'你的正确率一般，继续努力！',NULL,NULL,27,11),(8,5,3,0.6,'你的正确率一般，继续努力！',NULL,NULL,28,11),(9,5,3,0.6,'你的正确率一般，继续努力！',NULL,NULL,29,11),(10,5,3,0.6,'你的正确率一般，继续努力！',NULL,NULL,30,11),(11,5,4,0.8,'你的正确率很高，继续保持！',NULL,NULL,32,11),(12,5,4,0.8,'你的正确率很高，继续保持！',NULL,NULL,33,11),(13,5,4,0.8,'你的正确率很高，继续保持！',NULL,NULL,35,10),(14,5,3,0.6,'你的正确率一般，继续努力！',NULL,NULL,36,10),(15,5,4,0.8,'你的正确率很高，继续保持！',NULL,NULL,37,10),(16,5,4,0.8,'你的正确率很高，继续保持！',NULL,NULL,38,10),(17,5,4,0.8,'你的正确率很高，继续保持！',NULL,NULL,39,10),(18,5,3,0.6,'你的正确率一般，继续努力！',NULL,NULL,40,10),(19,5,3,0.6,'你的正确率一般，继续努力！','你的知识点4掌握地很好，不过你的知识点6的掌握情况还需加强！','2,3,5',43,10),(20,5,4,0.8,'你的正确率很高，继续保持！','你的知识点4掌握地很好，不过你的知识点6的掌握情况还需加强！','2,3,5',44,10),(21,5,2,0.4,'你的正确率很低，需要加强练习！','你的知识点3掌握地很好，不过你的知识点1的掌握情况还需加强！','2,3,5',45,10),(22,5,3,0.6,'你的正确率一般，继续努力！','你的知识点4掌握地很好，不过你的知识点6的掌握情况还需加强！','2,3,5',46,12),(23,5,4,0.8,'你的正确率很高，继续保持！','你的知识点4掌握地很好，不过你的知识点6的掌握情况还需加强！','2,3,5',47,12),(24,5,3,0.6,'你的正确率一般，继续努力！',NULL,NULL,54,10),(25,5,4,0.8,'你的正确率很高，继续保持！',NULL,NULL,55,10),(26,5,3,0.6,'你的正确率一般，继续努力！',NULL,NULL,56,10),(27,5,5,1,'你的正确率很高，继续保持！',NULL,NULL,57,10),(28,5,4,0.8,'你的正确率很高，继续保持！','你的C++基础掌握地很好，不过你的设计模式的掌握情况还需加强！','2,3,5',58,10),(29,5,4,0.8,'你的正确率很高，继续保持！','你的服务调用掌握地很好，不过你的云存储的掌握情况还需加强！','2,3,5',59,10),(30,5,3,0.6,'你的正确率一般，继续努力！','你的Java基础掌握地很好，不过你的数据分析的掌握情况还需加强！','2,3,5',60,10),(31,5,1,0.2,'你的正确率很低，需要加强练习！','你的模板引擎掌握地很好，不过你的配置管理的掌握情况还需加强！','2,3,5',61,10),(32,5,2,0.4,'你的正确率很低，需要加强练习！','你的微信公众号分类掌握地很好，不过你的微信公众号基础的掌握情况还需加强！','2,3,4',62,10),(33,10,4,0.4,'你的正确率很低，需要加强练习！','你的小程序开发基础掌握地很好，不过你的模板引擎的掌握情况还需加强！','2,3,5',63,11),(34,5,4,0.8,'你的正确率很高，继续保持！','你的服务调用掌握地很好，不过你的云存储的掌握情况还需加强！','2,3,5',64,11),(35,5,0,0,'你的正确率很低，需要加强练习！','你的配置管理掌握地很好，不过你的配置管理的掌握情况还需加强！','2,3,5',65,11),(36,5,2,0.4,'你的正确率很低，需要加强练习！','你的Python语言基础掌握地很好，不过你的数据分析的掌握情况还需加强！','2,3,5',66,11);
/*!40000 ALTER TABLE `testanalyse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testanalyse_knowledge`
--

DROP TABLE IF EXISTS `testanalyse_knowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testanalyse_knowledge` (
  `TestAnalyseID` int NOT NULL COMMENT '考试分析ID',
  `KnowledgeID` int NOT NULL COMMENT '知识点ID',
  `ContainKnowledgeNum` int DEFAULT NULL COMMENT '试卷中包含知识点个数',
  `CorrectKnowledgeNum` int DEFAULT NULL COMMENT '正确知识点个数',
  KEY `testanalyse_knowledge_testanalyse_FK` (`TestAnalyseID`),
  KEY `testanalyse_knowledge_knowledgeID_FK` (`KnowledgeID`),
  CONSTRAINT `testanalyse_knowledge_knowledgeID_FK` FOREIGN KEY (`KnowledgeID`) REFERENCES `knowledge` (`KnowledgeID`),
  CONSTRAINT `testanalyse_knowledge_testanalyse_FK` FOREIGN KEY (`TestAnalyseID`) REFERENCES `testanalyse` (`TestAnalyseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testanalyse_knowledge`
--

LOCK TABLES `testanalyse_knowledge` WRITE;
/*!40000 ALTER TABLE `testanalyse_knowledge` DISABLE KEYS */;
INSERT INTO `testanalyse_knowledge` VALUES (1,1,2,1),(1,2,3,2),(1,4,1,1),(1,5,2,1),(1,6,1,0),(1,7,1,0),(1,3,1,0),(2,1,2,1),(2,2,3,2),(2,4,1,1),(2,5,2,1),(2,6,1,0),(2,7,1,0),(2,3,1,0),(3,1,2,1),(3,2,3,2),(3,4,1,1),(3,5,2,1),(3,6,1,0),(3,7,1,0),(3,3,1,0),(4,1,2,1),(4,2,3,2),(4,4,1,1),(4,5,2,1),(4,6,1,0),(4,7,1,0),(4,3,1,0),(5,1,2,0),(5,2,3,1),(5,4,1,0),(5,5,2,1),(5,6,1,0),(5,7,1,0),(5,3,1,0),(6,1,2,2),(6,2,3,3),(6,4,1,1),(6,5,2,2),(6,6,1,1),(6,7,1,1),(6,3,1,1),(7,1,2,1),(7,2,3,2),(7,4,1,1),(7,5,2,1),(7,6,1,0),(7,7,1,1),(7,3,1,0),(8,1,2,1),(8,2,3,2),(8,4,1,1),(8,5,2,1),(8,6,1,0),(8,7,1,1),(8,3,1,0),(9,1,2,1),(9,2,3,2),(9,4,1,1),(9,5,2,1),(9,6,1,0),(9,7,1,1),(9,3,1,0),(10,1,2,1),(10,2,3,2),(10,4,1,1),(10,5,2,1),(10,6,1,0),(10,7,1,1),(10,3,1,0),(11,1,2,1),(11,2,3,2),(11,4,1,1),(11,5,2,1),(11,6,1,0),(11,7,1,1),(11,3,1,1),(12,1,2,1),(12,2,3,2),(12,4,1,1),(12,5,2,1),(12,6,1,0),(12,7,1,1),(12,3,1,1),(13,1,2,1),(13,2,3,2),(13,4,1,1),(13,5,2,1),(13,6,1,0),(13,7,1,1),(13,3,1,1),(14,1,2,1),(14,2,3,2),(14,4,1,1),(14,5,2,1),(14,6,1,0),(14,7,1,1),(14,3,1,0),(15,1,2,1),(15,2,3,2),(15,4,1,1),(15,5,2,1),(15,6,1,0),(15,7,1,1),(15,3,1,1),(16,1,2,1),(16,2,3,2),(16,4,1,1),(16,5,2,1),(16,6,1,0),(16,7,1,1),(16,3,1,1),(17,1,2,1),(17,2,3,2),(17,4,1,1),(17,5,2,1),(17,6,1,0),(17,7,1,1),(17,3,1,1),(18,1,2,1),(18,2,3,2),(18,4,1,1),(18,5,2,1),(18,6,1,0),(18,7,1,1),(18,3,1,0),(19,1,2,1),(19,2,3,2),(19,4,1,1),(19,5,2,1),(19,6,1,0),(19,7,1,1),(19,3,1,0),(20,1,2,1),(20,2,3,2),(20,4,1,1),(20,5,2,1),(20,6,1,0),(20,7,1,1),(20,3,1,1),(21,1,2,0),(21,2,3,1),(21,4,1,0),(21,5,2,1),(21,6,1,0),(21,7,1,0),(21,3,1,1),(22,1,2,1),(22,2,3,2),(22,4,1,1),(22,5,2,1),(22,6,1,0),(22,7,1,1),(22,3,1,0),(23,1,2,1),(23,2,3,2),(23,4,1,1),(23,5,2,1),(23,6,1,0),(23,7,1,1),(23,3,1,1),(28,10,5,4),(28,11,5,4),(28,12,4,3),(28,13,1,1),(29,5,3,3),(29,33,5,4),(29,6,1,1),(29,31,1,1),(29,30,1,0),(29,7,1,1),(30,26,5,3),(30,34,1,0),(30,27,1,0),(30,10,1,1),(30,13,1,1),(31,5,4,1),(31,6,5,1),(31,7,5,1),(31,8,3,1),(32,19,5,2),(32,21,4,2),(32,22,1,1),(32,20,2,1),(33,2,6,3),(33,3,5,2),(33,4,3,1),(33,1,4,2),(33,5,3,2),(33,6,4,1),(33,33,2,2),(33,7,2,1),(33,8,2,0),(33,9,2,0),(34,5,3,3),(34,33,5,4),(34,6,1,1),(34,31,1,1),(34,30,1,0),(34,7,1,1),(35,6,6,0),(35,9,4,0),(35,8,2,0),(36,26,5,2),(36,34,1,0),(36,27,1,0),(36,10,1,0),(36,13,1,0);
/*!40000 ALTER TABLE `testanalyse_knowledge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testpaper`
--

DROP TABLE IF EXISTS `testpaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testpaper` (
  `TestPaperID` int NOT NULL AUTO_INCREMENT COMMENT '试卷ID',
  `TestPaperName` varchar(20) NOT NULL COMMENT '试卷名称',
  `FullScore` int NOT NULL COMMENT '试卷满分',
  `PassScore` int NOT NULL COMMENT '试卷及格分',
  `QuestionNumber` int NOT NULL COMMENT '题目数量',
  `Duration` varchar(100) NOT NULL COMMENT '持续时间',
  `ForUserID` int DEFAULT NULL COMMENT '用户智能生成的试卷',
  PRIMARY KEY (`TestPaperID`),
  KEY `ForUserID` (`ForUserID`),
  CONSTRAINT `testpaper_ibfk_1` FOREIGN KEY (`ForUserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COMMENT='试卷';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testpaper`
--

LOCK TABLES `testpaper` WRITE;
/*!40000 ALTER TABLE `testpaper` DISABLE KEYS */;
INSERT INTO `testpaper` VALUES (1,'Web前端',50,30,5,'5',NULL),(2,'每日练习6月17日',50,30,5,'5',10),(3,'HTML5',50,30,5,'5',NULL),(4,'微信小程序',50,30,5,'5',NULL),(5,'前端框架Vue',50,30,5,'5',NULL),(6,'SpringCloud',50,30,5,'5',NULL),(7,'Pytorch深度学习',50,30,5,'5',NULL),(8,'Go Web开发',50,30,5,'5',NULL),(9,'Java入门',50,30,5,'5',NULL),(10,'Python数据分析',50,30,5,'5',NULL),(11,'Uni-app',50,30,5,'5',NULL),(12,'微信公众号',50,30,5,'5',NULL),(13,'iOS+Swift',50,30,5,'5',NULL),(14,'C++编程',50,30,5,'5',NULL),(15,'每日练习2024年7月9日',100,60,10,'60',11);
/*!40000 ALTER TABLE `testpaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testquestion`
--

DROP TABLE IF EXISTS `testquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testquestion` (
  `TestQuestionID` int NOT NULL AUTO_INCREMENT COMMENT '试题ID',
  `QuestionText` varchar(500) NOT NULL COMMENT '题干文字',
  `QuestionImage` varchar(500) DEFAULT NULL COMMENT '题干图片',
  `QuestionType` varchar(10) NOT NULL COMMENT '题目类型',
  `SingleChoice` json DEFAULT NULL COMMENT '单选选项',
  `MultipleChoice` json DEFAULT NULL COMMENT '多选选项',
  `FillBlankQuantity` int DEFAULT NULL COMMENT '填空数量',
  `SingleChoiceAnswer` char(1) DEFAULT NULL COMMENT '单选答案',
  `MultipleChoiceAnswer` json DEFAULT NULL COMMENT '多选答案',
  `JudgeAnswer` tinyint(1) DEFAULT NULL COMMENT '判断答案',
  `FillBlankAnswer` json DEFAULT NULL COMMENT '填空答案',
  `Analysis` varchar(500) DEFAULT NULL COMMENT '解析',
  PRIMARY KEY (`TestQuestionID`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb3 COMMENT='试题';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testquestion`
--

LOCK TABLES `testquestion` WRITE;
/*!40000 ALTER TABLE `testquestion` DISABLE KEYS */;
INSERT INTO `testquestion` VALUES (1,'以下代码段中，哪一个CSS属性用于实现图片的旋转效果？()','https://img1.baidu.com/it/u=2945689840,3146261324&fm=253&fmt=auto&app=138&f=JPEG?w=946&h=500','单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"opacity\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"transform\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"transition\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"animation\"}]',NULL,NULL,'B',NULL,NULL,NULL,'transform: 用于应用2D或3D变换，如旋转、缩放、平移或倾斜。'),(2,'向页面输出“Hello World”的正确javascript语法是（）',NULL,'单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"document.write(\\\"Hello World\\\")\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"\\\"Hello World\\\"\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"response.write(\\\"Hello World\\\")\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"(\\\"Hello World\\\")\"}]',NULL,NULL,'A',NULL,NULL,NULL,'document.write 可以在页面加载时输出 HTML 或文本内容到文档流中，通常用于简单的页面输出'),(3,'以下用于设置背景的属性有（）',NULL,'多选题',NULL,'[{\"option\": \"A\", \"checked\": false, \"content\": \"background-image\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"background-width\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"background-attachment\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"Background-color\"}]',NULL,'','[\"A\", \"C\", \"D\"]',NULL,NULL,'background-width: 不是有效的CSS属性。CSS中没有名为background-width的属性'),(4,'Web前端开发中，最重要的三个技能是（）',NULL,'填空题',NULL,NULL,3,NULL,NULL,NULL,'[\"HTML\", \"CSS\", \"JavaScript\"]','前端三件套：HTML、CSS、JavaScript'),(5,'Chrome开发者工具提供了Web开发工具和调试工具',NULL,'判断题',NULL,NULL,NULL,NULL,NULL,1,NULL,'Chrome开发者工具（Chrome DevTools）是一个内置于Chrome浏览器中的强大工具集合，专门为Web开发人员设计'),(6,'在Canvas中，如何将一个矩形旋转45度？（）','https://img-blog.csdnimg.cn/img_convert/cb73ef0791da216fcd4de27f57eacf1c.png','单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"ctx.rotate(45);\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"ctx.rotate(45 * Math.PI / 180);\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"ctx.rotate(45 / Math.PI * 180);\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"ctx.rotate(45 / 180 * Math.PI);\"}]',NULL,NULL,'B',NULL,NULL,NULL,'45 度转换为弧度的公式是 45 * Math.PI / 180'),(7,'内联元素：请选择产生加粗字体的HTML标签（）',NULL,'单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"<strong>\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"<span>\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"<em>\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"<b>\"}]',NULL,NULL,'A',NULL,NULL,NULL,'<strong>是一个语义化标签，用于表示重要文本，通常浏览器会以加粗字体显示其内容。'),(8,'下面哪些是<Link>标签的常用属性',NULL,'多选题',NULL,'[{\"option\": \"A\", \"checked\": false, \"content\": \"href\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"rel\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"type\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"title\"}]',NULL,'','[\"A\", \"B\", \"C\"]',NULL,NULL,'title 属性通常用于描述链接的额外信息或提供额外的提示文本，但不适用于 <link> 标签'),(9,'在<input>标签中将type属性设置成（）即可定义单项选择按钮',NULL,'填空题',NULL,NULL,1,NULL,NULL,NULL,'[\"radio\"]','在 <input> 标签中将 type 属性设置为 radio 时，它定义了一个单选按钮（单项选择按钮）。单选按钮允许用户从一组选项中选择一个选项'),(10,'<b>标签中的文字显示为斜体',NULL,'判断题',NULL,NULL,NULL,NULL,NULL,0,NULL,'<b>标签用于创建粗体文本'),(11,'关于小程序成员类型,不包含以下哪个？（）',NULL,'单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"开发者\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"管理员\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"体验者\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"审核者\"}]',NULL,NULL,'D',NULL,NULL,NULL,'审核者并不是小程序的成员类型，而是在小程序版本提交审核时才会出现的审核流程中的角色。'),(12,'在创建完成的第一个小程序项目中,project.config.json文件属于以下哪种?（）',NULL,'单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"其他文件\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"主体文件\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"项目配置文件\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"页面文件\"}]',NULL,NULL,'C',NULL,NULL,NULL,'project.config.json 是小程序项目的配置文件，用于存储项目配置信息，例如开发者工具的配置、云开发配置等'),(13,'微信开发者工具的主界面主要由菜单栏和（）组成',NULL,'多选题',NULL,'[{\"option\": \"A\", \"checked\": false, \"content\": \"编辑器\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"模拟器\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"调试器\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"工具栏\"}]',NULL,'','[\"A\", \"B\", \"C\", \"D\"]',NULL,NULL,'微信开发者工具界面主要由五部分组成：菜单栏、编辑器、模拟器、调试器、工具栏'),(14,'开发者可以在（）端和（）端通过API使用云存储功能。',NULL,'填空题',NULL,NULL,2,NULL,NULL,NULL,'[\"小程序\", \"云函数\"]','在小程序开发中，使用云存储功能通常涉及小程序端和云函数端'),(15,'在WXSS中可以通过background引入本地图片',NULL,'判断题',NULL,NULL,NULL,NULL,NULL,0,NULL,'在 WXSS 中，不能直接使用 background 属性来引入本地图片的功能'),(16,'下列哪种数组的方法不会修改数组本身 ？（）',NULL,'单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"slice\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"splice\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"sort\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"unshift\"}]',NULL,NULL,'A',NULL,NULL,NULL,'slice 方法用于从现有数组中返回选定的元素。它不会修改原始数组，而是返回一个新数组，包含从开始到结束（不包括结束）选择的数组元素'),(17,'请问下面那个方法可以删除数组最后一个元素？（）',NULL,'单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"shift()\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"unshift()\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"pop()\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"push()\"}]',NULL,NULL,'C',NULL,NULL,NULL,'pop() 方法用于删除并返回数组的最后一个元素。'),(18,'以下哪些选项属于vue的特性？（）',NULL,'多选题',NULL,'[{\"option\": \"A\", \"checked\": false, \"content\": \"核心只关心视图层\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"轻量级\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"适用于移动端\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"渐进式框架\"}]',NULL,'','[\"A\", \"B\", \"C\", \"D\"]',NULL,NULL,'Vue.js 的这四个特性使其成为开发者喜爱的框架之一，不仅在构建大型单页应用时表现出色，也在小型项目和移动端应用的快速开发中表现优秀'),(19,'MVVM主要包含Model和（）（）两部分',NULL,'填空题',NULL,NULL,2,NULL,NULL,NULL,'[\"View\", \"ViewMode\"]','View：视图层，负责展示用户界面和与用户交互；ViewModel：视图模型，连接视图和数据模型，负责处理业务逻辑和数据状态，将数据绑定到视图上。'),(20,'Vue完全能够为复杂的单页应用提供驱动',NULL,'判断题',NULL,NULL,NULL,NULL,NULL,1,NULL,'Vue.js 完全能够为复杂的单页应用（SPA，Single Page Application）提供驱动'),(21,'启动Ribbon的类注解是（）',NULL,'单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"@RibbonClient\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"@EnableClient\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"@EnableDisscoveryClient\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"@Ribbon\"}]',NULL,NULL,'A',NULL,NULL,NULL,'@RibbonClient 注解用于在 Spring Boot 应用程序中启用 Ribbon 客户端负载均衡功能'),(22,'下列关于springClound不正确的是：（）','https://mmbiz.qpic.cn/mmbiz_jpg/Wc4rFKffLwQY2TtyyvtBzzSaMfVbRapPCyhoVeTSQHageOSib7b9jTc9wK4Z7yQslBWVNRcic0ssQrmpibVgP1ib4Q/640?wx_fmt=jpeg&tp=webp&wxfrom=5&wx_lazy=1&wx_co=1','单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"服务发现——Netflix Eureka\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"客服端负载均衡——Netflix Ribbon\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"断路器——Netflix Hystrix\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"分布式配置——Netflix Zuul\"}]',NULL,NULL,'D',NULL,NULL,NULL,'Netflix Zuul 是一个微服务网关，用于路由和过滤请求，并非专门用于分布式配置管理'),(23,'分布式架构的选择中，关于RPC架构说法正确的有（）',NULL,'多选题',NULL,'[{\"option\": \"A\", \"checked\": false, \"content\": \"RPC开发成本稍高\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"RPC的耦合度低\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"RPC不需要注册中心\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"RPC通信协议效率更高\"}]',NULL,'','[\"A\", \"D\"]',NULL,NULL,'RPC开发成本稍高：RPC 的实现需要定义接口、生成客户端和服务端的代码，可能会增加开发成本；RPC通信协议效率更高：RPC 框架通常使用高效的二进制协议进行通信，相比于基于文本的协议（如 HTTP），具有更高的通信效率。'),(24,'SpringCloud Config实时刷新采用（）',NULL,'填空题',NULL,NULL,1,NULL,NULL,NULL,'[\"SpringCloud Bus消息总线\"]','Spring Cloud Bus 使用消息代理（如 RabbitMQ、Kafka 等）来在分布式系统中传播配置变更事件，从而触发各个服务实例重新加载最新的配置信息，实现配置的实时刷新'),(25,'在Spring Cloud中，服务间通信通常使用消息队列',NULL,'判断题',NULL,NULL,NULL,NULL,NULL,0,NULL,'在Spring Cloud中，服务间通信通常使用RESTful API'),(26,'Pytorch的前身是（）','https://img0.baidu.com/it/u=3565302250,1058491609&fm=253&fmt=auto&app=138&f=JPEG?w=799&h=500','单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"Python\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"lua\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"torch\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"numpy\"}]',NULL,NULL,'C',NULL,NULL,NULL,'Pytorch的前身是torch'),(27,'如果我们用了一个过大的学习速率会发生什么？（）',NULL,'单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"神经网络会收敛\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"不好说\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"都不对\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"神经网络不会收敛\"}]',NULL,NULL,'D',NULL,NULL,NULL,'过大的学习速率可能导致神经网络在训练过程中无法收敛到最优解，甚至可能导致训练过程中损失函数不断波动甚至无法稳定下降'),(28,'以下哪些是深度学习框架？（）',NULL,'多选题',NULL,'[{\"option\": \"A\", \"checked\": false, \"content\": \"LeNet\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"Caffe\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"MXNet\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"Pytorch\"}]',NULL,'','[\"B\", \"C\", \"D\"]',NULL,NULL,'LeNet是深度学习网络模型，而非框架'),(29,'Pytorch的设计遵循tensor->variable->nn.Module三个由低至高的抽象层次，分别代表（）、（）和（）',NULL,'填空题',NULL,NULL,3,NULL,NULL,NULL,'[\"高维数组\", \"自动求导\", \"神经网络\"]','这三个抽象层次之间紧密联系，可以同时进行修改和操作'),(30,'Pytorch通过反向自动求导技术实现了神经网络的零延迟任意改变',NULL,'判断题',NULL,NULL,NULL,NULL,NULL,1,NULL,'Pytorch通过反向自动求导技术实现了神经网络的零延迟任意改变'),(31,'下列哪个不是Go语言的关键字？（）',NULL,'单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"defer\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"break\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"function\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"var\"}]',NULL,NULL,'C',NULL,NULL,NULL,'Go语言的关键字中没有function，其他三个都是Go语言的关键字。'),(32,'下列哪个是Go语言的数据类型？（）',NULL,'单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"String\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"Char\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"Byte\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"Float64\"}]',NULL,NULL,'D',NULL,NULL,NULL,'Go语言的数据类型包括整型、浮点型、布尔型、字符串、数组、切片、字典、结构体等，其中Float64是浮点型数据类型。'),(33,'下列哪个是Go语言的指针操作？（）',NULL,'多选题',NULL,'[{\"option\": \"A\", \"checked\": false, \"content\": \"&x\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"x\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"x++\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"x-\"}]',NULL,'','[\"A\", \"B\"]',NULL,NULL,'Go语言的指针操作包括取地址操作&和取值操作，x++和x–是自增和自减操作。'),(34,'Go语言的模板引擎是（）',NULL,'填空题',NULL,NULL,1,NULL,NULL,NULL,'[\"html/template\"]','Go语言的模板引擎为html/template，Jinja2、Smarty和Handlebars是其他语言的模板引擎。'),(35,'for-if是Go语言的条件语句',NULL,'判断题',NULL,NULL,NULL,NULL,NULL,0,NULL,'Go语言中没有for-if语句，但可以使用if语句嵌套在for循环中。'),(36,'Java跨平台的特点是指？（）',NULL,'单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"面向对象\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"强类型\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"Java字节码文件可以在任何Java虚拟机中执行\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"比其他语言强大\"}]',NULL,NULL,'C',NULL,NULL,NULL,'Java字节码文件可以在任何Java虚拟机中执行'),(37,'Java的前身名字叫（）',NULL,'单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"Oracle\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"MySQL\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"spring\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"OAK\"}]',NULL,NULL,'D',NULL,NULL,NULL,'Java前身叫OAK'),(38,'Java与C语言的区别有哪些？（）',NULL,'多选题',NULL,'[{\"option\": \"A\", \"checked\": false, \"content\": \"面向对象\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"多线程\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"半编译半解释\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"健壮的\"}]',NULL,'','[\"A\", \"C\"]',NULL,NULL,'Java和C的主要区别在于面向对象的特性和半编译半解释性'),(39,'一个Java源程序是由若干个（）组成',NULL,'填空题',NULL,NULL,1,NULL,NULL,NULL,'[\"类\"]','一个Java程序由多个类组成'),(40,'关键字并不是Java语言中已经被赋予特定意义的一些单词',NULL,'判断题',NULL,NULL,NULL,NULL,NULL,0,NULL,'关键字就是Java语言中已经被赋予特定意义的一些单词'),(41,'sum(range(0,101)的结果是？（）',NULL,'单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"5050\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"5151\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"0\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"101\"}]',NULL,NULL,'A',NULL,NULL,NULL,'因为 range(0, 101) 生成了一个从 0 到 100 的整数序列，包括 0 和 100。然后 sum() 函数对这个序列进行求和，即：\r\n0+1+2+…+100=5050\r\n '),(42,'下面哪个不是python合法的标识符？（）',NULL,'单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"int32\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"70XL\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"self\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"__name__\"}]',NULL,NULL,'B',NULL,NULL,NULL,'70XL不是Python的合法标识符'),(43,'下列关于Python数据分析库的描述错误的是（）',NULL,'多选题',NULL,'[{\"option\": \"A\", \"checked\": false, \"content\": \"Numpy的在线安装不需要其他任何辅助工具\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"SciPy的主要功能是可视化图表\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"pandas能够实现数据的整理工作\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"scikit-learn包含所有算法\"}]',NULL,'','[\"A\", \"B\", \"D\"]',NULL,NULL,'pandas 提供了强大的数据结构和数据操作工具，特别适用于数据整理、分析和处理'),(44,'Python序列类型包括（）、（）、（）三种',NULL,'填空题',NULL,NULL,3,NULL,NULL,NULL,'[\"字符串\", \"列表\", \"元祖\"]','Python序列类型包括字符串、列表、元祖三种'),(45,'字典中的值不允许重复',NULL,'判断题',NULL,NULL,NULL,NULL,NULL,0,NULL,'字典中的值允许重复'),(46,'下列哪项是uni-app的优点？（）',NULL,'单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"一套代码可以生成多端\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"社区不大\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"文件命名受限\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"十分简单\"}]',NULL,NULL,'A',NULL,NULL,NULL,'优点主要有：一套代码可以生成多端；学习成本低,语法是vue的,组件是小程序的；拓展能力强；使用HBuilderX开发,支持vue语法；突破了系统对H5条用原生能力的限制'),(47,'uni-app使用uni.request发送网络请求，可设置参数不包括哪一个？（）',NULL,'单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"url\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"method\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"data\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"islogin\"}]',NULL,NULL,'D',NULL,NULL,NULL,'可以使用uni.request方法发送网络请求，通过设置url、method、data等参数来实现不同的请求。'),(48,'uni-app进行条件编译的两种方法是什么？（）',NULL,'多选题',NULL,'[{\"option\": \"A\", \"checked\": false, \"content\": \"#ifdef\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"#ifndef\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"#if\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"#def\"}]',NULL,'','[\"A\", \"B\"]',NULL,NULL,'通过 #ifdef和#ifndef 的方式进行条件编译'),(49,'uni-app中使用（）进行页面的普通跳转',NULL,'填空题',NULL,NULL,1,NULL,NULL,NULL,'[\"uni.navigateTo\"]','uni.navigateTo可以实现页面的普通跳转，uni.redirectTo可以实现页面的重定向跳转，uni.reLaunch可以实现关闭所有页面，打开到应用内的某个页面'),(50,'uni-app可以在页面中引入组件，并在components属性中注册组件，然后在页面中使用',NULL,'判断题',NULL,NULL,NULL,NULL,NULL,1,NULL,'uni-app可以在页面中引入组件，并在components属性中注册组件，然后在页面中使用'),(51,'微信公众号下不包含哪个号？（）',NULL,'单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"订阅号\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"服务号\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"企业号\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"阅读号\"}]',NULL,NULL,'D',NULL,NULL,NULL,'公众号下分为订阅号、服务号和企业号'),(52,'当用户关注公众号后，可以通过哪种方式向用户推送消息',NULL,'单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"每天不超过1条消息\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"每周不超过1条消息\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"每月不超过4条消息\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"每天不超过4条消息\"}]',NULL,NULL,'D',NULL,NULL,NULL,'每天不超过4条消息'),(53,'微信公众号模式有哪些？（）',NULL,'多选题',NULL,'[{\"option\": \"A\", \"checked\": false, \"content\": \"客户关系维护模式\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"品牌营销模式\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"垂直卖货销售模式\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"自媒体模式\"}]',NULL,'','[\"A\", \"B\", \"D\"]',NULL,NULL,'客户关系维护模式、品牌营销模式和自媒体模式描述了不同的使用场景和功能重点，适用于不同的企业或个人需求。'),(54,'微信公众号提供的接口中，用于获取用户基本信息的接口是（）',NULL,'填空题',NULL,NULL,1,NULL,NULL,NULL,'[\"getUserInfo\"]','微信公众号提供的接口中，用于获取用户基本信息的接口是 getUserInfo 或 userInfo。'),(55,'在微信公众号的菜单设置中，可以直接设置跳转到其他小程序的功能。',NULL,'判断题',NULL,NULL,NULL,NULL,NULL,0,NULL,'在微信公众号的菜单设置中，无法直接设置跳转到其他小程序的功能。'),(56,'定义一个数组 var arr:[Int] = [1,2,3,4,5],数组中的arr[3]指的是（）',NULL,'单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"答案：1\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"答案：2\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"答案：3\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"答案：4\"}]',NULL,NULL,'D',NULL,NULL,NULL,'第一个元素的索引从0开始'),(57,'这种属性的名称是什么？\r\nvar messageCount:Int{\r\nreturn message.count\r\n}？（）',NULL,'单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"计算型属性\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"变量属性\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"动态属性\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"单向属性\"}]',NULL,NULL,'A',NULL,NULL,NULL,'属于计算型属性'),(58,'面向对象的语言有哪些特性？（）',NULL,'多选题',NULL,'[{\"option\": \"A\", \"checked\": false, \"content\": \"抽象\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"封装\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"继承\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"多态\"}]',NULL,'','[\"A\", \"B\", \"C\", \"D\"]',NULL,NULL,'面向对象的语言特性包括抽象，封装，继承，多态'),(59,'Swift是一门面向（）的语言',NULL,'填空题',NULL,NULL,1,NULL,NULL,NULL,'[\"对象\"]','Swift是一门面向对象的语言'),(60,'Swift语言是苹果公司在2013年推出的一门新的语言',NULL,'判断题',NULL,NULL,NULL,NULL,NULL,0,NULL,'Swift语言是苹果公司在2014年推出的一门新的语言'),(61,'在每个C++程序中都必须包含有这样一个函数，该函数的函数名为（）',NULL,'单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"main\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"MAIN\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"name\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"function\"}]',NULL,NULL,'A',NULL,NULL,NULL,'main()函数作为主函数'),(62,'类的继承方式有几种？（）',NULL,'单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"两种\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"三种\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"四种\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"六种\"}]',NULL,NULL,'B',NULL,NULL,NULL,'分别为公有继承、私有继承、保护继承'),(63,'下列哪些是C++程序的基本单位？（）',NULL,'多选题',NULL,'[{\"option\": \"A\", \"checked\": false, \"content\": \"函数\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"类\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"变量\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"字符\"}]',NULL,'','[\"A\", \"B\"]',NULL,NULL,'函数是 C++ 中用于封装特定功能的基本单位，是程序执行的基本单元之一；类是 C++ 中用于封装数据和函数的用户定义类型，是面向对象编程的基础，也是程序中组织和管理数据与行为的重要单位。'),(64,'十六进制int型的常量是（）',NULL,'填空题',NULL,NULL,1,NULL,NULL,NULL,'[\"0x5f\"]','十六进制int型的常量是0x5f'),(65,'C++不是面向对象的设计程序语言',NULL,'判断题',NULL,NULL,NULL,NULL,NULL,0,NULL,'C++是面向对象的设计程序语言');
/*!40000 ALTER TABLE `testquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testrecord`
--

DROP TABLE IF EXISTS `testrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testrecord` (
  `TestRecordID` int NOT NULL AUTO_INCREMENT COMMENT '考试记录ID',
  `TestScore` float NOT NULL COMMENT '考试得分',
  `FinishState` tinyint(1) NOT NULL COMMENT '完成状态（true or false）',
  `StartTime` datetime NOT NULL COMMENT '考试开始时间',
  `UserID` int NOT NULL COMMENT '用户ID',
  `TestPaperID` int DEFAULT NULL COMMENT '试卷ID',
  `FinishTime` datetime DEFAULT NULL,
  PRIMARY KEY (`TestRecordID`),
  KEY `testrecord_user_FK` (`UserID`),
  KEY `testrecord_testpaper_FK` (`TestPaperID`),
  CONSTRAINT `testrecord_testpaper_FK` FOREIGN KEY (`TestPaperID`) REFERENCES `testpaper` (`TestPaperID`),
  CONSTRAINT `testrecord_user_FK` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb3 COMMENT='考试记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testrecord`
--

LOCK TABLES `testrecord` WRITE;
/*!40000 ALTER TABLE `testrecord` DISABLE KEYS */;
INSERT INTO `testrecord` VALUES (19,20,1,'2024-06-21 00:35:45',10,1,'2024-06-21 01:06:11'),(20,0,0,'2024-06-20 00:35:49',10,1,'2024-06-20 00:38:49'),(21,20,1,'2024-06-21 01:06:05',10,1,'2024-06-21 01:06:11'),(22,20,1,'2024-06-21 02:40:45',11,1,'2024-06-21 02:40:53'),(23,0,0,'2024-06-24 07:00:08',11,2,NULL),(24,20,1,'2024-06-24 07:00:17',11,1,'2024-06-24 07:00:26'),(25,10,1,'2024-06-26 01:12:34',11,1,'2024-06-26 01:15:55'),(26,50,1,'2024-06-26 01:18:12',11,1,'2024-06-26 01:18:27'),(27,30,1,'2024-06-26 01:18:57',11,1,'2024-06-26 01:20:51'),(28,30,1,'2024-06-26 01:22:24',11,1,'2024-06-26 01:24:07'),(29,30,1,'2024-06-26 01:24:35',11,1,'2024-06-26 01:24:44'),(30,30,1,'2024-06-26 01:25:46',11,1,'2024-06-26 01:26:13'),(31,30,1,'2024-06-26 01:27:17',11,1,'2024-06-26 01:27:23'),(32,40,1,'2024-06-26 01:27:55',11,1,'2024-06-26 01:28:03'),(33,40,1,'2024-06-26 01:28:35',11,1,'2024-06-26 01:28:42'),(34,0,0,'2024-06-26 09:03:48',10,1,NULL),(35,40,1,'2024-06-26 09:03:58',10,1,'2024-06-26 09:04:07'),(36,30,1,'2024-06-26 09:17:58',10,1,'2024-06-26 09:18:04'),(37,40,1,'2024-06-27 01:31:04',10,2,'2024-06-27 01:31:13'),(38,40,1,'2024-06-27 01:31:21',10,2,'2024-06-27 01:31:29'),(39,40,1,'2024-06-27 01:32:52',10,2,'2024-06-27 01:33:05'),(40,30,1,'2024-06-27 01:34:59',10,1,'2024-06-27 01:35:07'),(41,0,0,'2024-06-27 01:36:01',10,2,NULL),(42,0,1,'2024-06-27 01:36:11',10,2,'2024-06-27 01:42:06'),(43,30,1,'2024-06-27 01:42:17',10,2,'2024-06-27 01:42:22'),(44,40,1,'2024-06-27 01:42:55',10,1,'2024-06-27 01:43:02'),(45,20,1,'2024-06-27 01:44:21',10,1,'2024-06-27 01:44:29'),(46,30,1,'2024-06-30 01:50:31',12,1,'2024-06-30 01:50:39'),(47,40,1,'2024-06-30 01:51:24',12,1,'2024-06-30 01:51:31'),(48,0,0,'2024-06-30 01:59:23',12,1,NULL),(49,0,0,'2024-06-30 02:14:24',12,1,NULL),(50,0,0,'2024-06-30 02:29:48',12,1,NULL),(51,0,1,'2024-06-30 02:31:33',12,1,'2024-06-30 02:54:58'),(52,0,0,'2024-06-30 03:13:12',10,4,NULL),(53,0,0,'2024-06-30 04:59:27',10,6,NULL),(54,30,1,'2024-06-30 06:11:15',10,4,'2024-06-30 06:11:42'),(55,40,1,'2024-06-30 08:18:20',10,7,'2024-06-30 08:18:36'),(56,30,1,'2024-06-30 08:44:26',10,10,'2024-06-30 08:44:43'),(57,50,1,'2024-06-30 09:01:14',10,9,'2024-06-30 09:01:32'),(58,40,1,'2024-06-30 11:59:07',10,9,'2024-06-30 11:59:17'),(59,40,1,'2024-06-30 12:02:22',10,4,'2024-06-30 12:02:41'),(60,30,1,'2024-06-30 12:03:27',10,10,'2024-06-30 12:03:40'),(61,10,1,'2024-06-30 12:07:00',10,6,'2024-06-30 12:07:16'),(62,20,1,'2024-06-30 12:07:51',10,12,'2024-06-30 12:08:09'),(63,40,1,'2024-07-09 11:23:05',11,15,'2024-07-09 11:23:57'),(64,40,1,'2024-07-09 11:43:58',11,4,'2024-07-09 11:44:10'),(65,0,1,'2024-07-09 11:46:00',11,8,'2024-07-09 11:46:15'),(66,20,1,'2024-07-09 11:47:43',11,10,'2024-07-09 11:48:01');
/*!40000 ALTER TABLE `testrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testrecord_question`
--

DROP TABLE IF EXISTS `testrecord_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testrecord_question` (
  `TestQuestionID` int NOT NULL COMMENT '试题ID',
  `TestRecordID` int NOT NULL COMMENT '记录ID',
  `UserID` int NOT NULL COMMENT '用户',
  `Score` int NOT NULL COMMENT '试题分数',
  `SortNum` int NOT NULL COMMENT '试题序号',
  `QuestionType` varchar(10) NOT NULL COMMENT '题目类型',
  `UserAnswer` varchar(1000) DEFAULT NULL COMMENT '用户答案',
  `IsCorrect` tinyint(1) DEFAULT NULL COMMENT '正确情况',
  KEY `testrecord_question_testquestion_FK` (`TestQuestionID`),
  KEY `testrecord_question_testrecord_FK` (`TestRecordID`),
  KEY `testrecord_question_user_FK` (`UserID`),
  CONSTRAINT `testrecord_question_testquestion_FK` FOREIGN KEY (`TestQuestionID`) REFERENCES `testquestion` (`TestQuestionID`),
  CONSTRAINT `testrecord_question_testrecord_FK` FOREIGN KEY (`TestRecordID`) REFERENCES `testrecord` (`TestRecordID`),
  CONSTRAINT `testrecord_question_user_FK` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testrecord_question`
--

LOCK TABLES `testrecord_question` WRITE;
/*!40000 ALTER TABLE `testrecord_question` DISABLE KEYS */;
INSERT INTO `testrecord_question` VALUES (1,12,10,10,1,'单选题','A',1),(2,12,10,10,2,'单选题','A',0),(3,12,10,10,3,'多选题','A',0),(4,12,10,10,4,'填空题','123,123',0),(5,12,10,10,5,'判断题','1',1),(1,13,10,10,1,'单选题','A',1),(2,13,10,10,2,'单选题','A',0),(3,13,10,10,3,'多选题','A,C',1),(4,13,10,10,4,'填空题','1,12',0),(5,13,10,10,5,'判断题','1',1),(1,14,10,10,1,'单选题','B',0),(2,14,10,10,2,'单选题','C',0),(3,14,10,10,3,'多选题','B,D',0),(4,14,10,10,4,'填空题','1,1',0),(5,14,10,10,5,'判断题','0',0),(1,19,10,10,1,'单选题','A',1),(2,19,10,10,2,'单选题','A',0),(3,19,10,10,3,'多选题','A',0),(4,19,10,10,4,'填空题','1212,12',0),(5,19,10,10,5,'判断题','1',1),(1,21,10,10,1,'单选题','A',1),(2,21,10,10,2,'单选题','A',0),(3,21,10,10,3,'多选题','A',0),(4,21,10,10,4,'填空题','12,12',0),(5,21,10,10,5,'判断题','1',1),(1,22,11,10,1,'单选题','A',1),(2,22,11,10,2,'单选题','A',0),(3,22,11,10,3,'多选题','C',0),(4,22,11,10,4,'填空题','1212,12',0),(5,22,11,10,5,'判断题','1',1),(1,24,11,10,1,'单选题','A',1),(2,24,11,10,2,'单选题','C',0),(3,24,11,10,3,'多选题','A,B',0),(4,24,11,10,4,'填空题','1212,12',0),(5,24,11,10,5,'判断题','1',1),(1,25,11,10,1,'单选题','B',0),(2,25,11,10,2,'单选题','C',0),(3,25,11,10,3,'多选题','A,B',0),(4,25,11,10,4,'填空题','1212,12',0),(5,25,11,10,5,'判断题','1',1),(1,26,11,10,1,'单选题','A',1),(2,26,11,10,2,'单选题','B',1),(3,26,11,10,3,'多选题','A,C',1),(4,26,11,10,4,'填空题','1212,212',1),(5,26,11,10,5,'判断题','1',1),(1,27,11,10,1,'单选题','A',1),(2,27,11,10,2,'单选题','C',0),(3,27,11,10,3,'多选题','A,C',1),(4,27,11,10,4,'填空题','1212,1',0),(5,27,11,10,5,'判断题','1',1),(1,28,11,10,1,'单选题','A',1),(2,28,11,10,2,'单选题','C',0),(3,28,11,10,3,'多选题','A,C',1),(4,28,11,10,4,'填空题','1,1',0),(5,28,11,10,5,'判断题','1',1),(1,29,11,10,1,'单选题','A',1),(2,29,11,10,2,'单选题','C',0),(3,29,11,10,3,'多选题','A,C',1),(4,29,11,10,4,'填空题','12,212',0),(5,29,11,10,5,'判断题','1',1),(1,30,11,10,1,'单选题','A',1),(2,30,11,10,2,'单选题','C',0),(3,30,11,10,3,'多选题','A,C',1),(4,30,11,10,4,'填空题','1212,2112',0),(5,30,11,10,5,'判断题','1',1),(1,31,11,10,1,'单选题','A',1),(2,31,11,10,2,'单选题','C',0),(3,31,11,10,3,'多选题','A,C',1),(5,31,11,10,5,'判断题','1',NULL),(1,32,11,10,1,'单选题','A',1),(2,32,11,10,2,'单选题','C',0),(3,32,11,10,3,'多选题','A,C',1),(4,32,11,10,4,'填空题','1212,212',1),(5,32,11,10,5,'判断题','1',1),(1,33,11,10,1,'单选题','A',1),(2,33,11,10,2,'单选题','C',0),(3,33,11,10,3,'多选题','A,C',1),(4,33,11,10,4,'填空题','1212,212',1),(5,33,11,10,5,'判断题','1',1),(1,35,10,10,1,'单选题','A',1),(2,35,10,10,2,'单选题','C',0),(3,35,10,10,3,'多选题','A,C',1),(4,35,10,10,4,'填空题','1212,212',1),(5,35,10,10,5,'判断题','1',1),(1,36,10,10,1,'单选题','A',1),(2,36,10,10,2,'单选题','C',0),(3,36,10,10,3,'多选题','A,C',1),(4,36,10,10,4,'填空题','12,12',0),(5,36,10,10,5,'判断题','1',1),(1,37,10,10,1,'单选题','A',1),(2,37,10,10,2,'单选题','C',0),(3,37,10,10,3,'多选题','A,C',1),(4,37,10,10,4,'填空题','1212,212',1),(5,37,10,10,5,'判断题','1',1),(1,38,10,10,1,'单选题','A',1),(2,38,10,10,2,'单选题','C',0),(3,38,10,10,3,'多选题','A,C',1),(4,38,10,10,4,'填空题','1212,212',1),(5,38,10,10,5,'判断题','1',1),(1,39,10,10,1,'单选题','A',1),(2,39,10,10,2,'单选题','C',0),(3,39,10,10,3,'多选题','A,C',1),(4,39,10,10,4,'填空题','1212,212',1),(5,39,10,10,5,'判断题','1',1),(1,40,10,10,1,'单选题','A',1),(2,40,10,10,2,'单选题','C',0),(3,40,10,10,3,'多选题','A,C',1),(4,40,10,10,4,'填空题','1212,2121',0),(5,40,10,10,5,'判断题','1',1),(1,42,10,10,1,'单选题','A',NULL),(2,42,10,10,2,'单选题','C',NULL),(3,42,10,10,3,'多选题','A,C',NULL),(1,43,10,10,1,'单选题','A',1),(2,43,10,10,2,'单选题','C',0),(3,43,10,10,3,'多选题','A,C',1),(4,43,10,10,4,'填空题','12,',0),(5,43,10,10,5,'判断题','1',1),(1,44,10,10,1,'单选题','A',1),(2,44,10,10,2,'单选题','C',0),(3,44,10,10,3,'多选题','A,C',1),(4,44,10,10,4,'填空题','1212,212',1),(5,44,10,10,5,'判断题','1',1),(1,45,10,10,1,'单选题','B',0),(2,45,10,10,2,'单选题','C',0),(3,45,10,10,3,'多选题','B,C',0),(4,45,10,10,4,'填空题','1212,212',1),(5,45,10,10,5,'判断题','1',1),(1,46,12,10,1,'单选题','A',1),(2,46,12,10,2,'单选题','C',0),(3,46,12,10,3,'多选题','A,C',1),(4,46,12,10,4,'填空题','1212,21',0),(5,46,12,10,5,'判断题','1',1),(1,47,12,10,1,'单选题','A',1),(2,47,12,10,2,'单选题','A',0),(3,47,12,10,3,'多选题','A,C',1),(4,47,12,10,4,'填空题','1212,212',1),(5,47,12,10,5,'判断题','1',1),(4,49,12,10,4,'填空题',',',NULL),(4,51,12,10,4,'填空题',',,',NULL),(1,51,12,10,1,'单选题','B',0),(11,54,10,10,1,'单选题','C',0),(12,54,10,10,2,'单选题','C',1),(13,54,10,10,3,'多选题','A,B,C,D',1),(14,54,10,10,4,'填空题','小程序,云服务器',0),(15,54,10,10,5,'判断题','0',1),(26,55,10,10,1,'单选题','C',1),(27,55,10,10,2,'单选题','D',1),(28,55,10,10,3,'多选题','B,C,D',1),(29,55,10,10,4,'填空题','1,1,1',0),(30,55,10,10,5,'判断题','1',1),(41,56,10,10,1,'单选题','A',1),(42,56,10,10,2,'单选题','B',1),(43,56,10,10,3,'多选题','A,D',0),(44,56,10,10,4,'填空题','1,1,1',0),(45,56,10,10,5,'判断题','0',1),(36,57,10,10,1,'单选题','C',1),(37,57,10,10,2,'单选题','D',1),(38,57,10,10,3,'多选题','A,C',1),(39,57,10,10,4,'填空题','类',1),(40,57,10,10,5,'判断题','0',1),(36,58,10,10,1,'单选题','A',0),(37,58,10,10,2,'单选题','D',1),(38,58,10,10,3,'多选题','A,C',1),(39,58,10,10,4,'填空题','类',1),(40,58,10,10,5,'判断题','0',1),(11,59,10,10,1,'单选题','D',1),(12,59,10,10,2,'单选题','C',1),(13,59,10,10,3,'多选题','A,B,C,D',1),(14,59,10,10,4,'填空题','小程序,云服务器',0),(15,59,10,10,5,'判断题','0',1),(41,60,10,10,1,'单选题','A',1),(42,60,10,10,2,'单选题','B',1),(43,60,10,10,3,'多选题','A,D',0),(44,60,10,10,4,'填空题','1,2,3',0),(45,60,10,10,5,'判断题','0',1),(21,61,10,10,1,'单选题','A',1),(22,61,10,10,2,'单选题','C',0),(23,61,10,10,3,'多选题','A,B,D',0),(24,61,10,10,4,'填空题','1',0),(25,61,10,10,5,'判断题','1',0),(51,62,10,10,1,'单选题','D',1),(52,62,10,10,2,'单选题','D',1),(53,62,10,10,3,'多选题','A,B,C,D',0),(54,62,10,10,4,'填空题','getuserinfo',0),(55,62,10,10,5,'判断题','1',0),(3,63,11,10,1,'多选题','A,B,C',0),(10,63,11,10,2,'判断题','0',1),(12,63,11,10,3,'单选题','C',1),(15,63,11,10,4,'判断题','0',1),(4,63,11,10,5,'填空题','HTML,CSS,JavaScript',1),(35,63,11,10,6,'判断题','1',0),(19,63,11,10,7,'填空题','1,1',0),(9,63,11,10,8,'填空题','2',0),(21,63,11,10,9,'单选题','D',0),(33,63,11,10,10,'多选题','A',0),(11,64,11,10,1,'单选题','D',1),(12,64,11,10,2,'单选题','C',1),(13,64,11,10,3,'多选题','A,B,C,D',1),(14,64,11,10,4,'填空题','1,2',0),(15,64,11,10,5,'判断题','0',1),(31,65,11,10,1,'单选题','D',0),(32,65,11,10,2,'单选题','C',0),(33,65,11,10,3,'多选题','A',0),(34,65,11,10,4,'填空题','1',0),(35,65,11,10,5,'判断题','1',0),(41,66,11,10,1,'单选题','A',1),(42,66,11,10,2,'单选题','B',1),(43,66,11,10,3,'多选题','A,B,C',0),(44,66,11,10,4,'填空题','1,2,3',0),(45,66,11,10,5,'判断题','1',0);
/*!40000 ALTER TABLE `testrecord_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(10) NOT NULL,
  `UserPassword` varchar(255) NOT NULL,
  `UserAvatar` varchar(500) DEFAULT NULL,
  `UserPhone` varchar(20) NOT NULL,
  `UserClass` varchar(10) DEFAULT NULL,
  `UserStudyTime` json DEFAULT NULL,
  `UserActivity` json DEFAULT NULL,
  `UserScore` int DEFAULT '0',
  `UserCol` varchar(45) DEFAULT NULL,
  `UserToken` varchar(100) DEFAULT NULL,
  `IsLogin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (10,'熊同学','$2a$10$8y.CQOie9LdTATz1cpug8Op/Bg.CV97ubLXKPZ2PstIq77Tj37WFG','https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','18880448303','','0','0',42,'',NULL,1),(11,'刘同学','$2a$10$8y.CQOie9LdTATz1cpug8Op/Bg.CV97ubLXKPZ2PstIq77Tj37WFG','http://thirdqq.qlogo.cn/ek_qqapp/AQAiaTtkWG4N7cqBR7LCpBpHXZib6GTS2tm0AXwfGqVAIE2zho0g7NawiaQ6EykAZb3C9aerqIP/100','15329541753',NULL,NULL,NULL,19,NULL,NULL,0),(12,'新同学','$2a$10$E.DtamXxw9aoRAmrAYmR8.3EquwoiJyz7.HQdVHIcj4z3pQLoSvhG','https://img1.baidu.com/it/u=2879608591,2832950529&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500','13765782522',NULL,NULL,NULL,4,NULL,NULL,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videocourse`
--

DROP TABLE IF EXISTS `videocourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videocourse` (
  `VideoCourseID` int NOT NULL AUTO_INCREMENT COMMENT '视频课程ID',
  `VideoCourseName` varchar(20) NOT NULL COMMENT '视频课程名称',
  `VideoOrder` int NOT NULL COMMENT '视频排序',
  `PlayLink` varchar(500) NOT NULL COMMENT '播放链接',
  `Duration` time NOT NULL COMMENT '播放时长',
  `CourseID` int NOT NULL,
  PRIMARY KEY (`VideoCourseID`),
  KEY `videocourse_bigcourse_FK` (`CourseID`),
  CONSTRAINT `videocourse_bigcourse_FK` FOREIGN KEY (`CourseID`) REFERENCES `bigcourse` (`CourseID`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb3 COMMENT='视频课程';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videocourse`
--

LOCK TABLES `videocourse` WRITE;
/*!40000 ALTER TABLE `videocourse` DISABLE KEYS */;
INSERT INTO `videocourse` VALUES (1,'AI时代首选Python',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',9),(2,'算法推导与案例',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',9),(3,'人工智能核心-机器学习',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',9),(4,'数组结构',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',9),(5,'数组生成常用函数',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',9),(6,'HTML入门和工具选择',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',1),(7,'HTML常用文本标签',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',1),(8,'列表和表格标签',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',1),(9,'CSS的常见用法',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',1),(10,'CSS常用选择器',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',1),(11,'网站基本知识',3,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',1),(12,'安装虚拟机、Linux操作入门',3,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',1),(13,'网站的上传和部署',3,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',1),(14,'边框圆角的基本使用',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',2),(15,'线性径向渐变',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',2),(16,'换行与换行对齐',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',2),(17,'主轴和侧轴交叉',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',2),(18,'微信官方开发工具使用',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',3),(19,'小程序事件绑定',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',3),(20,'小程序网络请求API接口基本使用',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',3),(21,'小程序自定义组件实现',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',3),(22,'课程源码下载',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',4),(23,'前端神器Webstorm的破解和安装',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',4),(24,'Let和Var的区别',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',4),(25,'Constant常量的声明',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',4),(26,'docker和虚拟机有什么区别',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',5),(27,'docker的安装及入门案例',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',5),(28,'什么是镜像和常用命令',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',5),(29,'Pytorch框架简介',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',6),(30,'Pytorch的安装',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',6),(31,'机器学习基础-线性回归',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',6),(32,'数组生成常用函数',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',6),(33,'Go连接MySQL',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',7),(34,'增删改查操作',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',7),(35,'zap日志库介绍',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',7),(36,'gin框架配置zap记录日志',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',7),(37,'Mac版本安装配置',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',8),(38,'Windows版本安装配置',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',8),(39,'编程思路如泉涌',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',8),(40,'类的概念具体化',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',8),(41,'强弱类型之间的转化',3,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',8),(42,'常用的八大类型',3,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',8),(43,'变量常量傻傻分不清',4,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',8),(44,'变量声明要弄清',4,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',8),(45,'环境搭建和项目创建',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',10),(46,'引入全局样式',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',10),(47,'配置tabbar底部导航',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',10),(48,'引入图标库',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',10),(49,'导航栏配置',3,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',10),(50,'轮播图组件',3,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',10),(51,'全局列表组件开发',3,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',10),(52,'数据表设计与迁移',4,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',10),(53,'前后端数据交互',4,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',10),(54,'了解微信开发环境搭建',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',11),(55,'接口调用凭证和数据容器',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',11),(56,'公众号小程序实战案例',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',11),(57,'SCF框架介绍+快速创建项目演示',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',11),(58,'注释打印和控制台',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',12),(59,'一个简单的函数',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',12),(60,'MVC模式介绍',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',12),(61,'面向对象编程',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',12),(62,'C++基本介绍',1,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',13),(63,'语言特性和工程构成',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',13),(64,'基本输入输出精解',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',13),(65,'函数特性详解',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',13),(66,'JavaScript-提问',2,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',13),(67,'成员函数对象拷贝',3,'https://meedu.cloud.oss.meedu.vip/video/meedu%E4%BB%8B%E7%BB%8D-2021-09-09.mp4','01:49:00',13);
/*!40000 ALTER TABLE `videocourse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-15 11:55:30
