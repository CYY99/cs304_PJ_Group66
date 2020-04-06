package com.example.eurekaconsumer.entity;

import java.util.Date;

public class JoinedMembershipEntity {
    private  String membershipID;
    private  String status;
    private  double feePerMonth;
    private  Date dataJoined;
    private  String accountID;

    public String getMembershipID() {
        return membershipID;
    }

    public void setMembershipID(String membershipID) {
        this.membershipID = membershipID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getFeePerMonth() {
        return feePerMonth;
    }

    public void setFeePerMonth(double feePerMonth) {
        this.feePerMonth = feePerMonth;
    }

    public Date getDataJoined() {
        return dataJoined;
    }

    public void setDataJoined(Date dataJoined) {
        this.dataJoined = dataJoined;
    }

    public String getAccountID() {
        return accountID;
    }

    public void setAccountID(String accountID) {
        this.accountID = accountID;
    }
}
