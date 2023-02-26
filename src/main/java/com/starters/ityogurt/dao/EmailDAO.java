package com.starters.ityogurt.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface EmailDAO {
    List<String> getAllEmails();
    List<String> getSendEmailsSubJava();
    // KnowledgeDTO getSendDetail();

    void updateSendDate(int categorySeq);


    void getDetailBySub(String sub);

    void getEmailByUser(int userSeq);

    // 전체 조회 코드
    List<Map<String, Object>> getEmailAndSub();

    List<Map<String, Object>> getSendDetail(int count);

}
