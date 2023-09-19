package com.iss.edu.controller;

import com.iss.edu.common.Pagination;
import com.iss.edu.common.ResultModel;
import com.iss.edu.dao.CourseDao;
import com.iss.edu.dao.MaterialDao;
import com.iss.edu.model.Course;
import com.iss.edu.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/course")
public class CourseController {

    @Autowired
    private CourseDao courseDao;

    @Autowired
    private MaterialDao materialDao;

    @GetMapping("/getPage")
    public Pagination<User> getPage(Pagination page) {
        int start = (page.getPageNum() - 1) * page.getPageSize();
        page.setRows(this.courseDao.getPage(start, page.getPageSize(), page.getQueryValue()));
        page.setTotal(this.courseDao.getCount(page.getQueryValue()));
        return page;
    }

    @GetMapping("/getCourse/{id}")
    public Course getCourse(@PathVariable("id") int id) {
        return this.courseDao.getCourse(id);
    }

    @GetMapping("/getTransfer")
    public List<Map<String, Object>> getTransfer() {
        return this.courseDao.getTransfer();
    }

    @PostMapping("/insertCourse")
    public ResultModel insertCourse(@RequestBody Course course) {
        int result = this.courseDao.insertCourse(course);
        if (result > 0 && course.getMaterials() != null && course.getMaterials().size() > 0) {
            result = this.materialDao.insertMaterials(course.getId(), course.getMaterials());
            if (result < 1) return ResultModel.error();
        }
        return ResultModel.isSuccess(result > 0);
    }

    @PostMapping("/updateCourse")
    public ResultModel updateCourse(@RequestBody Course course) {
        int result = this.courseDao.updateCourse(course);
        if (result > 0 && course.getMaterials() != null && course.getMaterials().size() > 0) {
            result = this.materialDao.insertMaterials(course.getId(), course.getMaterials());
            if (result < 1) return ResultModel.error();
        }
        return ResultModel.isSuccess(result > 0);
    }

    @PostMapping("/uploadMaterials")
    public ResultModel uploadMaterials(@RequestBody Course course) {
        return ResultModel.isSuccess(this.materialDao.insertMaterials(course.getId(), course.getMaterials()) > 0);
    }

    @GetMapping("/delete/{id}")
    public ResultModel delete(@PathVariable("id") int id) {
        return ResultModel.isSuccess(this.courseDao.delete(id) > 0);
    }

    @GetMapping("/deletes")
    public ResultModel deletes(int[] ids) {
        return ResultModel.isSuccess(this.courseDao.deletes(ids) > 0);
    }

    @GetMapping("/getCoursesByClassId/{classId}")
    public int[] getCoursesByClassId(@PathVariable("classId") int classId) {
        return this.courseDao.getCoursesByClassId(classId);
    }
}
