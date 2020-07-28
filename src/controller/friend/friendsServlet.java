package controller.friend;

import priv.datastructure.friends;
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

@WebServlet(name = "friendsServlet",urlPatterns = {"/friendsServlet"})
public class friendsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        traveluser user= (traveluser) request.getSession().getAttribute("user");
        List<friends> x= DAO.getForList(friends.class,"select * from friends where uid2 = ?",user.getUID());
        ArrayList<traveluser> allowance=new ArrayList<traveluser>();
        ArrayList<traveluser> friends=new ArrayList<traveluser>();
        for (friends friend:x){
            if (friend.getState()==1)
            friends.add(DAO.get(traveluser.class,"select * from traveluser where uid = ?",friend.getUid1()));
            else allowance.add(DAO.get(traveluser.class,"select * from traveluser where uid = ?",friend.getUid1()));
        }
        request.setAttribute("allowance",allowance);
        request.setAttribute("friends",friends);
        request.getRequestDispatcher("friend.jsp").forward(request,response);
    }
}
