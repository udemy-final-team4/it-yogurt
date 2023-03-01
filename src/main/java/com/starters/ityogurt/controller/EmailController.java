
package com.starters.ityogurt.controller;

import java.util.*;

import com.starters.ityogurt.dto.CategoryDTO;
import com.starters.ityogurt.dto.KnowledgeDTO;
import com.starters.ityogurt.dto.UserDTO;
import com.starters.ityogurt.service.*;
import com.starters.ityogurt.serviceimpl.EmailServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class EmailController {

    @Autowired
    QuizService quizService;

    @Autowired
    KnowledgeService knowledgeService;

    @Autowired
    EmailService emailService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    UserService userService;

    @Value("${detail.path}")
    private String detailPath;

    @Value("${check.path}")
    private String checkPath;

    @Value("${live.domain}")
    private String liveDomain;

    private KnowledgeDTO knowledgeByCategorySeq;

    @RequestMapping("/aws/email")
    public String sendEmail() throws Exception {
        List<Map<String, Object>> subEmailMap = emailService.getEmailAndSub();

        int count = categoryService.countAllSub();

        List<Map<String, Object>> sendDetailMap = emailService.getSendDetail(count);
        Map<String, String> userMap = new HashMap<String, String>();
        Map<String, Integer> categoryMap = new HashMap<String, Integer>();
        List<Object> updateCategorySeqList = new ArrayList<Object>();
        Map<String, Object> subEmailList = new HashMap<String, Object>();

        for(Map<String, Object> data : sendDetailMap){
            categoryMap.put((String) data.get("sub"), (Integer) data.get("category_seq"));
        }

        for(Map<String, Object> data : subEmailMap){
            userMap.put((String) data.get("email"), (String) data.get("sub"));
        }

        categoryMap.forEach((key, value) -> {
            List emailCollectionList = new ArrayList<Object>();

            userMap.forEach((userKey, userValue) -> {
                if(key.equals(userValue)) {
                    emailCollectionList.add(userKey);
                }
            });
            subEmailList.put(key, emailCollectionList);
        });

        categoryMap.forEach((key, value) -> {
            emailService.updateSendDate(value);
            KnowledgeDTO knowledgeDTO = knowledgeService.getKnowledgeByCategorySeq(value);
            emailService.send("오늘의 지식은 " + knowledgeDTO.getTitle() + "이야!",
                    headerText() + knowledgeDTO.getContent() + buttonText(knowledgeDTO.getKnowSeq()) + footerText(),
                    (List<String>) subEmailList.get(key));
            emailService.updateSendDate(value);
        });

        return "redirect:../admin/page";
    }
    public String headerText() {
        String headerText = "<div style=\"text-align : center;\">\n" +
                "  <h1>IT-Yogurt!</h1>\n" +
                "  </div>" +
                "  <br><br><hr><br><br>";
        return headerText;
    }

    public String buttonText(@RequestParam(value = "knowSeq")int knowSeq) {
        String buttonText = null;
        if (quizService.getQuiz(knowSeq).size() == 0) {
            buttonText = "<div style=\"text-align: center;\"><br>\n" +
                    "       <a href='"+liveDomain+detailPath+knowSeq+"'>\n" +
                    "               <button class=\"btn\" style=\"width: 250px; background-color: #86b7fe; padding: 15px 30px;\n" +
                    "                border-radius: 5px; color:white; font-size: 18px; font-weight: bold; cursor: pointer;\" >웹사이트에서 보기!</button>\n" +
                    "       </a><br><br>\n" +
                    "</div>";
        } else {
            buttonText = "<div style=\"text-align: center;\"><br>\n" +
                    "       <a href='"+liveDomain+checkPath+knowSeq+"'>\n" +
                    "               <button class=\"btn\" style=\"width: 250px; background-color: #86b7fe; padding: 15px 30px;\n" +
                    "                border-radius: 5px; color:white; font-size: 18px; font-weight: bold; cursor: pointer;\" >문제 풀기!</button>\n" +
                    "       </a><br><br>\n" +
                    "</div>";
        }
        return buttonText;
    }

    public String footerText() {
        String footerText =
                "<div class=\"footer\" style=\"text-align : center; background-color: #2C3E50\">\n" +
                "    <div class=\"info\" style=\"color:white;\"><br>\n" +
                "        ItYogurt / 대표: 김민지<br>\n" +
                "        서울특별시 용산구 용산동2가 1 - 34<br><br>\n" +
                "    </div>\n" +
                "    <div style=\"color:white;\">\n" +
                "        <a class=\"btn\" style=\"color:snow; text-decoration: none;\" href=\"https://twitter.com/eat_it_yogurt\">twitter</a>\n" +
                "        &nbsp;|&nbsp;\n" +
                "        <a class=\"btn\" style=\"color:snow; text-decoration: none;\" href=\"https://www.instagram.com/eat_it_yogurt/\">instagram</a>\n" +
                "        <br><br>\n" +
                "    </div>\n" +
                "</div>";
        return footerText;
    }

}


