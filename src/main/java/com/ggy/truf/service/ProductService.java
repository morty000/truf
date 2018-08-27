package com.ggy.truf.service;

import com.ggy.truf.common.ServerResponse;
import com.ggy.truf.pojo.Product;
import com.ggy.truf.vo.ProductDetailVo;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/8/10.
 */
public interface ProductService {

    ServerResponse<Product> saveOrUpdateProduct(Product product, HttpSession session);

    ServerResponse<String> setSaleStatus(Integer id, Integer status);

    ServerResponse getProductList(int pageNum, int pageSize);

    ServerResponse<ProductDetailVo> getProductDetail(Integer id);

    ServerResponse getProductByTimeOrKeywords(Date startTime, Date endTime, String keywords, int pageNum, int pageSize);

    ServerResponse getProductByTimeOrKeywordsAndStatus(Integer status, Date startTime, Date endTime, String keywords, int pageNum, int pageSize);

    ServerResponse getProductByTimeOrKeywordsAndStock(Integer stock, Date startTime, Date endTime, String keywords, int pageNum, int pageSize);

    ServerResponse<String> del_img(String subImages, Integer id);

    ServerResponse getProductByStockOrStatus(Integer stock, Integer status, int pageNum, int pageSize);

    List<Product> selectByCategory(Integer id);

    List<Product> getProductByKeywords(String keywords);

    //ServerResponse getProductByKeywordCategory(String keyword,Integer categoryId,int pageNum,int pageSize,String orderBy);
}
