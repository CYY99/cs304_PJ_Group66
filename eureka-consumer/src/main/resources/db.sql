CREATE TABLE User_Account(
    `account_ID`           VARCHAR(20),
    `gender`              VARCHAR(20),
    `registeration_Date`   DATE            NOT NULL ,
    `birth_Date`           DATE            NOT NULL ,
    `age`                 INTEGER         NOT NULL ,
    `account_Name`         VARCHAR(50),
    PRIMARY KEY (`account_ID`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


CREATE TABLE Joined_Membership(
    `membership_ID`       VARCHAR(20),
    `status`              VARCHAR(20),
    `fee_PerMonth`         REAL,
    `data_Joined`          DATE,
    `account_ID`           VARCHAR(20)    NOT NULL,
    PRIMARY KEY (`membership_ID`),
    FOREIGN KEY (`account_ID`) REFERENCES User_Account (`account_ID`) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=INNODB DEFAULT CHARSET=utf8;


CREATE TABLE Developer(
    `developer_ID`       VARCHAR(20)    ,
    `developer_Name`      VARCHAR(20)    NOT NULL,
    PRIMARY KEY (`developer_ID`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


CREATE TABLE Developed_Games(
    `game_ID`             VARCHAR(20)    NOT NULL,
    `game_Type`            VARCHAR(20)    NOT NULL,
    `gName`              VARCHAR(20)    NOT NULL,
    `ageLimit`            INTEGER         NOT NULL,
    `price`               REAL          NOT NULL,
    `publish_Date`         DATE            NOT NULL,
    `developer_ID`         VARCHAR(20)    NOT NULL,
    PRIMARY KEY (`game_ID`),
    FOREIGN KEY (`developer_ID`) REFERENCES Developer (`developer_ID`) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=INNODB DEFAULT CHARSET=utf8;


CREATE TABLE Purchase_Record(
    `record_ID`            VARCHAR(20)    NOT NULL,
    `purchase_Date`        DATE            NOT NULL,
    `amount_Paid`          REAL          NOT NULL,
    PRIMARY KEY (`record_ID`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;


CREATE TABLE Purchase(
    `account_ID`           VARCHAR(20)    NOT NULL,
    `game_ID`              VARCHAR(20)    NOT NULL,
    `record_ID`            VARCHAR(20)    NOT NULL,
    PRIMARY KEY (`account_ID`,`game_ID`,`record_ID`),
    FOREIGN KEY (`account_ID`) REFERENCES User_Account (`account_ID`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`record_ID`) REFERENCES Purchase_Record (`record_ID`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`game_ID`) REFERENCES Developed_Games (`game_ID`) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=INNODB DEFAULT CHARSET=utf8;








