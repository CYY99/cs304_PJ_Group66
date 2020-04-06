CREATE TABLE User_Account(
    `account_ID`           VARCHAR(20),
    `gender`               VARCHAR(20),
    `registeration_Date`   DATE            NOT NULL ,
    `birth_Date`           DATE            NOT NULL ,
    `age`                  INTEGER         NOT NULL ,
    `account_Name`         VARCHAR(50),
    `delete_flag`          VARCHAR(20)     NOT NULL DEFAULT 'N' COMMENT 'Y is delete ,N is alive',
    PRIMARY KEY (`account_ID`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO User_Account VALUES ('U1001', 'male',   '2020-01-01', '1999-07-06', 20, 'SurkorDie', 'N');

INSERT INTO User_Account VALUES ('U1002', 'male',   '2020-01-02', '1989-04-05', 31, 'DKB', 		 'N');

INSERT INTO User_Account VALUES ('U1003', 'female', '2020-01-03', '1998-05-01', 21, 'YM',        'N');

INSERT INTO User_Account VALUES ('U1004', 'female', '2020-01-04', '1997-01-01', 22, 'CXK',       'N');

INSERT INTO User_Account VALUES ('U1005', 'male',   '2020-01-05', '1990-01-01', 29, 'XJP',       'N');
     
	 
CREATE TABLE Joined_Membership(
    `membership_ID`        VARCHAR(20),
    `status`               VARCHAR(20),
    `fee_PerMonth`         REAL,
    `data_Joined`          DATE,
    `account_ID`           VARCHAR(20)     NOT NULL ,
    PRIMARY KEY (`membership_ID`),
    FOREIGN KEY (`account_ID`) REFERENCES User_Account (`account_ID`) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO Joined_Membership VALUES ('M2001', 'valid',    9.9,   '2020-01-01',  'U1001');

INSERT INTO Joined_Membership VALUES ('M2002', 'valid',   19.9,   '2019-01-01',  'U1001');

INSERT INTO Joined_Membership VALUES ('M2003', 'invalid',  0.1,   '2018-01-01',  'U1002');

INSERT INTO Joined_Membership VALUES ('M2004', 'valid',      5,   '2015-01-05',  'U1003');

INSERT INTO Joined_Membership VALUES ('M2005', 'invalid',  9.9,   '2017-01-01',  'U1004');

INSERT INTO Joined_Membership VALUES ('M2006', 'valid',   19.9,   '2020-04-05',  'U1001');


CREATE TABLE Developer(
    `developer_ID`         VARCHAR(20),
    `developer_Name`       VARCHAR(20)     NOT NULL,
    PRIMARY KEY (`developer_ID`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO Developer VALUES ('D3001', 'Tommy');

INSERT INTO Developer VALUES ('D3002', 'MidnightCow');

INSERT INTO Developer VALUES ('D3003', 'Jackey');

INSERT INTO Developer VALUES ('D3004', 'Tompson');

INSERT INTO Developer VALUES ('D3005', 'Marry');



CREATE TABLE Developed_Games(
    `game_ID`              VARCHAR(20)     NOT NULL,
    `game_Type`            VARCHAR(20)     NOT NULL,
    `gName`                VARCHAR(20)     NOT NULL,
    `ageLimit`             INTEGER         NOT NULL,
    `price`                REAL            NOT NULL,
    `publish_Date`         DATE            NOT NULL,
    `developer_ID`         VARCHAR(20)     NOT NULL,
    PRIMARY KEY (`game_ID`),
    FOREIGN KEY (`developer_ID`) REFERENCES Developer (`developer_ID`) ON UPDATE CASCADE ON DELETE CASCADE
)ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO Developed_Games VALUES ('G4001', 'RPG',  'GTA5',   18, 20,  '2015-04-05', 'D3001');

INSERT INTO Developed_Games VALUES ('G4002', 'RPG',  'Saint3', 18, 15,  '2013-01-05', 'D3001');

INSERT INTO Developed_Games VALUES ('G4003', 'HOR',  'Killer', 3,  25,  '2012-01-05', 'D3005');

INSERT INTO Developed_Games VALUES ('G4004', 'MOBA', 'LOL',    14, 0,   '2011-01-05', 'D3003');

INSERT INTO Developed_Games VALUES ('G4005', 'RPG',  'MYLIFE', 3,  100, '2019-01-05', 'D3004');

INSERT INTO Developed_Games VALUES ('G4006', 'HOR',  'RE7',    18, 300, '2020-04-05', 'D3001');

INSERT INTO Developed_Games VALUES ('G4007', 'MOBA', 'DOTA2',  0,  10,  '2018-01-05', 'D3005');

INSERT INTO Developed_Games VALUES ('G4008', 'RPG',  'PUBG',   50, 105, '1900-04-05', 'D3002');
 
INSERT INTO Developed_Games VALUES ('G4009', 'STY',  'Red3',   20, 5,   '2007-01-05', 'D3002');



CREATE TABLE Purchase_Record(
    `record_ID`            VARCHAR(20)     NOT NULL,
    `purchase_Date`        DATE            NOT NULL,
    `amount_Paid`          REAL            NOT NULL,
    PRIMARY KEY (`record_ID`)
)ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO Purchase_Record VALUES ('R5001', '2008-04-05', 300);

INSERT INTO Purchase_Record VALUES ('R5002', '2015-01-05', 250);

INSERT INTO Purchase_Record VALUES ('R5003', '1900-04-05', 330);

INSERT INTO Purchase_Record VALUES ('R5004', '2019-01-05', 350);

INSERT INTO Purchase_Record VALUES ('R5005', '2008-04-05', 15);


CREATE TABLE Purchase(
    `account_ID`           VARCHAR(20)     NOT NULL,
    `game_ID`              VARCHAR(20)     NOT NULL,
    `record_ID`            VARCHAR(20)     NOT NULL,
    `delete_flag`  		   VARCHAR(20)     NOT NULL DEFAULT 'N' COMMENT 'Y is delete ,N is alive',
    PRIMARY KEY (`account_ID`,`game_ID`,`record_ID`),
    FOREIGN KEY (`account_ID`) REFERENCES User_Account (`account_ID`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`record_ID`) REFERENCES Purchase_Record (`record_ID`) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (`game_ID`) REFERENCES Developed_Games (`game_ID`) ON UPDATE CASCADE ON DELETE CASCADE
	
)ENGINE=INNODB DEFAULT CHARSET=utf8;

INSERT INTO Purchase VALUES ('U1001', 'G4001', 'R5001', 'N');

INSERT INTO Purchase VALUES ('U1001', 'G4002', 'R5003', 'N');

INSERT INTO Purchase VALUES ('U1001', 'G4003', 'R5002', 'N');

INSERT INTO Purchase VALUES ('U1001', 'G4004', 'R5004', 'N');

INSERT INTO Purchase VALUES ('U1001', 'G4005', 'R5004', 'N');

INSERT INTO Purchase VALUES ('U1001', 'G4006', 'R5005', 'N');

INSERT INTO Purchase VALUES ('U1001', 'G4007', 'R5004', 'N');

INSERT INTO Purchase VALUES ('U1001', 'G4008', 'R5003', 'N');

INSERT INTO Purchase VALUES ('U1001', 'G4009', 'R5003', 'N');

INSERT INTO Purchase VALUES ('U1002', 'G4005', 'R5002', 'N');

INSERT INTO Purchase VALUES ('U1005', 'G4008', 'R5003', 'N');








