<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="<c:url value="/style/vendor/fontawesome-free/css/all.min.css"/>" rel="stylesheet" type="text/css">
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="<c:url value="/style/css/sb-admin-2.min.css"/>" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.2.0/mdb.min.css" rel="stylesheet" />
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
                    <h1 class="h3 mb-0 text-gray-800">Applied Jobs</h1>
                    <a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                            class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
                </div>

                <!-- Content Row -->
                <div class="row">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                        </div>

                        <div class="card-body">
                            <ul class="nav nav-pills">
                                <li class="nav-item">
                                    <a class="nav-link ${active == 'notAccept'? 'active':''}" href="/admin/applied-job/${jobId}">Not Accept</a>
                                </li>
                                <li class="nav-item ">
                                    <a class="nav-link ${active == 'accepted'? 'active':''}" href="/admin/applied-job/accepted/${jobId}">Accepted</a>
                                </li>
                            </ul>
<%--                            <ul class="nav nav-tabs" id="myTab" role="tablist">--%>
<%--                                <li class="nav-item" role="presentation">--%>
<%--                                    <button class="nav-link active" id="home-tab" data-toggle="tab" data-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Home</button>--%>
<%--                                </li>--%>
<%--                                <a href="/admin/applied-job/accepted/${jobId}">--%>
<%--                                <li class="nav-item" role="presentation">--%>
<%--                                        <button class="nav-link" id="profile-tab" data-toggle="tab" data-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Profile</button>--%>
<%--                                </li>--%>
<%--                                </a>--%>
<%--                                <li class="nav-item" role="presentation">--%>
<%--                                    <button class="nav-link" id="contact-tab" data-toggle="tab" data-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">Contact</button>--%>
<%--                                </li>--%>
<%--                            </ul>--%>
<%--                            <div class="tab-content" id="myTabContent">--%>
<%--                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">--%>
<%--                                </div>--%>
<%--                                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">...</div>--%>
<%--                                <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">...</div>--%>
<%--                            </div>--%>
                        </div>
                        <!-- Button trigger modal -->
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Full name</th>
                                    <th>Email</th>
                                    <th>Description</th>
                                    <th>CV</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var = "appliedJob" items="${appliedJobs}">
                                    <tr>
                                        <td>${appliedJob.id}</td>
                                        <td>${appliedJob.fullname}</td>
                                        <td>${appliedJob.email}</td>
                                        <td>${appliedJob.description}</td>
                                        <td><a href="/uploads/${appliedJob.cv}">${appliedJob.cv}</a></td>
                                        <td>
                                            <button class="signin-popup btn btn-success  m-1" data-mdb-ripple-init data-mdb-modal-init
                                                    data-mdb-target="#appliedJob${appliedJob.id}"
                                            >Accept Candidate</button>
                                        </td>
                                    </tr>
                                    <div class="modal fade" id="appliedJob${appliedJob.id}" tabindex="-1" aria-labelledby="exampleModalLabel"
                                         aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Send Email To Candidate</h5>
                                                    <button type="button" class="btn-close" data-mdb-ripple-init data-mdb-dismiss="modal"
                                                            aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <c:if test="${active =='notAccept'}">
                                                        <form method="post" action="/admin/applied-job/accept/${appliedJob.id}">
                                                            <div class="form-group">
                                                                <label >Address Company</label>
                                                                <input type="text" class="form-control" value="${appliedJob.job.company.address}" name="addressCompany"/>
                                                            </div>
                                                            <div class="form-group">
                                                                <label >Date</label>
                                                                <input type="date" class="form-control"  name="date"/>
                                                            </div>
                                                            <div class="form-group d-flex">
                                                                <label class="mr-2">Hour</label>
                                                                <input type="number" class="form-control mr-2" name="hour" style="width: 60px"/>
                                                                <input type="number" class="form-control mr-2" name="minute" style="width: 60px"/>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-mdb-ripple-init
                                                                        data-mdb-dismiss="modal">Close</button>
                                                                <button type="submit" class="btn btn-warning" data-mdb-ripple-init>Send</button>
                                                            </div>
                                                        </form>
                                                    </c:if>
                                                    <c:if test="${active == 'accepted'}">
                                                        <form method="post" action="/admin/applied-job/accepted/${appliedJob.id}">
                                                            <div class="form-group">
                                                                <label >Name Job</label>
                                                                <input type="text" class="form-control" value="${appliedJob.job.name}" name="nameJob"/>
                                                            </div>
                                                            <div class="form-group">
                                                                <label >Address Company</label>
                                                                <input type="text" class="form-control" value="${appliedJob.job.company.address}" name="addressCompany"/>
                                                            </div>
                                                            <div class="form-group">
                                                                <label >Start Date</label>
                                                                <input type="date" class="form-control"  name="startDate"/>
                                                            </div>
                                                            <div class="form-group">
                                                                <label >Reply Date</label>
                                                                <input type="date" class="form-control"  name="replyDate"/>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-mdb-ripple-init
                                                                        data-mdb-dismiss="modal">Close</button>
                                                                <button type="submit" class="btn btn-warning" data-mdb-ripple-init>Send</button>
                                                            </div>
                                                        </form>
                                                    </c:if>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                </c:forEach>


                                </tbody>
                            </table>
                        </div>

                        <!-- Modal -->

                        <div class="d-flex justify-content-center">
                            <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                                <ul class="pagination">
                                    <c:if test="${currentPage > 0}">
                                        <li class="paginate_button page-item previous">
                                            <a href="${hrefPage}/${jobId}?page=${currentPage - 1}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                                        </li>
                                    </c:if>
                                    <c:forEach var="i" begin="0" end="${totalPages - 1}">
                                        <li class="paginate_button page-item ${i == currentPage ? 'active' : ''}">
                                            <a href="${hrefPage}/${jobId}?page=${i}" aria-controls="dataTable" data-dt-idx="${i}" tabindex="0" class="page-link">${i + 1}</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test="${currentPage < totalPages - 1}">
                                        <li class="paginate_button page-item next">
                                            <a href="${hrefPage}/${jobId}?page=${currentPage + 1}" aria-controls="dataTable" data-dt-idx="${totalPages}" tabindex="0" class="page-link">Next</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </div>
                        </div>

                    </div>

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
<%--    <div class="account-popup-area signin-popup-box">--%>
<%--        <div class="account-popup">--%>
<%--            <span class="close-popup"><i class="la la-close"></i></span>--%>
<%--            <h3>Ứng tuyển</h3>--%>
<%--            <form:form action="/informations/${job.id}" method="post" modelAttribute="informationDTO" enctype="multipart/form-data">--%>
<%--                <div class="row">--%>
<%--                    <div class="col">--%>
<%--                        <span class="pf-title text-left">Họ và tên</span>--%>
<%--                        <div class="pf-field">--%>
<%--                            <form:input type="text"  path="fullname"/>--%>
<%--                        </div>--%>
<%--                        <span class="pf-title text-left">Email</span>--%>
<%--                        <div class="pf-field">--%>
<%--                            <form:input type="email"  path="email"/>--%>
<%--                        </div>--%>
<%--                        <span class="pf-title text-left">CV của bạn</span>--%>
<%--                        <div class="pf-field">--%>
<%--                            <input type="file" name="fileCV">--%>
<%--                        </div>--%>
<%--                        <span class="pf-title text-left">Đoạn giới thiệu bản thân</span>--%>
<%--                        <div class="pf-field">--%>
<%--                            <form:textarea   path="description" rows="3" style="width:100%;height:100px;"/>--%>
<%--                        </div>--%>
<%--                        <button type="submit">Ứng tuyển</button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </form:form>--%>
<%--        </div>--%>
<%--    </div>--%>

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

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
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/7.2.0/mdb.umd.min.js"></script>
</body>

</html>