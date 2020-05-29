CREATE DATABASE `school` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE `teacher` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`name` varchar(16) NOT NULL,
	`sex` varchar(1) NOT NULL,
	`age` int(2) NOT NULL,
	`position_id` int(10) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `student` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`name` varchar(16) NOT NULL,
	`sex` varchar(1) NOT NULL,
	`age` int(2) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `position` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`name` varchar(16) NOT NULL,
	`parent_id` int(10),
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `classroom` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`name` varchar(16) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `teacher_classroom` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`tid` int(10) NOT NULL,
	`cid` int(10) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

CREATE TABLE `student_classroom` (
	`id` int(10) NOT NULL AUTO_INCREMENT,
	`sid` int(10) NOT NULL,
	`cid` int(10) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB;

alter table teacher add index ind_t_position_id(position_id); -- 创建普通索引
alter table position add unique index uind_p_name(name); -- 创建唯一索引
alter table teacher add index ind_sex_age(sex, age); -- 创建组合索引
alter table teacher add fulltext  tx_name(name); --创建全文索引