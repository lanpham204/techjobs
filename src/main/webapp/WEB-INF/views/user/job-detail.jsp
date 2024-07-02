<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Styles -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/style/user/css/bootstrap-grid.css"/>" />
    <link rel="stylesheet" href="<c:url value="/style/user/css/icons.css"/>">
    <link rel="stylesheet" href="<c:url value="/style/user/css/animate.min.css"/>">
    <link rel="stylesheet" type="text/css" href="<c:url value="/style/user/css/style.css"/>" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/style/user/css/responsive.css"/>" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/style/user/css/chosen.css"/>" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/style/user/css/colors/colors.css"/>" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/style/user/css/bootstrap.css"/>" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link rel="stylesheet" href="<c:url value="/style/user/libs/slickslider/slick.css"/>">
    <link rel="stylesheet" href="<c:url value="/style/user/libs/slickslider/slick-theme.css"/>">
</head>
<body>

<div class="page-loading">
    <img src="/style/user/images/loader.gif" alt="" />
</div>

<div class="theme-layout" id="scrollup">

    <%@include file="/WEB-INF/templates/component/user/header.jsp" %>
    <section class="overlape">
        <div class="block no-padding">
            <div data-velocity="-.1" style="background: url(/style/user/images/resource/mslider1.jpg) repeat scroll 50% 422.28px transparent;" class="parallax scrolly-invisible no-parallax"></div><!-- PARALLAX BACKGROUND IMAGE -->
            <div class="container fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="inner-header">
                            <h3>${job.name}</h3>
                            <div class="job-statistic">
                                <span>${job.contract}</span>
                                <p><i class="la la-map-marker"></i>${job.address}</p>
                                <p><i class="la la-calendar-o"></i>Ngày hết hạn: ${endDate}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section>
        <div class="block">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 column">
                        <div class="job-single-sec">
                            <div class="job-single-head">
                                <div class="job-thumb"> <img src="/uploads/${job.company.images}" alt="" /> </div>
                                <div class="job-head-info">
                                    <h4>${job.company.name}</h4>
                                    <span>${job.company.address}</span>
                                    <p><i class="la la-unlink"></i>${job.company.website}</p>
                                    <p><i class="la la-phone"></i>${job.company.phoneNumber}</p>
                                    <p><i class="la la-envelope-o"></i>${job.company.email}</p>
                                </div>
                            </div><!-- Job Head -->
                            <div class="job-details">
                                <h3>Trách nhiệm công việc</h3>
                                    ${job.description}
                                <h3>Kỹ năng & Chuyên môn</h3>
                                ${job.requires}
                                <h3>Phúc lợi dành cho bạn</h3>
                                ${job.welfare}

                            </div>
                            <div class="share-bar">
                                <span>Share</span><a href="#" title="" class="share-fb"><i class="fa fa-facebook"></i></a><a href="#" title="" class="share-twitter"><i class="fa fa-twitter"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 column">
                            <a class="signin-popup apply-thisjob" href="#" title=""><i class="la la-paper-plane"></i>Ứng tuyển ngay</a>
                        <div class="job-overview">
                            <h3>Job Overview</h3>
                            <ul>
                                <li><i class="la la-shield"></i><h3>Năm kinh nghiệm tối thiểu</h3><span>Từ ${job.experience} Năm</span></li>
                                <li><i class="la la-money"></i><h3>Mức lương</h3><span><fmt:formatNumber value="${job.salaryMin}" type="number" /> - <fmt:formatNumber value="${job.salaryMax}" type="number" /></span></li>
                                <li><i class="la la-thumb-tack"></i><h3>Cấp bậc</h3><span>${job.type}</span></li>
                            </ul>
                        </div><!-- Job Overview -->
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%@include file="/WEB-INF/templates/component/user/footer.jsp" %>
    <div class="account-popup-area signin-popup-box">
        <div class="account-popup">
            <span class="close-popup"><i class="la la-close"></i></span>
            <h3>Ứng tuyển</h3>
<%--            <c:forEach var = "information" items="${informations}">--%>

<%--                    <div class="job-listings-sec__item">--%>
<%--                        <div class="job-listing wtabs" style="height: 132px;">--%>
<%--                        <div class="row">--%>
<%--                            <div class="col-10">--%>
<%--                                    <div class="job-title-sec">--%>
<%--                                        <h3>Họ và tên: ${information.fullname}</h3><br>--%>
<%--                                        <h3>Email: ${information.email}</h3> <br>--%>
<%--                                        <h3>CV: <a href="/uploads/${information.cv}">${information.cv}</a></h3>--%>
<%--                                            &lt;%&ndash;                                <span><textarea>${information.description}</textarea></span>&ndash;%&gt;--%>
<%--                                    </div>--%>

<%--                            </div>--%>
<%--                            <div class="col-2 d-flex align-items-center">--%>
<%--                                <p class="vtchek ">--%>
<%--                                    <input class="" type="radio" name="type" id="ghgf" >--%>
<%--                                    <label for="ghgf"></label>--%>
<%--                                </p>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        </div>--%>


<%--                    </div>--%>
<%--            </c:forEach>--%>
            <form:form action="/informations/${job.id}" method="post" modelAttribute="appliedJobDTO" enctype="multipart/form-data">
                <div class="row">
                    <div class="col">
                        <span class="pf-title text-left">Họ và tên</span>
                        <div class="pf-field">
                            <form:input type="text"  path="fullname"/>
                        </div>
                        <span class="pf-title text-left">Email</span>
                        <div class="pf-field">
                            <form:input type="email"  path="email"/>
                        </div>
                        <span class="pf-title text-left">CV của bạn</span>
                        <div class="pf-field">
                            <input type="file" name="fileCV">
                        </div>
                        <span class="pf-title text-left">Đoạn giới thiệu bản thân</span>
                        <div class="pf-field">
                            <form:textarea   path="description" rows="3" style="width:100%;height:100px;"/>
                        </div>
                        <button type="submit">Ứng tuyển</button>
                    </div>
                </div>
            </form:form>
        </div>
    </div>

</div>

<script src="/style/user/js/jquery.min.js" type="text/javascript"></script>
<script src="/style/user/js/modernizr.js" type="text/javascript"></script>
<script src="/style/user/js/script.js" type="text/javascript"></script>
<script src="/style/user/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/style/user/js/wow.min.js" type="text/javascript"></script>
<script src="/style/user/js/slick.min.js" type="text/javascript"></script>
<script src="/style/user/js/parallax.js" type="text/javascript"></script>
<script src="/style/user/js/select-chosen.js" type="text/javascript"></script>
<script src="/style/user/libs/slickslider/slick.min.js" type="text/javascript"></script>
<script src="/style/user/libs/slickslider/home-slick.js" type="text/javascript"></script>
</body>
</html>