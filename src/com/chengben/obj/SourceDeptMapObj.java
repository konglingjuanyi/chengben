package com.chengben.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import com.alibaba.fastjson.JSON;

public class SourceDeptMapObj extends BaseDbObj
{
	private Long id;
	private String source_system;
	private String source_dept_name;
	private String dest_dept_code;

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
		return "source_dept_map";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return "source_system,case when dest_dept_code is null then 0 else 1 end,source_dept_name";
	}

	@Override
	public String getBasePath()
	{
		return "SourceDeptMap";
	}

	@Override
	public String getCnName()
	{
		return "外部接口科室对照关系";
	}

	@Override
	public List<String> getUniqueIndexProperties()
	{
		List<String> l = new ArrayList<String>();
		l.add("source_system");
		l.add("source_dept_name");
		l.add("dest_dept_code");
		return l;
	}

	public LinkedHashMap<String, String> getProperties()
	{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", "编号");
		pros.put("source_system", "外部接口");
		pros.put("source_dept_name", "外部接口科室名称");
		pros.put("dest_dept_code", "总账系统科室");
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

	public String getSource_system()
	{
		return source_system;
	}

	public void setSource_system(String source_system)
	{
		this.source_system = source_system;
	}

	public String getSource_dept_name()
	{
		return source_dept_name;
	}

	public void setSource_dept_name(String source_dept_name)
	{
		this.source_dept_name = source_dept_name;
	}

	public String getDest_dept_code()
	{
		return dest_dept_code;
	}

	public void setDest_dept_code(String dest_dept_code)
	{
		this.dest_dept_code = dest_dept_code;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
