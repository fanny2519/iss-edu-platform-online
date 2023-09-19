package com.iss.edu.dao;

import com.iss.edu.model.Course;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface CourseDao {

    /**
     * 课程分页查询
     *
     * @param start      起始量
     * @param pageSize   偏移量
     * @param queryValue 查询条件
     * @return list 分页结果集
     */
    List<Course> getPage(@Param("start") Integer start, @Param("pageSize") Integer pageSize, @Param("queryValue") String queryValue);

    /**
     * 根据ID查询
     *
     * @param id 主键
     * @return course 课程对象
     */
    Course getCourse(int id);

    /**
     * 分页统计记录数
     *
     * @param queryValue 查询条件
     * @return int 记录数
     */
    int getCount(String queryValue);

    /**
     * 新增课程数据
     *
     * @param course 课程对象
     * @return int 数据库受影响条数
     */
    int insertCourse(Course course);

    /**
     * 修改课程数据
     *
     * @param course 课程对象
     * @return int 数据库受影响条数
     */
    int updateCourse(Course course);

    /**
     * 删除课程数据，逻辑删除
     *
     * @param id 主键
     * @return int 数据库受影响条数
     */
    int delete(int id);

    /**
     * 批量删除课程数据，逻辑删除
     *
     * @param ids 主键数组
     * @return int 数据库受影响条数
     */
    int deletes(int[] ids);

    /**
     * 前端课程数据穿梭框查询
     *
     * @return
     */
    List<Map<String, Object>> getTransfer();

    /**
     * 根据班级ID查询该班级所关联的课程主键数组
     *
     * @param classId 班级ID
     * @return int[] 课程主键数组
     */
    int[] getCoursesByClassId(int classId);
}
