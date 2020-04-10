package com.example.eurekaconsumer.service.impl;

import com.example.eurekaconsumer.dao.GameDao;
import com.example.eurekaconsumer.entity.*;
import com.example.eurekaconsumer.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GameServiceImpl implements GameService {


    @Autowired
    private GameDao GameDao;

    @Override
    public List<UserAccountEntity> queryDivision() {
        return GameDao.queryDivision();
    }

    @Override
    public List<UserAccountEntity> queryUserAccountData(RequestEntity requestEntity) {
        return GameDao.queryUserAccountData(requestEntity);
    }

    @Override
    public List<UserAccountEntity> queryAggregationData(RequestEntity requestEntity) {
        return GameDao.queryAggregationData(requestEntity);
    }

    @Override
    public List<JoinTableEntity> joinTable(RequestEntity requestEntity) {
        List<String> columnList =  requestEntity.getColumn();
        StringBuffer colmunString = new StringBuffer();
        for(String col :columnList){
            if (col.equals("accountId")) {
                colmunString.append("ua.`"+getColumnName(col)+"` "+col+",");
            } else if (col.equals("registerDate")) {
                colmunString.append("ua.`registeration_Date` "+col+",");
            }
            else {
                colmunString.append("`"+getColumnName(col)+"` "+col+",");
            }

        }
        colmunString.deleteCharAt(colmunString.length() - 1);
        requestEntity.setColumnString(colmunString.toString());
        return GameDao.joinTable(requestEntity);
    }

    private String getColumnName(String cols){
        switch (cols) {
            case "accountId":
                return "account_ID";
            case "gender":
                return "gender";
            case "registerDate":
                return "register_Date";
            case "birthDate":
                return "birth_Date";
            case "age":
                return "age";
            case "accountName":
                return "account_Name";
            case "membershipID":
                return "membership_ID";
            case "status":
                return "status";
            case "feePerMonth":
                return "fee_PerMonth";
            case "dataJoined":
                return "data_Joined";
        }
        return cols;
    }

    /**
     * 给用户添加游戏购买记录
     * @return
     */
    @Override
    public void insertPurchaseRecord(PurchaseRecordEntity purchaseRecordEntity){
        GameDao.insertPurchaseRecord(purchaseRecordEntity);
    }

    /**
     * 给用户添加游戏
     * @return
     */
    @Override
    public void insertPurchase(PurchaseEntity purchaseEntity){
        GameDao.insertPurchase(purchaseEntity);
    }

    /**
     * 删除用户游戏（保留用户购买记录，因为购买记录比较重要不建议删除）
     * @return
     */
    @Override
    public void deletePubchaseRecord(String gameId){
        GameDao.deletePubchaseRecord(gameId);
    }

    /**
     * 添加用户
     * @return
     */
    @Override
    public void insertUserAccount(UserAccountEntity userAccount){
        GameDao.insertUserAccount(userAccount);
    }

    /**
     * 删除用户
     */
    @Override
    public void deleteUserAccount(String accountID){
        GameDao.deleteUserAccount(accountID);
    }

    /**
     * 查看所有用户
     * @return
     */
    @Override
    public List<UserAccountEntity> selectUserAccountAll(){
        return GameDao.selectUserAccountAll();
    }

    /**
     * 查看所有会员列表
     * @return
     */
    @Override
    public List<JoinedMembershipEntity> selectMembershipAll(){
        return GameDao.selectMembershipAll();
    }

    /**
     * 根据用户名查询
     * @return
     */
    @Override
    public UserAccountEntity selectUserAccount(String accountName){
        return GameDao.selectUserAccount(accountName);
    }

    /**
     * 聚合操作
     * @return
     */
    @Override
    public List<UserAccountEntity> selectUserByAggregationTpye(String aggregationTpye){
        return GameDao.selectUserByAggregationTpye(aggregationTpye);
    }

    /**
     * 删除用户
     */
    @Override
    public void deldteUserAccount(String acconutId) {
        GameDao.deldteUserAccount(acconutId);
    }

    @Override
    public void insertAccount(UserAccountEntity userAccountEntity) {
        GameDao.insertAccount(userAccountEntity);
    }

    @Override
    public void updateAccount(UserAccountEntity userAccountEntity) {
        GameDao.updateAccount(userAccountEntity);
    }
}
