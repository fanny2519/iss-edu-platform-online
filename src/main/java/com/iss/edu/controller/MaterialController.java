package com.iss.edu.controller;

import com.iss.edu.dao.MaterialDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/material")
public class MaterialController {

    @Autowired
    private MaterialDao materialDao;

    @GetMapping("/getMaterialsByCourseId/{id}")
    public List<Map<String, Object>> getMaterialsByCourseId(@PathVariable("id") int courseId) {
        return this.materialDao.getMaterialsByCourseId(courseId);
    }

}
