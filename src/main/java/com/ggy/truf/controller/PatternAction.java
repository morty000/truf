package com.ggy.truf.controller;

import com.ggy.truf.common.ServerResponse;
import com.ggy.truf.util.PatternUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2017/8/25.
 */
@Controller
@RequestMapping("/pattern/")
public class PatternAction {

    @RequestMapping(value = "price.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse pattern_price(@RequestParam(value = "price", required = false) String price) {
        if (!PatternUtil.isDouble(price)) {
            return ServerResponse.createByErrorMessage("输入的价格不合法");
        }
        return ServerResponse.createBySuccess();
    }

    @RequestMapping(value = "stock.do", method = RequestMethod.POST)
    @ResponseBody
    public ServerResponse pattern_stock(@RequestParam(value = "stock", required = false) String stock) {
        if (!PatternUtil.isDouble(stock)) {
            return ServerResponse.createByErrorMessage("输入的库存不合法");
        }
        return ServerResponse.createBySuccess();
    }
}
