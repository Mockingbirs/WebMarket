CREATE TABLE `delivery` (
	`did` INT(11) NOT NULL AUTO_INCREMENT,
	`dpid` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`dmid` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`dmaddr` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`dmtel` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`dpname` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`dpprice` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`dstatus` VARCHAR(50) NULL DEFAULT '1' COLLATE 'utf8mb4_general_ci',
	`ddone` VARCHAR(50) NULL DEFAULT '0' COLLATE 'utf8mb4_general_ci',
	`ddate` TIMESTAMP NULL DEFAULT current_timestamp(),
	PRIMARY KEY (`did`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=5
;
