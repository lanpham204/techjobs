<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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

    <form action="/jobs">
        <%@include file="/WEB-INF/templates/component/user/searchbox.jsp" %>
    </form>
    <section>
        <div class="block">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="heading">
                            <h2>Việc làm hấp dẫn</h2>
                            <span>Ứng tuyển ngay các việc làm hấp dẫn nhất</span>
                        </div><!-- Heading -->
                        <div class="job-listings-sec">
                            <div id="homeSlider1">
                                <c:forEach var = "job" items="${jobs}">
                                    <div class="job-listings-sec__item">
                                        <div class="job-listing wtabs" style="height: 132px;">
                                            <div class="job-title-sec">
                                                <div class="c-logo"> <img src="/uploads/${job.company.images}" alt="" /> </div>
                                                <h3><a href="/jobs/${job.id}" title="">${job.name}</a></h3>
                                                <span>${job.company.name}</span> <br>
                                                <span class="job-lctn"><i class="la la-map-marker"></i>${job.address}</span>
                                                <span><i class="las la-wallet"></i><fmt:formatNumber value="${job.salaryMin}" type="number" />
                                                    triệu - <fmt:formatNumber value="${job.salaryMax}" type="number" /> triệu</span>
                                            </div>
                                            <span class="fav-job"><i class="la la-heart-o"></i></span>
                                        </div><!-- Job -->
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="browse-all-cat">
                            <a href="#" title="">Xem thêm việc làm</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

<%--    <section id="scroll-here">--%>
<%--        <div class="block">--%>
<%--            <div class="container">--%>
<%--                <div class="row">--%>
<%--                    <div class="col-lg-12">--%>
<%--                        <div class="heading">--%>
<%--                            <h2>Danh Mục Nổi Bật</h2>--%>
<%--                        </div><!-- Heading -->--%>
<%--                        <div class="cat-sec">--%>
<%--                            <div class="row no-gape">--%>
<%--                                <div class="col-lg-3 col-md-3 col-sm-6">--%>
<%--                                    <div class="p-category">--%>
<%--                                        <a href="#" title="">--%>
<%--                                            <span>Design, Art & Multimedia</span>--%>
<%--                                            <p>(22 open positions)</p>--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-lg-3 col-md-3 col-sm-6">--%>
<%--                                    <div class="p-category">--%>
<%--                                        <a href="#" title="">--%>
<%--                                            <span>Education Training</span>--%>
<%--                                            <p>(6 open positions)</p>--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-lg-3 col-md-3 col-sm-6">--%>
<%--                                    <div class="p-category">--%>
<%--                                        <a href="#" title="">--%>
<%--                                            <span>Accounting / Finance</span>--%>
<%--                                            <p>(3 open positions)</p>--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-lg-3 col-md-3 col-sm-6">--%>
<%--                                    <div class="p-category">--%>
<%--                                        <a href="#" title="">--%>
<%--                                            <span>Human Resource</span>--%>
<%--                                            <p>(3 open positions)</p>--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="cat-sec">--%>
<%--                            <div class="row no-gape">--%>
<%--                                <div class="col-lg-3 col-md-3 col-sm-6">--%>
<%--                                    <div class="p-category">--%>
<%--                                        <a href="#" title="">--%>
<%--                                            <span>Telecommunications</span>--%>
<%--                                            <p>(22 open positions)</p>--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-lg-3 col-md-3 col-sm-6">--%>
<%--                                    <div class="p-category">--%>
<%--                                        <a href="#" title="">--%>
<%--                                            <span>Restaurant / Food Service</span>--%>
<%--                                            <p>(6 open positions)</p>--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-lg-3 col-md-3 col-sm-6">--%>
<%--                                    <div class="p-category">--%>
<%--                                        <a href="#" title="">--%>
<%--                                            <span>Construction / Facilities</span>--%>
<%--                                            <p>(3 open positions)</p>--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-lg-3 col-md-3 col-sm-6">--%>
<%--                                    <div class="p-category">--%>
<%--                                        <a href="#" title="">--%>
<%--                                            <span>Health</span>--%>
<%--                                            <p>(3 open positions)</p>--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="col-lg-12">--%>
<%--                        <div class="browse-all-cat">--%>
<%--                            <a href="#" title="">Browse All Categories</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </section>--%>

