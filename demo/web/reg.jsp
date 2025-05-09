<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body class="d-flex justify-content-center align-items-center vh-100 bg-light">
<div class="container bg-white rounded shadow p-4 w-50">
    <h2 class="text-center mb-4">用户注册</h2>
    <form class="form-horizontal" role="form" action="/doReg" method="POST">
        <!-- 姓名 -->
        <div class="form-group">
            <label for="realname" class="col-sm-4 control-label">姓名*</label>
            <div class="col-sm-6">
                <input type="text" placeholder="请填写姓名" class="form-control" id="realname" name="realname" required />
            </div>
        </div>

        <!-- 账号 -->
        <div class="form-group">
            <label for="username" class="col-sm-4 control-label">账号*</label>
            <div class="col-sm-6">
                <input type="text" placeholder="请填写账号" class="form-control" id="username" name="username" required />
            </div>
            <span id="exist"></span>
        </div>

        <!-- 密码 -->
        <div class="form-group">
            <label for="password" class="col-sm-4 control-label">密码*</label>
            <div class="col-sm-6">
                <input type="password" placeholder="请填写密码" name="pass" class="form-control" id="password" required />
            </div>
        </div>

        <!-- 确认密码 -->
        <div class="form-group">
            <label for="confirmPassword" class="col-sm-4 control-label">确认密码*</label>
            <div class="col-sm-6">
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="请确认密码" required />
            </div>
        </div>

        <!-- 头像URL -->
        <div class="form-group">
            <label for="imgUrl" class="col-sm-4 control-label">头像URL</label>
            <div class="col-sm-6">
                <input type="text" placeholder="请填写头像URL" class="form-control" id="imgUrl" name="imgUrl" />
            </div>
        </div>

        <!-- 简介 -->
        <div class="form-group">
            <label for="intro" class="col-sm-4 control-label">简介</label>
            <div class="col-sm-6">
                <textarea class="form-control" id="intro" name="introl" placeholder="请填写个人简介"></textarea>
            </div>
        </div>

        <!-- 手机 -->
        <div class="form-group">
            <label for="tel" class="col-sm-4 control-label">手机*</label>
            <div class="col-sm-6">
                <input type="tel" placeholder="请填写手机号" required name="tel" size="11" maxlength="11" class="form-control" id="tel" />
            </div>
            <div class="col-sm-offset-4 col-sm-6">
                <button type="button" class="btn btn-outline-secondary" onclick="sendVerificationCode()">
                    获取验证码
                </button>
            </div>
        </div>

        <!-- 邮箱 -->
        <div class="form-group">
            <label for="email" class="col-sm-4 control-label">邮箱</label>
            <div class="col-sm-6">
                <input type="email" placeholder="请填写邮箱" class="form-control" id="email" name="email" />
            </div>
        </div>

        <!-- 性别 -->
        <div class="form-group">
            <label for="gender" class="col-sm-4 control-label">性别</label>
            <div class="col-sm-6">
                <select class="form-control" id="gender" name="gender">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </div>
        </div>

        <!-- 身份证号 -->
        <div class="form-group">
            <label for="cardID" class="col-sm-4 control-label">VIP卡号</label>
            <div class="col-sm-6">
                <input type="text" placeholder="请填写VIP卡号" class="form-control" id="cardID" name="cardID" />
            </div>
        </div>

        <!-- 验证码 -->
        <div class="form-group">
            <label for="verificationCode" class="col-sm-4 control-label">验证码*</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="verificationCode" name="verificationCode" placeholder="请填写验证码" required />
            </div>
        </div>

        <!-- 注册按钮 -->
        <div class="form-group">
            <div class="col-sm-offset-4 col-sm-5 text-center">
                <button type="submit" class="btn btn-default btn-block btn-primary">
                    注&nbsp;&nbsp;&nbsp;册
                </button>
            </div>
        </div>
    </form>
</div>

<script>
    function sendVerificationCode() {
        // 这里需要实现获取验证码的逻辑
        alert("验证码已发送，请查收");
    }
</script>
</body>
</html>