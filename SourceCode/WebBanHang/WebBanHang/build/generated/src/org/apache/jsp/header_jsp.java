package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import model.Product;
import DAO.ProductDAO;
import model.Cart;
import DAO.UserDAO;
import DAO.CustomerDAO;
import model.User;
import DAO.CategoryDAO;
import model.Category;

public final class header_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/jsp; charset=UTF-8\">\n");
      out.write("        <title>header</title>\n");
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
      out.write("        \n");
      out.write("\n");
      out.write("        <script>$('#searchID').keypress(function(event) {\n");
      out.write("         var keycode = (event.keyCode ? event.keyCode : event.which);\n");
      out.write("            if (keycode == '13') {\n");
      out.write("              alert('Bạn vừa nhấn phím \"enter\" trên trang web');\n");
      out.write("            }\n");
      out.write("        });\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("       \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <div class=\"wrap-box\"></div>\n");
      out.write("            <div class=\"header_bottom\">\n");
      out.write("                    <div class=\"container\">\n");
      out.write("                        <div class=\"col-xs-8 header-bottom-left\">\n");
      out.write("                                <div class=\"col-xs-2 logo\">\n");
      out.write("                                    <h1><a href=\"index.jsp\"><span>Tet's </span>shop</a></h1>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"col-xs-6 menu\">\n");
      out.write("                                    <ul class=\"megamenu skyblue\">\n");
      out.write("                                        \n");
      out.write("                                            <li class=\"grid\"><a class=\"color1\" >Trang trí</a><div class=\"megapanel\">\n");
      out.write("                                                        <div class=\"row\">\n");
      out.write("                                                                <div class=\"coll\">\n");
      out.write("                                                                        <div class=\"h_nav\">\n");
      out.write("                                                                            <ul>\n");
      out.write("                                                                                ");

                                                                                    CategoryDAO categoryDAO = new CategoryDAO();
                                                                                    
                                                                                    for(Category c: categoryDAO.getListCategoryByDirectory(String.valueOf("DM00004")) ) {
                                                                                
      out.write("\n");
      out.write("                                                                                        <li><a href=\"product.jsp?category=");
      out.print(c.getCategoryID());
      out.write("&pages=1\"> ");
      out.print(c.getCategoryName());
      out.write("</a></li>\n");
      out.write("                                                                                ");

                                                                                    }
                                                                                
      out.write("\n");
      out.write("                                                                            </ul>\n");
      out.write("                                                                        </div>\t\n");
      out.write("                                                                </div>\n");
      out.write("                                                        </div>\n");
      out.write("                                                  </div>\n");
      out.write("                                             </li>\n");
      out.write("                                            <li class=\"grid\"><a class=\"color2\" >Bánh kẹo</a><div class=\"megapanel\">                             \n");
      out.write("                                                        <div class=\"row\">\n");
      out.write("                                                                <div class=\"col1\">\n");
      out.write("                                                                        <div class=\"h_nav\">\n");
      out.write("                                                                                <ul>\n");
      out.write("                                                                                ");

                                                                                   
                                                                                    
                                                                                    for(Category c: categoryDAO.getListCategoryByDirectory(String.valueOf("DM00001")) ) {
                                                                                
      out.write("\n");
      out.write("                                                                                        <li><a href=\"product.jsp?category=");
      out.print(c.getCategoryID());
      out.write("&pages=1\"> ");
      out.print(c.getCategoryName());
      out.write("</a></li>\n");
      out.write("                                                                                ");

                                                                                    }
                                                                                
      out.write("\n");
      out.write("                                                                                        \n");
      out.write("                                                                                </ul>\t\n");
      out.write("                                                                        </div>\t\t\t\t\t\t\t\n");
      out.write("                                                                </div>\n");
      out.write("                                                                \n");
      out.write("                                                          </div>\n");
      out.write("                                                        </div>\n");
      out.write("                                             </li>\n");
      out.write("                                            <li class=\"grid\"><a class=\"color3\" >Mức</a><div class=\"megapanel\">                             \n");
      out.write("                                                        <div class=\"row\">\n");
      out.write("                                                                <div class=\"col1\">\n");
      out.write("                                                                        <div class=\"h_nav\">\n");
      out.write("                                                                                <ul>\n");
      out.write("                                                                                ");

                                                                                    
                                                                                    
                                                                                    for(Category c: categoryDAO.getListCategoryByDirectory(String.valueOf("DM00003")) ) {
                                                                                
      out.write("\n");
      out.write("                                                                                        <li><a href=\"product.jsp?category=");
      out.print(c.getCategoryID());
      out.write("&pages=1\"> ");
      out.print(c.getCategoryName());
      out.write("</a></li>\n");
      out.write("                                                                                ");

                                                                                    }
                                                                                
      out.write("\n");
      out.write("                                                                                        \n");
      out.write("                                                                                </ul>\t\n");
      out.write("                                                                        </div>\t\t\t\t\t\t\t\n");
      out.write("                                                                </div>\n");
      out.write("                                                                \n");
      out.write("                                                          </div>\n");
      out.write("                                                        </div>\n");
      out.write("                                             </li>\n");
      out.write("                                            <li class=\"grid\"><a class=\"color4\">Hoa tết</a><div class=\"megapanel\">                             \n");
      out.write("                                                        <div class=\"row\">\n");
      out.write("                                                                <div class=\"col1\">\n");
      out.write("                                                                        <div class=\"h_nav\">\n");
      out.write("                                                                                <ul>\n");
      out.write("                                                                                ");

                                                                                    
                                                                                    
                                                                                    for(Category c: categoryDAO.getListCategoryByDirectory(String.valueOf("DM00002")) ) {
                                                                                
      out.write("\n");
      out.write("                                                                                        <li><a href=\"product.jsp?category=");
      out.print(c.getCategoryID());
      out.write("&pages=1\"> ");
      out.print(c.getCategoryName());
      out.write("</a></li>\n");
      out.write("                                                                                ");

                                                                                    }
                                                                                
      out.write("\n");
      out.write("                                                                                </ul>\t\n");
      out.write("                                                                        </div>\t\t\t\t\t\t\t\n");
      out.write("                                                                </div>\n");
      out.write("                                                                \n");
      out.write("                                                          </div>\n");
      out.write("                                                        </div>\n");
      out.write("                                             </li>\n");
      out.write("                                           \t\t\t\n");
      out.write("                                           \n");
      out.write("                                            <li><a class=\"color6\" href=\"contact.jsp\">Hỗ trợ</a></li>\n");
      out.write("                                    </ul>\n");
      out.write("                                    </div>\n");
      out.write("                              </div>\n");
      out.write("                        \n");
      out.write("                    \n");
      out.write("                   \n");
      out.write("                    <div class=\"col-xs-4 header-bottom-right\">\n");
      out.write("                        ");

                            //UserDAO usdao = new UserDAO();
                            User user = null;
                            if (session.getAttribute("user") != null)
                            {
                                user = (User) session.getAttribute("user");
                            }

                        
      out.write("\n");
      out.write("                        <div class=\"cssmenu\">\n");
      out.write("\t\t\t<ul>\n");
      out.write("                           ");
