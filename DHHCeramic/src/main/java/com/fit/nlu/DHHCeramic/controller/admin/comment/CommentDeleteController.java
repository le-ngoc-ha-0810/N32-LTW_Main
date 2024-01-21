package com.fit.nlu.DHHCeramic.controller.admin.comment;


import com.fit.nlu.DHHCeramic.services.CommentService;
import com.fit.nlu.DHHCeramic.services.impl.CommentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "CommentDeleteController", value = "/Admin/comment/delete")
public class CommentDeleteController extends HttpServlet {
    CommentService commentService = new CommentServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        commentService.delete(Integer.parseInt(id));
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("account") != null) {
            response.sendRedirect(request.getContextPath() + "/Admin/comment/list");
        } else {
            response.sendRedirect(request.getContextPath() + "/AdminLogin");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
