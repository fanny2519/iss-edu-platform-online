package com.iss.edu.interceptor;

import com.google.gson.Gson;
import com.iss.edu.common.ApiCodeConstant;
import com.iss.edu.common.ApiResult;
import com.iss.edu.common.JwtTokenUtil;
import com.iss.edu.common.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

@Component
public class HttpRequestInterceptor implements HandlerInterceptor {

    @Autowired
    private JwtTokenUtil jwtTokenUtil;

    @Autowired
    private RedisUtil redisUtil;

    @Value("#{'${no.token.request.url:}'.empty ? null : '${no.token.request.url:}'.split(',')}")
    private List<String> noTokenRequestUrl;

    /**
     * 在请求处理之前进行调用（Controller方法调用之前）
     *
     * @return boolean
     * false，被请求时，拦截器执行到此处将不会继续操作
     * true，请求将会继续执行后面的操作
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String token = request.getHeader("token");
        System.out.println("Token is : " + token);
        if (!request.getMethod().equals("OPTIONS")) {
            // 针对 application.properties 配置文件中 no.token.request.url 所配置的 url 不做 token 验证
            for (String url : noTokenRequestUrl) {
                if (request.getRequestURI().contains(url)) {
                    System.out.println(request.getRequestURI());
                    return true;
                }
            }
            if (token != null && !token.isEmpty() && !token.equals("null") && !token.equals("noToken")) {
                String username = jwtTokenUtil.getUsernameFromToken(token);
                int id = jwtTokenUtil.getUserIdFromToken(token);
                Object redis_token = redisUtil.get("token-" + id);
                if (redis_token == null || !token.equals(redis_token.toString())) {
                    String json = new Gson().toJson(ApiResult.failure(ApiCodeConstant.RESULT_TOKEN_FAIL, "会话过期，请重新登录!"));
                    response.setContentType("application/json; charset=utf-8");
                    PrintWriter out = response.getWriter();
                    out.write(json);
                    out.flush();
                    return false;
                } else {
                    redisUtil.expire("token-" + id, 1800);
                    System.out.println("Token validation succeeded ....");
                    return true;
                }
            } else {
                String json = new Gson().toJson(ApiResult.failure(ApiCodeConstant.RESULT_TOKEN_FAIL, "检测到您未登录，请重新登录!"));
                response.setContentType("application/json; charset=utf-8");
                PrintWriter out = response.getWriter();
                out.write(json);
                out.flush();
                return false;
            }
        }
        return true;
    }

    /**
     * 请求处理之后进行调用，但是在视图被渲染之前（Controller方法调用之后）
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    /**
     * 在整个请求结束之后被调用，也就是在 DispatcherServlet 渲染了对应的视图之后执行（主要是用于进行资源清理工作）
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
