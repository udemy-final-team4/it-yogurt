package com.starters.ityogurt.serviceimpl;

import com.starters.ityogurt.dao.KnowledgeDAO;
import com.starters.ityogurt.dao.LearnRecordQuizDAO;
import com.starters.ityogurt.dto.LearnRecordQuizDTO;
import com.starters.ityogurt.service.LearnRecordQuizService;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("recodequizservice")
public class LearnRecordQuizServiceImpl implements LearnRecordQuizService {
	@Autowired
	LearnRecordQuizDAO dao;

	@Override
	public List<LearnRecordQuizDTO> getWrongAnswerByUser(int userSeq, int start, int limit) {
		return dao.getWrongAnswerByUser(userSeq, start, limit);
	}

	@Override
	public int getWrongAnswerCountByUser(int userSeq) {
		return dao.getWrongAnswerCountByUser(userSeq);
	}
}
