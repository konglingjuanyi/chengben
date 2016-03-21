package com.cost.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;
public class EfCostChargeitemObj extends BaseDbObj
{
private Long id;
private String cchargeitemcode;
private String cchargeitemname;
private String cchargekindcode;
private String coutitemcode;
private String cinitemcode;
private String cstop;
private Timestamp dnmodifytime;
private String cmodifier;
private String bend;
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
	return "ef_cost_chargeitem";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "EfCostChargeitem";
}
@Override
public String getCnName()
{
	return "收费项目";
}
public LinkedHashMap<String, String> getProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", "收费项目ID");
		pros.put("cchargeitemcode", "收费项目编号");
		pros.put("cchargeitemname", "收费项目名称");
		pros.put("cchargekindcode", "收费类别编码");
		pros.put("coutitemcode", "对应门诊项目编码");
		pros.put("cinitemcode", "对应住院项目编码");
		pros.put("cstop", "是否停用");
//		pros.put("dnmodifytime", "dnmodifytime");
//		pros.put("cmodifier", "cmodifier");
//		pros.put("bend", "是否末级");
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
public String getCchargeitemcode()
{
	return cchargeitemcode;
}
public void setCchargeitemcode(String cchargeitemcode)
{
	this.cchargeitemcode = cchargeitemcode;
}
public String getCchargeitemname()
{
	return cchargeitemname;
}
public void setCchargeitemname(String cchargeitemname)
{
	this.cchargeitemname = cchargeitemname;
}
public String getCchargekindcode()
{
	return cchargekindcode;
}
public void setCchargekindcode(String cchargekindcode)
{
	this.cchargekindcode = cchargekindcode;
}
public String getCoutitemcode()
{
	return coutitemcode;
}
public void setCoutitemcode(String coutitemcode)
{
	this.coutitemcode = coutitemcode;
}
public String getCinitemcode()
{
	return cinitemcode;
}
public void setCinitemcode(String cinitemcode)
{
	this.cinitemcode = cinitemcode;
}
public String getCstop()
{
	return cstop;
}
public void setCstop(String cstop)
{
	this.cstop = cstop;
}
public Timestamp getDnmodifytime()
{
	return dnmodifytime;
}
public void setDnmodifytime(Timestamp dnmodifytime)
{
	this.dnmodifytime = dnmodifytime;
}
public String getCmodifier()
{
	return cmodifier;
}
public void setCmodifier(String cmodifier)
{
	this.cmodifier = cmodifier;
}
public String getBend()
{
	return bend;
}
public void setBend(String bend)
{
	this.bend = bend;
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

