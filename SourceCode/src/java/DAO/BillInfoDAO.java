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
import model.Bill;
import model.BillInfo;

/**
 *
 * @author Nguyen
 */
public class BillInfoDAO {

    public void InsertBillInfo(BillInfo bf, String billID) throws SQLException
    {
        Connection connection = SQLConnection.getConnection();
        String sql = "exec ctdh_Insert ?,?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        
       // ps.setString(1, bill.getBillID());
        //ps.setString(1, bf.getBillID());      
        ps.setString(1, billID);
        ps.setString(2, bf.getProductID());
        ps.setDouble(3, bf.getQuantity());
        //ps.setDate(6, bill.getDateOder());
        
        ps.executeUpdate();
        
    }

}
