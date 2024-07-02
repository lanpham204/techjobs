package com.techjobs.utils;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Service
public class CookieUtil {
    private HttpServletRequest getCurrentRequest() {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return attributes != null ? attributes.getRequest() : null;
    }

    private HttpServletResponse getCurrentResponse() {
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return attributes != null ? attributes.getResponse() : null;
    }

    public void create(String name, String value, int days) throws UnsupportedEncodingException {
        HttpServletResponse response = getCurrentResponse();
        if (response != null) {
            Cookie cookie = new Cookie(name, value);
            cookie.setMaxAge(days * 60 * 60 * 24); // Max age in seconds
            cookie.setPath("/");
            response.addCookie(cookie);
        }
    }

    public Cookie get(String name) {
        HttpServletRequest request = getCurrentRequest();
        if (request != null) {
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equalsIgnoreCase(name)) {
                        return cookie;
                    }
                }
            }
        }
        return null;
    }
    public void deleteCookie(String name) {
        HttpServletResponse response = getCurrentResponse();
        Cookie cookie = new Cookie(name, null);
        cookie.setPath("/");
        cookie.setMaxAge(0);
        response.addCookie(cookie);
    }
}
