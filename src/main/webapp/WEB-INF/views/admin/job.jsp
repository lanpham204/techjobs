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
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <a href="<c:url value="/admin/jobs/0"/>">
                                <button class="btn btn-success">Create</button>
                            </a>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Company</th>
                                        <th>Address</th>
                                        <th>Type</th>
                                        <th>Contract</th>
                                        <th>Salary Min</th>
                                        <th>Salary Max</th>
                                        <th>Experience</th>
                                        <th>Created Date</th>
                                        <th>End Date</th>
                                        <th>Candidates</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var = "job" items="${jobs}">
                                        <tr>
                                            <td>${job.id}</td>
                                            <td>${job.name}</td>
                                            <td>${job.company.name}</td>
                                            <td>${job.address}</td>
                                            <td>${job.type}</td>
                                            <td>${job.contract}</td>
                                            <td><fmt:formatNumber value="${job.salaryMin}" type="number" /></td>
                                            <td><fmt:formatNumber value="${job.salaryMax}" type="number" /></td>
                                            <td>${job.experience}</td>
                                            <td>${job.createdDate}</td>
                                            <td>${job.endDate}</td>
                                            <td>
                                                Have <span class="badge badge-danger">${job.appliedJobs.size()}</span> Candidates
                                                <a href="<c:url value="/admin/applied-job/${job.id}"/>">
                                                    <button class="btn btn-info m-1"  >View</button>
                                                </a></td>
                                            <td>
                                                <a href="<c:url value="/admin/jobs/${job.id}"/>">
                                                    <button class="btn btn-warning m-1"  >Edit</button>
                                                </a>
                                                <a href="<c:url value="/admin/jobs/delete/${job.id}"/>">
                                                    <button class="btn btn-danger  m-1" >Delete</button>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>


                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="d-flex justify-content-center">
                            <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                                <ul class="pagination">
                                    <c:if test="${currentPage > 0}">
                                        <li class="paginate_button page-item previous">
                                            <a href="/admin/jobs?page=${currentPage - 1}" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                                        </li>
                                    </c:if>
                                    <c:forEach var="i" begin="0" end="${totalPages - 1}">
                                        <li class="paginate_button page-item ${i == currentPage ? 'active' : ''}">
                                            <a href="/admin/jobs?page=${i}" aria-controls="dataTable" data-dt-idx="${i}" tabindex="0" class="page-link">${i + 1}</a>
                                        </li>
                                    </c:forEach>
                                    <c:if test="${currentPage < totalPages - 1}">
                                        <li class="paginate_button page-item next">
                                            <a href="/admin/jobs?page=${currentPage + 1}" aria-controls="dataTable" data-dt-idx="${totalPages}" tabindex="0" class="page-link">Next</a>
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

</body>

</html>