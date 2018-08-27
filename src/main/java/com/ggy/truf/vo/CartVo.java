package com.ggy.truf.vo;

import java.util.List;

/**
 * Created by Administrator on 2017/8/16.
 */
public class CartVo {

   private List<CartProductVo> cartProductVoList;
    private Double cartTotalrice;
    private Boolean allChecked;//是否已经都勾选
    private String imageHost;

    public List<CartProductVo> getCartProductVoList() {
        return cartProductVoList;
    }

    public void setCartProductVoList(List<CartProductVo> cartProductVoList) {
        this.cartProductVoList = cartProductVoList;
    }

    public Double getCartTotalrice() {
        return cartTotalrice;
    }

    public void setCartTotalrice(Double cartTotalrice) {
        this.cartTotalrice = cartTotalrice;
    }

    public Boolean getAllChecked() {
        return allChecked;
    }

    public void setAllChecked(Boolean allChecked) {
        this.allChecked = allChecked;
    }

    public String getImageHost() {
        return imageHost;
    }

    public void setImageHost(String imageHost) {
        this.imageHost = imageHost;
    }
}
