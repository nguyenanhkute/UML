/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.CustomerDAO;
import connect.SQLConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Bill;
import model.Customer;
import model.Item;

/**
 *
 * @author Nguyen
 */
public class CustomerServlet extends HttpServlet {
 
    private CustomerDAO ctdao = new CustomerDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String url="";
        try {
            //Connection connection = SQLConnection.getConnection();
            
            //HttpSession session = request.getSession();
            
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String sdt = request.getParameter("sdt");
            String sex = request.getParameter("sex");
            String birthday = request.getParameter("birthday");
            email = request.getParameter("email");
            
            if (name.equals("") || address.equals("") || sdt.equals("") || sex.equals("") || birthday.equals("") || email.equals("") )
            {
                url = "/shop/infocheckout.jsp";
            }
            else
            {
                Customer ct = new Customer(email,name,address,sdt,sex,birthday);       
                ctdao.InsertCustomer(ct);
                url = "/shop/confirmBill.jsp?email="+email+"";
            }
            
            
        } catch (SQLException ex) {
            //Logger.getLogger(CustomerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.sendRedirect(url);
        
    }

  

}
