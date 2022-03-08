/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fptuni.prj301.demo.model;

/**
 *
 * @author duyta
 */
public class Product {
    
    private String productID;
    private String productName;
    private String img;
    private float price;
    private String categoryID;
    private int rating;
    private String description;

    public Product(String productID, String productName, String img, float price, String categoryID, int rating, String description) {
        this.productID = productID;
        this.productName = productName;
        this.img = img;
        this.price = price;
        this.categoryID = categoryID;
        this.rating = rating;
        this.description = description;
    }

    public Product() {
        productID = "";
        productName = "";
        img = "";
        price = 1;
        categoryID = "";
        rating = 1;
        description = "";
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
}
