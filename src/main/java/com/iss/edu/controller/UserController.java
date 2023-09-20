package com.iss.edu.controller;

import com.iss.edu.common.Pagination;
import com.iss.edu.common.ResultModel;
import com.iss.edu.dao.UserDao;
import com.iss.edu.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserDao userDao;

    @GetMapping("/getTeachers")
    public List<Map<String, Object>> getUsers() {
        return this.userDao.getTeachers();
    }


    // 示例：http://localhost:8080/edu-platform/background/user/getPage?pageNum=1&pageSize=5&queryValue=
    // 获取页面
    @GetMapping("/getPage")
    public Pagination<User> getPage(Pagination page) {
        int start = (page.getPageNum() - 1) * page.getPageSize();
        List<User> rows = this.userDao.getPage(start, page.getPageSize(), page.getQueryValue());
        int total = this.userDao.getCount(page.getQueryValue());
        page.setRows(rows);
        page.setTotal(total);
        return page;
    }

    // 删除讲师信息
    @GetMapping("/delete/{id}")
    public ResultModel delete(@PathVariable("id") int id) {
        return ResultModel.isSuccess(this.userDao.delete(id) > 0);
    }

    //批量删除讲师信息
    @GetMapping("/deletes")
    public ResultModel deletes(int[] ids) {
        return ResultModel.isSuccess(this.userDao.deletes(ids) > 0);
    }
}
