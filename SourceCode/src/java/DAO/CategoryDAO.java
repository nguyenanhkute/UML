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
import model.Category;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Nguyen
 */
public class CategoryDAO {
    public ArrayList<Category> getListCategoryByDirectory(String directory_id) throws SQLException
    {
        Connection connection = SQLConnection.getConnection();
        String SQL = "SELECT * FROM LOAISANPHAM WHERE MaDM = '"+ directory_id+"'";
        ArrayList<Category> list = new ArrayList<>();
        try 
        {
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();

           
                while ( rs.next())
                {
                    Category category = new Category();
                    category.setCategoryID(rs.getString("MaLoaiSP"));
                    category.setCategoryName(rs.getString("TenLoaiSP"));

                    list.add(category);
                }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
        
               
    }
    public String getNameByID(String id) throws SQLException
    {
        String name = null;
        Connection connection = SQLConnection.getConnection();
        String sql = "SELECT TenLoaiSP FROM LOAISANPHAM WHERE MaLoaiSP = '" + id + "'";
   
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next())
        {
            name = rs.getString("TenLoaiSP");   
        }
        
        return name;      
    }
     
   public ArrayList<Category> getListCategory() throws SQLException{
        Connection connection = SQLConnection.getConnection();
        ArrayList<Category> list = new ArrayList<>();
        String sql = "select MaLoaiSP, TenLoaiSP, TenDM from LOAISANPHAM LSP JOIN DANHMUC DM ON LSP.MaDM = DM.MaDM ";
        try {
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryID(rs.getString("MaLoaiSP"));
                category.setCategoryName(rs.getString("TenLoaiSP"));
                category.setTypeName(rs.getString("TenDM"));
                list.add(category);
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public ArrayList<Category> getListTypeName() throws SQLException{
        Connection connection = SQLConnection.getConnection();
        ArrayList<Category> list = new ArrayList<>();
        String sql = "select MaDM,TenDM from DANHMUC ";
        try {
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                //category.setTypeID(rs.getString("MaDM"));
                category.setTypeName(rs.getString("TenDM"));
                list.add(category);
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public String getTypeID(String str){
        try {
            Connection connection = SQLConnection.getConnection();
            String sqls = "select MaDM from DANHMUC WHERE TenDM="+str+"";
            PreparedStatement ps = connection.prepareCall(sqls);
            ps.setString(1,str);
             
            ResultSet st=  ps.executeQuery();
            return st.getString("MaDanhMuc");
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
            return "";
        }
    }
    
    public boolean insertCategoryDAO(Category c)
    {
      try{
         Connection connection = SQLConnection.getConnection();
         String sql = "EXEC lsp_Insert ?,?";
         PreparedStatement ps = connection.prepareCall(sql);
         ps.setString(1, c.getTypeName());
         ps.setString(2, c.getCategoryName());
         
         return ps.executeUpdate()==1 ; 
        } catch (SQLException e) 
        {
            return false;
        }
    }
    
    public boolean updateCategoryDAO(Category c)
    {
      try{
         Connection connection = SQLConnection.getConnection();
         String sql = "EXEC UPDATE_LSP ?,?";
         PreparedStatement ps = connection.prepareCall(sql);
         ps.setString(1, c.getCategoryID());
         ps.setString(2, c.getCategoryName());
         
         return ps.executeUpdate()==1 ; 
        } catch (SQLException e) 
        {
            return false;
        }
    }
    public static void main(String[] args) throws SQLException 
    {
        CategoryDAO dao = new CategoryDAO();
        for (Category ds : dao.getListCategoryByDirectory("TT"))
        {
            System.out.println(ds.getCategoryID() + "- " + ds.getCategoryName());
        }
        
        System.out.println("============");
        dao.getNameByID("LD");
    }

   
    
   
}
