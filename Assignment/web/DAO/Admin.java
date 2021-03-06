/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Category;
import DTO.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Admin {
      public static ArrayList<Product> getAllProductAdmin() {
        ArrayList<Product> list = new ArrayList<>();
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("select * from tblProduct");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductID(rs.getInt("productID"));
                p.setProductName(rs.getString("productName"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getFloat("price"));
                p.setQuantity(rs.getInt("quantity"));
                p.setCategoryID(rs.getInt("categoryID"));
                p.setImportDate(rs.getString("importDate"));
                p.setUsingDate(rs.getString("usingDate"));
                p.setStatus(rs.getInt("status"));
                p.setUser_post(rs.getInt("user_post"));
                list.add(p);
            }
            conn.close();
        } catch (SQLException e) {
        }
        return list;
    }
       public static void addProduct(Product product) {
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("insert into tblProduct values (?,?,?,?,?,?,?,?,?)");
             st.setString(1, product.getProductName());
              st.setString(2, product.getImage());
              st.setFloat(3, product.getPrice());
              st.setInt(4, product.getQuantity());
              st.setInt(5, product.getCategoryID());
              st.setString(6, product.getImportDate());
              st.setString(7,product.getUsingDate());
              st.setInt(8, product.getUser_post());
              st.setInt(9, 1);
            st.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            System.out.println("Loi");
        }
    }
  public static void updateProduct(Product product) {
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("update tblProduct set productName=?,image=?,price=?,quantity=?,categoryID=?,usingDate=? where productID = ?");
             st.setString(1, product.getProductName());
              st.setString(2, product.getImage());
              st.setFloat(3, product.getPrice());
              st.setInt(4, product.getQuantity());
              st.setInt(5, product.getCategoryID());
              st.setString(6,product.getUsingDate());
              st.setInt(7,product.getProductID());
            st.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            System.out.println("loi update product :" + e);
        }
    }
   public static void DeleteProduct(int id,int status) {
        try {
            if(status == 1){
                 Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("update tblProduct set status=? where productID = ?");
            st.setInt(1, 0);
            st.setInt(2, id);
            st.executeUpdate();
            conn.close();
            }else if(status == 0){
                 Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("update tblProduct set status=? where productID = ?");
            st.setInt(1, 1);
            st.setInt(2, id);
            st.executeUpdate();
            conn.close();
            }
           
        } catch (SQLException e) {
            System.out.println("loi delete product :" + e);
        }
    }
   public static void addCate(Category category) {
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("insert into tblCategory values (?,?)");
           st.setString(1, category.getCategoryName());
           st.setFloat(2, category.getPrice());
            st.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            System.out.println("loi add cate" + e);
        }
    }
   public static void updateCate(int id,String Name,Float price){
         try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("update tblCategory set categoryName=?,price=? where categoryID = ?");
           st.setString(1,Name);
           st.setFloat(2,price);
           st.setInt(3,id);
            st.executeUpdate();
            conn.close();
        } catch (SQLException e) {
            System.out.println("loi update cate" + e);
        }
   }
     public static void DeleteCate(int id) {
        try {
             Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("delete from tblCategory  where categoryID = ?");
           st.setInt(1,id);
            st.executeUpdate();
            conn.close();
           
        } catch (SQLException e) {
            System.out.println("loi delete cate :" + e);
        }
    }
   
}
