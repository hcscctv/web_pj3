package controller.my_photo;

import priv.datastructure.travelimage;
import tools.DAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "changeServlet",urlPatterns = {"/changeServlet"})
public class changeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        travelimage image = DAO.get(travelimage.class,"select * from travelimage where imageid=?",Integer.parseInt(request.getParameter("imgid")));
        request.setAttribute("img",image);
        request.getRequestDispatcher("change.jsp").forward(request,response);
    }
}
