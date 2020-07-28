<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Details</title>
    <link rel="stylesheet" href="src/css/common.css">
    <link rel="stylesheet" href="src/css/nav.css">
    <link rel="stylesheet" href="src/css/details.css">
</head>

<body>
<%--<%--%>
<%--    String path = request.getContextPath();--%>
<%--    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";--%>
<%--    String name = request.getParameter("imgid");//用request得到--%>
<%--    out.print(name);--%>
<%--    --%>
<%--%>--%>
<!-- 导航栏 -->
        <nav>
            <script src="src/js/part.js"></script>
            <ul id="nav" name="nav">
                <li id="logo">
                    <a href="./HomePage.jsp"><img src="img/logo_nav.png"></a>
                </li>
                <li><a href="./HomePage.jsp">Home</a></li>
                <li><a href="Search.jsp">Search</a></li>
                <li id="account">
                    <%if(session.getAttribute("user")!=null){%>
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
        <% if (request.getAttribute("image")==null)
            {response.sendRedirect("HomePage.jsp"); return;}%>
    <div id="main">
        <div class="title">Details</div>
        <h2>${requestScope.image.title}&nbsp;<span>by ${requestScope.image.username()}</span></h2>
        <div id="info">
            <!-- 左图右信息 -->
<%--            <div  class="half">--%>
                <div class="min">
                <img width="350px" height="350px" src="img/travel-images/medium/${requestScope.image.PATH}">
                <div class="fd"></div></div>
<%--            </div>--%>
            <div class="half">
                <div class="main">
                    <div class="title">Like Number</div>
                    <div id="like_number">${requestScope.image.like_num}</div>
                </div>
                <div class="main">
                    <div class="title">Image Details</div>
                    <div class="detail">
                        Content:${requestScope.image.content}
                    </div>
                    <div class="detail">
                        Country:${requestScope.image.country()}
                    </div>
                    <div class="detail">
                        UpdateTime:${requestScope.image.updatetime}
                    </div>
                    <div class="detail_last">
                        City:${requestScope.image.city()}
                    </div>
                </div>

                <% if(session.getAttribute("user")!=null){ %>
                <script src="src/js/postfavor.js"></script>
                <button id="collect" value="" onclick="postfavor(${requestScope.image.imageID})">
                    <img id="collect_img" src="img/collect.png"><%=((boolean)request.getAttribute("whetherlike"))?"已":""%>收藏</button>
                <%} else{%>
                <button id="collect" value="" onclick="window.location.href='login.jsp'">
                    请先登录</button>
                <%}%>
            </div>
            <div class="max">
                <img src="img/travel-images/medium/${requestScope.image.PATH}"/>
            </div>

        </div>
        <div id="text">
            ${requestScope.image.description}
    </div>
    </div>
</body>
<script>
    var min = document.querySelector(".min");
    var max = document.querySelector(".max");
    var img = document.querySelector(".max img");
    var fd = document.querySelector(".fd");

    min.onmouseover = function(){
        max.style.display = "block";
        fd.style.display = "block";
    }
    min.onmouseout = function(){
        max.style.display = "none";
        fd.style.display = "none";
    }
    min.onmousemove = function(){
        var x = event.clientX-min.offsetLeft-fd.offsetWidth/2;
        var y = event.clientY-min.offsetTop-fd.offsetHeight/2;
        var maxX = min.clientWidth-fd.offsetWidth;
        var maxY = min.clientHeight-fd.offsetHeight;
        if (x <= 0) {
            x = 0;
        }else if (x >= maxX) {
            x = maxX;
        }
        if (y <= 0) {
            y = 0;
        }else if (y >= maxY) {
            y = maxY;
        }
//                fd的位置
        fd.style.left = x+'px';
        fd.style.top = y+'px';
        //fd/min = max/img
        //移动比例
        var moveX = x/maxX;
        var moveY = y/maxY;
//                移动
//                3. max的对应显示
//                对于大图而言,放大镜在小图上移动的比例相当于img在可显示区域上移动的比例
//                放大镜右移等于图片左移
//                也就是本质上为img-max 然而而需要负值,则*-1简化后为max-img
        img.style.left = moveX*(max.clientWidth - img.offsetWidth) + 'px';
        img.style.top = moveY*(max.clientHeight - img.offsetHeight) + 'px';

    }

</script>
</html>