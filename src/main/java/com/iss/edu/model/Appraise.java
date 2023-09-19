package com.iss.edu.model;

import lombok.Data;

import java.util.Date;

/**
 * 课程评价
 */
@Data
public class Appraise {

    // pk
    private int id;
    // 内容
    private String content;
    // 评分
    private int score;
    // 评论者
    private User user;
    // 所属课程
    private Course course;
    // 发表时间
    private Date createTime;

}
