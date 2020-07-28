package controller.friend;

import priv.datastructure.traveluser;
import tools.DAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "changeStateServlet",urlPatterns = {"/changeStateServlet"})
public class changeStateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        traveluser user= (traveluser) request.getSession().getAttribute("user");
        DAO.update("update traveluser set whetherseen = ? where UID = ?",(request.getParameter("allow").equals("yes")?1:0),user.getUID());
        response.sendRedirect("friendsServlet");
    }
}
