package com.excelparser;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.MethodUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;

import com.cost.obj.EfCostDeptObj;
import com.excelparser.obj.ExcelParserObj;
import com.wuyg.common.dao.BaseDbObj;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.obj.PaginationObj;
import com.wuyg.common.servlet.AbstractBaseServletTemplate;
import com.wuyg.common.util.MyBeanUtils;
import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.TimeUtil;
import com.wuyg.excelparser.ExcelParser;
import com.wuyg.excelparser.obj.ExcelParserConfigObj;

public class ExcelParserServlet extends AbstractBaseServletTemplate
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
		return com.excelparser.obj.ExcelParserObj.class;
	}

	@Override
	public Class getDomainSearchConditionClz()
	{
		return com.excelparser.searchcondition.ExcelParserSearchCondition.class;
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
		super.export(request, response);
	}

	// 上传文件并预览
	public void uploadFile(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		try
		{
			request.setAttribute(DOMAIN_INSTANCE, domainInstance);

			ExcelParserObj excelParserObj = (ExcelParserObj) domainInstance;

			String excelParserName = excelParserObj.getParser_name();
			excelParserName = "核算科室";

			// 1、保存Excel文件
			String baseDir = this.getServletConfig().getServletContext().getRealPath("/upload/");

			DiskFileItemFactory fac = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(fac);
			upload.setHeaderEncoding("utf-8");
			List<FileItem> fileList = upload.parseRequest(request);

			String fileName = "";
			File saveFile = null;

			for (int i = 0; i < fileList.size(); i++)
			{
				FileItem item = fileList.get(i);
				if (!item.isFormField())
				{
					fileName = item.getName();
					if (fileName == null || fileName.trim().equals(""))
					{
						continue;
					}

					String destFileName = TimeUtil.nowTime2str("yyyyMMddHHmmss_") + fileName;

					saveFile = new File(baseDir + "/" + destFileName);
					if (!saveFile.getParentFile().exists())
					{
						saveFile.getParentFile().mkdirs();
					}
					item.write(saveFile);

					logger.info("文件上传成功，保存位置:" + saveFile.getCanonicalPath() + ",大小:" + saveFile.length());

					break;// 只传一个文件
				}
			}

			// 2、Excel解析到javabean

			// 获取解析器配置信息
			ExcelParserConfigObj excelParserConfigObj = ExcelParser.getExcelParserByName(excelParserName);

			Class javaBeanClass = Thread.currentThread().getContextClassLoader().loadClass(excelParserConfigObj.getJavaBean());

			request.getSession().setAttribute("javaBeanClass", javaBeanClass);

			// 解析Excel文件
			List<BaseDbObj> excelDataList = ExcelParser.parse(saveFile, excelParserName);

			request.getSession().setAttribute("excelDataList", excelDataList);

			logger.info("Excel解析出的数据共" + excelDataList.size() + "条:" + excelDataList);

			// 3、数据比对（用唯一标识字段比较excel中的数据与数据库中的数据）

			IBaseDAO dao = new DefaultBaseDAO(javaBeanClass);

			// 根据唯一标识从数据库中抓取数据

			List<String> uniqueKeyList = new ArrayList<String>();
			String uniqueColumnName = excelParserConfigObj.getUniqueColumn().getJavaBeanProperty();
			for (int i = 0; i < excelDataList.size(); i++)
			{
				Object obj = excelDataList.get(i);
				String uniqueColumnValue = BeanUtils.getProperty(obj, uniqueColumnName);
				uniqueKeyList.add(uniqueColumnValue);
			}

			String inDbSql = uniqueColumnName + " in (" + StringUtil.getStringByListWithQuotation(uniqueKeyList) + ") ";

			List dbSearchedDataList = dao.searchByClause(javaBeanClass, inDbSql, null, 0, Integer.MAX_VALUE);

			logger.info("需更新数据共" + dbSearchedDataList.size() + "条:" + dbSearchedDataList);

			
			
			List inDbDataList = new ArrayList();

			// 比对数据情况:新增 或 更新
			List justInExcelDataList = new ArrayList();
			for (int i = 0; i < excelDataList.size(); i++)
			{
				BaseDbObj excelRowObj = (BaseDbObj)excelDataList.get(i);
				String uniqueColumnValueInExcel = BeanUtils.getProperty(excelRowObj, uniqueColumnName);
				boolean isInDb = false;
				for (int j = 0; j < dbSearchedDataList.size(); j++)
				{
					BaseDbObj dbRowObj = (BaseDbObj)dbSearchedDataList.get(j);
					String uniqueColumnValueInDb = BeanUtils.getProperty(dbRowObj, uniqueColumnName);
					if (uniqueColumnValueInExcel.trim().equalsIgnoreCase(uniqueColumnValueInDb.trim()))
					{
						isInDb = true;
						excelRowObj.setId(dbRowObj.getKeyValue());//用数据库中的id填充
						inDbDataList.add(excelRowObj);
						break;
					}
				}

				if (!isInDb)
				{
					justInExcelDataList.add(excelRowObj);
				}
			}

			logger.info("新增数据共" + justInExcelDataList.size() + "条:" + justInExcelDataList);
			
			request.getSession().setAttribute("inDbDataList", inDbDataList);

			request.getSession().setAttribute("justInExcelDataList", justInExcelDataList);

			// 4、反馈预览

			// response.getWriter().print(URLEncoder.encode("保存数据成功", "utf-8"));

		} catch (Exception e)
		{
			request.setAttribute("errorMessage", e);
			logger.error(e.getCause(), e);
		} finally
		{
			request.getRequestDispatcher("/" + getBasePath() + "/uploadPreview.jsp").forward(request, response);
		}
	}

	// 上传文件并预览
	public void import2db(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		try
		{
			ExcelParserObj excelParserObj = (ExcelParserObj) domainInstance;

			List excelDataList = new ArrayList(); // 本次解析出的所有记录
			List inDbDataList = new ArrayList(); // 数据库中已经存在的记录
			List justInExcelDataList = new ArrayList(); // 本次新增的记录

			Class javaBeanClass = null;

			Object tmpObj = request.getSession().getAttribute("excelDataList");
			if (tmpObj != null)
			{
				excelDataList = (List) tmpObj;
			}

			tmpObj = request.getSession().getAttribute("inDbDataList");
			if (tmpObj != null)
			{
				inDbDataList = (List) tmpObj;
			}

			tmpObj = request.getSession().getAttribute("justInExcelDataList");
			if (tmpObj != null)
			{
				justInExcelDataList = (List) tmpObj;
			}

			tmpObj = request.getSession().getAttribute("javaBeanClass");
			if (tmpObj != null)
			{
				javaBeanClass = (Class) tmpObj;
			}

			IBaseDAO dao = new DefaultBaseDAO(javaBeanClass);
			if ("新增".equalsIgnoreCase(excelParserObj.getImport_type()))
			{
				// 保存新增数据

				dao.save(justInExcelDataList);

				if ("覆盖系统中相同数据".equalsIgnoreCase(excelParserObj.getSame_record_process_type()))
				{
					// 覆盖系统中相同数据
					dao.update(inDbDataList);
				}
			}
			else if ("覆盖".equalsIgnoreCase(excelParserObj.getImport_type()))
			{
				// 先删除
				dao.deleteByClause("1=1");
				
				// 再入库
				dao.save(excelDataList);
			}
		} catch (Exception e)
		{
			request.setAttribute("errorMessage", e.getMessage());
			throw e;
		} finally
		{
			request.getRequestDispatcher("/" + getBasePath() + "/importSuccess.jsp").forward(request, response);
		}
	}

}
