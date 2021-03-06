 CREATE DATABASE project;
 
 USE project;

 CREATE TABLE `project`.`tbl_user` (
 `user_id` INT unique AUTO_INCREMENT,
    `user_name` VARCHAR(45) NULL,
    `user_username` VARCHAR(45) NULL,
    `user_password` VARCHAR(45) NULL,
    PRIMARY KEY (`user_id`));
    
 CREATE TABLE `project`.`scores` (
    ticker VARCHAR(45) NULL,
    score DECIMAL(9,2) NULL,
    twitterScore DECIMAL(9,2) NULL,
    user_id INT NULL
    );

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_createUser`(
    IN p_name VARCHAR(20),
    IN p_username VARCHAR(20),
    IN p_password VARCHAR(20)
)

BEGIN
    if ( select exists (select 1 from tbl_user where user_username = p_username) ) THEN
     
        select 'Username Exists !!';
     
    ELSE
     
        insert into tbl_user
        (
            user_name,
            user_username,
            user_password
        )
        values
        (
            p_name,
            p_username,
            p_password
        );
     
    END IF;
END$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_validateLogin`(
IN p_username VARCHAR(20)
)
BEGIN
    select * from tbl_user where user_username = p_username;
END$$
DELIMITER ;

