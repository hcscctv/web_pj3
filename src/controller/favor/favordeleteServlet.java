package controller.favor;

import priv.datastructure.traveluser;
import tools.DAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "favordeleteServlet", urlPatterns = {"/favordeleteServlet"})
public class favordeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String imgid=request.getParameter("imgid");
        traveluser user= (traveluser) request.getSession().getAttribute("user");
        if (!DAO.getForValue("select count(*) from travelimagefavor where uid = ? and imageid = ?", user.getUID(), imgid).toString().equals("0")){
            //已收藏
            DAO.update("delete from travelimagefavor where uid = ? and imageid = ?",user.getUID(),imgid);
        }
        else {
            //为收藏
            DAO.update("insert into travelimagefavor (UID, ImageID) VALUES (?,?)",user.getUID(),imgid);
        }
        int likenum=Integer.parseInt(DAO.getForValue("select count(*) from travelimagefavor where imageid =?",imgid).toString());
        DAO.update("update travelimage set like_num =? where imageid = ?",likenum,imgid);
        request.getRequestDispatcher("getFavorPicsServlet").forward(request,response);
    }
}
