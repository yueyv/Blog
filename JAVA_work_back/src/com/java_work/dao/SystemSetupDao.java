package com.java_work.dao;
import com.java_work.entities.SystemSetup;

import java.util.List;

/**
 * 系统设置
 * @author 刘辉 王子荀 鲁哲豪
 */
public interface SystemSetupDao {
    // 查询全站的系统设置
    List<SystemSetup> getAllSystemSetup();

    // 修改系统设置
    int updateSystemSetup(SystemSetup systemSetup);
}
