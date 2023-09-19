package com.iss.edu.common;
/**
 * @author xiadewang
 *API code常量
 */
public class ApiCodeConstant {
    public static final int RESULT_SUCC = 20000;
    public static final int RESULT_LOGIN_FAIL = 50001;  //用户名或者密码错误
    public static final int RESULT_PERMISSION_EXCEPTION= 50002;         //自定义权限异常
    public static final int RESULT_TOKEN_FAIL = 50014;         //token校验失败
    public static final int RESULT_NULLPOINT_EXCEPTION= 50101;         //空指针异常
    public static final int RESULT_OTHER_EXCEPTION= 50102;         //其他异常

    public static final int RESULT_ID_GEN_EXCEPTION= 502021;         //id派发异常

    public static final String MSG_ID_GEN_EXCEPTION= "ID生成异常";         //id派发异常消息
}
