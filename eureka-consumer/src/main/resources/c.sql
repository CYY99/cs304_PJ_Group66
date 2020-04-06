
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

	SELECT ${aggregationTpye}(`age`)
	  FROM User_Account
