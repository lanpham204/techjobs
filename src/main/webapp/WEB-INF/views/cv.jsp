<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">
<!DOCTYPE html>
<html prefix="og: http://ogp.me/ns#" lang="en"> <head>
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, user-scalable=0">
    <meta name="description" content="Harold Kim - Yet another security enthusiast.">
    <meta name="keywords" content="stypr, Harold Kim">
    <meta name="google" content="notranslate">
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon-precomposed" href="favicon.ico">
    <title>harold.kim</title>
    <meta property="og:title" content="stypr.">
    <meta property="og:url" content="https://stypr.com/">
    <meta property="og:image" content="https://stypr.com/logo.png">
    <meta property="og:description" content="Harold Kim &mdash; Yet another security enthusiast.">
    <link href="./static/stypr.css" rel="stylesheet" type="text/css">
    <!--[if lt IE 9]><script src="./static/html5.js"></script><![endif]-->
    <style>
        /*
           d8
   d88~\ _d88__ Y88b  / 888-~88e  888-~\
  C888    888    Y888/  888  888b 888
   Y88b   888     Y8/   888  8888 888
    888D  888      Y    888  888P 888
  \_88P   "88_/   /     888-_88"  888
                _/      888

                   Copyright 2016 stypr.

*/

        @font-face {
            font-family: 'Raleway';
            src: local('Raleway'), url('./font/raleway-regular-webfont.eot');
            src: url('./font/raleway-regular-webfont.eot?#iefix') format('embedded-opentype'),
            url('./font/raleway-regular-webfont.woff2') format('woff2'),
            url('./font/raleway-regular-webfont.woff') format('woff'),
            url('./font/raleway-regular-webfont.ttf') format('truetype'),
            url('./font/raleway-regular-webfont.svg#ralewayregular') format('svg');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'Source Code Pro';
            src: local('Source Code Pro'), url('./font/sourcecodepro-regular-webfont.eot');
            src: url('./font/sourcecodepro-regular-webfont.eot?#iefix') format('embedded-opentype'),
            url('./font/sourcecodepro-regular-webfont.woff2') format('woff2'),
            url('./font/sourcecodepro-regular-webfont.woff') format('woff'),
            url('./font/sourcecodepro-regular-webfont.ttf') format('truetype'),
            url('./font/sourcecodepro-regular-webfont.svg#source_code_proregular') format('svg');
            font-weight: normal;
            font-style: normal;
        }

        * {
            font-family: "Raleway", sans-serif;
        }

        body,
        html {
            background-color:#eee;
            margin: 0;
            padding: 0;
        }

        a:link, a:visited {
            color: #999;
            text-decoration: none;
        }

        a:active,
        a:hover {
            color: #777;
        }

        header {
            background-color: #eee;
            width: 100%;
            height: 145px;
            padding-top: 30pt;
            text-align: center;
            margin-bottom: 10pt;
        }


        header a:link,
        header a:visited {
            color: #000;
            text-decoration: none;
        }

        header a:active,
        header a:hover {
            color: #777;
            text-decoration:underline;
        }

        header img {
            margin-bottom:-3pt;
            width:16px;
            image-rendering: auto;
        }

        header * {
            font-family: "Source Code Pro", monospace;
            letter-spacing: -1px;
        }

        header .name * {
            font-family: "Raleway";
            font-size: 30pt;
        }

        header .name .last {
            font-size: 30pt;
        }

        header .name .first {
            font-weight: 600;
        }

        header .job {
            font-size: 10pt;
        }

        header .info {
            font-size: 8pt;
            padding-top: 15pt;
            padding-left: 10pt;
            padding-right: 10pt;
        }

        @media (max-width:500px){
            header img{
                width: 14px;
            }
            header .info a{
                font-size: 7pt;
            }
        }

        header .neck {
            margin: 0 auto;
            background: url(./logo.png) no-repeat center center;
            width:32px; height:32px;
            background-size: cover;
            opacity:0.45;
            margin:5px 5px;
            bottom:0;
            right:0;
            position:fixed;
            image-rendering: auto;
        }

        .wrapper{
            width:100%;
            background-color:#fff;
        }

        .container {
            background-color: #fff;
            max-width: 1000px;
            margin: 0 auto;
            padding-top: 15px;
            padding-bottom: 30px;
        }

        .container hr {
            width: 10pt;
            border: 1px dotted #eee;
            margin-top: 20pt;
            margin-bottom: 20pt;
        }

        .container h1 {
            padding-left: 3pt;
            margin-bottom: 0pt;
            font-size: 20pt;
            font-weight: 600;
        }

        .container table {
            width: 100%;
            padding: 10pt;
        }

        .container table .title {
            font-weight: 500;
            font-size: 13pt;
        }

        .container table .duration {
            font-size: 11pt;
            font-weight: 300;
            text-align: right;
            font-style: italic;
        }

        .container table .description {
            font-size: 10pt;
            font-weight: 300;
        }

        .container .note {
            font-size: 11pt;
            padding-left: 10pt;
            font-weight: 300;
        }

        .container .achievement table .year {
            font-weight: 300;
            font-size: 11pt;
            padding-left: 20pt;
            width: 40px;
        }

        .container .achievement table .description {
            font-weight: 400;
            font-size: 11pt;
        }

        .container .skills .title {
            font-weight: 600;
            font-size: 11pt;
            width: 100px;
        }

        footer {
            background-color: #eee;
            text-align: center;
            font-size: 8pt;
            padding-top: 10px;
            padding-bottom:2pt;
            width: 100%;
            min-height: 10pt;
            margin-top: 5pt;
            margin-bottom:5pt;
        }

        .elapsed {
            font-size: 8pt;
        }

        .progress-container {
            width:100%;
            height:1em;
            position:relative;
            background-color:#f1f1f1;
            /*margin: 0px 10px; */
        }

        .progressbar {
            background-color:#757575;
            height:100%;
            position:absolute;
            line-height:inherit;
        }

        .progress-status {
            padding:0;
            margin:0;
            font-size:9pt;
            display:inline;
        }

        .right {
            float: right;
        }

        @media(max-width:800px){
            body{
                margin-left: 0;
                margin-right: 0;
            }
        }
    </style>
