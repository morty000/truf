package com.ggy.truf.service.impl;

import com.ggy.truf.common.Const;
import com.ggy.truf.common.ServerResponse;
import com.ggy.truf.common.TokenCache;
import com.ggy.truf.dao.UserMapper;
import com.ggy.truf.pojo.User;
import com.ggy.truf.service.UserService;
import com.ggy.truf.util.MD5Util;
import com.ggy.truf.util.MailUitls;
import com.ggy.truf.util.PatternUtil;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

/**
 * Created by Administrator on 2017/8/9.
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public ServerResponse<User> login(String username, String password) {
        int resultCount = userMapper.checkUsername(username);
        if (resultCount == 0) {
            return ServerResponse.createByErrorMessage("用户不存在");
        }
        String md5Password = MD5Util.MD5EncodeUtf8(password);
        User user = userMapper.login(username, md5Password);
        if (user == null) {
            return ServerResponse.createByErrorMessage("密码错误");
        }
        if (user.getStatus() == 0) {
            return ServerResponse.createByErrorMessage("用户未激活");
        }
        user.setPassword(org.apache.commons.lang3.StringUtils.EMPTY);
        return ServerResponse.createBySuccess("登录成功", user);
    }

    @Override
    public ServerResponse<User> register(User user) {
        ServerResponse validResponse = this.checkValid(user.getUsername(), Const.USERNAME);
        if (!validResponse.isSuccess()) {
            return validResponse;
        }
        validResponse = this.checkValid(user.getEmail(), Const.EMAIL);
        if (!validResponse.isSuccess()) {
            return validResponse;
        }
        validResponse = this.checkValid(user.getPassword(), Const.PASSWORD);
        if (!validResponse.isSuccess()) {
            return validResponse;
        }
        user.setRole(Const.Role.ROLE_CUSTOMER);
        //MD5校验
        user.setPassword(MD5Util.MD5EncodeUtf8(user.getPassword()));
        user.setCode(UUID.randomUUID().toString().replace("-", "") + MD5Util.MD5EncodeUtf8(System.currentTimeMillis() + ""));
        int resultCount = userMapper.insert(user);
        if (resultCount == 0) {
            return ServerResponse.createByErrorMessage("注册失败");
        }
        return ServerResponse.createBySuccessMessage("注册成功");
    }

    @Override
    public ServerResponse<String> checkValid(String str, String type) {
        if (org.apache.commons.lang3.StringUtils.isNotBlank(type)) {
            //开始校验
            if (Const.USERNAME.equals(type)) {
                int resultCount = userMapper.checkUsername(str);
                if (resultCount > 0) {
                    return ServerResponse.createByErrorMessage("用户名已存在");
                } else if (str.length() < 4) {
                    return ServerResponse.createByErrorMessage("用户名长度不能小于5个字节");
                }
            }
            if (Const.EMAIL.equals(type)) {
                int resultCount = userMapper.checkEmail(str);
                if (resultCount > 0) {
                    return ServerResponse.createByErrorMessage("email已存在");
                }
                if (!PatternUtil.isEmail(str)) {
                    return ServerResponse.createByErrorMessage("email格式错误");
                }
            }
            if (Const.PASSWORD.equals(type)) {
                if (str.length() < 6) {
                    return ServerResponse.createByErrorMessage("密码长度必须大于6个字节");
                }
            }
        } else {
            return ServerResponse.createByErrorMessage("参数错误");
        }
        return ServerResponse.createBySuccessMessage("校验成功");
    }

    /**
     * 校验是否是管理员
     *
     * @param user
     * @return
     */
    @Override
    public ServerResponse checkAdminRole(User user) {
        if (user != null && user.getRole().intValue() == Const.Role.ROLE_ADMIN) {
            return ServerResponse.createBySuccess();
        }
        return ServerResponse.createByError();
    }

    @Override
    public ServerResponse updateUserByCode(String code) {
        User user = userMapper.updateUserByCode(code);
        if (user == null) {
            return ServerResponse.createByErrorMessage("参数错误，无法完成激活");
        } else {
            user.setStatus(1);
            userMapper.updateByPrimaryKeySelective(user);
        }
        return ServerResponse.createBySuccessMessage("激活成功");
    }

    @Override
    public ServerResponse send_email(String email, String code) {
        return MailUitls.sendMail(email, code);
    }

    @Override
    public User getUser(String username, String password) {
        return userMapper.login(username, password);
    }

	@Override
	public ServerResponse selectQuestion(String username) {
		ServerResponse validResponse = this.checkValid(username, Const.USERNAME);
		if(validResponse.isSuccess()){
			return ServerResponse.createByErrorMessage("用户不存在");
		}
		String question = userMapper.selectQuestionByUsername(username);
		if(StringUtils.isNotBlank(question)){
			return ServerResponse.createBySuccess(question);
		}
		return ServerResponse.createByErrorMessage("找回密码的问题是空的");
	}

	@Override
	public ServerResponse<String> checkAnswer(String username, String question, String answer) {
		int resultCount = userMapper.checkAnswer(username, question, answer);
		if(resultCount > 0){
			String forgetToken = UUID.randomUUID().toString();
			TokenCache.setKey(TokenCache.TOKEN_PREFIX+username,forgetToken);
			return ServerResponse.createBySuccess(forgetToken);
		}
		
		return ServerResponse.createByErrorMessage("问题的答案错误");
	}

	@Override
	public ServerResponse<User> updateInformation(User user) {
		int resultCount = userMapper.checkEmailByUserId(user.getEmail(),user.getId());
        if(resultCount > 0){
            return ServerResponse.createByErrorMessage("email已存在,请更换email再尝试更新");
        }
        User updateUser = new User();
        updateUser.setId(user.getId());
        updateUser.setEmail(user.getEmail());
        updateUser.setPhone(user.getPhone());
        updateUser.setQuestion(user.getQuestion());
        updateUser.setAnswer(user.getAnswer());

        int updateCount = userMapper.updateByPrimaryKeySelective(updateUser);
        if(updateCount > 0){
            return ServerResponse.createBySuccess("更新个人信息成功",updateUser);
        }
        return ServerResponse.createByErrorMessage("更新个人信息失败");
    }

	@Override
	public ServerResponse<User> getInformation(Integer userId) {
		User user = userMapper.selectByPrimaryKey(userId);
        if(user == null){
            return ServerResponse.createByErrorMessage("找不到当前用户");
        }
        user.setPassword(org.apache.commons.lang3.StringUtils.EMPTY);
        return ServerResponse.createBySuccess(user);
	}

	@Override
	public ServerResponse<String> resetPassword(String passwordOld, String passwordNew, User user) {
		int resultCount = userMapper.checkPassword(MD5Util.MD5EncodeUtf8(passwordOld),user.getId());
        if(resultCount == 0){
            return ServerResponse.createByErrorMessage("旧密码错误");
        }

        user.setPassword(MD5Util.MD5EncodeUtf8(passwordNew));
        int updateCount = userMapper.updateByPrimaryKeySelective(user);
        if(updateCount > 0){
            return ServerResponse.createBySuccessMessage("密码更新成功");
        }
        return ServerResponse.createByErrorMessage("密码更新失败");
	}

}
