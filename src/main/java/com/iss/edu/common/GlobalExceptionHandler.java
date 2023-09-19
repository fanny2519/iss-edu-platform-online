package com.iss.edu.common;
/**
 * @author xiadewang
 *全局统一异常处理
 */
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
public class GlobalExceptionHandler {
    private static Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @ResponseBody
    //自定义异常
    @ExceptionHandler(MyException.class)
    public ApiResult<String> MyExceptionHandler(Exception ex) {
        return  ApiResult.failure(((MyException)ex).getCode(), ex.getMessage());
    }

    @ResponseBody
//空指针异常
    @ExceptionHandler(NullPointerException.class)
    public ApiResult<String> nullPointerExceptionHandler(NullPointerException ex) {
        log.error(ex.getMessage(),ex);
        return ApiResult.failure(ApiCodeConstant.RESULT_NULLPOINT_EXCEPTION, ex.toString());
    }

    @ResponseBody
    //其他未知异常
    @ExceptionHandler(Exception.class)
    public ApiResult<String> otherExcptionHandler(Exception ex) {
        log.error(ex.getMessage(), ex);
        return  ApiResult.failure(ApiCodeConstant.RESULT_OTHER_EXCEPTION, ex.toString());
    }
}
