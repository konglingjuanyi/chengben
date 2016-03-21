package com.cost.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;
public class EfCostDeptObj extends BaseDbObj
{
private Long id;
private String cdeptcode;
private String cdeptname;
private String cparentcode;
private String cend;
private String csharekindcode;
private String cdeptkindcode;
private String cshareparamcode;
private String cvirtual;
private String cmodifier;
private Timestamp dnmodifytime;
//private String ufts;
private String clevel;
private String tocdeptcode;
private String tocparentcode;
private String igrade;
private String cksstop;
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
	return "ef_cost_dept";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "EfCostDept";
}
@Override
public String getCnName()
{
	return "核算科室";
}
public LinkedHashMap<String, String> getProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", "科室ID");
		pros.put("cdeptcode", "科室编码");
		pros.put("cdeptname", "科室名称");
		pros.put("cparentcode", "上级科室编码");
		pros.put("cend", "是否末级");
		pros.put("csharekindcode", "分摊类别编码");
		pros.put("cdeptkindcode", "科室类别编码");
		pros.put("cshareparamcode", "分摊参数编码");
		pros.put("cvirtual", "是否虚拟");
//		pros.put("cmodifier", "修改人");
//		pros.put("dnmodifytime", "修改时间");
//		pros.put("ufts", "时间戳");
//		pros.put("clevel", "clevel");
//		pros.put("tocdeptcode", "tocdeptcode");
//		pros.put("tocparentcode", "tocparentcode");
		pros.put("igrade", "级次");
		pros.put("cksstop", "是否停用");
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
public String getCdeptcode()
{
	return cdeptcode;
}
public void setCdeptcode(String cdeptcode)
{
	this.cdeptcode = cdeptcode;
}
public String getCdeptname()
{
	return cdeptname;
}
public void setCdeptname(String cdeptname)
{
	this.cdeptname = cdeptname;
}
public String getCparentcode()
{
	return cparentcode;
}
public void setCparentcode(String cparentcode)
{
	this.cparentcode = cparentcode;
}
public String getCend()
{
	return cend;
}
public void setCend(String cend)
{
	this.cend = cend;
}
public String getCsharekindcode()
{
	return csharekindcode;
}
public void setCsharekindcode(String csharekindcode)
{
	this.csharekindcode = csharekindcode;
}
public String getCdeptkindcode()
{
	return cdeptkindcode;
}
public void setCdeptkindcode(String cdeptkindcode)
{
	this.cdeptkindcode = cdeptkindcode;
}
public String getCshareparamcode()
{
	return cshareparamcode;
}
public void setCshareparamcode(String cshareparamcode)
{
	this.cshareparamcode = cshareparamcode;
}
public String getCvirtual()
{
	return cvirtual;
}
public void setCvirtual(String cvirtual)
{
	this.cvirtual = cvirtual;
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
public String getClevel()
{
	return clevel;
}
public void setClevel(String clevel)
{
	this.clevel = clevel;
}
public String getTocdeptcode()
{
	return tocdeptcode;
}
public void setTocdeptcode(String tocdeptcode)
{
	this.tocdeptcode = tocdeptcode;
}
public String getTocparentcode()
{
	return tocparentcode;
}
public void setTocparentcode(String tocparentcode)
{
	this.tocparentcode = tocparentcode;
}
public String getIgrade()
{
	return igrade;
}
public void setIgrade(String igrade)
{
	this.igrade = igrade;
}
public String getCksstop()
{
	return cksstop;
}
public void setCksstop(String cksstop)
{
	this.cksstop = cksstop;
}
@Override
public String toString()
{
	return JSON.toJSONString(this);
}
}

