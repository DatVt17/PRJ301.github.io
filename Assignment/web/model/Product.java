/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author crrtt
 */
public class Product {
    int productID, quantity, categoryID,status, user_post;
    String productName, image, importDate, usingDate;
    float price;

    public Product() {
    }

    public Product(int productID, int quantity, int categoryID, int status, int user_post, String productName, String image, String importDate, String usingDate, float price) {
        this.productID = productID;
        this.quantity = quantity;
        this.categoryID = categoryID;
        this.status = status;
        this.user_post = user_post;
        this.productName = productName;
        this.image = image;
        this.importDate = importDate;
        this.usingDate = usingDate;
        this.price = price;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getUser_post() {
        return user_post;
    }

    public void setUser_post(int user_post) {
        this.user_post = user_post;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getImportDate() {
        return importDate;
    }

    public void setImportDate(String importDate) {
        this.importDate = importDate;
    }

    public String getUsingDate() {
        return usingDate;
    }

    public void setUsingDate(String usingDate) {
        this.usingDate = usingDate;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

   
    
    
}
