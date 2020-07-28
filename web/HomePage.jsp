<%@ page import="priv.datastructure.travelimage" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="src/css/common.css">
    <link rel="stylesheet" href="src/css/nav.css">
    <link rel="stylesheet" href="src/css/Homepage.css">
</head>


<% if (request.getAttribute("pic_show1")==null)response.sendRedirect("homepageServlet");%>
<body>
    <div id="main">
        <nav>
            <ul id="nav" name="nav">
                <li id="logo">
                    <a href="./HomePage.jsp"><img src="img/logo_nav.png"></a>
                </li>
                <li class="this"><a href="./HomePage.jsp">Home</a></li>
                <li><a href="Search.jsp">Search</a></li>
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
        <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>




        <div class="slidershow middle">

            <div class="slides">

                <input type="radio" class="block" name="r" id="r1" checked />
                <input type="radio" class="block" name="r" id="r2" />
                <input type="radio" class="block" name="r" id="r3" />
                <input type="radio" class="block" name="r" id="r4" />

                <script src="src/js/showpic.js"></script>

                <div class="slide s1">
                    <img src="img/travel-images/medium/${requestScope.pic_show1.get(0).getPATH()}" onclick="postid(${requestScope.pic_show1.get(0).getImageID()})" alt="photo" />
                </div>

                <div class="slide">
                    <img src="img/travel-images/medium/${requestScope.pic_show1.get(1).getPATH()}" onclick="postid(${requestScope.pic_show1.get(1).getImageID()})" alt="photo" />
                </div>

                <div class="slide">
                    <img src="img/travel-images/medium/${requestScope.pic_show1.get(2).getPATH()}" onclick="postid(${requestScope.pic_show1.get(2).getImageID()})" alt="photo" />
                </div>
                <div class="slide">
                    <img src="img/travel-images/medium/${requestScope.pic_show1.get(3).getPATH()}" onclick="postid(${requestScope.pic_show1.get(3).getImageID()})" alt="photo" />
                </div>
            </div>

            <div class="navigaion">
                <label for="r1" class="bar"></label>
                <!-- label标签为 input 元素定义标注  "for"属性可把label绑定到另外一个元素。请把 "for" 属性的值设置为相关元素的 id 属性的值。 -->
                <label for="r2" class="bar"></label>
                <label for="r3" class="bar"></label>
                <label for="r4" class="bar"></label>
            </div>
            <script>
                function slide(i){
                    $('.bar')[i].click()
                }
                let now=0;
                setInterval(function () {
                    slide((++now)%4)
                },3000)
            </script>
        </div>
        <br>
        <div class="hot_image_area">
            <div class="hot_image">
                    <img src="img/travel-images/medium/${requestScope.pic_show2.get(0).getPATH()}" onclick="postid(${requestScope.pic_show2.get(0).getImageID()})" title="title" class="show_pic" alt="123123">
                <p class="image_title">by ${requestScope.pic_show2.get(0).username()}</p>
                <p class="image_description">${requestScope.pic_show2.get(0).getContent()}<br>updated when ${requestScope.pic_show2.get(0).getUpdatetime()}</p>
            </div>
            <div class="hot_image">
                <img src="img/travel-images/medium/${requestScope.pic_show2.get(1).getPATH()}" onclick="postid(${requestScope.pic_show2.get(1).getImageID()})" title="title" class="show_pic" alt="123123">
                <p class="image_title">by ${requestScope.pic_show2.get(1).username()}</p>
                <p class="image_description">${requestScope.pic_show2.get(1).getContent()}<br>updated when ${requestScope.pic_show2.get(1).getUpdatetime()}</p>
            </div>
            <div class="hot_image">
                <img src="img/travel-images/medium/${requestScope.pic_show2.get(2).getPATH()}" title="title" onclick="postid(${requestScope.pic_show2.get(2).getImageID()})" class="show_pic" alt="123123">
                <p class="image_title">by ${requestScope.pic_show2.get(2).username()}</p>
                <p class="image_description">${requestScope.pic_show2.get(2).getContent()}<br>updated when ${requestScope.pic_show2.get(2).getUpdatetime()}</p>
            </div>
            <div class="hot_image">
                <img src="img/travel-images/medium/${requestScope.pic_show2.get(3).getPATH()}" title="title" onclick="postid(${requestScope.pic_show2.get(3).getImageID()})" class="show_pic" alt="123123">
                <p class="image_title">by ${requestScope.pic_show2.get(3).username()}</p>
                <p class="image_description">${requestScope.pic_show2.get(3).getContent()}<br>updated when ${requestScope.pic_show2.get(3).getUpdatetime()}</p>
            </div>
            <div class="hot_image">
                <img src="img/travel-images/medium/${requestScope.pic_show2.get(4).getPATH()}" title="title" onclick="postid(${requestScope.pic_show2.get(4).getImageID()})" class="show_pic" alt="123123">
                <p class="image_title">by ${requestScope.pic_show2.get(4).username()}</p>
                <p class="image_description">${requestScope.pic_show2.get(4).getContent()}<br>updated when ${requestScope.pic_show2.get(4).getUpdatetime()}</p>
            </div>
            <div class="hot_image">
                <img src="img/travel-images/medium/${requestScope.pic_show2.get(5).getPATH()}" title="title" onclick="postid(${requestScope.pic_show2.get(5).getImageID()})" class="show_pic" alt="123123">
                <p class="image_title">by ${requestScope.pic_show2.get(5).username()}</p>
                <p class="image_description">${requestScope.pic_show2.get(5).getContent()}<br>updated when ${requestScope.pic_show2.get(5).getUpdatetime()}</p>
            </div>
        </div>
    </div>

    <div id="footer">
        <br>
        <div id="footer_left"><a href="">帮助</a>
            <a href="">举报</a>
            <a href="">用户反馈</a><br><br> Copyright&#169;19302010004&nbsp;沪ICP备20008620号<br>
        </div>
        <div id="footer_right">
            <img src="img/1586323807.png" alt="">
        </div>

    </div>
</body>

</html>