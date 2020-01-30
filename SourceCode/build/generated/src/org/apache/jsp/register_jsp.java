package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class register_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        <title>register</title>\n");
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
      out.write("        <script src=\"//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js\" type=\"text/javascript\"></script>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("              $(document).ready(function () {\n");
      out.write("                   var x_timer;\n");
      out.write("                   $(\"#email\").keyup(function (e) {\n");
      out.write("                        clearTimeout(x_timer);\n");
      out.write("                        var user_name = $(this).val();\n");
      out.write("                        x_timer = setTimeout(function () {\n");
      out.write("                            check_username_ajax(user_name);\n");
      out.write("                        }, 1000);\n");
      out.write("                        });\n");
      out.write("\n");
      out.write("                   function check_username_ajax(username) {\n");
      out.write("                        $(\"#user-result\").html('<img src=\"images/ajax-loader.gif\" />');\n");
      out.write("                        $.post('CheckEmailServlet', {'username': username}, function (data) {\n");
      out.write("                            $(\"#user-result\").html(data);\n");
      out.write("                         });\n");
      out.write("                   }\n");
      out.write("               });\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("        <div class=\"container\"> \n");
      out.write("\t     <div class=\"register\">\n");
      out.write("\t\t  \t  <form> \n");
      out.write("\t\t\t\t <div class=\"register-top-grid\">\n");
      out.write("\t\t\t\t\t<h3>Thông tin cá nhân</h3>\n");
      out.write("\t\t\t\t\t <div>\n");
      out.write("\t\t\t\t\t\t<span>Họ tên<label>*</label></span>\n");
      out.write("\t\t\t\t\t\t<input type=\"text\" name = \"name\"> \n");
      out.write("\t\t\t\t\t </div>\n");
      out.write("\t\t\t\t\t <div>\n");
      out.write("\t\t\t\t\t\t<span>Địa chỉ<label>*</label></span>\n");
      out.write("\t\t\t\t\t\t<input type=\"text\" name = \"address\"> \n");
      out.write("\t\t\t\t\t </div>\n");
      out.write("\t\t\t\t\t <div>\n");
      out.write("\t\t\t\t\t\t <span>Địa chỉ Email<label>*</label></span>\n");
      out.write("\t\t\t\t\t\t <input type=\"text\" name = \"email\" id=\"email\">\n");
      out.write("                                                 <span id =\"user-result\"></span>\n");
      out.write("\t\t\t\t\t </div>\n");
      out.write("\t\t\t\t\t <div class=\"clearfix\"> </div>\n");
      out.write("\t\t\t\t\t   <a class=\"news-letter\" href=\"#\">\n");
      out.write("\t\t\t\t\t\t <label class=\"checkbox\"><input type=\"checkbox\" name=\"checkbox\" checked=\"\"><i> </i>Nhận các thông báo qua email</label>\n");
      out.write("\t\t\t\t\t   </a>\n");
      out.write("\t\t\t\t\t </div>\n");
      out.write("\t\t\t\t     <div class=\"register-bottom-grid\">\n");
      out.write("\t\t\t\t\t\t    <h3>Thông tin tài khoản</h3>\n");
      out.write("\t\t\t\t\t\t\t <div>\n");
      out.write("\t\t\t\t\t\t\t\t<span>Mật khẩu<label>*</label></span>\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"text\" name = \"password\">\n");
      out.write("\t\t\t\t\t\t\t </div>\n");
      out.write("\t\t\t\t\t\t\t <div>\n");
      out.write("\t\t\t\t\t\t\t\t<span>Xác nhận mật khẩu<label>*</label></span>\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"text\">\n");
      out.write("\t\t\t\t\t\t\t </div>\n");
      out.write("\t\t\t\t\t\t\t <div class=\"clearfix\"> </div>\n");
      out.write("\t\t\t\t\t </div>\n");
      out.write("\t\t\t\t</form>\n");
      out.write("\t\t\t\t<div class=\"clearfix\"> </div>\n");
      out.write("\t\t\t\t<div class=\"register-but\">\n");
      out.write("\t\t\t\t   <form>\n");
      out.write("\t\t\t\t\t   <input type=\"submit\" value=\"Đăng ký\">\n");
      out.write("\t\t\t\t\t   <div class=\"clearfix\"> </div>\n");
      out.write("\t\t\t\t   </form>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t   </div>\n");
      out.write("          </div>\n");
      out.write("     \n");
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
