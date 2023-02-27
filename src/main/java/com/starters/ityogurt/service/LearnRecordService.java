package com.starters.ityogurt.service;

import java.util.HashMap;
import java.util.List;

import com.starters.ityogurt.dto.LearnRecordDTO;

public interface LearnRecordService {

	void updateLearnData(int userChoice, int isRight, int userSeq, int quizSeq);

	void learnData(int userChoice, int isRight, int userSeq, int quizSeq);

	List<LearnRecordDTO> getLearn(int quizSeq1, int quizSeq2, int quizSeq3);

	void deleteLearnData(int userSeq);

	int getUserChoice(int userSeq, int quizSeq1, int quizSeq2, int quizSeq3);

	List<LearnRecordDTO> getLearnListByUser(int userSeq);

	/*학습 기록에서 유저가 가장 많이 틀린 분야의 문제 찾아오기*/
	public HashMap<String, Integer> findWeakCategoryByUser(int userSeq);
}
