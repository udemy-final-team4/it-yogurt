package com.starters.ityogurt.config;

import java.util.*;

import com.starters.ityogurt.dto.KnowledgeDTO;
import com.starters.ityogurt.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@Configuration
public class EmailConfig {

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

    @Value("${live.ip}")
    private String liveIp;

    //이메일 전송 API
    // @RequestMapping("/aws/email")
    @Scheduled(cron = "0 30 7 * * ?", zone = "Asia/Seoul")
    public String sendEmail() throws Exception {
        List<Map<String, Object>> subEmailMap = emailService.getEmailAndSub();
        System.out.println("subEmailMap : " + subEmailMap);

        int count = categoryService.countAllSub();

        List<Map<String, Object>> sendDetailMap = emailService.getSendDetail(count);
        System.out.println("sendDetailMap : " + sendDetailMap);
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

        System.out.println("userMap : " + userMap);
        System.out.println("categoryMap : " + categoryMap);

        categoryMap.forEach((key, value) -> {
            KnowledgeDTO knowledgeDTO = knowledgeService.getKnowledgeByCategorySeq(value);
            emailService.send("오늘의 지식은 " + knowledgeDTO.getTitle() + "이야!",
                    headerText() + knowledgeDTO.getContent() + buttonText(knowledgeDTO.getKnowSeq()) + footerText(),
                    (List<String>) subEmailList.get(key));
            emailService.updateSendDate(value);
        });
        return "true";
    }

    // 나중에 탄력적 ip로 img 주소 변경
    public String headerText() {
        String headerText = "<div style=\"text-align : center;\">\n" +
                "  <h1>IT-Yogurt!</h1>\n" +
                // "  <img style=\"width:300px; height: 300px; \"  src=\"/static/image/yogurt.jpg\">\n" +
                "  </div>" +
                "  <br><br><hr><br><br>";
        return headerText;
    }

    public String buttonText(@RequestParam(value = "knowSeq")int knowSeq) {
        String buttonText = null;
        if (quizService.getQuiz(knowSeq).size() == 0) {
            buttonText = "<div style=\"text-align: center;\"><br>\n" +
                    "       <a href='http://localhost:8818"+detailPath+knowSeq+"'>\n" +
                    "               <button class=\"btn\" style=\"width: 250px; background-color: #86b7fe; padding: 15px 30px;\n" +
                    "                border-radius: 5px; color:white; font-size: 18px; font-weight: bold; cursor: pointer;\" >웹사이트에서 보기!</button>\n" +
                    "       </a><br>\n" +
                    "</div>";
        } else {
            buttonText = "<div style=\"text-align: center;\"><br>\n" +
                    "       <a href='http://localhost:8818"+checkPath+knowSeq+"'>\n" +
                    "               <button class=\"btn\" style=\"width: 250px; background-color: #86b7fe; padding: 15px 30px;\n" +
                    "                border-radius: 5px; color:white; font-size: 18px; font-weight: bold; cursor: pointer;\" >문제 풀기!</button>\n" +
                    "       </a><br>\n" +
                    "</div>";
        }
        return buttonText;
    }

    public String footerText() {
        String footerText = "<div class=\"footer\" style=\"text-align : center; background-color: #F9F2ED\">\n" +
                "  <div class=\"info\" ><br>\n" +
                "    ItYogurt / 대표: 김민지<br>\n" +
                "    서울특별시 용산구 용산동2가 1 - 34<br><br><br><br>\n" +
                "  </div>\n" +
                "</div>";
        return footerText;
    }
}

