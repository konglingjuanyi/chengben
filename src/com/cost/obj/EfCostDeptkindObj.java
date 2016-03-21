package com.cost.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;
public class EfCostDeptkindObj extends BaseDbObj
{
private Long id;
private String cdeptkindcode;
private String cdeptkindname;
private String bsystem;
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
	return "ef_cost_deptkind";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "EfCostDeptkind";
}
@Override
public String getCnName()
{
	return "科室类别";
}
public LinkedHashMap<String, String> getProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", "科室类别ID");
		pros.put("cdeptkindcode", "科室类别编码");
		pros.put("cdeptkindname", "科室类别名称");
//		pros.put("bsystem", "是否系统数据");
//		pros.put("bend", "是否末级");
//		pros.put("cmodifier", "修改人");
//		pros.put("dnmodifytime", "修改时间");
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
public String getCdeptkindcode()
{
	return cdeptkindcode;
}
public void setCdeptkindcode(String cdeptkindcode)
{
	this.cdeptkindcode = cdeptkindcode;
}
public String getCdeptkindname()
{
	return cdeptkindname;
}
public void setCdeptkindname(String cdeptkindname)
{
	this.cdeptkindname = cdeptkindname;
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

