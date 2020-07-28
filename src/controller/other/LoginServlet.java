package controller.other;

import com.mysql.cj.Session;
import priv.datastructure.traveluser;
import tools.DAO;
import tools.encode;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "controller.other.LoginServlet", urlPatterns = {"/loginServlet"})
public class LoginServlet extends HttpServlet {

    private Object session;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String check=request.getParameter("check");
        String checked=request.getSession().getAttribute("rand").toString();
        if (!check.equalsIgnoreCase(checked)){
            request.setAttribute("check",false);
            request.setAttribute("username",username);
            request.getRequestDispatcher("login.jsp").forward(request,response);
            return;
        }
        Number x=0;
        try {
            x= DAO.getForValue("select count(*) from traveluser where UserName=? and Pass = ?",username,encode.passWordEncode(password,username));
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(!x.toString().equals("0")){
            traveluser user = DAO.get(traveluser.class,"select * from traveluser where UserName=?",username);
            request.getSession().setAttribute("user",user);
            int UID=user.getUID();
            Cookie cookie = new Cookie("uid", encode.encode(UID+""));
            cookie.setMaxAge(60*60);
            response.addCookie(cookie);
            HttpSession session = request.getSession();
            if (session==null&&session.getAttribute("recent_url")==null){
                response.sendRedirect("Homepage.jsp");
            }
            else {
                try {
                    response.sendRedirect(session.getAttribute("recent_url").toString());
                }
                catch (Exception e){
                    request.getRequestDispatcher("Homepage.jsp").forward(request,response);
                }
            }
        }
        else {
            request.setAttribute("username",username);
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        doPost(request,response);
    }
}
