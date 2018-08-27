package com.ggy.truf.util;

import java.util.regex.Pattern;

import javax.swing.JOptionPane;

/**
 * 正则表达式工具类
 * 
 * @author 熊大
 * @version V1.0
 */
public class PatternUtil {

	/**
	 * 正则表达式：验证性别
	 */
	public static final String REGEX_GENDER = "男|女";

	/**
	 * 正则表达式：验证电话号码
	 */
	public static final String REGEX_PHONE = "^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$";

	/**
	 * 正则表达式：验证邮箱
	 */
	public static final String REGEX_EMAIL = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
	
	/**
	 * 正则表达式：验证邮编
	 */
	public static final String POST_NUM = "^[1-9]\\d{5}$";
	
	/**
	 * 正则表达式：验证正浮点数
	 */
	public static final String DOUBLE_NUM = "^(([0-9]+\\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\\.[0-9]+)|([0-9]*[1-9][0-9]*))$";

	/**
	 * 校验性别
	 * 
	 * @param gender
	 * @return 校验通过返回true，否则返回false
	 */
	public static boolean isGender(String gender) {
		return Pattern.matches(REGEX_GENDER, gender);
	}

	/**
	 * 校验手机号
	 * 
	 * @param phone
	 * @return 校验通过返回true，否则返回false
	 */
	public static boolean isPhone(String phone) {
		return Pattern.matches(REGEX_PHONE, phone);
	}

	/**
	 * 校验邮箱
	 * 
	 * @param email
	 * @return 校验通过返回true，否则返回false
	 */
	public static boolean isEmail(String email) {
		return Pattern.matches(REGEX_EMAIL, email);
	}
	
	/**
	 * 验证邮政编码
	 * 
	 * @param postNum
	 * @return 校验通过返回true，否则返回false
	 */
	public static boolean isPostNum(String postNum){
		return Pattern.matches(POST_NUM, postNum);
	}
	
	/**
	 * 验证正浮点数(价格，重量等)
	 * 
	 * @param doubleNum
	 * @return 校验通过返回true，否则返回false
	 */
	public static boolean isDouble(String doubleNum){
		return Pattern.matches(DOUBLE_NUM, doubleNum);
	}
	
	/**
     * 检验银行卡号是否合法
     * 采用Luhn算法检验
     * 校验算法步骤：
     * 1、从卡号最后一位数字开始，逆向将奇数位(1、3、5等等)相加。
     * 2、从卡号最后一位数字开始，逆向将偶数位数字乘以2（如果乘积为两位数，则将其减去9），再求和。
     * 3、将奇数位总和加上偶数位总和，结果应该可以被10整除。
     * 
     * @param bankCardId
     * @return true合法,false不合法
     */
    public static boolean checkBankCardId(String bankCardId){
        if (bankCardId == null)
            return false;
        int length = bankCardId.length();
        if (length < 15 || length > 19) {
            JOptionPane.showMessageDialog(null, "输入的卡号位数有误,银行卡账号在[15,19]位之间");
        	return false;
        }
        int total = 0;
        for (int i = 0; i < length; i++) {
            char c = bankCardId.charAt(length - 1 - i);
            int valueOfChar = Character.getNumericValue(c);
            if ((i + 1) % 2 == 0) { //偶数位
                int temp = valueOfChar * 2;
                temp = temp / 10 + temp % 10;
                total = total + temp;
            } else {
                total = total + valueOfChar;
            }
        }
        return total % 10 == 0;
    }

}
