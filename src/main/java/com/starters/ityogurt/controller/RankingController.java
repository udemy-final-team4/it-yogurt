package com.starters.ityogurt.controller;

import com.starters.ityogurt.dto.QuizDTO;
import com.starters.ityogurt.service.QuizService;
import com.starters.ityogurt.service.RankingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/ranking")
public class RankingController {

    @Autowired
    @Qualifier("rankingservice")
    RankingService rankingService;

    @GetMapping("/")
    public ModelAndView rankingPage() {
        ModelAndView mv = new ModelAndView();
        List<Map<String,Object>> solvedQuizList = rankingService.getMostSolvedQuiz();
        List<Map<String,Object>> wrongQuizList = rankingService.getMostWrongQuiz();

        mv.addObject("solvedQuizList", solvedQuizList);
        mv.addObject("wrongQuizList", wrongQuizList);
        mv.setViewName("ranking/home");

        return mv;
    }

}
