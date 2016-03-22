package com.cost.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;
public class EfCostSharefunObj extends BaseDbObj
{
private Long id;
private String cdeptcode;
private String csharefun;
private String cmemo;
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
	return "ef_cost_sharefun";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "EfCostSharefun";
}
@Override
public String getCnName()
{
	return "分摊方法";
}
public LinkedHashMap<String, String> getProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", "分摊方法ID");
		pros.put("cdeptcode", "核算科室编码");
		pros.put("csharefun", "分摊方法");
		pros.put("cmemo", "备注");
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
public String getCsharefun()
{
	return csharefun;
}
public void setCsharefun(String csharefun)
{
	this.csharefun = csharefun;
}
public String getCmemo()
{
	return cmemo;
}
public void setCmemo(String cmemo)
{
	this.cmemo = cmemo;
}
@Override
public String toString()
{
	return JSON.toJSONString(this);
}
}

