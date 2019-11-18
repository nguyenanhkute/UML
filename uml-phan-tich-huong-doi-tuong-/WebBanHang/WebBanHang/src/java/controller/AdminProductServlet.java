/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
public class AdminProductServlet extends HttpServlet {

     ProductDAO prdDAO = new ProductDAO();
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        
      
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { 
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        
        
        String command= request.getParameter("command");
        String url="", error="";
        
        try {
            switch(command){
                case "update":
                    String productStatus= request.getParameter("productStatus");        
                    String productName= request.getParameter("productName");
                    String productID= request.getParameter("productID");
                    String productDescribe= request.getParameter("productDescribe");
                    String productPrice= request.getParameter("productPrice");
                    if(productName.equals("")||productPrice.equals("")||productDescribe.equals("")||productStatus.equals(""))
                    {
                        error="vui lòng nhập lại tên sản phẩm";
                        //request.setAttribute("error", error);
                    }
                    if (error.length()==0)
                    {
                        prdDAO.updateProductDAO(new Product(productID,productName,Double.parseDouble(productPrice),productDescribe,productStatus));
                        url="/admin/Product.jsp";
                    }
                    break;
                case "insert":

                    String tenSP=request.getParameter("tenSP"); 
                    String tenNCC= request.getParameter("tenNCC");
                    String tenLSP=request.getParameter("tenLSP");
                    String gia= request.getParameter("gia");
                    String mota=request.getParameter("mota");
                    String tinhtrang=request.getParameter("tinhtrang");

                    if(tenSP.equals("")||tenNCC.equals("--Nhà cung cấp--")||tenLSP.equals("--LOẠI SP--")||gia.equals("")||mota.equals("")||tinhtrang.equals(""))
                    {
                        error="vui lòng nhập lại tên sản phẩm";
                        request.setAttribute("error", error);
                    }
                    if (error.length()==0)
                    {
                        prdDAO.insertProductDAO(new Product(tenNCC,tenLSP,tenSP,"",Double.parseDouble(gia),mota,tinhtrang));
                        url="/admin/Product.jsp";
                    }
                    break;
            }   
        }catch (Exception e){
           
        }
         url="/admin/Product.jsp";
        RequestDispatcher rd= getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

}