</head>
<body>
<header>
    <div class="name"><span class="first">${resume.fullname}</span></div>
    <div class="job">${resume.jobName}</div>
    <div class="info">
        <!-- Icons by W3C Creation Lab -->
        <a>Email: ${resume.email}</a>&thinsp; &middot;
        <a>Phone Number:  ${resume.phoneNumber}</a>&thinsp; &middot;
        <a>Address:  ${resume.address}</a>
    </div>
    <div class="neck"></div>
</header>
<div class="ram"></div>
<div class="wrapper">
    <div class="container">
        <div class="experience">
            <h1>Experience</h1>
            <c:forEach var = "experience" items="${resume.experiences}">
            <table>
                    <tr>
                        <td class="title">${experience.name}</td>
                        <td class="duration">${experience.start} - ${experience.end}</td>
                    </tr>
                    <tr>
                        <td colspan=2 class="description">
                            ${experience.description}
                        </td>
                    </tr>
            </table>
            </c:forEach>
        </div>
        <hr>
        <div class="experience">
            <h1>Project</h1>
            <c:forEach var = "project" items="${resume.projects}">
                <table>
                    <tr>
                        <td class="title">${project.name}</td>
                        <td class="duration">${project.start} - ${project.end}</td>
                    </tr>
                    <tr>
                        <td colspan=2 class="description">
                                ${project.description}
                        </td>
                    </tr>
                </table>
            </c:forEach>
        </div>
        <hr>
        <div class="education">
            <h1>Education</h1>
            <c:forEach var = "education" items="${resume.educations}">
                <table>
                    <!-- http://individual.utoronto.ca/stypr/ my university workspace. But there should be a way to get this URL from somewhere else. -->
                    <tr>
                        <td class="title">${education.name}</td>
                        <td class="duration">${education.start} - ${education.end}</td>
                    </tr>
                    <tr>
                        <td colspan=2 class="description">
                                ${education.description}
                        </td>
                    </tr>
                </table>

            </c:forEach>
        </div>
        <hr>
        <div class="achievement">
            <h1>Achievement/Awards</h1>
            <c:forEach var = "achievement" items="${resume.achievements}">
                <table>
                    <tr>
                        <td class="title">${achievement.name}</td>
                    </tr>
                    <tr>
                        <td colspan=2 class="description">
                                ${achievement.description}
                        </td>
                    </tr>
                </table>

            </c:forEach>
        </div>
        <hr>

    </div>
</div>

</body>
</html>

