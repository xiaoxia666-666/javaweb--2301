<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2025/2/28
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>购物车</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-12">
            <h5 class="text-center my-4">商品页面</h5>
        </div>
    </div>
    <div class="row">
        <c:forEach items="${spList}" var="goods">
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="img/${goods.picPath}" class="card-img-top" alt="${goods.name}">
                    <div class="card-body">
                        <p class="card-text">编号: <c:out value="${goods.id}"></c:out></p>
                        <p class="card-text">价格: <c:out value="${goods.price}"></c:out> 元</p>
                        <p class="card-text">商品名: <c:out value="${goods.name}"></c:out></p>
                        <p class="card-text">介绍: <c:out value="${goods.intro}"></c:out></p>
                        <p class="card-text">库存: <c:out value="${goods.stock}"></c:out> 件</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>