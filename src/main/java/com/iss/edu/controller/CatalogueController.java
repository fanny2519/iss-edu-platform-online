package com.iss.edu.controller;

import com.iss.edu.common.ResultModel;
import com.iss.edu.dao.CatalogueDao;
import com.iss.edu.model.Catalogue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/catalogue")
public class CatalogueController {

    @Autowired
    private CatalogueDao catalogueDao;

    @GetMapping("/getCatalogues/{pid}/{courseId}")
    public List<Catalogue> getCatalogues(@PathVariable("pid") int pid, @PathVariable("courseId") int courseId) {
        return this.catalogueDao.getCatalogues(pid, courseId);
    }

    @PostMapping("/insertCatalogue")
    public ResultModel insertCatalogue(@RequestBody Catalogue catalogue) {
        int result = this.catalogueDao.insertCatalogue(catalogue);
        return result > 0 ? ResultModel.success(catalogue) : ResultModel.error();
    }

    @GetMapping("/deleteCatalogue/{id}/{courseId}")
    public ResultModel deleteCatalogue(@PathVariable("id") int id, @PathVariable("courseId") int courseId) {
        return ResultModel.isSuccess(this.catalogueDao.deleteCatalogue(id, courseId) > 0);
    }

    @PostMapping("/linkMaterials")
    public ResultModel linkMaterials(@RequestBody Catalogue catalogue) {
        return ResultModel.isSuccess(this.catalogueDao.linkMaterials(catalogue) > 0);
    }
}
