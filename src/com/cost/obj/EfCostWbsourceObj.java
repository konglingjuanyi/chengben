package com.cost.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;
public class EfCostWbsourceObj extends BaseDbObj
{
private Long id;
private String ccode;
private String cname;
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
	return "ef_cost_wbsource";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "EfCostWbsource";
}
@Override
public String getCnName()
{
	return "外部接口";
}
public LinkedHashMap<String, String> getProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", "外部系统ID");
		pros.put("ccode", "外部系统编码");
		pros.put("cname", "外部系统名称");
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
public String getCcode()
{
	return ccode;
}
public void setCcode(String ccode)
{
	this.ccode = ccode;
}
public String getCname()
{
	return cname;
}
public void setCname(String cname)
{
	this.cname = cname;
}
@Override
public String toString()
{
	return JSON.toJSONString(this);
}
}

