package com.example.eurekaconsumer.controller;
import com.example.eurekaconsumer.entity.JoinTableEntity;
import com.example.eurekaconsumer.entity.JoinedMembershipEntity;
import com.example.eurekaconsumer.entity.RequestEntity;
import com.example.eurekaconsumer.entity.UserAccountEntity;
import com.example.eurekaconsumer.service.GameService;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.List;



@RestController
public class WelcomeController {

    @Autowired
    RestTemplate restTemplate;

    @Autowired
    private GameService gameService;


    @RequestMapping("/queryUserAccountData")
    @ResponseBody
    public List<UserAccountEntity>  selectUserAccountAll(){
        List<UserAccountEntity> data =  gameService.selectUserAccountAll();
        return data;
    }

    @RequestMapping("/queryDivision")
    @ResponseBody
    public List<UserAccountEntity>  queryDivision(){
        List<UserAccountEntity> data =  gameService.queryDivision();
        return data;
    }

    @RequestMapping("/queryAggregationAccountData")
    @ResponseBody
    public List<UserAccountEntity>  queryAggregationAccountData(@RequestBody RequestEntity requestEntity){
        List<UserAccountEntity> data = null;
        if ("true".equals(requestEntity.getGender())) {
            data =  gameService.queryAggregationData(requestEntity);
        }else {
            requestEntity.setGender("''");
            data =  gameService.queryUserAccountData(requestEntity);
        }
        return data;
    }

    @RequestMapping("/queryMembershipData")
    @ResponseBody
    public List<JoinedMembershipEntity>  selectMembershipAll(){
        List<JoinedMembershipEntity> data =  gameService.selectMembershipAll();
        return data;
    }

    @RequestMapping(method = RequestMethod.POST, path = "/selectionUserAccountData")
    @ResponseBody
    public List<UserAccountEntity> selectionUserAccountData(@RequestBody RequestEntity requestEntity){
        return gameService.queryUserAccountData(requestEntity);
    }

    @RequestMapping(method = RequestMethod.POST, path = "/delteAccount")
    @ResponseBody
    public void delteAccount(@RequestBody RequestEntity requestEntity){
        gameService.deldteUserAccount(requestEntity.getAcconutId());
    }

    @RequestMapping(method = RequestMethod.POST, path = "/insertAccount")
    @ResponseBody
    public void delteAccount(@RequestBody UserAccountEntity userAccountEntity){
        gameService.insertAccount(userAccountEntity);
    }

    @RequestMapping(method = RequestMethod.POST, path = "/updateAccount")
    @ResponseBody
    public void updateAccount(@RequestBody UserAccountEntity userAccountEntity){
        gameService.updateAccount(userAccountEntity);
    }

    @RequestMapping(method = RequestMethod.POST, path = "/getJoinTableData")
    @ResponseBody
    public List<JoinTableEntity> joinTable(@RequestBody RequestEntity requestEntity){
        return gameService.joinTable(requestEntity);
    }
}
