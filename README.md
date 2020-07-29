# 卓越软件开发基础project开发文档
#### 19302010004 黄呈松
- - -
## 整体概述

### 相关地址
##### github地址
_https://github.com/hcscctv/web_pj3_
##### 公网访问地址
_http://hcscctv.xyz:51222/pj_war_


### 功能概述
>用户能够注册账号，并使用已经注册过的账号登录。在未登录前，用户在网站首页可以通过点击查看图片详情，可以在搜索页搜索展示筛选结果。但是不能收藏任何图片，也不能查看自己的关注用户列表。在用户登录后，用户可以通过用户名搜索其他用户并发出添加请求，待该用户同意后两者互为好友。用户可以收藏不同的展品，并决定自己的收藏是否向好友公开。如果向好友公开收藏，好友可以互相通过点击好友列表对应用户名来查看其收藏的图片列表。如果不公开，则不展示。

### 项目结构
>省略部分储存用文件及文件夹
```
project
├─ src//后端相关
│  ├─ controller
│  │  ├─ favor
│  │  │  ├─ favordeleteServlet.java
│  │  │  ├─ favorServlet.java
│  │  │  └─ getFavorPicsServlet.java
│  │  ├─ friend
│  │  │  ├─ answerAllowanceServlet.java
│  │  │  ├─ applyfriendServlet.java
│  │  │  ├─ changeStateServlet.java
│  │  │  ├─ chatServlet.java
│  │  │  ├─ findfriendsServlet.java
│  │  │  ├─ friendsServlet.java
│  │  │  ├─ ImageAction.java
│  │  │  ├─ messageServlet.java
│  │  │  ├─ otherfavorServlet.java
│  │  │  └─ sayServlet.java
│  │  ├─ io
│  │  │  ├─ changedetailServlet.java
│  │  │  └─ UploadServlet.java
│  │  ├─ my_photo
│  │  │  ├─ changeServlet.java
│  │  │  ├─ deleteServlet.java
│  │  │  └─ photoServlet.java
│  │  └─ other
│  │     ├─ detailServlet.java
│  │     ├─ HomePageServlet.java
│  │     ├─ LoginServlet.java
│  │     ├─ RegisterServlet.java
│  │     └─ searchServlet.java
│  ├─ priv
│  │  └─ datastructure
│  │     ├─ friends.java
│  │     ├─ geocities.java
│  │     ├─ geocountries.java
│  │     ├─ message.java
│  │     ├─ readtime.java
│  │     ├─ travelimage.java
│  │     ├─ travelimagefavor.java
│  │     └─ traveluser.java
│  └─ tools
│     ├─ DAO.java
│     ├─ encode.java
│     ├─ jdbc.properties
│     └─ JDBCTools.java
└─ web//前端相关
   ├─ change.jsp
   ├─ chat.jsp
   ├─ details.jsp
   ├─ favor.jsp
   ├─ friend.jsp
   ├─ HomePage.jsp
   ├─ index.html
   ├─ login.jsp
   ├─ my_photo.jsp
   ├─ register.jsp
   ├─ Search.jsp
   ├─ src
   │  ├─ css
   │  └─ js
   ├─ Upload.jsp
   └─ WEB-INF
      └─ web.xml
```

### 后端工具
+ 后端 JSP+Servlet+JavaBean 的 MVC 架构来实现
+ 服务器Apache Tomcat，数据库MySQL
##### 具体版本
>MySQL 10.4.11+tomcat 9.0.36+ Java 1.8.0_152
可在chrome浏览器及firefox浏览器完善运行
可在其余主流浏览器正常运行，可能出现极小范围布局错位

### 前端设计
>前端布局沿用pj1设计 （https://github.com/hcscctv/web_pj） 采用html+js（以jQuery为主）+css

## 项目基本要求完成情况
>基础功能全部实现，后续解释部分功能实现方法，未写明的部分面试时详细解释
#### 二级联动
>>为防止过多城市的国家查询速度较慢，采用本地静态json文件的方式进行二级联动，但是再服务器上由于带宽限制还是会有一定延迟
```js
$(function () {
        var url = '../js/cities.json';
        $("#country").change(function () {
            var address = $(this).val();
            $.ajax({
                type: 'post',
                url: url,
                dataType: 'json',
                success: function (data) {
                    //省略修改下拉框的部分
                },
            });
        });
    });
```
#### 分页功能
>>获取照片列表后生成每一页
```java
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
```
>>将不展示的页隐藏，按键可以展示对应页
```js
   let pages = document.getElementsByClassName("page")

            function show(page) {
                for (let i = 0; i < pages.length; i++) {
                    pages[i].style.display = "none";
                }
                pages[page].style.display = "block";
            }

            show(0);
```
#### 前端密码加密
>>通过前端js进行第一次sha1加密 到后端之后进行加盐后第二次sha1加密
```js
document.getElementById('hidden_password').value=sha1(document.getElementById('show_password').value)
```



## bonus完成情况

#### 项目文档
>现在看到的就是

#### 详情页图片局部放大
>js完成
```js
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
```

#### 验证码功能
>  通过java生成验证码图片并将答案储存在session中以供比对
```java
public class ImageAction extends HttpServlet {
    
    public void init() throws ServletException
    {
        super.init();
    }
    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
//设置页面不缓存
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

//在内存中创建图象
        int width = 60, height = 20;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
//获取图形上下文
        Graphics g = image.getGraphics();
//生成随机类
        Random random = new Random();
//设定背景色
        g.setColor(getRandColor(220, 250));
        g.fillRect(0, 0, width, height);
//设定字体
        g.setFont(new Font("Times New Roman", Font.PLAIN, 18));
//画边框
//g.drawRect(0,0,width-1,height-1);
        g.draw3DRect(0,0,width-1,height-1,true);
//随机产生155条干扰线，使图象中的认证码不易被其它程序探测到
        g.setColor(getRandColor(160, 200));
        for (int i = 0; i < 155; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int xl = random.nextInt(12);
            int yl = random.nextInt(12);
            g.drawLine(x, y, x + xl, y + yl);
        }
// 取随机产生的认证码(6位数字)
        String sRand = "";
        String s = "012345678901234567890123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ012345678901234567890123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        for (int i = 0; i < 4; i++) {
            char rand =s.charAt(random.nextInt(s.length()));
            sRand += rand;
// 将认证码显示到图象中
            g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
//调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成
            g.drawString(String.valueOf(rand), 13 * i + 6, 16);
        }
        g.drawOval(0,12,60,11);
// 将认证码存入SESSION
        request.getSession().setAttribute("rand", sRand);
// 图象生效
        g.dispose();
        ServletOutputStream output = null;
        try {
            output = response.getOutputStream();
// 输出图象到页面
            ImageIO.write(image, "JPEG", output);
        } catch (IOException e) {
            e.printStackTrace();
        }finally{
            output.close();
        }
    }
    private Color getRandColor(int fc, int bc) {
        Random random = new Random();
        if (fc > 255)
            fc = 255;
        if (bc > 255)
            bc = 255;
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }
}
```

#### 好友用户实时聊天
>通过轮询的方式实现
```js
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
```

#### 云部署
>打包生成war包后进行部署


