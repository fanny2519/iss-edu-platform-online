/*
 Navicat Premium Data Transfer

 Source Server         : bpit
 Source Server Type    : MySQL
 Source Server Version : 50041
 Source Host           : localhost:3306
 Source Schema         : edu

 Target Server Type    : MySQL
 Target Server Version : 50041
 File Encoding         : 65001

 Date: 21/07/2022 21:10:24
*/


SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for appraise
-- ----------------------------
DROP TABLE IF EXISTS `appraise`;
CREATE TABLE `appraise`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容',
  `user_id` int(11) DEFAULT NULL COMMENT '评论者',
  `course_id` int(11) DEFAULT NULL COMMENT '所属课程',
  `create_time` datetime DEFAULT NULL COMMENT '发表时间',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY USING BTREE (`id`),
  INDEX `fk_appraise_course` USING BTREE(`course_id`),
  INDEX `fk_appraise_user` USING BTREE(`user_id`),
  CONSTRAINT `fk_appraise_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_appraise_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程评价表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for catalogue
-- ----------------------------
DROP TABLE IF EXISTS `catalogue`;
CREATE TABLE `catalogue`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `pid` int(11) DEFAULT NULL COMMENT '父级目录ID',
  `name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '目录名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `course_id` int(11) DEFAULT NULL COMMENT '所属课程',
  `material_id` int(11) DEFAULT NULL COMMENT '对应课程资源',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY USING BTREE (`id`),
  INDEX `fk_catalogue_course` USING BTREE(`course_id`),
  INDEX `fk_material` USING BTREE(`material_id`),
  CONSTRAINT `fk_catalogue_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_material` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程目录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of catalogue
-- ----------------------------
INSERT INTO `catalogue` VALUES (1, 0, '第一章、Spring 概述', 1, NULL, 2, NULL, '2022-03-02 11:41:18');
INSERT INTO `catalogue` VALUES (2, 1, '1.Spring 的含义', 1, NULL, 2, 1, '2022-03-02 11:42:59');
INSERT INTO `catalogue` VALUES (3, 1, '2. Spring 和 Spring Framework 的历史', 2, NULL, 2, NULL, '2022-03-02 11:43:17');
INSERT INTO `catalogue` VALUES (4, 1, '3. 设计理念与优势作用', 3, NULL, 2, NULL, '2022-03-02 11:43:52');
INSERT INTO `catalogue` VALUES (5, 0, '第二章、Spring 入门', 2, NULL, 2, NULL, '2022-03-02 11:44:37');
INSERT INTO `catalogue` VALUES (6, 5, '1. 安装部署', 1, NULL, 2, NULL, '2022-03-02 11:45:19');
INSERT INTO `catalogue` VALUES (7, 5, '2. 系统架构', 2, NULL, 2, NULL, '2022-03-02 11:45:54');
INSERT INTO `catalogue` VALUES (8, 5, '3. Hello Spring', 3, NULL, 2, NULL, '2022-03-02 11:45:54');
INSERT INTO `catalogue` VALUES (9, 0, '第三章、IoC 容器', 3, NULL, 2, NULL, '2022-03-02 11:46:51');
INSERT INTO `catalogue` VALUES (10, 9, '1. Spring IoC 容器和 Beans 简介', 1, NULL, 2, NULL, '2022-03-02 11:46:51');
INSERT INTO `catalogue` VALUES (11, 9, '2. 容器概述', 2, NULL, 2, NULL, '2022-03-02 11:47:31');
INSERT INTO `catalogue` VALUES (12, 11, '2.1 配置元数据', 1, NULL, 2, NULL, '2022-03-02 11:47:55');
INSERT INTO `catalogue` VALUES (13, 11, '2.2 实例化容器', 2, NULL, 2, NULL, '2022-03-02 11:49:05');
INSERT INTO `catalogue` VALUES (14, 11, '2.3 使用容器', 3, NULL, 2, NULL, '2022-03-02 11:49:05');
INSERT INTO `catalogue` VALUES (15, 9, '3. Bean 概述', 3, NULL, 2, NULL, '2022-03-02 11:49:05');
INSERT INTO `catalogue` VALUES (16, 15, '3.1 Naming Beans', 1, NULL, 2, NULL, '2022-03-02 11:49:47');
INSERT INTO `catalogue` VALUES (17, 15, '3.2 Instantiating Beans', 2, NULL, 2, NULL, '2022-03-02 11:49:47');
INSERT INTO `catalogue` VALUES (18, 9, '4. Dependencies', 4, NULL, 2, NULL, '2022-03-02 11:50:24');
INSERT INTO `catalogue` VALUES (19, 18, '4.1 Dependency Injection', 1, NULL, 2, NULL, '2022-03-02 11:51:54');
INSERT INTO `catalogue` VALUES (20, 18, '4.2 Dependencies and Configuration in Detail', 2, NULL, 2, NULL, '2022-03-02 11:51:54');
INSERT INTO `catalogue` VALUES (21, 18, '4.3 Using depends-on', 3, NULL, 2, NULL, '2022-03-02 11:51:54');
INSERT INTO `catalogue` VALUES (22, 18, '4.4 Lazy-initialized Beans', 4, NULL, 2, NULL, '2022-03-02 11:51:54');
INSERT INTO `catalogue` VALUES (23, 18, '4.5 Autowiring Collaborators', 5, NULL, 2, NULL, '2022-03-02 11:51:54');
INSERT INTO `catalogue` VALUES (24, 9, '5. Bean Scopes', 5, NULL, 2, NULL, '2022-03-02 11:52:18');
INSERT INTO `catalogue` VALUES (25, 24, '5.1 The Singleton Scope', 1, NULL, 2, NULL, '2022-03-02 11:52:45');
INSERT INTO `catalogue` VALUES (26, 24, '5.2 The Prototype Scope', 2, NULL, 2, NULL, '2022-03-02 11:52:45');
INSERT INTO `catalogue` VALUES (27, 0, '第四章、Aspect Oriented Programming', 4, NULL, 2, NULL, '2022-03-02 11:53:30');
INSERT INTO `catalogue` VALUES (28, 27, '1. AOP 概念', 1, NULL, 2, NULL, '2022-03-02 11:53:30');
INSERT INTO `catalogue` VALUES (29, 27, '2. AOP Proxies 代理模式', 2, NULL, 2, NULL, '2022-03-02 11:54:52');
INSERT INTO `catalogue` VALUES (30, 27, '3. Annotation-based AOP Support', 3, NULL, 2, NULL, '2022-03-02 11:54:52');
INSERT INTO `catalogue` VALUES (31, 27, '4. Schema-based AOP Support', 4, NULL, 2, NULL, '2022-03-02 11:54:52');
INSERT INTO `catalogue` VALUES (69, 0, '第五章、Spring JDBC 详解', 5, NULL, 2, NULL, '2022-03-02 17:11:35');
INSERT INTO `catalogue` VALUES (70, 0, '第六章、Transaction management', 6, NULL, 2, NULL, '2022-03-02 17:11:43');
INSERT INTO `catalogue` VALUES (71, 0, '第七章、Spring Web MVC', 7, NULL, 2, NULL, '2022-03-02 17:11:57');
INSERT INTO `catalogue` VALUES (72, 71, '7.1 Hello Spring Web MVC', 1, NULL, 2, NULL, '2022-03-02 17:12:06');
INSERT INTO `catalogue` VALUES (73, 71, '7.2 Annotation-based', 2, NULL, 2, NULL, '2022-03-02 17:12:15');
INSERT INTO `catalogue` VALUES (74, 73, '7.2.1 @Contoller', 1, NULL, 2, NULL, '2022-03-02 17:12:34');
INSERT INTO `catalogue` VALUES (76, 0, '第一章    变量、常量、关键字', 1, NULL, 1, NULL, '2022-03-02 17:45:49');
INSERT INTO `catalogue` VALUES (77, 0, '第二章   基本数据类型', 2, NULL, 1, NULL, '2022-03-02 17:46:10');
INSERT INTO `catalogue` VALUES (78, 77, 'int', 1, NULL, 1, NULL, '2022-03-02 17:46:15');
INSERT INTO `catalogue` VALUES (79, 77, 'long', 2, NULL, 1, NULL, '2022-03-02 17:46:23');
INSERT INTO `catalogue` VALUES (80, 77, 'double', 3, NULL, 1, NULL, '2022-03-02 17:46:29');
INSERT INTO `catalogue` VALUES (81, 0, '1.java概述', 1, NULL, 60, NULL, '2022-07-10 11:53:56');
INSERT INTO `catalogue` VALUES (82, 0, '2.java实训案例', 2, NULL, 60, NULL, '2022-07-10 11:54:36');
INSERT INTO `catalogue` VALUES (83, 0, 'java的基本特征', 3, NULL, 1, NULL, '2022-07-20 23:52:22');
INSERT INTO `catalogue` VALUES (84, 0, '1232', 4, NULL, 1, NULL, '2022-07-20 23:52:47');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '班级名称',
  `is_private` int(11) DEFAULT 0,
  `signature` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '简介',
  `cover` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '封面',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_active` int(11) DEFAULT 1 COMMENT '是否活动，用于标识数据逻辑删除 >> 0：已删除  1：未删除',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '班级表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (1, 'Java 高薪进阶班', 0, '557项技术点+11大核心技术模块+8个案例实战+2次阶段测试', 'class1.jpg', '2022-02-17 13:35:28', '2022-03-14 11:46:46', 1, '2022-02-17 13:35:34');
INSERT INTO `class` VALUES (2, 'C/C++ 嵌入式培训班', 0, '嵌入式就业前景广阔,保险行业、医疗行业、金融行业、车载导航、智能农业等多种行业均可用到它！正因如此，市场对嵌入式方向的人员需求逐渐增多，薪资也是水涨船高，尤其是嵌入式工程师。', 'class2.jpg', '2022-02-17 13:35:28', '2022-03-14 11:48:52', 1, '2022-02-17 13:38:42');
INSERT INTO `class` VALUES (3, 'Vue.js 内训班', 0, '软通校招系统是一款试题管理系统，学员通过该项目可学习Element-UI功能组件、ECharts数据可视化、axios、JWT、Vue CLI、Vuex全局数据共享、Vue Router 等多个技术解决方案。', 'class3.jpg', '2022-02-17 13:35:28', '2022-03-14 14:22:50', 1, '2022-02-17 13:38:42');
INSERT INTO `class` VALUES (4, 'Python 初级班', 0, '大厂级前沿技术，覆盖一线企业所需核心技术栈，80+技术解决方案，覆盖职场常见技术难题，遵循大厂开发标准流程，涵盖500+核心技能点，真场景实战项目，整合电商/金融/通信/零售等行业项目', 'class4.jpg', '2022-03-14 14:25:05', '2022-03-14 14:41:36', 1, '2022-03-14 14:25:05');
INSERT INTO `class` VALUES (5, '测试班级', 0, 'TestTestTestTestTest', 'class4.jpg', '2022-03-15 10:17:18', '2022-03-15 10:17:18', 1, '2022-03-15 10:17:18');
INSERT INTO `class` VALUES (6, '大数据训练班1', 0, '猛男训练班，弱夫的救星！', 'class4.jpg', '2022-03-21 11:45:17', '2022-07-10 23:31:51', 1, '2022-03-21 11:45:17');
INSERT INTO `class` VALUES (7, '大数据训练班2', 0, '猛男训练班，弱夫的救星！', 'class4.jpg', '2022-03-21 11:45:17', '2022-03-21 11:45:17', 1, '2022-03-21 11:45:17');
INSERT INTO `class` VALUES (8, '大数据训练班3', 0, '猛男训练班，弱夫的救星！', 'class4.jpg', '2022-03-21 11:45:17', '2022-03-21 11:45:17', 1, '2022-03-21 11:45:17');
INSERT INTO `class` VALUES (9, '大数据训练班4', 0, '猛男训练班，弱夫的救星！', 'class4.jpg', '2022-03-21 11:45:17', '2022-03-21 11:45:17', 1, '2022-03-21 11:45:17');
INSERT INTO `class` VALUES (10, '大数据训练班5', 0, '猛男训练班，弱夫的救星！', 'class4.jpg', '2022-03-21 11:45:17', '2022-03-21 11:45:17', 1, '2022-03-21 11:45:17');
INSERT INTO `class` VALUES (68, '大数据训练班6', 0, '猛男训练班，弱夫的救星！', 'class4.jpg', '2022-03-21 11:45:17', '2022-03-21 11:45:17', 1, '2022-03-21 11:45:17');
INSERT INTO `class` VALUES (69, '', 0, '', NULL, '2022-07-10 23:21:22', '2022-07-10 23:21:22', 1, '2022-07-10 23:21:22');

-- ----------------------------
-- Table structure for class_course
-- ----------------------------
DROP TABLE IF EXISTS `class_course`;
CREATE TABLE `class_course`  (
  `class_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  UNIQUE INDEX `pk_classes_course` USING BTREE(`class_id`, `course_id`),
  INDEX `fk_course` USING BTREE(`course_id`),
  CONSTRAINT `fk_class` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '班级_课程_中间表;' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of class_course
