package com.starters.ityogurt.Interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;

public class AuthAdminInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
        Object handler) throws Exception {

        HttpSession httpSession = request.getSession();
        Integer userSeq = (Integer) httpSession.getAttribute("user_seq");
        if (userSeq!= null && userSeq!= 1 && userSeq!=2) {
        	response.sendRedirect("/admin/page");
            return false;
        }
        return true;
    }
}
