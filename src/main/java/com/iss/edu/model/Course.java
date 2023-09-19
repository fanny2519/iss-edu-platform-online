package com.iss.edu.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * 课程
 */
@Data
public class Course {

    // pk
    private int id;
    // 课程名称
    private String name;
    // 授课老师
    private User teacher;
    // 课程介绍
    private String introduction;
    // 封面
    private String cover;
    //课时
    private String classHour;
    // 是否为私密课程
    private int isPrivate;
    // 课程评价
    private List<Appraise> appraises;
    // 课程目录
    private List<Catalogue> catalogues;
    // 课程资料
    private List<TeachingMaterial> materials;
    // 创建时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    // 修改时间
    private Date updateTime;
}
