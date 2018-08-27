package com.ggy.truf.controller;

import com.ggy.truf.common.Const;
import com.ggy.truf.common.ResponseCode;
import com.ggy.truf.common.ServerResponse;
import com.ggy.truf.pojo.Product;
import com.ggy.truf.pojo.User;
import com.ggy.truf.service.FileService;
import com.ggy.truf.service.ProductService;
import com.ggy.truf.service.UserService;
import com.ggy.truf.util.DateTimeUtil;
import com.ggy.truf.util.PropertiesUtil;
import com.ggy.truf.vo.ProductDetailVo;
import com.google.common.collect.Maps;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/8/10.
 */
@Controller
@RequestMapping("/product/")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private UserService userService;

    @Autowired
    private FileService fileService;

    /**
     * 保存或更新商品信息
     *
     * @param product
     * @param session
     * @return
     */
    @RequestMapping(value = "save.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<Product> saveOrUpdateProduct(Product product, HttpSession session) {
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "用户未登录,请登录管理员");
        }
        if (userService.checkAdminRole(user).isSuccess()) {
            //填充我们增加产品的业务逻辑
            Product product1 = (Product) session.getAttribute("product");
            if (product1 != null) {
                product.setSubImages(product1.getSubImages());
            }
            return productService.saveOrUpdateProduct(product, session);
        } else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    @RequestMapping(value = "save_main_image.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<Product> updateMainImage(Product product, HttpSession session) {
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "用户未登录,请登录管理员");
        }
        if (userService.checkAdminRole(user).isSuccess()) {
            //填充我们增加产品的业务逻辑
            return productService.saveOrUpdateProduct(product, session);
        } else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    /**
     * 修改商品出售状态
     *
     * @param id
     * @param status
     * @param session
     * @return
     */
    @RequestMapping(value = "set_sale_status.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> setSaleStatus(Integer id, Integer status, HttpSession session) {
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "用户未登录,请登录管理员");
        }
        if (userService.checkAdminRole(user).isSuccess()) {
            //填充我们增加产品的业务逻辑
            return productService.setSaleStatus(id, status);
        } else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    /**
     * 删除图片
     *
     * @param subImages
     * @param id
     * @param session
     * @return
     */
    @RequestMapping(value = "del_img.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<String> delete_images(@RequestParam(value = "subImages") String subImages, @RequestParam(value = "id") Integer id, HttpSession session) {
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "用户未登录,请登录管理员");
        }
        if (userService.checkAdminRole(user).isSuccess()) {
            //填充我们增加产品的业务逻辑
            return productService.del_img(subImages, id);
        } else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    /**
     * 查询所有商品信息（带分页）
     *
     * @param session
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "list.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse getList(HttpSession session, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum, @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "用户未登录,请登录管理员");
        }
        if (userService.checkAdminRole(user).isSuccess()) {
            //填充业务
            ServerResponse response = productService.getProductList(pageNum, pageSize);
            session.setAttribute("product_list", response);
            return response;
        } else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    /**
     * 获取商品详情
     *
     * @param session
     * @param id
     * @return
     */
    @RequestMapping(value = "detail.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse<ProductDetailVo> getDetail(HttpSession session, Integer id) {
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "用户未登录,请登录管理员");
        }
        if (userService.checkAdminRole(user).isSuccess()) {
            //填充业务
            return productService.getProductDetail(id);
        } else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    /**
     * 通过状态查询商品（带分页）
     *
     * @param session
     * @param stock
     * @param status
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "stock_status.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse getProductByStockOrStatus(HttpSession session, @RequestParam(value = "stock", required = false) Integer stock, @RequestParam(value = "status", required = false) Integer status, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum, @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "用户未登录,请登录管理员");
        }
        if (userService.checkAdminRole(user).isSuccess()) {
            //填充业务
            return productService.getProductByStockOrStatus(stock, status , pageNum, pageSize);
        } else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    /**
     * 通过关键字或时间段查询商品（带分页）
     *
     * @param session
     * @param startTime
     * @param endTime
     * @param keywords
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "time_keywords.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse getProductByTimeOrKeywords(HttpSession session, @RequestParam(value = "startTime", required = false) String startTime, @RequestParam(value = "endTime", required = false) String endTime, @RequestParam(value = "keywords", required = false) String keywords, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum, @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "用户未登录,请登录管理员");
        }
        if (userService.checkAdminRole(user).isSuccess()) {
            //填充业务
            return productService.getProductByTimeOrKeywords(DateTimeUtil.strToDate(startTime, "yyyy-MM-dd"), DateTimeUtil.strToDate(endTime, "yyyy-MM-dd"), keywords, pageNum, pageSize);
        } else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    /**
     * 通过关键字或时间段查询带有状态查询条件的商品（带分页）
     *
     * @param session
     * @param status
     * @param startTime
     * @param endTime
     * @param keywords
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "time_keywords_status.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse getProductByTimeOrKeywordsAndStatus(HttpSession session, @RequestParam(value = "status", required = false) Integer status, @RequestParam(value = "startTime", required = false) String startTime, @RequestParam(value = "endTime", required = false) String endTime, @RequestParam(value = "keywords", required = false) String keywords, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum, @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "用户未登录,请登录管理员");
        }
        if (userService.checkAdminRole(user).isSuccess()) {
            //填充业务
            return productService.getProductByTimeOrKeywordsAndStatus(status, DateTimeUtil.strToDate(startTime, "yyyy-MM-dd"), DateTimeUtil.strToDate(endTime, "yyyy-MM-dd"), keywords, pageNum, pageSize);
        } else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    /**
     * 通过关键字或时间段查询带有库存查询条件的商品（带分页）
     *
     * @param session
     * @param stock
     * @param startTime
     * @param endTime
     * @param keywords
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "time_keywords_stock.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse getProductByTimeOrKeywordsAndStock(HttpSession session, @RequestParam(value = "stock", required = false) Integer stock, @RequestParam(value = "startTime", required = false) String startTime, @RequestParam(value = "endTime", required = false) String endTime, @RequestParam(value = "keywords", required = false) String keywords, @RequestParam(value = "pageNum", defaultValue = "1") int pageNum, @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) {
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "用户未登录,请登录管理员");
        }
        if (userService.checkAdminRole(user).isSuccess()) {
            //填充业务
            return productService.getProductByTimeOrKeywordsAndStock(stock, DateTimeUtil.strToDate(startTime, "yyyy-MM-dd"), DateTimeUtil.strToDate(endTime, "yyyy-MM-dd"), keywords, pageNum, pageSize);
        } else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    /**
     * 通过类别查询商品（带分页）
     *
     * @param session
     * @param CategoryName
     * @return
     */
    @RequestMapping(value = "category.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse getProductByCategory(HttpSession session, String CategoryName) {
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "用户未登录,请登录管理员");
        }
        if (userService.checkAdminRole(user).isSuccess()) {
            // TODO 填充业务
            return null;
        } else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    /**
     * 文件上传下载
     *
     * @param session
     * @param file
     * @param request
     * @return
     */
    @RequestMapping(path = "upload/up", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse upload(HttpSession session, @RequestParam(name = "file", required = false) CommonsMultipartFile file, HttpServletRequest request) {
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            return ServerResponse.createByErrorCodeMessage(ResponseCode.NEED_LOGIN.getCode(), "用户未登录,请登录管理员");
        }
        //request
        if (userService.checkAdminRole(user).isSuccess()) {
            //填充业务
            Product product = (Product) session.getAttribute("product");
            String path = request.getSession().getServletContext().getRealPath("upload");
            String targetFileName = fileService.upload(file, path);
            String url = PropertiesUtil.getProperty("ftp.server.http.prefix") + targetFileName;
            if (product.getSubImages() == null) {
                product.setSubImages(targetFileName);
            } else {
                product.setSubImages(product.getSubImages() + "," + targetFileName);
            }
            session.setAttribute("product", product);
            Map fileMap = Maps.newHashMap();
            fileMap.put("uri", targetFileName);
            fileMap.put("url", url);
            session.setAttribute("fileMap", fileMap);
            return ServerResponse.createBySuccess(fileMap);
        } else {
            return ServerResponse.createByErrorMessage("无权限操作");
        }
    }

    /**
     * 富文本文件的上传下载
     *
     * @param session
     * @param file
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value = "richtext_img_upload.do", method = RequestMethod.POST)
    @ResponseBody
    public Map richtextImgUpload(HttpSession session, @RequestParam(value = "upload_file", required = false) MultipartFile file, HttpServletRequest request, HttpServletResponse response) {
        Map resultMap = Maps.newHashMap();
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user == null) {
            resultMap.put("success", false);
            resultMap.put("msg", "请登录管理员");
            return resultMap;
        }
        if (userService.checkAdminRole(user).isSuccess()) {
            String path = request.getSession().getServletContext().getRealPath("upload");
            String targetFileName = fileService.upload(file, path);
            if (StringUtils.isBlank(targetFileName)) {
                resultMap.put("success", false);
                resultMap.put("msg", "上传失败");
                return resultMap;
            }
            String url = PropertiesUtil.getProperty("ftp.server.http.prefix") + targetFileName;
            resultMap.put("success", true);
            resultMap.put("msg", "上传成功");
            resultMap.put("file_path", url);
            response.addHeader("Access-Control-Allow-Headers", "X-File-Name");
            return resultMap;
        } else {
            resultMap.put("success", false);
            resultMap.put("msg", "无权限操作");
            return resultMap;
        }
    }

    @RequestMapping(value = "keywords.do", method = RequestMethod.GET)
    public String keywords(HttpSession session, @RequestParam(value = "keywords", required = false) String keywords) {
        if (keywords == null || keywords.equals("")) {
            return new PageSkipController().login_jsp(session);
        }
        List<Product> products = productService.getProductByKeywords(keywords);
        if (products.size() == 0) {
            return new PageSkipController().login_jsp(session);
        }
        session.setAttribute("searchProductByCategory", products);
        return "home/search";
    }
}
