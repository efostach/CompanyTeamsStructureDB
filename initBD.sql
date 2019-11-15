CREATE DATABASE company_teams_structure;

CREATE TABLE `customers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
);

CREATE TABLE `projects` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
);

CREATE TABLE `skills` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
);

CREATE TABLE `teams` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
);

CREATE TABLE `employees` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `team_id` INT NOT NULL,
  `work_experience` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `team_id_idx` (`team_id`),
  CONSTRAINT `employees_team_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
);

CREATE TABLE `customer_projectset` (
  `customer_id` INT NOT NULL,
  `project_id` INT NOT NULL,
  PRIMARY KEY (`customer_id`,`project_id`),
  KEY `project_id_idx` (`project_id`),
  KEY `customer_id_idx` (`customer_id`),
  CONSTRAINT `customer_projectset_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `customer_projectset_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
);

CREATE TABLE `employee_skillset` (
  `employee_id` INT NOT NULL,
  `skill_id` INT NOT NULL,
  PRIMARY KEY (`employee_id`,`skill_id`),
  KEY `skill_id_idx` (`skill_id`),
  KEY `employee_id_idx` (`employee_id`),
  CONSTRAINT `employee_skillset_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `employee_skillset_skill_id` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`)
);

CREATE TABLE `project_teamset` (
  `project_id` INT NOT NULL,
  `team_id` INT NOT NULL,
  PRIMARY KEY (`project_id`,`team_id`),
  KEY `team_id_idx` (`team_id`),
  CONSTRAINT `project_teamset_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `project_teamset_team_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`)
);




