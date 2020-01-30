package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import model.Product;
import DAO.CategoryDAO;
import DAO.ProductDAO;
import model.Cart;

public final class search_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>search</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("        ");

            ProductDAO productDAO = new ProductDAO();
            String name = "";
            if(request.getParameter("name") != null)
            {
                name = request.getParameter("name");
            }
            
            
            Cart cart = (Cart) session.getAttribute("cart");
            if(cart == null)
            {
                cart = new Cart();
                session.setAttribute("cart",cart);
                
            }
            
            int pages = 0,   total = 0;
            if(request.getParameter("pages") != null)
            {
                pages = (int) Integer.parseInt(request.getParameter("pages"));
            }
            
            total = productDAO.countProductByCategory(name);
           
            
            
            ArrayList<Product> listProduct = productDAO.SearchProductByName(name);
            
      out.write("\n");
      out.write("        <div class=\"content_top\">\n");
      out.write("            <h3 class=\"m_1\">Kết quả tìm kiếm của: ");
      out.print(name);
      out.write("</h3>\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <div class=\"box_1\">\n");
      out.write("                         <div class=\"col-md-10\">\n");
      out.write("\t\t\t    <div class=\"section group\">\n");
      out.write("                                \n");
      out.write("                                ");

                                    for(Product p: listProduct ){
                                    
      out.write("\n");
      out.write("\t\t\t\t<div class=\"col_1_of_3 span_1_of_4 simpleCart_shelfItem\">\n");
      out.write("                                    <div class=\"shop-holder\">\n");
      out.write("\t\t                         <div class=\"product-img\">\n");
      out.write("                                             <a href=\"detail.jsp?productID=");
      out.print(p.getProductID());
      out.write("\"></a>\n");
      out.write("                                                <img width=\"225\" height=\"225\" src=\"images/");
      out.print(p.getProductImage());
      out.write("\" class=\"img-responsive\"  alt=\"item4\">\t\t                            </a>\n");
      out.write("                                                <a href=\"CartServlet?command=plus&productID=");
      out.print(p.getProductID());
      out.write("\" class=\"button item_add\"></a>\t\t                         \n");
      out.write("                                         </div>\n");
      out.write("\t\t                    </div>\n");
      out.write("\t\t                    <div class=\"shop-content\" style=\"height: 150px; width: 150px\">\n");
      out.write("\t\t                          \n");
      out.write("\t\t                            <h3><a href=\"detail.jsp?productID=");
      out.print(p.getProductID());
      out.write('"');
      out.write('>');
      out.print(p.getProductName());
      out.write("</a></h3>\n");
      out.write("\t\t                            <span class=\"amount item_price\">");
      out.print(p.getProductPrice());
      out.write("</span>\n");
      out.write("\t\t                    </div>\n");
      out.write("                                    \n");
      out.write("                                </div> \n");
      out.write("                                \n");
      out.write("                                ");
 }
                                    
      out.write("\n");
      out.write("                                <div class=\"clearfix\"></div> \n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    <div class=\"clearfix\"></div>\n");
      out.write("                    <ul class=\"start\" >    \n");
      out.write("                        ");
                //Button Previous
                            int back = 0;
                            if (pages == 0 || pages == 1) {
                                back = 1;//Luon la page 1
                            } else {
                                back = pages - 1;//Neu pages tu 2 tro len thi back tru 1
                            }
                        
      out.write("\n");
      out.write("                        <li ><a href=\"searach.jsp?name=");
      out.print(name);
      out.write("&pages=");
      out.print(back);
      out.write("\"><i></i></a></li>\n");
      out.write("                        ");

                            //Button Number pages
                            int loop = 0, num = 0;
                            if ((total / 9) % 2 == 0) {
                                num = total / 4;
                            } else {
                                num = (total + 1) / 9;
                            }
                            //Nếu total lẻ thêm 1
                            if (total % 2 != 0) {
                                loop = (total / 9) + 1;

                            } else {
                                //Nếu total chẵn nhỏ hơn fullpage và # fullPage thì thêm 1
                                if (total < (num * 9) + 9 && total != num * 9) {
                                    loop = (total / 9) + 1;
                                } else {
                                    //Nếu bằng fullPage thì không thêm
                                    loop = (total / 9);
                                }
                            }
                            //Lap so pages
                        for (int i = 1; i <= loop; i++) {
      out.write("\n");
      out.write("                        ");
 if (pages == i) {
      out.write(" \n");
      out.write("\n");
      out.write("                        <li><span><a href=\"search.jsp?name=");
      out.print(name);
      out.write("&pages=");
      out.print(i);
      out.write('"');
      out.write('>');
      out.print(i);
      out.write("</a></span></li>\n");
      out.write("                        ");
} else {
      out.write("\n");
      out.write("                        <li class=\"arrow\"><a href=\"search.jsp?name=");
      out.print(name);
      out.write("&pages=");
      out.print(i);
      out.write('"');
      out.write('>');
      out.print(i);
      out.write("</a> </li>\n");
      out.write("\n");
      out.write("                        ");
}
                             }
      out.write("\n");
      out.write("                        ");

                                        //Button Next
                            int next = 0;
                            //Nếu total lẻ
                            if (total % 2 != 0) {
                                if (pages == (total / 9) + 1) {
                                    next = pages;//Khong next
                                } else {
                                    next = pages + 1;//Co next
                                }
                            } else {
                                //Nếu total chẵn nhỏ hơn fullpage
                                //Và không fullPage thì thêm 1
                                if (total < (num * 9) + 9 && total != num * 9) {
                                    if (pages == (total / 9) + 1) {
                                        next = pages;//Khong next
                                    } else {
                                        next = pages + 1;//Co next
                                    }
                                } else {
                                    //Nếu fullPage đến trang cuối dừng
                                    //Chưa tới trang cuối thì được next
                                    if (pages == (total / 9)) {
                                        next = pages;//Khong next
                                    } else {
                                        next = pages + 1;//Co next
                                    }
                                }
                            }
                        
      out.write("\n");
      out.write("                        <li ><a href=\"search.jsp?name=");
      out.print(name);
      out.write("&pages=");
      out.print(next);
      out.write("\"><i class=\"next\"></i></a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("                                \n");
      out.write("       \n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