if (user == null) {
      out.write("\n");
      out.write("                           <li><a href=\"login.jsp\">Đăng nhập</a></li> \n");
      out.write("                           ");
}
      out.write("\n");
      out.write("                           ");
if (user != null) {
      out.write("\n");
      out.write("                           <li><a href=\"login.jsp\">");
      out.print(new UserDAO().getCustomerNameByID(user.getCustomerID()));
      out.write("</a></li> \n");
      out.write("                           ");
}
      out.write("\n");
      out.write("\t\t\t</ul>\n");
      out.write("                        </div>\n");
      out.write("                        \n");
      out.write("                        <div class=\"box_1-cart\">\n");
      out.write("                            ");

                                Cart cart = null;
                            if (session.getAttribute("cart") != null)
                            {
                                cart = (Cart) session.getAttribute("cart");
                            }
                            
      out.write("\n");
      out.write("                             <div class=\"box_11\"><a href=\"checkout.jsp\">\n");
      out.write("                                     ");
if ( cart != null ) {
      out.write("\n");
      out.write("                                     <h4><p>Giỏ hàng (<span>");
      out.print(cart.countItem());
      out.write("</span>)</p>\n");
      out.write("                                     ");
 }
      out.write("\n");
      out.write("                                  <img src=\"images/bag.png\" alt=\"\"/>\n");
      out.write("                                  <div class=\"clearfix\"> </div>\n");
      out.write("                              </h4>\n");
      out.write("                              </a></div>\n");
      out.write("                          <div class=\"clearfix\"> </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"search\">\t \n");
      out.write("                            \n");
      out.write("                            <form  action=\"SearchServlet\" method = \"POST\">\n");
      out.write("                                <input type=\"text\" id=\"searchID\" name=\"search\" class=\"textbox\" value=\"Tìm kiếm\" onfocus=\"this.value = '';\" onblur=\"if (this.value == '') {this.value = 'Tìm kiếm';}\"  >\n");
      out.write("\n");
      out.write("                                <div id=\"response\"> </div>\n");
      out.write("                            </form>\n");
      out.write("                        </div>\n");
      out.write("                        \n");
      out.write("                        <div class=\"clearfix\"></div>\n");
      out.write("                    </div>\n");
      out.write("                <div class=\"clearfix\"></div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    \n");
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
