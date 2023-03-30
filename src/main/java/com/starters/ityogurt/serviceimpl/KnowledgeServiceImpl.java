package com.starters.ityogurt.serviceimpl;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.starters.ityogurt.dao.KnowledgeDAO;
import com.starters.ityogurt.dao.QuizDAO;
import com.starters.ityogurt.dto.KnowledgeDTO;
import com.starters.ityogurt.dto.QuizDTO;
import com.starters.ityogurt.service.KnowledgeService;
import com.starters.ityogurt.util.Criteria;

@Service("knowledgeservice")
public class KnowledgeServiceImpl implements KnowledgeService {

	@Autowired
	KnowledgeDAO dao;

	@Override
	public List<KnowledgeDTO> getList(Map<Object, Object> map) {
		return dao.getList(map);
	}

	@Override
	public int getTotalCnt() {
		return dao.getTotalCnt();
	}

	@Override
	public String getContents(int knowSeq) {
		return dao.getContents(knowSeq);
	}

	@Override
	public String getTitle(int knowSeq) {
		return dao.getTitle(knowSeq);
	}

	@Override
	public void uploadKnowledge(KnowledgeDTO dto) {
		dao.uploadKnowledge(dto);
	}

	@Override
	public void viewCnt(int knowSeq) {
		dao.viewCnt(knowSeq);
	}

	@Override
	public List<KnowledgeDTO> getSearchList(String keyword) {
		return dao.getSearchList(keyword);
	}

	@Override
	public KnowledgeDTO getKnowledgeByCategorySeq(int categorySeq) {
		return dao.getKnowledgeByCategorySeq(categorySeq);
	}

	@Override
	public int getCategoryCnt(String category) {
		return dao.getCategoryCnt(category);
	}

	@Override
	public String getKnowledgeTitle(int knowSeq) {
		return dao.getKnowledgeTitle(knowSeq);
	}

	@Override
	public int getCategorySeq(int knowSeq) {
		return dao.getCategorySeq(knowSeq);
	}

	@Override
	public KnowledgeDTO UploadContentsKnowledge(String data) {
		

   		JSONParser jsonParser = new JSONParser();
		JSONArray insertParam = null;
		try {
			insertParam = (JSONArray) jsonParser.parse(data);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		JSONObject insertData = new JSONObject();
		
		KnowledgeDTO knowledgeDto = new KnowledgeDTO();
		String [] knowledgeData = new String [8]; 
		
		for(int i=4; i<8; i++){
			insertData = (JSONObject) insertParam.get(i);
			String value = (String) insertData.get("value");
			knowledgeData[i]= value;
			
		}
		knowledgeDto.setCategorySeq(Integer.parseInt(knowledgeData[4]));
		knowledgeDto.setUserSeq(Integer.parseInt(knowledgeData[5]));
		knowledgeDto.setTitle(knowledgeData[6]);
		knowledgeDto.setContent(knowledgeData[7]);
		
		return knowledgeDto;
	}


}