<%--    <section>--%>
<%--        <div class="block double-gap-top double-gap-bottom">--%>
<%--            <div data-velocity="-.1" style="background: url(images/resource/parallax1.jpg) repeat scroll 50% 422.28px transparent;" class="parallax scrolly-invisible layer color"></div><!-- PARALLAX BACKGROUND IMAGE -->--%>
<%--            <div class="container">--%>
<%--                <div class="row">--%>
<%--                    <div class="col-lg-12">--%>
<%--                        <div class="simple-text-block">--%>
<%--                            <h3>Make a Difference with Your Online Resume!</h3>--%>
<%--                            <span>Your resume in minutes with JobHunt resume assistant is ready!</span>--%>
<%--                            <a href="#" title="">Create an Account</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </section>--%>

<%--    <section>--%>
<%--        <div class="block">--%>
<%--            <div class="container">--%>
<%--                <div class="row">--%>
<%--                    <div class="col-lg-12">--%>
<%--                        <div class="heading">--%>
<%--                            <h2>Việc làm hấp dẫn</h2>--%>
<%--                            <span>Ứng tuyển ngay các việc làm hấp dẫn nhất</span>--%>
<%--                        </div><!-- Heading -->--%>
<%--                        <div class="job-listings-sec">--%>
<%--                            <div class="row">--%>
<%--                                <div class="col-md-4 col-sm-12 col-12">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l1.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="col-md-4 col-sm-12 col-12">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l2.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Frontend Developer (JavaScript, ReactJS)</a></h3>--%>
<%--                                            <span>mgm technology</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="col-md-4 col-sm-12 col-12">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l3.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="col-md-4 col-sm-12 col-12">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l4.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="col-md-4 col-sm-12 col-12">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l5.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="col-md-4 col-sm-12 col-12">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l6.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="col-md-4 col-sm-12 col-12">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l1.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="col-md-4 col-sm-12 col-12">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l2.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="col-md-4 col-sm-12 col-12">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l3.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="col-lg-12">--%>
<%--                        <div class="browse-all-cat">--%>
<%--                            <a href="#" title="">Xem thêm việc làm</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </section>--%>

<%--    <section>--%>
<%--        <div class="block">--%>
<%--            <div class="container">--%>
<%--                <div class="row">--%>
<%--                    <div class="col-md-12">--%>
<%--                        <div class="heading">--%>
<%--                            <h2>Việc làm hấp dẫn</h2>--%>
<%--                            <span>Ứng tuyển ngay các việc làm hấp dẫn nhất</span>--%>
<%--                        </div><!-- Heading -->--%>
<%--                    </div>--%>
<%--                    <div class="col-md-8">--%>
<%--                        <div class="job-listings-sec">--%>
<%--                            <div id="homeSlider2">--%>
<%--                                <div class="job-listings-sec__item">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l1.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="job-listings-sec__item">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l2.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Frontend Developer (JavaScript, ReactJS)</a></h3>--%>
<%--                                            <span>mgm technology</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="job-listings-sec__item">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l3.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="job-listings-sec__item">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l4.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="job-listings-sec__item">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l5.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="job-listings-sec__item">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l6.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="job-listings-sec__item">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l1.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="job-listings-sec__item">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l2.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="job-listings-sec__item">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l3.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="job-listings-sec__item">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l1.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="job-listings-sec__item">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l2.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Frontend Developer (JavaScript, ReactJS)</a></h3>--%>
<%--                                            <span>mgm technology</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="job-listings-sec__item">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l3.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="job-listings-sec__item">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l4.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="job-listings-sec__item">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l5.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="job-listings-sec__item">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l6.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="job-listings-sec__item">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l1.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="job-listings-sec__item">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l2.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                                <div class="job-listings-sec__item">--%>
<%--                                    <div class="job-listing wtabs">--%>
<%--                                        <div class="job-title-sec">--%>
<%--                                            <div class="c-logo"> <img src="/style/user/images/resource/l3.png" alt="" /> </div>--%>
<%--                                            <h3><a href="#" title="">Web Designer / Developer</a></h3>--%>
<%--                                            <span>FPT Software</span> <br>--%>
<%--                                            <span class="job-lctn"><i class="la la-map-marker"></i>Đà Nẵng</span>--%>
<%--                                            <span><i class="las la-wallet"></i>10 triệu - 15 triệu</span>--%>
<%--                                        </div>--%>
<%--                                        <span class="fav-job"><i class="la la-heart-o"></i></span>--%>
<%--                                    </div><!-- Job -->--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="col-md-4">--%>
<%--                        <div class="ads-banner" style="margin-top: 30px;">--%>
<%--                            <a href="#">--%>
<%--                                <img src="/style/user/images/right-banner.png" alt="Right banner">--%>
<%--                            </a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </section>--%>