-- ----------------------------
INSERT INTO `class_course` VALUES (1, 1);
INSERT INTO `class_course` VALUES (1, 3);
INSERT INTO `class_course` VALUES (1, 5);
INSERT INTO `class_course` VALUES (2, 1);
INSERT INTO `class_course` VALUES (2, 2);
INSERT INTO `class_course` VALUES (2, 3);
INSERT INTO `class_course` VALUES (2, 4);
INSERT INTO `class_course` VALUES (2, 5);
INSERT INTO `class_course` VALUES (4, 1);
INSERT INTO `class_course` VALUES (4, 3);
INSERT INTO `class_course` VALUES (4, 5);

-- ----------------------------
-- Table structure for class_plan
-- ----------------------------
DROP TABLE IF EXISTS `class_plan`;
CREATE TABLE `class_plan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) DEFAULT NULL,
  `context` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `last_update` timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY USING BTREE (`id`),
  INDEX `fk_class_plan` USING BTREE(`class_id`),
  CONSTRAINT `fk_class_plan` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '班级计划表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of class_plan
-- ----------------------------
INSERT INTO `class_plan` VALUES (1, 1, '测试计划1.1', '2022-04-07 12:02:00');
INSERT INTO `class_plan` VALUES (2, 1, '测试计划1.2', '2022-04-07 12:02:00');
INSERT INTO `class_plan` VALUES (3, 1, '测试计划1.3', '2022-04-07 12:02:00');
INSERT INTO `class_plan` VALUES (4, 1, '测试计划1.4', '2022-04-07 12:02:00');
INSERT INTO `class_plan` VALUES (5, 1, '测试计划2', '2022-04-08 00:00:00');
INSERT INTO `class_plan` VALUES (6, 1, '测试计划3', '2022-04-09 00:00:00');
INSERT INTO `class_plan` VALUES (7, 1, '测试计划4', '2022-04-10 00:00:00');
INSERT INTO `class_plan` VALUES (9, 2, 'date_format(last_update, \'%Y/%m/%d\')', '2022-04-07 13:51:32');
INSERT INTO `class_plan` VALUES (40, 5, 'plan a', '2022-04-30 16:00:00');
INSERT INTO `class_plan` VALUES (41, 5, 'plan b', '2022-04-30 16:00:00');
INSERT INTO `class_plan` VALUES (42, 5, 'ddd', '2022-05-19 16:00:00');
INSERT INTO `class_plan` VALUES (43, 5, 'dadada', '2022-05-19 16:00:00');
INSERT INTO `class_plan` VALUES (44, 5, 'ddddd', '2022-05-11 16:00:00');
INSERT INTO `class_plan` VALUES (45, 5, 'fffffff', '2022-05-11 16:00:00');
INSERT INTO `class_plan` VALUES (46, 6, 'aaa', '2022-05-25 16:00:00');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '课程名称',
  `user` int(11) DEFAULT NULL COMMENT '授课老师',
  `introduction` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '课程介绍',
  `class_hour` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0',
  `is_private` int(11) DEFAULT 0,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `cover` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '封面',
  `is_active` int(11) DEFAULT 1 COMMENT '是否活动，用于标识数据逻辑删除 >> 0：已删除  1：未删除',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `types` int(11) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`),
  INDEX `fk_course_user` USING BTREE(`user`),
  CONSTRAINT `fk_course_user` FOREIGN KEY (`user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 'Java 从入门到精通', 1, '《Java从入门到精通（第6版）》从初学者角度出发，通过通俗易懂的语言、丰富多彩的实例，详细讲解了使用Java语言进行程序开发需要掌握的知识。全书分为23章，内容包括初识Java，熟悉Eclipse开发工具，Java语言基础，流程控制，数组，类和对象，继承、多态、抽象类与接口，包和内部类，异常处理，字符串，常用类库，集合类，枚举类型与泛型，lambda表达式与流处理，I/O（输入/输出），反射与注释，数据库操作，Swing程序设计，Java绘图，多线程，网络通信，奔跑吧小恐龙，MR人脸识别打卡系统。书中所有知识都结合具体实例进行讲解，涉及的程序代码都给出了详细的注释，可以使读者轻松领会Java程序开发的精髓，快速提高开发技能。', '48', 0, '2022-02-21 15:01:39', '2022-07-18 22:54:37', 'kecheng1.jpg', 1, '2022-02-21 15:02:02', NULL);
INSERT INTO `course` VALUES (2, 'Spring Boot 编程思想', 5, '《Spring Boot 编程思想（核心篇）》是《Spring Boot 编程思想》的核心篇，开篇总览Spring Boot核心特性，接着讨论自动装配（Auto-Configuration）与SpringApplication。全书的讨论以Spring Boot为中心，议题发散至Spring技术栈、JSR及Java。希望透过全局的视角，帮助读者了解Spring Boot变迁的历程；经过多方的比较，帮助读者理解Spring Boot特性的原理；整合标准的规范，帮助读者掌握Spring Boot设计的哲学。', '64', 0, '2022-02-21 15:02:51', '2022-07-10 23:33:35', 'kecheng2.jpg', 1, '2022-02-21 15:03:03', NULL);
INSERT INTO `course` VALUES (3, 'Spring Cloud 微服务实战', 2, '《Spring Cloud 微服务实战》从时下流行的微服务架构概念出发，详细介绍了Spring Cloud针对微服务架构中几大核心要素的解决方案和基础组件。对于各个组件的介绍，《Spring Cloud微服务实战》主要以示例与源码结合的方式来帮助读者更好地理解这些组件的使用方法以及运行原理。同时，在介绍的过程中，还包含了作者在实践中所遇到的一些问题和解决思路，可供读者在实践中作为参考。', '120', 0, '2022-02-21 15:05:55', '2022-02-21 15:05:57', 'kecheng3.jpg', 1, '2022-02-21 15:04:43', NULL);
INSERT INTO `course` VALUES (4, '深入浅出 Vue.js', 3, '本书从源码层面分析了Vue.js。首先，简要介绍了Vue.js；然后详细讲解了其内部核心技术“变化侦测”，这里带领大家从0到1实现一个简单的“变化侦测”系统；接着详细介绍了虚拟DOM技术，其中包括虚拟DOM的原理及其patching算法；紧接着详细讨论了模板编译技术，其中包括模板解析器的实现原理、优化器的原理以及代码生成器的原理；最后详细介绍了其整体架构以及提供给我们使用的各种API的内部原理，同时还介绍了生命周期、错误处理、指令系统与模板过滤器等功能的原理。', '24', 0, '2022-02-21 15:21:52', '2022-07-10 23:33:13', 'kecheng4.jpg', 1, '2022-02-21 15:22:03', NULL);
INSERT INTO `course` VALUES (5, 'Python 机器学习', 4, '《Python机器学习》通过解释数学原理和展示编程示例对机器学习进行了系统、全面的解析。《Python机器学习》共分为12章，内容涵盖了机器学习以及Python语言的基础知识、特征工程的概念与操作技术、数据可视化技术的实现、监督学习及无监督学习算法、文本分析、神经网络和深度学习、推荐系统的构建方法以及预测处理时间序列的方法等。阅读《Python机器学习》能够加深读者对机器学习的认识和理解，从而达到理论与实践相结合、学以致用的目的。《Python机器学习》适合Python程序员、数据分析人员、对机器学习感兴趣的读者以及机器学习领域的从业人员阅读。', '40', 0, '2022-03-16 17:19:47', '2022-03-16 17:19:47', 'kecheng5.jpg', 1, '2022-03-16 17:19:47', NULL);
INSERT INTO `course` VALUES (6, 'C/C++ 嵌入式编程', 8, '《C/C++嵌入式系统编程》是由国外作者巴耳(Barr) 编写的讲解嵌入式系统编程的书。本书内容包括：快速有效的测试存储器芯片，如何写入和擦除快闪存储器，设计和实现设备驱动，优化嵌入式软件等。', '72', 0, '2022-03-16 17:19:47', '2022-03-16 17:19:47', 'kecheng6.jpg', 1, '2022-03-16 17:19:47', NULL);
INSERT INTO `course` VALUES (7, '测试课程1', 1, '测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程', '32', 0, '2022-03-16 17:19:47', '2022-03-16 17:19:47', 'kecheng7.jpg', 1, '2022-03-16 17:19:47', NULL);
INSERT INTO `course` VALUES (8, '测试课程2', 1, '测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程', '64', 0, '2022-03-16 17:19:47', '2022-03-16 17:19:47', 'kecheng8.jpg', 1, '2022-03-16 17:19:47', NULL);
INSERT INTO `course` VALUES (9, '测试课程3', 1, '测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程', '100', 0, '2022-03-16 17:19:47', '2022-03-16 17:19:47', 'kecheng9.jpg', 1, '2022-03-16 17:19:47', NULL);
INSERT INTO `course` VALUES (10, '测试课程4', 1, '测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程测试课程', '16', 0, '2022-03-16 17:19:47', '2022-03-16 17:19:47', 'kecheng10.jpg', 1, '2022-03-16 17:19:47', NULL);
INSERT INTO `course` VALUES (11, '小熊到处跑', 1, '大家好，我是来自软通大学产品研发中心的实习生熊佳晨，熊猫的熊，北方有佳人的佳，早晨的晨，大家可以叫我小熊。现担任icolloge的前端研发，本人性别女爱好男，性格开朗活泼，唱歌跑调，喜欢打本和跑团，平常也喜欢画画', '8', 0, '2022-04-18 11:04:33', '2022-04-18 11:04:33', 'kecheng11.jpg', 1, '2022-04-18 11:04:33', NULL);
INSERT INTO `course` VALUES (59, '数据采集', 24, '', '32', 0, '2022-06-17 23:56:19', '2022-06-17 23:56:32', NULL, 1, '2022-06-17 23:56:19', NULL);
INSERT INTO `course` VALUES (60, '疯狂Java实战演绎', 24, '', '32', 0, '2022-07-10 11:51:52', '2022-07-10 11:51:52', NULL, 1, '2022-07-10 11:51:52', NULL);
INSERT INTO `course` VALUES (61, 'aaa', 24, '121', '12', 0, '2022-07-17 19:10:31', '2022-07-17 19:10:31', NULL, 1, '2022-07-17 19:10:31', NULL);
INSERT INTO `course` VALUES (62, '23423', 22, '', '21', 0, '2022-07-18 11:18:08', '2022-07-18 22:55:49', '1658114266965.jpg', 1, '2022-07-18 11:18:08', NULL);

-- ----------------------------
-- Table structure for course_score
-- ----------------------------
DROP TABLE IF EXISTS `course_score`;
CREATE TABLE `course_score`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `score` float DEFAULT NULL COMMENT '评分分值',
  `course_id` int(11) NOT NULL  COMMENT '对应课程',
  `user_id` int(11) NOT NULL  COMMENT '评分人',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY USING BTREE (`id`),
  INDEX `fk_course_score` USING BTREE(`course_id`),
  INDEX `fk_user_score` USING BTREE(`user_id`),
  CONSTRAINT `fk_course_score` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_user_score` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程评分表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of course_score
-- ----------------------------
INSERT INTO `course_score` VALUES (1, 5, 1, 1, '2022-05-10 16:27:19');
INSERT INTO `course_score` VALUES (2, 5, 1, 1, '2022-05-10 16:31:00');
INSERT INTO `course_score` VALUES (3, 5, 1, 1, '2022-05-10 16:31:00');
INSERT INTO `course_score` VALUES (4, 4.5, 2, 1, '2022-05-10 16:31:00');
INSERT INTO `course_score` VALUES (5, 5, 2, 1, '2022-05-10 16:31:00');
INSERT INTO `course_score` VALUES (6, 5, 2, 1, '2022-05-10 16:31:00');
INSERT INTO `course_score` VALUES (7, 3.2, 3, 1, '2022-05-10 16:31:00');
INSERT INTO `course_score` VALUES (8, 5, 3, 1, '2022-05-10 16:31:00');
INSERT INTO `course_score` VALUES (9, 4.5, 3, 1, '2022-05-10 16:31:00');
INSERT INTO `course_score` VALUES (10, 2.5, 4, 1, '2022-05-10 16:31:00');
INSERT INTO `course_score` VALUES (11, 2.5, 4, 1, '2022-05-10 16:31:00');
INSERT INTO `course_score` VALUES (12, 5, 4, 1, '2022-05-10 16:31:00');
INSERT INTO `course_score` VALUES (13, 4, 5, 1, '2022-05-10 16:31:00');
INSERT INTO `course_score` VALUES (14, 5, 5, 1, '2022-05-10 16:31:00');
INSERT INTO `course_score` VALUES (15, 5, 5, 1, '2022-05-10 16:31:00');
INSERT INTO `course_score` VALUES (16, 2, 6, 1, '2022-05-10 16:31:00');
INSERT INTO `course_score` VALUES (17, 3, 6, 1, '2022-05-10 16:31:00');
INSERT INTO `course_score` VALUES (18, 4, 6, 1, '2022-05-10 16:31:00');
INSERT INTO `course_score` VALUES (19, 5, 4, 1, '2022-05-10 16:31:00');
INSERT INTO `course_score` VALUES (20, 1.5, 3, 1, '2022-05-10 16:31:00');
INSERT INTO `course_score` VALUES (21, 4.5, 2, 1, '2022-05-10 16:31:00');

-- ----------------------------
-- Table structure for learning
-- ----------------------------
DROP TABLE IF EXISTS `learning`;
CREATE TABLE `learning`  (
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  UNIQUE INDEX `learning_pk` USING BTREE(`student_id`, `course_id`)
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'InnoDB free: 727040 kB' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of learning
-- ----------------------------
INSERT INTO `learning` VALUES (1, 1);
INSERT INTO `learning` VALUES (1, 2);
INSERT INTO `learning` VALUES (1, 3);
INSERT INTO `learning` VALUES (1, 4);
INSERT INTO `learning` VALUES (3, 1);
INSERT INTO `learning` VALUES (5, 1);
INSERT INTO `learning` VALUES (2002, 2);

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '资料名称',
  `course_id` int(11) DEFAULT NULL COMMENT '所属课程',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '文件路径',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY USING BTREE (`id`),
  INDEX `fk_material_course` USING BTREE(`course_id`),
  CONSTRAINT `fk_material_course` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '课程资料;' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES (1, 'eduisoftstone.mp4', 2, 'eduisoftstone.mp4', '2022-03-16 17:19:47', '2022-03-16 17:19:47', '2022-03-16 17:19:47');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '题干',
  `type` int(11) NOT NULL  COMMENT '题型	1:单选、2：多选、3：判断、4：问答',
  `source` int(11) NOT NULL DEFAULT 1 COMMENT '题目来源  1:原创、2：第三方',
  `answer` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '答案',
  `question_bank` int(11) DEFAULT NULL COMMENT '所属题库',
  `classification` int(11) DEFAULT NULL COMMENT '题目分类',
  `last_update` timestamp DEFAULT CURRENT_TIMESTAMP,
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '系统管理员',
  `hard_level` int(11) NOT NULL DEFAULT 1 COMMENT '难度',
  PRIMARY KEY USING BTREE (`id`),
  INDEX `fk_question_bank` USING BTREE(`question_bank`),
  CONSTRAINT `fk_question_bank` FOREIGN KEY (`question_bank`) REFERENCES `question_bank` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '问题表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for question_bank
-- ----------------------------
DROP TABLE IF EXISTS `question_bank`;
CREATE TABLE `question_bank`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '题库名称',
  `signature` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '题库简介',
  `is_active` int(11) DEFAULT 1 COMMENT '是否活动，用于标识数据逻辑删除',
  `last_update` timestamp DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '题库表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of question_bank
-- ----------------------------
INSERT INTO `question_bank` VALUES (3, '测试题库1', '用于测试题库管理的测试数据', 1, '2022-04-12 09:18:57');
INSERT INTO `question_bank` VALUES (4, '测试题库2', '用于测试题库管理的测试数据', 1, '2022-04-12 09:18:57');
INSERT INTO `question_bank` VALUES (5, '测试题库3', '用于测试题库管理的测试数据', 1, '2022-04-12 09:18:57');
INSERT INTO `question_bank` VALUES (6, '测试题库4', '用于测试题库管理的测试数据', 1, '2022-04-12 09:18:57');
INSERT INTO `question_bank` VALUES (7, '测试题库5', '用于测试题库管理的测试数据', 1, '2022-04-12 09:18:57');
INSERT INTO `question_bank` VALUES (8, '测试题库6', '用于测试题库管理的测试数据', 1, '2022-04-12 09:18:57');
INSERT INTO `question_bank` VALUES (9, '测试题库7', '用于测试题库管理的测试数据', 1, '2022-04-12 09:18:57');
INSERT INTO `question_bank` VALUES (10, '测试题库8', '用于测试题库管理的测试数据', 1, '2022-04-12 09:18:57');
INSERT INTO `question_bank` VALUES (11, '测试题库9', '用于测试题库管理的测试数据', 1, '2022-04-12 09:18:57');
INSERT INTO `question_bank` VALUES (12, '测试题库10', '用于测试题库管理的测试数据', 1, '2022-04-12 09:18:57');
INSERT INTO `question_bank` VALUES (13, '测试题录11', '水水水水水', 1, '2022-05-26 16:30:57');

-- ----------------------------
-- Table structure for question_options
-- ----------------------------
DROP TABLE IF EXISTS `question_options`;
CREATE TABLE `question_options`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `label` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `value` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`id`),
  INDEX `fk_question` USING BTREE(`question_id`),
  CONSTRAINT `fk_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '题目选项;' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (0, 'Administrator', '2022-01-07 14:23:41');
INSERT INTO `role` VALUES (1, 'Student', '2022-01-07 14:23:41');
INSERT INTO `role` VALUES (2, 'Teacher', '2022-01-07 14:23:41');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk_id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `stu_number` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '学号',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `qq_number` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'QQ号',
  `identity_card` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '身份证',
  `photo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '照骗',
  `signature` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '未设置' COMMENT '个性签名',
  `introduction` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '这个人很懒，没留下任何东西...' COMMENT '个人简介',
  `is_active` int(11) DEFAULT 1 COMMENT '是否活动，用于标识数据逻辑删除',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY USING BTREE (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2004 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '学生信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 'zz', 'luffy', 'z', 'ZZ-2022-9527', 0, '13971397916', 'luffy@onepiece.com', '121727838', '420xxxxxxxxxxxx123', 'zz.jpg', '我是要成为海贼王的男人!!', '路飞性格积极乐观，爱憎分明，宁死不屈，十分重视伙伴与朋友，对任何危险的事物都超感兴趣。和其他传统的海贼所不同的是，他并不会为了追求财富而杀戮，而是享受着身为海贼的冒险和自由。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (2, 'test1', '测试用户1', '1', 'ISS2022067760', 1, '17827233729', 'test1@isoftstone.com', '15108751143', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (3, 'test2', '测试用户2', '1', 'ISS2022313552', 0, '13867064752', 'test2@isoftstone.com', '17674854310', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (4, 'test3', '测试用户3', '1', 'ISS2022323182', 1, '18141531698', 'test3@isoftstone.com', '15606675482', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (5, 'test4', '测试用户4', '1', 'ISS2022483873', 0, '15660099167', 'test4@isoftstone.com', '14716952767', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (6, 'test5', '测试用户5', '1', 'ISS2022454727', 1, '17801175868', 'test5@isoftstone.com', '18922041046', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (7, 'test6', '测试用户6', '1', 'ISS2022204061', 0, '17677958227', 'test6@isoftstone.com', '19960527842', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (8, 'test7', '测试用户7', '1', 'ISS2022825036', 1, '17359076280', 'test7@isoftstone.com', '13365507405', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (9, 'test8', '测试用户8', '1', 'ISS2022513137', 0, '13451488885', 'test8@isoftstone.com', '18782020125', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (10, 'test9', '测试用户9', '1', 'ISS2022487473', 1, '13342890908', 'test9@isoftstone.com', '18545283501', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (11, 'test10', '测试用户10', '1', 'ISS2022380855', 0, '17639024595', 'test10@isoftstone.com', '13177344626', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (12, 'test11', '测试用户11', '1', 'ISS2022528581', 1, '15374053584', 'test11@isoftstone.com', '18470408344', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (13, 'test12', '测试用户12', '1', 'ISS2022130657', 0, '14946766538', 'test12@isoftstone.com', '19901548377', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (14, 'test13', '测试用户13', '1', 'ISS2022722380', 1, '17217347486', 'test13@isoftstone.com', '13347440363', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (15, 'test14', '测试用户14', '1', 'ISS2022678310', 0, '16675741999', 'test14@isoftstone.com', '15670725190', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (16, 'test15', '测试用户15', '1', 'ISS2022680870', 1, '15880597799', 'test15@isoftstone.com', '18534977723', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (17, 'test16', '测试用户16', '1', 'ISS2022780504', 0, '15136684493', 'test16@isoftstone.com', '19937619720', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (18, 'test17', '测试用户17', '1', 'ISS2022270584', 1, '17514195185', 'test17@isoftstone.com', '18697321255', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (19, 'test18', '测试用户18', '1', 'ISS2022147638', 0, '17291691252', 'test18@isoftstone.com', '15973641527', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (20, 'test19', '测试用户19', '1', 'ISS2022417637', 1, '14545539066', 'test19@isoftstone.com', '14501325704', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (21, 'test20', '测试用户20', '1', 'ISS2022324542', 0, '18729942816', 'test20@isoftstone.com', '18650025634', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (22, 'test21', '测试用户21', '1', 'ISS2022355737', 1, '17735712116', 'test21@isoftstone.com', '17649011532', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (23, 'test22', '测试用户22', '1', 'ISS2022502533', 0, '15544272461', 'test22@isoftstone.com', '18365279189', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (24, 'test23', '测试用户23', '1', 'ISS2022823120', 1, '18973521085', 'test23@isoftstone.com', '17372379631', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (25, 'test24', '测试用户24', '1', 'ISS2022216761', 0, '13294224116', 'test24@isoftstone.com', '15607412191', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (26, 'test25', '测试用户25', '1', 'ISS2022773311', 1, '15106350566', 'test25@isoftstone.com', '14991798728', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (27, 'test26', '测试用户26', '1', 'ISS2022445086', 0, '17264888623', 'test26@isoftstone.com', '13360868788', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (28, 'test27', '测试用户27', '1', 'ISS2022616056', 1, '14501962966', 'test27@isoftstone.com', '16664382403', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (29, 'test28', '测试用户28', '1', 'ISS2022714365', 0, '13460490289', 'test28@isoftstone.com', '13217862501', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (30, 'test29', '测试用户29', '1', 'ISS2022641483', 1, '15952749780', 'test29@isoftstone.com', '15587914993', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (31, 'test30', '测试用户30', '1', 'ISS2022340455', 0, '15686075908', 'test30@isoftstone.com', '17660916759', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (32, 'test31', '测试用户31', '1', 'ISS2022384164', 1, '13184250645', 'test31@isoftstone.com', '15856357485', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (33, 'test32', '测试用户32', '1', 'ISS2022255324', 0, '17125670027', 'test32@isoftstone.com', '14939861676', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (34, 'test33', '测试用户33', '1', 'ISS2022346362', 1, '18261827512', 'test33@isoftstone.com', '15019506199', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (35, 'test34', '测试用户34', '1', 'ISS2022516457', 0, '17217198611', 'test34@isoftstone.com', '17840340203', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (36, 'test35', '测试用户35', '1', 'ISS2022584838', 1, '15686887633', 'test35@isoftstone.com', '17109556065', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (37, 'test36', '测试用户36', '1', 'ISS2022126251', 0, '13033830361', 'test36@isoftstone.com', '19952887361', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (38, 'test37', '测试用户37', '1', 'ISS2022741478', 1, '15913728533', 'test37@isoftstone.com', '18052487369', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (39, 'test38', '测试用户38', '1', 'ISS2022512366', 0, '14582367392', 'test38@isoftstone.com', '18000541140', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (40, 'test39', '测试用户39', '1', 'ISS2022601321', 1, '18063404749', 'test39@isoftstone.com', '13331004816', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (41, 'test40', '测试用户40', '1', 'ISS2022770325', 0, '18078237539', 'test40@isoftstone.com', '18498630933', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (42, 'test41', '测试用户41', '1', 'ISS2022782716', 1, '13976921315', 'test41@isoftstone.com', '19909327176', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (43, 'test42', '测试用户42', '1', 'ISS2022180300', 0, '16626794589', 'test42@isoftstone.com', '17639451240', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (44, 'test43', '测试用户43', '1', 'ISS2022543188', 1, '16669894005', 'test43@isoftstone.com', '15302305330', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (45, 'test44', '测试用户44', '1', 'ISS2022147538', 0, '13355070886', 'test44@isoftstone.com', '13998623475', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (46, 'test45', '测试用户45', '1', 'ISS2022887378', 1, '18668040427', 'test45@isoftstone.com', '18027336724', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (47, 'test46', '测试用户46', '1', 'ISS2022660865', 0, '17664388260', 'test46@isoftstone.com', '13347122451', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (48, 'test47', '测试用户47', '1', 'ISS2022186134', 1, '17856988814', 'test47@isoftstone.com', '17753204314', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (49, 'test48', '测试用户48', '1', 'ISS2022127665', 0, '17650266883', 'test48@isoftstone.com', '18766800227', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (50, 'test49', '测试用户49', '1', 'ISS2022011342', 1, '19869638380', 'test49@isoftstone.com', '18500458312', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (51, 'test50', '测试用户50', '1', 'ISS2022352227', 0, '18224116978', 'test50@isoftstone.com', '15271609140', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (52, 'test51', '测试用户51', '1', 'ISS2022617647', 1, '13305154530', 'test51@isoftstone.com', '18170727004', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (53, 'test52', '测试用户52', '1', 'ISS2022815024', 0, '17727744939', 'test52@isoftstone.com', '17805736234', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (54, 'test53', '测试用户53', '1', 'ISS2022244470', 1, '17308844963', 'test53@isoftstone.com', '18619101738', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (55, 'test54', '测试用户54', '1', 'ISS2022151262', 0, '18883369247', 'test54@isoftstone.com', '17731815151', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (56, 'test55', '测试用户55', '1', 'ISS2022078843', 1, '15528081088', 'test55@isoftstone.com', '18954778277', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (57, 'test56', '测试用户56', '1', 'ISS2022133155', 0, '13349963202', 'test56@isoftstone.com', '14900028110', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (58, 'test57', '测试用户57', '1', 'ISS2022367164', 1, '17526920570', 'test57@isoftstone.com', '15211839345', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (59, 'test58', '测试用户58', '1', 'ISS2022426870', 0, '18669455402', 'test58@isoftstone.com', '16617028904', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (60, 'test59', '测试用户59', '1', 'ISS2022447005', 1, '17370601149', 'test59@isoftstone.com', '15529370680', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (61, 'test60', '测试用户60', '1', 'ISS2022640443', 0, '15986664225', 'test60@isoftstone.com', '14511009779', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (62, 'test61', '测试用户61', '1', 'ISS2022665282', 1, '13099099028', 'test61@isoftstone.com', '13443088672', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (63, 'test62', '测试用户62', '1', 'ISS2022782683', 0, '14590150512', 'test62@isoftstone.com', '17688299487', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (64, 'test63', '测试用户63', '1', 'ISS2022238215', 1, '13645517688', 'test63@isoftstone.com', '17206386421', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (65, 'test64', '测试用户64', '1', 'ISS2022817281', 0, '15204494837', 'test64@isoftstone.com', '18268392416', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (66, 'test65', '测试用户65', '1', 'ISS2022542523', 1, '14909580308', 'test65@isoftstone.com', '13618139450', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (67, 'test66', '测试用户66', '1', 'ISS2022111306', 0, '18221026733', 'test66@isoftstone.com', '17709102432', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (68, 'test67', '测试用户67', '1', 'ISS2022378611', 1, '14725741335', 'test67@isoftstone.com', '18984953010', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (69, 'test68', '测试用户68', '1', 'ISS2022555884', 0, '19891848460', 'test68@isoftstone.com', '13464290091', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:00');
INSERT INTO `student` VALUES (70, 'test69', '测试用户69', '1', 'ISS2022714786', 1, '14932243317', 'test69@isoftstone.com', '18316558852', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (71, 'test70', '测试用户70', '1', 'ISS2022861710', 0, '17292456975', 'test70@isoftstone.com', '17134145776', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (72, 'test71', '测试用户71', '1', 'ISS2022585717', 1, '17288053265', 'test71@isoftstone.com', '17266339036', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (73, 'test72', '测试用户72', '1', 'ISS2022853586', 0, '14980617608', 'test72@isoftstone.com', '16638452533', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (74, 'test73', '测试用户73', '1', 'ISS2022560383', 1, '13810388515', 'test73@isoftstone.com', '18594785166', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (75, 'test74', '测试用户74', '1', 'ISS2022558120', 0, '18642142602', 'test74@isoftstone.com', '16600390400', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (76, 'test75', '测试用户75', '1', 'ISS2022232717', 1, '13817731686', 'test75@isoftstone.com', '17232303767', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (77, 'test76', '测试用户76', '1', 'ISS2022101758', 0, '14547950191', 'test76@isoftstone.com', '15704782992', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (78, 'test77', '测试用户77', '1', 'ISS2022745108', 1, '13040399668', 'test77@isoftstone.com', '13959692660', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (79, 'test78', '测试用户78', '1', 'ISS2022136388', 0, '18648412113', 'test78@isoftstone.com', '16672836660', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (80, 'test79', '测试用户79', '1', 'ISS2022456135', 1, '15928082326', 'test79@isoftstone.com', '13858113063', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (81, 'test80', '测试用户80', '1', 'ISS2022428378', 0, '15218611807', 'test80@isoftstone.com', '16631100342', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (82, 'test81', '测试用户81', '1', 'ISS2022346437', 1, '18996211227', 'test81@isoftstone.com', '17703173643', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (83, 'test82', '测试用户82', '1', 'ISS2022328754', 0, '18363659071', 'test82@isoftstone.com', '17375633112', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (84, 'test83', '测试用户83', '1', 'ISS2022731881', 1, '17690239463', 'test83@isoftstone.com', '14955863025', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (85, 'test84', '测试用户84', '1', 'ISS2022376287', 0, '19913955579', 'test84@isoftstone.com', '13306677170', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (86, 'test85', '测试用户85', '1', 'ISS2022264724', 1, '17705038954', 'test85@isoftstone.com', '18063576472', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (87, 'test86', '测试用户86', '1', 'ISS2022307313', 0, '18950925068', 'test86@isoftstone.com', '13304750276', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (88, 'test87', '测试用户87', '1', 'ISS2022653032', 1, '13279384839', 'test87@isoftstone.com', '13878029130', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (89, 'test88', '测试用户88', '1', 'ISS2022414233', 0, '18914507913', 'test88@isoftstone.com', '17130049474', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (90, 'test89', '测试用户89', '1', 'ISS2022336632', 1, '18079119664', 'test89@isoftstone.com', '13770630938', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (91, 'test90', '测试用户90', '1', 'ISS2022016502', 0, '17652826311', 'test90@isoftstone.com', '17783953668', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (92, 'test91', '测试用户91', '1', 'ISS2022087121', 1, '18197434727', 'test91@isoftstone.com', '18657152993', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (93, 'test92', '测试用户92', '1', 'ISS2022674354', 0, '15914644148', 'test92@isoftstone.com', '13549742772', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (94, 'test93', '测试用户93', '1', 'ISS2022776133', 1, '15374500424', 'test93@isoftstone.com', '13376310136', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (95, 'test94', '测试用户94', '1', 'ISS2022451242', 0, '17867222752', 'test94@isoftstone.com', '13357853467', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (96, 'test95', '测试用户95', '1', 'ISS2022287073', 1, '18523011734', 'test95@isoftstone.com', '19952073839', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (97, 'test96', '测试用户96', '1', 'ISS2022877404', 0, '18088181781', 'test96@isoftstone.com', '17290463297', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (98, 'test97', '测试用户97', '1', 'ISS2022784064', 1, '15331757957', 'test97@isoftstone.com', '13681769945', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (99, 'test98', '测试用户98', '1', 'ISS2022345614', 0, '15369803283', 'test98@isoftstone.com', '17346266925', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (100, 'test99', '测试用户99', '1', 'ISS2022255257', 1, '16664700145', 'test99@isoftstone.com', '14988875937', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (101, 'test100', '测试用户100', '1', 'ISS2022157871', 0, '18306136874', 'test100@isoftstone.com', '15399994493', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (102, 'test101', '测试用户101', '1', 'ISS2022488676', 1, '17501780838', 'test101@isoftstone.com', '19918536858', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (103, 'test102', '测试用户102', '1', 'ISS2022665567', 0, '14754850225', 'test102@isoftstone.com', '18034666329', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (104, 'test103', '测试用户103', '1', 'ISS2022002762', 1, '15705377419', 'test103@isoftstone.com', '17372432275', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (105, 'test104', '测试用户104', '1', 'ISS2022013550', 0, '14508941413', 'test104@isoftstone.com', '18557925475', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (106, 'test105', '测试用户105', '1', 'ISS2022234434', 1, '13362682844', 'test105@isoftstone.com', '18287194580', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (107, 'test106', '测试用户106', '1', 'ISS2022716836', 0, '17863929174', 'test106@isoftstone.com', '16632367670', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (108, 'test107', '测试用户107', '1', 'ISS2022548502', 1, '18021824461', 'test107@isoftstone.com', '17194952415', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (109, 'test108', '测试用户108', '1', 'ISS2022278134', 0, '18694382486', 'test108@isoftstone.com', '18033009940', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (110, 'test109', '测试用户109', '1', 'ISS2022470233', 1, '17324588194', 'test109@isoftstone.com', '15602021672', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (111, 'test110', '测试用户110', '1', 'ISS2022131231', 0, '16605544485', 'test110@isoftstone.com', '17318988756', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (112, 'test111', '测试用户111', '1', 'ISS2022768741', 1, '13015462573', 'test111@isoftstone.com', '18521623402', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (113, 'test112', '测试用户112', '1', 'ISS2022027425', 0, '18674749312', 'test112@isoftstone.com', '13371234042', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (114, 'test113', '测试用户113', '1', 'ISS2022657651', 1, '18369552763', 'test113@isoftstone.com', '17619394922', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (115, 'test114', '测试用户114', '1', 'ISS2022656567', 0, '14961455076', 'test114@isoftstone.com', '17868546174', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (116, 'test115', '测试用户115', '1', 'ISS2022573353', 1, '18189295173', 'test115@isoftstone.com', '13421434960', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (117, 'test116', '测试用户116', '1', 'ISS2022525785', 0, '17649932694', 'test116@isoftstone.com', '18969299857', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (118, 'test117', '测试用户117', '1', 'ISS2022738013', 1, '13480170072', 'test117@isoftstone.com', '13251635759', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (119, 'test118', '测试用户118', '1', 'ISS2022335116', 0, '13931745896', 'test118@isoftstone.com', '15068048681', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (120, 'test119', '测试用户119', '1', 'ISS2022560557', 1, '15908200337', 'test119@isoftstone.com', '13344316396', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (121, 'test120', '测试用户120', '1', 'ISS2022268227', 0, '13377927962', 'test120@isoftstone.com', '13492763644', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (122, 'test121', '测试用户121', '1', 'ISS2022042023', 1, '13738859178', 'test121@isoftstone.com', '14504360242', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (123, 'test122', '测试用户122', '1', 'ISS2022754645', 0, '14915508800', 'test122@isoftstone.com', '15500167668', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (124, 'test123', '测试用户123', '1', 'ISS2022570627', 1, '17362242592', 'test123@isoftstone.com', '18981413395', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (125, 'test124', '测试用户124', '1', 'ISS2022116436', 0, '18506072619', 'test124@isoftstone.com', '15888028075', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (126, 'test125', '测试用户125', '1', 'ISS2022572604', 1, '13681443847', 'test125@isoftstone.com', '18571968110', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (127, 'test126', '测试用户126', '1', 'ISS2022161435', 0, '18904560733', 'test126@isoftstone.com', '13548191588', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (128, 'test127', '测试用户127', '1', 'ISS2022848523', 1, '18623266163', 'test127@isoftstone.com', '17567968095', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (129, 'test128', '测试用户128', '1', 'ISS2022214216', 0, '18522623453', 'test128@isoftstone.com', '18346375233', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (130, 'test129', '测试用户129', '1', 'ISS2022056663', 1, '17653936268', 'test129@isoftstone.com', '17741790001', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (131, 'test130', '测试用户130', '1', 'ISS2022007833', 0, '14935407179', 'test130@isoftstone.com', '15866720376', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (132, 'test131', '测试用户131', '1', 'ISS2022775206', 1, '14774323597', 'test131@isoftstone.com', '17364809835', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (133, 'test132', '测试用户132', '1', 'ISS2022377155', 0, '13934901869', 'test132@isoftstone.com', '17398609956', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (134, 'test133', '测试用户133', '1', 'ISS2022401810', 1, '15178273084', 'test133@isoftstone.com', '15725492074', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (135, 'test134', '测试用户134', '1', 'ISS2022610521', 0, '17735425808', 'test134@isoftstone.com', '17517373129', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (136, 'test135', '测试用户135', '1', 'ISS2022325638', 1, '18005864030', 'test135@isoftstone.com', '19871983800', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (137, 'test136', '测试用户136', '1', 'ISS2022157571', 0, '13426133477', 'test136@isoftstone.com', '15973844781', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (138, 'test137', '测试用户137', '1', 'ISS2022540616', 1, '13216703847', 'test137@isoftstone.com', '18070072669', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (139, 'test138', '测试用户138', '1', 'ISS2022116551', 0, '13153405171', 'test138@isoftstone.com', '14998049589', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (140, 'test139', '测试用户139', '1', 'ISS2022047330', 1, '15118078957', 'test139@isoftstone.com', '18512749221', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (141, 'test140', '测试用户140', '1', 'ISS2022882034', 0, '13226467174', 'test140@isoftstone.com', '17557881395', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (142, 'test141', '测试用户141', '1', 'ISS2022531008', 1, '14738560440', 'test141@isoftstone.com', '18152317345', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (143, 'test142', '测试用户142', '1', 'ISS2022100838', 0, '17138165540', 'test142@isoftstone.com', '15329808887', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (144, 'test143', '测试用户143', '1', 'ISS2022331628', 1, '18694288547', 'test143@isoftstone.com', '15301623019', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (145, 'test144', '测试用户144', '1', 'ISS2022532366', 0, '13256326180', 'test144@isoftstone.com', '17534769792', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (146, 'test145', '测试用户145', '1', 'ISS2022645461', 1, '15350200222', 'test145@isoftstone.com', '18146007883', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (147, 'test146', '测试用户146', '1', 'ISS2022240604', 0, '13552732837', 'test146@isoftstone.com', '17512609860', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (148, 'test147', '测试用户147', '1', 'ISS2022437681', 1, '18864240062', 'test147@isoftstone.com', '17781172919', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (149, 'test148', '测试用户148', '1', 'ISS2022852601', 0, '17620052629', 'test148@isoftstone.com', '15244962622', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (150, 'test149', '测试用户149', '1', 'ISS2022820122', 1, '15621032593', 'test149@isoftstone.com', '14586727130', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (151, 'test150', '测试用户150', '1', 'ISS2022356134', 0, '18908835861', 'test150@isoftstone.com', '15577776543', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (152, 'test151', '测试用户151', '1', 'ISS2022337268', 1, '18974574370', 'test151@isoftstone.com', '17684899064', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (153, 'test152', '测试用户152', '1', 'ISS2022887482', 0, '18521045411', 'test152@isoftstone.com', '18669225771', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (154, 'test153', '测试用户153', '1', 'ISS2022632040', 1, '14905271141', 'test153@isoftstone.com', '14787034809', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (155, 'test154', '测试用户154', '1', 'ISS2022507442', 0, '15359784090', 'test154@isoftstone.com', '17821015602', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (156, 'test155', '测试用户155', '1', 'ISS2022205112', 1, '16601770363', 'test155@isoftstone.com', '13750555846', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (157, 'test156', '测试用户156', '1', 'ISS2022327612', 0, '15118071559', 'test156@isoftstone.com', '19964551165', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (158, 'test157', '测试用户157', '1', 'ISS2022716417', 1, '18528677373', 'test157@isoftstone.com', '18787323051', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (159, 'test158', '测试用户158', '1', 'ISS2022265857', 0, '13352810423', 'test158@isoftstone.com', '17613212083', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (160, 'test159', '测试用户159', '1', 'ISS2022170681', 1, '17392508886', 'test159@isoftstone.com', '18440151853', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (161, 'test160', '测试用户160', '1', 'ISS2022145335', 0, '17270786999', 'test160@isoftstone.com', '18089756639', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (162, 'test161', '测试用户161', '1', 'ISS2022473478', 1, '18466648060', 'test161@isoftstone.com', '18285566465', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (163, 'test162', '测试用户162', '1', 'ISS2022733225', 0, '17586198890', 'test162@isoftstone.com', '18466131427', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (164, 'test163', '测试用户163', '1', 'ISS2022844433', 1, '16627809935', 'test163@isoftstone.com', '13349606261', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:01');
INSERT INTO `student` VALUES (165, 'test164', '测试用户164', '1', 'ISS2022666056', 0, '15120204407', 'test164@isoftstone.com', '13578409777', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (166, 'test165', '测试用户165', '1', 'ISS2022266030', 1, '19941483284', 'test165@isoftstone.com', '13321864473', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (167, 'test166', '测试用户166', '1', 'ISS2022243635', 0, '18959138825', 'test166@isoftstone.com', '15063049546', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (168, 'test167', '测试用户167', '1', 'ISS2022745862', 1, '18364926103', 'test167@isoftstone.com', '18669817504', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (169, 'test168', '测试用户168', '1', 'ISS2022278064', 0, '13250600305', 'test168@isoftstone.com', '13733889170', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (170, 'test169', '测试用户169', '1', 'ISS2022570416', 1, '17154454009', 'test169@isoftstone.com', '14900225052', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (171, 'test170', '测试用户170', '1', 'ISS2022337661', 0, '18192146664', 'test170@isoftstone.com', '13396465824', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (172, 'test171', '测试用户171', '1', 'ISS2022428680', 1, '15598781070', 'test171@isoftstone.com', '15167404287', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (173, 'test172', '测试用户172', '1', 'ISS2022447401', 0, '18762988920', 'test172@isoftstone.com', '14722485932', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (174, 'test173', '测试用户173', '1', 'ISS2022800082', 1, '14571822012', 'test173@isoftstone.com', '13524346104', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (175, 'test174', '测试用户174', '1', 'ISS2022121717', 0, '18974357908', 'test174@isoftstone.com', '14522342932', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (176, 'test175', '测试用户175', '1', 'ISS2022328127', 1, '18687735190', 'test175@isoftstone.com', '15809863363', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (177, 'test176', '测试用户176', '1', 'ISS2022654274', 0, '14537743458', 'test176@isoftstone.com', '14910171809', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (178, 'test177', '测试用户177', '1', 'ISS2022175216', 1, '18900111115', 'test177@isoftstone.com', '18160179460', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (179, 'test178', '测试用户178', '1', 'ISS2022013211', 0, '13005543969', 'test178@isoftstone.com', '15849752210', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (180, 'test179', '测试用户179', '1', 'ISS2022212653', 1, '17196673151', 'test179@isoftstone.com', '13597218768', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (181, 'test180', '测试用户180', '1', 'ISS2022026341', 0, '17670343690', 'test180@isoftstone.com', '15211323030', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (182, 'test181', '测试用户181', '1', 'ISS2022021116', 1, '18257105425', 'test181@isoftstone.com', '15895033223', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (183, 'test182', '测试用户182', '1', 'ISS2022330256', 0, '17747336612', 'test182@isoftstone.com', '15761416994', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (184, 'test183', '测试用户183', '1', 'ISS2022033285', 1, '15389273601', 'test183@isoftstone.com', '18468693543', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (185, 'test184', '测试用户184', '1', 'ISS2022136134', 0, '16669977592', 'test184@isoftstone.com', '17363092479', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (186, 'test185', '测试用户185', '1', 'ISS2022488412', 1, '18783806140', 'test185@isoftstone.com', '13951294616', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (187, 'test186', '测试用户186', '1', 'ISS2022387363', 0, '17554795005', 'test186@isoftstone.com', '13796339535', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (188, 'test187', '测试用户187', '1', 'ISS2022752127', 1, '18745385650', 'test187@isoftstone.com', '14981382860', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (189, 'test188', '测试用户188', '1', 'ISS2022472608', 0, '14781081690', 'test188@isoftstone.com', '17796903841', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (190, 'test189', '测试用户189', '1', 'ISS2022728634', 1, '19904767247', 'test189@isoftstone.com', '13121956745', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (191, 'test190', '测试用户190', '1', 'ISS2022178062', 0, '15675963147', 'test190@isoftstone.com', '17129362649', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (192, 'test191', '测试用户191', '1', 'ISS2022440885', 1, '18345333011', 'test191@isoftstone.com', '18111629931', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (193, 'test192', '测试用户192', '1', 'ISS2022706553', 0, '13065943273', 'test192@isoftstone.com', '18946485079', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (194, 'test193', '测试用户193', '1', 'ISS2022332126', 1, '13106670279', 'test193@isoftstone.com', '14744598421', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (195, 'test194', '测试用户194', '1', 'ISS2022286285', 0, '16605391822', 'test194@isoftstone.com', '15000713164', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (196, 'test195', '测试用户195', '1', 'ISS2022126723', 1, '15746377523', 'test195@isoftstone.com', '18591832891', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (197, 'test196', '测试用户196', '1', 'ISS2022414042', 0, '17688782951', 'test196@isoftstone.com', '15651565643', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (198, 'test197', '测试用户197', '1', 'ISS2022252871', 1, '13738063970', 'test197@isoftstone.com', '14906620455', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (199, 'test198', '测试用户198', '1', 'ISS2022741714', 0, '17566420241', 'test198@isoftstone.com', '13908075470', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (200, 'test199', '测试用户199', '1', 'ISS2022486101', 1, '18133018352', 'test199@isoftstone.com', '17744118319', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (201, 'test200', '测试用户200', '1', 'ISS2022814645', 0, '18010067761', 'test200@isoftstone.com', '17351539585', '420xxxxxxxxxxxx123', 'avatar.jpg', '小小实习生，努力转正中......!!!!', '华中四大名校之首——华夏学院的应届生，专注前端开发3个月，工位上零食无数，深得周老师，夏老师，波波老师的喜爱。经我们三人一致表决，同意小熊转正。工资3K，无五险一金。', 1, '2022-05-11 10:10:02');
INSERT INTO `student` VALUES (2002, '15623572152', '熊二', '111111', NULL, 0, NULL, NULL, NULL, NULL, '1653529810745.jpg', '熊二熊二熊二熊二熊二熊二熊二熊二熊二熊二熊二', NULL, 1, '2022-05-25 17:33:10');
INSERT INTO `student` VALUES (2003, '15342291461', NULL, '111111', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2022-07-18 22:02:19');

-- ----------------------------
-- Table structure for student_class
-- ----------------------------
DROP TABLE IF EXISTS `student_class`;
CREATE TABLE `student_class`  (
  `student_id` int(11) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  INDEX `fk_student_class` USING BTREE(`student_id`),
  INDEX `fk_class_student` USING BTREE(`class_id`),
  CONSTRAINT `fk_student_class` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '班级学生表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student_class
-- ----------------------------
INSERT INTO `student_class` VALUES (1, 2);
INSERT INTO `student_class` VALUES (1, 4);
INSERT INTO `student_class` VALUES (1, 6);
INSERT INTO `student_class` VALUES (1, 8);
INSERT INTO `student_class` VALUES (2002, 2);
INSERT INTO `student_class` VALUES (2002, 3);
INSERT INTO `student_class` VALUES (2002, 4);
INSERT INTO `student_class` VALUES (2002, 68);
INSERT INTO `student_class` VALUES (2002, 6);
INSERT INTO `student_class` VALUES (2002, 7);
INSERT INTO `student_class` VALUES (2002, 8);
INSERT INTO `student_class` VALUES (2002, 9);
INSERT INTO `student_class` VALUES (2002, 10);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pk_id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '昵称',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  `level` int(11) DEFAULT NULL COMMENT '级别 >> 1：初级讲师 2：中级讲师 3：高级讲师',
  `photo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '照骗',
  `introduction` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '这个人很懒，没留下任何东西...' COMMENT '个人简介',
  `role` int(11) NOT NULL DEFAULT 2 COMMENT '角色 >> 0：管理员  2：老师',
  `is_active` int(11) DEFAULT 1 COMMENT '是否活动，用于标识数据逻辑删除',
  `operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '系统管理员' COMMENT '操作人',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY USING BTREE (`id`),
  INDEX `fk_user_role` USING BTREE(`role`)
) ENGINE = InnoDB AUTO_INCREMENT = 274 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'zhouzhuo', 'zhouzhuo', '1', '13971397916', 'zhouzhoud@isoftatone.com', 3, 'avatar.jpg', '7+年ICT行业从业经历，4 年培训服务从业经历\n\n专注 鲲鹏 / Java /大数据 等领域的培训交付和课程开发：\n\n交付30+个培训项目，覆盖国内10+院校\n西北民族大学\n中国地质大学\n重庆邮电大学\n武汉科技大学等\n\n\n参与4+个工程项目交付\n中信集团移动办公项目：负责软硬件系统集成、性能优化和兼容性测试\n良品铺子电商项目：负责核心模块的设计和研发\n湖北省委内网集成平台等项目', 2, 1, '系统管理员', '2022-01-07 14:24:12');
INSERT INTO `user` VALUES (2, 'xiadewang', 'xiadewang', '1', '13437124333', 'dwxia@isoftstone.com', 3, 'avatar.jpg', NULL, 2, 1, '系统管理员', '2022-02-14 10:30:00');
INSERT INTO `user` VALUES (3, 'zoubo', 'zoubo', '1', '13437124333', 'zoubo@isoftstone.com', 3, 'avatar.jpg', NULL, 2, 1, '系统管理员', '2022-02-14 11:07:54');
INSERT INTO `user` VALUES (4, 'lilin', 'lilin', '1', '13437124333', 'lilin@isoftstone.com', 3, 'avatar.jpg', NULL, 2, 1, '系统管理员', '2022-02-14 11:07:54');
INSERT INTO `user` VALUES (5, 'luchao', 'luchao', '1', '13437124333', 'luchao@isoftstone.com', 2, 'avatar.jpg', NULL, 2, 1, '系统管理员', '2022-02-14 11:07:54');
INSERT INTO `user` VALUES (6, 'jiangweifeng', 'jiangweifeng', '1', '13437124333', 'jiangweifeng@isoftstone.com', 3, 'avatar.jpg', NULL, 2, 1, '系统管理员', '2022-02-14 11:07:54');
INSERT INTO `user` VALUES (7, 'leizhengwei', 'leizhengwei', '1', '13437124333', 'leizhengwei@isoftstone.com', 3, 'avatar.jpg', NULL, 2, 1, '系统管理员', '2022-02-14 11:07:55');
INSERT INTO `user` VALUES (8, 'zhangwei', 'zhangwei', '1', '13437124333', 'zhangwei@isoftstone.com', 3, 'avatar.jpg', NULL, 2, 1, '系统管理员', '2022-02-14 11:07:55');
INSERT INTO `user` VALUES (9, 'chenyu', 'chenyu', '1', '13437124333', 'chenyu@isoftstone.com', 3, 'avatar.jpg', NULL, 2, 1, '系统管理员', '2022-02-14 11:07:55');
INSERT INTO `user` VALUES (10, 'fanle', 'fanle', '1', '13437124333', 'fanle@isoftstone.com', 3, 'avatar.jpg', NULL, 2, 1, '系统管理员', '2022-02-14 11:07:55');
INSERT INTO `user` VALUES (11, 'jinlamei', 'jinlamei', '1', '13437124333', 'jinlamei@isoftstone.com', 3, 'avatar.jpg', NULL, 2, 1, '系统管理员', '2022-02-14 11:07:55');
INSERT INTO `user` VALUES (12, 'zhaoyuguang', 'zhaoyuguang', '1', '13437124333', 'zhaoyuguang@isoftstone.com', 3, 'avatar.jpg', NULL, 2, 1, '系统管理员', '2022-02-14 11:07:55');
INSERT INTO `user` VALUES (13, 'xinfenghua', 'xinfenghua', '1', '13437124333', 'xinfenghua@isoftstone.com', 3, 'avatar.jpg', NULL, 2, 1, '系统管理员', '2022-02-14 11:07:55');
INSERT INTO `user` VALUES (14, 'lvweipeng', 'lvweipeng', '1', '13437124333', 'lvweipeng@isoftstone.com', 3, 'avatar.jpg', NULL, 2, 1, '系统管理员', '2022-02-14 11:07:55');
INSERT INTO `user` VALUES (15, 'xuemeng', 'xuemeng', '1', '13437124333', 'xuemeng@isoftstone.com', 3, 'avatar.jpg', NULL, 2, 1, '系统管理员', '2022-02-14 11:07:55');
INSERT INTO `user` VALUES (16, 'dudandong', 'dudandong', '1', '13437124333', 'dudandong@isoftstone.com', 3, 'avatar.jpg', NULL, 2, 1, '系统管理员', '2022-02-14 11:07:55');
INSERT INTO `user` VALUES (17, 'lenqinjie', 'lenqinjie', '1', '13437124333', 'qjlenga@isoftstone.com', 3, 'avatar.jpg', NULL, 2, 1, '系统管理员', '2022-02-14 11:07:55');
INSERT INTO `user` VALUES (18, 'lixiaoqing', 'lixiaoqing', '1', '13437124333', 'xqliv@isoftstone.com', 3, 'avatar.jpg', NULL, 2, 1, '系统管理员', '2022-02-14 11:07:56');
INSERT INTO `user` VALUES (19, 'lixiuzhong', 'lixiuzhong', '1', '13437124333', 'xzlit@isoftstone.com', 3, 'avatar.jpg', NULL, 2, 1, '系统管理员', '2022-02-14 11:07:56');
INSERT INTO `user` VALUES (20, 'chenxiangjian', 'chenxiangjian', '1', '13437124333', 'xjchenal@isoftstone.com', 3, 'avatar.jpg', NULL, 2, 1, '系统管理员', '2022-02-14 11:07:56');
INSERT INTO `user` VALUES (21, 'wangbin', 'wangbin', '1', '13437124333', 'binwangn@isoftstone.com', 3, 'avatar.jpg', NULL, 2, 1, '系统管理员', '2022-02-14 11:07:56');
INSERT INTO `user` VALUES (22, 'huanghe', 'huanghe', '1', '13437124333', 'hehuang@isoftstone.com', 3, 'avatar.jpg', NULL, 2, 1, '系统管理员', '2022-02-14 11:07:56');
INSERT INTO `user` VALUES (23, 'yangdaifeng', 'yangdaifeng', '1', '13437124333', 'dfyangg@isoftstone.com', 3, 'avatar.jpg', NULL, 2, 1, '系统管理员', '2022-02-14 11:07:56');
INSERT INTO `user` VALUES (24, 'tangfengliang', 'tangfengliang', '1', '13437124333', 'fltangc@isoftstone.com', 3, 'avatar.jpg', NULL, 2, 1, '系统管理员', '2022-02-14 11:07:56');
INSERT INTO `user` VALUES (271, 'zz', 'nickname1', 'nickname1', '13971397916', 'zhouzhoud@isoftatone.com', 3, 'avatar.jpg', '7+年ICT行业从业经历，4 年培训服务从业经历\n\n专注 鲲鹏 / Java /大数据 等领域的培训交付和课程开发：\n\n交付30+个培训项目，覆盖国内10+院校\n西北民族大学\n中国地质大学\n重庆邮电大学\n武汉科技大学等\n\n\n参与4+个工程项目交付\n中信集团移动办公项目：负责软硬件系统集成、性能优化和兼容性测试\n良品铺子电商项目：负责核心模块的设计和研发\n湖北省委内网集成平台等项目', 0, 1, '系统管理员', '2022-01-07 14:24:12');
INSERT INTO `user` VALUES (272, '15623572152', 'nickname2', '111111', '15623572152', 'jcxiongc@isoftstone.com', 1, 'avatar.jpg', '大家好，我是来自软通大学产品研发中心的实习生熊佳晨，熊猫的熊，北方有佳人的佳，早晨的晨，大家可以叫我小熊。现担任icolloge的前端研发，本人性别女爱好男，性格开朗活泼，唱歌跑调，喜欢打本和跑团，平常也喜欢画画。', 2, 1, '系统管理员', '2022-04-18 11:15:06');

-- ----------------------------
-- Table structure for user_class
-- ----------------------------
DROP TABLE IF EXISTS `user_class`;
CREATE TABLE `user_class`  (
  `user_id` int(11) NOT NULL ,
  `class_id` int(11) DEFAULT NULL,
  UNIQUE INDEX `pk_user_classes` USING BTREE(`user_id`, `class_id`),
  INDEX `fk_classes` USING BTREE(`class_id`),
  CONSTRAINT `fk_classes` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '老师_班级_中间表;' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_class
-- ----------------------------
INSERT INTO `user_class` VALUES (3, 69);
INSERT INTO `user_class` VALUES (4, 69);
INSERT INTO `user_class` VALUES (6, 3);
INSERT INTO `user_class` VALUES (6, 4);
INSERT INTO `user_class` VALUES (6, 7);
INSERT INTO `user_class` VALUES (9, 1);
INSERT INTO `user_class` VALUES (9, 5);
INSERT INTO `user_class` VALUES (9, 8);
INSERT INTO `user_class` VALUES (10, 2);
INSERT INTO `user_class` VALUES (10, 6);
INSERT INTO `user_class` VALUES (10, 9);
INSERT INTO `user_class` VALUES (16, 6);
INSERT INTO `user_class` VALUES (17, 10);

SET FOREIGN_KEY_CHECKS = 1;
