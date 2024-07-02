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
    <section>
        <div class="block no-padding  gray">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="inner2">
                            <div class="inner-title2 text-center">
                                <h3 class=" mt-2">Đăng nhập</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section>
        <div class="block remove-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="account-popup-area signin-popup-box static">
                            <div class="account-popup">
                                <form action="/login" method="post">
                                    <p class="text-danger">${message}</p>
                                    <p class="text-danger">${param.error}</p>
                                    <div class="cfield">
                                        <input type="email" placeholder="Email" name="email" value="${cookie['email'].value}" />
                                        <i class="la la-envelope-o"></i>
                                    </div>
                                    <div class="cfield">
                                        <input type="password" placeholder="********" name="password"/>
                                        <i class="la la-key"></i>
                                    </div>
                                    <p class="remember-label">
                                        <input type="checkbox" name="rememberMe" id="cb1"><label for="cb1">Remember me</label>
                                    </p>
                                    <a href="#" title="">Quên mật khẩu?</a>
                                    <button type="submit">Đăng nhập</button>
                                </form>
                            </div>
                        </div><!-- LOGIN POPUP -->
                    </div>
                </div>
            </div>
        </div>
    </section>
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