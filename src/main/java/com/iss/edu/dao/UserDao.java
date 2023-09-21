package com.iss.edu.dao;

import com.iss.edu.model.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserDao {

    /**
     * 登录
     *
     * @return user 对象
     */
    User login(@Param("username") String username, @Param("password") String password);



    /**
     * 获得所有的教师数据集
     *
     * @return list 教师数据集
     */
    List<Map<String, Object>> getTeachers();


    List<User> getPage(@Param("start") Integer start, @Param("pageSize") Integer pageSize, @Param("queryValue") String queryValue);

    int getCount(String queryValue);

    // 删除讲师信息
    int delete(int id);

    // 批量删除讲师信息
    int deletes(int[] ids);


    // 新增
    int insertUser(User user);

    List<Map<String, Object>> getTransfer();

    User getUser(int id);

    int updateUser(User user);
}
