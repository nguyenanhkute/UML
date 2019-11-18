/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ProductDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author Nguyen
 */
public class ManagerProductServlet extends HttpServlet {
    ProductDAO prdDAO = new ProductDAO();
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command= request.getParameter("command");
        String productStatus= request.getParameter("productStatus");        
        String productName= request.getParameter("productName");
        String productID= request.getParameter("productID");
        String productDescribe= request.getParameter("productDescribe");
        String productPrice= request.getParameter("productPrice");
        String url="", error="";
        
        if(productName.equals("")||productPrice.equals("")||productDescribe.equals("")||productStatus.equals(""))
        {
            error="vui lòng nhập lại tên sản phẩm";
            //request.setAttribute("error", error);
        }
        try {
            if (error.length()==0)
            {
                switch(command){
                    case "update":
                        prdDAO.updateProductDAO(new Product(productID,productName,Integer.parseInt(productPrice),productDescribe,productStatus));
                        url="/admin/Product.jsp";
                        break;
                }
            }else
                    url="/admin/update_product.jsp?command=update&ProductID="+productID;
        }catch (Exception e){
        }
        RequestDispatcher rd= getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { 
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        
        String command= request.getParameter("command");
        String tenSP=request.getParameter("tenSP"); 
        String tenNCC= request.getParameter("tenNCC");
        String tenLSP=request.getParameter("tenLSP");
        String gia= request.getParameter("gia");
        String mota=request.getParameter("mota");
        String tinhtrang=request.getParameter("tinhtrang");
        
        String url="", error="";
        if(tenSP.equals("")||tenNCC=="--Nhà cung cấp--"||tenLSP=="--LOẠI SP--"||gia.equals("")||mota.equals("")||tinhtrang.equals(""))
        {
            error="vui lòng nhập lại tên sản phẩm";
            request.setAttribute("error", error);
        }
        
        try {
            if (error.length()==0)
            {
                switch(command){
                    case "insert":
                        prdDAO.insertProductDAO(new Product(tenNCC,tenLSP,tenSP,"",Integer.parseInt(gia),mota,tinhtrang));
                        url="/admin/Product.jsp";
                        break;
                }
            }
            else                 
                url="/admin/insert_product.jsp";
        }catch (Exception e){
            response.sendRedirect("/admin/insert_product.jsp");
        }
        RequestDispatcher rd= getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

}
