package com.chengben.obj;

import java.io.File;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.excelparser.afterparser.IAfterParser;
import com.wuyg.excelparser.obj.ExcelParserConfigObj;

/**
 * 直接成本解析完毕后，检查各科室是否已经在系统中
 * 
 * @author wuyugang
 * 
 */
public class CostDirectObjAfterExcelParser implements IAfterParser
{
	private Logger logger = Logger.getLogger(getClass());

	public boolean doAfterParse(File excelFile, ExcelParserConfigObj parserConfig, List dataList, Map paramMap) throws Exception
	{
		HttpServletRequest request = (HttpServletRequest) paramMap.get("request");
		HttpServletResponse response = (HttpServletResponse) paramMap.get("response");
		
		String date_month=request.getParameter("date_month");
		
		// 去掉合计行、小计行
		for (int i = 0; i < dataList.size(); i++)
		{
			String department_name = ((CostDirectObj)dataList.get(i)).getDepartment_name();
			if (department_name.contains("合计")||department_name.contains("小计"))
			{
				dataList.remove(i);
				i--;
			}
		}

		IBaseDAO departmentDao = new DefaultBaseDAO(DepartmentObj.class);

		// 系统中已经录入的科室列表
		List<DepartmentObj> departmentListInDb = departmentDao.searchByClause(DepartmentObj.class, null, null, 0, Integer.MAX_VALUE);

		// 检查各科室是否已经在"医院科室"表中
		List<DepartmentObj> departmentListNeedAdd = new ArrayList<DepartmentObj>();
		for (int i = 0; i < dataList.size(); i++)
		{
			CostDirectObj o = (CostDirectObj) dataList.get(i);
			
			// 设置数据月份
			o.setDate_month(date_month);

			boolean alreadyInDb = false;
			for (int j = 0; j < departmentListInDb.size(); j++)
			{
				DepartmentObj deparment = departmentListInDb.get(j);
				if (o.getDepartment_name().equalsIgnoreCase(deparment.getDepartment_name()))
				{
					alreadyInDb = true;
					
					// 完善直接成本表中的科室编码、科室类型
					o.setDepartment_code(deparment.getDepartment_code());
					o.setDepartment_type_code(deparment.getDepartment_type_code());
				}
			}

			if (!alreadyInDb)
			{
				logger.warn("直接成本表导入：" + o.getDepartment_name() + " 没有添加到'医院科室表'中");
				DepartmentObj d = new DepartmentObj();
				d.setDepartment_name(o.getDepartment_name());
				departmentListNeedAdd.add(d);
			} 
		}

		if (departmentListNeedAdd.size() > 0)
		{
			// 提示补充完善相关对照关系
			request.setAttribute("departmentListNeedAdd", departmentListNeedAdd);
			request.getRequestDispatcher("/CostDirect/needSupplementMaps.jsp").forward(request, response);
		}

		return true;
	}

}
