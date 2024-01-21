package com.fit.nlu.DHHCeramic.controller.admin.category;

import com.fit.nlu.DHHCeramic.services.CategoryService;
import com.fit.nlu.DHHCeramic.services.impl.CategoryServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = {"/Admin/cate/delete"})
public class CateDeleteController extends HttpServlet {
    CategoryService cateService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        cateService.delete(Integer.parseInt(id));
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("account") != null) {
            response.sendRedirect(request.getContextPath() + "/Admin/cate/list");

        } else {
            response.sendRedirect(request.getContextPath() + "/AdminLogin");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
