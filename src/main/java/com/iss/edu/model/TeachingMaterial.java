package com.iss.edu.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

/**
 * 课程资料
 */
@Data
public class TeachingMaterial {

    // pk
    private int id;
    // 资料名称
    private String name;
    // 所属课程
    private Course course;
    // 文件路径
    private String path;
    // 创建时间
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    // 修改时间
    private Date updateTime;

}
