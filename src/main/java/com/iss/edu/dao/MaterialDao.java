package com.iss.edu.dao;

import com.iss.edu.model.TeachingMaterial;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MaterialDao {

    /**
     * 新增课程资料
     *
     * @param material 课程资料对象
     * @return int 数据库受影响条数
     */
    int insertMaterial(TeachingMaterial material);

    /**
     * 新增课程数据
     *
     * @param courseId  课程ID
     * @param materials 课程资料集合
     * @return int 数据库受影响条数
     */
    int insertMaterials(int courseId, List<TeachingMaterial> materials);

    /**
     * 根据课程ID获得该课程所有的资料
     *
     * @param courseId
     * @return
     */
    List<Map<String, Object>> getMaterialsByCourseId(int courseId);
}
