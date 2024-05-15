-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: smart-edu-x
-- ------------------------------------------------------
-- Server version	8.0.33

drop database if exists smartedux;
create database smartedux;
use smartedux;

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
  `CourseName` varchar(20) NOT NULL COMMENT '课程名称',
  `CourseDescription` varchar(500) NOT NULL COMMENT '课程描述',
  `CourseCover` varchar(500) NOT NULL COMMENT '课程封面',
  `CourseDomain` varchar(20) NOT NULL COMMENT '课程涉及领域',
  `CourseImage` varchar(500) COMMENT '课程详情图片',
  `MajorChapters` json NOT NULL COMMENT '大章节',
  PRIMARY KEY (`CourseID`),
  CONSTRAINT `bigcourse_testpaper_FK` FOREIGN KEY (`CourseID`) REFERENCES `testpaper` (`TestPaperID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bigcourse_studypath_FK` FOREIGN KEY (`CourseID`) REFERENCES  `studypath` (`StudyPathID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='大课程';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bigcourse`
--

LOCK TABLES `bigcourse` WRITE;
/*!40000 ALTER TABLE `bigcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `bigcourse` ENABLE KEYS */;
UNLOCK TABLES;


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
  CONSTRAINT `comment_user_FK` FOREIGN KEY (`CommentID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `comment_imageandtest_FK` FOREIGN KEY (`CommentID`) REFERENCES `imageandtext` (`ImageAndTextID`),
  CONSTRAINT `comment_videocourse_FK` FOREIGN KEY (`CommentID`) REFERENCES `videocourse` (`VideoCourseID`),
  CONSTRAINT `comment_bigcourse_FK` FOREIGN KEY (`CommentID`) REFERENCES `bigcourse` (`CourseID`)
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
  `ArticleContent` LONGTEXT NOT NULL COMMENT '文章内容',
  `ReleaseTime` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`ImageAndTextID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='图文';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imageandtext`
--

LOCK TABLES `imageandtext` WRITE;
/*!40000 ALTER TABLE `imageandtext` DISABLE KEYS */;
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
  `AnswerContent` LONGTEXT NOT NULL COMMENT '回答内容',
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
#   TODO：计算属性
  `CourseNumber` int NOT NULL COMMENT '课程数量',
  PRIMARY KEY (`StudyPathID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='学习路径';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studypath`
--

LOCK TABLES `studypath` WRITE;
/*!40000 ALTER TABLE `studypath` DISABLE KEYS */;
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
#   TODO：计算属性
  `QuestionNumber` int NOT NULL COMMENT '题目总数',
    #   TODO：计算属性
  `CorrectQuantity` int NOT NULL COMMENT '正确数量',
    #   TODO：计算属性
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
#   TODO:计算属性
  `QuestionNumber` int NOT NULL COMMENT '题目数量',
  `Duration` varchar(100) NOT NULL COMMENT '持续时间',
  PRIMARY KEY (`TestPaperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='试卷';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testpaper`
--

LOCK TABLES `testpaper` WRITE;
/*!40000 ALTER TABLE `testpaper` DISABLE KEYS */;
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
  `QuestionImage` varchar(500) COMMENT '题干图片',
  `QuestionType` varchar(10) NOT NULL COMMENT '题目类型',
  `SingleChoice` json COMMENT '单选选项',
  `MultipleChoice` json COMMENT '多选选项',
  `FillBlankQuantity` int COMMENT '填空数量',
  `SingleChoiceAnswer` char(1) COMMENT '单选答案',
  `MulitipleChoiceAnswer` json COMMENT '多选答案',
  `JudgeAnswer` tinyint(1) COMMENT '判断答案',
  `FillBlankAnswer` json COMMENT '填空答案',
  `Analysis` varchar(500) COMMENT '解析',
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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `UserName` varchar(10) NOT NULL,
  `UserPassword` varchar(20) NOT NULL,
  `UserAvatar` varchar(500) NOT NULL,
  `UserPhone` varchar(20) NOT NULL,
  `UserClass` varchar(10) NOT NULL,
  `UserStudyTime` json NOT NULL,
  `UserActivity` json NOT NULL,
  `UserScore` double NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='用户';
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

# 所有多对多的表
# 1，大课程对用户
DROP TABLE IF EXISTS `bigcourse_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bigcourse_user` (
                                  `CourseID` int NOT NULL COMMENT '课程ID',
                                  `UserID` int NOT NULL COMMENT '用户ID',
                                  CONSTRAINT `bigcourse_FK` FOREIGN KEY (`CourseID`) REFERENCES `bigcourse`(`CourseID`),
                                  CONSTRAINT `user_FK` FOREIGN KEY (`UserID`) REFERENCES `user`(`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

# 2，视频课程对用户
DROP TABLE IF EXISTS `videocourse_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videocourse_user` (
                                  `VideoCourseID` int NOT NULL COMMENT '课程ID',
                                  `UserID` int NOT NULL COMMENT '用户ID',
                                  `ViewingState` int COMMENT '观看时长',
                                  CONSTRAINT `videocourse_FK` FOREIGN KEY (`VideoCourseID`) REFERENCES `videocourse`(`VideoCourseID`),
                                  CONSTRAINT `user_FK` FOREIGN KEY (`UserID`) REFERENCES `user`(`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

# 3,知识点与视频课程的对应
DROP TABLE IF EXISTS `videocourse_knowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `videocourse_knowledge` (
                                    `VideoCourseID` int NOT NULL COMMENT '课程ID',
                                    `KnowledgeID` int NOT NULL COMMENT '知识点ID',
                                    CONSTRAINT `videocourse_FK` FOREIGN KEY (`VideoCourseID`) REFERENCES `videocourse`(`VideoCourseID`),
                                    CONSTRAINT `knowledge_FK` FOREIGN KEY (`KnowledgeID`) REFERENCES `knowledge`(`KnowledgeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

# 4,知识点与试题的对应
DROP TABLE IF EXISTS `question_knowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_knowledge` (
                                         `TestQuestionID` int NOT NULL COMMENT '试题ID',
                                         `KnowledgeID` int NOT NULL COMMENT '知识点ID',
                                         CONSTRAINT `testquestion_FK` FOREIGN KEY (`TestQuestionID`) REFERENCES `testquestion`(`TestQuestionID`),
                                         CONSTRAINT `knowledge_FK` FOREIGN KEY (`KnowledgeID`) REFERENCES `knowledge`(`KnowledgeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

# 5,试题与试卷对应
DROP TABLE IF EXISTS `question_testpaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_testpaper` (
                                      `TestQuestionID` int NOT NULL COMMENT '试卷ID',
                                      `TestPaperID` int NOT NULL COMMENT '知识点ID',
                                      `Score` int NOT NULL COMMENT '试题分数',
                                      `SortNum` int NOT NULL COMMENT '试题序号',
                                      CONSTRAINT `testquestion_FK` FOREIGN KEY (`TestQuestionID`) REFERENCES `testquestion`(`TestQuestionID`),
                                      CONSTRAINT `testpaper_FK` FOREIGN KEY (`TestPaperID`) REFERENCES `testpaper`(`TestPaperID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

# 6,考试记录与试题的对应
DROP TABLE IF EXISTS `testrecord_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testrecord_question` (
                                      `TestQuestionID` int NOT NULL COMMENT '试题ID',
                                      `TestRecordID` int NOT NULL COMMENT '记录ID',
                                      `Score` int NOT NULL COMMENT '试题分数',
                                      `SortNum` int NOT NULL COMMENT '试题序号',
                                      `UserAnswer` json COMMENT '用户答案',
                                      `IsCorrect` bool COMMENT '正确情况',
                                      CONSTRAINT `testquestion_FK` FOREIGN KEY (`TestQuestionID`) REFERENCES `testquestion`(`TestQuestionID`),
                                      CONSTRAINT `testrecord_FK` FOREIGN KEY (`TestRecordID`) REFERENCES `testrecord`(`TsetRecordID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

# 7,考试分析和知识点的对应
DROP TABLE IF EXISTS `testanalyse_knowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testanalyse_knowledge` (
                                       `TestAnalyseID` int NOT NULL COMMENT '考试分析ID',
                                       `KnowledgeID` int NOT NULL COMMENT '知识点ID',
                                       `ContainKnowledgeNum` int NOT NULL COMMENT '试卷中包含知识点个数',
                                       `CorrectKnowledgeNum` int NOT NULL COMMENT '正确知识点个数',
#                                        `MasteryDegree` float NOT NULL COMMENT '知识点掌握程度',
                                       CONSTRAINT `testanalyse_FK` FOREIGN KEY (`TestAnalyseID`) REFERENCES `testanalyse`(`TestAnalyseID`),
                                       CONSTRAINT `knowledgeID_FK` FOREIGN KEY (`KnowledgeID`) REFERENCES `knowledge`(`KnowledgeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-14 14:42:37
