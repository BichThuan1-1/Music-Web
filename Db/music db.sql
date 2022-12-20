create database `mydb3`;
use `mydb3`;

CREATE TABLE IF NOT EXISTS `mydb3`.`admin` (
  `adminId` INT NOT NULL AUTO_INCREMENT,
  `adminUsername` NVARCHAR(255) NULL,
  `adminPassword` NVARCHAR(255) NULL,
  `adminRegisterDate` DATETIME NULL,
  `adminLastDate` DATETIME NULL,
  PRIMARY KEY (`adminId`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb3`.`normaluser` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `userName` NVARCHAR(255) NULL,
  `userPassword` NVARCHAR(255) NULL,
  `userNickname` NVARCHAR(255) NULL,
  `userSex` INT NULL,
  `userEmail` VARCHAR(255) NULL,
  `userAvatar` VARCHAR(255) NULL,
  `userRegisterDate` DATETIME NULL,
  `userLastDate` DATETIME NULL,
  `userStatus` INT NULL,
  PRIMARY KEY (`userId`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb3`.`singer` (
  `singerId` INT NOT NULL AUTO_INCREMENT,
  `singerName` VARCHAR(255) NULL,
  `singerSex` INT NULL,
  `singerThumbnail` VARCHAR(255) NULL,
  `singerIntroduction` VARCHAR(255) NULL,
  PRIMARY KEY (`singerId`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb3`.`album` (
  `albumId` INT NOT NULL AUTO_INCREMENT,
  `singerId` INT NOT NULL,
  `albumTitle` NVARCHAR(255) NULL,
  `albumPic` NVARCHAR(255) NULL,
  `albumPubDate` DATETIME NULL,
  `albumPubCom` NVARCHAR(255) NULL,
  PRIMARY KEY (`albumId`),
  CONSTRAINT `singerId`
    FOREIGN KEY (`singerId`)
    REFERENCES `mydb3`.`singer` (`singerId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb3`.`song` (
  `songId` INT NOT NULL AUTO_INCREMENT,
  `singerId` INT NOT NULL,
  `albumId` INT NOT NULL,
  `songTitle` NVARCHAR(255) NULL,
  `songPlaytimes` INT NULL,
  `songDldtimes` INT NULL,
  `songFile` NVARCHAR(255) NULL,
  PRIMARY KEY (`songId`),
    FOREIGN KEY (`singerId`)
    REFERENCES `mydb3`.`singer` (`singerId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
	FOREIGN KEY (`albumId`)
    REFERENCES `mydb3`.`album` (`albumId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb3`.`comments` (
  `commentId` INT NOT NULL AUTO_INCREMENT,
  `userId` INT NOT NULL,
  `songId` INT NOT NULL,
  `commentText` NVARCHAR(255) NULL,
  `commentDate` DATETIME NULL,
  PRIMARY KEY (`commentId`),
    FOREIGN KEY (`songId`)
    REFERENCES `mydb3`.`song` (`songId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (`userId`)
    REFERENCES `mydb3`.`normaluser` (`userId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;
CREATE TABLE IF NOT EXISTS `mydb3`.`rating`(
`ratingId` INT NOT NULL AUTO_INCREMENT,
`commentId` INT NOT NULL,
`userId` INT NOT NULL,
`songId` INT NOT NULL,
`rating` tinyint(1) unsigned NOT NULL,
`date_entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
PRIMARY KEY (`ratingId`),
	FOREIGN KEY (`commentId`) 
    REFERENCES `mydb3`.`comments` (`commentId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (`songId`)
    REFERENCES `mydb3`.`song` (`songId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (`userId`)
    REFERENCES `mydb3`.`normaluser` (`userId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb3`.`newsong` (
  `newSongId` INT NOT NULL AUTO_INCREMENT,
  `songId` INT NOT NULL,
  PRIMARY KEY (`newSongId`),
    FOREIGN KEY (`songId`)
    REFERENCES `mydb3`.`song` (`songId`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `mydb3`.`normaluseralbum` (
  `userId` INT NOT NULL,
  `albumId` INT NOT NULL,
  PRIMARY KEY (`userId`, `albumId`),
    FOREIGN KEY (`userId`)
    REFERENCES `mydb3`.`normaluser` (`userId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (`albumId`)
    REFERENCES `mydb3`.`album` (`albumId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb3`.`normalusersinger` (
  `userId` INT NOT NULL,
  `singerId` INT NOT NULL,
  PRIMARY KEY (`userId`, `singerId`),
    FOREIGN KEY (`userId`)
    REFERENCES `mydb3`.`normaluser` (`userId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (`singerId`)
    REFERENCES `mydb3`.`singer` (`singerId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb3`.`normalusersong` (
  `userId` INT NOT NULL,
  `songId` INT NOT NULL,
  PRIMARY KEY (`userId`, `songId`),
    FOREIGN KEY (`songId`)
    REFERENCES `mydb3`.`song` (`songId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (`userId`)
    REFERENCES `mydb3`.`normaluser` (`userId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `mydb3`.`recommend` (
  `recmdId` INT NOT NULL AUTO_INCREMENT,
  `songId` INT NOT NULL,
  PRIMARY KEY (`recmdId`),
    FOREIGN KEY (`songId`)
    REFERENCES `mydb3`.`song` (`songId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO mydb3.`admin` (adminId, adminUsername, adminPassword, adminRegisterDate, adminLastDate) VALUES (1, 'admin', '123456', '2022-11-27', '2022-11-28');
