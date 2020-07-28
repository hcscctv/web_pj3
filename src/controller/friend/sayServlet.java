package controller.friend;

import tools.DAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "sayServlet",urlPatterns = {"/sayServlet"})
public class sayServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int uid2=Integer.parseInt(request.getParameter("key"));
        int uid1=Integer.parseInt(request.getParameter("user"));
        String message=request.getParameter("message");
        DAO.update("insert into message (uid1, uid2, message, state, time) VALUES (?,?,?,0,now())",uid1,uid2,message);
    }
}
