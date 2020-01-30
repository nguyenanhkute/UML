package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class banner_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>banner</title>\n");
      out.write("        <script type=\"text/javascript\" src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js\">\n");
      out.write("                    $(document).ready(function(){\n");
      out.write("\n");
      out.write("                  var count_banner = 4,\n");
      out.write("                  timmer_banner = null;\n");
      out.write("                $('.slogan').animate({\n");
      out.write("                  'opacity':1\n");
      out.write("                },5000);\n");
      out.write("                timmer_banner = setInterval(function(){\n");
      out.write("\n");
      out.write("                  if(count_banner < 0){\n");
      out.write("                    clearInterval(timmer_banner);\n");
      out.write("                    return false;\n");
      out.write("                  }\n");
      out.write("\n");
      out.write("                    $('.banner .photo-' + (count_banner)).addClass('active');\n");
      out.write("\n");
      out.write("                  count_banner--;\n");
      out.write("                },600);\n");
      out.write("\n");
      out.write("                });\n");
      out.write("         </script>\n");
      out.write("    </head>\n");
      out.write("    <body>  \n");
      out.write("\n");
      out.write("        <div class=\"banner-mat\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"banner\">\n");
      out.write("\n");
      out.write("                    <!-- Slideshow 4 -->\n");
      out.write("                    <div class=\"slider\">\n");
      out.write("                        <ul class=\"rslides\" id=\"slider1\">\n");
      out.write("                            <li><img src=\"images/banner.jpg\" alt=\"\">\n");
      out.write("                            </li>\n");
      out.write("                            <li><img src=\"images/banner1.jpg\" alt=\"\">\n");
      out.write("                            </li>\n");
      out.write("                            <li><img src=\"images/banner.jpg\" alt=\"\">\n");
      out.write("                            </li>\n");
      out.write("                            <li><img src=\"images/banner2.jpg\" alt=\"\">\n");
      out.write("                            </li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"banner-bottom\">\n");
      out.write("                        <div class=\"banner-matter\">\n");
      out.write("                            <p>Childish Gambino - Camp Now Available for just $9.99</p> \n");
      out.write("                            <a href=\"single.html\" class=\"hvr-shutter-in-vertical \">Purchase</a>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"purchase\">\n");
      out.write("                            <a href=\"single.html\" class=\"hvr-shutter-in-vertical hvr-shutter-in-vertical2 \">Purchase</a>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"clearfix\"></div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\t\t\t\t\n");
      out.write("                <!-- //slider-->\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\t\t\n");
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
