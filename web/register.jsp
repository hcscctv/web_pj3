<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>register</title>
    <link rel="stylesheet" href="src/css/common.css">
    <link rel="stylesheet" href="src/css/index.css">
    <link rel="stylesheet" href="src/css/register.css">
</head>

<body>
    <div id="main">
        <img src="img/logo_nav.png" class="logo">
        <script src="./src/js/sha1.js"></script>
        <br>
        <h1>Sign up for Fisher</h1>
        <br>
        <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
        <form action="registerServlet" id="from" method="GET">
            <table>
                <tr>
                    <td>
                        <h6>Username:<%=
                        (request.getAttribute("check")!=null?"":(request.getAttribute("username")==null?"":"<p>occupied</p>"))
                        %></h6>
                        <input type="text" name="username" value="<%=(request.getAttribute("username")==null)?"":(request.getAttribute("username"))%>" maxlength="15" minlength="4">
                    </td>
                </tr>

                <tr>
                    <td>
                        <h6 id="emailErr">Email:</h6>
                        <input type="text" name="mail" id="mail" required>
                        <script>
                            let mail_regexp = /^([a-zA-Z0-9_-]+)@([a-zA-Z0-9_-]+)((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
                            $('#mail').blur(function () {
                                let mail = this.value;
                                if (mail_regexp.test(mail)) {
                                    $('#emailErr').html("Email:");
                                    flag2 = true;
                                } else {
                                    $('#emailErr').html("Email:<p>not a e-mail</p>");
                                    flag2 = false;
                                }
                            });
                        </script>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6 id="passwordErr">Password:</h6>
                        <input name="old_password" id="show_password" type="password" maxlength="12" minlength="6">
                        <input type="hidden" id="hidden_password" name="password">
                        <script>
                            function checkPassWord(value) {
                                // 0： 表示第一个级别 1：表示第二个级别 2：表示第三个级别
                                // 3： 表示第四个级别 4：表示第五个级别
                                var arr = [], array = [1, 2, 3, 4];
                                if (value.length < 6) {//最初级别
                                    return 0;
                                }
                                if (/\d/.test(value)) {//如果用户输入的密码 包含了数字
                                    arr.push(1);
                                }
                                if (/[a-z]/.test(value)) {//如果用户输入的密码 包含了小写的a到z
                                    arr.push(2);
                                }
                                if (/[A-Z]/.test(value)) {//如果用户输入的密码 包含了大写的A到Z
                                    arr.push(3);
                                }
                                if (/\W/.test(value)) {//如果是非数字 字母 下划线
                                    arr.push(4);
                                }
                                return arr.length;
                            }
                            function checkRepeated() {
                                if ($('#show_password').val() !== $('#repassWord').val()) {
                                    $('#repasswordErr').html("Comfirm Your Password:<p>wrong</p>");
                                    flag3 = false
                                } else {
                                    $('#repasswordErr').html("Comfirm Your Password:");
                                    flag3 = true;
                                }
                            }
                            $('#show_password').blur(function () {
                                checkRepeated();
                                $('#passwordErr').html('Password:<p>strength:' + checkPassWord($('#show_password').val().toString()) + '</p>');
                            })
                        </script>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6 id="repasswordErr">Comfirm Your Password:</h6>
                        <input type="password" id="repassWord" name="password_repeat" maxlength="12" minlength="6">
                        <script>
                            $('#repassWord').blur(function () {
                                checkRepeated();
                            })
                        </script>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>identifying code<p><%=(request.getAttribute("check")==null?"":"wrong")%></p></h6>
                        <input type="password" id="check" name="check">
                        <img src="ImageAction">
                    </td>
                </tr>
            </table>
        </form>
        <a href="javascript:goRegister()">new world</a>
        <script>
            function goRegister() {
                document.getElementById('hidden_password').value=sha1(document.getElementById('show_password').value)
                if (flag3 && flag2) document.getElementById('from').submit()

            }
        </script>
    </div>
    <footer>
        Copyright&#169;19302010004 黄呈松
    </footer>
</body>

</html>