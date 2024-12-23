-- drop database studentmanager;

CREATE DATABASE IF NOT EXISTS `studentmanager`;
USE `studentmanager`;

DROP TABLE IF EXISTS `s_admin`;
CREATE TABLE `s_admin`
(
    `id`       INT(5)      NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(32) NOT NULL,
    `password` VARCHAR(32) NOT NULL,
    `status`   TINYINT(1)  NOT NULL DEFAULT '1',
    PRIMARY KEY (`id`, `username`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  AUTO_INCREMENT = 2;

INSERT INTO `s_admin`(`id`, `username`, `password`, `status`)
VALUES (1, 'admin', '123456', 1);

DROP TABLE IF EXISTS `s_clazz`;
CREATE TABLE `s_clazz`
(
    `id`   INT(5)      NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `info` VARCHAR(128) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  AUTO_INCREMENT = 6;

INSERT INTO `s_clazz`(`id`, `name`, `info`)
VALUES (1, '网络一班', '网络工程专业'),
       (2, '网络二班', '网络工程专业'),
       (3, '计算机科学与技术一班', '计算机专业'),
       (4, '计算机科学与技术二班', '计算机专业'),
       (5, '英语一班', '英语语言专业'),
       (6, '英语二班', '英语语言专业'),
       (7, '网安一班', '网络安全专业'),
       (8, '网安二班', '网络安全专业'),
       (9, '大数据一班', '大数据专业'),
       (10, '大数据二班', '大数据专业');

DROP TABLE IF EXISTS `s_teacher`;
CREATE TABLE `s_teacher`
(
    `id`       INT(5)      NOT NULL AUTO_INCREMENT,
    `sn`       VARCHAR(32) NOT NULL,
    `username` VARCHAR(32) NOT NULL,
    `password` VARCHAR(32) NOT NULL,
    `clazz_id` INT(5)      NOT NULL,
    `sex`      VARCHAR(5)  NOT NULL DEFAULT '男',
    `mobile`   VARCHAR(12)          DEFAULT NULL,
    `qq`       VARCHAR(18)          DEFAULT NULL,
    `photo`    VARCHAR(255)         DEFAULT NULL,
    PRIMARY KEY (`id`, `sn`),
    KEY `teacher_clazz_id_foreign` (`clazz_id`),
    CONSTRAINT `s_teacher_ibfk_1` FOREIGN KEY (`clazz_id`) REFERENCES `s_clazz` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  AUTO_INCREMENT = 19;

INSERT INTO `s_teacher`(`id`, `sn`, `username`, `password`, `clazz_id`, `sex`, `mobile`, `qq`, `photo`)
VALUES (9, 'T2304020101', '张三老师', '111', 4, '男', '13918655656', '1193284480', NULL),
       (10, 'T2304020102', '李四老师', '111', 4, '男', '13656565656', '123456', NULL),
       (11, 'T2304020103', '李老师', '123456', 5, '男', '18989898989', '1456655565', NULL),
       (12, 'T2304020104', '夏老师', '123456', 1, '女', '15174857845', '1745854125', NULL),
       (13, 'T2304020105', '王老师', '876543', 3, '女', '13298765432', '6667778888', NULL),
       (14, 'T2304020106', '孙老师', '112233', 6, '男', '13987654321', '9998887777', NULL),
       (15, 'T2304020107', '林老师', '111222', 8, '男', '13533334444', '4445556666', NULL),
       (16, 'T2304020108', '陈老师', '121314', 9, '女', '13800000000', '666777', NULL),
       (17, 'T2304020109', '杨老师', '123321', 10, '男', '13711122334', '1233216547', NULL),
       (18, 'T2304020110', '周老师', '333222', 7, '女', '13900000000', '3216549870', NULL);

DROP TABLE IF EXISTS `s_student`;
CREATE TABLE `s_student`
(
    `id`       INT(5)      NOT NULL AUTO_INCREMENT,
    `sn`       VARCHAR(32) NOT NULL,
    `username` VARCHAR(32) NOT NULL,
    `password` VARCHAR(32) NOT NULL,
    `clazz_id` INT(5)      NOT NULL,
    `sex`      VARCHAR(5)  NOT NULL DEFAULT '男',
    `mobile`   VARCHAR(12)          DEFAULT NULL,
    `qq`       VARCHAR(18)          DEFAULT NULL,
    `photo`    VARCHAR(255)         DEFAULT NULL,
    PRIMARY KEY (`id`, `sn`),
    KEY `student_clazz_id_foreign` (`clazz_id`),
    CONSTRAINT `student_clazz_id_foreign` FOREIGN KEY (`clazz_id`) REFERENCES `s_clazz` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  AUTO_INCREMENT = 10;

INSERT INTO `s_student`(`id`, `sn`, `username`, `password`, `clazz_id`, `sex`, `mobile`, `qq`, `photo`)
VALUES (2, 'S2304020101', '王根茂', '123456', 1, '女', '13545454548', '1332365656', NULL),
       (3, 'S2304020102', '王根根', '654321', 1, '男', '13845454547', '456123', NULL),
       (4, 'S2304020103', '王毛毛', '111111', 5, '男', '13356565656', '123456', NULL),
       (5, 'S2304020104', '王茂根', '111222', 2, '女', '13812345678', '987654', NULL),
       (6, 'S2304020105', '王茂茂', '333222', 3, '男', '13956765432', '321321', NULL),
       (7, 'S2304020106', '王根猫', '987654', 4, '女', '13612345678', '555888', NULL),
       (8, 'S2304020107', '王猫猫', '444555', 6, '男', '13700000000', '777888', NULL),
       (9, 'S2304020108', '根茂王', '114514', 5, '男', '13333332133', '131313132323', NULL),
       (10, 'S2304020109', '根根王', '999999', 2, '女', '13898765432', '666444', NULL),
       (1, 'S2304020110', '茂茂王', '112233', 3, '男', '13712345678', '1234567', NULL);

DROP TABLE IF EXISTS `s_course`;
CREATE TABLE `s_course`
(
    `id`           INT(5)      NOT NULL AUTO_INCREMENT,
    `name`         VARCHAR(32) NOT NULL,
    `teacher_id`   INT(5)      NOT NULL,
    `course_date`  VARCHAR(32)          DEFAULT NULL,
    `selected_num` INT(5)      NOT NULL DEFAULT '0',
    `max_num`      INT(5)      NOT NULL DEFAULT '50',
    `info`         VARCHAR(128)         DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `course_teacher_foreign` (`teacher_id`),
    CONSTRAINT `course_teacher_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `s_teacher` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  AUTO_INCREMENT = 4;

INSERT INTO `s_course`(`id`, `name`, `teacher_id`, `course_date`, `selected_num`, `max_num`, `info`)
VALUES (1, '大学英语', 9, '周三上午8点', 49, 50, '英语课程'),
       (2, '高等数学', 10, '周三上午10点', 4, 50, '数学课程'),
       (3, '计算机组成原理', 11, '周三上午', 3, 50, '计算机课程'),
       (4, '大学物理', 12, '周一上午8点', 5, 50, '物理学课程'),
       (5, '数据库系统', 13, '周一下午2点', 2, 50, '计算机课程'),
       (6, '数据结构', 14, '周二上午10点', 7, 50, '计算机课程'),
       (7, '大学体育', 15, '周二下午1点', 10, 50, '体育课程'),
       (8, '马克思主义基本原理', 16, '周四上午9点', 6, 50, '政治课程'),
       (9, '信息安全数学基础', 17, '周五下午3点', 3, 50, '计算机课程'),
       (10, 'JAVA（双语）', 18, '周五上午10点', 8, 50, '计算机课程');

DROP TABLE IF EXISTS `s_score`;
CREATE TABLE `s_score`
(
    `id`         INT(5)       NOT NULL AUTO_INCREMENT,
    `student_id` INT(5)       NOT NULL,
    `course_id`  INT(5)       NOT NULL,
    `score`      DOUBLE(5, 2) NOT NULL,
    `remark`     VARCHAR(128) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `selected_course_student_fk` (`student_id`),
    KEY `selected_course_course_fk` (`course_id`),
    CONSTRAINT `s_score_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `s_course` (`id`),
    CONSTRAINT `s_score_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `s_student` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  AUTO_INCREMENT = 69;

INSERT INTO `s_score`(`id`, `student_id`, `course_id`, `score`, `remark`)
VALUES (67, 4, 2, 78.00, '中等'),
       (68, 9, 1, 50.00, '不及格'),
       (69, 2, 3, 92.50, '优秀'),
       (70, 4, 5, 85.00, '良好'),
       (71, 9, 7, 60.00, '合格'),
       (72, 3, 6, 88.00, '良好'),
       (73, 4, 8, 95.00, '优秀'),
       (74, 5, 9, 75.00, '中等'),
       (75, 6, 10, 90.00, '优秀'),
       (76, 7, 4, 80.00, '良好');

DROP TABLE IF EXISTS `s_selected_course`;
CREATE TABLE `s_selected_course`
(
    `id`         INT(5) NOT NULL AUTO_INCREMENT,
    `student_id` INT(5) NOT NULL,
    `course_id`  INT(5) NOT NULL,
    PRIMARY KEY (`id`),
    KEY `selected_course_student_fk` (`student_id`),
    KEY `selected_course_course_fk` (`course_id`),
    CONSTRAINT `selected_course_course_fk` FOREIGN KEY (`course_id`) REFERENCES `s_course` (`id`),
    CONSTRAINT `selected_course_student_fk` FOREIGN KEY (`student_id`) REFERENCES `s_student` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8
  AUTO_INCREMENT = 25;

INSERT INTO `s_selected_course`(`id`, `student_id`, `course_id`)
VALUES (18, 2, 1),
       (19, 2, 2),
       (20, 2, 3),
       (21, 4, 3),
       (22, 4, 2),
       (24, 9, 1),
       (25, 5, 3),
       (26, 6, 4),
       (27, 7, 5),
       (28, 8, 6),
       (29, 9, 7),
       (30, 10, 8),
       (31, 1, 9),
       (32, 2, 10),
       (33, 3, 4),
       (34, 4, 5),
       (35, 5, 6),
       (36, 6, 7),
       (37, 7, 8),
       (38, 8, 9);