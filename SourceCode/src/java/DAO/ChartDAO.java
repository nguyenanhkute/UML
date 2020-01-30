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
import model.chart_value_sale;

/**
 *
 * @author N
 */
public class ChartDAO {
    public ArrayList<chart_value_sale> getListChart()
    {
        Connection connection = SQLConnection.getConnection();
        ArrayList<chart_value_sale> list= new ArrayList<>();
        String sql="select LSP.TenLoaiSP, SUM(SP.Gia*DH.SoLuong) as tongtien from ((CHITIETDONHANG DH JOIN SANPHAM SP ON DH.MaSP= SP.MaSP) JOIN LOAISANPHAM LSP ON LSP.MaLoaiSP= SP.MaLoaiSP)GROUP BY LSP.TenLoaiSP";
        try {
            String tenLSP="";
            int tongSL;
            PreparedStatement ps= connection.prepareCall(sql);
            ResultSet rs= ps.executeQuery();
            while(rs.next())
            {
                tenLSP=rs.getString("TenLoaiSP") ;
                tongSL= rs.getInt("tongtien");
                chart_value_sale chart= new chart_value_sale(tenLSP,tongSL);
                list.add(chart);
            }
            connection.close();
            return list;
        } catch (SQLException e) {
            Logger.getLogger(ChartDAO.class.getName()).log(Level.SEVERE,null,e);
            return null;
        }
        
    }
    public static void main(String[] args) {
        for(chart_value_sale c : new ChartDAO().getListChart())
            System.out.println(c.getCategoryName ()+" - "+c.getSumcount());
    }
}
