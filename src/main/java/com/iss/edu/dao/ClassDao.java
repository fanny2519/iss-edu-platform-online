package com.iss.edu.dao;

import com.iss.edu.model.ClassPlan;
import com.iss.edu.model.User;
import com.iss.edu.model.vo.ClassPlanVO;
import org.apache.ibatis.annotations.Mapper;

import com.iss.edu.model.Class;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Map;
@Repository
@Mapper
public interface ClassDao {

    /**
     * 班级分页查询
     *
     * @param start      起始量
     * @param pageSize   偏移量
     * @param queryValue 查询条件
     * @return list 分页结果集
     */
    List<Class> getPage(@Param("start") Integer start, @Param("pageSize") Integer pageSize, @Param("queryValue") String queryValue);

    /**
     * 根据ID查询
     *
     * @param id 主键
     * @return clazz 班级对象
     */
    Class getClass(int id);

    /**
     * 分页统计记录数
     *
     * @return int 记录数
     */
    int getCount();

    /**
     * 新增班级数据
     *
     * @param clazz 班级对象
     * @return int 数据库受影响条数
     */
    int insertClass(Class clazz);

    /**
     * 修改班级数据
     *
     * @param clazz 班级对象
     * @return int 数据库受影响条数
     */
    int updateClass(Class clazz);

    /**
     * 删除班级数据，逻辑删除
     *
     * @param id 主键
     * @return int 数据库受影响条数
     */
    int delete(int id);

    /**
     * 批量删除班级数据，逻辑删除
     *
     * @param ids 主键数组
     * @return int 数据库受影响条数
     */
    int deletes(@Param("ids")int[] ids);

    /**
     * 为指定班级关联课程
     *
     * @param id        主键
     * @param courseIds 课程主键ID数组
     * @return int 数据库受影响条数
     */
    int linkCourses(@Param("id") int id, @Param("courseIds") Integer[] courseIds);

    /**
     * 为指定班级添加班主任
     *
     * @param id       主键
     * @param teachers 班主任对象集合
     * @return int 数据库受影响条数
     */
    int linkClassMaster(@Param("id") int id, @Param("teachers") List<User> teachers);

    /**
     * 删除user_class中间表中指定班级所关联的所有班主任（role=2)
     *
     * @param id 主键
     * @return int 数据库受影响条数
     */
    int deleteUserClass(int id);

    /**
     * 前端班级数据穿梭框查询
     *
     * @return
     */
    List<Map<String, Object>> getTransfer();

    /**
     * 删除 class_course 中间表中指定班级所关联的所有课程记录
     *
     * @param id 主键
     * @return int 数据库受影响条数
     */
    int deleteClassCourse(int id);

    List<ClassPlanVO> getClassPlans(int id);

    int insertPlan(@Param("id") int id, @Param("planDate") Date planDate, @Param("plans") List<ClassPlan> plans);

    int deletePlan(int[] ids);

}
