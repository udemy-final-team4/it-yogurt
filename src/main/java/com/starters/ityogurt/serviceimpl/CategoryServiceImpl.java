package com.starters.ityogurt.serviceimpl;

import com.starters.ityogurt.dto.UserDTO;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import com.starters.ityogurt.dao.CategoryDAO;
import com.starters.ityogurt.dto.CategoryDTO;
import com.starters.ityogurt.dto.KnowledgeDTO;
import com.starters.ityogurt.dto.QuizDTO;
import com.starters.ityogurt.service.CategoryService;

@Service("categoryservice")
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryDAO dao;

	@Override
	public List<CategoryDTO> getAllCategoryList() {
		return dao.getAllCategoryList();
	}

	public CategoryDTO getCategoryByCategorySeq(String categorySeq) {
		return dao.getCategoryByCategorySeq(categorySeq);
	}

	@Override
	public int countAllSub() {
		return dao.countAllSub();
	}

	@Override
	public List<CategoryDTO> getCategoryByType(String type, String typeValue) {
		return dao.getCategoryByType(type, typeValue);
	}

	@Override
	public CategoryDTO getCategoryByAllType(CategoryDTO categoryDTO) {
		return dao.getCategoryByAllType(categoryDTO);

	}


    @Override
    public int findWeakCategoryByCategorySeq(int userSeq) {
        return dao.findWeakCategoryByCategorySeq(userSeq);
    }


   

  @Override
	public void insertCategory(CategoryDTO categoryDTO) {
		dao.insertCategory(categoryDTO);
	}

	@Override
	public CategoryDTO getCategoryByUserSeq(int userSeq) {
		return dao.getCategoryByUserSeq(userSeq);
	}
		@Override
		public int countAllCategory() {
			return dao.countAllCategory();
		}

		@Override
		public int getCategoryBySub(String sub) {
			return dao.getCategoryBySub(sub);
		}

		@Override
		public List<CategoryDTO> getMiddleCategoryGroup() {
			return dao.getMiddleCategoryGroup();
		}
		
		@Override
		public CategoryDTO UploadContentsCategory(@RequestBody String data) {
	   		
	   		JSONParser jsonParser = new JSONParser();
			JSONArray insertParam = null;
			try {
				insertParam = (JSONArray) jsonParser.parse(data);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			JSONObject insertData = new JSONObject();
			
			CategoryDTO categoryDto = new CategoryDTO();
			
			String [] categoryData = new String [4]; 
			
			
			for(int i=0; i<4; i++){
				insertData = (JSONObject) insertParam.get(i);
				String value = (String) insertData.get("value");
				categoryData[i]= value;
				
			}
			categoryDto.setMain(categoryData[0]);
			categoryDto.setMiddle(categoryData[1]);
			categoryDto.setSub(categoryData[2]);
			categoryDto.setDetail(categoryData[3]);
			return categoryDto;
			
		}
	
}