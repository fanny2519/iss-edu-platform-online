package com.iss.edu.model.vo;

import lombok.Data;

import java.util.List;

@Data
public class MyClassesVO {

    private int id;
    private String className;
    private String cover;
    private List<String> teachers;
}
