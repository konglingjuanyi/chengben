package com.chengben;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.MethodUtils;
import org.apache.log4j.Logger;

import com.chengben.obj.CostShareRuleObj;
import com.chengben.obj.DictDepartmentObj;
import com.chengben.obj.VCostShareRuleObj;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.obj.PaginationObj;
import com.wuyg.common.servlet.AbstractBaseServletTemplate;
import com.wuyg.common.util.StringUtil;

public class VCostShareRuleServlet extends AbstractBaseServletTemplate
{
	private Logger logger = Logger.getLogger(getClass());

	@Override
	public String getBasePath()
	{
		return domainInstance.getBasePath();
	}

	@Override
	public IBaseDAO getDomainDao()
	{
		return new DefaultBaseDAO(getDomainInstanceClz());
	}

	@Override
	public Class getDomainInstanceClz()
	{
		return com.chengben.obj.VCostShareRuleObj.class;
	}

	@Override
	public Class getDomainSearchConditionClz()
	{
		return com.chengben.searchcondition.VCostShareRuleSearchCondition.class;
	}

	// 查询
	public void list4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.list(request, response);
	}

	// 检查ID是否已录入系统
	public void checkId4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.checkId(request, response);
	}

	// 增加 or 修改
	public void addOrModify4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// super.addOrModify(request,response);

		String date_month = request.getParameter("date_month");
		request.setAttribute("date_month", date_month);

		String[] department_types = request.getParameterValues("department_type");
		String[] department_codes = request.getParameterValues("department_code");
		String[] department_names = request.getParameterValues("department_name");
		String[] share_rate_level1s = request.getParameterValues("share_rate_level1");
		String[] share_rate_level2s = request.getParameterValues("share_rate_level2");
		String[] share_rate_level3s = request.getParameterValues("share_rate_level3");
		String[] incomes = request.getParameterValues("income");
		String[] cost_per_beds = request.getParameterValues("cost_per_bed");
		String[] cost_per_treats = request.getParameterValues("cost_per_treat");

		IBaseDAO costShareRuleDAO = new DefaultBaseDAO(CostShareRuleObj.class);
		List<CostShareRuleObj> costShareRuleList = new ArrayList<CostShareRuleObj>();
		long currentMaxId = costShareRuleDAO.getMaxKeyValue();
		for (int i = 0; i < department_codes.length; i++)
		{
			CostShareRuleObj o = new CostShareRuleObj();

			o.setId(currentMaxId++);
			o.setDepartment_type(department_types[i]);
			o.setDepartment_code(department_codes[i]);
			o.setDepartment_name(department_names[i]);
			o.setShare_rate_level_1(StringUtil.parseDouble(share_rate_level1s[i]));
			o.setShare_rate_level_2(StringUtil.parseDouble(share_rate_level2s[i]));
			o.setShare_rate_level_3(StringUtil.parseDouble(share_rate_level3s[i]));
			o.setIncome(StringUtil.parseDouble(incomes[i]));
			o.setCost_per_bed(StringUtil.parseDouble(cost_per_beds[i]));
			o.setCost_per_treat(StringUtil.parseDouble(cost_per_treats[i]));

			o.setDate_month(date_month);

			costShareRuleList.add(o);
		}
		// 先删除再保存
		costShareRuleDAO.deleteByClause("date_month='" + date_month + "'");
		boolean success = costShareRuleDAO.save(costShareRuleList);

		// 声明是新增后转到的详情页面
		request.setAttribute("needRefresh", true);

		// 转向
		if (success)
		{
			preModify4this(request, response);
		} else
		{
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}

	// 修改前查询领域对象信息
	public void preModify4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// super.preModify(request,response);

		String date_month = request.getParameter("date_month");
		request.setAttribute("date_month", date_month);

		// 查询
		List<VCostShareRuleObj> ruleList = getDomainDao().searchByClause(VCostShareRuleObj.class, "date_month='" + date_month + "'", domainInstance.findDefaultOrderBy(), 0, Integer.MAX_VALUE);

		// 如果查询不到，说明没有设置这个月份的分摊规则，则查询出科室信息返回前台
		if (ruleList == null || ruleList.size() == 0)
		{
			IBaseDAO departmentsDAO = new DefaultBaseDAO(DictDepartmentObj.class);
			List<DictDepartmentObj> departments = departmentsDAO.searchByClause(DictDepartmentObj.class, "department_type in('辅助类','医技类','临床类')", "department_type_sort,department_code", 0, Integer.MAX_VALUE);
			for (int i = 0; i < departments.size(); i++)
			{
				DictDepartmentObj d = departments.get(i);
				VCostShareRuleObj rule = new VCostShareRuleObj();
				rule.setDate_month(date_month);
				rule.setDepartment_type(d.getDepartment_type());
				rule.setDepartment_code(d.getDepartment_code());
				rule.setDepartment_name(d.getDepartment_name());
				ruleList.add(rule);
			}
		}

		if (ruleList != null)
		{
			request.setAttribute("ruleList", ruleList);
		}

		request.getRequestDispatcher("/" + getBasePath() + "/" + BASE_METHOD_ADD_OR_MODIFY + "Rule.jsp").forward(request, response);
	}

	// 详情
	public void detail4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.detail(request, response);
	}

	// 删除
	public void delete4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.delete(request, response);
	}

	// 导出
	public void export4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.export(request, response);
	}

}
