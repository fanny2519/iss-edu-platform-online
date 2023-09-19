package com.iss.edu.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface IndexDao {

    Map<String, Object> getTotals();
}
