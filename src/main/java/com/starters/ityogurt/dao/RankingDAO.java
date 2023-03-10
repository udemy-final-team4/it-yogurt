package com.starters.ityogurt.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface RankingDAO {

    List<Map<String, Object>> getMostSolvedQuiz();
    List<Map<String, Object>> getMostWrongQuiz();
}
