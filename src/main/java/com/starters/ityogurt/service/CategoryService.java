package com.starters.ityogurt.service;

import com.starters.ityogurt.dto.CategoryDTO;
import com.starters.ityogurt.dto.UserDTO;
import java.util.List;

import org.springframework.web.bind.annotation.RequestBody;

public interface CategoryService {

    List<CategoryDTO> getAllCategoryList();
    CategoryDTO getCategoryByCategorySeq(String categorySeq);

    int countAllSub();
    int countAllCategory();

    List<CategoryDTO> getCategoryByType(String type, String typeValue);
    CategoryDTO getCategoryByAllType(CategoryDTO categoryDTO);

    void insertCategory(CategoryDTO categoryDTO);


    int findWeakCategoryByCategorySeq(int userSeq);

    CategoryDTO getCategoryByUserSeq(int userSeq);
	int getCategoryBySub(String sub);
	List<CategoryDTO> getMiddleCategoryGroup();
    
	public CategoryDTO UploadContentsCategory(@RequestBody String data);

}
