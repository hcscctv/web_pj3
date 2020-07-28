<%@ page import="priv.datastructure.travelimage" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<!--<head>-->
<!--    <meta charset="UTF-8">-->
<!--    <meta name="viewport" content="width=device-width, initial-scale=1.0">-->
    <title>my photo</title>
    <link rel="stylesheet" href="src/css/common.css">
    <link rel="stylesheet" href="src/css/nav.css">
    <link rel="stylesheet" href="src/css/favor_myphoto_search.css">
<!--</head>-->

<body>
    <!-- 导航栏 -->
    <nav>
        <ul id="nav" name="nav">
            <li id="logo">
                <a href="./HomePage.jsp"><img src="img/logo_nav.png"></a>
            </li>
            <li class="this"><a href="./HomePage.jsp">Home</a></li>
            <li><a href="Search.jsp">Search</a></li>
            <li id="account">
                <% session.setAttribute("recent_url", request.getRequestURL());
                    if (session.getAttribute("user") == null) {
                        response.sendRedirect("login.jsp");
                        return;
                    } else {%>
                My&nbsp; Account&nbsp;<br>
                <ul id="dropdown">
                    <li>
                        <a href="Upload.jsp"><img src="img/upload.png" alt="">Upload</a>
                    </li>
                    <li>
                        <a href="my_photo.jsp"><img src="img/photo.png" alt="">My photo</a>
                    </li>
                    <li>
                        <a href="favor.jsp"><img src="img/favourite.png" alt="">My favorite</a>
                    </li>
                    <li>
                        <a href="login.jsp"><img src="img/login.png" alt="">Log out</a>
                    </li>
                    <li>
                        <a href="friend.jsp"><img src="img/friend.png" alt="">Friend</a>
                    </li>
                </ul>
                <%}%>
            </li>
        </ul>
    </nav>
    <script src="src/js/part.js"></script>

    <%
        if (request.getAttribute("my_photos") == null) {
            response.sendRedirect("photoServlet");
            return;
        }
        ArrayList<travelimage> my_photos= (ArrayList<travelimage>) request.getAttribute("my_photos");

    %>
    <script src="src/js/showpic.js"></script>
    <%!
        String showphoto(travelimage image){
            return "<li class=\"pic\">\n" +
                    "                <img src=\"img/travel-images/medium/" + image.getPATH() + "\" onclick=\'postid(" + image.getImageID() + ")\' class=\"pic_pic \" alt=\" \">\n" +
                    "                <div class=\"pic_text\">\n" +
                    "                    <h2>\n" +
                    "                        " + image.getTitle() + "\n" +
                    "                    </h2>\n" +
                    "                    <br>\n" +
                    "                    <p class=\"text\">\n" +
                    "                        " + image.getDescription() + "</p>\n" +
                    "                    <br>\n" +
                    "                    <button class=\"delete\" onclick=\"postdelete("+image.getImageID()+")\">delete</button>\n" +
                    "<button class=\"modify\" onclick=\"postchange("+image.getImageID()+")\">modify</button>"+
                    "                </div>\n" +
                    "\n" +
                    "            </li>";
        }



    %>
<script src="src/js/my_photo.js"></script>
    <div class="main">
        <div class="title">My photo</div>
        <% int whole = my_photos.size();
            int now = 0;
            int page_now = 1;
            for (; ((page_now - 1) * 5 + now) < whole; ) { %>
        <ul class="page">
            <%
                for (; now < 5 && ((page_now - 1) * 5 + now) < whole; now++) {
                    out.print(showphoto(my_photos.get((page_now - 1) * 5 + now)));
                }
                page_now++;
                now = 0;
            %>
        </ul>
        <%}%>
        <script>
            let pages = document.getElementsByClassName("page")

            function show(page) {
                for (let i = 0; i < pages.length; i++) {
                    pages[i].style.display = "none";
                }
                pages[page].style.display = "block";
            }

            show(0);
        </script>


        <div id="page_number">
            <%
                for (int i = 1; i < page_now; i++) {
                    out.print("<span>" + i + "</span>");
                }
            %>
        </div>
        <script lang="javascript">
            var a = document.getElementsByTagName("span");
            for (var i = 0; i < a.length; i++) {
                a[i].setAttribute("onclick", "show(" + i + ")");
            }
        </script>

    </div>

    <footer>
        Copyright&#169;19302010004 黄呈松
    </footer>
</body>


</html>