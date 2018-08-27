package com.ggy.truf.service;

import java.util.List;

import com.ggy.truf.common.ServerResponse;
import com.ggy.truf.pojo.Category;

/**
 * Created by Administrator on 2017/8/10.
 */
public interface CategoryService {

	ServerResponse addCategory(String categoryName, Integer parentId);

	
	ServerResponse updateCategoryName(Integer categoryId,String categoryName);
   
	ServerResponse<List<Category>> getChildrenParallelCategory(Integer categoryId);
	
	
	ServerResponse selectCategoryAndChildrenById(Integer categoryId);
}
