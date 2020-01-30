/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

/**
 *
 * @author Nguyen
 */
public class AdminCategoryServlet extends HttpServlet {
    
    CategoryDAO cgrDAO= new CategoryDAO();
   
  

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
                    case "insert":
                       
                        String tenLSP= request.getParameter("tenLSP");
                        String tendanhmuc= request.getParameter("tendanhmuc");
                        if(tenLSP.equals(""))
                        {
                            error="vui lòng nhập lại tên loại sản phẩm";

                            request.setAttribute("error", error);
                        }
                        if (error.length()==0)
                        {
                        cgrDAO.insertCategoryDAO(new Category(tenLSP,tendanhmuc));
                        url="/admin/Category.jsp";
                        }
                        else url="/admin/insert_category.jsp";
                        break;
                        
                    case "update":
                        String CategoryID= request.getParameter("CategoryID");
                        String TypeName= request.getParameter("TypeName");        
                        String TenLSP= request.getParameter("tenLSP");
                        
                        if(TenLSP.equals(""))
                        {
                            error="vui lòng nhập lại tên loại sản phẩm";
                            request.setAttribute("error", error);
                        }
                        if (error.length()==0)
                        {
                            cgrDAO.updateCategoryDAO(new Category(CategoryID,TenLSP,TypeName));
                            url="/admin/Category.jsp";
                        }
                        else  url="/admin/update_category.jsp";
                        break;
            }
        }catch (Exception e){
        }
        RequestDispatcher rd= getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }

    
}
