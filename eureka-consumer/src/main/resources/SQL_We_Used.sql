	-- note: all the sql we used are here, 
	-- some of them are written in a dynamic way 
	-- so it's not possible to write all the possibilities for it. 
	
	INSERT INTO Purchase_Record(`record_ID`,`purchase_Date`,`amount_Paid`)
	VALUES (
		CONCAT('p',UNIX_TIMESTAMP(NOW())),
		#{purchaseRecord.purchaseDate,jdbcTpye=DATE},
		#{purchaseRecord.amountPaid,jdbcTpye=REAL}
	)


	INSERT INTO Purchase(`account_ID`,`game_ID`,`record_ID`)
	VALUES (
		#{purchaseRecord.accountID,jdbcTpye=VARCHAR},
		#{purchaseRecord.gameID,jdbcTpye=VARCHAR},
		#{purchaseRecord.recordID,jdbcTpye=VARCHAR},
	)


	DELETE FROM Purchase_Record
	WHERE `record_ID` = (
		SELECT `record_ID`
		FROM Purchase
		WHERE `game_ID` = #{gameId,jdbcTpye=VARCHAR}
		)


	INSERT INTO User_Account(`account_ID`,`gender`,`registeration_Date`,`age`,`account_Name`)
	VALUES (
		CONCAT('a',UNIX_TIMESTAMP(NOW())),
		#{userAccount.gender,jdbcTpye=VARCHAR},
		#{userAccount.registeration_Date,jdbcTpye=VARCHAR},
		#{userAccount.age,jdbcTpye=VARCHAR},
		#{userAccount.account_Name,jdbcTpye=VARCHAR}
	)

	DELETE FROM User_Account
	WHERE `account_ID` = #{accountID,jdbcTpye=VARCHAR}


	SELECT (`account_ID`,
		`gender`,
		`registeration_Date`,
		`age`,
		`account_Name`)
	  FROM User_Account


	SELECT (`membership_ID`,
		`status`,
		`fee_PerMonth`,
		`data_Joined`,
		`account_ID`)
	  FROM Joined_Membership


	SELECT (`account_ID`,
		`gender`,
		`registeration_Date`,
		`age`,
		`account_Name`)
	  FROM User_Account
	 WHERE `account_Name` = #{accountName,jdbcTpye=VARCHAR}


	SELECT ${aggregationType}(`age`)
	  FROM User_Account


	UPDATE Developed_Games
	SET  `price` = 5
	WHERE `price` <= 15


	UPDATE Developed_Games
	SET `price` = `price` - 10
	WHERE age > 15


	UPDATE Purchase_Record
	SET `amount_Paid` = 0
	WHERE  `purchase_Date` > `1998-05-20 16:00:00`


	UPDATE Developed_Games
	SET `ageLimit` = 19
	WHERE `price` > 100


	SELECT min(`price`), `ageLimit`
	FROM Developed_Games
	GROUP BY `ageLimit`
	HAVING COUNT(*) > 2


	SELECT `account_Name`
	FROM Purchase p, User_Account u, Purchase_Record pr
	WHERE p.`account_ID` = u.`account_ID` AND p.`record_ID` = pr.`record_ID`
				AND p.`amount_Paid` = (SELECT max(p2.`amount_Paid`)
															 FROM Purchase2 p2)


	SELECT DISTINCT `account_Name`,max(`amount_Paid`)
	FROM Purchase_Record,User_Account
	WHERE `gender`= 'female'
	


	SELECT `game_Type`,max(`price`)
	FROM Developed_Games
	WHERE `ageLimit`> 20
	GROUP BY `game_Type`
	


	SELECT `account_Name`
	FROM User_Account U
	WHERE NOT EXISTS (SELECT `game_ID`
										FROM Developed_Games D
										WHERE NOT EXISTS (SELECT P.`account_ID`
																			FROM Purchase P
																			WHERE P.`game_ID` = D.`game_ID`
																			AND P.`account_ID` = U.`account_ID`))
