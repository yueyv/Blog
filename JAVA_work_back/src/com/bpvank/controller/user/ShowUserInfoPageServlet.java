package com.bpvank.controller.user;

import com.bpvank.entities.PageBean;
import com.bpvank.entities.UrlInfo;
import com.bpvank.entities.UserInfo;
import com.bpvank.service.UrlInfoService;
import com.bpvank.service.UserInfoService;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

/**
 * 查询所有链接信息，分页，可带查询条件   搜索内容
 * @author Bpvank
 */
@WebServlet("/user/page/findby")
public class ShowUserInfoPageServlet extends HttpServlet {
    UserInfoService service = new UserInfoService();
    //转换为json数据
    ObjectMapper mapper = new ObjectMapper();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        String msg = "";
        int code;
        //1、获取参数
        String currentPage = request.getParameter("currentPage");//当前的页码
        String pageSize = request.getParameter("pageSize");//每页显示的条数
        String searchContent = request.getParameter("searchContent");
        //2：调用service查询
        PageBean<UserInfo> pb = service.findStudentByPage(Integer.parseInt(currentPage), Integer.parseInt(pageSize), searchContent);//得到分页输出结果
        HashMap<Object, Object> map = new HashMap<>();

        if (pb != null) {
            // 添加成功
            msg = "成功";
            map.put("data", pb);
            code = 0;
        } else {
            // 添加失败
            msg = "失败";
            code = 1;
        }
        map.put("msg", msg);
        map.put("code", code);
        //3:把pageBean存入request
        mapper.writeValue(resp.getWriter(), map);
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
