package com.starters.ityogurt.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.starters.ityogurt.dto.LearnRecordDTO;

@Mapper
@Repository
public interface LearnRecordDAO {

	void updateLearnData(@Param("userChoice") int userChoice, @Param("isRight") int isRight,@Param("userSeq") int userSeq,@Param("quizSeq") int quizSeq);

	void learnData(@Param("userChoice") int userChoice, @Param("isRight") int isRight,@Param("userSeq") int userSeq,@Param("quizSeq") int quizSeq);

	List<LearnRecordDTO> getLearn(@Param("quizSeq1") int quizSeq1,@Param("quizSeq2") int quizSeq2,@Param("quizSeq3") int quizSeq3);

	void deleteLearnData(int userSeq);

	int getUserChoice(@Param("userSeq") int userSeq, @Param("quizSeq1") int quizSeq1, @Param("quizSeq2") int quizSeq2, @Param("quizSeq3") int quizSeq3);

	int deleteLearnDataByLearnSeq(int learnSeq);

	List<LearnRecordDTO> getLearnListByUser (int userSeq);

	public HashMap<String, Integer> findWeakCategoryByUser(int userSeq);
	
}
