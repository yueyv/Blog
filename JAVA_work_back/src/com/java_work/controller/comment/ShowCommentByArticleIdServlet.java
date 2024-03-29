package com.java_work.controller.comment;

import com.java_work.entities.CommentInfo;
import com.java_work.service.CommentInfoService;
import com.java_work.util.CommentUtil;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 根据文章id查询文章对应的评论
 * @author Bpvank
 */
@WebServlet("/showCommentByArticleId")
public class ShowCommentByArticleIdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("application/json;charset=utf-8");
        String articleId = req.getParameter("articleId");
        CommentInfoService service = new CommentInfoService();
        List<CommentInfo> allCommentList = service.getCommentByArticleId(Integer.valueOf(articleId));
        List<CommentInfo> list = CommentUtil.recursionMethod(allCommentList);
        // 将map转换为json，并传递给客户端
        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(resp.getWriter(), list);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
