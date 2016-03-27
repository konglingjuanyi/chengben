package com.chengben;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import me.chyxion.xls.TableToXls;

import org.apache.commons.beanutils.MethodUtils;
import org.apache.log4j.Logger;

import com.chengben.obj.VCostFinalSumbyCosttypeObj;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.obj.PaginationObj;
import com.wuyg.common.servlet.AbstractBaseServletTemplate;
import com.wuyg.common.util.RequestUtil;
import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.TimeUtil;
import com.wuyg.excel.ExcelConstructor;

public class VCostFinalServlet extends AbstractBaseServletTemplate
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
		return com.chengben.obj.VCostFinalObj.class;
	}

	@Override
	public Class getDomainSearchConditionClz()
	{
		return com.chengben.searchcondition.VCostFinalSearchCondition.class;
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
//		super.export(request, response);
		
		// 生成excel文件
		String filePath = this.getServletContext().getRealPath("/download/") + "/" + "报表" + "_" + TimeUtil.nowTime2str("yyyyMMddHHmmss") + ".xls";
		File xlsFile = new File(filePath);

		logger.info("导出文件,生成开始 " + filePath);
		
		// 转换为excel
		String table_html = request.getParameter("table_html");
		FileOutputStream fout = new FileOutputStream(filePath);
		TableToXls.process(table_html, fout);
		fout.close();
		
		logger.info("导出文件,生成完成 " + filePath + ",文件大小；" + (xlsFile.length() / 1024) + "K");

		// 下载
		RequestUtil.downloadFile(response, filePath);
	}

	public void report(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String date_month = StringUtil.getNotEmptyStr(request.getParameter("date_month"));// 月份
		request.setAttribute("date_month", date_month);
		
		// 明细
		PaginationObj domainPagination = getDomainDao().searchPaginationByDomainInstance(domainInstance, domainInstance.findDefaultOrderBy(), domainSearchCondition.getPageNo(), domainSearchCondition.getPageCount());

		request.setAttribute(DOMAIN_INSTANCE, domainInstance);
		request.setAttribute(DOMAIN_PAGINATION, domainPagination);

		// 合计
		IBaseDAO vCostFinalSumbyCosttypeDAO = new DefaultBaseDAO(VCostFinalSumbyCosttypeObj.class);
		VCostFinalSumbyCosttypeObj vCostFinalSumbyCosttypeObj = new VCostFinalSumbyCosttypeObj();
		vCostFinalSumbyCosttypeObj.setDate_month(date_month);
		List<VCostFinalSumbyCosttypeObj> sumList = vCostFinalSumbyCosttypeDAO.searchByClause(VCostFinalSumbyCosttypeObj.class, "date_month='"+date_month+"'", null, 0, Integer.MAX_VALUE);
		if (sumList.size() > 0)
		{
			vCostFinalSumbyCosttypeObj = (VCostFinalSumbyCosttypeObj) sumList.get(0);
		}
		request.setAttribute("vCostFinalSumbyCosttypeObj", vCostFinalSumbyCosttypeObj);

		// 转向
		if ("1-2".equalsIgnoreCase(request.getParameter("reportId")))
		{
			request.getRequestDispatcher("/" + getBasePath() + "/report_1-2.jsp").forward(request, response);
		} else if ("1-3".equalsIgnoreCase(request.getParameter("reportId")))
		{
			request.getRequestDispatcher("/" + getBasePath() + "/report_1-3.jsp").forward(request, response);
		}
	}

}
