package com.starters.ityogurt.Interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;

public class MyPageInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
        Object handler) throws Exception {

        HttpSession httpSession = request.getSession();
        Integer userSeq = (Integer) httpSession.getAttribute("user_seq");
        String uri = request.getRequestURI();
        String[] uriSplit = uri.split("/");

        if(uriSplit[uriSplit.length-1].equals(userSeq.toString()))
        {
            return true;
        }
        else if(uriSplit[uriSplit.length-2].equals(userSeq.toString()))
        {
            return true;
        }

        response.sendRedirect("/error");
        return false;
    }
}
