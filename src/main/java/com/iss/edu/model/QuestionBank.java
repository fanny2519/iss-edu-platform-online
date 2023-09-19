package com.iss.edu.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class QuestionBank {
    private int id;
    private String name;
    private String signature;
    // 是否活动，用于标识数据逻辑删除 >> 0：已删除  1：未删除
    private int isActive;
    // 最后修改时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date lastUpdate;
}
