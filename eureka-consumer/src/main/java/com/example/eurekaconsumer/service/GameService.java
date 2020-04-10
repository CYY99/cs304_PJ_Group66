package com.example.eurekaconsumer.service;

import com.example.eurekaconsumer.entity.*;

import java.util.List;

 public interface GameService {

    List<UserAccountEntity> queryUserAccountData(RequestEntity requestEntity);

    List<UserAccountEntity> queryAggregationData(RequestEntity requestEntity);

    List<JoinTableEntity> joinTable();

    void insertPurchaseRecord(PurchaseRecordEntity purchaseRecordEntity);


    void insertPurchase(PurchaseEntity purchaseEntity);



    void deletePubchaseRecord(String gameId);



    void insertUserAccount(UserAccountEntity userAccount);

    void deleteUserAccount(String accountID);


    List<UserAccountEntity> selectUserAccountAll();


    List<JoinedMembershipEntity> selectMembershipAll();


    UserAccountEntity selectUserAccount(String accountName);


    List<UserAccountEntity>  selectUserByAggregationTpye(String aggregationTpye);


    void deldteUserAccount(String acconutId);


    void insertAccount(UserAccountEntity userAccountEntity);

    void updateAccount(UserAccountEntity userAccountEntity);
}
