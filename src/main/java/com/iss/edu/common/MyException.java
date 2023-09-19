package com.iss.edu.common;

/**
 * @author xiadewang
 *自定义异常
 */
public class MyException extends RuntimeException {
	private int code;

	public MyException() {
	}
	
	/**
	 * MyException
	 * @param code 错误代码
	 */
	public MyException(int code) {
		super("code=" + code);
		this.code = code;
	}

	/**
	 * MyException
	 * @param message 错误消息
	 */
	public MyException(String message) {
		super(message);
	}

	/**
	 * MyException
	 * @param cause 捕获的异常
	 */
	public MyException(Throwable cause) {
		super(cause);
	}

	/**
	 * MyException
	 * @param message 错误消息
	 * @param cause 捕获的异常
	 */
	public MyException(String message, Throwable cause) {
		super(message, cause);
	}
	
	/**
	 * MyException
	 * @param code 错误代码
	 * @param message 错误消息
	 */
	public MyException(int code, String message) {
		super(message);
		this.code = code;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}
}
