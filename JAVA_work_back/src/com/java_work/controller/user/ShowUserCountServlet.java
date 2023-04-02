package com.java_work.controller.user;

import com.java_work.service.UserInfoService;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 功能说明
 *
 * @author Bpvank
 * @date 2022-08-02 19:59:43
 */
@WebServlet("/user/showUserCount")
public class ShowUserCountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json;charset=utf-8");
        //插入到数据库
        UserInfoService service = new UserInfoService();
        int i = service.getUserCount();
        // 将map转换为json，并传递给客户端
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(resp.getWriter(), i);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}