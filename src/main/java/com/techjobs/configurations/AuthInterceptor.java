package com.techjobs.configurations;

import com.techjobs.models.User;
import com.techjobs.services.UserService;
import com.techjobs.utils.CookieUtil;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
@Service
@RequiredArgsConstructor
public class AuthInterceptor implements HandlerInterceptor {
    private final CookieUtil cookieUtil;
    private final UserService userService;
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        String uri = request.getRequestURI();
        int userId = cookieUtil.get("id") != null? Integer.parseInt(cookieUtil.get("id").getValue()) :0;
        try {
            User user = userService.getById(userId);
            String error = "";
            if(userId == 0) {
                error = "Please Login";
            } else if(user.getRole().getId() == 2 && uri.startsWith("/admin/")) {
                error = "Access Denied!";
            }
            if(error.length() >0) {
                response.sendRedirect("/login?error="+error);
                return false;
            }
        } catch (Exception e) {
            response.sendRedirect("/login?error="+"Please Login");
            return false;
        }
        return true;
    }
}
