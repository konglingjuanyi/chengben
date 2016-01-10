package com.chengben.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;

public class VCostFinalObj extends BaseDbObj
{
	private String date_month;
	private String department_type;
	private String department_code;
	private String department_name;
	private Double renyuan_jingfei;
	private Double renyuan_jingfei_share;
	private Double renyuan_jingfei_sum;
	private Double weisheng_cailiao;
	private Double weisheng_cailiao_share;
	private Double weisheng_cailiao_sum;
	private Double yaopin;
	private Double yaopin_share;
	private Double yaopin_sum;
	private Double guding_zichan_zhejiu;
	private Double guding_zichan_zhejiu_share;
	private Double guding_zichan_zhejiu_sum;
	private Double wuxing_zichan_tanxiao;
	private Double wuxing_zichan_tanxiao_share;
	private Double wuxing_zichan_tanxiao_sum;
	private Double tiqu_yiliao_fengxian_jijin;
	private Double tiqu_yiliao_fengxian_jijin_share;
	private Double tiqu_yiliao_fengxian_jijin_sum;
	private Double qita_feiyong;
	private Double qita_feiyong_share;
	private Double qita_feiyong_sum;
	private Double heji;
	private Double heji_share;
	private Double heji_sum;
	private Double direct_total;
	private Double share_total;
	private Double total;
	private Double renyuan_jingfei_sum_rate;
	private Double weisheng_cailiao_sum_rate;
	private Double yaopin_sum_rate;
	private Double guding_zichan_zhejiu_sum_rate;
	private Double wuxing_zichan_tanxiao_sum_rate;
	private Double tiqu_yiliao_fengxian_jijin_sum_rate;
	private Double qita_feiyong_sum_rate;
	private Double heji_sum_rate;
	private Double total_rate;
	private Double income;
	private Double cost_per_bed;
	private Double cost_per_treat;

	@Override
	public String findKeyColumnName()
	{
		return "department_code";
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
		return "v_cost_final";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return super.findDefaultOrderBy();
	}

	@Override
	public String getBasePath()
	{
		return "VCostFinal";
	}

	@Override
	public String getCnName()
	{
		return "成本分摊报表";
	}

	public LinkedHashMap<String, String> getProperties()
	{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("date_month", "月份");
		pros.put("department_type", "科室类型");
		pros.put("department_code", "科室编号");
		pros.put("department_name", "科室");
		pros.put("renyuan_jingfei", "人员经费-直接成本");
		pros.put("renyuan_jingfei_share", "人员经费-间接成本");
		pros.put("renyuan_jingfei_sum", "人员经费-全成本");
		pros.put("weisheng_cailiao", "卫生材料费-直接成本");
		pros.put("weisheng_cailiao_share", "卫生材料费-间接成本");
		pros.put("weisheng_cailiao_sum", "卫生材料费-全成本");
		pros.put("yaopin", "药品费-直接成本");
		pros.put("yaopin_share", "药品费-间接成本");
		pros.put("yaopin_sum", "药品费-全成本");
		pros.put("guding_zichan_zhejiu", "固定资产折旧费-直接成本");
		pros.put("guding_zichan_zhejiu_share", "固定资产折旧费-间接成本");
		pros.put("guding_zichan_zhejiu_sum", "固定资产折旧费-全成本");
		pros.put("wuxing_zichan_tanxiao", "无形资产摊销-直接成本");
		pros.put("wuxing_zichan_tanxiao_share", "无形资产摊销-间接成本");
		pros.put("wuxing_zichan_tanxiao_sum", "无形资产摊销-全成本");
		pros.put("tiqu_yiliao_fengxian_jijin", "提取医疗风险基金-直接成本");
		pros.put("tiqu_yiliao_fengxian_jijin_share", "提取医疗风险基金-间接成本");
		pros.put("tiqu_yiliao_fengxian_jijin_sum", "提取医疗风险基金-全成本");
		pros.put("qita_feiyong", "其他费用-直接成本");
		pros.put("qita_feiyong_share", "其他成本-间接成本");
		pros.put("qita_feiyong_sum", "其他成本-全成本");
		pros.put("heji", "合计-直接成本");
		pros.put("heji_share", "合计-间接成本");
		pros.put("heji_sum", "合计-全成本");
		pros.put("direct_total", "直接成本-合计");
		pros.put("share_total", "间接成本-合计");
		pros.put("total", "全成本-合计");
		pros.put("renyuan_jingfei_rate", "人员经费-占比");
		pros.put("weisheng_cailiao_rate", "卫生材料费-占比");
		pros.put("yaopin_rate", "药品费-占比");
		pros.put("guding_zichan_zhejiu_rate", "固定资产折旧费-占比");
		pros.put("wuxing_zichan_tanxiao_rate", "无形资产摊销-占比");
		pros.put("tiqu_yiliao_fengxian_jijin_rate", "提取医疗风险基金-占比");
		pros.put("qita_feiyong_rate", "其他费用-占比");
		pros.put("heji_rate", "合计-占比");
		pros.put("income", "科室收入");
		pros.put("cost_per_bed", "床日成本");
		pros.put("cost_per_treat", "诊次成本");
		return pros;
	}

