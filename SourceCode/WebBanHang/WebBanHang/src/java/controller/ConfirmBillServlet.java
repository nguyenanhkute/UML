/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.BillDAO;
import DAO.BillInfoDAO;
import DAO.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Bill;
import model.BillInfo;
import model.Cart;
import model.Item;
import model.User;

/**
 *
 * @author Nguyen
 */
public class ConfirmBillServlet extends HttpServlet {

    private BillInfoDAO billInfoDAO = new BillInfoDAO();
    private BillDAO billDAO = new BillDAO();
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        HttpSession session = request.getSession();
        //String command = request.getParameter("command");
        Cart cart = (Cart) session.getAttribute("cart");
        String customerID = "";
        User user = (User) session.getAttribute("user");        
        
       
        
        
        try{
            
            if (user != null)
            {
                customerID = user.getCustomerID();
            }
            else 
            {
                try {
                    customerID =  new CustomerDAO().getCustomerIDByEmail(request.getParameter("email"));
                } catch (SQLException ex) {
                    Logger.getLogger(ConfirmBillServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            Bill bill = new Bill();

            bill.setCustomerID(customerID);
            bill.setStatus("Đã xác nhận");
            bill.setTotal(cart.totalPriceCart());
           // bill.setDateOder(new Date().getTime());
            
            billDAO.InsertBill(bill);
           
            for(Map.Entry<String,Item> list : cart.getCartItem().entrySet())
            {
                billInfoDAO.InsertBillInfo(new BillInfo(list.getValue().getProduct().getProductID(), list.getValue().getQuantity()),new BillDAO().getBillIDByCustomerID(customerID));
            }
            
        } catch(Exception e)
        {
            response.sendRedirect("/shop/index.jsp");
        }
        response.sendRedirect("/shop/index.jsp");
        cart.getCartItem().clear();
    }

   

}
