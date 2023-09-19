package com.iss.edu.model.vo;

import lombok.Data;

@Data
public class UserVO {

    // pk
    private int id;
    // 用户名
    private String username;
    // 昵称
    private String nickname;
    //密码
    private String password;
    // 性别
    private int sex;
    // 手机
    private String phone;
    // 邮箱
    private String email;
    // 级别 >> 1：初级讲师 2：中级讲师 3：高级讲师
    private int level;
    // 照骗
    private String photo;
    // 简介
    private String introduction;
    // 角色 >> 0：管理员  2：老师
    private int role;
}
