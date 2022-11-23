package com.bpvank.service;

import com.bpvank.dao.BackstageMenuInfoDao;
import com.bpvank.dao.impl.BackstageMenuInfoDaoImpl;
import com.bpvank.dao.impl.UserInfoDaoImpl;
import com.bpvank.entities.BackstageMenuInfo;
import com.bpvank.entities.UserInfo;

import java.util.List;

/**
 * 功能说明
 *
 * @author Bpvank
 * @date 2022-07-20 10:24:44
 */
public class BackstageMenuInfoService {
    BackstageMenuInfoDao dao = new BackstageMenuInfoDaoImpl();

    // 获取后台菜单全部信息
    public List<BackstageMenuInfo> getAllBackstageMenuInfo() {
        return dao.getAllBackstageMenuInfo();
    }

    // 通过用户权限获取后台菜单全部信息
    public List<BackstageMenuInfo> getBackstageMenuInfo(Integer userType) {
        if (userType == null) {
            return null;
        }
        return dao.getBackstageMenuInfo(userType);
    }
}
