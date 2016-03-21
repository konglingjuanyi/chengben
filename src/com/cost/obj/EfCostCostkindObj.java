package com.cost.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;
public class EfCostCostkindObj extends BaseDbObj
{
private Long id;
private String ccostkindcode;
private String ccostkindname;
private String cmodifier;
private Timestamp dnmodifytime;
private String bend;
private String bsystem;
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
	return "ef_cost_costkind";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "EfCostCostkind";
}
@Override
public String getCnName()
{
	return "成本分类";
}
public LinkedHashMap<String, String> getProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", "成本分类ID");
		pros.put("ccostkindcode", "成本分类编码");
		pros.put("ccostkindname", "成本分类名称");
//		pros.put("cmodifier", "cmodifier");
//		pros.put("dnmodifytime", "dnmodifytime");
//		pros.put("bend", "是否末级");
//		pros.put("bsystem", "是否系统数据");
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
public String getCcostkindcode()
{
	return ccostkindcode;
}
public void setCcostkindcode(String ccostkindcode)
{
	this.ccostkindcode = ccostkindcode;
}
public String getCcostkindname()
{
	return ccostkindname;
}
public void setCcostkindname(String ccostkindname)
{
	this.ccostkindname = ccostkindname;
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
public String getBend()
{
	return bend;
}
public void setBend(String bend)
{
	this.bend = bend;
}
public String getBsystem()
{
	return bsystem;
}
public void setBsystem(String bsystem)
{
	this.bsystem = bsystem;
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

