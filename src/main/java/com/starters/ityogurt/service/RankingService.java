package com.starters.ityogurt.service;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public interface RankingService {

    List<Map<String,String>> getMostSolvedQuiz();
    List<Map<String,String>> getMostWrongQuiz();
    List<Map<String,String>> getMostSelectedCategory();


}
