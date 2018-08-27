package com.ggy.truf.util;


import java.math.BigDecimal;

/**
 * Created by Administrator on 2017/8/16.
 */
public class DoubleUtil {

    private DoubleUtil(){

    }

    public static Double add(Double v1, Double v2){
        BigDecimal b1 = new BigDecimal(Double.toString(v1));
        BigDecimal b2 = new BigDecimal(Double.toString(v2));
        return b1.add(b2).doubleValue();
    }
    public static Double sub(Double v1,Double v2){
        BigDecimal b1 = new BigDecimal(Double.toString(v1));
        BigDecimal b2 = new BigDecimal(Double.toString(v2));
        return b1.subtract(b2).doubleValue();
    }
    //Double类型和Integer类型相乘
    public static Double mul(Double v1,Integer v2){
        BigDecimal b1 = new BigDecimal(Double.toString(v1));
        BigDecimal b2 = new BigDecimal(Integer.toString(v2));
        return b1.multiply(b2).doubleValue();
    }
    /*public static Double div(Double v1,Double v2){
        BigDecimal b1 = new BigDecimal(Double.toString(v1));
        BigDecimal b2 = new BigDecimal(Double.toString(v2));
        return b1.divide(b2,2,BigDecimal.ROUND_HALF_UP).doubleValue();//四舍五入，保留两位小数

        //除不尽的情况
    }*/

}
