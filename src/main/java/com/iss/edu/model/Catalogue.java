package com.iss.edu.model;

import lombok.Data;
import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

/**
 * 课程目录
 */
@Data
@ToString
public class Catalogue {

    // pk
    private int id;
    // 父级ID
    private int pid;
    // 内容
    private String name;
    // 所属课程
    private Course course;
    // 对应课程资源
    private TeachingMaterial material;
    // 是否有子级
    private boolean hasChildren;
    // 所属课程
    private List<Catalogue> children = new ArrayList<>();
    // 排序
    private int sort;

}
