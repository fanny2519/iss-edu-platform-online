package com.iss.edu.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * 班级
 */
@Data
public class Class {

    // pk
    private int id;
    // 班级名称
    private String name;
    // 是否为私密班级
    private int isPrivate;
    // 封面
    private String cover;
    // 简介
    private String signature;
    // 是否活动，用于标识数据逻辑删除 >> 0：已删除  1：未删除
    private int isActive;
    // 班级人数
    private int studentNum;
    // 授课老师
    private List<User> teachers;
    // 创建时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    // 修改时间
    private Date updateTime;


    public Class() {
    }

    public Class(int id) {
        this.id = id;
    }

}
