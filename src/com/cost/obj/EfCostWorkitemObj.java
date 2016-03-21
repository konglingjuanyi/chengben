package com.cost.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;
public class EfCostWorkitemObj extends BaseDbObj
{
private Long id;
private String cworkitemcode;
private String cworkitemname;
private Long iweight;
private String cdeptkindcode;
private String cshare;
private String canalysis;
private String chisitemcode;
private String cmodifier;
private Timestamp dnmodifytime;
//private String ufts;
private Long issys;
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
	return "ef_cost_workitem";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "EfCostWorkitem";
}
@Override
public String getCnName()
{
	return "工作项目";
}
public LinkedHashMap<String, String> getProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", "工作项目ID");
		pros.put("cworkitemcode", "工作项目编码");
		pros.put("cworkitemname", "工作项目名称");
		pros.put("iweight", "当量");
		pros.put("cdeptkindcode", "科室类别编码");
		pros.put("cshare", "是否参与分摊");
		pros.put("canalysis", "是否用于本量利分析");
//		pros.put("chisitemcode", "对应HIS工作项目编码");
//		pros.put("cmodifier", "cmodifier");
//		pros.put("dnmodifytime", "dnmodifytime");
//		pros.put("ufts", "ufts");
//		pros.put("issys", "issys");
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
public String getCworkitemcode()
{
	return cworkitemcode;
}
public void setCworkitemcode(String cworkitemcode)
{
	this.cworkitemcode = cworkitemcode;
}
public String getCworkitemname()
{
	return cworkitemname;
}
public void setCworkitemname(String cworkitemname)
{
	this.cworkitemname = cworkitemname;
}
public Long getIweight()
{
	return iweight;
}
public void setIweight(Long iweight)
{
	this.iweight = iweight;
}
public String getCdeptkindcode()
{
	return cdeptkindcode;
}
public void setCdeptkindcode(String cdeptkindcode)
{
	this.cdeptkindcode = cdeptkindcode;
}
public String getCshare()
{
	return cshare;
}
public void setCshare(String cshare)
{
	this.cshare = cshare;
}
public String getCanalysis()
{
	return canalysis;
}
public void setCanalysis(String canalysis)
{
	this.canalysis = canalysis;
}
public String getChisitemcode()
{
	return chisitemcode;
}
public void setChisitemcode(String chisitemcode)
{
	this.chisitemcode = chisitemcode;
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
public Long getIssys()
{
	return issys;
}
public void setIssys(Long issys)
{
	this.issys = issys;
}
@Override
public String toString()
{
	return JSON.toJSONString(this);
}
}

