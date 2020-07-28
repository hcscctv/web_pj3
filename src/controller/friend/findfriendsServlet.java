package controller.friend;

import priv.datastructure.friends;
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

@WebServlet(name = "findfriendsServlet",urlPatterns = {"/findfriendsServlet"})
public class findfriendsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        traveluser user= (traveluser) request.getSession().getAttribute("user");
        ArrayList<traveluser> maybe= (ArrayList<traveluser>) DAO.getForList(traveluser.class,"select * from traveluser where username like '%"+request.getParameter("searchName")+"%'");
        ArrayList<traveluser> list=new ArrayList<>();
        List<friends> x= DAO.getForList(friends.class,"select * from friends where uid1 = ?",user.getUID());
        ArrayList<Integer> y =new ArrayList<>();
        for (friends u:x){
            y.add(u.getUid2());
        }
        for(traveluser tobe:maybe){
            if (!y.contains(tobe.getUID()))list.add(tobe);
        }
        request.setAttribute("result",list);
        request.getRequestDispatcher("friendsServlet").forward(request,response);
    }
}
