<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/view/admin/static" var="url"></c:url>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Danh sách tin tức | Quản trị Admin</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="${url}/css/main.css">
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
<!-- Navbar-->
<jsp:include page="/view/admin/view/mainbar.jsp"></jsp:include>
<main class="app-content">
    <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
            <li class="breadcrumb-item active"><a href="#"><b>Danh sách tin tức</b></a></li>
        </ul>
        <div id="clock"></div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="tile">
                <div class="tile-body">
                    <div class="row element-button">
                        <div class="col-sm-2">
                            <a class="btn btn-add btn-sm"
                               href="${pageContext.request.contextPath}/Admin/blog/add" title="Thêm"><i
                                    class="fas fa-plus"></i>
                                Tạo mới tin tức</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm nhap-tu-file" type="button" title="Nhập"
                               onclick="myFunction(this)"><i
                                    class="fas fa-file-upload"></i> Tải từ file</a>
                        </div>

                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm print-file" type="button" title="In"
                               onclick="myApp.printTable()"><i
                                    class="fas fa-print"></i> In dữ liệu</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm print-file js-textareacopybtn" type="button"
                               title="Sao chép"><i
                                    class="fas fa-copy"></i> Sao chép</a>
                        </div>

                        <div class="col-sm-2">
                            <a class="btn btn-excel btn-sm" href="" title="In"><i class="fas fa-file-excel"></i> Xuất
                                Excel</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm pdf-file" type="button" title="In"
                               onclick="myFunction(this)"><i
                                    class="fas fa-file-pdf"></i> Xuất PDF</a>
                        </div>
                        <div class="col-sm-2">
                            <a class="btn btn-delete btn-sm" type="button" title="Xóa" onclick="myFunction(this)"><i
                                    class="fas fa-trash-alt"></i> Xóa tất cả </a>
                        </div>
                    </div>
                    <table class="table table-hover table-bordered" id="sampleTable">
                        <thead>
                        <tr>
                            <th width="10"><input type="checkbox" id="all"></th>
                            <th>Mã tin tức</th>
                            <th>Tiêu đề tin tức</th>
                            <th>Ảnh</th>
                            <th>Loại tin tức</th>
                            <th>Ngày đăng</th>
                            <th>Mô tả</th>
                            <th>Chức năng</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <c:forEach items="${blogList}" var="blog">
                            <td width="10"><input type="checkbox" name="check1" value="1"></td>
                            <td>${blog.id}</td>
                            <td>${blog.title}</td>
                            <c:url value="${blog.image }" var="imgUrl"></c:url>
                            <td><img src="${imgUrl}" alt="" width="100px;"></td>
                            <td>${blog.blogCate}</td>
                            <td><span class="badge bg-success">${blog.date}</span></td>
                            <td>${blog.des}
                            </td>
                                <td class="table-td-center">
                                    <button class="btn btn-primary btn-sm trash" type="button" title="Xóa"
                                            onclick="confirmDelete(${blog.id})"><i class="fas fa-trash-alt"></i>
                                    </button>
                                    <a href="${pageContext.request.contextPath}/Admin/news/edit?id=${blog.id}">
                                        <button class="btn btn-primary btn-sm edit" type="button" title="Sửa"
                                                id="show-emp"
                                                data-toggle="modal" data-target="#ModalUP"><i class="fas fa-edit"></i>
                                        </button>
                                    </a>
                                </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</main>


<!-- Essential javascripts for application to work-->
<script src="${url}/js/jquery-3.2.1.min.js"></script>
<script src="${url}/js/popper.min.js"></script>
<script src="${url}/js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="${url}/src/jquery.table2excel.js"></script>
<script src="${url}/js/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="${url}/js/plugins/pace.min.js"></script>
<!-- Page specific javascripts-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- Data table plugin-->
<script type="text/javascript" src="${url}/js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${url}/js/plugins/dataTables.bootstrap.min.js"></script>
<script type="text/javascript">
    $('#sampleTable').DataTable();

    //Thời Gian
    function time() {
        var today = new Date();
        var weekday = new Array(7);
        weekday[0] = "Chủ Nhật";
        weekday[1] = "Thứ Hai";
        weekday[2] = "Thứ Ba";
        weekday[3] = "Thứ Tư";
        weekday[4] = "Thứ Năm";
        weekday[5] = "Thứ Sáu";
        weekday[6] = "Thứ Bảy";
        var day = weekday[today.getDay()];
        var dd = today.getDate();
        var mm = today.getMonth() + 1;
        var yyyy = today.getFullYear();
        var h = today.getHours();
        var m = today.getMinutes();
        var s = today.getSeconds();
        m = checkTime(m);
        s = checkTime(s);
        nowTime = h + " giờ " + m + " phút " + s + " giây";
        if (dd < 10) {
            dd = '0' + dd
        }
        if (mm < 10) {
            mm = '0' + mm
        }
        today = day + ', ' + dd + '/' + mm + '/' + yyyy;
        tmp = '<span class="date"> ' + today + ' - ' + nowTime +
            '</span>';
        document.getElementById("clock").innerHTML = tmp;
        clocktime = setTimeout("time()", "1000", "Javascript");

        function checkTime(i) {
            if (i < 10) {
                i = "0" + i;
            }
            return i;
        }
    }
</script>
<script>
    function confirmDelete(blogId) {
        swal({
            title: "Cảnh báo",
            text: "Bạn có chắc chắn muốn xóa người dùng này?",
            buttons: ["Hủy bỏ", "Đồng ý"],
        }).then((willDelete) => {
            if (willDelete) {
                window.location.href = "${pageContext.request.contextPath}/Admin/blog/delete?id=" + blogId;
            }
        });
    }
    oTable = $('#sampleTable').dataTable();
    $('#all').click(function (e) {
        $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
        e.stopImmediatePropagation();
    });
</script>
</body>

</html>