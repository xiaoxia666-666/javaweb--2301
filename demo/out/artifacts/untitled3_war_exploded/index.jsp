<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2025/2/28
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>欢迎光临小夏商店</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>

<!-- 导航栏 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand fs-4 fw-bold text-white" href="#">小夏商店</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link text-white" href="login">登录</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="reg">注册</a>
                </li>
                <li>
                    <a class="nav-link text-white" href="ShoppingCart">
                        我的购物车
                        <span class="badge" style="background-color: red; border-radius: 50%; padding: 0.2em 0.6em; margin-left: 0.5em; color: white;">
            <c:choose>
                <c:when test="${sessionScope.cart==null}">
                    0
                </c:when>
                <c:otherwise>
                    ${sessionScope.cart.size()}
                </c:otherwise>
            </c:choose>
        </span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- 商品展示区域 -->
<div class="container mt-5">
    <div class="row g-4">
        <c:forEach items="${spList}" var="rs">
            <div class="col-md-4">
                <div class="card rounded-3 shadow-sm h-100">
                    <img src="images/${rs.imgUrl}" class="card-img-top rounded-top" alt="">
                    <div class="card-body d-flex flex-column justify-content-between">
                        <div>
                            <h6 class="card-title">名称：${rs.keywords}</h6>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="text-danger fw-bold">价格：¥${rs.in_price}</div>
                                <div>库存:${rs.stock}</div>
                            </div>
                        </div>
                        <!-- 修改为 <a> 标签实现跳转 -->
                        <a class="btn btn-danger btn-lg w-100" href="/session?id=${rs.id}">加入购物车</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<!-- 页脚 -->
<footer class="bg-light p-5">
    <div class="container text-center">
        <div class="row">
            <div class="col-md-4">
                <h5 class="fw-bold">关于我们</h5>
                <p>公司简介</p>
                <p>可持续发展</p>
            </div>
            <div class="col-md-4">
                <h5 class="fw-bold">服务支持</h5>
                <p>技术支持</p>
                <p>信任中心</p>
            </div>
            <div class="col-md-4">
                <h5 class="fw-bold">合作机会</h5>
                <p>招贤纳士</p>
                <p>供应商合作</p>
            </div>
            <div class="col-md-12">
                <h5 class="fw-bold">扫码微信联系</h5>
                <img src="images/contact.png" class="img-fluid" alt="二维码">
                <p><small>© 2025 小夏商店 版权所有</small></p>
            </div>
        </div>
    </div>
</footer>

<script src="js/bootstrap.min.js"></script>
</body>
</html>