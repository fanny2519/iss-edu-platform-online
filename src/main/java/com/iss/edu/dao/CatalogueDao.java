package com.iss.edu.dao;

import com.iss.edu.model.Catalogue;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CatalogueDao {

    /**
     * 新增课程资料
     *
     * @param catalogue 章节对象
     * @return int 数据库受影响条数
     */
    int insertCatalogue(Catalogue catalogue);

    /**
     * 根据课程ID、章节父ID查询子章节
     *
     * @param pid      章节父ID
     * @param courseId 课程ID
     * @return
     */
    List<Catalogue> getCatalogues(@Param("pid") int pid, @Param("courseId") int courseId);

    /**
     * 根据课程ID、章节ID级联删除该章节及其子章节
     *
     * @param id       章节父ID
     * @param courseId 课程ID
     * @return
     */
    int deleteCatalogue(@Param("id") int id, @Param("courseId") int courseId);

    /**
     * 关联该章节所对应的课程资源
     *
     * @param catalogue
     * @return
     */
    int linkMaterials(Catalogue catalogue);
}
