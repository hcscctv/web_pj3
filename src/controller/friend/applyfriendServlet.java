package controller.friend;

import priv.datastructure.traveluser;
import tools.DAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "applyfriendServlet",urlPatterns = {"/applyfriendServlet"})
public class applyfriendServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        traveluser user= (traveluser) request.getSession().getAttribute("user");
        if (user.getUID()!=Integer.parseInt(request.getParameter("imgid")))
        DAO.update("insert into friends (uid1, uid2, state) VALUES (?,?,0)",user.getUID(),Integer.parseInt(request.getParameter("imgid")));
        response.sendRedirect("friendsServlet");
    }
}
