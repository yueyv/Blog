package com.bpvank.dao;
import com.bpvank.entities.SystemSetup;

import java.util.List;

/**
 * 系统设置
 * @author Bpvank
 */
public interface SystemSetupDao {
    // 查询全站的系统设置
    List<SystemSetup> getAllSystemSetup();

    // 修改系统设置
    int updateSystemSetup(SystemSetup systemSetup);
}