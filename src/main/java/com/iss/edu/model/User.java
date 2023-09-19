package com.iss.edu.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.ToString;

import java.util.Date;
import java.util.List;

/**
 * 用户：管理员、学生、教师
 */
@Data
@ToString
public class User {

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
    // 是否活动，用于标识数据逻辑删除 >> 0：已删除  1：未删除
    private int isActive;
    // 操作人
    private String operator;
    // 最后修改时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date lastUpdate;
    // 所属班级
    private List<Class> classes;
    // 课程
    private List<Course> courses;

    public User() {
    }

    public User(String username, String nickname, String password, String sex, String phone, String email, String qqNumber) {
        this.username = username;
        this.nickname = nickname;
        this.password = password;
        this.sex = "男".equals(sex) ? 1 : 0;
        this.phone = phone;
        this.email = email;
    }
}
