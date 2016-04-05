package com.chengben;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.MethodUtils;
import org.apache.log4j.Logger;

import com.chengben.obj.AccountingSubjectObj;
import com.chengben.obj.DepartmentObj;
import com.chengben.obj.SourceDeptAccMapObj;
import com.hz.util.SystemConstant;
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
			list4notOk(request, response);
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
		super.delete(request, response);
	}

	// 导出
	public void export4this(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		super.export(request, response);
	}

	// 列出需要完善的对照关系
	private void list4notOk(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String source_system = request.getParameter("source_system");

		// 查询
		PaginationObj domainPagination = getDomainDao().searchPaginationByClause(domainInstance.getClass(), " department_code in (select dest_dept_code from source_dept_map where source_system='" + source_system + "') and (department_type_code is null or department_type_code='')",
				domainInstance.findDefaultOrderBy(), domainSearchCondition.getPageNo(), domainSearchCondition.getPageCount());

		request.setAttribute(DOMAIN_INSTANCE, domainInstance);
		request.setAttribute(DOMAIN_PAGINATION, domainPagination);

		request.setAttribute("list4notOk", "true");// 保证修改完一个对照关系后父页面刷新时还是只查询notok的
		request.setAttribute("source_system", source_system); // 传递外部系统编号

		// 转向

		request.getRequestDispatcher("/" + getBasePath() + "/" + BASE_METHOD_LIST + ".jsp").forward(request, response);
	}

	// 从总账系统同步科室列表
	public void sync(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 查询总账系统科室列表
		IBaseDAO u8DepartmentDao = new DefaultBaseDAO(com.u8.obj.DepartmentObj.class, SystemConstant.U8_DB);
		List<com.u8.obj.DepartmentObj> u8DeptList = u8DepartmentDao.searchByClause(com.u8.obj.DepartmentObj.class, " bDepEnd=1 ", null, 0, Integer.MAX_VALUE);//只同步末级节点
		logger.info("查询总账系统科室列表:" + u8DeptList.size() + "个");

		// 逐个保存或更新到成本系统
		List<DepartmentObj> deptOldList=getDomainDao().searchAll(DepartmentObj.class);
		List<DepartmentObj> deptNewList = new ArrayList<DepartmentObj>();
		for (int i = 0; i < u8DeptList.size(); i++)
		{
			com.u8.obj.DepartmentObj u8Dept = u8DeptList.get(i);
			
			DepartmentObj dept = new DepartmentObj();
			dept.setDepartment_code(u8Dept.getCdepcode().trim());
			dept.setDepartment_name(u8Dept.getCdepname().trim());
			dept.setDepartment_type_code(getDepartment_type_code(deptOldList,u8Dept.getCdepcode().trim()));

			deptNewList.add(dept);
		}
	
		if (deptNewList.size()>0)
		{
			// 删除成本系统中的老的科室信息
			getDomainDao().deleteByClause("1=1");
			logger.info("删除成本系统中的老的科室信息");
			
			// 保存从总账系统同步过来的新的科室信息
			getDomainDao().save(deptNewList);
			logger.info("保存从总账系统同步过来的新的科室信息");
		}

		// 列表展示
		request.setAttribute("message", "科室同步成功，共同步" + u8DeptList.size() + "个科室，请设置科室类型。");
		list(request, response);
	}
	
	private String getDepartment_type_code(List<DepartmentObj> deptOldList, String code)
	{
		for (int i = 0; i < deptOldList.size(); i++)
		{
			if (code.equalsIgnoreCase(deptOldList.get(i).getDepartment_code()))
			{
				return deptOldList.get(i).getDepartment_type_code();
			}
		}
		return null;
	}

	// 批量修改前查询领域对象信息
	public void preModify4Batch(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 查询该外部接口的所有对照关系
		List<DepartmentObj> domainInstanceList = getDomainDao().searchByClause(DepartmentObj.class, null, domainInstance.findDefaultOrderBy(), 0, Integer.MAX_VALUE);

		request.setAttribute("domainInstanceList", domainInstanceList);

		request.getRequestDispatcher("/" + getBasePath() + "/" + BASE_METHOD_ADD_OR_MODIFY + "4Batch.jsp").forward(request, response);
	}

	// 批量修改前查询领域对象信息
	public void addOrModify4Batch(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String[] ids = request.getParameterValues("department_id");

		String dest_acc_subject = request.getParameter("department_type_code");

		String updateSql = "update " + domainInstance.findTableName() + " set department_type_code='" + dest_acc_subject + "' where id in (" + StringUtil.getStringByList(ids, true) + ")";

		boolean success = getDomainDao().executeSql(updateSql);
		
		preModify4Batch(request, response);
	}

}
