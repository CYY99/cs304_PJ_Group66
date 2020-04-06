package com.example.eurekaconsumer.entity;

public class RequestEntity {
    private String gameId;
    private String acconutId;
    private int max;
    private int min;
    private String type;
    private String gender;

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }

    public String getAcconutId() {
        return acconutId;
    }

    public void setAcconutId(String acconutId) {
        this.acconutId = acconutId;
    }

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public int getMin() {
        return min;
    }

    public void setMin(int min) {
        this.min = min;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
