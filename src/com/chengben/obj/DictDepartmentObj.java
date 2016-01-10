package com.chengben.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;

public class DictDepartmentObj extends BaseDbObj
{
	private String id;
	private String department_code;
	private String department_type;
	private String department_name;
	private String department_type_sort;

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
		return "dict_department";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return "department_type_sort,department_code";
	}

	@Override
	public String getBasePath()
	{
		return "DictDepartment";
	}

	@Override
	public String getCnName()
	{
		return "科室";
	}

	public LinkedHashMap<String, String> getProperties()
	{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		// pros.put("id", "id");
		// pros.put("department_code", "department_code");
		// pros.put("department_type", "department_type");
		// pros.put("department_name", "department_name");
		return pros;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
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

	public String getDepartment_type()
	{
		return department_type;
	}

	public void setDepartment_type(String department_type)
	{
		this.department_type = department_type;
	}

	public String getDepartment_name()
	{
		return department_name;
	}

	public void setDepartment_name(String department_name)
	{
		this.department_name = department_name;
	}

	public String getDepartment_type_sort()
	{
		return department_type_sort;
	}

	public void setDepartment_type_sort(String department_type_sort)
	{
		this.department_type_sort = department_type_sort;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
