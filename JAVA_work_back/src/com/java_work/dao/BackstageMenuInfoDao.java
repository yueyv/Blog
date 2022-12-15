package com.java_work.dao;

import com.java_work.entities.BackstageMenuInfo;

import java.util.List;

/**
 * 功能说明
 *
 * @author 刘辉 王子荀 鲁哲豪
 * @date 2022-07-20 10:21:12
 */
public interface BackstageMenuInfoDao {
    // 获取后台菜单全部信息
    List<BackstageMenuInfo> getAllBackstageMenuInfo();

    // 通过用户权限获取后台菜单全部信息
    List<BackstageMenuInfo> getBackstageMenuInfo(Integer userType);
}
