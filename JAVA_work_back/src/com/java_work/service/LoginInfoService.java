package com.java_work.service;

import com.java_work.dao.LoginInfoDao;
import com.java_work.dao.impl.LoginInfoDaoImpl;

/**
 * 功能说明
 *
 * @author 刘辉 王子荀 鲁哲豪
 * @date 2022-08-05 16:40:42
 */
public class LoginInfoService {
    LoginInfoDao dao = new LoginInfoDaoImpl();

    // 添加登录信息
    public Integer insertLoginInfo(Integer userId){
        if (userId == null){
            return -1;
        }
        return dao.insertLoginInfo(userId);
    }
}
