<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <title>我的购物车</title>
    <style>
        /** DIV文本超出宽度部分用...替换，鼠标移上显示全部 **/
        .textAuto {
            width: 150px;
            white-space: nowrap; /*强制单行显示*/
            text-overflow: ellipsis; /*多余部分省略号显示*/
            overflow: hidden; /*超出部分隐藏*/
            display: inline-block; /*块级显示以便更改高宽*/
        }

        .textAuto:hover {
            overflow: visible;
            text-overflow: ellipsis;
            white-space: normal;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <c:if test="${sessionScope.cart==null}">
                <div class="jumbotron">
                    <h3>
                        您还没有购买任何商品!
                    </h3>
                    <p>
                    </p>
                    <p>
                        <a class="btn btn-primary btn-large" href="/index">去购物</a>
                    </p>
                </div>
            </c:if>

                <table class="table">
                    <thead>
                    <tr>
                        <th>
                            <input type="checkbox" id="checkAll">
                        </th>
                        <th>
                            图片
                        </th>
                        <th>
                            描述
                        </th>
                        <th>
                            属性
                        </th>
                        <th>
                            价格(￥)
                        </th>
                        <th>
                            数量
                        </th>
                        <th>
                            小计
                        </th>
                        <th>
                            操作
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- 购物车数据 -->
                    <c:forEach items="${sessionScope.cart}" var="item">
                        <tr class="rowData">
                            <td>
                                <input type="checkbox" class="ck">
                            </td>
                            <td>
                                <img class="imgUrl img-rounded" style="width: 30px;height:30px;"
                                     src="images/${item.goods.imgUrl}"/>
                            </td>
                            <td>
                            <span class="textAuto">
                                    ${item.goods.keywords}
                            </span>
                            </td>
                            <td>
                                <span class="name">颜色:红色,规格:束</span>
                            </td>
                            <td>
                            <span class="price">
                                    ${item.goods.out_price}
                            </span>
                            </td>
                            <td>
                                <button class="reduce">-</button>
                                <input type="text" name="num" value="${item.num}" style="width: 40px;" readonly>
                                <button class="plus">+</button>
                            </td>
                            <td>
                                <span class="xj">23.00</span>
                            </td>
                            <td>
                                <span class="del">删除</span>
                            </td>
                        </tr>
                    </c:forEach>
                    <!-- 总计和去结算 -->
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            总计：￥<strong> <span id="totalSum">0.00</span></strong>
                        </td>
                        <td>
                            <button class="btn btn-default btn-danger" id="jsBtn">去结算</button>
                        </td>
                    </tr>
                    </tbody>
                </table>

        </div>
    </div>
</div>
</body>

</html>
<script>
    $(function () {
        //按类名找所有的+按钮，让每个响应单击事件
        $(".plus").each(function () {
            $(this).click(function () {
                //当前节点的前一个兄弟节点
                var num_node = $(this).prev();
                var num = parseInt(num_node.val()) + 1;
                num_node.val(num);
                xj(num_node.val(), $(this));
                //重新计算总价
                zj();
            });
        });

        //按类名找所有的-按钮，让每个响应单击事件
        $(".reduce").each(function () {
            $(this).click(function () {
                //当前节点的前一个兄弟节点
                var num_node = $(this).next();
                //转整数递减
                var num = parseInt(num_node.val()) - 1;
                if (num >= 1) {
                    num_node.val(num);
                    xj(num_node.val(), $(this));
                    //重新计算总价
                    zj();
                }
            });
        });

        //小计
        function xj(num, obj) {
            var price = parseFloat(obj.parents(".rowData").find(".price").html());
            obj.parents(".rowData").find(".xj").html((num * price).toFixed(2));
        }

        //按类名找所有的复选框，让每个响应选择事件
        $("#checkAll").click(function () {
            //找到所有类名为ck的对象，将其属性值修改
            $(".ck").prop("checked", this.checked);
            //重新计算总价
            zj();
            // $("[name=?]:checkbox").prop("checked",this.checked);
        });

        //总计
        function zj() {
            //累和初始化
            var sum = 0;
            //遍历所有复选框
            $(".ck").each(function () {
                //若勾选，则取值后累和进总计中
                if ($(this).is(':checked')) {
                    var s = parseFloat($(this).parents(".rowData").find("span.xj").html());
                    sum += s;
                }
            });
            //修改总价
            $("#totalSum").html(sum.toFixed(2));
        }

        //单个复选框的更改事件
        $(".ck").change(function () {
            //若当前项没有勾选，则全选去掉勾选
            if (!$(this).is(":checked")) {
                $("#checkAll").prop("checked", false);
            }
            //重新计算总价
            zj();
        });

        //所有的删除链接
        $(".del").each(function () {
            $(this).click(function () {
                //找到要删除的那一行
                var re = $(this).parents(".rowData");
                // 确认框 确认后 删除该行
                if (confirm("确定删除吗？")) {
                    // 删除
                    re.remove();
                    //重新计算总计
                    zj();
                }
            });
        });
    });
</script>