package com.java_work.controller.Article;

import com.java_work.entities.ArticleInfo;
import com.java_work.entities.PageBean;
import com.java_work.service.ArticleInfoService;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

/**
 * 根据文章标题进行搜索 并且 进行分页  判断是管理员还是普通用户
 * @author Bpvank
 */
@WebServlet("/article/search/title")
public class ShowArticleInfoByArticleTitlePageServlet extends HttpServlet {
    ArticleInfoService service = new ArticleInfoService();
    //转换为json数据
    ObjectMapper mapper = new ObjectMapper();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        String msg = "";
        int code;
        //1、获取参数
        Integer currentPage = Integer.valueOf(request.getParameter("currentPage"));//当前的页码
        Integer pageSize = Integer.valueOf(request.getParameter("pageSize"));//每页显示的条数
        Integer userType = Integer.valueOf(request.getParameter("userType")); // 用户类型
        Integer userId = Integer.valueOf(request.getParameter("userId")); // 用户id
        String articleTitle = request.getParameter("articleTitle"); // 文章标题
        //2：调用service查询
        PageBean<ArticleInfo> pb = null;
        if (userType == 0) { // 管理员
            pb = service.findStudentByPage2(currentPage, pageSize, articleTitle, null);//得到分页输出结果
        } else {// 普通用户
            pb = service.findStudentByPage2(currentPage, pageSize, articleTitle, userId);//得到分页输出结果
        }
        HashMap<Object, Object> map = new HashMap<>();

        if (pb != null) {
            // 成功
            msg = "成功";
            map.put("data", pb);
            code = 0;
        } else {
            // 失败
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
