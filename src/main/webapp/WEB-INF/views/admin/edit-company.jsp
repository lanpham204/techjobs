<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta path="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta path="description" content="">
    <meta path="author" content="">

    <title>Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="<c:url value="/style/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="<c:url value="/style/css/sb-admin-2.min.css"/>" rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
    <%@ include file="/WEB-INF/templates/component/admin/navbar.jsp" %>
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <%@include file="/WEB-INF/templates/component/admin/header.jsp" %>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4">
                    <h1 class="h3 mb-0 text-gray-800">Companies</h1>
                    <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                            class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                </div>

                <!-- Content Row -->
                <div class="row">
                    <h3>${message}</h3>
                    <form:form action="/admin/companies/${id}" method="post"  style="width: 60%;" modelAttribute="companyDTO" enctype="multipart/form-data">
                        <div class="form-group">
                            <label >Company name</label>
                            <form:input type="text" class="form-control" id="name" path="name" />
                            <form:errors path="name" cssClass="text-danger" />
                        </div>
                        <div class="form-group">
                            <label for="address">Address</label>
                            <form:input type="text" class="form-control" id="address" path="address" />
                            <form:errors path="address" cssClass="text-danger" />
                        </div>
                        <div class="form-group">
                            <label >Email</label>
                            <form:input type="text" class="form-control" id="address" path="email" />
                            <form:errors path="email" cssClass="text-danger" />
                        </div>
                        <div class="form-group">
                            <label >Website</label>
                            <form:input type="text" class="form-control" id="address" path="website" />
                            <form:errors path="website" cssClass="text-danger" />
                        </div>
                        <div class="form-group">
                            <label >Phone Number</label>
                            <form:input type="text" class="form-control" id="address" path="phoneNumber" />
                            <form:errors path="phoneNumber" cssClass="text-danger" />
                        </div>
                        <div class="form-group">
                            <label >Description</label>
                            <form:input type="text" class="form-control" id="address" path="description" />
                            <form:errors path="description" cssClass="text-danger" />
                        </div>
                        <div class="form-group">
                            <label >Image</label>
                            <input type="file" class="form-control" id="address" name="file" />
                            <c:if test="${id} > 0">
                                <img src="/uploads/${image}" alt="">
                            </c:if>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form:form>
                </div>
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <%@include file="/WEB-INF/templates/component/admin/footer.jsp" %>

        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="login.html">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="/style/vendor/jquery/jquery.min.js"></script>
<script src="/style/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/style/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/style/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/style/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="/style/js/demo/chart-area-demo.js"></script>
<script src="/style/js/demo/chart-pie-demo.js"></script>
<script type="text/javascript" src="http://js.nicedit.com/nicEdit-latest.js"></script>
<script type="text/javascript">
    bkLib.onDomLoaded(function() {
        new nicEditor({maxHeight : 200}).panelInstance('desc');
    });
    bkLib.onDomLoaded(function() {
        new nicEditor({maxHeight : 200}).panelInstance('requires');
    });
    bkLib.onDomLoaded(function() {
        new nicEditor({maxHeight : 200}).panelInstance('welfare');
    });
</script>
</body>

</html>