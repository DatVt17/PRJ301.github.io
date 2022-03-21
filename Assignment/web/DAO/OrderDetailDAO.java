/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.OrderDetail;
import DTO.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author crrtt
 */
public class OrderDetailDAO {

    public static ArrayList<OrderDetail> getAllOrderDetail() {
        ArrayList<OrderDetail> list = new ArrayList<>();
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("select * from tblOrderDetail");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetail detail = new OrderDetail();
                detail.setDetailID(rs.getInt("detailID"));
                detail.setPrice(rs.getFloat("price"));
                detail.setQuantity(rs.getInt("quantity"));
                detail.setOrderID(rs.getInt("orderID"));
                detail.setProductID(rs.getInt("productID"));
                list.add(detail);
            }
            conn.close();
        } catch (SQLException e) {
        }
        return list;
    }

    public static ArrayList<OrderDetail> getOrderDetailByOrderID(int orderID) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("select * from tblOrderDetail where orderID = ?");
            st.setInt(1, orderID);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                OrderDetail detail = new OrderDetail();
                detail.setDetailID(rs.getInt("detailID"));
                detail.setPrice(rs.getFloat("price"));
                detail.setQuantity(rs.getInt("quantity"));
                detail.setOrderID(rs.getInt("orderID"));
                detail.setProductID(rs.getInt("productID"));
                list.add(detail);
            }
            conn.close();
        } catch (SQLException e) {
        }
        return list;
    }

    public static void addOrderDetail(OrderDetail detail) {
        try {
           int quantity = 0;
           int orderdetailsid = 0;
            ArrayList<OrderDetail> arrayList = getOrderDetailByOrderID(detail.getOrderID());
            for(OrderDetail detail1 : arrayList){
                if(detail1.getProductID() == detail.getProductID()){
                    quantity = detail1.getQuantity();
                    orderdetailsid = detail1.getDetailID();
                    break;
                }
            }
            if(quantity > 0){
                int updatequantity = quantity+1;
                updateOrderDetails(orderdetailsid,updatequantity);
            }else{
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("insert into tblOrderDetail values (?,?,?,?)");
            st.setFloat(1, detail.getPrice());
            st.setInt(2, detail.getQuantity());
            st.setInt(3, detail.getOrderID());
            st.setInt(4, detail.getProductID());
            st.executeUpdate();
            conn.close();
            }
            
        } catch (SQLException e) {
        }
    }

    public static void deleteOrderDetailByID(int orderDetailID) {
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("delete from tblOrderDetail where detailID = ?");
            st.setInt(1, orderDetailID);
            st.executeUpdate();
            conn.close();
        } catch (SQLException e) {
        }
    }

    public static void clearOrderDetailByOrderID(int orderID) {
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("delete from tblOrderDetail where orderID = ?");
            st.setInt(1, orderID);
            st.executeUpdate();
            conn.close();
        } catch (SQLException e) {
        }
    }

    public static void updateOrderDetails(int detailID, int quantity) {
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("update tblOrderDetail set quantity = ? where detailID = ?");
            st.setInt(1, quantity);
            st.setInt(2, detailID);
            st.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            System.out.println("loi update orderdetails " + e);
        }
    }
}
