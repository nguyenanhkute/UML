/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Nguyen
 */
public class Product {
    private String productID;
    private String productCategoryID;
    private String productSupplier;  // Nhà cung cấp
    private String productName;
    private String productImage;
    private double productPrice;
    private String productDateCheckIn;
    private String productDecription;
    private String productCategoryName;
    private String productSupplierName;
    
    private String productStatus;
    
     public Product(String SupplierName,String CategoryName, String productName, String productImage, double productPrice, String productDecription, String productStatus) {
        //tenLSP,tenNCC,tenSP,"",gia,ngay,mota,tinht
        this.productCategoryName = CategoryName;
        this.productSupplierName = SupplierName;
        this.productName = productName;
        this.productImage = productImage;
        this.productPrice = productPrice;
        this.productDecription = productDecription;
        this.productStatus = productStatus;
    }   

    public String getProductCategoryName() {
        return productCategoryName;
    }

    public void setProductCategoryName(String productCategoryName) {
        this.productCategoryName = productCategoryName;
    }

    public String getProductSupplierName() {
        return productSupplierName;
    }

    public void setProductSupplierName(String productSupplierName) {
        this.productSupplierName = productSupplierName;
    }
    public Product(String productID, String productCategoryID, String productSupplier, String productName, String productImage, double productPrice, String productDateCheckIn, String productDecription, String productStatus) {
        this.productID = productID;
        this.productCategoryID = productCategoryID;
        this.productSupplier = productSupplier;
        this.productName = productName;
        this.productImage = productImage;
        this.productPrice = productPrice;
        this.productDateCheckIn = productDateCheckIn;
        this.productDecription = productDecription;
        this.productStatus = productStatus;
    }
     public Product(String productID,String productName, double productPrice, String productDescribe, String productStatus) {
        this.productID= productID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productDecription = productDescribe;
        this.productStatus = productStatus;
    }

    public Product(String productID, String productImage)
    {
        this.productID = productID;
        this.productImage = productImage;
    }
    
    
    public Product() {
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductCategoryID() {
        return productCategoryID;
    }

    public void setProductCategoryID(String productCategoryID) {
        this.productCategoryID = productCategoryID;
    }

    public String getProductSupplier() {
        return productSupplier;
    }

    public void setProductSupplier(String productSupplier) {
        this.productSupplier = productSupplier;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductDateCheckIn() {
        return productDateCheckIn;
    }

    public void setProductDateCheckIn(String productDateCheckIn) {
        this.productDateCheckIn = productDateCheckIn;
    }

    public String getProductDecription() {
        return productDecription;
    }

    public void setProductDecription(String productDecription) {
        this.productDecription = productDecription;
    }


    public String getProductStatus() {
        return productStatus;
    }

    public void setProductStatus(String productStatus) {
        this.productStatus = productStatus;
    }
    
   
    
}
