package com.example.eurekaconsumer.entity;

import java.util.List;

public class RequestEntity {
    private String gameId;
    private String acconutId;
    private int max;
    private int min;
    private String type;
    private String gender;
    private List<String> column;
    private String columnString;

    public String getColumnString() {
        return columnString;
    }

    public void setColumnString(String columnString) {
        this.columnString = columnString;
    }

    public List<String> getColumn() {
        return column;
    }

    public void setColumn(List<String> column) {
        this.column = column;
    }

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
