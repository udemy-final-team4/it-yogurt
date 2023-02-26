package com.starters.ityogurt.service;

import java.util.List;

import com.starters.ityogurt.dto.LearnRecordDTO;

public interface LearnRecordService {

	void updateLearnData(int userChoice, int isRight, int userSeq, int quizSeq);

	void learnData(int userChoice, int isRight, int userSeq, int quizSeq);

	List<LearnRecordDTO> getLearn(int quizSeq1, int quizSeq2, int quizSeq3);

	void deleteLearnData(int userSeq);

	int getUserChoice(int userSeq, int quizSeq1, int quizSeq2, int quizSeq3);

}
