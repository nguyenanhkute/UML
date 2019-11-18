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
import model.BillPurchase;
import model.Product;

/**
 *
 * @author N
 */
public class BillPurchaseDAO {
    // lấy danh sách đơn nhập hàng
    public ArrayList<BillPurchase> getListBillPurchase() throws SQLException{
        Connection connection = SQLConnection.getConnection();
        ArrayList<BillPurchase> list = new ArrayList<>();
        String sql = "select * from DONNHAPHANG";
        try {
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BillPurchase PUR = new BillPurchase();
                PUR.setBillID(rs.getString("MaDNH"));
                PUR.setSupplierID(rs.getString("MaNCC"));
                PUR.setDate(rs.getDate("NgayDatHang"));
                PUR.setSumCount(rs.getInt("TongSoLuong"));
                list.add(PUR);
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    // lấy mã nhà cung cấp
    public String  getSupplierlID(String supplierName) throws SQLException{
        Connection connection = SQLConnection.getConnection();
        String str="";
        String sql = "SELECT MaNCC FROM NHACUNGCAP WHERE TenNCC= N'"+supplierName+"'";
        try {
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        rs.next();
            str= rs.getString("MaNCC");
            
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return str;
    }
    // lấy TÊN nhà cung cấp
    public String  getSupplierlName(String supplierID) throws SQLException{
        Connection connection = SQLConnection.getConnection();
        String str="";
        String sql = "SELECT TenNCC FROM NHACUNGCAP WHERE MaNCC= '"+supplierID+"'";
        try {
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        rs.next();
            str= rs.getString("TenNCC");
            
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return str;
    }
    
    // lấy MÃ SẢN PHẨM
    public String  getProductID(String productName) throws SQLException{
        Connection connection = SQLConnection.getConnection();
        String str="";
        String sql = "SELECT MaSP FROM SANPHAM WHERE TenSP= N'"+productName+"'";
        try {
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        rs.next();
            str= rs.getString("MaSP");
            
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return str;
    }
    // lấy danh sách tên nhà cung cấp
     public ArrayList<BillPurchase> getListPurchaseName() throws SQLException{
        Connection connection = SQLConnection.getConnection();
        ArrayList<BillPurchase> list = new ArrayList<>();
        String sql = "select TenNCC from NHACUNGCAP";
        try {
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BillPurchase PUR = new BillPurchase();
                PUR.setSupplierName(rs.getString("TenNCC"));
                list.add(PUR);
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
     //lấy danh sách sản phẩm khi có tên nhà cung cấp
     public ArrayList<BillPurchase> getListProductName(String str) throws SQLException{
        Connection connection = SQLConnection.getConnection();
        //String str=PC.getSupplierName();
        ArrayList<BillPurchase> list = new ArrayList<>();
        String sql = "EXEC dnh_listSP N'"+str+"'";
        try {
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                BillPurchase PUR = new BillPurchase();
                PUR.setProductName(rs.getString("TenSP"));
                list.add(PUR);
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
     
     //insert hóa đơn nhập
    public boolean insertBillPurchase(BillPurchase bill)
    {
        try {
            String SupplierName = bill.getSupplierName();
            Connection connection = SQLConnection.getConnection();
            String sql= "EXEC dnh_Insert N'"+SupplierName+"'";
            PreparedStatement ps= connection.prepareCall(sql);
            return ps.executeUpdate()==1;
        } catch (Exception e) {
            return false;
        }
    }
    //LẤY DANH SÁCH CHI TIẾT HÓA ĐƠN CÓ TÊN SUPPLIERNAME
    public BillPurchase getBillDetailID(String supplierName) throws SQLException{
        Connection connection = SQLConnection.getConnection();
        BillPurchase bill= new BillPurchase();
        String sql = "EXEC MaxDNH_BytenNCC N'"+supplierName+"'";
        try {
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        rs.next();
                bill.setBillID(rs.getString("MaDNH"));
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bill;
    }
    
    //THÊM CHI TIẾT ĐƠN NHẠP HÀNG
    public boolean insertDetailBillPurchase(BillPurchase bill)
    {
        try {
            Connection connection = SQLConnection.getConnection();
            String sql= "EXEC ctdnh_Insert N'"+bill.getBillID()+"' , N'"+bill.getProductName()+"' , "+bill.getProductCount();
            PreparedStatement ps= connection.prepareCall(sql);
            return ps.executeUpdate()==1;
        } catch (SQLException e) {
            return false;
        }
    }
    // LẤY DANH SÁCH CHI TIẾT DODƯN NHẬP HÀNG với mã đơn nhập hàng đã biết
    public ArrayList<BillPurchase>  gettDetailBillPurchase(String billID) throws SQLException{
        Connection connection = SQLConnection.getConnection();
        ArrayList<BillPurchase> list= new ArrayList();
        String sql = "SELECT * FROM CHITIETDONNHAPHANG WHERE MaDNH= '"+billID+"'";
        try {
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
                BillPurchase PUR = new BillPurchase();
                PUR.setBillID(rs.getString("MaDNH"));
                PUR.setProductID(rs.getString("MaSP"));
                PUR.setProductCount(rs.getInt("SoLuong"));
                list.add(PUR);
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    //delete chi tiet hoa don nhap
    public boolean deletetDetailBillPurchase(String maDNH, String maSP) {
        Connection connection = SQLConnection.getConnection();
        String sql = "DELETE FROM CHITIETHOADONNHAP WHERE MaDNH = ? and MaSP= ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, maDNH);
            ps.setString(2, maSP);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
        }
        return false;
    }
    
    //UPDATE chi tiet hoa don nhap
    public boolean updateDetailBillPurchase(String maDNH, String maSP) {
        Connection connection = SQLConnection.getConnection();
        String sql = "DELETE FROM CHITIETHOADONNHAP WHERE MaNCC = ? and MaSP= ?";
        try {
            PreparedStatement ps = connection.prepareCall(sql);
            ps.setString(1, maDNH);
            ps.setString(2, maSP);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            
        }
        return false;
    }
    
    public static void main(String[] args) throws SQLException
    {
        BillPurchaseDAO bpDAO= new BillPurchaseDAO();
        ArrayList A= bpDAO.gettDetailBillPurchase("DNH0008");
        System.out.println(A.get(0));
    }
    
    
}
