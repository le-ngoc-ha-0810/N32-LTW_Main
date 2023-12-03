<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/view/admin/static" var="url"></c:url>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Thêm đơn hàng | Quản trị Admin</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/view/client/view/css/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <!-- or -->
    <link rel="stylesheet" href=https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

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
                    <form class="row">
                        <div class="form-group  col-md-4">
                            <label class="control-label">ID đơn hàng ( Nếu không nhập sẽ tự động phát sinh )</label>
                            <input class="form-control" type="text">
                        </div>
                        <div class="form-group  col-md-4">
                            <label class="control-label">Tên khách hàng</label>
                            <input class="form-control" type="text">
                        </div>
                        <div class="form-group  col-md-4">
                            <label class="control-label">Số điện thoại khách hàng</label>
                            <input class="form-control" type="number">
                        </div>
                        <div class="form-group  col-md-4">
                            <label class="control-label">Địa chỉ khách hàng</label>
                            <input class="form-control" type="text">
                        </div>
                        <div class="form-group  col-md-4">
                            <label class="control-label">Ngày làm đơn hàng</label>
                            <input class="form-control" type="date">
                        </div>
                        <div class="form-group  col-md-4">
                            <label class="control-label">Mã sản phẩm</label>
                            <input class="form-control" type="text">
                        </div>
                        <div class="form-group  col-md-4">
                            <label class="control-label">Tên sản phẩm</label>
                            <input class="form-control" type="text">
                        </div>
                        <div class="form-group  col-md-4">
                            <label class="control-label">Số lượng</label>
                            <input class="form-control" type="number">
                        </div>
                        <div class="form-group col-md-4">
                            <label for="exampleSelect1" class="control-label">Tình trạng</label>
                            <select class="form-control" id="exampleSelect1">
                                <option>-- Chọn tình trạng --</option>
                                <option>Đã xử lý</option>
                                <option>Đang chờ</option>
                                <option>Đã hủy</option>
                            </select>
                        </div>
                        <div class="form-group  col-md-4">
                            <label class="control-label">Ghi chú đơn hàng</label>
                            <textarea class="form-control" rows="4"></textarea>
                        </div>
                    </form>
                </div>
                <button class="btn btn-save" type="button">Lưu lại</button>
                <a class="btn btn-cancel" href="${pageContext.request.contextPath}/view/client/view/table-data-oder.jsp">Hủy bỏ</a>
            </div>
        </div>
    </div>
</main>

<!-- Essential javascripts for application to work-->
<script src="${pageContext.request.contextPath}/view/client/view/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/view/client/view/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/view/client/view/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/view/client/view/js/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="${pageContext.request.contextPath}/view/client/view/js/plugins/pace.min.js"></script>
</body>
</html>