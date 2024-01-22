<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/view/client/static" var="url"></c:url>
<%@ page buffer="64kb" %>
<c:set var="numProduct" value="${0}"/>
<c:forEach
        items="${sessionScope.cart}" var="map">
    <c:set var="numProduct"
           value="${numProduct + 1}"/>
</c:forEach>
<%
    String alert = (String) request.getAttribute("alert");
%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>DHH Ceramic | Giỏ hàng</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="${url}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${url}/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${url}/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${url}/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${url}/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${url}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${url}/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${url}/css/style.css" type="text/css">
    <link rel="stylesheet" href="${url}/css/aucount.css" type="text/css">
    <link rel="stylesheet" href="${url}/css/cart.css" type="text/css">
    <link rel="stylesheet" href="${url}/css/checkout.css" type="text/css">
</head>

<body>
<!-- Header Section Begin -->
<jsp:include page="/view/client/view/header.jsp"></jsp:include>
<!-- Header Section End -->

<!-- Hero Section Begin -->
<section class="hero hero-normal">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>Tất cả sản phẩm</span>
                    </div>
                    <ul>
                        <li><a href="#">Gạch giá rẻ</a></li>
                        <li><a href="#">Gạch lát nền</a></li>
                        <li><a href="#">Gạch ốp tường</a></li>
                        <li><a href="#">Gạch lát sân vườn</a></li>
                        <li><a href="#">Gạch giả gỗ</a></li>
                        <li><a href="#">Gạch ốp lát cao cấp</a></li>
                        <li><a href="#">Gạch tranh thảm</a></li>
                        <li><a href="#">Gạch trang trí</a></li>
                        <li><a href="#">Gạch vỉa hè</a></li>
                        <li><a href="#">Gạch kính lấy sáng</a></li>
                        <li><a href="#">Gạch lát cầu thang</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="#">
                            <input type="text" placeholder="Bạn đang cần gì?">
                            <button type="submit" class="site-btn">Tìm kiếm</button>
                        </form>
                    </div>
                    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <i class="fa fa-phone"></i>
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>+65 11.188.888</h5>
                            <span>Hỗ trợ 24/7</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Hero Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="${url}/img/banner2.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Giỏ hàng</h2>
                    <div class="breadcrumb__option">
                        <a href="${pageContext.request.contextPath}/welcome">Trang chủ </a>
                        <span>Giỏ hàng</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shoping Cart Section Begin -->
<!-- Shoping Cart Section Begin -->
<section id="cart_items">
    <div class="container">
        <%
            if (alert != null) {
        %>
        <p class="alert alert-danger" role="alert">
            <%= alert %>
        </p>
        <%
            }
        %>
        <div class="table-responsive cart_info">
            <table class="table table-condensed">
                <thead>
                <tr class="cart_menu">
                    <td class="image">
                        <input type="checkbox" class="checkbox-filter" name="brands">
                        Tất cả (${numProduct} sản phẩm)
                    </td>
                    <td class="description">Tên sản phẩm</td>
                    <td class="price">Size</td>
                    <td class="price">Đơn giá</td>
                    <td class="quantity">Số lượng</td>
                    <td class="total">Thành tiền</td>
                    <td></td>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${sessionScope.cart}" var="map">
                    <tr>
                        <c:url value="${map.value.product.image }"
                               var="imgUrl"></c:url>
                        <td class="cart_product">
                            <input type="checkbox" class="checkbox-filter" name="brands">
                            <a href=""><img src="${imgUrl}" alt=""></a>
                        </td>
                        <td class="cart_description">
                            <h4><a href="">${map.value.product.name}</a></h4>
                        </td>
                        <td class="cart_price">
                            <p>${map.value.size}</p>
                        </td>
                        <td class="cart_price">
                            <p>${map.value.product.price}đ</p>
                        </td>
                        <td class="cart_quantity">
                                ${map.value.quantity}
                        </td>
                        <td class="cart_total">
                            <p class="cart_total_price">${map.value.product.price * map.value.quantity }đ</p>
                        </td>
                        <td class="cart_delete">
                            <a class="cart_quantity_delete"
                               href="${pageContext.request.contextPath}/cart/remove?pId=${map.value.product.id}"><i
                                    class="fa fa-times"></i></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</section>
<section id="do_action">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="payment__type">
                    <div class="payment__type-left">Phương thức thanh toán</div>
                    <div class="payment__type-right">
                        <p>Thanh toán khi nhận hàng</p>
                        <div class="payment__type-right-change">
                            <div type="button" class="launch" data-toggle="modal" data-target="#staticBackdrop">THAY ĐỔI
                            </div>
                            <!-- Modal -->