<%--    <section>--%>
<%--        <div class="block">--%>
<%--            <div data-velocity="-.1" style="background: url(images/resource/parallax2.jpg) repeat scroll 50% 422.28px transparent;" class="parallax scrolly-invisible layer color light"></div><!-- PARALLAX BACKGROUND IMAGE -->--%>
<%--            <div class="container">--%>
<%--                <div class="row">--%>
<%--                    <div class="col-lg-12">--%>
<%--                        <div class="heading light">--%>
<%--                            <h2>Kind Words From Happy Candidates</h2>--%>
<%--                            <span>What other people thought about the service provided by JobHunt</span>--%>
<%--                        </div><!-- Heading -->--%>
<%--                        <div class="reviews-sec" id="reviews-carousel">--%>
<%--                            <div class="col-lg-6">--%>
<%--                                <div class="reviews">--%>
<%--                                    <img src="/style/user/images/resource/r1.jpg" alt="" />--%>
<%--                                    <h3>Augusta Silva <span>Web designer</span></h3>--%>
<%--                                    <p>Without JobHunt i’d be homeless, they found me a job and got me sorted out quickly with everything!  Can’t quite believe the service</p>--%>
<%--                                </div><!-- Reviews -->--%>
<%--                            </div>--%>
<%--                            <div class="col-lg-6">--%>
<%--                                <div class="reviews">--%>
<%--                                    <img src="/style/user/images/resource/r2.jpg" alt="" />--%>
<%--                                    <h3>Ali Tufan <span>Web designer</span></h3>--%>
<%--                                    <p>Without JobHunt i’d be homeless, they found me a job and got me sorted out quickly with everything!  Can’t quite believe the service</p>--%>
<%--                                </div><!-- Reviews -->--%>
<%--                            </div>--%>
<%--                            <div class="col-lg-6">--%>
<%--                                <div class="reviews">--%>
<%--                                    <img src="/style/user/images/resource/r1.jpg" alt="" />--%>
<%--                                    <h3>Augusta Silva <span>Web designer</span></h3>--%>
<%--                                    <p>Without JobHunt i’d be homeless, they found me a job and got me sorted out quickly with everything!  Can’t quite believe the service</p>--%>
<%--                                </div><!-- Reviews -->--%>
<%--                            </div>--%>
<%--                            <div class="col-lg-6">--%>
<%--                                <div class="reviews">--%>
<%--                                    <img src="/style/user/images/resource/r2.jpg" alt="" />--%>
<%--                                    <h3>Ali Tufan <span>Web designer</span></h3>--%>
<%--                                    <p>Without JobHunt i’d be homeless, they found me a job and got me sorted out quickly with everything!  Can’t quite believe the service</p>--%>
<%--                                </div><!-- Reviews -->--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </section>--%>

<%--    <section>--%>
<%--        <div class="block">--%>
<%--            <div class="container">--%>
<%--                <div class="row">--%>
<%--                    <div class="col-lg-12">--%>
<%--                        <div class="heading">--%>
<%--                            <h2>Companies We've Helped</h2>--%>
<%--                            <span>Some of the companies we've helped recruit excellent applicants over the years.</span>--%>
<%--                        </div><!-- Heading -->--%>
<%--                        <div class="comp-sec">--%>
<%--                            <div class="company-img">--%>
<%--                                <a href="#" title=""><img src="/style/user/images/resource/cc1.jpg" alt="" /></a>--%>
<%--                            </div><!-- Client  -->--%>
<%--                            <div class="company-img">--%>
<%--                                <a href="#" title=""><img src="/style/user/images/resource/cc2.jpg" alt="" /></a>--%>
<%--                            </div><!-- Client  -->--%>
<%--                            <div class="company-img">--%>
<%--                                <a href="#" title=""><img src="/style/user/images/resource/cc3.jpg" alt="" /></a>--%>
<%--                            </div><!-- Client  -->--%>
<%--                            <div class="company-img">--%>
<%--                                <a href="#" title=""><img src="/style/user/images/resource/cc4.jpg" alt="" /></a>--%>
<%--                            </div><!-- Client  -->--%>
<%--                            <div class="company-img">--%>
<%--                                <a href="#" title=""><img src="/style/user/images/resource/cc5.jpg" alt="" /></a>--%>
<%--                            </div><!-- Client  -->--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </section>--%>

