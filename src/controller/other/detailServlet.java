package controller.other;

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

@WebServlet(name = "detailServlet",urlPatterns = {"/detailServlet"})
public class detailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int imgid = Integer.parseInt(request.getParameter("imgid"));
        request.getSession().setAttribute("recent_url",request.getRequestURL()+"?imgid="+imgid);
        travelimage image = DAO.get(travelimage.class,"select * from travelimage where ImageID = ? ",imgid);
        request.setAttribute("image",image);
        if (request.getSession().getAttribute("user")!=null){
            traveluser user= (traveluser) request.getSession().getAttribute("user");
            request.setAttribute("whetherlike", DAO.get(travelimagefavor.class, "select * from travelimagefavor where ImageID=? and UID=?",
                    image.getImageID(), user.getUID()) != null);
        }
        if (request.getSession().getAttribute("user")!=null){
            traveluser user= (traveluser) request.getSession().getAttribute("user");
            if (DAO.get(readtime.class,"select * from readtime where uid=? and imgid = ?",user.getUID(),imgid)!=null){
                DAO.update("update readtime set readtime = ? where uid =? and imgid = ? ",System.currentTimeMillis(),user.getUID(),imgid);
            }
            else {DAO.update("insert into readtime (uid, imgid, readtime) VALUES (?,?,?)",user.getUID(),imgid,System.currentTimeMillis());
                if(Integer.parseInt(DAO.getForValue("select count(*) from readtime where uid = ?",user.getUID()).toString())>10){
                    DAO.update("delete from readtime where uid = ? order by readtime limit 1;",user.getUID());
                }
            }
        }
        request.getRequestDispatcher("details.jsp").forward(request,response);
    }
}
