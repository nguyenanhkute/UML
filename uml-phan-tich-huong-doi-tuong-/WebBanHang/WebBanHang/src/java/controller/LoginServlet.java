/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.CustomerDAO;
import DAO.UserDAO;
import DAO.loginDAO;
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
import javax.servlet.http.HttpSession;
import model.Customer;
import model.User;

/**
 *
 * @author Nguyen
 */
public class LoginServlet extends HttpServlet {

    UserDAO u = new UserDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String command= request.getParameter("command");
        String url="";
        
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String sdt = request.getParameter("sdt");
        String sex = request.getParameter("sex");
        String birthday = request.getParameter("birthday");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        
        try {
            new CustomerDAO().InsertCustomer(new Customer(email,name,address,sdt,sex,birthday));
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        User user = new User();
        HttpSession session = request.getSession();
        
        String error="";
        
        
        switch(command)
        {
            case "insert":
               
                if(name.equals("") || address.equals("") || sdt.equals("") || sex.equals("") || birthday.equals("") || email.equals("") || pass.equals("") )
                {
                    error = "Lỗi";
                }
                if (error.length() == 0)
                {
                    try {
                        user.setCustomerID(new CustomerDAO().getCustomerIDByEmail(email));
                    } catch (SQLException ex) {
                        Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }

                    user.setPassword(request.getParameter("password"));

                    u.insertUser(new User(request.getParameter("email"),request.getParameter("password")));

                    session.setAttribute("user", user);
                    url = "/index.jsp";
                }
                
                else
                    url = "/register.jsp";
                
                break;
                
            case "login":
                
                user = u.login(email, request.getParameter("password"));
                if(user != null)
                {
                    session.setAttribute("user",user);
                    url = "/index.jsp";
                }
                else
                {
                   url = "/login.jsp"; 
                }
                break;
                
            case "admin":
                
                
                boolean login = new loginDAO().login(request.getParameter("username"), request.getParameter("password"));
              
                if(login == false )
                {
                    url = "/admin/login.jsp";
                }
                else
                {
                    session.setAttribute("user",user); 
                    url = "/admin/main.jsp";
                }
                
                break;
        }

    
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);

}
}