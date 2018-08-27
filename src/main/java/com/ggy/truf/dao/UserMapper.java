package com.ggy.truf.dao;

import com.ggy.truf.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    int checkUsername(String username);

    User login(@Param("username") String username, @Param("password") String password);

    int checkEmail(String str);

    User updateUserByCode(String code);

    String selectQuestionByUsername(String username);

    int checkAnswer(@Param("username") String username, @Param("question") String question, @Param("answer") String answer);

    int checkEmailByUserId(@Param("email") String email, @Param("id") Integer id);

    int checkPassword(@Param("password") String password, @Param("id") Integer id);
}