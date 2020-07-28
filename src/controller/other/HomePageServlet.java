package controller.other;

import priv.datastructure.travelimage;
import tools.DAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomePageServlet", urlPatterns = {"/homepageServlet"})
public class HomePageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<travelimage> pic_show1=DAO.getForList(travelimage.class,"select * from travelimage order by like_num desc limit 0,4");
        request.setAttribute("pic_show1",pic_show1);
        List<travelimage> pic_show2=DAO.getForList(travelimage.class,"select * from travelimage order by updatetime desc limit 0,6");
        request.setAttribute("pic_show2",pic_show2);
        request.getRequestDispatcher("HomePage.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
