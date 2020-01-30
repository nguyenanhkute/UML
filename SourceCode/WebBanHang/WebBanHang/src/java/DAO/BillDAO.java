/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import connect.SQLConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import model.Bill;
import java.sql.Date;
import java.sql.ResultSet;

/**
 *
 * @author Nguyen
 */
public class BillDAO {
    
    public void InsertBill(Bill bill) throws SQLException
    {
        Connection connection = SQLConnection.getConnection();
        String sql = "exec dh_Insert ?,?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        
        ps.setString(1, bill.getCustomerID());      
        ps.setString(2, bill.getStatus());
        ps.setDouble(3, bill.getTotal()+20000);
        
        ps.executeUpdate();
        
    }
    public String getBillIDByCustomerID (String customerID) throws SQLException
    {
        String id ;
        Connection connection = SQLConnection.getConnection();
        String sql = "exec MaxDH_ByMaKH " + customerID;
      
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet sr = ps.executeQuery();
        
        sr.next();
        id = sr.getString("MaDH");
        
        return id;
    }
    
    
    public static void main(String[] args) throws SQLException {
        
        System.out.println(new BillDAO().getBillIDByCustomerID("KH00010"));
    }
    
   
}
