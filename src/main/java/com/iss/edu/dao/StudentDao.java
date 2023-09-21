package com.iss.edu.dao;

import com.iss.edu.model.Class;
import com.iss.edu.model.Student;
import com.iss.edu.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface StudentDao {

    /**
     * 根据学生的分页查询
     *
     * @param start      起始量
     * @param pageSize   偏移量
     * @param queryValue 查询条件
     * @return
     */
    List<Student> getPage(@Param("start") Integer start, @Param("pageSize") Integer pageSize, @Param("queryValue") String queryValue);

    /**
     * 分页统计记录数
     *
     * @param queryValue 查询条件
     * @return int 记录数
     */
    int getCount(String queryValue);

    /**
     * 根据ID查询
     *
     * @param id 主键
     * @return Student 学生对象
     */
    Student getStudent(int id);

    /**
     * 新增学生数据
     *
     * @param student 学生对象
     * @return int 数据库受影响条数
     */
    int insertStudent(Student student);

    /**
     * 修改学生数据
     *
     * @param student 学生对象
     * @return int 数据库受影响条数
     */
    int updateStudent(Student student);

    /**
     * 删除学生数据，逻辑删除
     *
     * @param id 主键
     * @return int 数据库受影响条数
     */
    int delete(int id);

    /**
     * 批量删除学生数据，逻辑删除
     *
     * @param ids 主键数组
     * @return int 数据库受影响条数
     */
    int deletes(@Param("ids")int[] ids);

    /**
     * 为指定学生添加班级信息
     *
     * @param id      主键
     * @param classes 班级信息集合
     * @return int 数据库受影响条数
     */
    int insertStudentClass(@Param("id") int id, @Param("classes") List<Class> classes);

    /**
     * 删除user_class中间表中指定学生所关联的所有班级信息
     *
     * @param id 主键
     * @return int 数据库受影响条数
     */
    int deleteStudentClass(int id);

    /**
     * 根据学生ID查询该学生所属班级
     *
     * @param id 主键
     * @return list 班级主键集合
     */
    List<Integer> getClassesById(int id);

    /**
     * 批量导入
     *
     * @param list 学生信息集合
     * @return int 数据库受影响条数
     */
    int importStudents(List<Student> list);
}
