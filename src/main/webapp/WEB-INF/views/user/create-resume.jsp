<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Resume Form</title>
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
<div class="theme-layout" id="scrollup">

    <%@include file="/WEB-INF/templates/component/user/header.jsp" %>
    <section class="mt-3 mb-3">
        <div class="block remove-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-6">
                        <form:form action="/exportPDF"  method="get" modelAttribute="resume">
                        <span class="pf-title text-left" >Full Name:</span>
                        <div class="pf-field">
                            <form:input type="text" path="fullname" id="fullname"/><br/>
                        </div>

                        <span class="pf-title text-left" for="email">Email:</span>
                        <div class="pf-field">
                            <form:input path="email" id="email"/><br/>
                        </div>

                        <span class="pf-title text-left" for="phoneNumber">Phone Number:</span>
                        <div class="pf-field">
                            <form:input path="phoneNumber" id="phoneNumber"/><br/>
                        </div>
                    </div>
                    <div class="col-6">
                        <span class="pf-title text-left" for="jobName">Job Name:</span>
                        <div class="pf-field">
                            <form:input path="jobName" id="jobName"/><br/>
                        </div>

                        <span class="pf-title text-left" for="address">Address:</span>
                        <div class="pf-field">
                            <form:input path="address" id="address"/><br/>
                        </div>
                        <span class="pf-title text-left" for="address">Skill:</span>
                        <div class="">
                            <form:textarea path="skill"  id="skill"  rows="3"  style="width:100%;height:200px;"/><br/>
                        </div>
                    </div>
                </div>
                <h3>Educations</h3>
                <c:forEach items="${resume.educations}" var="education" varStatus="status">
                    <h5>Education ${status.index+1}</h5>
                    <div class="row">
                        <div class="col-6">
                            <span class="pf-title text-left" for="educations[${status.index}].name">Name:</span>
                            <div class="pf-field">
                                <form:input path="educations[${status.index}].name" id="educations[${status.index}].name"/><br/>
                            </div>

                            <span class="pf-title text-left" for="educations[${status.index}].description">Description:</span>
                            <div class="pf-field">
                                <form:textarea path="educations[${status.index}].description" id="descEdu${status.index}"  rows="3"  style="width:100%;height:200px;"/><br/>
                            </div>
                        </div>
                        <div class="col-6">
                            <span class="pf-title text-left" for="educations[${status.index}].start">Start:</span>
                            <div class="pf-field">
                                <form:input path="educations[${status.index}].start" id="educations[${status.index}].start"/><br/>
                            </div>

                            <span class="pf-title text-left" for="educations[${status.index}].end">End:</span>
                            <div class="pf-field">
                                <form:input path="educations[${status.index}].end" id="educations[${status.index}].end"/><br/>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <!-- Experience List -->
                <h3>Experiences</h3>
                <c:forEach items="${resume.experiences}" var="experience" varStatus="status">
                    <h5>Experience ${status.index+1}</h5>
                    <div class="row">
                        <div class="col-6">
                            <span class="pf-title text-left" for="experiences[${status.index}].name">Name:</span>
                            <div class="pf-field">
                                <form:input path="experiences[${status.index}].name" id="experiences[${status.index}].name"/><br/>
                            </div>

                            <span class="pf-title text-left" for="experiences[${status.index}].description">Description:</span>
                            <div class="pf-field">
                                <form:textarea path="experiences[${status.index}].description"  id="descExp${status.index}"  rows="3"  style="width:100%;height:200px;"/><br/>
                            </div>
                        </div>
                        <div class="col-6">
                            <span class="pf-title text-left" for="experiences[${status.index}].start">Start:</span>
                            <div class="pf-field">
                                <form:input path="experiences[${status.index}].start" id="experiences[${status.index}].start"/><br/>
                            </div>

                            <span class="pf-title text-left" for="experiences[${status.index}].end">End:</span>
                            <div class="pf-field">
                                <form:input path="experiences[${status.index}].end" id="experiences[${status.index}].end"/><br/>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <!-- Project List -->
                <h3>Projects</h3>
                <c:forEach items="${resume.projects}" var="project" varStatus="status">
                    <h5>Project ${status.index+1}</h5>
                    <div class="row">
                        <div class="col-6">
                            <span class="pf-title text-left" for="projects[${status.index}].name">Name:</span>
                            <div class="pf-field">
                                <form:input path="projects[${status.index}].name" id="projects[${status.index}].name"/><br/>
                            </div>

                            <span class="pf-title text-left" for="projects[${status.index}].description">Description:</span>
                            <div class="pf-field">
                                <form:textarea path="projects[${status.index}].description"  id="descPro${status.index}"  rows="3"  style="width:100%;height:200px;"/><br/>
                            </div>
                        </div>
                        <div class="col-6">
                            <span class="pf-title text-left" for="projects[${status.index}].start">Start:</span>
                            <div class="pf-field">
                                <form:input path="projects[${status.index}].start" id="projects[${status.index}].start"/><br/>
                            </div>

                            <span class="pf-title text-left" for="projects[${status.index}].end">End:</span>
                            <div class="pf-field">
                                <form:input path="projects[${status.index}].end" id="projects[${status.index}].end"/><br/>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <h3>Achievements</h3>
                <c:forEach items="${resume.achievements}" var="achievement" varStatus="status">
                    <h5>Achievement ${status.index+1}</h5>
                    <div>
                        <span class="pf-title text-left" for="achievements[${status.index}].name">Name:</span>
                        <div class="pf-field">
                            <form:input path="achievements[${status.index}].name" id="achievements[${status.index}].name"/><br/>
                        </div>

                        <span class="pf-title text-left" for="achievements[${status.index}].description">Description:</span>
                        <div class="pf-field">
                            <form:textarea path="achievements[${status.index}].description" id="achievements[${status.index}].description"/><br/>
                        </div>
                    </div>
                </c:forEach>
                <button type="submit" class="btn btn-primary">Submit</button>
                </form:form>


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
<script type="text/javascript" src="http://js.nicedit.com/nicEdit-latest.js"></script>
<script type="text/javascript">
    bkLib.onDomLoaded(function() {
        new nicEditor({maxHeight : 200}).panelInstance('skill');
    });
    bkLib.onDomLoaded(function() {
        new nicEditor({maxHeight : 200}).panelInstance('descEdu0');
    });
    bkLib.onDomLoaded(function() {
        new nicEditor({maxHeight : 200}).panelInstance('descEdu1');
    });
    bkLib.onDomLoaded(function() {
        new nicEditor({maxHeight : 200}).panelInstance('descExp0');
    });
    bkLib.onDomLoaded(function() {
        new nicEditor({maxHeight : 200}).panelInstance('descExp1');
    });
    bkLib.onDomLoaded(function() {
        new nicEditor({maxHeight : 200}).panelInstance('descPro0');
    });
    bkLib.onDomLoaded(function() {
        new nicEditor({maxHeight : 200}).panelInstance('descPro1');
    });


</script>
</body>

</html>
