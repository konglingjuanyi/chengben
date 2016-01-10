package com.chengben.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;

public class VCostFinalSumbyCosttypeObj extends BaseDbObj
{
	private String date_month;
	private String department_type;
	private Double renyuan_jingfei = 0d;
	private Double weisheng_cailiao = 0d;
	private Double yaopin = 0d;
	private Double guding_zichan_zhejiu = 0d;
	private Double wuxing_zichan_tanxiao = 0d;
	private Double tiqu_yiliao_fengxian_jijin = 0d;
	private Double qita_feiyong = 0d;
	private Double renyuan_jingfei_share = 0d;
	private Double weisheng_cailiao_share = 0d;
	private Double yaopin_share = 0d;
	private Double guding_zichan_zhejiu_share = 0d;
	private Double wuxing_zichan_tanxiao_share = 0d;
	private Double tiqu_yiliao_fengxian_jijin_share = 0d;
	private Double qita_feiyong_share = 0d;
	private Double renyuan_jingfei_sum = 0d;
	private Double weisheng_cailiao_sum = 0d;
	private Double yaopin_sum = 0d;
	private Double guding_zichan_zhejiu_sum = 0d;
	private Double wuxing_zichan_tanxiao_sum = 0d;
	private Double tiqu_yiliao_fengxian_jijin_sum = 0d;
	private Double qita_feiyong_sum = 0d;
	private Double direct_total = 0d;
	private Double share_total = 0d;
	private Double total = 0d;
	private Double total_rate = 0d;
	private Double income_sum = 0d;
	private Double renyuan_jingfei_sum_rate = 0d;
	private Double weisheng_cailiao_sum_rate = 0d;
	private Double yaopin_sum_rate = 0d;
	private Double guding_zichan_zhejiu_sum_rate = 0d;
	private Double wuxing_zichan_tanxiao_sum_rate = 0d;
	private Double tiqu_yiliao_fengxian_jijin_sum_rate = 0d;
	private Double qita_feiyong_sum_rate = 0d;

	@Override
	public String findKeyColumnName()
	{
		return "department_type";
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
		return "v_cost_final_sumby_costtype";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return super.findDefaultOrderBy();
	}

	@Override
	public String getBasePath()
	{
		return "VCostFinalSumbyCosttype";
	}

	@Override
	public String getCnName()
	{
		return "按费用类型合计";
	}

