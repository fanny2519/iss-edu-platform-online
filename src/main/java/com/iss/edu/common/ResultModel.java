package com.iss.edu.common;

public class ResultModel {

    public static final boolean SUCCESS = true;
    public static final boolean ERROR = false;

    /**
     * 操作是否成功
     */
    private boolean operate;

    /**
     * 提示消息
     */
    private String msg;

    /**
     * 结果数据
     */
    private Object data;


    public ResultModel(boolean operate, String msg, Object data) {
        this.operate = operate;
        this.msg = msg;
        this.data = data;
    }

    public static ResultModel success() {
        return success("操作成功 !", null);
    }

    public static ResultModel success(String msg) {
        return success(msg, null);
    }

    public static ResultModel success(Object data) {
        return success("操作成功 !", data);
    }

    public static ResultModel success(String msg, Object data) {
        return new ResultModel(ResultModel.SUCCESS, msg, data);
    }

    public static ResultModel error() {
        return error("操作失败 !", null);
    }

    public static ResultModel dbError() {
        return error("数据库 操作失败 !", null);
    }

    public static ResultModel hdfsError() {
        return error("HDFS 操作失败 !", null);
    }

    public static ResultModel error(String msg) {
        return error(msg, null);
    }

    public static ResultModel error(Object data) {
        return error("操作失败 !", data);
    }

    public static ResultModel error(String msg, Object data) {
        return new ResultModel(ResultModel.ERROR, msg, data);
    }

    public static ResultModel isSuccess(boolean success) {
        return success ? success() : error();
    }


    public boolean isOperate() {
        return operate;
    }

    public void setOperate(boolean operate) {
        this.operate = operate;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

}