<%--                            <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false"--%>
<%--                                 tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">--%>
<%--                                <div class="modal-dialog">--%>
<%--                                    <div class="modal-content">--%>
<%--                                        <div class="modal-body">--%>
<%--                                            <div class="text-right"><i class="fas fa-times-circle text-close"--%>
<%--                                                                       data-dismiss="modal"></i></div>--%>
<%--                                            <div class="tabs mt-3">--%>
<%--                                                <ul class="nav nav-tabs" id="myTab" role="tablist">--%>
<%--                                                    <li class="nav-item" role="presentation"><a class="nav-link active"--%>
<%--                                                                                                id="visa-tab"--%>
<%--                                                                                                data-toggle="tab"--%>
<%--                                                                                                href="#visa" role="tab"--%>
<%--                                                                                                aria-controls="visa"--%>
<%--                                                                                                aria-selected="true">--%>
<%--                                                        <img src="${url}/images/home/visa.jpg" width="80"> </a></li>--%>
<%--                                                    <li class="nav-item" role="presentation"><a class="nav-link"--%>
<%--                                                                                                id="paypal-tab"--%>
<%--                                                                                                data-toggle="tab"--%>
<%--                                                                                                href="#paypal"--%>
<%--                                                                                                role="tab"--%>
<%--                                                                                                aria-controls="paypal"--%>
<%--                                                                                                aria-selected="false">--%>
<%--                                                        <img src="${url}/images/home/Paypal.png" width="80"> </a></li>--%>
<%--                                                </ul>--%>
<%--                                                <div class="tab-content" id="myTabContent">--%>
<%--                                                    <div class="tab-pane fade" id="visa" role="tabpanel"--%>
<%--                                                         aria-labelledby="visa-tab">--%>
<%--                                                        <div class="mt-4 mx-4">--%>
<%--                                                            <div class="text-center">--%>
<%--                                                                <h5>Credit card</h5>--%>
<%--                                                            </div>--%>
<%--                                                            <div class="form mt-3">--%>
<%--                                                                <div class="inputbox"><input type="text" name="name"--%>
<%--                                                                                             class="form-control"--%>
<%--                                                                                             required="required"> <span>Cardholder Name</span>--%>
<%--                                                                </div>--%>
<%--                                                                <div class="inputbox"><input type="text" name="name"--%>
<%--                                                                                             min="1" max="999"--%>
<%--                                                                                             class="form-control"--%>
<%--                                                                                             required="required"> <span>Card Number</span>--%>
<%--                                                                    <i class="fa fa-eye"></i></div>--%>
<%--                                                                <div class="d-flex flex-row">--%>
<%--                                                                    <div class="inputbox"><input type="text" name="name"--%>
<%--                                                                                                 min="1" max="999"--%>
<%--                                                                                                 class="form-control"--%>
<%--                                                                                                 required="required">--%>
<%--                                                                        <span>Expiration Date</span></div>--%>
<%--                                                                    <div class="inputbox"><input type="text" name="name"--%>
<%--                                                                                                 min="1" max="999"--%>
<%--                                                                                                 class="form-control"--%>
<%--                                                                                                 required="required">--%>
<%--                                                                        <span>CVV</span></div>--%>
<%--                                                                </div>--%>
<%--                                                                <div class="px-5 pay">--%>
<%--                                                                    <button class="btn btn-success btn-block">Add card--%>
<%--                                                                    </button>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="tab-pane fade  show active" id="paypal" role="tabpanel"--%>
<%--                                                         aria-labelledby="paypal-tab">--%>
<%--                                                        <div class="px-5 mt-5">--%>
<%--                                                            <div class="inputbox"><input type="text" name="name"--%>
<%--                                                                                         class="form-control"--%>
<%--                                                                                         required="required"> <span>Paypal Email Address</span>--%>
<%--                                                            </div>--%>
<%--                                                            <div class="pay px-5">--%>
<%--                                                                <button class="btn btn-primary btn-block">Add paypal--%>
<%--                                                                </button>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <form class="container" style="display: flex" action="${pageContext.request.contextPath}/member/order" method="post">
                <div class="col-lg-7">
                    <div class="chose_area">
                        <div class="heading" style="margin-left: 10px">
                            <b style="margin-bottom:5px">Giao tới </b>
                        </div>
                        <div class="user_infor">
                            <label style="margin-right: 10px">Họ tên</label>
                            <input type="text" name="name" class="name" value="${sessionScope.account.fullname}">
                            <div class="filter-price-range-filter__range-line"></div>
                            <label style="margin-right: 10px">Số điện thoại</label>
                            <input type="text" name="phone" class="phone" value="${sessionScope.account.phoneNumber}">
                        </div>
                        <div class="user_address">
                            <label style="margin-right: 10px; margin-top:20px">Địa chỉ</label>
                            <input type="text" name="address" class="address" id="address"
                                   value="${sessionScope.account.address}" style="margin-top: 16px;">
                        </div>
                        <input type="button" id="changePasswordBtn" class="change__password-btn"
                               style="margin-top: 12px; margin-left:12px;color: #c43434" onclick="showChangePassword()"
                               value="Thay đổi ">
                        <div class="discount_area">
                            <div class="discount_header">
                                <b style="margin-bottom:5px; margin-left: 10px">Khuyến mãi</b>
                                <p class="number_of_discount">Có thể chọn mã giảm giá hoặc mã freeship</p>
                            </div>
                            <input style="margin-left:15px" type="text" name="discount" class="name" placeholder="Nhập mã khuyến mãi">
                            <a><i class="fas fa-tag"></i> Chọn mã khuyến mãi</a>
                        </div>

                        <div class="checkout__input">
                            <b style="margin-bottom:5px; margin-left: 10px">Lưu ý</b>
                            <input type="text" name="note" placeholder="hàng dễ vỡ,..." style="margin-left: 10px">
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="total_area">
                        <c:set var="total" value="${0}"/>
                        <c:set var="numProduct" value="${0}"/>
                        <c:forEach
                                items="${sessionScope.cart}" var="map">
                            <c:set var="total"
                                   value="${total + map.value.quantity * map.value.product.price}"/>
                            <c:set var="numProduct"
                                   value="${numProduct + 1}"/>
                        </c:forEach>
                        <div class="checkout_calculate">
                            <div class="temp_price">
                                <p>Tạm tính</p>
                                <p>${total}đ</p>
                            </div>
                            <div class="discount_checkout">
                                <p>Giảm giá</p>
                                <p>0đ</p>
                            </div>
                            <div class="filter-price-range-filter__range-line-checkout"></div>
                            <div class="sum_price">
                                <p style="font-size: 24px;">Tổng cộng:</p>
                                <p class="no_product" style="font-size: 24px;">${total}</p>
                            </div>
                            <p class="vat">(Đã bao gồm thuế VAT nếu có)</p>
                        </div>
                        <div class="checkout_button">
                            <input type="submit" class="checkout" value="Mua hàng (${numProduct})">
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section><!--/#do_action-->
<!-- Shoping Cart Section End -->
<!--/Modal-->
<div id="modal1">
    <div class="modal__overlay">

    </div>
    <div id="modal__body1">
        <div id="turn__off" style="cursor: pointer; float:right; padding: 0 6px;">
            <i class="fas fa-times"></i>
        </div>
        <div class="card login-form">
            <div class="card-body">
                <h3 class="card-title text-center">Thay đổi thông tin</h3>

                <!--Password must contain one lowercase letter, one number, and be at least 7 characters long.-->

                <div class="card-text">
                    <form action="${pageContext.request.contextPath}/order/change-address" method="get">
                        <div class="alert alert-danger alert-dismissible show" role="alert">
                            <strong>Xin chào!</strong> Vui lòng điền vào các trường bên dưới để đổi thông tin
                            <input name="id" value="${sessionScope.account.id }" hidden="true">
                            <a class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </a>
                        </div>
                        <div class="form-group">
                            <label>Họ tên</label>
                            <input type="text" name="newName" class="form-control form-control-sm"
                                   value="${sessionScope.account.fullname}">
                        </div>
                        <div class="form-group">
                            <label>Số điện thoại</label>
                            <input type="text" name="newPhone" class="form-control form-control-sm"
                                   value="${sessionScope.account.phoneNumber}">
                        </div>
                        <div class="form-group">
                            <label>Địa chỉ</label>
                            <input type="address" name="newAddress" class="form-control form-control-sm"
                                   value="${sessionScope.account.address}">
                        </div>
                        <button type="submit" class="btn btn-block submit-btn">Xác nhận</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Footer Section Begin -->
<jsp:include page="/view/client/view/footer.jsp"></jsp:include>
<!-- Footer Section End -->

<!-- Js Plugins -->
<script src="${url}/js/jquery-3.3.1.min.js"></script>
<script src="${url}/js/bootstrap.min.js"></script>
<script src="${url}/js/jquery.nice-select.min.js"></script>
<script src="${url}/js/jquery-ui.min.js"></script>
<script src="${url}/js/jquery.slicknav.js"></script>
<script src="${url}/js/mixitup.min.js"></script>
<script src="${url}/js/owl.carousel.min.js"></script>
<script src="${url}/js/main.js"></script>

<script>
    $("#turn__off").click(
        function close() {
            document.getElementById("modal1").style.display = "none";
        });

    function showChangePassword() {
        document.getElementById("modal1").style.display = "block";
    }
</script>
</body>

</html>