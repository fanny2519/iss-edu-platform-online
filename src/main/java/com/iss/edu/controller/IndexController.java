package com.iss.edu.controller;

import com.iss.edu.common.ApiCodeConstant;
import com.iss.edu.common.ApiResult;
import com.iss.edu.common.JwtTokenUtil;
import com.iss.edu.common.RedisUtil;
import com.iss.edu.dao.IndexDao;
import com.iss.edu.dao.UserDao;
import com.iss.edu.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

// http://localhost:8080/edu-platform/background
@RestController
public class IndexController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private IndexDao indexDao;

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Autowired
    private RedisUtil redisUtil;

    @PostMapping("/login")
    public ApiResult login(@RequestBody User user) {
        user = this.userDao.login(user.getUsername(), user.getPassword());
        if (user == null) {
            return ApiResult.failure(ApiCodeConstant.RESULT_LOGIN_FAIL, "用户名或者密码错误！");
        }
        String token = jwtTokenUtil.generateToken(user);
        redisUtil.set("token-" + user.getId(), token, 30 * 60);
        Map<String, Object> map = new HashMap<>();
        map.put("token", token);
        map.put("user", user);
        return ApiResult.success("登陆成功！", map);
    }

    @GetMapping("/logout")
    public ApiResult logout(HttpServletRequest request) {
        int id = jwtTokenUtil.getUserIdFromToken(request.getHeader("token"));
        redisUtil.del("token-" + id);
        return ApiResult.success();
    }

    @GetMapping("/getTotals")
    public Map<String, Object> getTotals() {
        return this.indexDao.getTotals();
    }

}
