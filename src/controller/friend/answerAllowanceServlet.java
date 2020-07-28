package controller.friend;

import priv.datastructure.traveluser;
import tools.DAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "answerAllowanceServlet",urlPatterns = {"/answerAllowanceServlet"})
public class answerAllowanceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        traveluser user= (traveluser) request.getSession().getAttribute("user");
        int uid=Integer.parseInt(request.getParameter("imgid"));
        if (request.getParameter("whether").equals("1")){//同意
            DAO.update("update friends set state=1 where uid1=? and uid2=?",uid,user.getUID());
            DAO.update("insert into friends (uid1, uid2, state) value (?,?,1)",user.getUID(),uid);
        }
        else {//拒绝
            DAO.update("delete from friends where uid1=? and uid2=? and state=0",uid,user.getUID());
        }
        response.sendRedirect("friendsServlet");
    }
}
