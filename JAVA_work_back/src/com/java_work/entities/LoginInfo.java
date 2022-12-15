package com.java_work.entities;

import java.util.Date;

/**
 * 登录管理表
 *
 * @author 刘辉 王子荀 鲁哲豪
 */
public class LoginInfo {
    private Integer loginId; // 登录编号
    private Date loginTime; // 注册时间

    public Integer getLoginId() {
        return loginId;
    }

    public void setLoginId(Integer loginId) {
        this.loginId = loginId;
    }

    public Date getLoginTime() {
        return loginTime;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    @Override
    public String toString() {
        return "LoginInfo{" +
                "loginId=" + loginId +
                ", loginTime=" + loginTime +
                '}';
    }
}
