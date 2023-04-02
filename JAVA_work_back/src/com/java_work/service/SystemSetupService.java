package com.java_work.service;

import com.java_work.dao.SystemSetupDao;
import com.java_work.dao.impl.SystemSetupDaoImpl;
import com.java_work.entities.SystemSetup;

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
