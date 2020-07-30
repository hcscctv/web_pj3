package controller.other;

import priv.datastructure.travelimage;
import tools.DAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "searchServlet", urlPatterns = {"/searchServlet"})
public class searchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sql="select * from travelimage where ";
        String[] wds;
        if (request.getParameter("filter_way").equals("by_title")){
            wds=request.getParameter("title").split(" ");
            boolean flag=false;
            for (String wd:wds){
                if (flag)sql+="and ";
                sql+="title like '%"+wd+"%' ";
                flag=true;
            }
        }
        else {
            wds=request.getParameter("title").split(" ");
            boolean flag=false;
            for (String wd:wds){
                if (flag)sql+="and ";
                sql+="content like '%"+wd+"%' ";
                flag=true;
            }
        }

        if (request.getParameter("sort_way").equals("by_favor")){
            sql+="order by like_num desc ";
        }
        else sql+="order by updatetime desc";
        request.setAttribute("result",DAO.getForList(travelimage.class,sql));
        request.setAttribute("value",request.getParameter("title"));
        request.getRequestDispatcher("Search.jsp").forward(request,response);
    }
}
