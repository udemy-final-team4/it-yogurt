package com.starters.ityogurt.controller;

import com.starters.ityogurt.dto.UserDTO;
import com.starters.ityogurt.oauth.OauthService;
import com.starters.ityogurt.oauth.SocialLoginType;
import com.starters.ityogurt.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OauthController {

    @Autowired
    OauthService oauthService;

    @Autowired
    @Qualifier("userservice")
    UserService userService;

    @GetMapping("/auth/{socialLoginType}")
    public void socialLoginType(
        @PathVariable(name = "socialLoginType") SocialLoginType socialLoginType,
        HttpServletResponse response) {
        oauthService.request(socialLoginType, response);
    }

    @GetMapping("/auth/{socialLoginType}/callback")
    public String callback(@PathVariable(name = "socialLoginType") SocialLoginType socialLoginType,
        @RequestParam(name = "code") String code, HttpServletRequest request) {

        String redirectPath = "redirect:/user/1";
        String email = oauthService.requestAccessToken(socialLoginType, code);
        HttpSession session = request.getSession();
        UserDTO user = userService.getUserByUserEmail(email);

        //로그인
        if(user != null)
        {
            session.setAttribute("user_seq", user.getUserSeq());
            userService.AfterLoginProcess(user, request.getSession());
            redirectPath = "redirect:/";

            if(session.getAttribute("knowSeq") != null)
            {
                String knowSeq = (String) session.getAttribute("knowSeq");
                session.removeAttribute("knowSeq");
                redirectPath = "redirect:/quiz/"+knowSeq;
            }
        }
        session.setAttribute("email", email);
        session.setAttribute("isSNS", "true");

        return redirectPath;
    }

}

