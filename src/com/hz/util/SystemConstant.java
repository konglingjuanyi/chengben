package com.hz.util;

import com.hz.config.ConfigReader;

public class SystemConstant
{
	// 用户信息
	public static final String AUTH_USER_INFO = "AUTH_USER_INFO";
	public static final String AUTH_USER_ACCOUNT = "account";
	public static final String AUTH_USER_PASSWORD = "password";
	public static final String AUTH_USER_ADMIN="admin";

	// 每页数据条数
	public static final int PAGE_ROWS = 20;
	public static final String PAGE_NUM = "PAGE_NUM";

	// 短信发送
	public static final String SMS_USERNAME = "52593";
	public static final String SMS_PASSWORD = "Wyg2461290!";
	
	public static final String ROLE_ADMIN = "系统管理员";
	public static final String ROLE_DISTRICT_ADMIN = "区县管理员";
	public static final String ROLE_DEPARTMENT_ADMIN = "部门管理员";
	public static final String ROLE_COMMON_USER = "普通员工";
	
	// 默认数据库
	public static final String DEFAULT_DB="db";
//	public static final String INNER_DB="innerDb";
	public static final String INNER_DB="db";
	public static final String DB_ORACLE="ORALCE";
	public static final String DB_MYSQL="MYSQL";
	public static final String DB_SQLSERVER="SQLSERVER";	
	public static final String BUSINESS_DB="business_db";
	
	// 处理主体类型
	public static final String SUBJECT_TYPE_PERSON = "SUBJECT_TYPE_PERSON";
	public static final String SUBJECT_TYPE_DEPARTMENT = "SUBJECT_TYPE_DEPARTMENT";
	public static final String SUBJECT_TYPE_GROUP = "SUBJECT_TYPE_GROUP";
}
