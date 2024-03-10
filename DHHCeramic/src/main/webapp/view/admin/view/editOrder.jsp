<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/view/admin/static" var="url"></c:url>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Chỉnh sửa đơn hàng | Quản trị Admin</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="${url}/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <!-- or -->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
    <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>

</head>
<body onload="time()" class="app sidebar-mini rtl">
<jsp:include page="/view/admin/view/mainbar.jsp"></jsp:include>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item">Danh sách đơn hàng</li>
            <li class="breadcrumb-item"><a href="#">Thêm đơn hàng</a></li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <h3 class="tile-title">Tạo mới đơn hàng</h3>
                <div class="tile-body">
                    <form class="row" action="${pageContext.request.contextPath}/Admin/order/edit"
                          method="post">
                        <div class="form-group  col-md-4">
                            <label class="control-label">ID đơn hàng</label>
                            <input class="form-control" type="text" name="id" value="${id}">
                        </div>
                        <div class="form-group  col-md-4">
                            <label class="control-label">Tên khách hàng</label>
                            <input class="form-control" type="text" name="fullname" value="${cartItem.order.buyer.fullname}" >
                        </div>
                        <div class="form-group  col-md-4">
                            <label class="control-label">Tên sản phẩm</label>
                            <input class="form-control" type="text" name="product_name" value="${cartItem.product.name}" >
                        </div>
                        <div class="form-group  col-md-4">
                            <label class="control-label">Số lượng</label>
                            <input class="form-control" type="number" name="quantity"  value="${cartItem.quantity}">
                        </div>
                        <div class="form-group  col-md-4">
                            <label class="control-label">Đơn giá</label>
                            <input class="form-control" type="number" name="unitPrice"  value="${cartItem.unitPrice}">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="status" class="control-label">Tình trạng</label>
                            <input type="text" name="status" class="form-control"
                                   value="${cartItem.status}" list="status">
                            <datalist id="status">
                                    <option value="Đã xác nhận">
                                    <option value="Đang giao hàng">
                                    <option value="Đã giao hàng">
                            </datalist>
                        </div>
                        <div class="form-group  col-md-4">
                            <label class="control-label">Ghi chú đơn hàng</label>
                            <input class="form-control" name="note" value="${cartItem.order.note}">
                        </div>

                        <button class="btn btn-save" type="submit">Lưu lại</button>
                        <a class="btn btn-cancel" href="${pageContext.request.contextPath}/Admin/order/list">Hủy bỏ</a>
                    </form>
                </div>

            </div>
        </div>
    </div>
</main>

<!-- Essential javascripts for application to work-->
<script src="${url}/js/jquery-3.2.1.min.js"></script>
<script src="${url}/js/popper.min.js"></script>
<script src="${url}/js/bootstrap.min.js"></script>
<script src="${url}/js/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="${url}/js/plugins/pace.min.js"></script>
</body>
</html>