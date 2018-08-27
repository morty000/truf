package com.ggy.truf.service;

import com.ggy.truf.common.ServerResponse;
import com.ggy.truf.pojo.User;

/**
 * Created by Administrator on 2017/8/9.
 */
public interface UserService {

    ServerResponse<User> login(String username, String password);

    ServerResponse<User> register(User user);

    ServerResponse<String> checkValid(String str, String type);

    ServerResponse<User> checkAdminRole(User user);

    ServerResponse updateUserByCode(String code);

    ServerResponse send_email(String email, String code);

    User getUser(String username, String password);
    
    ServerResponse selectQuestion(String username);
    
    ServerResponse<String> checkAnswer(String username,String question,String answer);

	ServerResponse<User> updateInformation(User user);
	
	ServerResponse<User> getInformation(Integer userId);
	
	ServerResponse<String> resetPassword(String passwordOld,String passwordNew,User user);
}
