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
public class Category {
    private String categoryID;
    private String categoryName;
    private String typeName;
    public Category() {
    }
    
     public Category(String categoryID, String categoryName,String typeName) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.typeName = typeName;
    }

    public Category(String categoryName, String typeName) {
        this.categoryName = categoryName;
        this.typeName = typeName;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
    
}
