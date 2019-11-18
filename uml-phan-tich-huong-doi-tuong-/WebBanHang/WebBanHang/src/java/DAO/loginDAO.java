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
 * @author N
 */
public class loginDAO {
    public boolean login(String username, String password) {
        Connection connection = SQLConnection.getConnection();
        String sql = "select * from ADMINS where TenDangNhap='" + username + "' and MatKhau='" + password + "'";
        PreparedStatement ps;
        try {
            ps = (PreparedStatement) connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
            connection.close();
            return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
         return false;
    }
}
