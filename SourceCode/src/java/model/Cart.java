/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Nguyen
 */
public class Cart {
    
    private HashMap<String, Item> cartItem;

    public Cart() {
        cartItem = new HashMap<>();
    }

    public Cart(HashMap<String, Item> cartItem) {
        this.cartItem = cartItem;
    }

    public HashMap<String, Item> getCartItem() {
        return cartItem;
    }

    public void setCartItem(HashMap<String, Item> cartItem) {
        this.cartItem = cartItem;
    }
    
    // Them vao gio hang
    
    public void  plusToCart(String key, Item item,int quantity)
    {
        boolean check = cartItem.containsKey(key);
        if (check)
        {
            int quantity_old = item.getQuantity();
            item.setQuantity(quantity_old  + quantity);
            cartItem.put(String.valueOf(key), item);   
        }
        else 
        {
            cartItem.put(key, item);
        }
    }
     public void  subToCart(String key, Item item)
    {
        boolean check = cartItem.containsKey(key);
        if (check)
        {
            int quantity_old = item.getQuantity();
            if(quantity_old <=1)
            {
                cartItem.remove(key);
            }
            else
            {
                item.setQuantity(quantity_old  - 1);
                cartItem.put(key, item);  
            }
             
        }
    }
      public void  removeToCart(String key)
    {
        boolean check = cartItem.containsKey(key);
        if (check)
        {
            cartItem.remove(key); 
        }
    }
      
      public int countItem()
      {
          int count = 0;
           for(Map.Entry<String, Item> list : cartItem.entrySet() )
          {
              count += list.getValue().getQuantity();
              
          }
           return count;
      }
      
      public double totalPriceCart()
      {
          double totalprice = 0; 
          //totalprice = price * soluong;
          for(Map.Entry<String, Item> list : cartItem.entrySet() )
          {
              totalprice += list.getValue().getProduct().getProductPrice() * list.getValue().getQuantity();
              
          }
          
          return totalprice;
      }
      
     
}
