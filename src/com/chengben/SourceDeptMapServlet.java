package com.chengben;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.MethodUtils;
import org.apache.log4j.Logger;

import com.chengben.obj.SourceDeptAccMapObj;
import com.chengben.obj.SourceDeptMapObj;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.obj.PaginationObj;
import com.wuyg.common.servlet.AbstractBaseServletTemplate;
import com.wuyg.common.util.StringUtil;

public class SourceDeptMapServlet extends AbstractBaseServletTemplate
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
		return com.chengben.obj.SourceDeptMapObj.class;
	}

	@Override
	public Class getDomainSearchConditionClz()
	{
		return com.chengben.searchcondition.SourceDeptMapSearchCondition.class;
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
		super.checkId(request, response);
	}

	// 增加 or 修改
	public void addOrModify4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.addOrModify(request, response);
	}

	// 修改前查询领域对象信息
	public void preModify4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 传递外部接口编号
		String source_system = "source_system";
		request.setAttribute(source_system, request.getParameter(source_system));

		super.preModify(request, response);
	}

	// 详情
	public void detail4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.detail(request, response);
	}

	// 删除
	public void delete4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		int successCount = getDomainDao().deleteByKey(domainInstanceKeyValue);

		// 转向
		if (successCount > 0)
		{
			list4this(request, response);
		} else
		{
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
	}

	// 导出
	public void export4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.export(request, response);
	}

	// 列出需要完善的对照关系
	private void list4notOk(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		SourceDeptMapObj o = (SourceDeptMapObj) domainInstance;

		// 查询
		PaginationObj domainPagination = getDomainDao().searchPaginationByClause(domainInstance.getClass(), "source_system='" + o.getSource_system() + "' and dest_dept_code is null", domainInstance.findDefaultOrderBy(), domainSearchCondition.getPageNo(), domainSearchCondition.getPageCount());

		request.setAttribute(DOMAIN_INSTANCE, domainInstance);
		request.setAttribute(DOMAIN_PAGINATION, domainPagination);

		request.setAttribute("list4notOk", "true");// 保证修改完一个对照关系后父页面刷新时还是只查询notok的

		// 转向

		request.getRequestDispatcher("/" + getBasePath() + "/" + BASE_METHOD_LIST + ".jsp").forward(request, response);
	}

}
