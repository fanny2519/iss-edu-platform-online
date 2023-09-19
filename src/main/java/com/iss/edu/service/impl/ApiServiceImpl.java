package com.iss.edu.service.impl;

import com.iss.edu.common.ApiResult;
import com.iss.edu.common.Pagination;
import com.iss.edu.dao.ApiDao;
import com.iss.edu.model.Catalogue;
import com.iss.edu.model.vo.CatalogueVO;
import com.iss.edu.model.vo.ClassVO;
import com.iss.edu.service.ApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ApiServiceImpl implements ApiService {

    @Autowired
    private ApiDao apiDao;

    @Override
    public ApiResult getCourses(int pageNum, int pageSize) {
        int start = (pageNum - 1) * pageSize;
        List<Map<String, Object>> list = this.apiDao.getCourses(start, pageSize);
        int total = this.apiDao.countCourse();
        Pagination page = new Pagination(pageNum, pageSize, total, list);
        return list.size() > 0 ? ApiResult.success(page) : ApiResult.failure("查询失败");
    }

    @Override
    public ApiResult getClasses(int pageNum, int pageSize) {
        int start = (pageNum - 1) * pageSize;
        List<ClassVO> list = this.apiDao.getClasses(start, pageSize);
        int total = this.apiDao.countClasses();
        Pagination page = new Pagination(pageNum, pageSize, total, list);
        return list.size() > 0 ? ApiResult.success(page) : ApiResult.failure("查询失败");
    }

    @Override
    public List<CatalogueVO> getCatalogues(int pid, int courseId) {
        List<CatalogueVO> list = this.apiDao.getCatalogues(pid, courseId);
        for (CatalogueVO catalogueVO : list) {
            if (catalogueVO.isHasChildren()) {
                catalogueVO.setChildren(getCatalogues(catalogueVO.getId(), courseId));
            }
        }
        return list;
    }
}
