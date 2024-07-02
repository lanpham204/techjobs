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
    <form action="/jobs" method="get">
    <%@include file="/WEB-INF/templates/component/user/searchbox.jsp" %>
    <section>

        <div class="block no-padding">
            <div class="container">
                <div class="row no-gape">
                    <aside class="col-lg-3 column border-right">

                        <div class="widget">
                            <h3 class="sb-title open">Hợp đồng</h3>
                            <div class="type_widget">
                                <p class="flchek">
                                    <input type="radio" name="contract" id="33rr" value="Freelance" ${contract.contains('Freelance') ? 'checked' : ''}>
                                    <label for="33rr">Freelance</label>
                                </p>
                                <p class="ftchek">
                                    <input type="radio" name="contract" id="dsfs" value="Full-Time" ${contract.contains('Full-Time') ? 'checked' : ''}>
                                    <label for="dsfs">Full-Time</label>
                                </p>
                                <p class="ischek">
                                    <input type="radio" name="contract" id="sddr" value="Part-Time" ${contract.contains('Part-Time') ? 'checked' : ''}>
                                    <label for="sddr">Part-Time</label>
                                </p>
                            </div>
                        </div>
                        <div class="widget">
                            <h3 class="sb-title open">Cấp bậc</h3>
                            <div class="type_widget">
                                <p class="flchek">
                                    <input type="radio" name="type" id="33r" value="Intern" ${type.contains('Intern') ? 'checked' : ''}>
                                    <label for="33r">Intern</label>
                                </p>
                                <p class="ftchek">
                                    <input type="radio" name="type" id="dsf" value="Fresher" ${type.contains('Fresher') ? 'checked' : ''}>
                                    <label for="dsf">Fresher</label>
                                </p>
                                <p class="ischek">
                                    <input type="radio" name="type" id="sdd" value="Junior" ${type.contains('Junior') ? 'checked' : ''}>
                                    <label for="sdd">Junior</label>
                                </p>
                                <p class="ptchek">
                                    <input type="radio" name="type" id="sadde" value="Middle" ${type.contains('Middle') ? 'checked' : ''}>
                                    <label for="sadde">Middle</label>
                                </p>
                                <p class="ptchek">
                                    <input type="radio" name="type" id="sadd" value="Senior" ${type.contains('Senior') ? 'checked' : ''}>
                                    <label for="sadd">Senior</label>
                                </p>
                                <p class="tpchek">
                                    <input type="radio" name="type" id="assa" value="Trưởng nhóm" ${type.contains('Trưởng nhóm') ? 'checked' : ''}>
                                    <label for="assa">Trưởng nhóm</label>
                                </p>
                                <p class="vtchek">
                                    <input type="radio" name="type" id="ghgf" value="Trưởng phòng" ${type.contains('Trưởng phòng') ? 'checked' : ''}>
                                    <label for="ghgf">Trưởng phòng</label>
                                </p>
                            </div>
                        </div>
                        <div class="widget">
                            <h3 class="sb-title open">Mức lương</h3>
                            <div class="specialism_widget">
                                        <div class="price-input-container">
                                            <div class="price-input">
                                                <div class="price-field">
                                                    <span>Từ</span>
                                                    <input type="number" class="min-input"
                                                           name="salaryMin"
                                                           id="salaryMin" value="${salaryMin}">
                                                </div>
                                                <div class="price-field">
                                                    <span>Đến</span>
                                                    <input type="number"
                                                           class="max-input"
                                                           name="salaryMax"
                                                           value="${salaryMax}">
                                                </div>
                                            </div>
                                            <div class="slider-container">
                                                <div class="price-slider">
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Slider -->
                                        <div class="range-input">
                                            <input type="range"
                                                   class="min-range"
                                                   min="0"
                                                   max="100000000"
                                                   value="${salaryMin}"
                                                   step="1">
                                            <input type="range"
                                                   class="max-range"
                                                   min="0"
                                                   max="100000000"
                                                   value="${salaryMax}"
                                                   step="1">
                                        </div>

                            </div>
                        </div>
                    </aside>

                    <div class="col-lg-9 column">
                        <div class="modrn-joblist np">
                            <div class="filterbar">
                                <div class="sortby-sec">
                                    <span>Sắp xếp theo lương</span>
                                    <select class="form-control" name="sort" >
                                        <option  value="" >--Sắp xếp--</option>
                                        <option  value="asc" ${sort == "asc" ? "selected": ""} >Tăng dần</option>
                                        <option value="desc"  ${sort == "desc" ? "selected": ""} >Giảm dần</option>
                                    </select>
                                </div>
                            </div>
                        </div><!-- MOdern Job LIst -->
                        <div class="job-list-modern">
                            <div class="job-listings-sec no-border">
                                <c:forEach var = "job" items="${jobs}">
                                    <a href="" title="">
                                        <div class="job-listings-sec__item">
                                            <div class="job-listing wtabs" style="height: 132px;">
                                                <div class="job-title-sec">
                                                    <div class="c-logo"> <img src="/uploads/${job.company.images}" alt="" /> </div>
                                                    <h3><a href="/jobs/${job.id}" title="">${job.name}</a></h3>
                                                    <span>${job.company.name}</span> <br>
                                                    <span class="job-lctn"><i class="la la-map-marker"></i>${job.address} (${job.contract})</span><br>
                                                    <span><i class="las la-wallet"></i><fmt:formatNumber value="${job.salaryMin}" type="number" />
                                                    triệu - <fmt:formatNumber value="${job.salaryMax}" type="number" /> triệu  -${job.type}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </c:forEach>

                            </div>
                        </div>
                        <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">

                        <div class="pagination">
                            <ul>
                                <c:if test="${currentPage > 0}">
                                    <li class="prev"><a href="/jobs?page=${currentPage - 1}"><i class="la la-long-arrow-left"></i> Trước</a></li>
                                </c:if>
                                <c:if test="${totalPages > 0}">
                                    <c:forEach var="i" begin="0" end="${totalPages - 1}">
                                        <li class="${i == currentPage ? 'active' : ''}">
                                            <a href="/jobs?page=${i}&keyword=${keyword}&address=${address}&type=${type}&contract=${contract}&salaryMin=${salaryMin}&salaryMax=${salaryMax}&sort=${sort}">${i + 1}</a>
                                        </li>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${currentPage < totalPages - 1}">
                                    <li class="next"><a href="/jobs?page=${currentPage+1}&keyword=${keyword}&address=${address}&type=${type}&contract=${contract}&salaryMin=${salaryMin}&salaryMax=${salaryMax}&sort=${sort}">Tiếp <i class="la la-long-arrow-right"></i></a></li>
                                </c:if>
