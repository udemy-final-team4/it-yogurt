package com.starters.ityogurt.controller;

import com.starters.ityogurt.dto.CategoryDTO;
import com.starters.ityogurt.dto.UserDTO;
import com.starters.ityogurt.service.CategoryService;
import com.starters.ityogurt.service.UserService;
import com.starters.ityogurt.util.Encrypt;
import java.util.List;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class CategoryController {

    @Autowired
    CategoryService categoryService;

    // 카테고리 리스트 가져오기
    @GetMapping("/category")
    public List<CategoryDTO> getAllCategoryList() {
        List<CategoryDTO> categoryDTO = categoryService.getAllCategoryList();
        return categoryDTO;
    }

    // 카테고리 categorySeq로 하나 가져오기
    @GetMapping("/category/1")
    public CategoryDTO getCategoryByCategorySeq(@RequestParam("category_seq") String categorySeq) {
        CategoryDTO categoryDTO = categoryService.getCategoryByCategorySeq(categorySeq);
        return categoryDTO;
    }

    @GetMapping("category/{type}")
    public JSONObject getCategoryByType(@PathVariable("type") String type, @RequestParam("type_value") String typeValue) {
        List<CategoryDTO> categoryDTO = categoryService.getCategoryByType(type,typeValue);

        JSONObject jsonObj = new JSONObject();
        jsonObj.put("list", categoryDTO);
        jsonObj.put("type", type);
        return jsonObj;
    }
}
