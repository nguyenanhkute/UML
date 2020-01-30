package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import DAO.CategoryDAO;
import model.Category;
import model.Product;
import DAO.ProductDAO;

public final class decoration_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>decoration</title>\n");
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

                                    for(Product p: productDAO.getListProductByCategory(String.valueOf(category_id)) ){
                                    
      out.write("\n");
      out.write("\t\t\t\t<div class=\"col_1_of_3 span_1_of_3 simpleCart_shelfItem\">\n");
      out.write("                                    <div class=\"shop-holder\">\n");
      out.write("\t\t                         <div class=\"product-img\">\n");
      out.write("\t\t                            <a href=\"single.html\">\n");
      out.write("                                                <img width=\"225\" height=\"225\" src=\"");
      out.print(p.getProductImage());
      out.write("\" class=\"img-responsive\"  alt=\"item4\">\t\t                            </a>\n");
      out.write("\t\t                            <a href=\"\" class=\"button item_add\"></a>\t\t                         \n");
      out.write("                                         </div>\n");
      out.write("\t\t                    </div>\n");
      out.write("\t\t                    <div class=\"shop-content\" style=\"height: 45px;\">\n");
      out.write("\t\t                          \n");
      out.write("\t\t                            <h3><a href=\"single.html\">Đèn tròn đỏ</a></h3>\n");
      out.write("\t\t                            <span class=\"amount item_price\">150.000</span>\n");
      out.write("\t\t                    </div>\n");
      out.write("                                </div> \n");
      out.write("                                \n");
      out.write("                                ");
 }
                                    
      out.write("\n");
      out.write("                                <div class=\"clearfix\"></div> \n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t\n");
      out.write("\t\t<div class=\"clearfix\"></div>\n");
      out.write("                </div>\n");
      out.write("                </div>\n");
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