<%--                                <li><span class="delimeter">...</span></li>--%>

                            </ul>
                        </div><!-- Pagination -->
                    </div>
                </div>
            </div>
        </div>

    </section>
    </form>

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
<script>
    const rangevalue =
        document.querySelector(".slider-container .price-slider");
    const rangeInputvalue =
        document.querySelectorAll(".range-input input");

    // Set the price gap
    let priceGap = 0;

    // Adding event listners to price input elements
    const priceInputvalue =
        document.querySelectorAll(".price-input input");
    for (let i = 0; i < priceInputvalue.length; i++) {
        priceInputvalue[i].addEventListener("input", e => {

            // Parse min and max values of the range input
            let minp = parseInt(priceInputvalue[0].value);
            let maxp = parseInt(priceInputvalue[1].value);
            let diff = maxp - minp

            if (minp < 0) {
                alert("minimum price cannot be less than 0");
                priceInputvalue[0].value = 0;
                minp = 0;
            }

            // Validate the input values
            if (maxp > 100000000) {
                alert("maximum price cannot be greater than 10000");
                priceInputvalue[1].value = 10000;
                maxp = 10000;
            }

            if (minp > maxp - priceGap) {
                priceInputvalue[0].value = maxp - priceGap;
                minp = maxp - priceGap;

                if (minp < 0) {
                    priceInputvalue[0].value = 0;
                    minp = 0;
                }
            }

            // Check if the price gap is met
            // and max price is within the range
            if (diff >= priceGap && maxp <= rangeInputvalue[1].max) {
                if (e.target.className === "min-input") {
                    rangeInputvalue[0].value = minp;
                    let value1 = rangeInputvalue[0].max;
                    rangevalue.style.left = `${(minp / value1) * 100}%`;
                }
                else {
                    rangeInputvalue[1].value = maxp;
                    let value2 = rangeInputvalue[1].max;
                    rangevalue.style.right =
                        `${100 - (maxp / value2) * 100}%`;
                }
            }
        });

        // Add event listeners to range input elements
        for (let i = 0; i < rangeInputvalue.length; i++) {
            rangeInputvalue[i].addEventListener("input", e => {
                let minVal =
                    parseInt(rangeInputvalue[0].value);
                let maxVal =
                    parseInt(rangeInputvalue[1].value);

                let diff = maxVal - minVal

                // Check if the price gap is exceeded
                if (diff < priceGap) {

                    // Check if the input is the min range input
                    if (e.target.className === "min-range") {
                        rangeInputvalue[0].value = maxVal - priceGap;
                    }
                    else {
                        rangeInputvalue[1].value = minVal + priceGap;
                    }
                }
                else {

                    // Update price inputs and range progress
                    priceInputvalue[0].value = minVal;
                    priceInputvalue[1].value = maxVal;
                    rangevalue.style.left =
                        `${(minVal / rangeInputvalue[0].max) * 100}%`;
                    rangevalue.style.right =
                        `${100 - (maxVal / rangeInputvalue[1].max) * 100}%`;
                }
            });
        }
    }
</script>
</body>
</html>