/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.ProductDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Item;
import model.Product;

/**
 *
 * @author Nguyen
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/CartServlet"})
public class CartServlet extends HttpServlet
{ 
    private final ProductDAO productDAO = new ProductDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       doPost(request,response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        HttpSession session = request.getSession();
        String command = request.getParameter("command");
        String productID = request.getParameter("productID");
        
        Cart cart = (Cart) session.getAttribute("cart");
        String url="";
        try
        {
            
            Product product = productDAO.getDetailProduct(productID);
            
            switch(command)
            {
                case "plus":
                    
                    if( request.getParameter("soluong")!= null)
                    {
                        if(cart.getCartItem().containsKey(productID))
                        {                        
                            cart.plusToCart(productID, new Item(product, cart.getCartItem().get(productID).getQuantity()),Integer.parseInt(request.getParameter("soluong")));
                        }
                        else
                        {
                            cart.plusToCart(productID, new Item(product, Integer.parseInt(request.getParameter("soluong"))),0);
                        }
                        
                    }
                    else
                    {
                        if(cart.getCartItem().containsKey(productID))
                        {                        
                            cart.plusToCart(productID, new Item(product, cart.getCartItem().get(productID).getQuantity()),1);
                        }
                        else
                        {
                            cart.plusToCart(productID, new Item(product, 1),0);
                        }
                    }
                    break;
                case "sub":
                    cart.removeToCart(productID);
                    break;
            }
        } catch(Exception e)
        {
            e.printStackTrace();
           url = "/shop/index.jsp";
        }
        
        session.setAttribute("cart", cart);
        response.sendRedirect(url);
        
        
        
    }

    
}
