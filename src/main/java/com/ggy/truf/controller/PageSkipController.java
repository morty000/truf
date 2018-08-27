package com.ggy.truf.controller;

import com.ggy.truf.dao.ActiveMapper;
import com.ggy.truf.dao.CategoryMapper;
import com.ggy.truf.dao.ProductMapper;
import com.ggy.truf.pojo.Active;
import com.ggy.truf.pojo.Category;
import com.ggy.truf.pojo.Product;
import com.ggy.truf.service.ProductService;
import com.google.common.collect.Lists;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * Created by Administrator on 2017/8/13.
 */
@Controller
public class PageSkipController {

    @RequestMapping(value = "login.html", method = RequestMethod.GET)
    public String login_html() {
        return "home/login";
    }

    @RequestMapping(value = "register.html", method = RequestMethod.GET)
    public String register_html() {
        return "home/register";
    }

    @Autowired
    private ActiveMapper activeMapper;

    @Autowired
    private CategoryMapper categoryMapper;

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "home.html", method = RequestMethod.GET)
    public String login_jsp(HttpSession session) {
        // 获取活动商品
        List<Product> products1 = getActiveProduct(1);
        session.setAttribute("recommend", products1);
        List<Product> products2 = getActiveProduct(2);
        session.setAttribute("miaosha", products2);
        List<Product> products3 = getActiveProduct(3);
        session.setAttribute("tehui", products3);
        List<Product> products4 = getActiveProduct(4);
        session.setAttribute("tuangou", products4);
        List<Product> products5 = getActiveProduct(5);
        session.setAttribute("chaozhi", products5);
        //获取一级分类
        List<Category> categoriesByLv1 = categoryMapper.selectByParentId(0);
        Map<String, List<Category>> categoryMap = new TreeMap<>();
        Map<String, List<Product>> productMap = new TreeMap<>();
        List<Product> productList = new ArrayList<>();
        for (Category category : categoriesByLv1) {
            //获取一级分类的ID来查询该分类底下的所有二级分类
            List<Category> categoriesByLv2 = categoryMapper.selectByParentId(category.getId());
            categoryMap.put(category.getName(), categoriesByLv2);
            for (Category category2 : categoriesByLv2) {
                List<Product> products = productService.selectByCategory(category2.getId());
                productList.addAll(products);
            }
            productMap.put(category.getName(), productList);
        }
        session.setAttribute("category", categoryMap);
        session.setAttribute("productByCategory", productMap);
        return "home/home";
    }

    public List<Product> getActiveProduct(Integer recommend) {
        List<Active> actives = activeMapper.selectByStatus(recommend);
        List<Product> products = Lists.newArrayList();
        for (Active active : actives) {
            Product product = productMapper.selectByPrimaryKey(active.getProductId());
            products.add(product);
        }
        return products;
    }

    @RequestMapping(value = "search.html", method = RequestMethod.GET)
    public String search_html(Integer categoryId, HttpSession session) {
        List<Product> products = productMapper.selectByCategory(categoryId);
        session.setAttribute("searchProductByCategory", products);
        return "home/search";
    }

    @RequestMapping(value = "introduction.html", method = RequestMethod.GET)
    public String introduction_html (Integer productId, HttpSession session, HttpServletResponse response) {
        Product product = productMapper.selectByPrimaryKey(productId);
        session.setAttribute("product_introduction", product);
        Integer categoryId = product.getCategoryId();
        Category category = categoryMapper.selectByPrimaryKey(categoryId);
        session.setAttribute("categoryName", category.getName());
        String[] strings = product.getDetail().split(":::");
        session.setAttribute("StringArray", strings);
        List<Product> products = productMapper.selectByCategory(categoryId);
        session.setAttribute("searchProductByCategory", products);
        // 浏览记录
        List<Product> history_products = (List<Product>)session.getAttribute("history_products");
        if (history_products == null) {
            history_products = Lists.newArrayList();
        }
        Collections.reverse(history_products);
        for (int i = 0; i < history_products.size(); i++) {
            if (Objects.equals(history_products.get(i).getId(), product.getId())) {
                history_products.remove(i);
            }
        }
        history_products.add(product);
        if (history_products.size() > 5) {
            history_products.remove(0);
        }
        Collections.reverse(history_products);
        session.setAttribute("history_products", history_products);
        return "home/introduction";
    }

    @RequestMapping(value = "index.html", method = RequestMethod.GET)
    public String index_html() {
        return "backend/index";
    }

    @RequestMapping(value = "category_list.html", method = RequestMethod.GET)
    public String category_list_html() {
        return "backend/category_list";
    }

    @RequestMapping(value = "product_list.html", method = RequestMethod.GET)
    public String product_list_html() {
        return "backend/product_list";
    }

    @RequestMapping(value = "product_list_sell.html", method = RequestMethod.GET)
    public String product_list_sell_html() {
        return "backend/product_list_sell";
    }

    @RequestMapping(value = "product_list_nosell.html", method = RequestMethod.GET)
    public String product_list_nosell_html() {
        return "backend/product_list_nosell";
    }

    @RequestMapping(value = "product_list_del.html", method = RequestMethod.GET)
    public String product_list_del_html() {
        return "backend/product_list_del";
    }

    @RequestMapping(value = "product_list_stock.html", method = RequestMethod.GET)
    public String product_list_stock_html() {
        return "backend/product_list_stock";
    }

    @RequestMapping(value = "order_list.html", method = RequestMethod.GET)
    public String order_list_html() {
        return "backend/order_list";
    }

    @RequestMapping(value = "welcome.html", method = RequestMethod.GET)
    public String welcome_html() {
        return "backend/welcome";
    }

    @RequestMapping(value = "address.html", method = RequestMethod.GET)
    public String address_html() {
        return "user/address";
    }

    @RequestMapping(value = "bindphone.html", method = RequestMethod.GET)
    public String bindphone_html() {
        return "user/bindphone";
    }

    @RequestMapping(value = "change.html", method = RequestMethod.GET)
    public String change_html() {
        return "user/change";
    }

    @RequestMapping(value = "email.html", method = RequestMethod.GET)
    public String email_html() {
        return "user/email";
    }

    @RequestMapping(value = "idcard.html", method = RequestMethod.GET)
    public String idcard_html() {
        return "user/idcard";
    }

    @RequestMapping(value = "person.html", method = RequestMethod.GET)
    public String person_html() {
        return "user/person";
    }

    @RequestMapping(value = "information.html", method = RequestMethod.GET)
    public String information_html() {
        return "user/information";
    }

    @RequestMapping(value = "order.html", method = RequestMethod.GET)
    public String order_html() {
        return "user/order";
    }

    @RequestMapping(value = "orderinfo.html", method = RequestMethod.GET)
    public String orderinfo_html() {
        return "user/orderinfo";
    }

    @RequestMapping(value = "password.html", method = RequestMethod.GET)
    public String password_html() {
        return "user/password";
    }

    @RequestMapping(value = "question.html", method = RequestMethod.GET)
    public String question_html() {
        return "user/question";
    }

    @RequestMapping(value = "record.html", method = RequestMethod.GET)
    public String record_html() {
        return "user/record";
    }

    @RequestMapping(value = "refund.html", method = RequestMethod.GET)
    public String refund_html() {
        return "user/refund";
    }

    @RequestMapping(value = "safety.html", method = RequestMethod.GET)
    public String safety_html() {
        return "user/safety";
    }

    @RequestMapping(value = "setpay.html", method = RequestMethod.GET)
    public String setpay_html() {
        return "user/setpay";
    }

    @RequestMapping(value = "shopcart.html", method = RequestMethod.GET)
    public String shopcart_html() {
        return "home/shopcart";
    }

    @RequestMapping(value = "sort.html", method = RequestMethod.GET)
    public String sort_html() {
        return "home/sort";
    }

    @RequestMapping(value = "success.html", method = RequestMethod.GET)
    public String success_html() {
        return "home/success";
    }

    @RequestMapping(value = "forgetpwd.html", method = RequestMethod.GET)
    public String forgetpwd_html() {
        return "home/forgetpwd";
    }

    //后台商品管理功能页面跳转
    @RequestMapping(value = "product_add.html", method = RequestMethod.GET)
    public String product_add() {
        return "backend/product_add";
    }

    @RequestMapping(value = "picture-add.html", method = RequestMethod.GET)
    public String picture_add(Integer id, HttpSession session) {
        Product product = productMapper.selectByPrimaryKey(id);
        session.setAttribute("product", product);
        return "backend/picture_add";
    }

    @Autowired
    private ProductMapper productMapper;

    @RequestMapping(value = "product_edit.html", method = RequestMethod.GET)
    public String product_edit(Integer id, HttpSession session) {
        Product product = productMapper.selectByPrimaryKey(id);
        session.setAttribute("product", product);
        String[] strings = product.getDetail().split(":::");
        session.setAttribute("StringArray", strings);
        return "backend/product_edit";
    }

    @RequestMapping(value = "picture_show.html", method = RequestMethod.GET)
    public String picture_show(Integer id, HttpSession session) {
        Product product = productMapper.selectByPrimaryKey(id);
        session.setAttribute("product", product);
        String mainImage = product.getMainImage();
        session.setAttribute("mainImage", mainImage);
        String subImages = product.getSubImages();
        session.setAttribute("imgs", subImages);
        return "backend/picture_show";
    }

    @RequestMapping(value = "product_show.html", method = RequestMethod.GET)
    public String product_show(Integer id, HttpSession session) {
        Product product = productMapper.selectByPrimaryKey(id);
        session.setAttribute("product", product);
        String[] strings = product.getDetail().split(":::");
        session.setAttribute("StringArray", strings);
        return "backend/product_show";
    }

}
