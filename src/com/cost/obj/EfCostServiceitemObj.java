package com.cost.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;
public class EfCostServiceitemObj extends BaseDbObj
{
private Long id;
private String cserviceitemcode;
private String cserviceitemname;
private Long iserviceweight;
private String cdeptcode;
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
	return "ef_cost_serviceitem";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "EfCostServiceitem";
}
@Override
public String getCnName()
{
	return "服务项目";
}
public LinkedHashMap<String, String> getProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", "服务项目ID");
		pros.put("cserviceitemcode", "服务项目编码");
		pros.put("cserviceitemname", "服务项目名称");
		pros.put("iserviceweight", "服务当量");
		pros.put("cdeptcode", "科室编码");
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
public String getCserviceitemcode()
{
	return cserviceitemcode;
}
public void setCserviceitemcode(String cserviceitemcode)
{
	this.cserviceitemcode = cserviceitemcode;
}
public String getCserviceitemname()
{
	return cserviceitemname;
}
public void setCserviceitemname(String cserviceitemname)
{
	this.cserviceitemname = cserviceitemname;
}
public Long getIserviceweight()
{
	return iserviceweight;
}
public void setIserviceweight(Long iserviceweight)
{
	this.iserviceweight = iserviceweight;
}
public String getCdeptcode()
{
	return cdeptcode;
}
public void setCdeptcode(String cdeptcode)
{
	this.cdeptcode = cdeptcode;
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