<%--    <section>--%>
<%--        <div class="block">--%>
<%--            <div data-velocity="-.1" style="background: url(images/resource/parallax3.jpg) repeat scroll 50% 422.28px transparent;" class="parallax scrolly-invisible no-parallax"></div><!-- PARALLAX BACKGROUND IMAGE -->--%>
<%--            <div class="container">--%>
<%--                <div class="row">--%>
<%--                    <div class="col-lg-12">--%>
<%--                        <div class="heading">--%>
<%--                            <h2>Quick Career Tips</h2>--%>
<%--                            <span>Found by employers communicate directly with hiring managers and recruiters.</span>--%>
<%--                        </div><!-- Heading -->--%>
<%--                        <div class="blog-sec">--%>
<%--                            <div class="row">--%>
<%--                                <div class="col-lg-4">--%>
<%--                                    <div class="my-blog">--%>
<%--                                        <div class="blog-thumb">--%>
<%--                                            <a href="#" title=""><img src="/style/user/images/resource/b1.jpg" alt="" /></a>--%>
<%--                                            <div class="blog-metas">--%>
<%--                                                <a href="#" title="">March 29, 2017</a>--%>
<%--                                                <a href="#" title="">0 Comments</a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="blog-details">--%>
<%--                                            <h3><a href="#" title="">Attract More Attention Sales And Profits</a></h3>--%>
<%--                                            <p>A job is a regular activity performed in exchange becoming an employee, volunteering, </p>--%>
<%--                                            <a href="#" title="">Read More <i class="la la-long-arrow-right"></i></a>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-lg-4">--%>
<%--                                    <div class="my-blog">--%>
<%--                                        <div class="blog-thumb">--%>
<%--                                            <a href="#" title=""><img src="/style/user/images/resource/b2.jpg" alt="" /></a>--%>
<%--                                            <div class="blog-metas">--%>
<%--                                                <a href="#" title="">March 29, 2017</a>--%>
<%--                                                <a href="#" title="">0 Comments</a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="blog-details">--%>
<%--                                            <h3><a href="#" title="">11 Tips to Help You Get New Clients</a></h3>--%>
<%--                                            <p>A job is a regular activity performed in exchange becoming an employee, volunteering, </p>--%>
<%--                                            <a href="#" title="">Read More <i class="la la-long-arrow-right"></i></a>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-lg-4">--%>
<%--                                    <div class="my-blog">--%>
<%--                                        <div class="blog-thumb">--%>
<%--                                            <a href="#" title=""><img src="/style/user/images/resource/b3.jpg" alt="" /></a>--%>
<%--                                            <div class="blog-metas">--%>
<%--                                                <a href="#" title="">March 29, 2017</a>--%>
<%--                                                <a href="#" title="">0 Comments</a>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="blog-details">--%>
<%--                                            <h3><a href="#" title="">An Overworked Newspaper Editor</a></h3>--%>
<%--                                            <p>A job is a regular activity performed in exchange becoming an employee, volunteering, </p>--%>
<%--                                            <a href="#" title="">Read More <i class="la la-long-arrow-right"></i></a>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </section>--%>

<%--    <section>--%>
<%--        <div class="block no-padding">--%>
<%--            <div class="container fluid">--%>
<%--                <div class="row">--%>
<%--                    <div class="col-lg-12">--%>
<%--                        <div class="simple-text">--%>
<%--                            <h3>Gat a question?</h3>--%>
<%--                            <span>We're here to help. Check out our FAQs, send us an email or call us at 1 (800) 555-5555</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </section>--%>
    <%@include file="/WEB-INF/templates/component/user/footer.jsp" %>

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