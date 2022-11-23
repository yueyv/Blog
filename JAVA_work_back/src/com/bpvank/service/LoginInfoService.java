package com.bpvank.service;

import com.bpvank.dao.LoginInfoDao;
import com.bpvank.dao.impl.LoginInfoDaoImpl;
import com.bpvank.entities.ArticleInfo;
import com.bpvank.entities.LoginInfo;

/**
 * 功能说明
 *
 * @author Bpvank
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
