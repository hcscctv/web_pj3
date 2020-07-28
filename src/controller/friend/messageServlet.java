package controller.friend;

import com.google.gson.Gson;
import priv.datastructure.message;
import tools.DAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "messageServlet",urlPatterns = {"/messageServlet"})
public class messageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int uid1=Integer.parseInt(request.getParameter("key"));
        int uid2=Integer.parseInt(request.getParameter("user"));
        message message= DAO.get(priv.datastructure.message.class,"select * from message where uid1=? and uid2=? and state = 0",uid1,uid2);
        DAO.update("delete from message where messageid = ?",message.getMessageid());
        Gson gson = new Gson();
        response.setContentType("application/json");
        String messagesToStr = gson.toJson(message);
        response.getWriter().write(messagesToStr);
    }
}
