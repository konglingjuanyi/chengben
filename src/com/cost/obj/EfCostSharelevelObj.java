package com.cost.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;
public class EfCostSharelevelObj extends BaseDbObj
{
private Long id;
private String csharelevelcode;
private String csharelevelname;
private String cmemo;
private String cmodifier;
private Timestamp dnmodifytime;
private String bsystem;
private String bend;

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
	return "ef_cost_sharelevel";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "EfCostSharelevel";
}
@Override
public String getCnName()
{
	return "成本分摊级别";
}
public LinkedHashMap<String, String> getProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", "成本分摊级别ID");
		pros.put("csharelevelcode", "成本分摊级别编码");
		pros.put("csharelevelname", "成本分摊级别名称");
		pros.put("cmemo", "备注");
//		pros.put("cmodifier", "修改人");
//		pros.put("dnmodifytime", "修改时间");
//		pros.put("bsystem", "是否系统数据");
//		pros.put("bend", "是否末级");
//		pros.put("ufts", "时间戳");
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
public String getCsharelevelcode()
{
	return csharelevelcode;
}
public void setCsharelevelcode(String csharelevelcode)
{
	this.csharelevelcode = csharelevelcode;
}
public String getCsharelevelname()
{
	return csharelevelname;
}
public void setCsharelevelname(String csharelevelname)
{
	this.csharelevelname = csharelevelname;
}
public String getCmemo()
{
	return cmemo;
}
public void setCmemo(String cmemo)
{
	this.cmemo = cmemo;
}
public String getCmodifier()
{
	return cmodifier;
}
public void setCmodifier(String cmodifier)
{
	this.cmodifier = cmodifier;
}
public Timestamp getDnmodifytime()
{
	return dnmodifytime;
}
public void setDnmodifytime(Timestamp dnmodifytime)
{
	this.dnmodifytime = dnmodifytime;
}
public String getBsystem()
{
	return bsystem;
}
public void setBsystem(String bsystem)
{
	this.bsystem = bsystem;
}
public String getBend()
{
	return bend;
}
public void setBend(String bend)
{
	this.bend = bend;
}

@Override
public String toString()
{
	return JSON.toJSONString(this);
}
}

