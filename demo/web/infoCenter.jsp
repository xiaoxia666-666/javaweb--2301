<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>个人中心 - 小夏商店</title>
    <!-- 引入 Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- 引入 jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- 引入 Bootstrap JS -->
    <script src="js/bootstrap.min.js"></script>
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
                    <a class="nav-link text-white" href="#">欢迎您：${sessionScope.customer.username}</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white" href="logout">退出</a>
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
                <li class="nav-item">
                    <a class="nav-link text-white" href="infoCenter">个人中心</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- 个人中心内容 -->
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0">个人信息</h4>
                </div>
                <div class="card-body">
                    <table class="table table-striped">
                        <tbody>
                        <tr>
                            <th scope="row">用户名</th>
                            <td>${sessionScope.customer.username}</td>
                        </tr>
                        <tr>
                            <th scope="row">真实姓名</th>
                            <td>${sessionScope.customer.realname}</td>
                        </tr>
                        <tr>
                            <th scope="row">联系电话</th>
                            <td>${sessionScope.customer.tel}</td>
                        </tr>
                        <tr>
                            <th scope="row">邮箱</th>
                            <td>${sessionScope.customer.email}</td>
                        </tr>
                        <tr>
                            <th scope="row">性别</th>
                            <td>
                                <c:choose>
                                    <c:when test="${sessionScope.customer.gender == '1'}">男</c:when>
                                    <c:otherwise>女</c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">注册时间</th>
                            <td>${sessionScope.customer.regTime}</td>
                        </tr>
                        <tr>
                            <th scope="row">会员等级</th>
                            <td>
                                <c:choose>
                                    <c:when test="${sessionScope.customer.level == '1'}">普通会员</c:when>
                                    <c:otherwise>钻石会员</c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editProfileModal">
                        修改信息
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 修改信息模态框 -->
<div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-labelledby="editProfileModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editProfileModalLabel">修改个人信息</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="realname">真实姓名</label>
                        <input type="text" class="form-control" id="realname" value="${sessionScope.customer.realname}">
                    </div>
                    <div class="form-group">
                        <label for="tel">联系电话</label>
                        <input type="text" class="form-control" id="tel" value="${sessionScope.customer.tel}">
                    </div>
                    <div class="form-group">
                        <label for="email">邮箱</label>
                        <input type="email" class="form-control" id="email" value="${sessionScope.customer.email}">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary">保存修改</button>
            </div>
        </div>
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

</body>
</html>