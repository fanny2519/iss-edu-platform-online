package com.iss.edu.controller;

import com.google.gson.Gson;
import com.iss.edu.common.*;
import com.iss.edu.dao.ApiDao;
import com.iss.edu.model.Student;
import com.iss.edu.model.User;
import com.iss.edu.model.vo.ClassPlanVO;
import com.iss.edu.model.vo.StudentVO;
import com.iss.edu.model.vo.TokenVO;
import com.iss.edu.service.ApiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("/api")
public class ApiController {
    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Autowired
    private RedisUtil redisUtil;

    @Autowired
    private ApiDao apiDao;

    @Autowired
    private ApiService apiService;

    @PostMapping("/studentLogin")
    public ApiResult studentLogin(@RequestBody User user) {
        StudentVO student = this.apiDao.studentLogin(user.getUsername(), user.getPassword());
        if (student == null) {
            return ApiResult.failure(ApiCodeConstant.RESULT_LOGIN_FAIL, "用户名或者密码错误！");
        }
        String token = jwtTokenUtil.generateToken(student);
        redisUtil.set("token-" + student.getId(), token, 30 * 60);
        Map<String, Object> map = new HashMap<>();
        map.put("token", token);
        map.put("user", student);
        return ApiResult.success("登陆成功！", map);
    }

    @PostMapping("/userLogin")
    public ApiResult userLogin(@RequestBody User user) {
        User currentUser = this.apiDao.userLogin(user.getUsername(), user.getPassword());
        if (currentUser == null) {
            return ApiResult.failure(ApiCodeConstant.RESULT_LOGIN_FAIL, "用户名或者密码错误！");
        }
        String token = jwtTokenUtil.generateToken(currentUser);
        redisUtil.set("token-" + currentUser.getId(), token, 30 * 60);
        Map<String, Object> map = new HashMap<>();
        map.put("token", token);
        map.put("user", currentUser);
        return ApiResult.success("登陆成功！", map);
    }

    @PostMapping("/checkToken")
    public ApiResult checkToken(@RequestBody TokenVO token) {
        Map<String, Boolean> map = new HashMap<>();
        if (token.getId() == null || token.getId() == 0) {
            return ApiResult.success(null);
        } else {
            Object redis_token = redisUtil.get("token-" + token.getId());
            if (redis_token == null || !token.getToken().equals(redis_token.toString())) {
                map.put("checkToken", false);
            } else {
                map.put("checkToken", true);
            }
        }
        return ApiResult.success(map);
    }

    @GetMapping("/existStudent/{username}")
    public ApiResult existStudent(@PathVariable("username") String username) {
        return ApiResult.success(this.apiDao.existStudent(username));
    }

    @GetMapping("/getStudent/{id}")
    public ApiResult getStudent(@PathVariable("id") int id) {
        return ApiResult.success(this.apiDao.getStudent(id));
    }

    @GetMapping("/getTeacher/{id}")
    public ApiResult getTeacher(@PathVariable("id") int id) {
        return ApiResult.success(this.apiDao.getTeacher(id));
    }

    @PostMapping("/updatePassword")
    public ApiResult updatePassword(@RequestBody Student student) {
        int result = this.apiDao.updatePassword(student.getUsername(), student.getPassword());
        return result > 0 ? ApiResult.success() : ApiResult.failure("修改失败");//修改失败
    }

    @PostMapping("/updateStudent")
    public ApiResult updateStudent(@RequestBody Student student) {
        int result = this.apiDao.updateStudent(student);
        return result > 0 ? ApiResult.success() : ApiResult.failure("修改失败");//修改失败
    }

    @PostMapping("/register")
    public ApiResult register(@RequestBody Student student) {
        int result = this.apiDao.register(student);
        return result > 0 ? ApiResult.success() : ApiResult.failure("注册失败");//修改失败
    }

    @GetMapping("/getCourseByStudentId/{id}")
    public ApiResult getCourseByStudentId(@PathVariable("id") int id) {
        return ApiResult.success(this.apiDao.getCourseByStudentId(id));
    }

    @GetMapping("/getClassesByStudentId/{id}")
    public ApiResult getClassesByStudentId(@PathVariable("id") int id) {
        return ApiResult.success(this.apiDao.getClassesByStudentId(id));
    }

    @GetMapping("/getCourses/{pageNum}/{pageSize}")
    public ApiResult getCourses(@PathVariable("pageNum") int pageNum, @PathVariable("pageSize") int pageSize) {
        return this.apiService.getCourses(pageNum, pageSize);
    }

    @GetMapping("/getHotCourses")
    public ApiResult getHotCourses() {
        return ApiResult.success(this.apiDao.getHotCourses());
    }

    @GetMapping("/getClasses/{pageNum}/{pageSize}")
    public ApiResult getClasses(@PathVariable("pageNum") int pageNum, @PathVariable("pageSize") int pageSize) {
        return this.apiService.getClasses(pageNum, pageSize);
    }

    @GetMapping("/getHotClasses")
    public ApiResult getHotClasses() {
        return ApiResult.success(this.apiDao.getHotClasses());
    }

    @GetMapping("/getCourse/{id}")
    public ApiResult getCourse(@PathVariable("id") int id) {
        return ApiResult.success(this.apiDao.getCourse(id));
    }

    @GetMapping("/getClass/{id}")
    public ApiResult getClass(@PathVariable("id") int id) {
        return ApiResult.success(this.apiDao.getClass(id));
    }

    @GetMapping("/getCatalogues/{id}")
    public ApiResult getCatalogues(@PathVariable("id") int courseId) {
        return ApiResult.success(this.apiService.getCatalogues(0, courseId));
    }

    @GetMapping("/startStudy/{studentId}/{courseId}")
    public ApiResult startStudy(@PathVariable("studentId") int studentId, @PathVariable("courseId") int courseId) {
        int result = this.apiDao.startStudy(studentId, courseId);
        return result > 0 ? ApiResult.success() : ApiResult.failure("操作失败");
    }

    @GetMapping("/getClassPlans/{id}")
    public List<ClassPlanVO> getClassPlans(@PathVariable("id") int id) {
        return this.apiDao.getClassPlans(id);
    }

    @GetMapping("/deletePlan")
    public ResultModel deletePlan(int[] ids) {
        return ResultModel.isSuccess(this.apiDao.deletePlan(ids) > 0);
    }

    @PostMapping("/insertPlan")
    public ResultModel insertPlan(@RequestBody ClassPlanVO planVO) throws ParseException {
        Date date = new SimpleDateFormat("yyyy-MM-dd").parse(planVO.getPlanDate());
        return ResultModel.isSuccess(this.apiDao.insertPlan(planVO.getId(), date, planVO.getPlans()) > 0);
    }
}
