package com.starters.ityogurt.serviceimpl;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starters.ityogurt.dao.QuizDAO;
import com.starters.ityogurt.dto.QuizDTO;
import com.starters.ityogurt.service.QuizService;

@Service("quizservice")
public class QuizServiceImpl implements QuizService {

	@Autowired
	QuizDAO dao;
	
	@Override
	public void uploadQuiz(QuizDTO dto) {
		dao.uploadQuiz(dto);
		
	}
	@Override
	public List<QuizDTO> getQuiz(int knowSeq) {
		return dao.getQuiz(knowSeq);
	}
	
	@Override
	public int getAnswer(int quizSeq) {
		return dao.getAnswer(quizSeq);
	}

	@Override
	public List<QuizDTO> getWeakQuizListByUser(int weakCategorySeq, int start, int end) {
		return dao.getWeakQuizListByUser(weakCategorySeq, start, end);
	}

	@Override
	public List<QuizDTO> getQuizByQuiz(int quizSeq) {
		return dao.getQuizByQuiz(quizSeq);
	}
	
	@Override
	public QuizDTO UploadContentsQuiz1(String data) {
		
		JSONParser jsonParser = new JSONParser();
		JSONArray insertParam = null;
		try {
			insertParam = (JSONArray) jsonParser.parse(data);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		JSONObject insertData = new JSONObject();
		QuizDTO quizDto = new QuizDTO();
		String [] quizData = new String[32]; 
		
		for(int i=8; i<16; i++){
			insertData = (JSONObject) insertParam.get(i);
			String value = (String) insertData.get("value");
			quizData[i]= value;
			
		}
		quizDto.setQuestion(quizData[8]);
		quizDto.setChoice1(quizData[9]);
		quizDto.setChoice2(quizData[10]);
		quizDto.setChoice3(quizData[11]);
		quizDto.setChoice4(quizData[12]);
		quizDto.setAnswer(Integer.parseInt(quizData[13]));
		quizDto.setCommentary(quizData[14]);
		quizDto.setKnowSeq(Integer.parseInt(quizData[15]));
		
		return quizDto;
	}
	@Override
	public QuizDTO UploadContentsQuiz2(String data) {
		
		JSONParser jsonParser = new JSONParser();
		JSONArray insertParam = null;
		try {
			insertParam = (JSONArray) jsonParser.parse(data);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		JSONObject insertData = new JSONObject();
		QuizDTO quizDto = new QuizDTO();
		String [] quizData = new String[32]; 
		
		for(int i=16; i<24; i++){
			insertData = (JSONObject) insertParam.get(i);
			String value = (String) insertData.get("value");
			quizData[i]= value;
			
		}
		quizDto.setQuestion(quizData[16]);
		quizDto.setChoice1(quizData[17]);
		quizDto.setChoice2(quizData[18]);
		quizDto.setChoice3(quizData[19]);
		quizDto.setChoice4(quizData[20]);
		quizDto.setAnswer(Integer.parseInt(quizData[21]));
		quizDto.setCommentary(quizData[22]);
		quizDto.setKnowSeq(Integer.parseInt(quizData[23]));
		
		return quizDto;
	}
	@Override
	public QuizDTO UploadContentsQuiz3(String data) {
		
		JSONParser jsonParser = new JSONParser();
		JSONArray insertParam = null;
		try {
			insertParam = (JSONArray) jsonParser.parse(data);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		JSONObject insertData = new JSONObject();
		QuizDTO quizDto = new QuizDTO();
		String [] quizData = new String[32]; 
		
		for(int i=24; i<insertParam.size(); i++){
			insertData = (JSONObject) insertParam.get(i);
			String value = (String) insertData.get("value");
			quizData[i]= value;
			
		}
		quizDto.setQuestion(quizData[24]);
		quizDto.setChoice1(quizData[25]);
		quizDto.setChoice2(quizData[26]);
		quizDto.setChoice3(quizData[27]);
		quizDto.setChoice4(quizData[28]);
		quizDto.setAnswer(Integer.parseInt(quizData[29]));
		quizDto.setCommentary(quizData[30]);
		quizDto.setKnowSeq(Integer.parseInt(quizData[31]));
		
		return quizDto;
	}


}
