<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<section>
    <div class="block no-padding">
        <div class="container fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="main-featured-sec">
                        <div class="new-slide">
                            <img src="/style/user/images/resource/vector-1.png">
                        </div>
                        <div class="job-search-sec">
                            <div class="job-search">
                                <h3>Tìm công việc của bạn</h3>
                                <span>Cách dễ nhất để tìm một công việc mơ ước trong vài phút</span>
                                    <div class="row">
                                        <div class="col-lg-7 col-md-5 col-sm-12 col-xs-12">
                                            <div class="job-field">
                                                <input type="text" placeholder="Tên job, từ khóa" name="keyword" value="${keyword}"/>
                                                <i class="la la-keyboard-o"></i>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-5 col-sm-12 col-xs-12">
                                            <div class="job-field " style="background-color: #ccc">
                                                   <select data-placeholder="City, province or region" name="address" class="chosen-city">
                                                       <option value="" selected >--Chọn địa điểm--</option>
                                                       <c:forEach items="${locations}" var="location">
                                                       <option value="${location}"  ${location == address ? 'selected' : ''}>${location}</option>
                                                       </c:forEach>
                                                   </select>
                                                <i class="la la-map-marker"></i>
                                            </div>
                                        </div>
                                        <div class="col-lg-1 col-md-2 col-sm-12 col-xs-12">
                                            <button type="submit" style="height: 61px;"><i class="la la-search"></i></button>
                                        </div>
                                    </div>
<%--                                <div class="or-browser">--%>
<%--                                    <span>Tìm kiếm phổ biến:</span>--%>
<%--                                    <a href="#" title="">PHP</a>--%>
<%--                                    <a href="#" title="">ASP.NET</a>--%>
<%--                                </div>--%>
                            </div>
                        </div>
                        <!-- <div class="scroll-to">
                            <a href="#scroll-here" title=""><i class="la la-arrow-down"></i></a>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
