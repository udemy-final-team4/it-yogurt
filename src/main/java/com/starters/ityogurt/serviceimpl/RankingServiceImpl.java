package com.starters.ityogurt.serviceimpl;

import com.starters.ityogurt.dao.RankingDAO;
import com.starters.ityogurt.service.RankingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("rankingservice")
public class RankingServiceImpl implements RankingService {

    @Autowired
    RankingDAO dao;

    @Override
    public List<Map<String, Object>> getMostSolvedQuiz() {
        return dao.getMostSolvedQuiz();
    }

    @Override
    public List<Map<String, Object>> getMostWrongQuiz() {
        return dao.getMostWrongQuiz();
    }
/*
    @Override
    public List<Map<String, String>> getMostSelectedCategory() {
        return null;
    }
 */
}
