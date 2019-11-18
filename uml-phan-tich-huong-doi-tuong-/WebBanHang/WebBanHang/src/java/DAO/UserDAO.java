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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author Nguyen
 */
public class UserDAO {
    
   // Kiểm tra Email đã tồn tại hay chưa
    public boolean checkEmail(String email)
    {
        Connection con = SQLConnection.getConnection();
	String sql = "select * from KHACHHANG where email='" + email + "'";
	PreparedStatement ps;
        try {
            ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                con.close();
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    
    // Thêm tài khoản
    public boolean insertUser(User u) 
    {
        Connection con = SQLConnection.getConnection();
        
        String sql = " exec tk_Insert ?,?";
        PreparedStatement ps; 
        try {
            ps = (PreparedStatement) con.prepareCall(sql);
            //ResultSet rs = ps.executeQuery();
            ps.setString(1,u.getCustomerID());
            ps.setString(2,u.getPassword());
            
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
    }
    
    // Kiểm tra đăng nhập
    public User login(String email, String password) {
	Connection con = SQLConnection.getConnection();
	String sql = "select * \n" +
                    "	from TAIKHOAN,KHACHHANG\n" +
                    "	where TAIKHOAN.MatKhau = '"+ password +"' and KHACHHANG.Email =  '" + email + "'";
	PreparedStatement ps;
	try {
		ps = (PreparedStatement) con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
                    User us = new User();
                    us.setCustomerID(rs.getString("MaKH"));
                    us.setPassword(rs.getString("matkhau"));
                   
                    con.close();
                    return us;
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return null;
    }   

    // Lấy tên KH bằng MaKH
    public String getCustomerNameByID(String id) throws SQLException
    {
        Connection con = SQLConnection.getConnection();
	String sql = "select Hoten from KHACHHANG where MaKH='" + id + "'" ;
	
        
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet sr = ps.executeQuery();
        
        sr.next();
        String name = sr.getString("Hoten");
        
        return name;
    }
    
    
    public static void main(String[] args) throws SQLException {
        
        System.out.println(new UserDAO().login("hongganhnguyen1887@gmail.com","honganh2001").getCustomerID());
    }

}
