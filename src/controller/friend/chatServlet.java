package controller.friend;

import priv.datastructure.traveluser;
import tools.DAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "chatServlet",urlPatterns = {"/chatServlet"})
public class chatServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        traveluser target= DAO.get(traveluser.class,"select * from traveluser where uid=?",Integer.parseInt(request.getParameter("id")));
        request.setAttribute("target",target);
        request.getRequestDispatcher("chat.jsp").forward(request,response);
    }
}
