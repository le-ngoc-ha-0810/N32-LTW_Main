package com.fit.nlu.DHHCeramic.controller.admin.order;

import com.fit.nlu.DHHCeramic.model.OrderDetails;
import com.fit.nlu.DHHCeramic.services.OrderDetailsService;
import com.fit.nlu.DHHCeramic.services.impl.OrderDetailsServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "OrderEditController", value = "/Admin/order/edit")
public class OrderEditController extends HttpServlet {
    OrderDetailsService cartItemService = new OrderDetailsServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        OrderDetails cartItem = cartItemService.get(id);
        request.setAttribute("id", id);
        request.setAttribute("cartItem", cartItem);
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("account") != null) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/admin/view/editOrder.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/AdminLogin");
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String quantity = request.getParameter("quantity");
        String salePrice = request.getParameter("unitPrice");
        String size = request.getParameter("size");
        String status = request.getParameter("status");
        OrderDetails cartItem = cartItemService.get(id);
        cartItem.setQuantity(Integer.parseInt(quantity));
        cartItem.setUnitPrice(Integer.parseInt(salePrice));
        cartItem.setSize(size);
        cartItem.setStatus(status);
        cartItemService.edit(cartItem);
        response.sendRedirect(request.getContextPath() + "/Admin/order/list");
    }
}
