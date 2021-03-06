/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DTO.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author crrtt
 */
public class CategoryDAO {

    public static ArrayList<Category> getAllCategory() {
        ArrayList<Category> list = new ArrayList<>();
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("select * from tblCategory");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setCategoryID(rs.getInt("categoryID"));
                c.setCategoryName(rs.getString("categoryName"));
                c.setPrice(rs.getFloat("price"));
                list.add(c);
            }
            conn.close();
        } catch (SQLException e) {
        }
        return list;
    }
 public static Category getCategory(int id) {
         Category c = new Category();
        try {
            Connection conn = DAO.DB.getConnection();
            PreparedStatement st = conn.prepareStatement("select * from tblCategory where categoryID='"+id+"'");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                
                c.setCategoryID(rs.getInt("categoryID"));
                c.setCategoryName(rs.getString("categoryName"));
                c.setPrice(rs.getFloat("price"));
            }
            conn.close();
        } catch (SQLException e) {
        }
        return c;
    }
}
