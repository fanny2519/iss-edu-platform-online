package com.iss.edu.model.vo;

import lombok.Data;

@Data
public class StudentVO {

    // pk
    private int id;
    // 用户名
    private String username;
    // 昵称
    private String nickname;
    //密码
    private String password;
    // 学号
    private String stuNumber;
    // 性别
    private int sex;
    // 手机
    private String phone;
    // 邮箱
    private String email;
    // QQ
    private String qqNumber;
    // 身份证
    private String identityCard;
    // 照骗
    private String photo;
    // 个性签名
    private String signature;
    // 简介
    private String introduction;

}
