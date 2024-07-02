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
                    <h1 class="h3 mb-0 text-gray-800">Jobs</h1>
                    <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                            class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                </div>

                <!-- Content Row -->
                <div class="row">
                    <h3>${message}</h3>
                    <form:form action="/admin/jobs/${id}" method="post"  style="width: 60%;" modelAttribute="jobDTO">
                        <div class="form-group">
                            <label for="address">Company</label>
                            <form:select path="companyId" class="form-control">
                                <form:option value="0" disabled="true"> --SELECT-- </form:option>
                                <form:options items="${companies}" itemValue="id" itemLabel="name" />
                            </form:select>
                            <form:errors path="companyId" cssClass="text-danger" />
                        </div>
                        <div class="form-group">
                            <label >Job name</label>
                            <form:input type="text" class="form-control" id="name" path="name" />
                            <form:errors path="name" cssClass="text-danger" />
                        </div>
                        <div class="form-group">
                            <label for="address">Address</label>
                            <form:input type="text" class="form-control" id="address" path="address" />
                            <form:errors path="address" cssClass="text-danger" />

                        </div>

                        <div class="form-group">
                            <label>Type</label>
                           <div class="d-flex justify-content-center">
                               <form:checkbox  class="form-control ml-2 mr-2" style="width:13%"  path="types" value="Intern"/> <span class="m-2">Intern</span>
                               <form:checkbox  class="form-control ml-2 mr-2" style="width:13%"  path="types" value="Fresher"/> <span class="m-2">Fresher</span>
                               <form:checkbox  class="form-control ml-2 mr-2" style="width:13%"  path="types" value="Junior"/> <span class="m-2">Junior</span>
                               <form:checkbox  class="form-control ml-2 mr-2" style="width:13%" path="types" value="Middle"/> <span class="m-2">Middle</span>
                               <form:checkbox  class="form-control ml-2 mr-2" style="width:13%" path="types" value="Senior"/> <span class="m-2">Senior</span>
                               <form:checkbox  class="form-control ml-2 mr-2" style="width:13%" path="types" value="Trưởng nhóm"/> <span>Trưởng nhóm</span>
                               <form:checkbox  class="form-control ml-2 mr-2" style="width:13%"  path="types" value="Trưởng phòng"/> <span>Trưởng phòng</span>
                           </div>
                            <form:errors path="types" cssClass="text-danger" />

                        </div>

                        <div class="form-group">
                            <label >Contract</label>
                            <div class="d-flex just">
                                <form:checkbox class="form-control ml-2 mr-1"  style="width:13%" path="contract" value="Full-time" /> <span class="m-2">Full-time</span>
                                <form:checkbox  class="form-control ml-2 mr-1"  style="width:13%" path="contract" value="Freelance" /> <span class="m-2">Freelance</span>
                                <form:checkbox  class="form-control ml-2 mr-1"  style="width:13%" path="contract" value="Part-time"/> <span class="m-2">Part-time</span>
                            </div>
                            <form:errors path="contract" cssClass="text-danger" />

                        </div>
                        <div class="form-group">
                            <label for="salaryMin">Salary Min</label>
                            <form:input type="number" class="form-control" id="salaryMin" path="salaryMin" />
                            <form:errors path="salaryMin" cssClass="text-danger" />
                        </div>

                        <div class="form-group">
                            <label for="salaryMax">Salary Max</label>
                            <form:input type="number" class="form-control" id="salaryMax" path="salaryMax" />
                            <form:errors path="salaryMax" cssClass="text-danger" />

                        </div>

                        <div class="form-group">
                            <label for="experience">Experience</label>
                            <form:input type="number" class="form-control" id="experience" path="experience" />
                            <form:errors path="experience" cssClass="text-danger" />

                        </div>

                        <div class="form-group">
                            <label >Description</label>
                            <form:textarea style="width:100%;height:200px;" class="form-control" id="desc" path="description" rows="3"/>
                            <form:errors path="description" cssClass="text-danger" />
                        </div>

                        <div class="form-group">
                            <label>Requires</label>
                            <form:textarea class="form-control" id="requires" path="requires" rows="3"  style="width:100%;height:200px;"/>
                            <form:errors path="requires" cssClass="text-danger" />
                        </div>

                        <div class="form-group">
                            <label >Welfare</label>
                            <form:textarea  class="form-control" path="welfare" id="welfare" rows="3" style="width:100%;height:200px;"/>
                            <form:errors path="welfare" cssClass="text-danger" />

                        </div>

                        <div class="form-group">
                            <label for="endDate">End Date</label>
                            <form:input type="date" class="form-control" id="endDate" path="endDate" />
                            <form:errors path="endDate" cssClass="text-danger" />
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