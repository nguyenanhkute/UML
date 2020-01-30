/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author N
 */
public class BillPurchase {
    private String billID;
    private String productID;// mã sản phẩm
    private String productName;// tên sản phẩm
    private String SupplierID;  // MÃ Nhà cung cấp
    private String SupplierName;//tên nhà cung cấp
    private int productCount;// số lượng của từng sản phẩm
    private int SumCount; // tổng số lượng sản phẩm trong đơn nhập hàng
    private Date date;

    public BillPurchase(String productID, String productName, String SupplierID, String SupplierName, Date date) {
        this.productID = productID;
        this.productName = productName;
        this.SupplierID = SupplierID;
        this.SupplierName = SupplierName;
        this.date = date;
    }
//detail
    public BillPurchase(String billID, String productName, int productCount) {
        this.billID = billID;
        this.productName = productName;
        this.productCount = productCount;
    }
    
    public BillPurchase() {
    }

    public BillPurchase(String SupplierName) {
        this.SupplierName = SupplierName;
    }

    public String getBillID() {
        return billID;
    }

    public void setBillID(String billID) {
        this.billID = billID;
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

    public String getSupplierID() {
        return SupplierID;
    }

    public void setSupplierID(String SupplierID) {
        this.SupplierID = SupplierID;
    }

    public String getSupplierName() {
        return SupplierName;
    }

    public void setSupplierName(String SupplierName) {
        this.SupplierName = SupplierName;
    }

    public int getProductCount() {
        return productCount;
    }

    public void setProductCount(int productCount) {
        this.productCount = productCount;
    }

    public int getSumCount() {
        return SumCount;
    }

    public void setSumCount(int SumCount) {
        this.SumCount = SumCount;
    }
    
    
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
}
