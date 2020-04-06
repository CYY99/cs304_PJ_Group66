package com.example.eurekaconsumer.controller;
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

}
