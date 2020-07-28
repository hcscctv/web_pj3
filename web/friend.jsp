<%@ page import="priv.datastructure.traveluser" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="src/css/common.css">
    <link rel="stylesheet" href="src/css/nav.css">
    <link rel="stylesheet" href="src/css/friend.css">
</head>
<body>
<nav><script src="src/js/part.js"></script>

    <ul id="nav" name="nav">
        <li id="logo">
            <a href="./HomePage.jsp"><img src="img/logo_nav.png"></a>
        </li>
        <li class="this"><a href="./HomePage.jsp">Home</a></li>
        <li><a href="Search.jsp">Search</a></li>
        <li id="account">
            <% session.setAttribute("recent_url", request.getRequestURL());
                if (session.getAttribute("user")!= null) {%>
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
            <%} else {%>
            <a href="login.jsp">login</a>
            <% response.sendRedirect("login.jsp");
                return;
            }%>
        </li>
    </ul>
</nav>
<script src="src/js/answerallowance.js"></script>
<%
    if (request.getAttribute("allowance") == null) {
        response.sendRedirect("friendsServlet");
        return;
    }
%>
<%!
    String showallowance(traveluser user) {
        return "<div>\n" +
                "                    <p>username:" + user.getUserName() + "</p>\n" +
                "                    <button onclick=\"postanswer(" + user.getUID() + ",1)\" class=\"accept\">accept</button>\n" +
                "                    <button onclick=\"postanswer(" + user.getUID() + ",0)\" class=\"reject\">reject</button>\n" +
                "                </div>";
    }

    String showfriend(traveluser user) {
        if(user.getWhetherseen())
        return "<div>\n" +
                "                <p onclick=\"postuserid("+user.getUID()+")\" class=\"go_favor\">" + user.getUserName() + " " + user.getEmail() + "</p>\n" +
                "<br><p>"+user.getDateJoined()+
                " </p>               <button onclick=\"postchat("+user.getUID()+")\" class=\"chat\">chat with (s)he</button>\n" +
                "            </div>";
        else return "<div>\n" +
                "                <p onclick=\"alert('(s)he does not allow you to view the collection')\" class=\"go_favor\">" + user.getUserName() + " " + user.getEmail() + "</p>\n" +
                "<br><p>"+user.getDateJoined()+
                " </p>               <button onclick=\"postchat("+user.getUID()+")\" class=\"chat\">chat with (s)he</button>\n" +
                "            </div>";
    }

    String showresult(traveluser user) {
        return "<div>\n" +
                "            <p>username:" + user.getUserName() + "</p>\n" +
                "            <button onclick=\"postapply("+user.getUID()+")\" class=\"apply\">add friend</button>\n" +
                "        </div>";
    }
%>
<div id="container">
    <section id="content">
        <div id="contLeft">
            <div>
                setting
                <p>whether friends can view your collection</p>
                <form id="configForm" action="changeStateServlet">
                    <input type="radio" name="allow" value="yes" checked>yes
                    <input type="radio" name="allow" value="no">no
                    <input type="submit" class="submit" value="save">
                </form>
            </div>
            <div id="acceptBts">
                <p>accepted allowance</p>
                <%
                    ArrayList<traveluser> allowance = (ArrayList<traveluser>) request.getAttribute("allowance");
                    for (traveluser user : allowance) {
                        out.print(showallowance(user));
                    }
                %>
            </div>
        </div>
        <div id="contMiddle">
            <p>find new friend by username</p>
            <form action="findfriendsServlet">
                <input type="text" name="searchName">
                <input type="submit" value="find" class="submit">
            </form>
            <p>
                result
            </p>
            <%
                if (request.getAttribute("result") != null) {
                    ArrayList<traveluser> results = (ArrayList<traveluser>) request.getAttribute("result");
                    for (traveluser result : results) {
                        out.print(showresult(result));
                    }
                }
            %>
        </div>
        <div id="contRight">
            <p>my friend</p>
            <%
                ArrayList<traveluser> friends = (ArrayList<traveluser>) request.getAttribute("friends");
                for (traveluser friend : friends) {
                    out.print(showfriend(friend));
                }
            %>
        </div>
    </section>
</div>
</body>
</html>