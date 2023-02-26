package com.starters.ityogurt.serviceimpl;

import com.starters.ityogurt.service.RankingService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("rankingservice")
public class RankingServiceImpl implements RankingService {
    @Override
    public List<Map<String, String>> getMostSolvedQuiz() {
        return null;
    }

    @Override
    public List<Map<String, String>> getMostWrongQuiz() {
        return null;
    }

    @Override
    public List<Map<String, String>> getMostSelectedCategory() {
        return null;
    }
}
