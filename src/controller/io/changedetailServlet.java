package controller.io;


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import priv.datastructure.traveluser;
import tools.DAO;
import tools.encode;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@WebServlet(name = "changedetailServlet", urlPatterns = {"/changedetailServlet"})
public class changedetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "img/travel-images/medium";

    // 上传配置
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB

    /**
     * 上传数据及保存文件
     */
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        // 配置上传参数
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // 设置临时存储目录
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);

        // 设置最大文件上传值
        upload.setFileSizeMax(MAX_FILE_SIZE);

        // 设置最大请求值 (包含文件和表单数据)
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // 中文处理
        upload.setHeaderEncoding("UTF-8");

        String uploadPath = getServletContext().getRealPath("/") + File.separator + UPLOAD_DIRECTORY;

        String path = null;
        HashMap<String,String>map =new HashMap<>();
        boolean flag=false;

        // 如果目录不存在则创建
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        try {
            // 解析请求的内容提取文件数据
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);

            if (formItems != null && formItems.size() > 0) {
                // 迭代表单数据
                for (FileItem item : formItems) {
                    // 处理不在表单中的字段
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        if (fileName!=""){flag=true;
                        path= encode.encode(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()))+fileName;
                        String filePath = uploadPath + File.separator + path;
                        File storeFile = new File(filePath);
                        // 在控制台输出文件的上传路径
                        // 保存文件到硬盘
                        item.write(storeFile);}
                    }
                    else {
                        String name=item.getFieldName();
                        String value=item.getString("UTF-8");
                        map.put(name,value);
                    }
                }

                traveluser user= (traveluser) request.getSession().getAttribute("user");
                if (!flag)path=DAO.getForValue("select path from travelimage where imageid=?",map.get("imgid"));
//insert into travelimage (Title, Description, Latitude, Longitude, CityCode, CountryCodeISO, UID, PATH, Content, like_num, updatetime) VALUES (?,?,0,0,?,?,?,?,?,?,now())
                String country=DAO.getForValue("select iso from geocountries where countryname=?",map.get("country")).toString();
                String city=DAO.getForValue("select GeoNameID from geocities where AsciiName=?",map.get("city")).toString();
//                DAO.update("insert into travelimage (Title, Description, Latitude, Longitude, CityCode, CountryCodeISO, UID, PATH, Content, like_num, updatetime) VALUES (?,?,0,0,?,?,?,?,?,?,now())"
//                ,map.get("title"),map.get("detail"),city,country,user.getUID(),path,map.get("content"),0);
                DAO.update("update travelimage set Title=?,Description=?,CityCode=?,CountryCodeISO=?,PATH=?,Content=?,updatetime=now() where ImageID=?"
                ,map.get("title"),map.get("detail"),city,country,path,map.get("content"),map.get("imgid"));




            }
        } catch (Exception ex) {
            request.setAttribute("message",
                    "错误信息: " + ex.getMessage());
        }
        // 跳转到 message.jsp
        request.getRequestDispatcher("my_photo.jsp").forward(
                request, response);
    }

}
