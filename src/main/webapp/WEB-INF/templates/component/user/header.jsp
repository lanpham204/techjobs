<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<div class="responsive-header">
    <div class="responsive-menubar">
        <div class="res-logo"><a href="index.html" title=""><img src="images/resource/logo.png" alt="" /></a></div>
        <div class="menu-resaction">
            <div class="res-openmenu">
                <img src="images/icon.png" alt="" /> Menu
            </div>
            <div class="res-closemenu">
                <img src="images/icon2.png" alt="" /> Close
            </div>
        </div>
    </div>
    <div class="responsive-opensec">
        <div class="btn-extars">
            <a href="/create-resume" title="" class="post-job-btn"><i class="la la-plus"></i>Tạo CV</a>
            <ul class="account-btns">
                <li class="signup-popup"><a title=""><i class="la la-key"></i> Đăng Ký</a></li>
                <li class="signin-popup"><a title=""><i class="la la-external-link-square"></i> Đăng Nhập</a></li>
            </ul>
        </div><!-- Btn Extras -->
        <form class="res-search">
            <input type="text" placeholder="Job title, keywords or company name" />
            <button type="submit"><i class="la la-search"></i></button>
        </form>
        <div class="responsivemenu">
            <ul>
                <li>
                    <a href="/home" title=""><s:message code="lo.mn.home"/></a>
                </li>
                <li>
                    <a href="/jobs" title=""><s:message code="lo.mn.job"/></a>
                </li>
            </ul>
        </div>
    </div>
</div>
<header class="stick-top forsticky alsticky">
    <div class="menu-sec">
        <div class="container">
            <div class="logo">
                <a href="/home" title=""><img class="hidesticky" src="/style/user/images/resource/logo.png" alt="" /><img class="showsticky" src="images/resource/logo10.png" alt="" /></a>
            </div><!-- Logo -->
            <div class="btn-extars">
                <a href="/create-resume" title="" class="post-job-btn"><i class="la la-plus"></i><s:message code="lo.mn.create-cv"/></a>
                <ul class="account-btns">
                        <c:choose>

                            <c:when test = "${not empty cookie['fullname'].value}">
                                <li class=""><a href="/users/applied-jobs/${cookie['id'].value}" title="">${cookie['fullname'].value}</a></li>
                                <li class=""><a href="/logout" title=""><s:message code="lo.mn.logout"/></a></li>
                            </c:when>

                            <c:otherwise>
                                <li class=""><a href="/register"><i class="la la-key"></i> <s:message code="lo.mn.register"/></a></li>
                                <li class=""><a href="/login" title=""><i class="la la-external-link-square"></i><s:message code="lo.mn.login"/></a></li>
                            </c:otherwise>

                        </c:choose>
                    <li class=""><a href="?lang=vi">Tiếng việt</a></li>
                    <li class=""> <a href="?lang=en">English</a></li>

                <%--                    <li class=""><a href="" title="">${cookie['fullname'].value}</a></li>--%>

                </ul>
            </div><!-- Btn Extras -->
            <nav>
                <ul>
                    <li>
                        <a href="/home" title=""><s:message code="lo.mn.home"/></a>
                    </li>
                    <li>
                        <a href="/jobs" title=""><s:message code="lo.mn.job"/></a>
                    </li>

                </ul>
            </nav><!-- Menus -->
        </div>
    </div>
</header>
