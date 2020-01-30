package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import model.Cart;
import DAO.CategoryDAO;
import model.Category;
import model.Product;
import DAO.ProductDAO;
import controller.CartServlet;

public final class product_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>product</title>\n");
      out.write("        \n");
      out.write("        <link href=\"css/bootstrap.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />\n");
      out.write("        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->\n");
      out.write("        <script src=\"js/jquery.min.js\"></script>\n");
      out.write("        <!-- Custom Theme files -->\n");
      out.write("        <!--theme-style-->\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\" type=\"text/css\" media=\"all\" />\t\n");
      out.write("        <!--//theme-style-->\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("        <meta name=\"keywords\" content=\"Bonfire Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, \n");
      out.write("              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design\" />\n");
      out.write("        <script type=\"application/x-javascript\"> addEventListener(\"load\", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>\n");
      out.write("        <!--fonts-->\n");
      out.write("        <link href='http://fonts.googleapis.com/css?family=Exo:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>\n");
      out.write("        <!--//fonts-->\n");
      out.write("        <script type=\"text/javascript\" src=\"js/move-top.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"js/easing.js\"></script>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            jQuery(document).ready(function ($) {\n");
      out.write("                $(\".scroll\").click(function (event) {\n");
      out.write("                    event.preventDefault();\n");
      out.write("                    $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("        <!--slider-script-->\n");
      out.write("        <script src=\"js/responsiveslides.min.js\"></script>\n");
      out.write("        <script>\n");
      out.write("            $(function () {\n");
      out.write("                $(\"#slider1\").responsiveSlides({\n");
      out.write("                    auto: true,\n");
      out.write("                    speed: 500,\n");
      out.write("                    namespace: \"callbacks\",\n");
      out.write("                    pager: true,\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("        <!--//slider-script-->\n");
      out.write("        <script>$(document).ready(function (c) {\n");
      out.write("                $('.alert-close').on('click', function (c) {\n");
      out.write("                    $('.message').fadeOut('slow', function (c) {\n");
      out.write("                        $('.message').remove();\n");
      out.write("                    });\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("        <script>$(document).ready(function (c) {\n");
      out.write("                $('.alert-close1').on('click', function (c) {\n");
      out.write("                    $('.message1').fadeOut('slow', function (c) {\n");
      out.write("                        $('.message1').remove();\n");
      out.write("                    });\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("        ");

            ProductDAO productDAO = new ProductDAO();
            String category_id = "";
            if(request.getParameter("category") != null)
            {
                category_id = request.getParameter("category");
            }
            
            CategoryDAO c = new CategoryDAO();
            
            
            Cart cart = (Cart) session.getAttribute("cart");
            if(cart == null)
            {
                cart = new Cart();
                session.setAttribute("cart",cart);
                
            }
            
            int pages = 0, firstResult =0,  total = 0;
            if(request.getParameter("pages") != null)
            {
                pages = (int) Integer.parseInt(request.getParameter("pages"));
            }
            
            total = productDAO.countProductByCategory(category_id);
            if(total <= 9)
            {
                firstResult = 0;
                     
            }
            else
            {
                firstResult = (pages - 1) * 9;
                     
            }
            
            ArrayList<Product> listProduct = productDAO.getListProductByNav(category_id, firstResult);
            
      out.write("\n");
      out.write("        <div class=\"content_top\">\n");
      out.write("            <h3 class=\"m_1\">");
      out.print(c.getNameByID(category_id));
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
      out.write("                                                <img width=\"225\" height=\"225\" src=\"");
      out.print(p.getProductImage());
      out.write("\" class=\"img-responsive\"  alt=\"item3\">\t\t                            </a>\n");
      out.write("                                                <a href=\"CartServlet?conmand=plus&productID=");
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
      out.write("                        <li ><a href=\"product.jsp?category=");
      out.print(category_id);
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
      out.write("                        <li><span><a href=\"product.jsp?category=");
      out.print(category_id);
      out.write("&pages=");
      out.print(i);
      out.write('"');
      out.write('>');
      out.print(i);
      out.write("</a></span></li>\n");
      out.write("                        ");
} else {
      out.write("\n");
      out.write("                        <li class=\"arrow\"><a href=\"product.jsp?category=");
      out.print(category_id);
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
      out.write("                        <li ><a href=\"product.jsp?category=");
      out.print(category_id);
      out.write("&pages=");
      out.print(next);
      out.write("\"><i class=\"next\"></i></a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("          </div>\n");
      out.write("                                \n");
      out.write("        </div>\n");
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
