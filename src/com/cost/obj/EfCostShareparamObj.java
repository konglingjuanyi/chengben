package com.cost.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;
public class EfCostShareparamObj extends BaseDbObj
{
private Long id;
private String cshareparamcode;
private String cshareparamname;
private String cworkitemcode;
private String cbasemonth;
private String csystem;
private String bend;
private String cmodifier;
private Timestamp dnmodifytime;
//private String ufts;
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
	return "ef_cost_shareparam";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "EfCostShareparam";
}
@Override
public String getCnName()
{
	return "分摊参数";
}
public LinkedHashMap<String, String> getProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", "分摊参数ID");
		pros.put("cshareparamcode", "分摊参数编码");
		pros.put("cshareparamname", "分摊参数名称");
		pros.put("cworkitemcode", "对应工作项目编码");
		pros.put("cbasemonth", "是否按月存储");
		pros.put("csystem", "是否系统数据");
		pros.put("bend", "是否末级");
//		pros.put("cmodifier", "cmodifier");
//		pros.put("dnmodifytime", "dnmodifytime");
//		pros.put("ufts", "ufts");
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
public String getCshareparamcode()
{
	return cshareparamcode;
}
public void setCshareparamcode(String cshareparamcode)
{
	this.cshareparamcode = cshareparamcode;
}
public String getCshareparamname()
{
	return cshareparamname;
}
public void setCshareparamname(String cshareparamname)
{
	this.cshareparamname = cshareparamname;
}
public String getCworkitemcode()
{
	return cworkitemcode;
}
public void setCworkitemcode(String cworkitemcode)
{
	this.cworkitemcode = cworkitemcode;
}
public String getCbasemonth()
{
	return cbasemonth;
}
public void setCbasemonth(String cbasemonth)
{
	this.cbasemonth = cbasemonth;
}
public String getCsystem()
{
	return csystem;
}
public void setCsystem(String csystem)
{
	this.csystem = csystem;
}
public String getBend()
{
	return bend;
}
public void setBend(String bend)
{
	this.bend = bend;
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
//public String getUfts()
//{
//	return ufts;
//}
//public void setUfts(String ufts)
//{
//	this.ufts = ufts;
//}
@Override
public String toString()
{
	return JSON.toJSONString(this);
}
}

