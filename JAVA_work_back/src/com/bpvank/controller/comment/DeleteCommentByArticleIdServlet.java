package com.bpvank.controller.comment;

import com.bpvank.service.CommentInfoService;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

/**
 * 根据文章id删除评论
 * @author Bpvank
 */
@WebServlet("/comment/deleteByArticleId")
public class DeleteCommentByArticleIdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer articleId = Integer.valueOf(req.getParameter("articleId"));
        System.out.println(articleId);
        CommentInfoService service = new CommentInfoService();
        int i = service.deleteCommentByArticleId(articleId);
    }
}

