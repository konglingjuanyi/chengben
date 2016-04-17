package com.chengben;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.MethodUtils;
import org.apache.log4j.Logger;

import com.chengben.obj.AccountingSubjectObj;
import com.chengben.obj.DepartmentObj;
import com.chengben.obj.SourceDeptMapObj;
import com.hz.util.SystemConstant;
import com.u8.obj.CodeObj;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.obj.PaginationObj;
import com.wuyg.common.servlet.AbstractBaseServletTemplate;
import com.wuyg.common.util.StringUtil;

public class AccountingSubjectServlet extends AbstractBaseServletTemplate
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
		return com.chengben.obj.AccountingSubjectObj.class;
	}

	@Override
	public Class getDomainSearchConditionClz()
	{
		return com.chengben.searchcondition.AccountingSubjectSearchCondition.class;
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

	// 批量修改前查询领域对象信息
	public void preModify4Batch(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 查询所有科目
		List<AccountingSubjectObj> domainInstanceList = getDomainDao().searchByClause(AccountingSubjectObj.class, null, domainInstance.findDefaultOrderBy(), 0, Integer.MAX_VALUE);

		request.setAttribute("domainInstanceList", domainInstanceList);

		request.getRequestDispatcher("/" + getBasePath() + "/" + BASE_METHOD_ADD_OR_MODIFY + "4Batch.jsp").forward(request, response);
	}
	// 批量修改前查询领域对象信息
	public void addOrModify4Batch(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String[] ids = request.getParameterValues("acc_id");

		String opposite_acc_code = request.getParameter("opposite_acc_code");

		String updateSql = "update " + domainInstance.findTableName() + " set opposite_acc_code='" + opposite_acc_code + "' where id in (" + StringUtil.getStringByList(ids, true) + ")";

		boolean success = getDomainDao().executeSql(updateSql);
		
		preModify4Batch(request, response);
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
		PaginationObj domainPagination = getDomainDao().searchPaginationByClause(domainInstance.getClass(), " acc_code in (select dest_acc_subject from source_dept_acc_map where source_system='"+source_system+"') and (opposite_acc_code is null or opposite_acc_code='')", domainInstance.findDefaultOrderBy(), domainSearchCondition.getPageNo(), domainSearchCondition.getPageCount());

		request.setAttribute(DOMAIN_INSTANCE, domainInstance);
		request.setAttribute(DOMAIN_PAGINATION, domainPagination);

		request.setAttribute("list4notOk", "true");// 保证修改完一个对照关系后父页面刷新时还是只查询notok的
		request.setAttribute("source_system", source_system); // 传递外部系统编号

		// 转向

		request.getRequestDispatcher("/" + getBasePath() + "/" + BASE_METHOD_LIST + ".jsp").forward(request, response);
	}
	
	// 从总账系统同步科目列表
	public void sync(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 查询总账系统科目列表
		IBaseDAO u8AccDao = new DefaultBaseDAO(CodeObj.class, SystemConstant.U8_DB);
		List<CodeObj> u8AccList = u8AccDao.searchAll(CodeObj.class);
		logger.info("查询总账系统科目列表:" + u8AccList.size() + "个");
		
		// 构造成本系统中新的科目列表
		List<AccountingSubjectObj> accOldList=getDomainDao().searchAll(AccountingSubjectObj.class);
		List<AccountingSubjectObj> accNewList = new ArrayList<AccountingSubjectObj>();
		for (int i = 0; i < u8AccList.size(); i++)
		{
			CodeObj u8Acc = u8AccList.get(i);
			
			AccountingSubjectObj acc = new AccountingSubjectObj();
			acc.setAcc_code(u8Acc.getCcode().trim());
			acc.setAcc_name(u8Acc.getCcode_name().trim());
			acc.setDebit_or_credit(u8Acc.getBproperty()?"贷":"借");
			acc.setOpposite_acc_code(getOpposite_acc_code(accOldList,u8Acc.getCcode().trim()));// 保留原来已经设置的对方科目
			
			accNewList.add(acc);
		}
		
		if (accNewList.size()>0)
		{
			// 删除成本系统中的老的科目信息
			getDomainDao().deleteByClause("1=1");
			logger.info("删除成本系统中的老的科目信息");
			
			// 保存从总账系统同步过来的新的科目信息
			getDomainDao().save(accNewList);
			logger.info("保存从总账系统同步过来的新的科目信息");
		}

		// 列表展示
		request.setAttribute("message", "会计科目同步成功，共同步" + u8AccList.size() + "个科目，请设置对方科目。");
		list(request, response);
	}

	private String getOpposite_acc_code(List<AccountingSubjectObj> accOldList, String code)
	{
		for (int i = 0; i < accOldList.size(); i++)
		{
			if (code.equalsIgnoreCase(accOldList.get(i).getAcc_code()))
			{
				return accOldList.get(i).getOpposite_acc_code();
			}
		}
		return null;
	}

}
