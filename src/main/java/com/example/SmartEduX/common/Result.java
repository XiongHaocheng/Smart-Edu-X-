package com.example.SmartEduX.common;
public class Result<T> {
    private String code;
    private String message;
    private T data;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String msg) {
        this.message = msg;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public Result() {
    }

    public Result(T data , String msg) {
        this.data = data;
        this.message = msg;
    }

    public static Result success(String msg) {
        Result result = new Result<>();
        result.setCode("0");
        result.setMessage(msg);
        return result;
    }

    public static <T> Result<T> success(T data ,String msg) {
        Result<T> result = new Result<>(data,msg);
        result.setCode("0");
        result.setMessage(msg);
        return result;
    }

    public static Result error(String code, String msg) {
        Result result = new Result();
        result.setCode(code);
        result.setMessage(msg);
        return result;
    }
}
