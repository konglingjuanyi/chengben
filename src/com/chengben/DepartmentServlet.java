package com.chengben;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.MethodUtils;
import org.apache.log4j.Logger;

import com.chengben.obj.AccountingSubjectObj;
import com.chengben.obj.DepartmentObj;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.obj.PaginationObj;
import com.wuyg.common.servlet.AbstractBaseServletTemplate;
import com.wuyg.common.util.StringUtil;

public class DepartmentServlet extends AbstractBaseServletTemplate
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
		return com.chengben.obj.DepartmentObj.class;
	}

	@Override
	public Class getDomainSearchConditionClz()
	{
		return com.chengben.searchcondition.DepartmentSearchCondition.class;
	}

	// 查询
	public void list4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String list4notOk = request.getParameter("list4notOk");
		if ("true".equalsIgnoreCase(list4notOk))
		{
			list4notOk(request,response);
		} else
		{
			super.list(request, response);
		}
	}

	// 检查ID是否已录入系统
	public void checkId4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.checkId(request,response);
	}

	// 增加 or 修改
	public void addOrModify4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.addOrModify(request,response);
	}

	// 修改前查询领域对象信息
	public void preModify4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.preModify(request,response);
	}

	// 详情
	public void detail4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.detail(request,response);
	}

	// 删除
	public void delete4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.delete(request,response);
	}

	// 导出
	public void export4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.export(request,response);
	}
	
	// 列出需要完善的对照关系
	private void list4notOk(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String source_system = request.getParameter("source_system");

		// 查询
		PaginationObj domainPagination = getDomainDao().searchPaginationByClause(domainInstance.getClass(), " department_code in (select dest_dept_code from source_dept_map where source_system='"+source_system+"') and (department_type_code is null or department_type_code='')", domainInstance.findDefaultOrderBy(), domainSearchCondition.getPageNo(), domainSearchCondition.getPageCount());

		request.setAttribute(DOMAIN_INSTANCE, domainInstance);
		request.setAttribute(DOMAIN_PAGINATION, domainPagination);

		request.setAttribute("list4notOk", "true");// 保证修改完一个对照关系后父页面刷新时还是只查询notok的
		request.setAttribute("source_system", source_system); // 传递外部系统编号

		// 转向

		request.getRequestDispatcher("/" + getBasePath() + "/" + BASE_METHOD_LIST + ".jsp").forward(request, response);
	}

}
