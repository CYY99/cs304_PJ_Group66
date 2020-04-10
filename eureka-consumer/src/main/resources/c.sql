	/**
	 * 给用户添加游戏购买记录
	 * @return
	 */
	INSERT INTO Purchase_Record(`record_ID`,`purchase_Date`,`amount_Paid`)
	VALUES (
		CONCAT('p',UNIX_TIMESTAMP(NOW())),
		#{purchaseRecord.purchaseDate,jdbcTpye=DATE},
		#{purchaseRecord.amountPaid,jdbcTpye=REAL}
	)

	/**
	 * 给用户添加游戏
	 * @return
	 */
	INSERT INTO Purchase(`account_ID`,`game_ID`,`record_ID`)
	VALUES (
		#{purchaseRecord.accountID,jdbcTpye=VARCHAR},
		#{purchaseRecord.gameID,jdbcTpye=VARCHAR},
		#{purchaseRecord.recordID,jdbcTpye=VARCHAR},
	)

	/**
	 * 删除用户游戏（保留用户购买记录，因为购买记录比较重要不建议删除）
	 * @return
	 */
	DELETE FROM Purchase_Record
	WHERE `record_ID` = (
		SELECT `record_ID`
		FROM Purchase
		WHERE `game_ID` = #{gameId,jdbcTpye=VARCHAR}
		)

	/**
	 * 添加用户
	 * @return
	 */
	INSERT INTO User_Account(`account_ID`,`gender`,`registeration_Date`,`age`,`account_Name`)
	VALUES (
		CONCAT('a',UNIX_TIMESTAMP(NOW())),
		#{userAccount.gender,jdbcTpye=VARCHAR},
		#{userAccount.registeration_Date,jdbcTpye=VARCHAR},
		#{userAccount.age,jdbcTpye=VARCHAR},
		#{userAccount.account_Name,jdbcTpye=VARCHAR}
	)

	/**
	 * 删除用户
	 */
	DELETE FROM User_Account
	WHERE `account_ID` = #{accountID,jdbcTpye=VARCHAR}

	/**
	 * 查看所有用户
	 * @return
	 */
	SELECT (`account_ID`,
		`gender`,
		`registeration_Date`,
		`age`,
		`account_Name`)
	  FROM User_Account

	/**
	 * 查看所有会员列表
	 * @return
	 */
	SELECT (`membership_ID`,
		`status`,
		`fee_PerMonth`,
		`data_Joined`,
		`account_ID`)
	  FROM Joined_Membership

	/**
	 * 根据用户名查询
	 * @return
	 */
	SELECT (`account_ID`,
		`gender`,
		`registeration_Date`,
		`age`,
		`account_Name`)
	  FROM User_Account
	 WHERE `account_Name` = #{accountName,jdbcTpye=VARCHAR}

	 /**
	 * 聚合操作
	 * @return
	 */
	SELECT ${aggregationTpye}(`age`)
	  FROM User_Account
