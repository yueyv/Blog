package com.bpvank.service;

import com.bpvank.dao.SystemSetupDao;
import com.bpvank.dao.impl.SystemSetupDaoImpl;
import com.bpvank.entities.SystemSetup;

import java.util.List;

/**
 * 功能说明
 *
 * @author Bpvank
 * @date 2022-08-04 19:07:49
 */
public class SystemSetupService {
    SystemSetupDao dao = new SystemSetupDaoImpl();

    // 查询全站的系统设置
    public List<SystemSetup> getAllSystemSetup() {
        return dao.getAllSystemSetup();
    }

    // 修改系统设置
    public int updateSystemSetup(SystemSetup systemSetup) {
        if (systemSetup == null){
            return -1;
        }
        return dao.updateSystemSetup(systemSetup);
    }
}