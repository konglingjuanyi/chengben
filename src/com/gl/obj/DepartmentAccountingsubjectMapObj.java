package com.gl.obj;

import com.alibaba.fastjson.JSON;

public class DepartmentAccountingsubjectMapObj
{
	private String wbSource; // 外部来源
	private String wbDepartmentName;// 外部科室名
	private String wbAccountingSubjectName; // 外部会计科目名
	
	private String zzDepartmentCode; // 对应总账科室编码
	private String zzDepartmentType; // 对应总账科室类型
	private String zzAccountingSubjectCode; // 对应总账会计科目编码
	private String zzAccountingSubjectCodeReverse;// 对应总账平账会计科目编码
	public String getWbSource()
	{
		return wbSource;
	}
	public void setWbSource(String wbSource)
	{
		this.wbSource = wbSource;
	}
	public String getWbDepartmentName()
	{
		return wbDepartmentName;
	}
	public void setWbDepartmentName(String wbDepartmentName)
	{
		this.wbDepartmentName = wbDepartmentName;
	}
	public String getWbAccountingSubjectName()
	{
		return wbAccountingSubjectName;
	}
	public void setWbAccountingSubjectName(String wbAccountingSubjectName)
	{
		this.wbAccountingSubjectName = wbAccountingSubjectName;
	}
	public String getZzDepartmentCode()
	{
		return zzDepartmentCode;
	}
	public void setZzDepartmentCode(String zzDepartmentCode)
	{
		this.zzDepartmentCode = zzDepartmentCode;
	}
	public String getZzDepartmentType()
	{
		return zzDepartmentType;
	}
	public void setZzDepartmentType(String zzDepartmentType)
	{
		this.zzDepartmentType = zzDepartmentType;
	}
	public String getZzAccountingSubjectCode()
	{
		return zzAccountingSubjectCode;
	}
	public void setZzAccountingSubjectCode(String zzAccountingSubjectCode)
	{
		this.zzAccountingSubjectCode = zzAccountingSubjectCode;
	}
	public String getZzAccountingSubjectCodeReverse()
	{
		return zzAccountingSubjectCodeReverse;
	}
	public void setZzAccountingSubjectCodeReverse(String zzAccountingSubjectCodeReverse)
	{
		this.zzAccountingSubjectCodeReverse = zzAccountingSubjectCodeReverse;
	}
	
	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
