/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Nguyen
 */
public class CheckEmailServlet extends HttpServlet {

    UserDAO userDAO = new UserDAO();
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Kiểm tra Email đã tồn tại chưa
         if (userDAO.checkEmail(request.getParameter("username"))) {
          response.getWriter().write("<img src=\"images/not-available.png\" />");
        } else {
          response.getWriter().write("<img src=\"images/available.png\" />");
            }
    }

    

}
