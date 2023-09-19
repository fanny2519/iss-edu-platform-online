package com.iss.edu.dao;


import com.iss.edu.model.*;
import com.iss.edu.model.vo.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Mapper
public interface ApiDao {

    /**
     * 学生用户登录
     * PC前端、Mobile前端
     */
    StudentVO studentLogin(String username, String password);

    /**
     * 系统管理员、教师用户登录
     * PC前端
     */
    User userLogin(String username, String password);

    /**
     * 根据ID获得学生信息
     * PC前端、Mobile前端
     */
    Map<String, Object> getStudent(int id);

    /**
     * 根据ID获得教师信息
     * PC前端
     */
    Map<String, Object> getTeacher(int id);

    /**
     * 修改密码
     * PC前端、Mobile前端
     */
    int updatePassword(String username, String password);

    /**
     * 判断学生用户名是否存在
     * PC前端、Mobile前端
     */
    int existStudent(String username);

    /**
     * 学生信息注册
     * PC前端、Mobile前端
     */
    int register(Student student);

    /**
     * 学生信息修改
     * PC前端、Mobile前端
     */
    int updateStudent(Student student);

    /**
     * 根据学生ID获得该学生所学课程
     * PC前端、Mobile前端
     */
    List<Map<String, Object>> getCourseByStudentId(int id);

    /**
     * 根据学生ID获得该学生所在班级
     * PC前端、Mobile前端
     */
    List<MyClassesVO> getClassesByStudentId(int id);

    /**
     * 全部课程(分页)
     * PC前端、Mobile前端
     */
    List<Map<String, Object>> getCourses(int start, int pageSize);

    /**
     * 热门课程
     * Mobile前端
     */
    List<Map<String, Object>> getHotCourses();

    /**
     * 全部班级(分页)
     * PC前端、Mobile前端
     */
    List<ClassVO> getClasses(int start, int pageSize);

    /**
     * 热门班级
     * Mobile前端
     */
    List<Map<String, Object>> getHotClasses();

    /**
     * 根据课程ID获得课程详情
     * PC前端、Mobile前端
     */
    Map<String, Object> getCourse(int id);

    /**
     * 根据班级ID获得班级详情
     * PC前端、Mobile前端
     */
    Map<String, Object> getClass(int id);


    /**
     * 根据课程ID获得课程章节目录
     * PC前端、Mobile前端
     */
    List<CatalogueVO> getCatalogues(@Param("pid") int pid, @Param("courseId") int courseId);

    /**
     * 开始学习，向learning表增加学习记录
     * PC前端、Mobile前端
     */
    int startStudy(@Param("studentId") int studentId, @Param("courseId") int courseId);

    /**
     * 统计课程总数
     */
    int countCourse();

    /**
     * 统计班级总数
     */
    int countClasses();

    /**
     * 获得学习计划
     */
    List<ClassPlanVO> getClassPlans(int id);

    /**
     * 增加学习计划
     */
    int insertPlan(@Param("id") int id, @Param("planDate") Date planDate, @Param("plans") List<ClassPlan> plans);

    /**
     * 删除学习计划
     */
    int deletePlan(int[] ids);

}
