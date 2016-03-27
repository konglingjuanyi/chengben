package com.chengben.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;
public class VSourceDeptMapInfoObj extends BaseDbObj
{
private String source_system;
private String relation_name;
private String source_system_name;
private Long relation_total_num;
private Long relation_ok_num;
private Long relation_not_ok_num;
@Override
public String findKeyColumnName()
{
	return "source_system_name";
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
	return "v_source_dept_map_info";
}
@Override 
public String findDefaultOrderBy()
{
	return "source_system";
}
@Override
public String getBasePath()
{
	return "VSourceDeptMapInfo";
}
@Override
public String getCnName()
{
	return "外部接口科室对照";
}
public LinkedHashMap<String, String> getProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("source_system", "外部接口");
		pros.put("relation_name", "对照关系名");
//		pros.put("source_system_name", "外部接口名");
		pros.put("relation_total_num", "对照关系总条数");
		pros.put("relation_ok_num", "已完善对照关系条数");
		pros.put("relation_not_ok_num", "待完善对照关系条数");
		return pros;
}
public String getSource_system()
{
	return source_system;
}
public void setSource_system(String source_system)
{
	this.source_system = source_system;
}
public String getRelation_name()
{
	return relation_name;
}
public void setRelation_name(String relation_name)
{
	this.relation_name = relation_name;
}
public String getSource_system_name()
{
	return source_system_name;
}
public void setSource_system_name(String source_system_name)
{
	this.source_system_name = source_system_name;
}
public Long getRelation_total_num()
{
	return relation_total_num;
}
public void setRelation_total_num(Long relation_total_num)
{
	this.relation_total_num = relation_total_num;
}
public Long getRelation_ok_num()
{
	return relation_ok_num;
}
public void setRelation_ok_num(Long relation_ok_num)
{
	this.relation_ok_num = relation_ok_num;
}
public Long getRelation_not_ok_num()
{
	return relation_not_ok_num;
}
public void setRelation_not_ok_num(Long relation_not_ok_num)
{
	this.relation_not_ok_num = relation_not_ok_num;
}
@Override
public String toString()
{
	return JSON.toJSONString(this);
}
}

