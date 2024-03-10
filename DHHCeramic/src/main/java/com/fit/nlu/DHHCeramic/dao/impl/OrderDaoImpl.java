package com.fit.nlu.DHHCeramic.dao.impl;

import com.fit.nlu.DHHCeramic.dao.OrderDao;
import com.fit.nlu.DHHCeramic.jdbc.JDBCConnection;
import com.fit.nlu.DHHCeramic.model.Order;
import com.fit.nlu.DHHCeramic.model.User;
import com.fit.nlu.DHHCeramic.services.UserService;
import com.fit.nlu.DHHCeramic.services.impl.UserServiceImpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDaoImpl extends JDBCConnection implements OrderDao {
    UserService userS = new UserServiceImpl();

    @Override
    public void edit(Order cart) {
        String sql = "UPDATE orders SET userId = ?, name=?, address=?, phoneNumber=?, createdAt=?, note=? WHERE id = ?";
        Connection con = getJDBCConnection();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, cart.getBuyer().getId());
            ps.setString(2, cart.getBuyer().getFullname());
            ps.setString(3, cart.getAddress());
            ps.setString(4, cart.getPhoneNumber());
            ps.setDate(5, new Date(cart.getBuyDate().getTime()));
            ps.setString(6, cart.getNote());
            ps.setString(7, cart.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    @Override
    public void insert(Order cart) {
        String sql = "INSERT INTO orders (id, userId, name, address, phoneNumber, createdAt, note) VALUES (?,?,?,?,?,?,?)";
        Connection con = getJDBCConnection();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, cart.getId());
            ps.setInt(2, cart.getBuyer().getId());
            ps.setString(3, cart.getBuyer().getFullname());
            ps.setString(4, cart.getAddress());
            ps.setString(5, cart.getPhoneNumber());
            ps.setDate(6, new Date(cart.getBuyDate().getTime()));
            ps.setString(7, cart.getNote());
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        String sql = "DELETE FROM orders WHERE id = ?";
        Connection con = getJDBCConnection();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    @Override
    public Order get(String name) {
        return null;
    }

    @Override
    public List<Order> getAll() {
        List<Order> cartList = new ArrayList<Order>();
        String sql = "SELECT orders.id, orders.userId, orders.address, orders.phoneNumber,orders.createdAt, orders.note "
                + "FROM orders ";
        Connection con = getJDBCConnection();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User user = userS.get(rs.getInt("userId"));
                Order cart = new Order();
                cart.setId(rs.getString("id"));
                cart.setAddress(rs.getString("address"));
                cart.setPhoneNumber(rs.getString("phoneNumber"));
                cart.setBuyDate(rs.getDate("createdAt"));
                cart.setBuyer(user);
                cartList.add(cart);

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return cartList;
    }

    public List<Order> search(String name) {
        List<Order> cartList = new ArrayList<Order>();
        String sql = "SELECT orders.id, users.email, users.username, users.id AS userId "
                + "FROM orders INNER JOIN users " + "ON orders.userId = users.id LIKE users.email = ?";
        Connection con = getJDBCConnection();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = userS.get(rs.getInt("userId"));

                Order cart = new Order();
                cart.setId(rs.getString("id"));
                cart.setBuyDate(rs.getDate("buyDate"));
                cart.setBuyer(user);

                cartList.add(cart);

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return cartList;
    }

    @Override
    public Order get(int id) {
        String sql = "SELECT orders.id,orders.buyDate, users.email, users.username, users.id AS userId "
                + "FROM orders INNER JOIN users " + "ON orders.userId = users.id WHERE orders.id=?";
        Connection con = getJDBCConnection();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                User user = userS.get(rs.getInt("userId"));

                Order cart = new Order();
                cart.setId(rs.getString("id"));
                cart.setBuyDate(rs.getDate("buyDate"));
                cart.setBuyer(user);

                return cart;

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

}

