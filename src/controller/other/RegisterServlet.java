package controller.other;

import priv.datastructure.traveluser;
import tools.DAO;
import tools.encode;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/registerServlet"})
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Number x=0;
        String password= request.getParameter("password");
        String username= request.getParameter("username");
        String email = request.getParameter("mail");
        String check=request.getParameter("check");
        String checked=request.getSession().getAttribute("rand").toString();
        if (!check.equalsIgnoreCase(checked)){
            request.setAttribute("check",false);
            request.setAttribute("username",username);
            request.getRequestDispatcher("register.jsp").forward(request,response);
            return;
        }
        try {
            x= DAO.getForValue("select count(*) from traveluser where UserName=?",username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(x.toString().equals("0")) {
            try {
                DAO.update("insert into traveluser (Email, UserName, Pass, State, DateJoined, DateLastModified, whetherseen) VALUES\n" +
                        "(?,?,?,?,now(),now(),false)", email, username, encode.passWordEncode(password, username), 1);
                traveluser user = DAO.get(traveluser.class, "select * from traveluser where UserName=?", username);
                request.getSession().setAttribute("user", user);
                int UID = user.getUID();
                Cookie cookie = new Cookie("uid", encode.encode(UID + ""));
                cookie.setMaxAge(60 * 60);
                response.addCookie(cookie);
                HttpSession session = request.getSession();
                if (session == null && session.getAttribute("recent_url") == null) {
                    response.sendRedirect("Homepage.jsp");
                } else {
                    try {
                        response.sendRedirect(session.getAttribute("recent_url").toString());
                    } catch (Exception e) {
                        request.getRequestDispatcher("Homepage.jsp").forward(request, response);
                    }
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        else {
            request.setAttribute("username",username);
            request.getRequestDispatcher("register.jsp").forward(request,response);
        }
    }
}
