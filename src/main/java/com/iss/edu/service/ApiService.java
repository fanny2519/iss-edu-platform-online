package com.iss.edu.service;

import com.iss.edu.common.ApiResult;
import com.iss.edu.model.Catalogue;
import com.iss.edu.model.Course;
import com.iss.edu.model.vo.CatalogueVO;

import java.util.List;
import java.util.Map;

public interface ApiService {

    ApiResult getCourses(int pageNum, int pageSize);

    ApiResult getClasses(int pageNum, int pageSize);

    List<CatalogueVO> getCatalogues(int pid, int courseId);

}
