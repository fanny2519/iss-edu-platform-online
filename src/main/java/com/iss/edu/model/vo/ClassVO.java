package com.iss.edu.model.vo;

import lombok.Data;

import java.util.List;

@Data
public class ClassVO {

    private int id;
    private String className;
    private String createTime;
    private String cover;
    private String signature;
    private int isPrivate;
    private List<String> teachers;
    private int studentNum;
}
