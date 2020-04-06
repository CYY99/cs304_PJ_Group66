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
    public List<UserAccountEntity> queryUserAccountData(RequestEntity requestEntity) {
        return GameDao.queryUserAccountData(requestEntity);
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



}
