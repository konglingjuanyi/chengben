package com.chengben.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;
public class VDepartmentIncomeObj extends BaseDbObj
{
private String id;
private String department_code;
private String department_type;
private String department_name;
private String date_month;
private Double shouru;
private Double chuang_ri_chengben;
private Double zhen_ci_chengben;
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
	return "v_department_income";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "VDepartmentIncome";
}
@Override
public String getCnName()
{
	return "科室收入";
}
public LinkedHashMap<String, String> getProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

//		pros.put("id", "编号");
		pros.put("department_code", "科室编号");
		pros.put("department_type", "科室类型");
		pros.put("department_name", "科室");
		pros.put("date_month", "月份");
		pros.put("shouru", "收入");
		pros.put("chuang_ri_chengben", "床次成本");
		pros.put("zhen_ci_chengben", "诊次成本");
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
public String getDate_month()
{
	return date_month;
}
public void setDate_month(String date_month)
{
	this.date_month = date_month;
}
public Double getShouru()
{
	return shouru;
}
public void setShouru(Double shouru)
{
	this.shouru = shouru;
}
public Double getChuang_ri_chengben()
{
	return chuang_ri_chengben;
}
public void setChuang_ri_chengben(Double chuang_ri_chengben)
{
	this.chuang_ri_chengben = chuang_ri_chengben;
}
public Double getZhen_ci_chengben()
{
	return zhen_ci_chengben;
}
public void setZhen_ci_chengben(Double zhen_ci_chengben)
{
	this.zhen_ci_chengben = zhen_ci_chengben;
}
@Override
public String toString()
{
	return JSON.toJSONString(this);
}
}

