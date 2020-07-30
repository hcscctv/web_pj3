<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link rel="stylesheet" href="src/css/common.css">
    <link rel="stylesheet" href="src/css/login.css">
</head>

<body>
    <div class="box">
        <script src="./src/js/sha1.js"></script>
        <script src="./src/js/part.js"></script>
        <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
        <script>function x() {
            document.getElementById('hidden_password').value=sha1(document.getElementById('show_password').value)
        }</script>
        <h2>Login</h2>
        <% session.removeAttribute("user");%>
        <form action="loginServlet" method="post" onsubmit="x()">
            <div class="inputbox">
                <input type="text" name="username" value="<%=(request.getAttribute("username")==null)?"":(request.getAttribute("username"))%>" required>
                <label>Username</label>
            </div>
            <div class="inputbox">
                <input type="password" name="old_password" id="show_password" required>
                <label>Password</label>
            </div>
            <input type="hidden" id="hidden_password" name="password">

            <div class="inputbox">
                <input type="text" name="check" id="check" required> <img id="iamge" src="ImageAction">
                <script>$('#iamge').click(function () {
                    this.src="ImageAction?id="+Math.random();
                });</script>
                <label>check</label>
            </div>

            <em><% if (request.getAttribute("check")!=null)out.print("wrong identifying code");
                else if(request.getAttribute("username")!=null) out.print("wrong password or username"); %></em>
            <br>
            <input type="submit" value="submit">
            <input type="button" value="register" id="button2" onclick="window.location.href='register.jsp'">
        </form>
    </div>
</body>

</html>