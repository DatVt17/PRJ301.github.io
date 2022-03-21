/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author crrtt
 */
public class OrderDAO {

    public static ArrayList<Order> getAllOrder() {
        ArrayList<Order> list = new ArrayList<>();
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("select * from tblOrders");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order o = new Order();
                o.setOrderID(rs.getInt("orderID"));
                o.setUserID(rs.getInt("userID"));
                o.setOrderDate(rs.getString("orderDate"));
                o.setTotal(rs.getFloat("total"));
                o.setStatus(rs.getInt("status"));
                list.add(o);
            }
            conn.close();
        } catch (SQLException e) {
        }
        return list;
    }

    public static int getOrderIDByUserID(int userID) {
        int orderID = 0;
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("select orderID from tblOrders where userID = ? and status = 1");
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                orderID = rs.getInt(1);
            }
            conn.close();
        } catch (SQLException e) {
        }
        return orderID;
    }

    public static void addNewOrder(int userID) {
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("insert into tblOrders values (?,?,?,?)");
            st.setInt(1, userID);
            st.setString(2, "0");
            st.setFloat(3, 0);
            st.setInt(4, 1);
            st.execute();
            conn.close();
        } catch (Exception e) {
        }
    }

    public static void checkOut(int orderID, float totalPrice) {
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("update tblOrders set status = 2, total = ?,orderDate=? where orderID = ?");
            st.setFloat(1, totalPrice);
            st.setInt(3, orderID);
            st.setString(2, java.time.LocalDate.now().toString());
            st.execute();
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
      public static void changeStatus(int orderID, int status) {
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("update tblOrders set status = ? where orderID = ?");
            st.setFloat(1, status);
            st.setInt(2, orderID);    
            st.execute();
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
