<%@ page import="priv.datastructure.traveluser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
        <head>
            <meta charset="utf-8">
            <base target="_blank">
            <title>chat</title>
            <link rel="stylesheet" href="src/css/chat.css">
        </head>
        <%
                traveluser friend=(traveluser)request.getAttribute("target");
                traveluser user=(traveluser)session.getAttribute("user");
        %>
        <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>

        <body>
            <div class="abs cover contaniner">
                <div class="abs cover pnl">
                    <div id="title" class="top pnl-head">chat with <%=friend.getUserName()%></div>
                    <div class="abs cover pnl-body" id="pnlBody">
                        <div class="abs cover pnl-left">
                            <div class="abs cover pnl-msgs scroll" id="show">
                                <div class="pnl-list" id="msgs">
                                </div>
                            </div>
                            <div class="abs bottom pnl-text">
                                <div class="abs cover pnl-input">
                                    <textarea class="scroll" id="text" wrap="hard" placeholder="在此输入文字信息..."></textarea>
                                    <div class="abs atcom-pnl scroll hide" id="atcomPnl">
                                        <ul class="atcom" id="atcom"></ul>
                                    </div>
                                </div>
                                <div class="abs br pnl-btn" id="submit" style="background-color: rgb(32, 196, 202); color: rgb(255, 255, 255);" onclick="SendMsg()">发送</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </body>
    </html>
<script>
        let msgs=document.getElementById("msgs");
        function x(message) {
                msgs.innerHTML+="<div class=\"msg\">\n" +
                        "                                        <div class=\"msg-left\" worker=\""+"<%=friend.getUserName()%>"+"\">\n" +
                        "                                            <div class=\"msg-ball\" title=\""+message.time+"\">"+message.message+"</div>\n" +
                        "                                        </div>\n" +
                        "                                    </div>"
        }
        function SendMsg() {
                let message=$("#text").val();
                msgs.innerHTML+="<div class=\"msg\">\n" +
                        "                                        <div class=\"msg-right\">\n" +
                        "                                            <div class=\"msg-ball\">"+message+"</div>\n" +
                        "                                        </div>\n" +
                        "                                    </div>";
                $("#text").val("");

                let url = 'sayServlet';
                let target=<%=friend.getUID()%>;
                let uid=<%=user.getUID()%>;
                $.ajax({
                        type: 'get',
                        url: url,
                        data: {key:target,user:uid,message:message},
                        dataType: 'json',
                        success: function (data) {
                        },
                });
        }

        function getnewMessage() {
                //发送一个post请求
                let url = 'messageServlet';
                let target=<%=friend.getUID()%>;
                let uid=<%=user.getUID()%>;
                $.ajax({
                        type: 'get',
                        url: url,
                        data: {key:target,user:uid},
                        dataType: 'json',
                        success: function (data) {
                                console.log(data)
                                x(data)
                        },
                });
        }
        setInterval(getnewMessage,1000)

</script>