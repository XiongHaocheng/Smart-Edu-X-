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
INSERT INTO `bigcourse` VALUES (1,'Web前端：从零开始做网站','本课程专为零基础学员准备，从网页基础深入到网页布局开发。课程内容讲解详细，注重细节，让你从入门到精通，一周时间掌握HTML+CSS网页开发。经过学习与实战，可独立开发出高质量的静态网页项目。','	https://demo-api.meedu.xyz/storage/images/v43GltVoGF95TDaznUIa6fDmYcIDWQJlEOeh5EqN.png','前端开发','https://s2.loli.net/2024/05/27/7xOQMwI93Hsr4Fi.png','[\"HTML 网站的骨架\", \"CSS 网站的美颜\", \"项目网站的部署\"]',1,3,2),(2,'从零玩转HTML5（跨平台开发）','能够利用所学的html、css、photoshop对已经设计好的企业网站界面设计，手把手教会大家对企业网站进行进行切片制作和DIV+CSS布局，独立完成制作静态网站页面和模板，并完成浏览器兼容性测试。','	https://demo-api.meedu.xyz/storage/images/v9PYbvR7bCZXTSk3scR1GV1gccno1qOlnYB3cRS0.png\r\n','前端开发','https://s2.loli.net/2024/05/27/9vKnFxu1MP62bCg.png','[\"CSS3特性\", \"伸缩布局\"]',1,3,2),(3,'零基础吃透微信小程序','本教程目标是从零开始带领读者上手实战小程序开发，课程以微信小程序的核心概念作为主线，介绍配置文件、页面样式文件、JavaScript 的基本知识。并以指南针为例对基本知识进行扩展，另外加上开发工具的安装、小程序发布等内容。','https://demo-api.meedu.xyz/storage/images/N9LKos3c5HZt5MeNW4DFucRXxCPhSLM1ZlDLOtKh.png\r\n','小程序开发','https://s2.loli.net/2024/05/27/zxLKtsVH5afU3Zv.png','[\"小程序基础\", \"小程序进阶\"]',1,5,3),(4,'Vue2+Vue3前端框架入门与实战','如果你之前已经习惯了用jQuery操作DOM，学习Vue.js时请先抛开手动操作DOM的思维，因为Vue.js是数据驱动的，你无需手动操作DOM。 它通过一些特殊的HTML语法，将DOM和数据绑定起来。','https://demo-api.meedu.xyz/storage/images/74sZVx4EcT7das1EqgYaBrQj9HUFe0BXVBD5QyTK.png','前端开发','https://s2.loli.net/2024/05/27/baHchB8dIOFw6rZ.png','[\"课程介绍和开发工具\", \"ES6新特性\"]',1,4,2),(5,'SpringCloud实战（k8s&doceker）','本系列课程我将带大家从K8s基础入门到K8s项目实战，一条龙学习路径帮你学透K8s，成为K8s高级工程师，突破年薪30W！','	https://demo-api.meedu.xyz/storage/images/JLyw8tHNwvA62qa3oePHnGAYdp89Q64EUm0Jb9ss.png','后端开发','https://s2.loli.net/2024/05/27/ClK2Tz1Sh4ADwHU.png','[\"docker入门\", \"镜像仓库管理\"]',1,1,1),(6,'Pytorch深度学习入门与实战','PyTorch框架核心使用方法解读，基于最新算法（论文）展开项目实战，全部内容均基于真实数据集与实际任务需求展开，500+课时，30+大型项目实战，适合转行就业与进阶提升的同学们。','https://demo-api.meedu.xyz/storage/images/em6V36Mb8lHVYO1Pxc2cAXt7wDmKcxFo1Be0OkA2.png','深度学习','https://s2.loli.net/2024/05/27/KJLMT6hjz1ZgdsG.png','[\"Pytorch概述\", \"深度学习基础\"]',1,6,3),(7,'Go Web开发（进阶实战）','本课程介绍如何用Go语言进行Web应用的开发，将Go语言的特性与Web开发实战组合到一起，帮读者成功地构建跨平台的应用程序，节省Go语言开发Web的宝贵时间。有了这些针对真实问题的解决方案放在手边，大多数编程难题都会迎刃而解。','	https://demo-api.meedu.xyz/storage/images/pONk6mmw4R1NVpUhqu4SArdzG3NaxEcuRqDbDXwY.png','后端开发','https://s2.loli.net/2024/05/27/hXHNrivdJeqBjU1.png','[\"Go操作常见数据库\", \"Go Web开发常用组件\"]',1,6,3),(8,'一次性搞定Java入门（高新全栈+安卓）','本课程为Java零基础入门部分，让您快速上手Java编程，为Java网站开发，安卓程序设计与开发打下基础。 本课程已完结，走在技术前沿，用实力说话。','https://demo-api.meedu.xyz/storage/images/1K54to6jXihAkLAEJlauA4jGfKkr8fGxpvDfx5Rv.png','后端开发','https://s2.loli.net/2024/05/27/XYs7vgPy6hHuiwa.png','[\"Java环境安卓配置\", \"Java基本语法\", \"数据类型\", \"变量和常量\"]',1,1,1),(9,'Python数据分析（机器学习实战）','简单、实用的Python数据分析、数据挖掘视频教程，主要介绍Python在数据处理、数据分析、数据可视化、数据挖掘方面常用的实战方法与技巧。','	https://demo-api.meedu.xyz/storage/images/uoUR9iCcc1DPX1lOwFaL0GbUdw1tvIAAsaolj7n6.png','人工智能','https://s2.loli.net/2024/05/27/zxaVkjg4hbAwsUm.png','[\"人工智能入门指南\", \"Python科学计算库\"]',1,2,1),(10,'Uni-app实战视频点播小程序','全网最详细的Uniapp实战开发app小程序课程，7大实战开发案例（社区交友，商城，即时通讯，音频小说、网盘、点播、直播）帮助你获得技术优势并提高面试竞争力。','	https://demo-api.meedu.xyz/storage/images/rvX9mXmAEf285HBKb3JFFjvlBkMIVXPQQKGPVrqP.png','移动开发','https://s2.loli.net/2024/05/27/aEUBIO5dgDXcoCr.png','[\"准备工作\", \"项目分析和全局样式\", \"首页开发\", \"后端API开发\"]',1,NULL,NULL),(11,'微信公众号+小程序快速开发','本课程致力于打造一站式微信开发全方位学习模式，微信开发从入门到精通全套系统课程。从宝贵“实战案例”中总结“踩坑”经验，助你快速搭建微信公众号、小程序，彻底玩转微信开发。','https://demo-api.meedu.xyz/storage/images/VY3SVQog9nmUIPer80vaWea5bakgRJJUd7sA7IVV.png','移动开发','https://s2.loli.net/2024/05/27/iXJKyrIvsNuASF6.png','[\"微信开发基础\", \"公众号小程序实战案例\"]',1,NULL,NULL),(12,'IOS+Swift零基础教程（2021版iOS14）','课程会介绍需要用到的操作系统和开发工具，和编程语言 Swift 的注释、数据类型、函数、控制流语句（条件和循环）、可选类型、命名类型（枚举、类和结构体）的概念和使用方法，在 Project 项目中通过 .storyboard 文件进行应用的界面的实现，通过 .swift 文件进行应用的功能实现。','https://demo-api.meedu.xyz/storage/images/Qj2kY3vSI3o4rt5YCImxmWmxkNdwYQQYQraINNo5.png','移动开发','https://s2.loli.net/2024/05/27/Hlx1tr57EOfipKD.png','[\"Swift语言入门\", \"实战案例\"]',1,NULL,NULL),(13,'C++语言基础到进阶','关于内容特点 1、知识点讲解细致入微 2、结合大家平时易出现问题的点，详细解析 3、课程顺序符合思考逻辑，引导大家发现问题并解决问题 4、对于有C++基础的朋友，本系列视频，肯定能让你对C++有新的认识。','https://demo-api.meedu.xyz/storage/images/P0eroC3R9bAwUKvUY1z5HqLpTZdrwaif9qpXEBnC.png','后端开发','https://s2.loli.net/2024/05/27/xltrcYaJmO2SNez.png','[\"C++语言介绍\", \"基本语言\", \"类\"]',1,NULL,NULL);
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
INSERT INTO `bigcourse_user` VALUES (2,10),(4,10),(1,10),(7,10);
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
INSERT INTO `imageandtext` VALUES (1,112,100,'揭开 AI、机器学习和深度学习的神秘面纱','人工智能','https://meedu-cos.meedu.xyz/images/admin/xbnWzaStcDPNoAnYJ5PIDFHZFIXSOJD7leNSHYv0.jpg','### 什么是人工智能？\n\n纵观人工智能的历史，定义不断被重新定义。人工智能是一个总称（这个想法始于 50 年代）;机器学习是 AI 的一个子集，深度学习是 ML 的一个子集。','2021-10-07 12:45:00'),(2,2,1,'机器人设计与自动化中的计算美学','人工智能','https://meedu-cos.meedu.xyz/images/admin/Ya5MIn4hcdhQr0X0eSiyKqBmv2QaPSeTgKl3B3Wc.jpg','### 什么是计算美学？\n\n计算美学研究使用计算机创建的事物的设计和外观。它相对较新，仍处于起步阶段。然而，它已经对我们思考机器人和自动化的方式产生了重大影响。\n\n计算机美学侧重于计算机如何在没有人为干扰或输入的情况下创建外观完美的设计。这意味着它可以让我们设计机器人，而不必担心它们一旦生产出来的外观或功能。\n\n这使设计师可以自由和灵活地创建他们的产品，因为他们不必担心完成后的外观或功能。这也使他们更容易尝试新的想法和风格，因为这些不会对最终产品的外观或功能产生任何直接影响。\n\n![img](https://meedu-cos.meedu.xyz/images/admin/Ya5MIn4hcdhQr0X0eSiyKqBmv2QaPSeTgKl3B3Wc.jpg)\n\n### 计算美学有几个分支，所有这些都涉及研究和评估计算机生成的图像和动画的图形和符号方面。它们包括：\n\n形式主义：这种方法侧重于图像和动画的形式结构及其美学品质。\n\n后结构主义：这种方法研究社会背景如何塑造图像和动画，这会影响它们的意义和价值。\n\n解构主义：这种方法从批判的角度审视图像和动画，研究它们如何破坏传统的现实或真理概念。\n\n结构主义：这种观点侧重于如何根据特定的结构规则构建图像和动画。\n\n###\n\n### 计算美学给机器人自动化带来了什么？\n\n机器人自动化彻底改变了制造和物流。与此同时，它催生了一个新的计算美学分支，称为机器人信息学。\n\n机器人信息学研究机器人如何与周围环境互动，以及这如何影响其设计的美学。它考虑了诸如如何创建具有视觉吸引力的机器人以及如何确保它们以美观的方式运行等问题。\n\n虽然这一领域的研究仍在进行中，但已经有一些有希望的结果。例如，一项研究表明，人们对具有精心设计的视觉参与机器人的反应更有利。这可能有助于提高行业的效率和生产力，同时为机器人技术创造更积极的形象。\n\n\n\n### 计算美学如何影响机器人编程？\n\n计算美学影响机器人编程的主要方式之一是提供设计和改进机器人的新方法。这些新方法包括人工智能（AI），机器学习（ML）和深度学习（DL）。\n\n所有这些方法都涉及教计算机做曾经不可能的事情。特别是ML是一种人工智能形式，它允许计算机从经验中学习，并根据这种经验随着时间的推移提高其性能。DL类似于ML。不同之处在于，它使机器人能够从数据和其他机器中获取知识。\n\n借助深度学习，机器人可以变得更有创造力——它们可以学习如何创建人类无法自己想出的设计，至少不是不费吹灰之力！\n\n\n\n### 编程如何改善计算美学？\n\n机器人自动化已经证明，它有可能提高工厂运营的效率和准确性，特别是随着机器人在设计领域越来越受欢迎。然而，它也可能导致产生美学上令人不快的物体。\n\n为了避免这种情况，我们必须学习如何正确编程机器人。这将使我们能够创建看起来不错且有效运行的对象。它还将为我们提供以前无法实现的精度和细节水平。有许多具有先进计算美学的机器人，它们在制造、医疗保健和安全领域变得越来越普遍。\n\n在对机器人进行编程以确保计算美学时，需要遵循一些原则：\n\n- 保持程序简单易懂。\n- 确保每个程序都清晰易读。\n- 在整个程序中使用一致的术语。\n- 设计程序，以便可以轻松地将它们从一个环境移植到另一个环境。\n\n一些著名的美观机器人的例子包括谷歌的自动驾驶汽车和Five9的触觉吸尘器。这两种技术都得到了消费者的压倒性认可，这要归功于它们的创新设计和令人印象深刻的功能。\n\n您可能熟悉的其他具有高级计算美学的机器人包括DARPA的智能机器人车辆（IRV）程序和软银机器人公司的Pepper人形机器人。这两种技术因其与人类自然互动的能力而特别引人注目，这使得它们在未来的工作场所中具有潜在的无价价值。\n\n还有其他具有先进计算美学的机器人，而且它们每年都变得越来越普遍。\n\n###\n\n### 以下是一些示例：\n\n人形机器人索菲亚（Sophia）被设计成看起来像人类的外观和感觉，并学习和理解人类的情感。Hanson Robotics开发的机器人可以使用自然语言处理来导航周围环境，这使它们能够以更像人类的方式与人类互动。HAL项目是东京大学科学家和NEC公司之间的合作，HAL是一个人形机器人，可以展示逼真的面部表情和动作。\n\n###\n\n### 计算美学在机器人自动化中的重要性\n\n使用机器人的主要好处之一是，我们可以将它们设计成看起来美观，而不必明确地针对美学进行编程。这是因为机器人的设计过程依赖于与传统设计过程不同的原则。\n\n计算美学在创造具有视觉吸引力的机器人方面起着至关重要的作用。它通过增强用户对机器人的体验来做到这一点，使其变得可爱且易于使用。这使人们能够专注于一项任务，而不是在机器人周围感到害怕或不舒服。\n\n此外，计算美学还有助于我们了解人类如何与物体和系统交互，这可以帮助设计师创建更直观的设计供人类使用。当我们转向越来越复杂的机器和系统时，这一点尤其重要。\n\n除了看起来不错之外，有效和高效的设计应该易于使用。通过研究设计过程的可用性，设计师可以确保他们的机器人易于理解和使用，无论他们使用什么语言或界面。这将使人们更容易与他们互动和共享信息。\n\n###\n\n### 计算美学的下一步将走向何方？\n\n目前对计算美学的研究集中在我们如何设计机器人，并根据人类的感知和认知来设计它们的外观。它研究了机器人的设计如何实现美学目标，例如降低噪音水平或提高乘员舒适度。它还研究了视觉信息处理如何有助于我们对机器人美学的理解。\n\n总体而言，这项研究正在帮助我们了解机器人如何在特定的应用环境中以及更普遍地在生活的不同领域实现理想的结果。它甚至可以使我们有能力开发可以应用于不同学科的新美学范式。','2021-10-07 12:39:00'),(3,3,1,'最受开发人员喜爱的机器学习软件工具','人工智能','https://meedu-cos.meedu.xyz/images/admin/qEeX8v1ygop5yadVeyE8PHxcGk2Qob408aHYYeVk.jpg','人工智能、自迭代数据分析、监督学习和其他机器学习算法中的任何专用软件都被视为机器学习软件。机器学习可用于许多软件应用程序，包括电子邮件分类或人机交互。机器学习软件可用于建模、设计、招聘和会计。它可以使无用的机器人和功能齐全的AI系统之间产生重大差异。了解您应该使用哪个软件包可以帮助您选择。\n\n\n\n### 机器学习软件主要特点\n\n- 有许多模式识别技术，包括分类、回归和模式识别。\n- 图像和文本检索的预测分析。\n- 减小尺寸的功能。\n- 向量机提供帮助。\n- 与Apache SparkMLlib等机器学习库合作。\n- 使用流行的编程语言，如Scala，Java和C++。\n- 使用全栈开源进行机器学习。\n\n![img](https://meedu-cos.meedu.xyz/images/admin/qEeX8v1ygop5yadVeyE8PHxcGk2Qob408aHYYeVk.jpg)\n\n\n\n### 1. 亚马逊ML\n\nAmazon Machine Learning （AML） 是一种基于云的综合机器学习工具，可供所有技能水平和在线应用程序开发人员使用，可供任何级别的开发人员使用。\n\n此托管服务提供机器学习模型和预测。它还集成了来自多个来源的数据，例如Redshift，Amazon S3，RDS和Amazon S3。\n\nAmazon Machine Learning 提供可视化和向导工具。\n\n支持三种类型的模型：二元分类、多类分类和回归。\n\n此工具允许用户使用 MySQL 数据库创建数据源对象。\n\n它还允许用户从 Amazon Redshift 数据创建数据源对象。\n\n###\n\n### 2. 谷歌 ML 套件移动\n\n谷歌的Android团队为移动应用程序开发人员创建了一个ML KIT，该工具包结合了机器学习和技术知识，以创建更具弹性和优化的应用程序，以便在智能手机上运行。\n\n此机器学习软件包可用于执行人脸检测、文本识别和地标检测等任务。\n\n它还有助于图片标签和条形码扫描。您可以通过它访问强大的技术。\n\n它可以在设备上或云中运行，具体取决于您的需求。它可以使用预制模型或现成的解决方案进行软件开发。该套件包括Google的Firebase移动开发平台。\n\n\n\n### 3.苹果核心ML\n\nApple Core ML 是一个使用机器学习来帮助你将机器学习模型集成到移动应用中的平台，可从 Apple 获得。\n\n将机器学习中的文件放入您的项目中，Xcode 将立即生成 Swift 包装器或 Objective-C 代码。此方法易于使用，并且将利用所有 CPU 和 GPU。\n\nCoreML 支持计算机视觉以准确分析图像，GameplayKit 用于评估学习的决策树，自然语言可快速执行自然语言处理。它针对设备上的最佳性能进行了优化。\n\n\n\n### 4. Apache Spark MLlib\n\n这是一个可以在Apache Mesos和Hadoop上扩展的机器学习库。它还可以从多个数据源检索数据。有几种技术可用于对数据进行分类，包括朴素贝叶斯和逻辑回归。回归：一般线性回归也可用。聚类：K 均值是另一种选择。其工作流工具包括 ML 管道创建、特征转换、ML 持久性等。\n\n您可以访问 Hadoop 数据源，如 HDFS、HBase 或本地文件。它很容易与Hadoop操作集成，因为它能够访问Hadoop数据源，如HDFS，HBase或本地文件。MLlib还与Spark API集成，并在Python库和R库中与NumPy很好地配合使用。它具有优于MapReduce的算法。\n\n\n\n### 5. 阿帕奇新加\n\n该程序由新加坡国立大学数据库系统组与浙江大学数据库组合作开发。\n\n该人工智能系统有助于图片识别以及自然语言处理。它支持许多著名的深度学习模型。它由三个主要部分组成：IO 核心、模型和核心。张量抽象可用于创建更复杂的机器学习模型。此应用程序提供了改进的 IO 类来写入、读取、编码和解码文件和数据。此应用程序可用于同步、异步或两者的组合进行训练。\n\n\n\n### 6. 阿帕奇驯象师\n\nApache Mahout是Scala的分布式线性代数框架和Scala DSL。它在数学上具有表现力。Apache 软件基金会的免费开源项目。\n\n创建此框架是为了快速开发统计学家、数学家和数据科学家的算法。它提供机器学习技术，如建议、分类、聚类和分类，以及用于创建可扩展算法的框架。\n\n它包括矢量和矩阵库，并使用MapReduce范式在Apache Hadoop上运行。\n\n\n\n### 7. Accord.NET\n\n它 integrates.Net 具有 C# 音频和图像处理 API 的机器学习基础。它有许多可用于各种目的的库，例如模式识别、数据处理和线性代数。\n\n它还包含协议。统计学、Accord.Math 和 Accord.MachineLearning 类。\n\nAccord.Net 的特点\n\n有 40 多种统计分布估计可用于估计非参数或参数统计。\n\n用于计算机视觉、计算机听力、信号处理和统计的高质量计算机程序。\n\n有超过 35 种假设检验可用，包括单因子和双向方差分析检验。\n\n它支持超过 38 个内核函数。\n\n\n\n### 8. 幕府将军\n\n它是一个开源且免费的机器学习库。它由Gunnar Raetsch & Soeren Sonnenburg于1999年开发。\n\n该软件可以在C++中实现。该软件实际上提供了可用于解决机器学习问题的方法和数据结构。\n\n它支持多种编程语言，包括R，Python和Java，Octave以及C#，Ruby，Lua，Lua，Ruby，C#，Ruby等。\n\nShogun主要关注内核机器，例如回归问题和支持向量机进行分类。您可以连接到 LibLinear 和 LibSVM 等机器学习库。\n\n\n\n### 9. Tensorflow\n\n它是一个开源机器学习库，允许您构建 ML 模型。谷歌创建了Tensorflow。\n\n它提供了广泛的库、工具和资源，使研究人员和开发人员能够开发和部署机器学习系统。\n\n它可以帮助您开发和训练模型。TensorFlow.js是一个将模型转换为html的工具。\n\n它是一个开源软件程序，可用于使用数据流图进行数值计算。它可用于 CPU 和 GPU 以及一系列移动计算设备。\n\n###\n\n### 10. 谷歌云 ML 引擎\n\nGoogle Cloud ML Engine 是一款出色的工具，如果您拥有数十亿或数百万个训练数据点，或者算法需要花费大量时间才能正确执行，则可以为您提供帮助。\n\n它是一个基于云的平台，允许机器学习应用程序开发人员和数据科学家创建和执行高质量的模型。\n\n提供机器学习模型训练、构建、深度学习、预测建模甚至预测的所有可用选项。\n\n此应用程序被许多企业用于各种目的。企业可以使用它来识别卫星图像中的云或更快地响应客户电子邮件。它可以通过多种方式训练复杂的模型。\n\n\n\n### 11. IBM 机器学习\n\nIBM 机器学习服务允许您组合和混合 IBM Watson Studio 和 IBM Watson OpenScale 等技术。\n\n开源软件可用于构建 AI 模型、将模型集成到您的应用程序中并对其进行测试。IBM Machine Learning 提供免费的轻量级计划，其中包括 20 CPUH 的上限和同时优化批处理任务。\n\n\n\n### 12. 羚羊\n\n它建立在Apache Spark和Apache Kafka之上，是lambda架构的一个例子。它用于大规模实时算法。\n\nOrxy2软件开发平台包括用于过滤和打包，回归，分类，聚类和分类的端到端应用程序。Oryx 2.8.0 是此实用程序的最新版本。\n\nOryx 2是指Oryx 1项目的更高级版本。\n\n它有三层协作工作：速度层和批处理层。服务层是第三个。\n\n还包括一个数据传输层，用于跨不同级别传输数据并接收来自外部源的输入。\n\n\n\n### 13. 神经设计师\n\n神经设计器是一种正在兴起的机器学习服务，它允许您跳过编码并使用拖放和点击功能创建框图。与许多其他系统相比，它们以 417K+ 的采样率提供更好的平均 GPU 训练性能。\n\n神经设计器完全用C++编写。这损害了一些可用性优势，以提高性能。\n\n大型数据加载需要出色的内存管理。优化 CPU 和 GPU 性能可实现快速计算。\n\n\n\n### 14. Azure 机器学习\n\nMicrosoft 的 Azure 机器学习允许客户快速轻松地构建、训练、部署和维护机器学习模型。\n\nQA 经理会喜欢使用自动化机器学习快速识别和测试相关方法的能力。它提供了许多增强功能，例如事件处理、应用服务和自动化，任务持续时间长达 500 分钟。\n\n您将获得强大的附加组件选择、较长的试用期和货币积分。\n\n\n\n### 15.蟒蛇\n\nAnaconda是一个支持MLOps周期的框架，被美国国家银行和AT&T以及丰田和高盛使用。\n\nConda 的基本组件包括 Conda 包管理器、无限的企业产品和连接，以及可复制或云存储库和环境管理员。\n\n通过个人订阅，自由职业者很容易。任何人都可以使用它们，它们包括数百个开源框架和工具以及 7500+ Conda 包。\n\n\n\n### 总结\n\n虽然一些机器学习算法可以预先设计为专注于特定领域，但其他算法则允许用户使用任何数据创建自己的模型。\n\n市场上有不同类型的应用软件，我们在这里讨论了机器学习技术的最佳软件工具。\n\n我们研究了使用最广泛的一些机器学习工具，以及如何将它们用于不同的目的。\n\n还有许多其他机器学习库没有进入列表，因为机器学习领域正在增长。','2021-07-21 03:04:00'),(4,3,1,'“互联网+职业技能培训”成技能学习新业态','教育','https://demo-api.meedu.xyz/storage/images/2ZMVoo2fGTcsvBPBRcgb16vyl529ycZxIP8R3LtJ.jpg','人力资源和社会保障部印发《“技能中国行动”实施方案》，指出要加强数字技能培训，普及提升全民数字素养；大力推行“互联网+职业技能培训”，广泛开展新职业新业态新模式从业人员技能培训等。腾讯研究院发布的《中国在线职业教育市场发展报告》显示，预计2021年中国在线教育市场总规模将突破300亿元。其中，在线职业培训是主要驱动力之一，到2021年，将突破1000亿元大关。\n\n![1](https://meedu-cos.meedu.xyz/images/n00fOjf2vha4fuSwyhQewKWpeZHr7MhIys1vdzvF.jpg)\n\n众所周知，职业培训行业受政策影响较大，一旦政策有所调整，整个行业往往牵一发而动全身。受疫情影响，今年上半年的所有职业资格考试均推迟或取消，线下培训全部取消，职培行业可谓是经历了一次大洗牌。\n\n![2](https://meedu-cos.meedu.xyz/images/cOZESubxpytzF9b6Ep6MS52jhzcfeLjPPeELSMlj.jpg)\n\n3月份，人力资源社会保障部、财政部印发关于实施职业技能提升行动“互联网+职业技能培训计划”的通知，并推出“百日免费线上技能培训行动”，鼓励支持广大劳动者参加线上职业技能培训。这一政策的出台，对于在线职培行业无疑是重大利好。那么如何把政策“推手”的最大效应发挥出来，是在线职培平台在行业赛道中脱颖而出的重要砝码。\n\n通过线上职业培训平台，既可以按照章节、主题学习视频、音频、图文课程，下载文档资料，也有直播功能，能够很好地实时互动，大部分用户使用后都觉得线上的课程资源很丰富，呈现形式多样，非常方便实用。对于培训机构来说，也明显感觉有助于取得更好的教学成果。\n\n以打造线上知识服务平台的Meedu系统为例，其为职业培训、公职考试、法律、家政、美妆、中医健康等不同领域的培训机构，搭建PC网校、微信公众号、微信小程序、APP等形式的在线职业培训平台，Meedu为学员提供直播、视频、考试测评、各类营销工具、教务管理等一站式服务，通过这些专业的线上平台，很多地处偏远、当地没有最先进的优质师资的用户，也能够及时在线学习新知识新技术，足不出户就能够提升自己，解决难题。\n\n强烈的市场需求，明朗的政策导向，以及互联网发展普及到前所未有的程度，都为在线职培行业的高速发展创造了有利条件，是机遇亦是挑战。2020年政策与疫情双重刺激下市场的爆发，在线职培行业走向了春天。','2020-07-19 00:25:00'),(5,1,1,'关于新媒体运营你必须知道','新媒体','https://demo-api.meedu.xyz/storage/images/a6BPYp5MaGtF5Z3VsC4l3DaVj3EY5llgHkP3Qfl2.jpg','新媒体运营，为时未晚，不同的平台的玩法也不尽相同。新媒体运营平台根据企业现阶段的目标来定的，用户拉新、品牌曝光或者销售转化，目标不同，选择的平台也就不同。\n\n![1](https://meedu-cos.meedu.xyz/images/zgtZgl6HakFxyLEa0v78lZmN8mTi7VyeVDThQN94.jpg)\n\n公众号弱于拉新，强于品牌和服务；抖音企业号强于获客，目前正在补足私域的短板；视频号是视频化的企业官网，与公众号互为补充；微博做舆情监控和品牌公关；B站做品牌破圈；知乎做精准的流量搜索；小红书做红人投放。\n新品牌/新企业的初期任务是产品曝光。相比订阅制的公众号，采取算法推荐的抖音会更适合冷启动，初期可以结合投DOU+快速获取用户。\n这一阶段可以同时开通公众号，作为产品服务的承接。如果偏向ToC，并且具有强服务属性，如麦当劳、中国移动、招商银行等，那么做服务号，因为它接口功能更加丰富，还可以关联支付、交易。缺点是推送次数少，一个月只有四次，因此用户粘性上可能不强。但这个缺点可以通过私域运营来补足，典型如瑞幸咖啡、完美日记。如果偏向ToB，如腾讯云、神策数据、旷视科技等，那么做订阅号，用于发布行业资讯。当然，如果资源充足的话，可以服务号、订阅号一起做，服务号做服务承接，订阅号做行业发声。关于公众号如何涨粉，基本有三种方法，第一种是投放，直接买流量。前提是软文好（考验写手），选对投放的号（考验投手）。典型如风变科技的Python小课。第二种是线上线下的活动，活动一般会设置利益点来吸引用户。第三种是既有渠道的利用，最常见的就是扫码注册登录即完成服务号关注，大多数工具类软件的企业号都是这么操作的，如创客贴、135编辑器、ProcessOn。\n抖音企业号，中小企业要趁早做，不同企业在短视频营销上有不同的诉求。经营规模成熟的头部企业，重在品牌价值的传递；行业内小有名气但大众认知不足的腰部企业，侧重品牌和效果的协同；初创企业、工商个体等小型公司偏重实际销售效果的引流。另外值得一提的是，7月27日，抖音企业号2.0正式发布，这是抖音专门给企业做的私域经营方案。“超强的公域+到位的私域”，这是很有想象力的。\n\n![2](https://meedu-cos.meedu.xyz/images/oP6a3RAXKVEpB5d7uiBnzJqKZnJ0ZQXMw12u7Xvs.jpg)\n\n行业太垂直要怎么做抖音内容？反其道而行之。\n很多从业者有个思维定式，认为内容越聚焦受众越精准。但事实上，当你没有流量时，你的内容再精准也没用，因为压根都没触达到目标用户。\n所以要换个思维，把内容选题放大。比如做探房，策划的内容就不能局限于有能力买房的小部分人，而是要尽可能面向大众，让他们也能看得津津有味。先让内容爆起来，这样才有机会去触达那小部分精准用户，典型如大白探房。研究抖音上的头部账号，研究抖音上同类型的头部账号，总结它们内容上的规律，然后再结合自己的优势，做微创新。先做爆款，再筛选用户。而不是精准地找到用户。\n\n不论选择哪个平台，企业新媒体的终极目标都是产品，只不过每个平台触达产品的方式和路径有所不同。','2020-07-19 00:19:00');
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
INSERT INTO `question_testpaper` VALUES (1,1,10,1),(2,1,10,2),(3,1,10,3),(4,1,10,4),(5,1,10,5);
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
INSERT INTO `testpaper` VALUES (1,'测试试卷',50,30,5,'5');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='试题';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testquestion`
--
INSERT INTO smartedux.testquestion (TestQuestionID, QuestionText, QuestionImage, QuestionType, SingleChoice, MultipleChoice, FillBlankQuantity, SingleChoiceAnswer, MultipleChoiceAnswer, JudgeAnswer, FillBlankAnswer, Analysis) VALUES (1, '这是有图片的选择题测试()', 'https://img.tukuppt.com/png_preview/00/02/58/LFQPgeNTyr.jpg!/fw/780', '单选题', '[{"option": "A", "checked": false, "content": "选项A"}, {"option": "B", "checked": false, "content": "选项B"}, {"option": "C", "checked": false, "content": "选项C"}, {"option": "D", "checked": false, "content": "选项D"}]', null, null, 'A', null, null, null, '这是这道题的解析。');
INSERT INTO smartedux.testquestion (TestQuestionID, QuestionText, QuestionImage, QuestionType, SingleChoice, MultipleChoice, FillBlankQuantity, SingleChoiceAnswer, MultipleChoiceAnswer, JudgeAnswer, FillBlankAnswer, Analysis) VALUES (2, '这是有无图片的选择题测试()', null, '单选题', '[{"option": "A", "checked": false, "content": "选项A"}, {"option": "B", "checked": false, "content": "选项B"}, {"option": "C", "checked": false, "content": "选项C"}, {"option": "D", "checked": false, "content": "选项D"}]', null, null, 'B', null, null, null, '无');
INSERT INTO smartedux.testquestion (TestQuestionID, QuestionText, QuestionImage, QuestionType, SingleChoice, MultipleChoice, FillBlankQuantity, SingleChoiceAnswer, MultipleChoiceAnswer, JudgeAnswer, FillBlankAnswer, Analysis) VALUES (3, '这是多选题()', null, '多选题', 'null', '[{"option": "A", "checked": false, "content": "选项A"}, {"option": "B", "checked": false, "content": "选项B"}, {"option": "C", "checked": false, "content": "选项C"}, {"option": "D", "checked": false, "content": "选项D"}]', null, '', '["A", "C"]', null, null, null);
INSERT INTO smartedux.testquestion (TestQuestionID, QuestionText, QuestionImage, QuestionType, SingleChoice, MultipleChoice, FillBlankQuantity, SingleChoiceAnswer, MultipleChoiceAnswer, JudgeAnswer, FillBlankAnswer, Analysis) VALUES (4, '这是填空题().()', null, '填空题', null, null, 2, null, null, null, '["1212", "212"]', null);
INSERT INTO smartedux.testquestion (TestQuestionID, QuestionText, QuestionImage, QuestionType, SingleChoice, MultipleChoice, FillBlankQuantity, SingleChoiceAnswer, MultipleChoiceAnswer, JudgeAnswer, FillBlankAnswer, Analysis) VALUES (5, '这是判断题', null, '判断题', null, null, null, null, null, 1, null, null);


LOCK TABLES `testquestion` WRITE;
/*!40000 ALTER TABLE `testquestion` DISABLE KEYS */;
INSERT INTO `testquestion` VALUES (1,'这是有图片的选择题测试()','https://img.tukuppt.com/png_preview/00/02/58/LFQPgeNTyr.jpg!/fw/780','单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"选项A\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"选项B\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"选项C\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"选项D\"}]',NULL,NULL,'A',NULL,NULL,NULL,'这是这道题的解析。'),(2,'这是有无图片的选择题测试()',NULL,'单选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"选项A\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"选项B\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"选项C\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"选项D\"}]',NULL,NULL,'B',NULL,NULL,NULL,'无'),(3,'这是多选题()',NULL,'多选题','[{\"option\": \"A\", \"checked\": false, \"content\": \"选项A\"}, {\"option\": \"B\", \"checked\": false, \"content\": \"选项B\"}, {\"option\": \"C\", \"checked\": false, \"content\": \"选项C\"}, {\"option\": \"D\", \"checked\": false, \"content\": \"选项D\"}]',NULL,NULL,'','[\"A\", \"C\"]',NULL,NULL,NULL),(4,'这是填空题().()',NULL,'填空题',NULL,NULL,2,NULL,NULL,NULL,'[\"1212\", \"212\"]',NULL),(5,'这是判断题',NULL,'判断题',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL);
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
  `FinishState` tinyint(1) NOT NULL COMMENT '完成状态',
  `StartTime` datetime NOT NULL COMMENT '考试开始时间',
  `UserID` int NOT NULL COMMENT '用户ID',
  `TestAnalyseID` int DEFAULT NULL COMMENT '考试分析ID',
  `TestPaperID` int DEFAULT NULL COMMENT '试卷ID',
  PRIMARY KEY (`TestRecordID`),
  KEY `testrecord_testanalyse_FK` (`TestAnalyseID`),
  KEY `testrecord_user_FK` (`UserID`),
  KEY `testrecord_testpaper_FK` (`TestPaperID`),
  CONSTRAINT `testrecord_testanalyse_FK` FOREIGN KEY (`TestAnalyseID`) REFERENCES `testanalyse` (`TestAnalyseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `testrecord_testpaper_FK` FOREIGN KEY (`TestPaperID`) REFERENCES `testpaper` (`TestPaperID`),
  CONSTRAINT `testrecord_user_FK` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='考试记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testrecord`
--

LOCK TABLES `testrecord` WRITE;
/*!40000 ALTER TABLE `testrecord` DISABLE KEYS */;
INSERT INTO `testrecord` VALUES (1,0,0,'2024-05-26 05:35:01',10,NULL,1),(2,0,0,'2024-05-26 07:26:49',10,NULL,1),(3,0,0,'2024-05-26 07:27:16',10,NULL,1);
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
  `UserAnswer` varchar(5000) DEFAULT NULL COMMENT '用户答案',
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

-- Dump completed on 2024-05-27 11:57:10
