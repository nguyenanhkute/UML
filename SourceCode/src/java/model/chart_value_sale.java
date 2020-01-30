/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author N
 */
public class chart_value_sale {
    private String categoryName;
    private int sumcount;

    public chart_value_sale(String categoryName, int sumcount) {
        this.categoryName = categoryName;
        this.sumcount = sumcount;
    }

    public chart_value_sale() {
    }

    public String getCategoryName() {
        return categoryName;
    }
    
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public int getSumcount() {
        return sumcount;
    }

    public void setSumcount(int sumcount) {
        this.sumcount = sumcount;
    }

    @Override
    public String toString() {
        return categoryName;
    }
    
}
