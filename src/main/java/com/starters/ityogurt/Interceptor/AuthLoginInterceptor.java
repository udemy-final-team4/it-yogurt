package com.starters.ityogurt.Interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;

public class AuthLoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
        Object handler) throws Exception {

        HttpSession httpSession = request.getSession();
        Integer userSeq = (Integer) httpSession.getAttribute("user_seq");
        if (userSeq == null) {
            response.sendRedirect("/user");
            //logger.info("user is not login");
            return false;
        }
        return true;
    }
}
