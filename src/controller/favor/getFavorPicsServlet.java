package controller.favor;

import priv.datastructure.readtime;
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

@WebServlet(name = "getFavorPicsServlet", urlPatterns = {"/getFavorPicsServlet"})
public class getFavorPicsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        traveluser user= (traveluser) request.getSession().getAttribute("user");
        List<travelimagefavor> x=DAO.getForList(travelimagefavor.class,"select * from travelimagefavor where uid = ?",user.getUID());
        ArrayList <travelimage> favor_pics=new ArrayList<travelimage>();
        for (travelimagefavor favor:x){
            favor_pics.add(DAO.get(travelimage.class,"select * from travelimage where imageid = ?",favor.getImageID()));
        }

        List<readtime> y=DAO.getForList(readtime.class,"select * from readtime where uid = ? order by readtime desc ",user.getUID());
        ArrayList <travelimage> has_seen=new ArrayList<travelimage>();
        for (readtime favor:y){
            has_seen.add(DAO.get(travelimage.class,"select * from travelimage where imageid = ?",favor.getImgid()));
        }

        request.setAttribute("has_seen",has_seen);
        request.setAttribute("favor_pics",favor_pics);
        request.getRequestDispatcher("favor.jsp").forward(request,response);


    }
}
