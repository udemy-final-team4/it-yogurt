package com.starters.ityogurt.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestBody;

import com.starters.ityogurt.dto.QuizDTO;

public interface QuizService {

	List<QuizDTO> getQuiz(int knowSeq);

	void uploadQuiz (QuizDTO dto);

	int getAnswer(int quizSeq);

	List<QuizDTO> getWeakQuizListByUser(int userSeq, int start, int end);

	List<QuizDTO> getQuizByQuiz(int quizSeq);
	
	public QuizDTO UploadContentsQuiz1(@RequestBody String data);
	public QuizDTO UploadContentsQuiz2(@RequestBody String data);
	public QuizDTO UploadContentsQuiz3(@RequestBody String data);
}
