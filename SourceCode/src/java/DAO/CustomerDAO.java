/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import connect.SQLConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Bill;
import model.Category;
import model.Customer;

/**
 *
 * @author Nguyen
 */
public class CustomerDAO {
   
    public void InsertCustomer(Customer ct) throws SQLException
    {
        //String customerID = null;
        Connection connection = SQLConnection.getConnection();
        String sql = "exec khACHHANG_Insert ?,?,?,?,?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        
        ps.setString(1, ct.getCustomerEmail());
        ps.setString(2, ct.getCustomerName());      
        ps.setString(3, ct.getCustomerAddress());
        ps.setString(4, ct.getCustomerContact());
        ps.setString(5, ct.getCustomerSex());
        ps.setString(6, ct.getCustomerBirthday());
        
        ps.executeUpdate();
             
    }
    
   
    public String getCustomerIDByEmail(String email) throws SQLException
    {
        String id ;
        Connection connection = SQLConnection.getConnection();
        String sql = "select MaKH from KHACHHANG where email = '" + email +"'";
      
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet sr = ps.executeQuery();
        
        sr.next();
        id = sr.getString("MaKH");
        
        
        
        return id;
    }
    
    
    
    public static void main(String[] args) throws SQLException {
        System.out.println("aa");
        
        CustomerDAO d = new CustomerDAO();
        System.out.println(d.getCustomerIDByEmail("hongganhnguyen1887@gmail.com"));
        
        
    }
}
