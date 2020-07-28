package controller.my_photo;

import tools.DAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "deleteServlet",urlPatterns = {"/deleteServlet"})
public class deleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer imgid=Integer.parseInt(request.getParameter("imgid"));
        DAO.update("delete from readtime where imgid=?",imgid);
        DAO.update("delete from travelimage where ImageID=?",imgid);
        DAO.update("delete from travelimagefavor where ImageID=?",imgid);
        request.getRequestDispatcher("my_photo.jsp").forward(request,response);


    }
}
