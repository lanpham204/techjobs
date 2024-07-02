<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<aside class="col-lg-3 column border-right">
    <div class="widget">
        <div class="tree_widget-sec">
            <ul>
                <li><a href="/users/profile/${cookie['id'].value}" title=""><i class="la la-file-text"></i>My Profile</a></li>
                <li><a href="candidates_my_resume.html" title=""><i class="la la-briefcase"></i>My Resume</a></li>
                <li><a href="candidates_shortlist.html" title=""><i class="la la-money"></i>Shorlisted Job</a></li>
                <li><a href="/users/applied-jobs/${cookie['id'].value}" title=""><i class="la la-paper-plane"></i>Applied Job</a></li>
                <li><a href="candidates_job_alert.html" title=""><i class="la la-user"></i>Job Alerts</a></li>
                <li><a href="candidates_cv_cover_letter.html" title=""><i class="la la-file-text"></i>Cv & Cover Letter</a></li>
                <li><a href="/users/change-password/${cookie['id'].value}" title=""><i class="la la-flash"></i>Change Password</a></li>
                <li><a href="#" title=""><i class="la la-unlink"></i>Logout</a></li>
            </ul>
        </div>
    </div>
</aside>