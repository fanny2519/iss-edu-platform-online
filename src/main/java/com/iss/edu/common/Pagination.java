package com.iss.edu.common;

import lombok.Data;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
* 分页类
*/

@Data
public class Pagination<T> {

    // 第几页
    private int pageNum = 1;

    // 每页条数
    private int pageSize = 10;

    private int total;

    private List<T> rows = new ArrayList<T>();

    // 根据讲师名称模糊搜索
    private String queryValue;

    public Pagination() {
    }

    public Pagination(int pageNum, int pageSize, int total, List<T> rows) {
        this.pageNum = pageNum;
        this.pageSize = pageSize;
        this.total = total;
        this.rows = rows;
    }

    public Pagination(int total, List<T> rows) {
        this.total = total;
        this.rows = rows;
    }

}