	public LinkedHashMap<String, String> getProperties()
	{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		// pros.put("date_month", "date_month");
		// pros.put("department_type", "department_type");
		// pros.put("renyuan_jingfei", "renyuan_jingfei");
		// pros.put("weisheng_cailiao", "weisheng_cailiao");
		// pros.put("yaopin", "yaopin");
		// pros.put("guding_zichan_zhejiu", "guding_zichan_zhejiu");
		// pros.put("wuxing_zichan_tanxiao", "wuxing_zichan_tanxiao");
		// pros.put("tiqu_yiliao_fengxian_jijin", "tiqu_yiliao_fengxian_jijin");
		// pros.put("qita_feiyong", "qita_feiyong");
		// pros.put("renyuan_jingfei_share", "renyuan_jingfei_share");
		// pros.put("weisheng_cailiao_share", "weisheng_cailiao_share");
		// pros.put("yaopin_share", "yaopin_share");
		// pros.put("guding_zichan_zhejiu_share", "guding_zichan_zhejiu_share");
		// pros.put("wuxing_zichan_tanxiao_share",
		// "wuxing_zichan_tanxiao_share");
		// pros.put("tiqu_yiliao_fengxian_jijin_share",
		// "tiqu_yiliao_fengxian_jijin_share");
		// pros.put("qita_feiyong_share", "qita_feiyong_share");
		// pros.put("renyuan_jingfei_sum", "renyuan_jingfei_sum");
		// pros.put("weisheng_cailiao_sum", "weisheng_cailiao_sum");
		// pros.put("yaopin_sum", "yaopin_sum");
		// pros.put("guding_zichan_zhejiu_sum", "guding_zichan_zhejiu_sum");
		// pros.put("wuxing_zichan_tanxiao_sum", "wuxing_zichan_tanxiao_sum");
		// pros.put("tiqu_yiliao_fengxian_jijin_sum",
		// "tiqu_yiliao_fengxian_jijin_sum");
		// pros.put("qita_feiyong_sum", "qita_feiyong_sum");
		// pros.put("direct_total", "direct_total");
		// pros.put("share_total", "share_total");
		// pros.put("total", "total");
		return pros;
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

	public Double getRenyuan_jingfei_share()
	{
		return renyuan_jingfei_share;
	}

	public void setRenyuan_jingfei_share(Double renyuan_jingfei_share)
	{
		this.renyuan_jingfei_share = renyuan_jingfei_share;
	}

	public Double getWeisheng_cailiao_share()
	{
		return weisheng_cailiao_share;
	}

	public void setWeisheng_cailiao_share(Double weisheng_cailiao_share)
	{
		this.weisheng_cailiao_share = weisheng_cailiao_share;
	}

	public Double getYaopin_share()
	{
		return yaopin_share;
	}

	public void setYaopin_share(Double yaopin_share)
	{
		this.yaopin_share = yaopin_share;
	}

	public Double getGuding_zichan_zhejiu_share()
	{
		return guding_zichan_zhejiu_share;
	}

	public void setGuding_zichan_zhejiu_share(Double guding_zichan_zhejiu_share)
	{
		this.guding_zichan_zhejiu_share = guding_zichan_zhejiu_share;
	}

	public Double getWuxing_zichan_tanxiao_share()
	{
		return wuxing_zichan_tanxiao_share;
	}

	public void setWuxing_zichan_tanxiao_share(Double wuxing_zichan_tanxiao_share)
	{
		this.wuxing_zichan_tanxiao_share = wuxing_zichan_tanxiao_share;
	}

	public Double getTiqu_yiliao_fengxian_jijin_share()
	{
		return tiqu_yiliao_fengxian_jijin_share;
	}

	public void setTiqu_yiliao_fengxian_jijin_share(Double tiqu_yiliao_fengxian_jijin_share)
	{
		this.tiqu_yiliao_fengxian_jijin_share = tiqu_yiliao_fengxian_jijin_share;
	}

	public Double getQita_feiyong_share()
	{
		return qita_feiyong_share;
	}

	public void setQita_feiyong_share(Double qita_feiyong_share)
	{
		this.qita_feiyong_share = qita_feiyong_share;
	}

	public Double getRenyuan_jingfei_sum()
	{
		return renyuan_jingfei_sum;
	}

	public void setRenyuan_jingfei_sum(Double renyuan_jingfei_sum)
	{
		this.renyuan_jingfei_sum = renyuan_jingfei_sum;
	}

	public Double getWeisheng_cailiao_sum()
	{
		return weisheng_cailiao_sum;
	}

	public void setWeisheng_cailiao_sum(Double weisheng_cailiao_sum)
	{
		this.weisheng_cailiao_sum = weisheng_cailiao_sum;
	}

	public Double getYaopin_sum()
	{
		return yaopin_sum;
	}

	public void setYaopin_sum(Double yaopin_sum)
	{
		this.yaopin_sum = yaopin_sum;
	}

	public Double getGuding_zichan_zhejiu_sum()
	{
		return guding_zichan_zhejiu_sum;
	}

	public void setGuding_zichan_zhejiu_sum(Double guding_zichan_zhejiu_sum)
	{
		this.guding_zichan_zhejiu_sum = guding_zichan_zhejiu_sum;
	}

	public Double getWuxing_zichan_tanxiao_sum()
	{
		return wuxing_zichan_tanxiao_sum;
	}

	public void setWuxing_zichan_tanxiao_sum(Double wuxing_zichan_tanxiao_sum)
	{
		this.wuxing_zichan_tanxiao_sum = wuxing_zichan_tanxiao_sum;
	}

	public Double getTiqu_yiliao_fengxian_jijin_sum()
	{
		return tiqu_yiliao_fengxian_jijin_sum;
	}

	public void setTiqu_yiliao_fengxian_jijin_sum(Double tiqu_yiliao_fengxian_jijin_sum)
	{
		this.tiqu_yiliao_fengxian_jijin_sum = tiqu_yiliao_fengxian_jijin_sum;
	}

	public Double getQita_feiyong_sum()
	{
		return qita_feiyong_sum;
	}

	public void setQita_feiyong_sum(Double qita_feiyong_sum)
	{
		this.qita_feiyong_sum = qita_feiyong_sum;
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

	public Double getIncome_sum()
	{
		return income_sum;
	}

	public void setIncome_sum(Double income_sum)
	{
		this.income_sum = income_sum;
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
