package com.chengben.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import com.alibaba.fastjson.JSON;

public class DepartmentObj extends BaseDbObj
{
	private Long id;
	private String department_code;
	private String department_name;
	private String department_type_code;

	@Override
	public String findKeyColumnName()
	{
		return "id";
	}

	@Override
	public String findParentKeyColumnName()
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String findTableName()
	{
		return "department";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return super.findDefaultOrderBy();
	}

	@Override
	public String getBasePath()
	{
		return "Department";
	}

	@Override
	public String getCnName()
	{
		return "医院科室";
	}

	@Override
	public List<String> getUniqueIndexProperties()
	{
		List<String> l = new ArrayList<String>();
		l.add("department_code");
		return l;
	}

	public LinkedHashMap<String, String> getProperties()
	{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", "ID");
		pros.put("department_code", "科室编码");
		pros.put("department_name", "科室名称");
		pros.put("department_type_code", "科室类别");
		return pros;
	}

	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	public String getDepartment_code()
	{
		return department_code;
	}

	public void setDepartment_code(String department_code)
	{
		this.department_code = department_code;
	}

	public String getDepartment_name()
	{
		return department_name;
	}

	public void setDepartment_name(String department_name)
	{
		this.department_name = department_name;
	}

	public String getDepartment_type_code()
	{
		return department_type_code;
	}

	public void setDepartment_type_code(String department_type_code)
	{
		this.department_type_code = department_type_code;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
