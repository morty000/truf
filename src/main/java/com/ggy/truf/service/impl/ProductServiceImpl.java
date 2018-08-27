package com.ggy.truf.service.impl;

import com.ggy.truf.common.ResponseCode;
import com.ggy.truf.common.ServerResponse;
import com.ggy.truf.dao.CategoryMapper;
import com.ggy.truf.dao.ProductMapper;
import com.ggy.truf.pojo.Category;
import com.ggy.truf.pojo.Product;
import com.ggy.truf.service.ProductService;
import com.ggy.truf.service.CategoryService;
import com.ggy.truf.util.PropertiesUtil;
import com.ggy.truf.util.DateTimeUtil;
import com.ggy.truf.vo.ProductDetailVo;
import com.ggy.truf.vo.ProductListVo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/8/10.
 */
@Service("productService")
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductMapper productMapper;

    @Autowired
    private CategoryMapper categoryMapper;

    @Autowired
    private CategoryService categoryService;


    @Override
    public ServerResponse<Product> saveOrUpdateProduct(Product product, HttpSession session) {
        if (product != null) {
            if (StringUtils.isNotBlank(product.getSubImages())) {
                String[] subImageArray = product.getSubImages().split(",");
                if (subImageArray.length > 0) {
                    product.setMainImage(subImageArray[0]);
                }
            }
            if (product.getId() != null) {
                int resultCount = productMapper.updateByPrimaryKeySelective(product);
                if (resultCount == 0) {
                    return ServerResponse.createByErrorMessage("修改商品信息失败");
                }
                return ServerResponse.createBySuccessMessage("修改商品信息成功");
            } else {
                int resultCount = productMapper.insert(product);
                if (resultCount == 0) {
                    return ServerResponse.createByErrorMessage("新增商品信息失败");
                }
                return ServerResponse.createBySuccessMessage("新增商品信息成功");
            }
        }
        return ServerResponse.createByErrorMessage("新增或更新商品参数不正确");
    }

    @Override
    public ServerResponse<String> del_img(String subImages, Integer id) {
        if (subImages != null) {
            subImages = subImages.substring(9, subImages.length());
            Product product = productMapper.selectByPrimaryKey(id);
            List<String> aList = Arrays.asList(product.getSubImages().split(","));
            List<String> bList = Arrays.asList(subImages.split(","));
            String str = "";
            for (String list : aList) {
                if (bList.contains(list)) {
                    continue;
                } else {
                    str += list + ",";
                }
            }
            if (str.charAt(str.length() - 1) == ',') {
                str.substring(0, str.length() - 2);
            }
            subImages = str;
            product.setSubImages(subImages);
            if (product.getId() != null) {
                int resultCount = productMapper.updateByPrimaryKeySelective(product);
                if (resultCount == 0) {
                    return ServerResponse.createByErrorMessage("删除商品图片失败");
                }
                return ServerResponse.createBySuccessMessage("删除商品图片成功");
            }
        }
        return ServerResponse.createByErrorMessage("删除商品参数不正确");
    }

    @Override
    public ServerResponse getProductByStockOrStatus(Integer stock, Integer status, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Product> productList = null;
        if (stock != null) {
            productList = productMapper.selectByStock(stock);
        } else if (status != null) {
            productList = productMapper.selectByStatus(status);
        }
        List<ProductListVo> productListVoList = Lists.newArrayList();
        for (Product productItem : productList) {
            ProductListVo productListVo = assembleProductListVo(productItem);
            productListVoList.add(productListVo);
        }
        PageInfo pageResult = new PageInfo(productList,5);
        pageResult.setList(productListVoList);
        return ServerResponse.createBySuccess(pageResult);
    }

    @Override
    public ServerResponse<String> setSaleStatus(Integer id, Integer status) {
        if (id == null && status == null) {
            return ServerResponse.createByErrorCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(), ResponseCode.ILLEGAL_ARGUMENT.getDesc());
        }
        Product product = new Product();
        product.setId(id);
        product.setStatus(status);
        int rowCount = productMapper.updateByPrimaryKeySelective(product);
        if (rowCount > 0) {
            return ServerResponse.createBySuccessMessage("修改商品销售状态成功");
        }
        return ServerResponse.createByErrorMessage("修改商品销售状态失败");
    }

    @Override
    public ServerResponse<PageInfo> getProductList(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Product> productList = productMapper.selectList();
        List<ProductListVo> productListVoList = Lists.newArrayList();
        for (Product productItem : productList) {
            ProductListVo productListVo = assembleProductListVo(productItem);
            productListVoList.add(productListVo);
        }
        PageInfo pageResult = new PageInfo(productList, 5);
        pageResult.setList(productListVoList);
        return ServerResponse.createBySuccess(pageResult);
    }

    private ProductListVo assembleProductListVo(Product product){
        ProductListVo productListVo = new ProductListVo();
        productListVo.setId(product.getId());
        productListVo.setName(product.getName());
        productListVo.setCategoryId(product.getCategoryId());
        productListVo.setImageHost(PropertiesUtil.getProperty("ftp.server.http.prefix","http://img.happymmall.com/"));
        productListVo.setMainImage(product.getMainImage());
        productListVo.setPrice(product.getPrice());
        productListVo.setStock(product.getStock());
        productListVo.setStatus(product.getStatus());
        return productListVo;
    }

    @Override
    public ServerResponse<ProductDetailVo> getProductDetail(Integer id) {
        if (id == null) {
            return ServerResponse.createByErrorCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(),ResponseCode.ILLEGAL_ARGUMENT.getDesc());
        }
        Product product = productMapper.selectByPrimaryKey(id);
        if (product == null) {
            return ServerResponse.createByErrorMessage("商品已下架或者删除");
        }
        ProductDetailVo productDetailVo = assembleProductDetailVo(product);
        return ServerResponse.createBySuccess(productDetailVo);
    }

    private ProductDetailVo assembleProductDetailVo(Product product){
        ProductDetailVo productDetailVo = new ProductDetailVo();
        productDetailVo.setId(product.getId());
        productDetailVo.setPrice(product.getPrice());
        productDetailVo.setMainImage(product.getMainImage());
        productDetailVo.setSubImages(product.getSubImages());
        productDetailVo.setCategoryId(product.getCategoryId());
        productDetailVo.setDetail(product.getDetail());
        productDetailVo.setName(product.getName());
        productDetailVo.setStatus(product.getStatus());
        productDetailVo.setStock(product.getStock());
        productDetailVo.setImageHost(PropertiesUtil.getProperty("ftp.server.http.prefix","http://img.happymmall.com/"));
        Category category = categoryMapper.selectByPrimaryKey(product.getCategoryId());
        if(category == null){
            productDetailVo.setParentCategoryId(0);//默认根节点
        }else{
            productDetailVo.setParentCategoryId(category.getParentId());
        }
        productDetailVo.setCreateTime(DateTimeUtil.dateToStr(product.getCreateTime()));
        productDetailVo.setUpdateTime(DateTimeUtil.dateToStr(product.getUpdateTime()));
        return productDetailVo;
    }

    @Override
    public ServerResponse<PageInfo> getProductByTimeOrKeywords(Date startTime, Date endTime, String keywords, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        if (keywords != "") {
            keywords = "%" + keywords + "%";
        }
        List<Product> productList = productMapper.selectByTimeOrKeywords(startTime, endTime, keywords);
        List<ProductListVo> productListVoList = Lists.newArrayList();
        for (Product productItem : productList) {
            ProductListVo productListVo = assembleProductListVo(productItem);
            productListVoList.add(productListVo);
        }
        PageInfo pageResult = new PageInfo(productList,5);
        pageResult.setList(productListVoList);
        return ServerResponse.createBySuccess(pageResult);
    }

    @Override
    public ServerResponse<PageInfo> getProductByTimeOrKeywordsAndStatus(Integer status, Date startTime, Date endTime, String keywords, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        if (keywords != "") {
            keywords = "%" + keywords + "%";
        }
        List<Product> productList = productMapper.selectByTimeOrKeywordsAndStatus(status, startTime, endTime, keywords);
        List<ProductListVo> productListVoList = Lists.newArrayList();
        for (Product productItem : productList) {
            ProductListVo productListVo = assembleProductListVo(productItem);
            productListVoList.add(productListVo);
        }
        PageInfo pageResult = new PageInfo(productList,5);
        pageResult.setList(productListVoList);
        return ServerResponse.createBySuccess(pageResult);
    }

    @Override
    public ServerResponse<PageInfo> getProductByTimeOrKeywordsAndStock(Integer stock, Date startTime, Date endTime, String keywords, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        if (keywords != "") {
            keywords = "%" + keywords + "%";
        }
        List<Product> productList = productMapper.selectByTimeOrKeywordsAndStock(stock, startTime, endTime, keywords);
        List<ProductListVo> productListVoList = Lists.newArrayList();
        for (Product productItem : productList) {
            ProductListVo productListVo = assembleProductListVo(productItem);
            productListVoList.add(productListVo);
        }
        PageInfo pageResult = new PageInfo(productList,5);
        pageResult.setList(productListVoList);
        return ServerResponse.createBySuccess(pageResult);
    }

    @Override
    public List<Product> selectByCategory(Integer categoryId) {
        List<Product> products = productMapper.selectByCategory(categoryId);
        return products;
    }

    @Override
    public List<Product> getProductByKeywords(String keywords) {
        keywords = "%" + keywords + "%";
        List<Product> products = productMapper.selectByKeywords(keywords);
        return products;
    }

    /*public ServerResponse<PageInfo> getProductByKeywordCategory(String keyword,Integer categoryId,int pageNum,int pageSize,String orderBy){
        if(StringUtils.isBlank(keyword) && categoryId == null){
            return ServerResponse.createByErrorCodeMessage(ResponseCode.ILLEGAL_ARGUMENT.getCode(),ResponseCode.ILLEGAL_ARGUMENT.getDesc());
        }
        List<Integer> categoryIdList = new ArrayList<>();
        if(categoryId != null){
            Category category = categoryMapper.selectByPrimaryKey(categoryId);
            if(category == null && StringUtils.isBlank(keyword)){
                //没有该分类,并且还没有关键字,这个时候返回一个空的结果集,不报错
                PageHelper.startPage(pageNum,pageSize);
                List<ProductListVo> productListVoList = Lists.newArrayList();
                PageInfo pageInfo = new PageInfo(productListVoList);
                return ServerResponse.createBySuccess(pageInfo);
            }
            categoryIdList = categoryService.selectCategoryAndChildrenById(category.getId()).getData();
        }
        if(StringUtils.isNotBlank(keyword)){
            keyword = new StringBuilder().append("%").append(keyword).append("%").toString();
        }
        PageHelper.startPage(pageNum,pageSize);
        //排序处理
        if(StringUtils.isNotBlank(orderBy)){
            if(Const.ProductListOrderBy.PRICE_ASC_DESC.contains(orderBy)){
                String[] orderByArray = orderBy.split("_");
                PageHelper.orderBy(orderByArray[0]+" "+orderByArray[1]);
            }
        }
        List<Product> productList = productMapper.selectByNameAndCategoryIds(StringUtils.isBlank(keyword)?null:keyword,categoryIdList.size()==0?null:categoryIdList);

        List<ProductListVo> productListVoList = Lists.newArrayList();
        for(Product product : productList){
            ProductListVo productListVo = assembleProductListVo(product);
            productListVoList.add(productListVo);
        }
        PageInfo pageInfo = new PageInfo(productList);
        pageInfo.setList(productListVoList);
        return ServerResponse.createBySuccess(pageInfo);
    }*/
}
