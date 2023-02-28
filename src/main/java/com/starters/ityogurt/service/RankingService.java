package com.starters.ityogurt.service;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public interface RankingService {

    List<Map<String,Object>> getMostSolvedQuiz();
    List<Map<String,Object>> getMostWrongQuiz();
    // List<Map<String,String>> getMostSelectedCategory();

}
