package com.ggy.truf.service.impl;

import com.ggy.truf.common.ServerResponse;
import com.ggy.truf.dao.CategoryMapper;
import com.ggy.truf.pojo.Category;
import com.ggy.truf.service.CategoryService;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;

import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.CollectionUtils;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/8/10.
 */
@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {

	private Logger logger = LoggerFactory.getLogger(CategoryServiceImpl.class);
	
	
	
	@Autowired
	private CategoryMapper categoryMapper;
	
    @Override
    public ServerResponse addCategory(String categoryName,Integer parentId) {
    	if(parentId == null || StringUtils.isBlank(categoryName)){
    		return ServerResponse.createByErrorMessage("添加品类错误");
    	}
    	Category category = new Category();
    	category.setName(categoryName);
    	category.setParentId(parentId);
    	category.setStatus(1);
    	
    	int rowCount = categoryMapper.insert(category);
    	if(rowCount > 0){
    		return ServerResponse.createBySuccess("添加成功");
    	}
    	return ServerResponse.createByErrorMessage("添加失败");
    }
    
    public ServerResponse updateCategoryName(Integer categoryId,String categoryName){
    	if(categoryId == null || StringUtils.isBlank(categoryName)){
    		return ServerResponse.createByErrorMessage("更新品类错误");
    	}
    	Category category = new Category();
    	category.setParentId(categoryId);
    	category.setName(categoryName);
    	int rowCount = categoryMapper.updateByPrimaryKeySelective(category);
    	if(rowCount > 0){
    		return ServerResponse.createBySuccess("更新品类成功");
    	}
    	return ServerResponse.createByErrorMessage("更新品类失败");
    }
    
    public ServerResponse<List<Category>> getChildrenParallelCategory(Integer categoryId){
		List<Category> categoryList = categoryMapper.selectByParentId(categoryId);
		if(org.springframework.util.CollectionUtils.isEmpty(categoryList)){
			logger.info("未找到当前分类的子分类");
		}
		return ServerResponse.createBySuccess(categoryList);
    }
    
    public ServerResponse selectCategoryAndChildrenById(Integer categoryId){
    	Set<Category> categorySet = Sets.newHashSet();
    	findChildCategory(categorySet,categoryId);
    	
    	List<Integer> categoryIdList = Lists.newArrayList();
    	if(categoryId != null){
    		for(Category categoryItem : categorySet){
    			categoryIdList.add(categoryItem.getId());
    		}
    		
    	}
    	return ServerResponse.createBySuccess(categoryIdList);
    }
    
    //递归算法，算出子节点
    private Set<Category> findChildCategory(Set<Category> categorySet,Integer categoryId){
    	Category category = categoryMapper.selectByPrimaryKey(categoryId);
    	if(category !=null){
    		categorySet.add(category);
    	}
    	List<Category> categoryList = categoryMapper.selectByParentId(categoryId);
    	for(Category categoryItem : categoryList){
    		findChildCategory(categorySet, categoryItem.getId());
    	}
    	return categorySet;
    }
}
