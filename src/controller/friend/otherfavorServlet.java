package controller.friend;

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

@WebServlet(name = "otherfavorServlet", urlPatterns = {"/otherfavorServlet"})
public class otherfavorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        traveluser friend = DAO.get(traveluser.class,"select * from traveluser where uid=?",Integer.parseInt(request.getParameter("id")));
        List<travelimagefavor> x=DAO.getForList(travelimagefavor.class,"select * from travelimagefavor where uid = ?",friend.getUID());
        ArrayList <travelimage> favor_pics=new ArrayList<travelimage>();
        for (travelimagefavor favor:x){
            favor_pics.add(DAO.get(travelimage.class,"select * from travelimage where imageid = ?",favor.getImageID()));
        }
        request.setAttribute("favor_pics",favor_pics);
        request.setAttribute("friend",friend.getUserName());
        request.getRequestDispatcher("favor.jsp").forward(request,response);
    }
}
