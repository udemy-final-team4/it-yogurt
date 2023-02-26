package com.starters.ityogurt.controller;

import com.starters.ityogurt.service.RankingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
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

//    @GetMapping("/")
//    public String rankingPage() {
//        return "ranking/home";
//    }

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

    @GetMapping("/top")
    public ModelAndView getTopRanking() {
        return null;
    }

    @GetMapping("/top/wrong")
    public ModelAndView getTopRankingByWrongRate() {
        return null;
    }


    @GetMapping("/top/category")
    public ModelAndView getTopRankingByCategory() {
        return null;
    }



}
