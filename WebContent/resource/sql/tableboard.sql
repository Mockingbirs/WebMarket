CREATE TABLE `tableboard` (
	`bid` INT(11) NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`content` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`author` VARCHAR(500) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`bdate` TIMESTAMP NULL DEFAULT current_timestamp(),
	PRIMARY KEY (`bid`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=29
;
