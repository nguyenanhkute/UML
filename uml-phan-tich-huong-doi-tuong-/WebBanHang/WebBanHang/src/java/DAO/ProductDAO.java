/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Product;
import connect.SQLConnection;
import java.text.Normalizer;
import java.util.regex.Pattern;

/**
 *
 * @author Nguyen
 */
public class ProductDAO {
    // Lay danh sach SP tu MaLoaiSP
        public ArrayList<Product> getListProductByCategory(String category_ID) throws SQLException
        {
            Connection connection = SQLConnection.getConnection();
            String sql = "SELECT * FROM SANPHAM WHERE MaLoaiSP = '" + category_ID + "'";
            
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            
            ArrayList<Product> list = new ArrayList<>();
            
            
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getString("MaSP"));
                product.setProductName(rs.getString("TenSP"));
                product.setProductImage(rs.getString("AnhSP")); 
                product.setProductPrice(rs.getDouble("Gia"));
                product.setProductDecription(rs.getString("MoTa"));
                
                list.add(product);
             }
             return list;
        }
        // Lay thong tin chi tiet SP
        public Product getDetailProduct(String product_id) throws SQLException
        {
            Connection connection = SQLConnection.getConnection();
            String sql = "SELECT * FROM SANPHAM WHERE MaSP = '" +product_id+ "'";
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();        
            Product product = new Product();                       
            while (rs.next()) 
            {
                product.setProductID(rs.getString("MaSP"));
                product.setProductName(rs.getString("TenSP"));
                product.setProductImage(rs.getString("AnhSP")); 
                product.setProductPrice(rs.getDouble("Gia"));
                product.setProductDecription(rs.getString("MoTa"));
                product.setProductCategoryID(rs.getString("MaLoaiSP"));
                product.setProductSupplier(rs.getString("MaNCC"));
                product.setProductStatus(rs.getString("TinhTrang"));             
            }
            return product;
        }
        
        // Lấy danh sách sản phẩm từ tên nhập vào để tìm kiếm trên admin
        public ArrayList<Product> SearchProductByNameAdmin(String name) throws SQLException
        {
          
            Connection connection = SQLConnection.getConnection();
           
            String sql = "SELECT * FROM ((SANPHAM SP JOIN LOAISANPHAM LSP  on SP.MaLoaiSP= LSP.MaLoaiSP)JOIN NHACUNGCAP NCC ON NCC.MaNCC= SP.MaNCC) WHERE dbo.fuConvertToUnsign1(TenSP) LIKE N'%' + dbo.fuConvertToUnsign1(N'"+ name +"') + '%'";
            PreparedStatement ps = connection.prepareCall(sql);

            ResultSet rs = ps.executeQuery();
            
            ArrayList<Product> list = new ArrayList();
              
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getString("MaSP"));
                product.setProductName(rs.getString("TenSP"));
                product.setProductImage(rs.getString("AnhSP")); 
                product.setProductPrice(rs.getDouble("Gia"));
                product.setProductDecription(rs.getString("MoTa"));
                product.setProductStatus(rs.getString("TinhTrang"));
                product.setProductCategoryName(new CategoryDAO().getNameByID(rs.getString("MaLoaiSP")));
                product.setProductSupplierName(new SupplierDAO().getSupplierNameByID(rs.getString("MaNCC")));
                
                list.add(product);
            }
            
            return list;
            
        }
        
        // Lấy danh sách sản phẩm từ LSP
        public ArrayList<Product> getListProductByNav(String categoryID, int firstResult) throws SQLException
        {
            Connection connection = SQLConnection.getConnection();
            String sql = "exec Lay9SpKeTuSPThuTuTruyenVao " + firstResult + "," + categoryID;
            PreparedStatement ps = connection.prepareCall(sql);
            //ps.setInt(1, firstResult);
            ResultSet rs = ps.executeQuery();
            
            ArrayList<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getString("MaSP"));
                product.setProductName(rs.getString("TenSP"));
                product.setProductImage(rs.getString("AnhSP")); 
                product.setProductPrice(rs.getDouble("Gia"));
                product.setProductDecription(rs.getString("MoTa"));
                
                list.add(product);
             }
             return list;
        }
        // Phân trang ADMIN
        public ArrayList<Product> getListProductPT( int firstResult) throws SQLException
        {
            Connection connection = SQLConnection.getConnection();
            String sql = "exec Lay20SpKeTuSPThuTuTruyenVao '" + firstResult + "'";
            PreparedStatement ps = connection.prepareCall(sql);
            //ps.setInt(1, firstResult);
            ResultSet rs = ps.executeQuery();
            
            ArrayList<Product> list = new ArrayList<>();
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getString("MaSP"));
                product.setProductName(rs.getString("TenSP"));
                product.setProductPrice(rs.getDouble("Gia"));
                product.setProductDecription(rs.getString("MoTa"));
                product.setProductCategoryName(new CategoryDAO().getNameByID(rs.getString("MaLoaiSP")));
                product.setProductSupplierName(new SupplierDAO().getSupplierNameByID(rs.getString("MaNCC")));
                
                product.setProductStatus(rs.getString("TinhTrang"));   
                
                list.add(product);
             }
             return list;
        }
        public int countProduct () throws SQLException
        {
            Connection connection = SQLConnection.getConnection();
           
            String sql = "SELECT count(MaSP) FROM SANPHAM " ;
            PreparedStatement ps = connection.prepareCall(sql);
          
            ResultSet rs = ps.executeQuery();
            int count = 0;
            while (rs.next())
            {
               count = rs.getInt(1);
            }
             return count;

        }
        
        
        // Tính tổng số lượng sản phẩm
        
        public int countProductByCategory ( String categoryID) throws SQLException
        {
            Connection connection = SQLConnection.getConnection();
           
            String sql = "SELECT count(MaSP) FROM SANPHAM WHERE MaLoaiSP = '" + categoryID+ "'" ;
            PreparedStatement ps = connection.prepareCall(sql);
          
            ResultSet rs = ps.executeQuery();
            int count = 0;
            while (rs.next())
            {
               count = rs.getInt(1);
            }
             return count;

        }
        
        // Lấy danh sách sản phẩm từ tên nhập vào để tìm kiếm
        public ArrayList<Product> SearchProductByName(String name) throws SQLException
        {
          
            Connection connection = SQLConnection.getConnection();
           
            String sql = "SELECT * FROM SANPHAM WHERE dbo.fuConvertToUnsign1(TenSP) LIKE N'%' + dbo.fuConvertToUnsign1(N'"+ name +"') + '%'";
            PreparedStatement ps = connection.prepareCall(sql);

            ResultSet rs = ps.executeQuery();
            
            ArrayList<Product> list = new ArrayList();
              
            while (rs.next()) {
                Product product = new Product();
                product.setProductID(rs.getString("MaSP"));
                product.setProductName(rs.getString("TenSP"));
                product.setProductImage(rs.getString("AnhSP")); 
                product.setProductPrice(rs.getDouble("Gia"));
                product.setProductDecription(rs.getString("MoTa"));
                
                list.add(product);
            }
            
            return list;
            
        }
        
        // Chuyển từ chuỗi có dấu sang không dấu

        public String covertStringToURL(String str) {
            try {
                String temp = Normalizer.normalize(str, Normalizer.Form.NFD);
                Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
                return pattern.matcher(temp).replaceAll("").toLowerCase().replaceAll(" ", " ").replaceAll("đ", "d");
            } catch (Exception e) {
                e.printStackTrace(); 
            }
            return "";
        }
        
       
    //lay danh sach san pham 
        public ArrayList<Product> getListProduct() throws SQLException{
            Connection connection = SQLConnection.getConnection();
            ArrayList<Product> list = new ArrayList<>();
            String sql = "select * from (SANPHAM SP JOIN LOAISANPHAM LSP  on SP.MaLoaiSP= LSP.MaLoaiSP)JOIN NHACUNGCAP NCC ON NCC.MaNCC= SP.MaNCC";
            try {
            PreparedStatement ps = connection.prepareCall(sql);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Product product = new Product();
                    product.setProductID(rs.getString("MaSP"));
                    product.setProductName(rs.getString("TenSP"));
                    product.setProductPrice(rs.getDouble("Gia"));
                    product.setProductDecription(rs.getString("MoTa"));
                    product.setProductStatus(rs.getString("TinhTrang"));
                    product.setProductCategoryName(new CategoryDAO().getNameByID(rs.getString("MaLoaiSP")));
                    product.setProductSupplierName(new SupplierDAO().getSupplierNameByID(rs.getString("MaNCC")));
                    list.add(product);
                }
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return list;
        }

        // LẤY DANH SÁCH SẢN PHẨM @tenSP, @gia , @moTa, @tinhTrang,
        public Product getProduct(String product_ID) throws SQLException{
            Connection connection = SQLConnection.getConnection();
            Product product = new Product();
            String sql = "select TenSP,MoTa,Gia,TinhTrang from SANPHAM WHERE MaSP='"+product_ID+"'";
            try {
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    product.setProductName(rs.getString("TenSP"));
                    product.setProductDecription(rs.getString("MoTa"));
                    product.setProductPrice(rs.getInt("Gia"));
                    product.setProductStatus(rs.getString("TinhTrang"));
                    
                }
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return product;
        }
        
        // LẤY DANH SÁCH LOẠI SẢN PHẨM @maNCC, @maLSP, @tenSP, @anhSP, @gia , @moTa, @tinhTrang
        public ArrayList<Product> getListCategoryName() throws SQLException{
            Connection connection = SQLConnection.getConnection();
            ArrayList<Product> list = new ArrayList<>();
            String sql = "select MaLoaiSP,TenLoaiSP from LOAISANPHAM";
            try {
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Product product = new Product();
                    product.setProductCategoryID(rs.getString("MaLoaiSP"));
                    product.setProductCategoryName(rs.getString("TenLoaiSP"));
                    list.add(product);
                }
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return list;
        }
        //LẤY DANH SÁCH TÊN NHÀ CUNG CẤP
        public ArrayList<Product> getListSupplierName() throws SQLException{
            Connection connection = SQLConnection.getConnection();
            ArrayList<Product> list = new ArrayList<>();
            String sql = "select MaNCC, TenNCC FROM NHACUNGCAP";
            try {
            PreparedStatement ps = connection.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Product product = new Product();
                    product.setProductSupplier(rs.getString("MaNCC"));
                    product.setProductSupplierName(rs.getString("TenNCC"));
                    list.add(product);
                }
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return list;
        }
        //insert product
        public boolean insertProductDAO(Product p)
        {
          try{
             Connection connection = SQLConnection.getConnection();
             String sql = "EXEC sp_Insert ?,?,?,?,?,?,?";

             PreparedStatement ps = connection.prepareCall(sql);
             ps.setString(1, p.getProductSupplierName());
             ps.setString(2, p.getProductCategoryName());
             ps.setString(3, p.getProductName());
             ps.setString(4, p.getProductImage());
             ps.setDouble(5, p.getProductPrice());
             ps.setString(6, p.getProductDecription());
             ps.setString(7, p.getProductStatus());

             return ps.executeUpdate()==1 ; 
            } catch (Exception e) 
            {
                return false;
            }
        }

        public boolean update(String s)
        {
            try{
                Connection connection = SQLConnection.getConnection();
                String sql= "update SANPHAM SET AnhSP='"+s+"' WHERE MaSP='SP00006'";
                PreparedStatement ps = connection.prepareCall(sql);
                return ps.executeUpdate()==1 ; 
            }catch(SQLException e){
                return false;
            }
        }
        //update hình
        public boolean updateImage(Product p)
        {
            try{
                Connection connection = SQLConnection.getConnection();
                String sql= "EXEC UPDATE_ImageSP ?,?";
                PreparedStatement ps = connection.prepareCall(sql);
                ps.setString(1, p.getProductID());
                ps.setString(2, p.getProductImage());
                return ps.executeUpdate()==1 ; 
            }catch(SQLException e){
                return false;
            }
        }
        //update san pham
        public boolean updateProductDAO(Product p)
        {
          try{
             Connection connection = SQLConnection.getConnection();
             String sql = "EXEC UPDATE_SP ?,?,?,?,?";
             PreparedStatement ps = connection.prepareCall(sql);
             ps.setString(1, p.getProductID());
             ps.setString(2, p.getProductName());
             ps.setDouble(3, p.getProductPrice());
             ps.setString(4, p.getProductDecription());
             ps.setString(5, p.getProductStatus());

             return ps.executeUpdate()==1 ; 
            } catch (SQLException e) 
            {
                return false;
            }
        }

            public static void main(String[] args) throws SQLException {
            ProductDAO dao = new ProductDAO();
                System.out.println(dao.getListProductPT(3));
        }
}
