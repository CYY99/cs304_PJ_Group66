package com.example.eurekaconsumer.entity;

import java.util.Date;

public class DevelopedGamesEntity {
    private  String gameID;
    private  String gameType;
    private  String gName;
    private  int ageLimit;
    private  double price;
    private  Date publishDate;
    private  String developerID;

    public String getGameID() {
        return gameID;
    }

    public void setGameID(String gameID) {
        this.gameID = gameID;
    }

    public String getGameType() {
        return gameType;
    }

    public void setGameType(String gameType) {
        this.gameType = gameType;
    }

    public String getgName() {
        return gName;
    }

    public void setgName(String gName) {
        this.gName = gName;
    }

    public int getAgeLimit() {
        return ageLimit;
    }

    public void setAgeLimit(int ageLimit) {
        this.ageLimit = ageLimit;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
    }

    public String getDeveloperID() {
        return developerID;
    }

    public void setDeveloperID(String developerID) {
        this.developerID = developerID;
    }
}
