package com.example.eurekaconsumer.dao;

import com.example.eurekaconsumer.entity.*;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface GameDao {
    List<UserAccountEntity> queryDivision();

    List<UserAccountEntity> queryUserAccountData(RequestEntity requestEntity);

    List<UserAccountEntity> queryAggregationData(RequestEntity requestEntity);

    List<JoinTableEntity> joinTable(RequestEntity requestEntity);

    /**
     * 给用户添加游戏购买记录
     * @return
     */
    void insertPurchaseRecord(PurchaseRecordEntity purchaseRecordEntity);
    /**
     * 给用户添加游戏
     * @return
     */
    void insertPurchase(PurchaseEntity purchaseEntity);


    /**
     * 删除用户游戏（保留用户购买记录，因为购买记录比较重要不建议删除）
     * @return
     */
    void deletePubchaseRecord(String gameId);


    /**
     * 添加用户
     * @return
     */
    void insertUserAccount(UserAccountEntity userAccount);

    /**
     * 删除用户
     */
    void deleteUserAccount(String accountID);

    /**
     * 查看所有用户
     * @return
     */
    List<UserAccountEntity> selectUserAccountAll();

    /**
     * 查看所有会员列表
     * @return
     */
    List<JoinedMembershipEntity> selectMembershipAll();

    /**
     * 根据用户名查询
     * @return
     */
    UserAccountEntity selectUserAccount(String accountName);

    /**
     * 聚合操作
     * @return
     */
    List<UserAccountEntity>  selectUserByAggregationTpye(String aggregationTpye);

    /**
     * 删除用户
     */
    void deldteUserAccount(String acconutId);

    void insertAccount(UserAccountEntity userAccountEntity);

    void updateAccount(UserAccountEntity userAccountEntity);

}
