<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2025/2/28
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <!-- 修正 CSS 文件路径，使用正斜杠 -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h3 class="text-center">
                系统登录
            </h3>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form class="form-horizontal" role="form">
                <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">邮箱</label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" id="inputEmail3"/>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="inputPassword3" class="col-sm-2 col-form-label">密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="inputPassword3"/>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-10 offset-sm-10">
                        <div class="checkbox">
                            <label><input type="checkbox"/>记住我</label>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-6 offset-sm-6">
                        <button type="submit" class="btn btn-default">登录</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


</div>
</body>
</html>