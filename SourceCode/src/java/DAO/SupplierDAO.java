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

/**
 *
 * @author Nguyen
 */
public class SupplierDAO {
    
   public String getSupplierNameByID(String SupplierID) throws SQLException
    {
        String name ;
        Connection connection = SQLConnection.getConnection();
        String sql = "select TenNCC from NHACUNGCAP where MaNCC = '" + SupplierID +"'";
      
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet sr = ps.executeQuery();
        
        sr.next();
        name = sr.getString("TenNCC");
        
        
        
        return name;
    }
    
}
