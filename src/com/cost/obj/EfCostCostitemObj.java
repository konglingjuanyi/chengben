package com.cost.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;
public class EfCostCostitemObj extends BaseDbObj
{
private Long id;
private String ccostitemcode;
private String ccostitemname;
private String cparentcode;
private String cdirect;
private String cchange;
private String ccontrol;
private String ctm;
private String cstop;
private String ccostkindcode;
private String cshareparamcode;
private String cend;
private String csource;
private String csubject;
private String cmodifier;
private Timestamp dnmodifytime;
//private String ufts;
private String igrade;
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
	return "ef_cost_costitem";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "EfCostCostitem";
}
@Override
public String getCnName()
{
	return "成本项目";
}
public LinkedHashMap<String, String> getProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", "成本项目ID");
		pros.put("ccostitemcode", "成本项目编码");
		pros.put("ccostitemname", "成本项目名称");
		pros.put("cparentcode", "上级编码");
		pros.put("cdirect", "是否直接成本");
		pros.put("cchange", "是否变动成本");
		pros.put("ccontrol", "是否可控成本");
		pros.put("ctm", "医疗/药品");
		pros.put("cstop", "是否停用");
		pros.put("ccostkindcode", "成本分类");
		pros.put("cshareparamcode", "分摊参数");
		pros.put("cend", "是否末级");
		pros.put("csource", "来源");
		pros.put("csubject", "对应会计科目");
//		pros.put("cmodifier", "cmodifier");
//		pros.put("dnmodifytime", "dnmodifytime");
//		pros.put("ufts", "ufts");
//		pros.put("igrade", "级次");
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
public String getCcostitemcode()
{
	return ccostitemcode;
}
public void setCcostitemcode(String ccostitemcode)
{
	this.ccostitemcode = ccostitemcode;
}
public String getCcostitemname()
{
	return ccostitemname;
}
public void setCcostitemname(String ccostitemname)
{
	this.ccostitemname = ccostitemname;
}
public String getCparentcode()
{
	return cparentcode;
}
public void setCparentcode(String cparentcode)
{
	this.cparentcode = cparentcode;
}
public String getCdirect()
{
	return cdirect;
}
public void setCdirect(String cdirect)
{
	this.cdirect = cdirect;
}
public String getCchange()
{
	return cchange;
}
public void setCchange(String cchange)
{
	this.cchange = cchange;
}
public String getCcontrol()
{
	return ccontrol;
}
public void setCcontrol(String ccontrol)
{
	this.ccontrol = ccontrol;
}
public String getCtm()
{
	return ctm;
}
public void setCtm(String ctm)
{
	this.ctm = ctm;
}
public String getCstop()
{
	return cstop;
}
public void setCstop(String cstop)
{
	this.cstop = cstop;
}
public String getCcostkindcode()
{
	return ccostkindcode;
}
public void setCcostkindcode(String ccostkindcode)
{
	this.ccostkindcode = ccostkindcode;
}
public String getCshareparamcode()
{
	return cshareparamcode;
}
public void setCshareparamcode(String cshareparamcode)
{
	this.cshareparamcode = cshareparamcode;
}
public String getCend()
{
	return cend;
}
public void setCend(String cend)
{
	this.cend = cend;
}
public String getCsource()
{
	return csource;
}
public void setCsource(String csource)
{
	this.csource = csource;
}
public String getCsubject()
{
	return csubject;
}
public void setCsubject(String csubject)
{
	this.csubject = csubject;
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
public String getIgrade()
{
	return igrade;
}
public void setIgrade(String igrade)
{
	this.igrade = igrade;
}
@Override
public String toString()
{
	return JSON.toJSONString(this);
}
}

