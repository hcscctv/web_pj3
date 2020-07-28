package controller.my_photo;

import priv.datastructure.travelimage;
import priv.datastructure.travelimagefavor;
import priv.datastructure.traveluser;
import tools.DAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "photoServlet",urlPatterns = {"/photoServlet"})
public class photoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        traveluser user= (traveluser) request.getSession().getAttribute("user");
        List<travelimage> x= DAO.getForList(travelimage.class,"select * from travelimage where uid = ?",user.getUID());
        request.setAttribute("my_photos",x);
        request.getRequestDispatcher("my_photo.jsp").forward(request,response);
    }
}
