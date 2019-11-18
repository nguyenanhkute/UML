/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CategoryDAO;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;

/**
 *
 * @author Nguyen
 */
public class ManagerCategoryServlet extends HttpServlet {
 
    CategoryDAO cgrDAO= new CategoryDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { 
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command= request.getParameter("command");
        String CategoryID= request.getParameter("CategoryID");
        String TypeName= request.getParameter("TypeName");        
        String tenLSP= request.getParameter("tenLSP");
        
        String url="", error="";
        if(tenLSP.equals(""))
        {
            error="vui lòng nhập lại tên loại sản phẩm";
            request.setAttribute("error", error);
        }
        
        try {
            if (error.length()==0)
            {
                switch(command){
                    case "update":
                        cgrDAO.updateCategoryDAO(new Category(CategoryID,tenLSP,TypeName));
                        url="/admin/Category.jsp";
                        break;
                }
            }
            else
            {
                switch(command){
                    case "update":
                        url="/admin/update_category.jsp";
                        break;
                }
            }
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
        String tenLSP= request.getParameter("tenLSP");
        String tendanhmuc= request.getParameter("tendanhmuc");
        
        String url="", error="";
        if(tenLSP.equals(""))
        {
            error="vui lòng nhập lại tên loại sản phẩm";
            
            request.setAttribute("error", error);
        }
        
        try {
            if (error.length()==0)
            {
                switch(command){
                    case "insert":
                        cgrDAO.insertCategoryDAO(new Category(tenLSP,tendanhmuc));
                        url="/admin/Category.jsp";
                        break;
                }
            }else 
            {
                switch(command){
                    case "insert":
                        url="/admin/insert_category.jsp";
                        break;
                }
            }
        }catch (Exception e){
        }
        RequestDispatcher rd= getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    } 
    
}
