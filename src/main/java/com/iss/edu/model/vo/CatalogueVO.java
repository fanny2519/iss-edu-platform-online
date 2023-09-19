package com.iss.edu.model.vo;

import com.iss.edu.model.Catalogue;
import com.iss.edu.model.Course;
import com.iss.edu.model.TeachingMaterial;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class CatalogueVO {

    // pk
    private int id;
    // 父级ID
    private int pid;
    // 内容
    private String name;
    // 排序
    private int sort;
    // 是否有子级
    private boolean hasChildren;
    // 所属课程
    private List<CatalogueVO> children = new ArrayList<>();
    // 对应课程资源
    private TeachingMaterial material;
}
