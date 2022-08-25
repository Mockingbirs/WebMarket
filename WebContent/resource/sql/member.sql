CREATE TABLE `member` (
	`mno` INT(11) NOT NULL AUTO_INCREMENT,
	`mname` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`mpass` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`mtel` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`memail` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`mgender` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`maddr` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`mlevel` VARCHAR(50) NULL DEFAULT '5' COLLATE 'utf8mb4_general_ci',
	`miname` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`mdate` TIMESTAMP NULL DEFAULT current_timestamp(),
	PRIMARY KEY (`mno`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=19
;
