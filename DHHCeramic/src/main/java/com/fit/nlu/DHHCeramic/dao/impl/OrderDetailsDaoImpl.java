package com.fit.nlu.DHHCeramic.dao.impl;


import com.fit.nlu.DHHCeramic.dao.OrderDetailsDao;
import com.fit.nlu.DHHCeramic.dao.UserDao;
import com.fit.nlu.DHHCeramic.jdbc.JDBCConnection;
import com.fit.nlu.DHHCeramic.model.Order;
import com.fit.nlu.DHHCeramic.model.OrderDetails;
import com.fit.nlu.DHHCeramic.model.Product;
import com.fit.nlu.DHHCeramic.model.User;
import com.fit.nlu.DHHCeramic.services.OrderService;
import com.fit.nlu.DHHCeramic.services.ProductService;
import com.fit.nlu.DHHCeramic.services.impl.OrderServiceImpl;
import com.fit.nlu.DHHCeramic.services.impl.ProductServiceImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class OrderDetailsDaoImpl extends JDBCConnection implements OrderDetailsDao {
    OrderService cartService = new OrderServiceImpl();
    ProductService productService = new ProductServiceImpl();
    UserDao userDao = new UserDaoImpl();


    @Override
    public void insert(OrderDetails cartItem) {
        String sql = "INSERT INTO order_details(id, orderId, productId, quantity, unitPrice,size,status) VALUES (?,?,?,?,?,?,?)";
        Connection con = getJDBCConnection();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, cartItem.getId());
            ps.setString(2, cartItem.getOrder().getId());
            ps.setInt(3, cartItem.getProduct().getId());
            ps.setInt(4, cartItem.getQuantity());
            ps.setLong(5, cartItem.getUnitPrice());
            ps.setString(6, cartItem.getSize());
            ps.setString(7, cartItem.getStatus());
            ps.executeUpdate();

//			ResultSet generatedKeys = ps.getGeneratedKeys();
//			if (generatedKeys.next()) {
//				int id = generatedKeys.getInt(1);
//				cartItem.setId(id);
//			}


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void edit(OrderDetails cartItem) {
        String sql = "UPDATE order_details SET  quantity = ?, unitPrice=?, size=?, status=? WHERE id = ?";
        Connection con = getJDBCConnection();

        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, cartItem.getQuantity());
            ps.setLong(2, cartItem.getUnitPrice());
            ps.setString(3, cartItem.getSize());
            ps.setString(4, cartItem.getStatus());
            ps.setString(5, cartItem.getId());

            ps.executeUpdate();


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(String id) {
        String sql = "DELETE FROM order_details WHERE id = ?";
        Connection con = getJDBCConnection();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    @Override
    public OrderDetails get(String id) {
        String sql = "SELECT " +
                "order_details.id, " +
                "order_details.quantity, " +
                "order_details.unitPrice, " +
                "orders.userId, " +
                "orders.phoneNumber, " +
                "orders.address, " +
                "orders.createdAt, " +
                "products.name, " +
                "products.price, " +
                "products.saleId, " +
                "products.image, " +
                "order_details.size, " +
                "order_details.status " +
                "FROM order_details " +
                "INNER JOIN orders " +
                "ON order_details.orderId = orders.id " +
                "INNER JOIN products " +
                "ON order_details.productId = products.id " +
                "WHERE order_details.id = ?";
        Connection con = getJDBCConnection();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User user = userDao.get(rs.getInt("userId"));

                Order cart = new Order();
                cart.setBuyer(user);
                cart.setPhoneNumber("phoneNumber");
                cart.setAddress("address");
                cart.setBuyDate(rs.getDate("createdAt"));

                Product product = new Product();
                product.setName(rs.getString("name"));
                product.setPrice(rs.getLong("price"));
                product.setSaleId(rs.getLong("saleId"));
                product.setImage(rs.getString("image"));

                OrderDetails cartItem = new OrderDetails();
                cartItem.setId(rs.getString("id"));
                cartItem.setOrder(cart);
                cartItem.setProduct(product);
                cartItem.setQuantity(rs.getInt("quantity"));
                cartItem.setUnitPrice(rs.getLong("unitPrice"));
                cartItem.setSize(rs.getString("size"));
                cartItem.setStatus(rs.getString("status"));
                return cartItem;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<OrderDetails> getAll() {
        List<OrderDetails> cartItemList = new ArrayList<OrderDetails>();
        String sql = "SELECT " +
                "order_details.id, " +
                "order_details.quantity, " +
                "order_details.unitPrice, " +
                "orders.userId, " +
                "orders.phoneNumber, " +
                "orders.address, " +
                "orders.createdAt, " +
                "products.name, " +
                "products.price, " +
                "products.saleId, " +
                "products.image, " +
                "order_details.size, " +
                "order_details.status " +
                "FROM order_details " +
                "INNER JOIN orders " +
                "ON order_details.orderId = orders.id " +
                "INNER JOIN products " +
                "ON order_details.productId = products.id ";
        Connection con = getJDBCConnection();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User user = userDao.get(rs.getInt("userId"));

                Order cart = new Order();
                cart.setBuyer(user);
                cart.setPhoneNumber(rs.getString("phoneNumber")); // Lấy giá trị từ cơ sở dữ liệu
                cart.setAddress(rs.getString("address")); // Lấy giá trị từ cơ sở dữ liệu

                cart.setBuyDate(rs.getDate("createdAt"));

                Product product = new Product();
                product.setName(rs.getString("name"));
                product.setPrice(rs.getLong("price"));
                product.setSaleId(rs.getLong("saleId"));
                product.setImage(rs.getString("image"));

                OrderDetails cartItem = new OrderDetails();
                cartItem.setId(rs.getString("id"));
                cartItem.setOrder(cart);
                cartItem.setProduct(product);
                cartItem.setQuantity(rs.getInt("quantity"));
                cartItem.setUnitPrice(rs.getLong("unitPrice"));
                cartItem.setSize(rs.getString("size"));
                cartItem.setStatus(rs.getString("status"));

                cartItemList.add(cartItem); // dòng này để thêm cartItem vào danh sách
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return cartItemList;
    }

    public List<OrderDetails> search(String name) {
        return null;
    }

    @Override
    public List<OrderDetails> getByUserID(int id) {
        List<OrderDetails> list = new ArrayList<OrderDetails>();
        String sql = "SELECT " +
                "order_details.id, " +
                "order_details.quantity, " +
                "order_details.unitPrice, " +
                "orders.userId, " +
                "orders.createdAt, " +
                "products.name, " +
                "products.price, " +
                "products.saleId, " +
                "products.image, " +
                "order_details.size, " +
                "order_details.status " +
                "FROM order_details " +
                "INNER JOIN orders " +
                "ON order_details.orderId = orders.id " +
                "INNER JOIN products " +
                "ON order_details.productId = products.id " +
                "WHERE orders.userId = ?";
        Connection con = getJDBCConnection();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User user = userDao.get(rs.getInt("userId"));

                Order cart = new Order();
                cart.setBuyer(user);
                cart.setBuyDate(rs.getDate("createdAt"));

                Product product = new Product();
                product.setName(rs.getString("name"));
                product.setPrice(rs.getLong("price"));
                product.setSaleId(rs.getLong("saleId"));
                product.setImage(rs.getString("image"));

                OrderDetails cartItem = new OrderDetails();
                cartItem.setId(rs.getString("id"));
                cartItem.setOrder(cart);
                cartItem.setProduct(product);
                cartItem.setQuantity(rs.getInt("quantity"));
                cartItem.setUnitPrice(rs.getLong("unitPrice"));
                cartItem.setSize(rs.getString("size"));
                cartItem.setStatus(rs.getString("status"));

                list.add(cartItem);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }

//    @Override
//    public CartItem get(String name) {
//        // TODO Auto-generated method stub
//        return null;
//    }

}

