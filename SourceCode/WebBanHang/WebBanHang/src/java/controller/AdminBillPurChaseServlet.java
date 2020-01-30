/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.BillPurchaseDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.BillPurchase;

/**
 *
 * @author Nguyen
 */
public class AdminBillPurChaseServlet extends HttpServlet {

    BillPurchaseDAO bill= new BillPurchaseDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
     
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String tenNCC="";
        String tensp="";
        String soluong="";
        String command= request.getParameter("command");
        tenNCC= request.getParameter("tenNCC");
        String maNCC = "";
        tensp= request.getParameter("tenSP");
        soluong = request.getParameter("soluong");
        String maDNH="";
        String url="", error="";
        
        
        
        
        try {
                switch(command){
                    case "insert":
                        if (error.length()==0)
                        {
                            maNCC= bill.getSupplierlID(tenNCC);
                            bill.insertBillPurchase(new BillPurchase(tenNCC));
                            maDNH=bill.getBillDetailID(tenNCC).getBillID();
                            url="/admin/detailBillPurchase.jsp?maDNH="+maDNH+"&maNCC="+maNCC;
                        }
                        else                 
                            url="/admin/billPurchase.jsp";
                        break;
                        
                    case "insertdetail":
                        if (error.length()==0)
                        {
                            maNCC = request.getParameter("maNCC");
                            BillPurchase billdetail = new BillPurchase();
                            maDNH= request.getParameter("maDNH");
                            billdetail.setBillID(maDNH);// set billID 
                            billdetail.setProductName(tensp); //SET TEN SAN PHAM
                            billdetail.setProductCount(Integer.parseInt(soluong)); // SET SO LUONG SAN PHAM 
                            bill.insertDetailBillPurchase(billdetail);
                            url="/admin/managerDetailBillPurchase.jsp?maDNH="+maDNH+"&maNCC="+maNCC;
                        }
                        else                 
                            url="/admin/detailBillPurchase.jsp";
                        break;
                }
            } catch (SQLException ex) {
            Logger.getLogger(AdminBillPurChaseServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        RequestDispatcher rd= getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
}
