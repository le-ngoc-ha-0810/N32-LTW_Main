package com.fit.nlu.DHHCeramic.controller.admin.user;


import com.fit.nlu.DHHCeramic.model.User;
import com.fit.nlu.DHHCeramic.services.UserService;
import com.fit.nlu.DHHCeramic.services.impl.UserServiceImpl;
import com.fit.nlu.DHHCeramic.util.SecurityUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;


@WebServlet(urlPatterns = {"/Admin/user/add"})
public class UserAddController extends HttpServlet {
    private static final long SerialVersionUID = 1L;
    UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eString = request.getParameter("e");
        if (eString != null) {
            if (eString.equals("1")) {
                request.setAttribute("errMsg", "Username da ton tai!!!");
            }
        }
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("account") != null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/admin/view/form-add-user.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/AdminLogin");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        User user = new User();
        user.setEmail(request.getParameter("email"));
        user.setUsername(request.getParameter("username"));
        user.setPassword(SecurityUtils.hash(request.getParameter("password")));
        user.setRoleId(Integer.parseInt(request.getParameter("roleId")));
        user.setAvatar(request.getParameter("avatar"));
        user.setPhoneNumber(request.getParameter("phoneNumber"));
        user.setFacebook(request.getParameter("facebook"));
        user.setAddress(request.getParameter("address"));
        user.setStatus(Integer.parseInt(request.getParameter("status")));
        user.setCreatedBy(request.getParameter("user"));
        user.setCreatedDate(java.sql.Date.valueOf(LocalDate.now()));
        userService.insert(user);

        response.sendRedirect(request.getContextPath() + "/Admin/user/list");

    }
}

