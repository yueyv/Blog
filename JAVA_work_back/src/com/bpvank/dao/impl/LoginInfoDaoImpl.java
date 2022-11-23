package com.bpvank.dao.impl;

import com.bpvank.dao.LoginInfoDao;
import com.bpvank.entities.LoginInfo;
import com.bpvank.util.JDBCUtils;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 * 功能说明
 *
 * @author Bpvank
 * @date 2022-08-05 16:39:02
 */
public class LoginInfoDaoImpl implements LoginInfoDao {
    JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public int insertLoginInfo(Integer userId) {
        String sql = "insert into loginInfo(loginId) value (?)";
        int i = jdbcTemplate.update(sql, userId);
        return i;
    }
}
