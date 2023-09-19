package com.iss.edu.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.ToString;

import java.util.Date;
import java.util.List;

@Data
@ToString
public class Student {

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
    // 是否活动，用于标识数据逻辑删除 >> 0：已删除  1：未删除
    private int isActive;
    // 最后修改时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date lastUpdate;
    // 所属班级
    private List<Class> classes;
    // 课程
    private List<Course> courses;
}
