package com.fit.nlu.DHHCeramic.controller.admin;

import com.fit.nlu.DHHCeramic.model.*;
import com.fit.nlu.DHHCeramic.services.*;
import com.fit.nlu.DHHCeramic.services.impl.*;
import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;


@WebServlet(name = "AdminWelcome", value = "/Admin/Welcome")
public class AdminWelcome extends HttpServlet {
    OrderDetailsService cartItemService = new OrderDetailsServiceImpl();
    UserService userService = new UserServiceImpl();
    OrderService cartService = new OrderServiceImpl();
    ProductService productService = new ProductServiceImpl();
    CategoryService categoryService = new CategoryServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<OrderDetails> items = cartItemService.getAll();
        Long total = 0L;
        double cost = 0L;
        request.setAttribute("items", items.size());
        List<Product> products = productService.getAll();
        request.setAttribute("products",products.size());
        List<User> users = userService.getAll();
        request.setAttribute("users", users.size());
        List<Order> carts = cartService.getAll();
        request.setAttribute("carts", carts.size());


        // Số sản phẩm sắp hết hàng
        int lowStockProductCount = 0;

        // Kiểm tra từng sản phẩm nếu số lượng tồn kho dưới 10
        for (Product product : products) {
            if (product.getStock() < 10) {
                lowStockProductCount++;
                // In thông tin của sản phẩm có số lượng tồn kho dưới 10
                System.out.println("SẮP HẾT HÀNG\n" + product);
            }
        }

        // Truyền số sản phẩm sắp hết hàng vào request để sử dụng trong JSP
        request.setAttribute("lowStockProductCount", lowStockProductCount);

        Gson gsonObj = new Gson();
        Map<Object, Object> map = null;
        List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
        for (Category category : categoryService.getAll()) {
            map = new HashMap<Object, Object>();
            map.put("label", category.getName());
            map.put("y", productService.searchByCategory(category.getId()).size());
            list.add(map);

        }

        String dataPoints = gsonObj.toJson(list);
        request.setAttribute("dataPoints", dataPoints);
        request.getRequestDispatcher("/view/admin/view/index.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
