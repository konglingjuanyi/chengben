package com.chengben.obj;

import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;

public class CostShareRuleObj extends BaseDbObj
{
	private Long id;
	private String date_month;
	private String department_code;
	private String department_type;
	private String department_name;
	private Double share_rate_level_1;
	private Double share_rate_level_2;
	private Double share_rate_level_3;
	private Double income;
	private Double cost_per_bed;
	private Double cost_per_treat;
	private Timestamp last_modify_time;
	private String last_modify_account;

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
		return "cost_share_rule";
	}

	@Override
	public String getBasePath()
	{
		return "CostShareRule";
	}

	@Override
	public String getCnName()
	{
		return "成本分摊规则";
	}

	public LinkedHashMap<String, String> getProperties()
	{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", " 编号");
		pros.put("date_month", "月份");
		pros.put("department_code", "科室编号");
		pros.put("department_type", "科室类型");
		pros.put("department_name", "科室名称");
		pros.put("share_rate_level_1", "一级分摊占比");
		pros.put("share_rate_level_2", "二级分摊占比");
		pros.put("share_rate_level_3", "三级分摊占比");
		pros.put("income", "科室收入");
		pros.put("cost_per_bed", "床日成本");
		pros.put("cost_per_treat", "诊次成本");
		// pros.put("last_modify_time", "修改时间");
		// pros.put("last_modify_account", "修改人");
		return pros;
	}

	public String getDate_month()
	{
		return date_month;
	}

	public void setDate_month(String date_month)
	{
		this.date_month = date_month;
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

	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	public String getDepartment_code()
	{
		return department_code;
	}

	public void setDepartment_code(String department_code)
	{
		this.department_code = department_code;
	}

	public String getDepartment_type()
	{
		return department_type;
	}

	public void setDepartment_type(String department_type)
	{
		this.department_type = department_type;
	}

	public String getDepartment_name()
	{
		return department_name;
	}

	public void setDepartment_name(String department_name)
	{
		this.department_name = department_name;
	}

	public Double getShare_rate_level_1()
	{
		return share_rate_level_1;
	}

	public void setShare_rate_level_1(Double share_rate_level_1)
	{
		this.share_rate_level_1 = share_rate_level_1;
	}

	public Double getShare_rate_level_2()
	{
		return share_rate_level_2;
	}

	public void setShare_rate_level_2(Double share_rate_level_2)
	{
		this.share_rate_level_2 = share_rate_level_2;
	}

	public Double getShare_rate_level_3()
	{
		return share_rate_level_3;
	}

	public void setShare_rate_level_3(Double share_rate_level_3)
	{
		this.share_rate_level_3 = share_rate_level_3;
	}

	public Timestamp getLast_modify_time()
	{
		return last_modify_time;
	}

	public void setLast_modify_time(Timestamp last_modify_time)
	{
		this.last_modify_time = last_modify_time;
	}

	public String getLast_modify_account()
	{
		return last_modify_account;
	}

	public void setLast_modify_account(String last_modify_account)
	{
		this.last_modify_account = last_modify_account;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}
}
