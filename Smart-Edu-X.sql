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
  `StudyPathID` int DEFAULT NULL,
  `TestPaperID` int DEFAULT NULL,
  PRIMARY KEY (`CourseID`),
  KEY `bigcourse_studypath_FK` (`StudyPathID`),
  KEY `bigcourse_testpaper_FK` (`TestPaperID`),
  CONSTRAINT `bigcourse_studypath_FK` FOREIGN KEY (`StudyPathID`) REFERENCES `studypath` (`StudyPathID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bigcourse_testpaper_FK` FOREIGN KEY (`TestPaperID`) REFERENCES `testpaper` (`TestPaperID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COMMENT='大课程';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bigcourse`
--

LOCK TABLES `bigcourse` WRITE;
/*!40000 ALTER TABLE `bigcourse` DISABLE KEYS */;
INSERT INTO `bigcourse` VALUES (1,'Web前端：从零开始做网站','本课程专为零基础学员准备，从网页基础深入到网页布局开发。课程内容讲解详细，注重细节，让你从入门到精通，一周时间掌握HTML+CSS网页开发。经过学习与实战，可独立开发出高质量的静态网页项目。','https://demo-api.meedu.xyz/storage/images/v43GltVoGF95TDaznUIa6fDmYcIDWQJlEOeh5EqN.png','前端开发','	https://meedu-cos.meedu.xyz/images/paXabsbymlQwlRD8tV3OoPwBrf3jB1E3XslOeDri.png','[\"HTML 网站的骨架\", \"CSS 网站的美颜\", \"项目网站的部署\"]',1,1),(2,'从零玩转HTML5（跨平台开发）','能够利用所学的html、css、photoshop对已经设计好的企业网站界面设计，手把手教会大家对企业网站进行进行切片制作和DIV+CSS布局，独立完成制作静态网站页面和模板，并完成浏览器兼容性测试。','	https://demo-api.meedu.xyz/storage/images/v9PYbvR7bCZXTSk3scR1GV1gccno1qOlnYB3cRS0.png\r\n','前端开发','https://meedu-cos.meedu.xyz/images/paXabsbymlQwlRD8tV3OoPwBrf3jB1E3XslOeDri.png','[\"CSS3特性\", \"伸缩布局\"]',1,1),(3,'零基础吃透微信小程序','本教程目标是从零开始带领读者上手实战小程序开发，课程以微信小程序的核心概念作为主线，介绍配置文件、页面样式文件、JavaScript 的基本知识。并以指南针为例对基本知识进行扩展，另外加上开发工具的安装、小程序发布等内容。','https://demo-api.meedu.xyz/storage/images/N9LKos3c5HZt5MeNW4DFucRXxCPhSLM1ZlDLOtKh.png\r\n','小程序开发','https://meedu-cos.meedu.xyz/images/paXabsbymlQwlRD8tV3OoPwBrf3jB1E3XslOeDri.png','[\"小程序基础\", \"小程序进阶\"]',1,1),(4,'Vue2+Vue3前端框架入门与实战','如果你之前已经习惯了用jQuery操作DOM，学习Vue.js时请先抛开手动操作DOM的思维，因为Vue.js是数据驱动的，你无需手动操作DOM。 它通过一些特殊的HTML语法，将DOM和数据绑定起来。','https://demo-api.meedu.xyz/storage/images/74sZVx4EcT7das1EqgYaBrQj9HUFe0BXVBD5QyTK.png','前端开发','	https://meedu-cos.meedu.xyz/images/paXabsbymlQwlRD8tV3OoPwBrf3jB1E3XslOeDri.png','[\"课程介绍和开发工具\", \"ES6新特性\"]',1,1),(5,'SpringCloud实战（k8s&doceker）','本系列课程我将带大家从K8s基础入门到K8s项目实战，一条龙学习路径帮你学透K8s，成为K8s高级工程师，突破年薪30W！','	https://demo-api.meedu.xyz/storage/images/JLyw8tHNwvA62qa3oePHnGAYdp89Q64EUm0Jb9ss.png','后端开发','https://meedu-cos.meedu.xyz/images/paXabsbymlQwlRD8tV3OoPwBrf3jB1E3XslOeDri.png','[\"docker入门\", \"镜像仓库管理\"]',1,1),(6,'Pytorch深度学习入门与实战','yTorch框架核心使用方法解读，基于最新算法（论文）展开项目实战，全部内容均基于真实数据集与实际任务需求展开，500+课时，30+大型项目实战，适合转行就业与进阶提升的同学们。','https://demo-api.meedu.xyz/storage/images/em6V36Mb8lHVYO1Pxc2cAXt7wDmKcxFo1Be0OkA2.png','深度学习','	https://meedu-cos.meedu.xyz/images/paXabsbymlQwlRD8tV3OoPwBrf3jB1E3XslOeDri.png','[\"Pytorch概述\", \"深度学习基础\"]',1,1),(7,'Go Web开发（进阶实战）','本课程介绍如何用Go语言进行Web应用的开发，将Go语言的特性与Web开发实战组合到一起，帮读者成功地构建跨平台的应用程序，节省Go语言开发Web的宝贵时间。有了这些针对真实问题的解决方案放在手边，大多数编程难题都会迎刃而解。','	https://demo-api.meedu.xyz/storage/images/pONk6mmw4R1NVpUhqu4SArdzG3NaxEcuRqDbDXwY.png','后端开发','	https://meedu-cos.meedu.xyz/images/paXabsbymlQwlRD8tV3OoPwBrf3jB1E3XslOeDri.png','[\"Go操作常见数据库\", \"Go Web开发常用组件\"]',1,1),(8,'一次性搞定Java入门（高新全栈+安卓）','本课程为Java零基础入门部分，让您快速上手Java编程，为Java网站开发，安卓程序设计与开发打下基础。 本课程已完结，走在技术前沿，用实力说话。','https://demo-api.meedu.xyz/storage/images/1K54to6jXihAkLAEJlauA4jGfKkr8fGxpvDfx5Rv.png','后端开发','https://meedu-cos.meedu.xyz/images/paXabsbymlQwlRD8tV3OoPwBrf3jB1E3XslOeDri.png','[\"Java环境安卓配置\", \"Java基本语法\", \"数据类型\", \"变量和常量\"]',1,1);
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
  `CommenTime` datetime NOT NULL COMMENT '评论时间',
  `CommenContent` varchar(500) NOT NULL COMMENT '评论内容',
  PRIMARY KEY (`CommentID`),
  CONSTRAINT `comment_bigcourse_FK` FOREIGN KEY (`CommentID`) REFERENCES `bigcourse` (`CourseID`),
  CONSTRAINT `comment_imageandtest_FK` FOREIGN KEY (`CommentID`) REFERENCES `imageandtext` (`ImageAndTextID`),
  CONSTRAINT `comment_user_FK` FOREIGN KEY (`CommentID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `comment_videocourse_FK` FOREIGN KEY (`CommentID`) REFERENCES `videocourse` (`VideoCourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
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
INSERT INTO `imageandtext` VALUES (1,102,100,'揭开 AI、机器学习和深度学习的神秘面纱','人工智能','https://meedu-cos.meedu.xyz/images/admin/xbnWzaStcDPNoAnYJ5PIDFHZFIXSOJD7leNSHYv0.jpg','文章内容','2021-10-07 12:45:00');
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
  `StudyPathName` varchar(20) NOT NULL COMMENT '学习路径名字',
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
INSERT INTO `studypath` VALUES (1,'前端工程师0基础从入门到大型项目构建','0基础学前端工程师，打造全栈能力知识体系,从网页搭建再到移动APP，小程序开发，一套课程，直达就业！','https://meedu-cos.meedu.xyz/images/ea0wSNSwa6xvVAb0U34iaxRSlJoNkMaRrlI254FC.png','编程开发',4),(2,'前端工程师0基础从入门到大型项目构建','0基础学前端工程师，打造全栈能力知识体系,从网页搭建再到移动APP，小程序开发，一套课程，直达就业！','https://meedu-cos.meedu.xyz/images/ea0wSNSwa6xvVAb0U34iaxRSlJoNkMaRrlI254FC.png','编程开发',4),(3,'产品运营到数据分析高薪必修课','无论你是零基础的小白、初级用户研究员或是以用户为中心的产品经理、设计师、运营、市场等，学完本套课程，都将成为会“读心术”的用户研究员，牢牢“黏”住用户！','https://meedu-cos.meedu.xyz/images/63eaQMKsRTzfH9XvxY9ugHOFUx4g5K100x9cHVkh.png','产品运营',3),(4,'产品运营到数据分析高薪必修课','无论你是零基础的小白、初级用户研究员或是以用户为中心的产品经理、设计师、运营、市场等，学完本套课程，都将成为会“读心术”的用户研究员，牢牢“黏”住用户！','https://meedu-cos.meedu.xyz/images/63eaQMKsRTzfH9XvxY9ugHOFUx4g5K100x9cHVkh.png','产品运营',3);
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
  `ModuleName` varchar(20) NOT NULL COMMENT '模块名称',
  `ModuleDescription` varchar(500) NOT NULL COMMENT '模块描述',
  PRIMARY KEY (`ModuleID`),
  CONSTRAINT `studypathmodule_studypath_FK` FOREIGN KEY (`ModuleID`) REFERENCES `studypath` (`StudyPathID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='学习路径模块';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studypathmodule`
--

LOCK TABLES `studypathmodule` WRITE;
/*!40000 ALTER TABLE `studypathmodule` DISABLE KEYS */;
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
INSERT INTO `testpaper` VALUES (1,'1',1,1,1,'1');
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
  `MulitipleChoiceAnswer` json DEFAULT NULL COMMENT '多选答案',
  `JudgeAnswer` tinyint(1) DEFAULT NULL COMMENT '判断答案',
  `FillBlankAnswer` json DEFAULT NULL COMMENT '填空答案',
  `Analysis` varchar(500) DEFAULT NULL COMMENT '解析',
  PRIMARY KEY (`TestQuestionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='试题';
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `TsetRecordID` int NOT NULL AUTO_INCREMENT COMMENT '考试记录ID',
  `TsetScore` float NOT NULL COMMENT '考试得分',
  `FinishState` tinyint(1) NOT NULL COMMENT '完成状态（true or false）',
  `StartTime` datetime NOT NULL COMMENT '考试开始时间',
  PRIMARY KEY (`TsetRecordID`),
  CONSTRAINT `testrecord_testanalyse_FK` FOREIGN KEY (`TsetRecordID`) REFERENCES `testanalyse` (`TestAnalyseID`) ON DELETE CASCADE ON UPDATE CASCADE
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
  CONSTRAINT `testrecord_question_testrecord_FK` FOREIGN KEY (`TestRecordID`) REFERENCES `testrecord` (`TsetRecordID`)
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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
  `Duration` datetime NOT NULL COMMENT '播放时长',
  PRIMARY KEY (`VideoCourseID`),
  CONSTRAINT `videocourse_bigcourse_FK` FOREIGN KEY (`VideoCourseID`) REFERENCES `bigcourse` (`CourseID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='视频课程';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videocourse`
--

LOCK TABLES `videocourse` WRITE;
/*!40000 ALTER TABLE `videocourse` DISABLE KEYS */;
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

-- Dump completed on 2024-05-16 22:44:57
