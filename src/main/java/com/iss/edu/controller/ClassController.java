package com.iss.edu.controller;

import com.google.gson.Gson;
import com.iss.edu.common.Pagination;
import com.iss.edu.common.ResultModel;
import com.iss.edu.dao.ClassDao;
import com.iss.edu.model.Class;
import com.iss.edu.model.User;
import com.iss.edu.model.vo.ClassPlanVO;
//import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/class")
public class ClassController {
//    private final static Logger logger = Logger.getLogger(ClassController.class);
    @Autowired
    private ClassDao classDao;

    @GetMapping("/getPage")
    public Pagination<Class> getPage(Pagination page) {
//        logger.info("...ClassController.getPage GET  start ... ..... ..... ..... ..... ..... ..... ..... ........"+ new Gson().toJson(page));
        int start = (page.getPageNum() - 1) * page.getPageSize();
        page.setRows(this.classDao.getPage(start, page.getPageSize(), page.getQueryValue()));
        page.setTotal(this.classDao.getCount());
        return page;
    }

    @GetMapping("/getClass/{id}")
    public Class getClass(@PathVariable("id") int id) {
        return this.classDao.getClass(id);
    }

    @PostMapping("/insertClass")
    public ResultModel insertClass(@RequestBody Class clazz) {
        int result = this.classDao.insertClass(clazz);
        if (result > 0 && clazz.getTeachers() != null && clazz.getTeachers().size() > 0) {
            result = this.classDao.linkClassMaster(clazz.getId(), clazz.getTeachers());
            if (result < 1) return ResultModel.error();
        }
        return ResultModel.isSuccess(result > 0);
    }

    @PostMapping("/updateClass")
    public ResultModel updateClass(@RequestBody Class clazz) {
        int result = this.classDao.updateClass(clazz);
        if (result > 0 && clazz.getTeachers() != null && clazz.getTeachers().size() > 0) {
            return this.updateUserClasses(clazz.getId(), clazz.getTeachers());
        }
        return ResultModel.error();
    }

    private ResultModel updateUserClasses(int id, List<User> teachers) {
        int result = this.classDao.deleteUserClass(id);
        if (result >= 0) {
            result = this.classDao.linkClassMaster(id, teachers);
            if (result > 0) return ResultModel.isSuccess(result > 0);
        }
        return ResultModel.error();
    }

    @GetMapping("/delete/{id}")
    public ResultModel delete(@PathVariable("id") int id) {
        return ResultModel.isSuccess(this.classDao.delete(id) > 0);
    }

    @GetMapping("/deletes")
    public ResultModel deletes(int[] ids) {
        return ResultModel.isSuccess(this.classDao.deletes(ids) > 0);
    }

    @GetMapping("/linkCourses/{classId}/{courseIds}")
    public ResultModel linkCourses(@PathVariable("classId") int classId, @PathVariable("courseIds") Integer[] courseIds) {
        this.classDao.deleteClassCourse(classId);
        return ResultModel.isSuccess(this.classDao.linkCourses(classId, courseIds) > 0);
    }

    @GetMapping("/getTransfer")
    public List<Map<String, Object>> getTransfer() {
        return this.classDao.getTransfer();
    }


    @GetMapping("/getClassPlans/{id}")
    public List<ClassPlanVO> getClassPlans(@PathVariable("id") int id) {
        return this.classDao.getClassPlans(id);
    }

    @GetMapping("/deletePlan")
    public ResultModel deletePlan(int[] ids) {
        return ResultModel.isSuccess(this.classDao.deletePlan(ids) > 0);
    }

    @PostMapping("/insertPlan")
    public ResultModel insertPlan(@RequestBody ClassPlanVO planVO) throws ParseException {
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse(planVO.getPlanDate());
        return ResultModel.isSuccess(this.classDao.insertPlan(planVO.getId(), date, planVO.getPlans()) > 0);
    }
}
