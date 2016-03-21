package com.cost.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;
public class EfCostChargekindObj extends BaseDbObj
{
private Long id;
private String cchargekindcode;
private String cchargekindname;
private String cincmitemcode;
private String ctm;
private String coutkindcode;
private String cinkindcode;
private String cmodifier;
private Timestamp dnmodifytime;
private String bend;
//private String ufts;
private String cincattr;
private String cly;
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
	return "ef_cost_chargekind";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "EfCostChargekind";
}
@Override
public String getCnName()
{
	return "收费类别";
}
public LinkedHashMap<String, String> getProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", "收费类别ID");
		pros.put("cchargekindcode", "收费类别编码");
		pros.put("cchargekindname", "收费类别名称");
		pros.put("cincmitemcode", "收入项目编码");
		pros.put("ctm", "医疗/药品");
		pros.put("coutkindcode", "对应门诊收费类别编码");
		pros.put("cinkindcode", "对应住院收费类别编码");
//		pros.put("cmodifier", "cmodifier");
//		pros.put("dnmodifytime", "dnmodifytime");
//		pros.put("bend", "是否末级");
//		pros.put("ufts", "ufts");
//		pros.put("cincattr", "cincattr");
//		pros.put("cly", "cly");
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
public String getCchargekindcode()
{
	return cchargekindcode;
}
public void setCchargekindcode(String cchargekindcode)
{
	this.cchargekindcode = cchargekindcode;
}
public String getCchargekindname()
{
	return cchargekindname;
}
public void setCchargekindname(String cchargekindname)
{
	this.cchargekindname = cchargekindname;
}
public String getCincmitemcode()
{
	return cincmitemcode;
}
public void setCincmitemcode(String cincmitemcode)
{
	this.cincmitemcode = cincmitemcode;
}
public String getCtm()
{
	return ctm;
}
public void setCtm(String ctm)
{
	this.ctm = ctm;
}
public String getCoutkindcode()
{
	return coutkindcode;
}
public void setCoutkindcode(String coutkindcode)
{
	this.coutkindcode = coutkindcode;
}
public String getCinkindcode()
{
	return cinkindcode;
}
public void setCinkindcode(String cinkindcode)
{
	this.cinkindcode = cinkindcode;
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
//public String getUfts()
//{
//	return ufts;
//}
//public void setUfts(String ufts)
//{
//	this.ufts = ufts;
//}
public String getCincattr()
{
	return cincattr;
}
public void setCincattr(String cincattr)
{
	this.cincattr = cincattr;
}
public String getCly()
{
	return cly;
}
public void setCly(String cly)
{
	this.cly = cly;
}
@Override
public String toString()
{
	return JSON.toJSONString(this);
}
}

