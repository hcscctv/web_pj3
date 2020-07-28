<%@ page import="priv.datastructure.travelimage" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>search</title>
    <link rel="stylesheet" href="src/css/common.css">
    <link rel="stylesheet" href="src/css/nav.css">
    <link rel="stylesheet" href="src/css/favor_myphoto_search.css">
    <script src="src/js/disabled_change.js"></script>
</head>

<body>
<nav>
    <ul id="nav" name="nav">
        <li id="logo">
            <a href="./HomePage.jsp"><img src="img/logo_nav.png"></a>
        </li>
        <li ><a href="./HomePage.jsp">Home</a></li>
        <li class="this"><a href="Search.jsp">Search</a></li>
        <li id="account">
            <%  session.setAttribute("recent_url",request.getRequestURL());
                if(session.getAttribute("user")!=null){%>
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
            <%}
            else{ %>
            <a href="login.jsp">login</a>
            <% } %>
        </li>
    </ul>
</nav>
<script src="src/js/part.js"></script>
    <div class="main">
        <div class="title">Search</div>
        <form action="searchServlet">
            <input type="radio" name="filter_way" value="by_title" checked>Filter by Title <br>
            <input type="radio" name="filter_way" value="by_description">Filter by Description <br>
            <input id="title" name="title" type="text"><br>
            <input type="submit" value="Filter"> <input type="radio" checked name="sort_way" value="by_favor">sort by hot index  <input type="radio" name="sort_way" value="by_updatetime">sort by update time
        </form>
    </div>
    <script src="src/js/showpic.js"></script>
    <%!
        String showpic(travelimage image){
            return "<li class=\"pic\">\n" +
                    "                <img src=\"img/travel-images/medium/"+image.getPATH()+"\" onclick=\'postid("+image.getImageID()+")\' class=\"pic_pic \" alt=\" \">\n" +
                    "                <div class=\"pic_text\">\n" +
                    "                    <h2>\n" +
                    "                        "+image.getTitle()+"\n" +
                    "                    </h2>\n" +
                    "                    <br>\n" +
                    "                    <p class=\"text\">\n" +
                    "                        "+image.getDescription()+"</p>\n" +
                    "                    <br>\n" +
                    "                </div>\n" +
                    "\n" +
                    "            </li>";
        }
    %>
    <%ArrayList<travelimage> result= new ArrayList<>();
        if(request.getAttribute("result")!=null) {result= (ArrayList<travelimage>) request.getAttribute("result");}
         %>
    <div class="main ">
        <div class="title ">Result</div>
        <% int whole=result.size();
            int now=0;
            int page_now=1;
            for (;((page_now-1)*5+now)<whole;){ %>
        <ul class="page">
            <% for (;now<5&&((page_now-1)*5+now)<whole;now++){
                out.print(showpic(result.get((page_now-1)*5+now)));
            }
                page_now++;
                now=0;
            %>
        </ul>
        <%}%>
        <script>
            let pages=document.getElementsByClassName("page")
            function show(page) {
                for (let i =0;i<pages.length;i++){
                    pages[i].style.display="none";
                }
                pages[page].style.display="block";
            }
            show(0);
        </script>

        <div id="page_number">
            <%
                for (int i = 1;i<page_now;i++){
                    out.print("<span>"+i+"</span>");
                }
            %>
        </div>
        <script lang="javascript">
            var a = document.getElementsByTagName("span");
            for (var i = 0; i < a.length; i++) {
                a[i].setAttribute("onclick", "show("+i+")");
            }
        </script>

    </div>

    <footer>
        Copyright&#169;19302010004 黄呈松
    </footer>
</body>


</html>