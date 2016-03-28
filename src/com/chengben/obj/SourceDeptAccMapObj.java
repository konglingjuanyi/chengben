package com.chengben.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import com.alibaba.fastjson.JSON;
public class SourceDeptAccMapObj extends BaseDbObj
{
private Long id;
private String source_system;
private String dept_share_type;
private String source_acc_subject;
private String dest_acc_subject;
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
	return "source_dept_acc_map";
}
@Override 
public String findDefaultOrderBy()
{
	return "source_system,dept_share_type,source_acc_subject";
}
@Override
public String getBasePath()
{
	return "SourceDeptAccMap";
}
@Override
public String getCnName()
{
	return "外部接口科室科目对照";
}
@Override
public List<String> getUniqueIndexProperties()
{
	List<String> l = new ArrayList<String>();
	l.add("source_system");
	l.add("dept_share_type");
	l.add("source_acc_subject");
	l.add("dest_acc_subject");
	return l;
}
public LinkedHashMap<String, String> getProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", "ID");
		pros.put("source_system", "外部接口");
		pros.put("dept_share_type", "科室类型");
		pros.put("source_acc_subject", "外部接口科目");
		pros.put("dest_acc_subject", "总账系统会计科目");
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
public String getDept_share_type()
{
	return dept_share_type;
}
public void setDept_share_type(String dept_share_type)
{
	this.dept_share_type = dept_share_type;
}
public String getSource_acc_subject()
{
	return source_acc_subject;
}
public void setSource_acc_subject(String source_acc_subject)
{
	this.source_acc_subject = source_acc_subject;
}
public String getDest_acc_subject()
{
	return dest_acc_subject;
}
public void setDest_acc_subject(String dest_acc_subject)
{
	this.dest_acc_subject = dest_acc_subject;
}
@Override
public String toString()
{
	return JSON.toJSONString(this);
}
}

