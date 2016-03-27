package com.chengben.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import com.alibaba.fastjson.JSON;
public class CostDirectObj extends BaseDbObj
{
private Long id;
private String date_month;
private String department_code;
private String department_name;
private Double renyuan_jingfei;
private Double weisheng_cailiao;
private Double yaopin;
private Double guding_zichan_zhejiu;
private Double wuxing_zichan_tanxiao;
private Double tiqu_yiliao_fengxian_jijin;
private Double qita_feiyong;
private Double heji;
private String department_type_code;
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
	return "cost_direct";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "CostDirect";
}
@Override
public String getCnName()
{
	return "各科室直接成本表";
}
public LinkedHashMap<String, String> getProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", "id");
//		pros.put("date_month", "月份");
//		pros.put("department_code", "科室编码");
		pros.put("department_name", "科室名");
		pros.put("renyuan_jingfei", "人员经费");
		pros.put("weisheng_cailiao", "卫生材料费");
		pros.put("yaopin", "药品费");
		pros.put("guding_zichan_zhejiu", "固定资产折旧费");
		pros.put("wuxing_zichan_tanxiao", "无形资产摊销");
		pros.put("tiqu_yiliao_fengxian_jijin", "提取医疗风险基金");
		pros.put("qita_feiyong", "其他费用");
//		pros.put("heji", "合计");
//		pros.put("department_type", "科室类型");
		return pros;
}
@Override
public List<String> getUniqueIndexProperties()
{
	List<String> l = new ArrayList<String>();
	l.add("date_month");
	l.add("department_name");
	return l;
}
public Long getId()
{
	return id;
}
public void setId(Long id)
{
	this.id = id;
}
public String getDate_month()
{
	return date_month;
}
public void setDate_month(String date_month)
{
	this.date_month = date_month;
}
public String getDepartment_code()
{
	return department_code;
}
public void setDepartment_code(String department_code)
{
	this.department_code = department_code;
}
public String getDepartment_name()
{
	return department_name;
}
public void setDepartment_name(String department_name)
{
	this.department_name = department_name;
}
public Double getRenyuan_jingfei()
{
	return renyuan_jingfei;
}
public void setRenyuan_jingfei(Double renyuan_jingfei)
{
	this.renyuan_jingfei = renyuan_jingfei;
}
public Double getWeisheng_cailiao()
{
	return weisheng_cailiao;
}
public void setWeisheng_cailiao(Double weisheng_cailiao)
{
	this.weisheng_cailiao = weisheng_cailiao;
}
public Double getYaopin()
{
	return yaopin;
}
public void setYaopin(Double yaopin)
{
	this.yaopin = yaopin;
}
public Double getGuding_zichan_zhejiu()
{
	return guding_zichan_zhejiu;
}
public void setGuding_zichan_zhejiu(Double guding_zichan_zhejiu)
{
	this.guding_zichan_zhejiu = guding_zichan_zhejiu;
}
public Double getWuxing_zichan_tanxiao()
{
	return wuxing_zichan_tanxiao;
}
public void setWuxing_zichan_tanxiao(Double wuxing_zichan_tanxiao)
{
	this.wuxing_zichan_tanxiao = wuxing_zichan_tanxiao;
}
public Double getTiqu_yiliao_fengxian_jijin()
{
	return tiqu_yiliao_fengxian_jijin;
}
public void setTiqu_yiliao_fengxian_jijin(Double tiqu_yiliao_fengxian_jijin)
{
	this.tiqu_yiliao_fengxian_jijin = tiqu_yiliao_fengxian_jijin;
}
public Double getQita_feiyong()
{
	return qita_feiyong;
}
public void setQita_feiyong(Double qita_feiyong)
{
	this.qita_feiyong = qita_feiyong;
}
public Double getHeji()
{
	return heji;
}
public void setHeji(Double heji)
{
	this.heji = heji;
}

public String getDepartment_type_code()
{
	return department_type_code;
}
public void setDepartment_type_code(String department_type_code)
{
	this.department_type_code = department_type_code;
}
@Override
public String toString()
{
	return JSON.toJSONString(this);
}
}

