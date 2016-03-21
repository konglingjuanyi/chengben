package com.cost.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;
public class EfCostSharekindObj extends BaseDbObj
{
private Long id;
private String csharekindcode;
private String csharekindname;
private String csharelevelcode;
private String cshareparamcode;
private String cmustoutin;
private String cmodifier;
private Timestamp dnmodifytime;
private String bsystem;
private String bend;
//private String ufts;
private String cdeptcalkindcode;
private String bdirect;
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
	return "ef_cost_sharekind";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "EfCostSharekind";
}
@Override
public String getCnName()
{
	return "成本分摊类别";
}
public LinkedHashMap<String, String> getProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", "分摊类别ID");
		pros.put("csharekindcode", "分摊类别编码");
		pros.put("csharekindname", "分摊类别名称");
		pros.put("csharelevelcode", "分摊级别编码");
//		pros.put("cshareparamcode", "分摊参数编码");
		pros.put("cdeptcalkindcode", "部门核算类别");
		pros.put("cmustoutin", "分门诊住院");
		pros.put("bdirect", "是否直接成本分配");
//		pros.put("cmodifier", "cmodifier");
//		pros.put("dnmodifytime", "dnmodifytime");
//		pros.put("bsystem", "bsystem");
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
public String getCsharekindcode()
{
	return csharekindcode;
}
public void setCsharekindcode(String csharekindcode)
{
	this.csharekindcode = csharekindcode;
}
public String getCsharekindname()
{
	return csharekindname;
}
public void setCsharekindname(String csharekindname)
{
	this.csharekindname = csharekindname;
}
public String getCsharelevelcode()
{
	return csharelevelcode;
}
public void setCsharelevelcode(String csharelevelcode)
{
	this.csharelevelcode = csharelevelcode;
}
public String getCshareparamcode()
{
	return cshareparamcode;
}
public void setCshareparamcode(String cshareparamcode)
{
	this.cshareparamcode = cshareparamcode;
}
public String getCmustoutin()
{
	return cmustoutin;
}
public void setCmustoutin(String cmustoutin)
{
	this.cmustoutin = cmustoutin;
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
//public String getUfts()
//{
//	return ufts;
//}
//public void setUfts(String ufts)
//{
//	this.ufts = ufts;
//}
public String getCdeptcalkindcode()
{
	return cdeptcalkindcode;
}
public void setCdeptcalkindcode(String cdeptcalkindcode)
{
	this.cdeptcalkindcode = cdeptcalkindcode;
}
public String getBdirect()
{
	return bdirect;
}
public void setBdirect(String bdirect)
{
	this.bdirect = bdirect;
}
@Override
public String toString()
{
	return JSON.toJSONString(this);
}
}