	public Double getIncome()
	{
		return income;
	}

	public void setIncome(Double income)
	{
		this.income = income;
	}

	public Double getCost_per_bed()
	{
		return cost_per_bed;
	}

	public void setCost_per_bed(Double cost_per_bed)
	{
		this.cost_per_bed = cost_per_bed;
	}

	public Double getCost_per_treat()
	{
		return cost_per_treat;
	}

	public void setCost_per_treat(Double cost_per_treat)
	{
		this.cost_per_treat = cost_per_treat;
	}

	public String getDate_month()
	{
		return date_month;
	}

	public void setDate_month(String date_month)
	{
		this.date_month = date_month;
	}

	public String getDepartment_type()
	{
		return department_type;
	}

	public void setDepartment_type(String department_type)
	{
		this.department_type = department_type;
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

	public Double getRenyuan_jingfei_share()
	{
		return renyuan_jingfei_share;
	}

	public void setRenyuan_jingfei_share(Double renyuan_jingfei_share)
	{
		this.renyuan_jingfei_share = renyuan_jingfei_share;
	}

	public Double getRenyuan_jingfei_sum()
	{
		return renyuan_jingfei_sum;
	}

	public void setRenyuan_jingfei_sum(Double renyuan_jingfei_sum)
	{
		this.renyuan_jingfei_sum = renyuan_jingfei_sum;
	}

	public Double getWeisheng_cailiao()
	{
		return weisheng_cailiao;
	}

	public void setWeisheng_cailiao(Double weisheng_cailiao)
	{
		this.weisheng_cailiao = weisheng_cailiao;
	}

	public Double getWeisheng_cailiao_share()
	{
		return weisheng_cailiao_share;
	}

	public void setWeisheng_cailiao_share(Double weisheng_cailiao_share)
	{
		this.weisheng_cailiao_share = weisheng_cailiao_share;
	}

	public Double getWeisheng_cailiao_sum()
	{
		return weisheng_cailiao_sum;
	}

	public void setWeisheng_cailiao_sum(Double weisheng_cailiao_sum)
	{
		this.weisheng_cailiao_sum = weisheng_cailiao_sum;
	}

	public Double getYaopin()
	{
		return yaopin;
	}

	public void setYaopin(Double yaopin)
	{
		this.yaopin = yaopin;
	}

	public Double getYaopin_share()
	{
		return yaopin_share;
	}

	public void setYaopin_share(Double yaopin_share)
	{
		this.yaopin_share = yaopin_share;
	}

	public Double getYaopin_sum()
	{
		return yaopin_sum;
	}

	public void setYaopin_sum(Double yaopin_sum)
	{
		this.yaopin_sum = yaopin_sum;
	}

	public Double getGuding_zichan_zhejiu()
	{
		return guding_zichan_zhejiu;
	}

	public void setGuding_zichan_zhejiu(Double guding_zichan_zhejiu)
	{
		this.guding_zichan_zhejiu = guding_zichan_zhejiu;
	}

	public Double getGuding_zichan_zhejiu_share()
	{
		return guding_zichan_zhejiu_share;
	}

	public void setGuding_zichan_zhejiu_share(Double guding_zichan_zhejiu_share)
	{
		this.guding_zichan_zhejiu_share = guding_zichan_zhejiu_share;
	}

	public Double getGuding_zichan_zhejiu_sum()
	{
		return guding_zichan_zhejiu_sum;
	}

	public void setGuding_zichan_zhejiu_sum(Double guding_zichan_zhejiu_sum)
	{
		this.guding_zichan_zhejiu_sum = guding_zichan_zhejiu_sum;
	}

	public Double getWuxing_zichan_tanxiao()
	{
		return wuxing_zichan_tanxiao;
	}

	public void setWuxing_zichan_tanxiao(Double wuxing_zichan_tanxiao)
	{
		this.wuxing_zichan_tanxiao = wuxing_zichan_tanxiao;
	}

	public Double getWuxing_zichan_tanxiao_share()
	{
		return wuxing_zichan_tanxiao_share;
	}

	public void setWuxing_zichan_tanxiao_share(Double wuxing_zichan_tanxiao_share)
	{
		this.wuxing_zichan_tanxiao_share = wuxing_zichan_tanxiao_share;
	}

	public Double getWuxing_zichan_tanxiao_sum()
	{
		return wuxing_zichan_tanxiao_sum;
	}

	public void setWuxing_zichan_tanxiao_sum(Double wuxing_zichan_tanxiao_sum)
	{
		this.wuxing_zichan_tanxiao_sum = wuxing_zichan_tanxiao_sum;
	}

	public Double getTiqu_yiliao_fengxian_jijin()
	{
		return tiqu_yiliao_fengxian_jijin;
	}

	public void setTiqu_yiliao_fengxian_jijin(Double tiqu_yiliao_fengxian_jijin)
	{
		this.tiqu_yiliao_fengxian_jijin = tiqu_yiliao_fengxian_jijin;
	}

	public Double getTiqu_yiliao_fengxian_jijin_share()
	{
		return tiqu_yiliao_fengxian_jijin_share;
	}

	public void setTiqu_yiliao_fengxian_jijin_share(Double tiqu_yiliao_fengxian_jijin_share)
	{
		this.tiqu_yiliao_fengxian_jijin_share = tiqu_yiliao_fengxian_jijin_share;
	}

	public Double getTiqu_yiliao_fengxian_jijin_sum()
	{
		return tiqu_yiliao_fengxian_jijin_sum;
	}

	public void setTiqu_yiliao_fengxian_jijin_sum(Double tiqu_yiliao_fengxian_jijin_sum)
	{
		this.tiqu_yiliao_fengxian_jijin_sum = tiqu_yiliao_fengxian_jijin_sum;
	}

	public Double getQita_feiyong()
	{
		return qita_feiyong;
	}

	public void setQita_feiyong(Double qita_feiyong)
	{
		this.qita_feiyong = qita_feiyong;
	}

	public Double getQita_feiyong_share()
	{
		return qita_feiyong_share;
	}

	public void setQita_feiyong_share(Double qita_feiyong_share)
	{
		this.qita_feiyong_share = qita_feiyong_share;
	}

	public Double getQita_feiyong_sum()
	{
		return qita_feiyong_sum;
	}

	public void setQita_feiyong_sum(Double qita_feiyong_sum)
	{
		this.qita_feiyong_sum = qita_feiyong_sum;
	}

	public Double getHeji()
	{
		return heji;
	}

	public void setHeji(Double heji)
	{
		this.heji = heji;
	}

	public Double getHeji_share()
	{
		return heji_share;
	}

	public void setHeji_share(Double heji_share)
	{
		this.heji_share = heji_share;
	}

	public Double getHeji_sum()
	{
		return heji_sum;
	}

	public void setHeji_sum(Double heji_sum)
	{
		this.heji_sum = heji_sum;
	}

	public Double getDirect_total()
	{
		return direct_total;
	}

	public void setDirect_total(Double direct_total)
	{
		this.direct_total = direct_total;
	}

	public Double getShare_total()
	{
		return share_total;
	}

	public void setShare_total(Double share_total)
	{
		this.share_total = share_total;
	}

	public Double getTotal()
	{
		return total;
	}

	public void setTotal(Double total)
	{
		this.total = total;
	}

	public Double getRenyuan_jingfei_sum_rate()
	{
		return renyuan_jingfei_sum_rate;
	}

	public void setRenyuan_jingfei_sum_rate(Double renyuan_jingfei_sum_rate)
	{
		this.renyuan_jingfei_sum_rate = renyuan_jingfei_sum_rate;
	}

	public Double getWeisheng_cailiao_sum_rate()
	{
		return weisheng_cailiao_sum_rate;
	}

	public void setWeisheng_cailiao_sum_rate(Double weisheng_cailiao_sum_rate)
	{
		this.weisheng_cailiao_sum_rate = weisheng_cailiao_sum_rate;
	}

	public Double getYaopin_sum_rate()
	{
		return yaopin_sum_rate;
	}

	public void setYaopin_sum_rate(Double yaopin_sum_rate)
	{
		this.yaopin_sum_rate = yaopin_sum_rate;
	}

	public Double getGuding_zichan_zhejiu_sum_rate()
	{
		return guding_zichan_zhejiu_sum_rate;
	}

	public void setGuding_zichan_zhejiu_sum_rate(Double guding_zichan_zhejiu_sum_rate)
	{
		this.guding_zichan_zhejiu_sum_rate = guding_zichan_zhejiu_sum_rate;
	}

	public Double getWuxing_zichan_tanxiao_sum_rate()
	{
		return wuxing_zichan_tanxiao_sum_rate;
	}

	public void setWuxing_zichan_tanxiao_sum_rate(Double wuxing_zichan_tanxiao_sum_rate)
	{
		this.wuxing_zichan_tanxiao_sum_rate = wuxing_zichan_tanxiao_sum_rate;
	}

	public Double getTiqu_yiliao_fengxian_jijin_sum_rate()
	{
		return tiqu_yiliao_fengxian_jijin_sum_rate;
	}

	public void setTiqu_yiliao_fengxian_jijin_sum_rate(Double tiqu_yiliao_fengxian_jijin_sum_rate)
	{
		this.tiqu_yiliao_fengxian_jijin_sum_rate = tiqu_yiliao_fengxian_jijin_sum_rate;
	}

	public Double getQita_feiyong_sum_rate()
	{
		return qita_feiyong_sum_rate;
	}

	public void setQita_feiyong_sum_rate(Double qita_feiyong_sum_rate)
	{
		this.qita_feiyong_sum_rate = qita_feiyong_sum_rate;
	}

	public Double getHeji_sum_rate()
	{
		return heji_sum_rate;
	}

	public void setHeji_sum_rate(Double heji_sum_rate)
	{
		this.heji_sum_rate = heji_sum_rate;
	}

	public Double getTotal_rate()
	{
		return total_rate;
	}

	public void setTotal_rate(Double total_rate)
	{
		this.total_rate = total_rate;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
