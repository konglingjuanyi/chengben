package com.wuyg.system.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;
public class SysMapInfoObj extends BaseDbObj
{
private Long id;
private String name;
private String comment;
private String source_dict_name;
private String source_dict_showname;
private String other_system;// 外部系统
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
	return "sys_map_info";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "SysMapInfo";
}
@Override
public String getCnName()
{
	return "对照关系";
}
public LinkedHashMap<String, String> getProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", "编号");
		pros.put("name", "对照关系名");
		pros.put("other_system", "外部系统名称");
		pros.put("comment", "对照关系描述");
		pros.put("source_dict_name", "成本系统字典");
//		pros.put("source_dict_showname", "映射到该字典");
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
public String getName()
{
	return name;
}
public void setName(String name)
{
	this.name = name;
}
public String getComment()
{
	return comment;
}
public void setComment(String comment)
{
	this.comment = comment;
}

public String getSource_dict_name()
{
	return source_dict_name;
}
public void setSource_dict_name(String source_dict_name)
{
	this.source_dict_name = source_dict_name;
}
public String getSource_dict_showname()
{
	return source_dict_showname;
}
public void setSource_dict_showname(String source_dict_showname)
{
	this.source_dict_showname = source_dict_showname;
}
public String getOther_system()
{
	return other_system;
}
public void setOther_system(String other_system)
{
	this.other_system = other_system;
}
@Override
public String toString()
{
	return JSON.toJSONString(this);
}
}

