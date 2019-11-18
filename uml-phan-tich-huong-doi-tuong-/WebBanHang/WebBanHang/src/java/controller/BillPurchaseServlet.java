/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.BillPurchaseDAO;
import java.io.IOException;
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
 * @author Thanh Nguyen
 */
public class BillPurchaseServlet extends HttpServlet {
    BillPurchaseDAO bill= new BillPurchaseDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String maDNH = request.getParameter("purchaseID");
        String maSP= request.getParameter("productID");
        String url = "";
        try {
            switch (command) {

                case "delete":
                    bill.deletetDetailBillPurchase(maDNH, maSP);
                    url = "/admin/manager_category.jsp";
                    break;
            }
        } catch (Exception e) {
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);

    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        
        String command= request.getParameter("command");
        String tenNCC= request.getParameter("tenNCC");
        String maNCC = "";
        String tensp= request.getParameter("tenSP");
        String soluong = request.getParameter("soluong");
        String maDNH="";
        String url="", error="";
        if(tenNCC=="--Nhà cung cấp--")
        {
            error="error";
            request.setAttribute("error", error);
        }
        
        try {
            if (error.length()==0)
            {
                
                switch(command){
                    case "insert":
                        maNCC= bill.getSupplierlID(tenNCC);
                        bill.insertBillPurchase(new BillPurchase(tenNCC));
                        maDNH=bill.getBillDetailID(tenNCC).getBillID();
                        url="/admin/detailBillPurchase.jsp?maDNH="+maDNH+"&maNCC="+maNCC;
                        break;
                    case "insertdetail":
                        maNCC = request.getParameter("maNCC");
                        BillPurchase billdetail = new BillPurchase();
                        maDNH= request.getParameter("maDNH");
                        billdetail.setBillID(maDNH);// set billID 
                        billdetail.setProductName(tensp); //SET TEN SAN PHAM
                        billdetail.setProductCount(Integer.parseInt(soluong)); // SET SO LUONG SAN PHAM 
                        bill.insertDetailBillPurchase(billdetail);
                        url="/admin/managerDetailBillPurchase.jsp?maDNH="+maDNH+"&maNCC="+maNCC;
                        break;
                }
            }
            else                 
                url="/admin/billPurchase.jsp";
        }catch (Exception e){
        }
        
        RequestDispatcher rd= getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
      
}
