-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: smartedux
-- ------------------------------------------------------
-- Server version	8.0.33

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
INSERT INTO `bigcourse` VALUES (1,'Web前端：从零开始做网站','本课程专为零基础学员准备，从网页基础深入到网页布局开发。课程内容讲解详细，注重细节，让你从入门到精通，一周时间掌握HTML+CSS网页开发。经过学习与实战，可独立开发出高质量的静态网页项目。','https://demo-api.meedu.xyz/storage/images/v43GltVoGF95TDaznUIa6fDmYcIDWQJlEOeh5EqN.png','前端开发','	https://demo-api.meedu.xyz/storage/images/ejBg9WDmlBmieJabDiMeKGU5VNw7WtcSwJkSv8L6.png','[\"HTML 网站的骨架\", \"CSS 网站的美颜\", \"项目网站的部署\"]',1,3,2),(2,'从零玩转HTML5（跨平台开发）','能够利用所学的html、css、photoshop对已经设计好的企业网站界面设计，手把手教会大家对企业网站进行进行切片制作和DIV+CSS布局，独立完成制作静态网站页面和模板，并完成浏览器兼容性测试。','	https://demo-api.meedu.xyz/storage/images/v9PYbvR7bCZXTSk3scR1GV1gccno1qOlnYB3cRS0.png\r\n','前端开发','	https://demo-api.meedu.xyz/storage/images/ejBg9WDmlBmieJabDiMeKGU5VNw7WtcSwJkSv8L6.png','[\"CSS3特性\", \"伸缩布局\"]',1,3,2),(3,'零基础吃透微信小程序','本教程目标是从零开始带领读者上手实战小程序开发，课程以微信小程序的核心概念作为主线，介绍配置文件、页面样式文件、JavaScript 的基本知识。并以指南针为例对基本知识进行扩展，另外加上开发工具的安装、小程序发布等内容。','https://demo-api.meedu.xyz/storage/images/N9LKos3c5HZt5MeNW4DFucRXxCPhSLM1ZlDLOtKh.png\r\n','小程序开发','	https://demo-api.meedu.xyz/storage/images/ejBg9WDmlBmieJabDiMeKGU5VNw7WtcSwJkSv8L6.png','[\"小程序基础\", \"小程序进阶\"]',1,5,3),(4,'Vue2+Vue3前端框架入门与实战','如果你之前已经习惯了用jQuery操作DOM，学习Vue.js时请先抛开手动操作DOM的思维，因为Vue.js是数据驱动的，你无需手动操作DOM。 它通过一些特殊的HTML语法，将DOM和数据绑定起来。','https://demo-api.meedu.xyz/storage/images/74sZVx4EcT7das1EqgYaBrQj9HUFe0BXVBD5QyTK.png','前端开发','	https://demo-api.meedu.xyz/storage/images/ejBg9WDmlBmieJabDiMeKGU5VNw7WtcSwJkSv8L6.png','[\"课程介绍和开发工具\", \"ES6新特性\"]',1,4,2),(5,'SpringCloud实战（k8s&doceker）','本系列课程我将带大家从K8s基础入门到K8s项目实战，一条龙学习路径帮你学透K8s，成为K8s高级工程师，突破年薪30W！','	https://demo-api.meedu.xyz/storage/images/JLyw8tHNwvA62qa3oePHnGAYdp89Q64EUm0Jb9ss.png','后端开发','	https://demo-api.meedu.xyz/storage/images/ejBg9WDmlBmieJabDiMeKGU5VNw7WtcSwJkSv8L6.png','[\"docker入门\", \"镜像仓库管理\"]',1,1,1),(6,'Pytorch深度学习入门与实战','PyTorch框架核心使用方法解读，基于最新算法（论文）展开项目实战，全部内容均基于真实数据集与实际任务需求展开，500+课时，30+大型项目实战，适合转行就业与进阶提升的同学们。','https://demo-api.meedu.xyz/storage/images/em6V36Mb8lHVYO1Pxc2cAXt7wDmKcxFo1Be0OkA2.png','深度学习','	https://demo-api.meedu.xyz/storage/images/ejBg9WDmlBmieJabDiMeKGU5VNw7WtcSwJkSv8L6.png','[\"Pytorch概述\", \"深度学习基础\"]',1,6,3),(7,'Go Web开发（进阶实战）','本课程介绍如何用Go语言进行Web应用的开发，将Go语言的特性与Web开发实战组合到一起，帮读者成功地构建跨平台的应用程序，节省Go语言开发Web的宝贵时间。有了这些针对真实问题的解决方案放在手边，大多数编程难题都会迎刃而解。','	https://demo-api.meedu.xyz/storage/images/pONk6mmw4R1NVpUhqu4SArdzG3NaxEcuRqDbDXwY.png','后端开发','	https://demo-api.meedu.xyz/storage/images/ejBg9WDmlBmieJabDiMeKGU5VNw7WtcSwJkSv8L6.png','[\"Go操作常见数据库\", \"Go Web开发常用组件\"]',1,6,3),(8,'一次性搞定Java入门（高新全栈+安卓）','本课程为Java零基础入门部分，让您快速上手Java编程，为Java网站开发，安卓程序设计与开发打下基础。 本课程已完结，走在技术前沿，用实力说话。','https://demo-api.meedu.xyz/storage/images/1K54to6jXihAkLAEJlauA4jGfKkr8fGxpvDfx5Rv.png','后端开发','	https://demo-api.meedu.xyz/storage/images/ejBg9WDmlBmieJabDiMeKGU5VNw7WtcSwJkSv8L6.png','[\"Java环境安卓配置\", \"Java基本语法\", \"数据类型\", \"变量和常量\"]',1,1,1),(9,'Python数据分析（机器学习实战）','简单、实用的Python数据分析、数据挖掘视频教程，主要介绍Python在数据处理、数据分析、数据可视化、数据挖掘方面常用的实战方法与技巧。','	https://demo-api.meedu.xyz/storage/images/uoUR9iCcc1DPX1lOwFaL0GbUdw1tvIAAsaolj7n6.png','人工智能','	https://demo-api.meedu.xyz/storage/images/ejBg9WDmlBmieJabDiMeKGU5VNw7WtcSwJkSv8L6.png','[\"人工智能入门指南\", \"Python科学计算库\"]',1,2,1),(10,'Uni-app实战视频点播小程序','全网最详细的Uniapp实战开发app小程序课程，7大实战开发案例（社区交友，商城，即时通讯，音频小说、网盘、点播、直播）帮助你获得技术优势并提高面试竞争力。','	https://demo-api.meedu.xyz/storage/images/rvX9mXmAEf285HBKb3JFFjvlBkMIVXPQQKGPVrqP.png','移动开发','	https://demo-api.meedu.xyz/storage/images/ejBg9WDmlBmieJabDiMeKGU5VNw7WtcSwJkSv8L6.png','[\"准备工作\", \"项目分析和全局样式\", \"首页开发\", \"后端API开发\"]',1,NULL,NULL),(11,'微信公众号+小程序快速开发','本课程致力于打造一站式微信开发全方位学习模式，微信开发从入门到精通全套系统课程。从宝贵“实战案例”中总结“踩坑”经验，助你快速搭建微信公众号、小程序，彻底玩转微信开发。','https://demo-api.meedu.xyz/storage/images/VY3SVQog9nmUIPer80vaWea5bakgRJJUd7sA7IVV.png','移动开发','	https://demo-api.meedu.xyz/storage/images/ejBg9WDmlBmieJabDiMeKGU5VNw7WtcSwJkSv8L6.png','[\"微信开发基础\", \"公众号小程序实战案例\"]',1,NULL,NULL),(12,'IOS+Swift零基础教程（2021版iOS14）','课程会介绍需要用到的操作系统和开发工具，和编程语言 Swift 的注释、数据类型、函数、控制流语句（条件和循环）、可选类型、命名类型（枚举、类和结构体）的概念和使用方法，在 Project 项目中通过 .storyboard 文件进行应用的界面的实现，通过 .swift 文件进行应用的功能实现。','https://demo-api.meedu.xyz/storage/images/Qj2kY3vSI3o4rt5YCImxmWmxkNdwYQQYQraINNo5.png','移动开发','	https://demo-api.meedu.xyz/storage/images/ejBg9WDmlBmieJabDiMeKGU5VNw7WtcSwJkSv8L6.png','[\"Swift语言入门\", \"实战案例\"]',1,NULL,NULL),(13,'C++语言基础到进阶','关于内容特点 1、知识点讲解细致入微 2、结合大家平时易出现问题的点，详细解析 3、课程顺序符合思考逻辑，引导大家发现问题并解决问题 4、对于有C++基础的朋友，本系列视频，肯定能让你对C++有新的认识。','https://demo-api.meedu.xyz/storage/images/P0eroC3R9bAwUKvUY1z5HqLpTZdrwaif9qpXEBnC.png','后端开发','	https://demo-api.meedu.xyz/storage/images/ejBg9WDmlBmieJabDiMeKGU5VNw7WtcSwJkSv8L6.png','[\"C++语言介绍\", \"基本语言\", \"类\"]',1,NULL,NULL);
/*!40000 ALTER TABLE `bigcourse` ENABLE KEYS */;
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
  KEY `bigcourse_FK` (`CourseID`),
  KEY `user_FK` (`UserID`),
  CONSTRAINT `bigcourse_FK` FOREIGN KEY (`CourseID`) REFERENCES `bigcourse` (`CourseID`),
  CONSTRAINT `user_FK` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bigcourse_user`
--

LOCK TABLES `bigcourse_user` WRITE;
/*!40000 ALTER TABLE `bigcourse_user` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COMMENT='评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-21','很不错的课程',10,NULL,NULL,1),(2,'http://thirdqq.qlogo.cn/ek_qqapp/AQAiaTtkWG4N7cqBR7LCpBpHXZib6GTS2tm0AXwfGqVAIE2zho0g7NawiaQ6EykAZb3C9aerqIP/100','xxx','2024-05-21','能学到很多',11,NULL,NULL,1),(3,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-21','博观而约取，厚积而薄发',10,NULL,NULL,2),(4,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-21','课程内容不错',10,NULL,NULL,2),(5,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-21','123123',10,NULL,NULL,1),(6,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-21','123123',10,NULL,NULL,1),(7,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-21','还行',10,NULL,NULL,3),(8,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-21','评论',10,NULL,NULL,3),(9,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-21','111',10,NULL,NULL,3),(10,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-21','go web开发很不错',10,NULL,NULL,7),(11,'http://thirdqq.qlogo.cn/ek_qqapp/AQAiaTtkWG4N7cqBR7LCpBpHXZib6GTS2tm0AXwfGqVAIE2zho0g7NawiaQ6EykAZb3C9aerqIP/100','xxx','2024-05-21','xxx的评论',11,NULL,NULL,2),(12,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-22','xhc的评论',10,NULL,37,NULL),(13,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-22','8',10,NULL,37,NULL),(14,'https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','xhc','2024-05-22','新评论来了',10,NULL,44,NULL),(15,'http://thirdqq.qlogo.cn/ek_qqapp/AQAiaTtkWG4N7cqBR7LCpBpHXZib6GTS2tm0AXwfGqVAIE2zho0g7NawiaQ6EykAZb3C9aerqIP/100','xxx','2024-05-22','zap日志库的介绍很详细',11,NULL,35,NULL),(16,'http://thirdqq.qlogo.cn/ek_qqapp/AQAiaTtkWG4N7cqBR7LCpBpHXZib6GTS2tm0AXwfGqVAIE2zho0g7NawiaQ6EykAZb3C9aerqIP/100','xxx','2024-05-22','gin框架配置很不错',11,NULL,36,NULL);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='图文';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imageandtext`
--

