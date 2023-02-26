package com.starters.ityogurt.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starters.ityogurt.dao.LearnRecordDAO;
import com.starters.ityogurt.dto.LearnRecordDTO;
import com.starters.ityogurt.service.LearnRecordService;

@Service("learnrecordservice")
public class LearnRecordServiceImpl implements LearnRecordService{

	@Autowired
	LearnRecordDAO dao;

	@Override
	public void updateLearnData(int userChoice, int isRight, int userSeq, int quizSeq) {
		dao.updateLearnData(userChoice, isRight, userSeq, quizSeq);
	}

	@Override
	public void learnData(int userChoice, int isRight, int userSeq, int quizSeq) {
		dao.learnData(userChoice, isRight, userSeq, quizSeq);
		
	}

	@Override
	public List<LearnRecordDTO> getLearn(int quizSeq1, int quizSeq2, int quizSeq3) {
		return dao.getLearn(quizSeq1, quizSeq2, quizSeq3);
	}

	@Override
	public void deleteLearnData(int userSeq) {
		dao.deleteLearnData(userSeq);
	}

	@Override
	public int getUserChoice(int userSeq, int quizSeq1, int quizSeq2, int quizSeq3) {
		return dao.getUserChoice(userSeq, quizSeq1, quizSeq2, quizSeq3);
	}

	
	

	

}
