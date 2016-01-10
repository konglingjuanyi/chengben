package com.chengben.obj;

import java.util.ArrayList;
import java.util.List;

public class CostShareRuleWrapperObj extends CostShareRuleObj
{
	List<VCostShareRuleObj> level1 = new ArrayList<VCostShareRuleObj>();
	List<VCostShareRuleObj> level2 = new ArrayList<VCostShareRuleObj>();
	List<VCostShareRuleObj> level3 = new ArrayList<VCostShareRuleObj>();
	
	public List<VCostShareRuleObj> getLevel1()
	{
		return level1;
	}
	public void setLevel1(List<VCostShareRuleObj> level1)
	{
		this.level1 = level1;
	}
	public List<VCostShareRuleObj> getLevel2()
	{
		return level2;
	}
	public void setLevel2(List<VCostShareRuleObj> level2)
	{
		this.level2 = level2;
	}
	public List<VCostShareRuleObj> getLevel3()
	{
		return level3;
	}
	public void setLevel3(List<VCostShareRuleObj> level3)
	{
		this.level3 = level3;
	}
}