LOCK TABLES `imageandtext` WRITE;
/*!40000 ALTER TABLE `imageandtext` DISABLE KEYS */;
INSERT INTO `imageandtext` VALUES (1,107,100,'揭开 AI、机器学习和深度学习的神秘面纱','人工智能','https://meedu-cos.meedu.xyz/images/admin/xbnWzaStcDPNoAnYJ5PIDFHZFIXSOJD7leNSHYv0.jpg','文章内容','2021-10-07 12:45:00');
/*!40000 ALTER TABLE `imageandtext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integralrecord`
--

DROP TABLE IF EXISTS `integralrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integralrecord` (
  `IntegralID` int NOT NULL COMMENT '积分记录ID',
  `Score` int NOT NULL COMMENT '获得分数',
  `Source` varchar(10) NOT NULL COMMENT '积分来源',
  PRIMARY KEY (`IntegralID`),
  CONSTRAINT `integralrecord_user_FK` FOREIGN KEY (`IntegralID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='积分记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integralrecord`
--

LOCK TABLES `integralrecord` WRITE;
/*!40000 ALTER TABLE `integralrecord` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='知识点';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knowledge`
--

LOCK TABLES `knowledge` WRITE;
/*!40000 ALTER TABLE `knowledge` DISABLE KEYS */;
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
  `Time` datetime NOT NULL COMMENT '提问时间',
  PRIMARY KEY (`QAndAID`),
  CONSTRAINT `qanda_user_FK` FOREIGN KEY (`QAndAID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='人工智能提问回答';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qanda`
--

LOCK TABLES `qanda` WRITE;
/*!40000 ALTER TABLE `qanda` DISABLE KEYS */;
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
INSERT INTO smartedux.question_testpaper (TestQuestionID, TestPaperID, Score, SortNum) VALUES (1, 1, 10, 1);
INSERT INTO smartedux.question_testpaper (TestQuestionID, TestPaperID, Score, SortNum) VALUES (2, 1, 10, 2);
INSERT INTO smartedux.question_testpaper (TestQuestionID, TestPaperID, Score, SortNum) VALUES (3, 1, 10, 3);
INSERT INTO smartedux.question_testpaper (TestQuestionID, TestPaperID, Score, SortNum) VALUES (4, 1, 10, 4);
INSERT INTO smartedux.question_testpaper (TestQuestionID, TestPaperID, Score, SortNum) VALUES (5, 1, 10, 5);
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
-- Table structure for table `testanalyse`
--

DROP TABLE IF EXISTS `testanalyse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testanalyse` (
  `TestAnalyseID` int NOT NULL AUTO_INCREMENT COMMENT '考试分析ID',
  `QuestionNumber` int NOT NULL COMMENT '题目总数',
  `CorrectQuantity` int NOT NULL COMMENT '正确数量',
  `Accuracy` float NOT NULL COMMENT '正确率',
  `AccuracyProposal` varchar(100) NOT NULL COMMENT '正确率建议',
  `KnowledgeMasterProposal` varchar(100) NOT NULL COMMENT '知识点掌握情况建议',
  `RecommendCourse` json NOT NULL COMMENT '推荐课程',
  PRIMARY KEY (`TestAnalyseID`),
  CONSTRAINT `testanalyse_user_FK` FOREIGN KEY (`TestAnalyseID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='考试分析';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testanalyse`
--

LOCK TABLES `testanalyse` WRITE;
/*!40000 ALTER TABLE `testanalyse` DISABLE KEYS */;
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
  `ContainKnowledgeNum` int NOT NULL COMMENT '试卷中包含知识点个数',
  `CorrectKnowledgeNum` int NOT NULL COMMENT '正确知识点个数',
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
  PRIMARY KEY (`TestPaperID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='试卷';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testpaper`
--

LOCK TABLES `testpaper` WRITE;
/*!40000 ALTER TABLE `testpaper` DISABLE KEYS */;
INSERT INTO smartedux.testpaper (TestPaperID, TestPaperName, FullScore, PassScore, QuestionNumber, Duration) VALUES (1, '测试试卷', 50, 30, 5, '5');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='试题';
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO smartedux.testquestion (TestQuestionID, QuestionText, QuestionImage, QuestionType, SingleChoice, MultipleChoice, FillBlankQuantity, SingleChoiceAnswer, MultipleChoiceAnswer, JudgeAnswer, FillBlankAnswer, Analysis) VALUES (1, '这是有图片的选择题测试()', 'https://img.tukuppt.com/png_preview/00/02/58/LFQPgeNTyr.jpg!/fw/780', '单选题', '[{"option": "A", "checked": false, "content": "选项A"}, {"option": "B", "checked": false, "content": "选项B"}, {"option": "C", "checked": false, "content": "选项C"}, {"option": "D", "checked": false, "content": "选项D"}]', null, null, 'A', null, null, null, '这是这道题的解析。');
INSERT INTO smartedux.testquestion (TestQuestionID, QuestionText, QuestionImage, QuestionType, SingleChoice, MultipleChoice, FillBlankQuantity, SingleChoiceAnswer, MultipleChoiceAnswer, JudgeAnswer, FillBlankAnswer, Analysis) VALUES (2, '这是有无图片的选择题测试()', null, '单选题', '[{"option": "A", "checked": false, "content": "选项A"}, {"option": "B", "checked": false, "content": "选项B"}, {"option": "C", "checked": false, "content": "选项C"}, {"option": "D", "checked": false, "content": "选项D"}]', null, null, 'B', null, null, null, '无');
INSERT INTO smartedux.testquestion (TestQuestionID, QuestionText, QuestionImage, QuestionType, SingleChoice, MultipleChoice, FillBlankQuantity, SingleChoiceAnswer, MultipleChoiceAnswer, JudgeAnswer, FillBlankAnswer, Analysis) VALUES (3, '这是多选题()', null, '多选题', '[{"option": "A", "checked": false, "content": "选项A"}, {"option": "B", "checked": false, "content": "选项B"}, {"option": "C", "checked": false, "content": "选项C"}, {"option": "D", "checked": false, "content": "选项D"}]', null, null, '', '["A", "C"]', null, null, null);
INSERT INTO smartedux.testquestion (TestQuestionID, QuestionText, QuestionImage, QuestionType, SingleChoice, MultipleChoice, FillBlankQuantity, SingleChoiceAnswer, MultipleChoiceAnswer, JudgeAnswer, FillBlankAnswer, Analysis) VALUES (4, '这是填空题().()', null, '填空题', null, null, 2, null, null, null, '["1212", "212"]', null);
INSERT INTO smartedux.testquestion (TestQuestionID, QuestionText, QuestionImage, QuestionType, SingleChoice, MultipleChoice, FillBlankQuantity, SingleChoiceAnswer, MultipleChoiceAnswer, JudgeAnswer, FillBlankAnswer, Analysis) VALUES (5, '这是判断题', null, '判断题', null, null, null, null, null, 1, null, null);

--
-- Dumping data for table `testquestion`
--

LOCK TABLES `testquestion` WRITE;
/*!40000 ALTER TABLE `testquestion` DISABLE KEYS */;
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
  `TestAnalyseID` int COMMENT '考试分析ID',
  `TestPaperID` int COMMENT '试卷ID',
  KEY `testrecord_testanalyse_FK`(`TestAnalyseID`),
  KEY `testrecord_user_FK` (`UserID`),
  KEY `testrecord_testpaper_FK` (`TestPaperID`),
  PRIMARY KEY (`TestRecordID`),
  CONSTRAINT `testrecord_user_FK` FOREIGN KEY  (`UserID`) REFERENCES `user`(`UserID`),
  CONSTRAINT `testrecord_testpaper_FK` FOREIGN KEY (`TestPaperID`) REFERENCES `testpaper`(`TestPaperID`),
  CONSTRAINT `testrecord_testanalyse_FK` FOREIGN KEY (`TestAnalyseID`) REFERENCES `testanalyse` (`TestAnalyseID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='考试记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testrecord`
--

LOCK TABLES `testrecord` WRITE;
/*!40000 ALTER TABLE `testrecord` DISABLE KEYS */;
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
  `Score` int NOT NULL COMMENT '试题分数',
  `SortNum` int NOT NULL COMMENT '试题序号',
  `UserAnswer` json DEFAULT NULL COMMENT '用户答案',
  `IsCorrect` tinyint(1) DEFAULT NULL COMMENT '正确情况',
    KEY `testrecord_question_testquestion_FK` (`TestQuestionID`),
  KEY `testrecord_question_testrecord_FK` (`TestRecordID`),
  CONSTRAINT `testrecord_question_testquestion_FK` FOREIGN KEY (`TestQuestionID`) REFERENCES `testquestion` (`TestQuestionID`),
  CONSTRAINT `testrecord_question_testrecord_FK` FOREIGN KEY (`TestRecordID`) REFERENCES `testrecord` (`TestRecordID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testrecord_question`
--

LOCK TABLES `testrecord_question` WRITE;
/*!40000 ALTER TABLE `testrecord_question` DISABLE KEYS */;
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
  `UserScore` double DEFAULT NULL,
  `UserCol` varchar(45) DEFAULT NULL,
  `UserToken` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (10,'xhc','$2a$10$8y.CQOie9LdTATz1cpug8Op/Bg.CV97ubLXKPZ2PstIq77Tj37WFG','https://img1.baidu.com/it/u=3622150954,2575811681&fm=253&app=120&size=w931&n=0&f=JPEG&fmt=auto?sec=1716397200&t=0b7c986b5fc51c2236c6a2f6147c391d','18880448303','','0','0',0,'',NULL),(11,'xxx','$2a$10$8y.CQOie9LdTATz1cpug8Op/Bg.CV97ubLXKPZ2PstIq77Tj37WFG','http://thirdqq.qlogo.cn/ek_qqapp/AQAiaTtkWG4N7cqBR7LCpBpHXZib6GTS2tm0AXwfGqVAIE2zho0g7NawiaQ6EykAZb3C9aerqIP/100','15329541753',NULL,NULL,NULL,NULL,NULL,NULL);
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

--
-- Table structure for table `videocourse_knowledge`
--

DROP TABLE IF EXISTS `videocourse_knowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videocourse_knowledge` (
  `VideoCourseID` int NOT NULL COMMENT '课程ID',
  `KnowledgeID` int NOT NULL COMMENT '知识点ID',
  KEY `videocourse_FK` (`VideoCourseID`),
  KEY `knowledge_FK` (`KnowledgeID`),
  CONSTRAINT `knowledge_FK` FOREIGN KEY (`KnowledgeID`) REFERENCES `knowledge` (`KnowledgeID`),
  CONSTRAINT `videocourse_FK` FOREIGN KEY (`VideoCourseID`) REFERENCES `videocourse` (`VideoCourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videocourse_knowledge`
--

LOCK TABLES `videocourse_knowledge` WRITE;
/*!40000 ALTER TABLE `videocourse_knowledge` DISABLE KEYS */;
/*!40000 ALTER TABLE `videocourse_knowledge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videocourse_user`
--

DROP TABLE IF EXISTS `videocourse_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videocourse_user` (
  `VideoCourseID` int NOT NULL COMMENT '课程ID',
  `UserID` int NOT NULL COMMENT '用户ID',
  `ViewingState` int DEFAULT NULL COMMENT '观看时长',
  KEY `videocourse_user_videocourse_FK` (`VideoCourseID`),
  KEY `videocourse_user_user_FK` (`UserID`),
  CONSTRAINT `videocourse_user_user_FK` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `videocourse_user_videocourse_FK` FOREIGN KEY (`VideoCourseID`) REFERENCES `videocourse` (`VideoCourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videocourse_user`
--

LOCK TABLES `videocourse_user` WRITE;
/*!40000 ALTER TABLE `videocourse_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `videocourse_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-22 16:26:57
