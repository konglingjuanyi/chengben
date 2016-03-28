package com.gl;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.chengben.obj.AccountingSubjectObj;
import com.chengben.obj.DepartmentObj;
import com.chengben.obj.SourceDeptAccMapObj;
import com.chengben.obj.SourceDeptMapObj;
import com.gl.obj.GlAccvouchObj;
import com.hz.dict.service.DictionaryService;
import com.wuyg.common.dao.DefaultBaseDAO;
import com.wuyg.common.dao.IBaseDAO;
import com.wuyg.common.obj.PaginationObj;
import com.wuyg.common.servlet.AbstractBaseServletTemplate;
import com.wuyg.common.util.MySqlUtil;
import com.wuyg.common.util.RequestUtil;
import com.wuyg.common.util.StringUtil;
import com.wuyg.common.util.SystemConstant;
import com.wuyg.excelparser.ExcelParser;

public class GlAccvouchServlet extends AbstractBaseServletTemplate
{
	private Logger logger = Logger.getLogger(getClass());

	private String UF_DB_NAME = "uf_db";
	private IBaseDAO UF_glAccvouchDao = new DefaultBaseDAO(GlAccvouchObj.class, UF_DB_NAME);

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
		return com.gl.obj.GlAccvouchObj.class;
	}

	@Override
	public Class getDomainSearchConditionClz()
	{
		return com.gl.searchcondition.GlAccvouchSearchCondition.class;
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

	// 下载凭证导入的模板
	public void downloadTemplete(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String templeteFile = getServletContext().getRealPath(getBasePath()) + "/凭证导入模板V1.0.xls";
		RequestUtil.downloadFile(response, templeteFile);
	}

	// 总账凭证列表
	public void zzlist(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 查询
		domainSearchCondition.setPageCount(SystemConstant.PAGE_ROWS);// 恢复每页20行记录
		IBaseDAO zzDao = new DefaultBaseDAO(domainInstance, UF_DB_NAME);
		PaginationObj domainPagination = zzDao.searchPaginationByDomainInstance(domainInstance, "iperiod,ino_id,inid", domainSearchCondition.getPageNo(), domainSearchCondition.getPageCount());

		request.setAttribute(DOMAIN_INSTANCE, domainInstance);
		request.setAttribute(DOMAIN_PAGINATION, domainPagination);

		// 转向

		request.getRequestDispatcher("/" + getBasePath() + "/zz" + BASE_METHOD_LIST + ".jsp").forward(request, response);
	}

	// 生成总账凭证
	public void import2zz(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		List<GlAccvouchObj> glAccvouchList = getDomainDao().searchByClause(GlAccvouchObj.class, null, null, 0, Integer.MAX_VALUE);
		logger.info("查询得到临时凭证:" + glAccvouchList.size() + "条");

		UF_glAccvouchDao.save(glAccvouchList);// 入总账数据库
		logger.info("凭证导入总账系统:" + glAccvouchList.size() + "条");

		// 转到总账凭证查询
		zzlist(request, response);
	}

	// 上传预览
	public void uploadFile(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		try
		{
			// 保存文件(父类已自动保存，这里不用做任何动作)
			if (savedFile == null)
			{
				throw new Exception("文件上传出错，请检查是否选择了合适的文件");
			}

			GlAccvouchObj glavInput = (GlAccvouchObj) domainInstance;

			// 外部接口
			String wbSource = glavInput.getWbSource();

			// excel文件解析为矩阵格式数据
			List<List<String>> matrix = ExcelParser.parse2matrix(savedFile);

			// 获取凭证编号
			getIno_id(glavInput);

			// 凭证列表
			List<GlAccvouchObj> glAccvouchList = getGlAccouchListFromMatrix(glavInput, matrix);

			logger.info("共生成临时凭证:" + glAccvouchList.size() + "条");
			// logger.info(glAccvouchList);

			// 检查映射关系
			boolean preCheckPassed = preCheck(glAccvouchList, wbSource);

			// 检查通过
			if (preCheckPassed)
			{
				// 清空表
				logger.info("清空临时凭证表");
				getDomainDao().deleteByClause("1=1");

				// 保存入库
				logger.info("临时凭证入库:" + glAccvouchList.size() + "条");
				getDomainDao().save(glAccvouchList);

				// 生成对方凭证
				logger.info("生成对方凭证");
				List pingZhangGlavList = getPingZhangGlavList(glavInput);
				logger.info("对方凭证入库:" + pingZhangGlavList.size() + "条");
				getDomainDao().save(pingZhangGlavList);
			} else
			{
				// 提示补充完善相关对照关系
				request.setAttribute("wbSource", wbSource);

				request.setAttribute("warnGlAccvouchMap", warnGlAccvouchMap);
				request.setAttribute("wbDeptMapNeedAddMap", wbDeptMapNeedAddMap);
				request.setAttribute("zzDeptTypeMapNeedAddMap", zzDeptTypeMapNeedAddMap);
				request.setAttribute("zzDeptTypeAccSubMapNeedAddMap", zzDeptTypeAccSubMapNeedAddMap);
				request.setAttribute("zzAccSubReverseMapNeedAddMap", zzAccSubReverseMapNeedAddMap);

				request.getRequestDispatcher("/" + getBasePath() + "/needSupplementMaps.jsp").forward(request, response);
			}
		} catch (Exception e)
		{
			request.setAttribute("errorMessage", e);
			logger.error(e.getCause(), e);
			request.getRequestDispatcher("/" + getBasePath() + "/importResult.jsp").forward(request, response);
		} finally
		{
			list(request, response);
		}

	}

	private List<GlAccvouchObj> getGlAccouchListFromMatrix(GlAccvouchObj glavInput, List<List<String>> matrix) throws Exception
	{
		List<GlAccvouchObj> glAccvouchList = new ArrayList<GlAccvouchObj>();

		List<String> head = new ArrayList<String>();
		for (int i = 0; i < matrix.size(); i++)
		{
			if (i == 0)
			{
				// 取第1行表头，即所有科目
				head = matrix.get(i);
			}

			if (i >= 1)
			{
				// 从第2行开始是每个科室的数据
				List<String> cells = matrix.get(i);

				String wbDeptName = cells.get(0);// 第1列为 科室
				if (StringUtil.isEmpty(wbDeptName) || "合计".endsWith(wbDeptName))
				{
					break;// 最后一行，合计行
				}

				// String zongzhangKeShi = getZongzhangKeShi(keShi);//
				// 映射到总账科室

				for (int k = 1; k < cells.size(); k++)// 从第2列开始
				{
					String wbAccSubName = head.get(k);// 科目
					if ("合计".endsWith(wbAccSubName))
					{
						break;
					}
					// String zongzhangKeMu = getZongzhangKeMu(keShi,
					// keMu);//
					// 映射到总账科目

					double money = StringUtil.parseDouble(cells.get(k));

					if (money > 0)
					{
						// 生成凭证
						GlAccvouchObj glAccvouchObj = createGlAccvouchObj(glavInput);

						glAccvouchObj.setWbSource(glavInput.getWbSource());// 外部系统
						glAccvouchObj.setWbDeptName(wbDeptName);// 外部系统科室名
						glAccvouchObj.setWbAccSubName(wbAccSubName);// 外部系统科目

						if (glAccvouchObj.isCredit())
						{
							glAccvouchObj.setMc(BigDecimal.valueOf(money));// 贷方
						}

						if (glAccvouchObj.isDebit())
						{
							glAccvouchObj.setMd(BigDecimal.valueOf(money));// 借方
						}

						glAccvouchList.add(glAccvouchObj);
					}

				}

			}
		}
		return glAccvouchList;
	}

	private List getPingZhangGlavList(GlAccvouchObj glavInput) throws Exception
	{
		List pingZhangGlavList = new ArrayList();
		Connection conn = null;
		try
		{
			conn = MySqlUtil.getConnection(SystemConstant.DEFAULT_DB);
			ResultSet rst = conn.createStatement().executeQuery("select zzAccSubReverse ccode,SUM(md) md,SUM(mc) mc from gl_accvouch group by zzAccSubReverse");
			while (rst.next())
			{

				GlAccvouchObj o = createGlAccvouchObj(glavInput);
				o.setCcode(rst.getString("ccode"));
				o.setMd(rst.getBigDecimal("mc"));// 注意这个地方mc,md要反过来，因为要平账
				o.setMc(rst.getBigDecimal("md"));
				pingZhangGlavList.add(o);
			}
		} catch (Exception e)
		{
			throw e;
		} finally
		{
			MySqlUtil.closeConnection(conn);
		}

		return pingZhangGlavList;
	}

	private GlAccvouchObj createGlAccvouchObj(GlAccvouchObj glavInput)
	{
		GlAccvouchObj glAccvouchObj = new GlAccvouchObj();

		glAccvouchObj.setWbSource(glavInput.getWbSource());// 外部接口
		glAccvouchObj.setDebitORcredit(glavInput.getDebitORcredit());// 借方 or
		// 贷方
		glAccvouchObj.setDbill_date(glavInput.getDbill_date()); // 制单日期
		glAccvouchObj.setCbill(glavInput.getCbill());// 制单人
		glAccvouchObj.setIno_id(glavInput.getIno_id()); // 制单日期
		glAccvouchObj.setIdoc(glavInput.getIdoc()); // 附单据数
		glAccvouchObj.setCdigest(glavInput.getCdigest()); // 摘要
		glAccvouchObj.setRowguid("还不知道如何获取");

		// 默认值设置
		glAccvouchObj.setCsign("记");
		glAccvouchObj.setIbook(0);
		glAccvouchObj.setMd(BigDecimal.valueOf(0));
		glAccvouchObj.setMd_f(0d);
		glAccvouchObj.setMc(BigDecimal.valueOf(0));
		glAccvouchObj.setMc_f(0d);
		glAccvouchObj.setNd_s(0d);
		glAccvouchObj.setNc_s(0d);
		glAccvouchObj.setNfrat(0d);
		glAccvouchObj.setBflagout(false);

		return glAccvouchObj;
	}

	private long getIno_id(GlAccvouchObj o) throws Exception
	{
		long ino_id = 1;
		Connection conn = null;
		try
		{
			conn = MySqlUtil.getConnection(UF_DB_NAME);
			ResultSet rst = conn.createStatement().executeQuery("select max(ino_id) from gl_Accvouch where iperiod='" + o.getIperiod() + "'");
			if (rst.next())
			{
				ino_id = rst.getLong(1) + 1;
			}

			o.setIno_id(ino_id);// 设置到输入条件对象中
		} catch (SQLException e)
		{
			throw e;
		} finally
		{
			MySqlUtil.closeConnection(conn);
		}
		logger.info("获取最大凭证号:" + ino_id);
		return ino_id;
	}

	private boolean preCheck(List<GlAccvouchObj> glAccvouchList, String wbSource)
	{
		// 初始化所有映射表
		initAllMap(wbSource);

		// 逐个检查
		for (int i = 0; i < glAccvouchList.size(); i++)
		{
			GlAccvouchObj glAccvouchObj = glAccvouchList.get(i);

			// 第1步：从"外部系统科室对照关系"中，根据"外部系统+外部科室->总账系统科室"->总账系统科室类型。如果找不到对应关系则需要提示完善
			String zzDeptId = getZzDeptId(glAccvouchObj.getWbSource(), glAccvouchObj.getWbDeptName());// 总账系统科室编码
			if (StringUtil.isEmpty(zzDeptId))
			{
				glAccvouchObj.setNeedWbDeptMap(true);
				continue;
			} else
			{
				glAccvouchObj.setCdept_id(zzDeptId);
			}

			String zzDeptType = getZzDeptType(zzDeptId);// 总账系统科室类型
			if (StringUtil.isEmpty(zzDeptType))
			{
				glAccvouchObj.setNeedZzDeptTyepMap(true);
				continue;
			} else
			{
				glAccvouchObj.setZzDeptType(zzDeptType);
			}

			// 第2步：从"外部系统科室类型+科目对照关系"中，根据"外部系统+总账系统科室类型+外部系统会计科目"->总账系统会计科目。如果找不到对应关系则需要提示完善
			String zzAccSub = getZzAccSub(glAccvouchObj.getWbSource(), glAccvouchObj.getZzDeptType(), glAccvouchObj.getWbAccSubName());
			if (StringUtil.isEmpty(zzAccSub))
			{
				glAccvouchObj.setNeedZzDeptTypeAccSubMap(true);
				continue;
			} else
			{
				glAccvouchObj.setCcode(zzAccSub);
			}

			// 第3步：从"总账系统贷借（或贷借）科目对照关系"，用第2步得到的"总账系统会计科目"得出对应的借方（或贷方）科目，如果找不到对应关系则需要提示完善
			String zzAccSubReverse = getZzAccSubReverse(zzAccSub);
			if (StringUtil.isEmpty(zzAccSubReverse))
			{
				glAccvouchObj.setNeedZzAccSubReverseMap(true);
				continue;
			} else
			{
				glAccvouchObj.setZzAccSubReverse(zzAccSubReverse);
			}
		}

		// 汇总提示信息
		for (int i = 0; i < glAccvouchList.size(); i++)
		{
			GlAccvouchObj o = glAccvouchList.get(i);

			String warnInfo = "";

			if (o.isNeedWbDeptMap())
			{
				warnInfo = "外部科室 '" + o.getWbDeptName() + "' 没有与 '总账科室' 的对照关系。";
				wbDeptMapNeedAddMap.put(o.getWbDeptName(), o);
			}

			if (o.isNeedZzDeptTyepMap())
			{
				warnInfo = "外部科室 '" + o.getWbDeptName() + "' 没有与 '总账科室类型' 的对照关系。(该科室对应的 '总账科室' 为' " + o.getCdept_id() + "')";
				zzDeptTypeMapNeedAddMap.put(o.getCdept_id(), o);
			}

			if (o.isNeedZzDeptTypeAccSubMap())
			{
				warnInfo = "外部科室 '" + o.getWbDeptName() + "' 的科目 '" + o.getWbAccSubName() + "' 没有与 '总账会计科目' 的对照关系。(该科室对应的 '总账科室' 为'" + o.getCdept_id() + "',对应的 '科室类型' 为 '" + o.getZzDeptType() + "')";
				zzDeptTypeAccSubMapNeedAddMap.put(o.getZzDeptType() + "-" + o.getWbAccSubName(), o);
			}

			if (o.isNeedZzAccSubReverseMap())
			{
				warnInfo = "总账会计科目 '" + o.getCcode() + "' 没有设置 '对方会计科目'。";
				zzAccSubReverseMapNeedAddMap.put(o.getCcode(), o);
			}

			if (!StringUtil.isEmpty(warnInfo) && !warnGlAccvouchMap.containsKey(warnInfo))
			{
				logger.warn(warnInfo);
				warnGlAccvouchMap.put(warnInfo, o); // 放入map记录
			}
		}

		// 补足"外部科室"与"总账科室"对照关系
		supplementWbDeptMap(wbSource);
		// 总账科室类型对照关系，如果空着则只需要更新，不需要插入新纪录
		// GlAccvouchObj[] zzDeptTypeMapNeedAdd = (GlAccvouchObj[])
		// zzDeptTypeMapNeedAddMap.entrySet().toArray();
		// 补足"总账科室类型+外部会计科目"与"总账会计科目"的对照关系
		supplementZzDeptTypeAccSubMap(wbSource);

		return warnGlAccvouchMap.size() == 0;
	}

	private void supplementZzDeptTypeAccSubMap(String wbSource)
	{
		logger.info("==补足 总账系统科室类型+外部系统科目 与 总账系统会计科目 对照关系(" + zzDeptTypeAccSubMapNeedAddMap.size() + "条)==");
		Object[] zzDeptTypeAccSubMapNeedAdd = zzDeptTypeAccSubMapNeedAddMap.values().toArray();
		List<SourceDeptAccMapObj> sourceDeptAccMapList = new ArrayList<SourceDeptAccMapObj>();
		for (int i = 0; i < zzDeptTypeAccSubMapNeedAdd.length; i++)
		{
			GlAccvouchObj glav = (GlAccvouchObj) zzDeptTypeAccSubMapNeedAdd[i];

			SourceDeptAccMapObj o = new SourceDeptAccMapObj();
			o.setSource_system(wbSource);
			o.setDept_share_type(glav.getZzDeptType());
			o.setSource_acc_subject(glav.getWbAccSubName());

			if (getZzAccSub(wbSource, glav.getZzDeptType(), glav.getWbAccSubName()) == null)
			{
				sourceDeptAccMapList.add(o);
			}
		}

		sourceDeptAccMapDao.save(sourceDeptAccMapList);
	}

	private void supplementWbDeptMap(String wbSource)
	{
		logger.info("==补足 总账系统科室 与 科室类型 对照关系(" + wbDeptMapNeedAddMap.size() + "条)==");
		
		
		// 取总账科室表
		IBaseDAO deptDao=new DefaultBaseDAO(DepartmentObj.class);
		List<DepartmentObj> deptList = deptDao.searchByClause(DepartmentObj.class, null, null, 0, Integer.MAX_VALUE);
		Map<String, String> deptMap=new HashMap<String, String>();
		for (int i = 0; i < deptList.size(); i++)
		{
			deptMap.put(deptList.get(i).getDepartment_name(), deptList.get(i).getDepartment_code());
		}
		
		
		Object[] wbDeptMapNeedAdd = wbDeptMapNeedAddMap.values().toArray();
		List<SourceDeptMapObj> sourceDeptMapList = new ArrayList<SourceDeptMapObj>();
		for (int i = 0; i < wbDeptMapNeedAdd.length; i++)
		{
			GlAccvouchObj glav = (GlAccvouchObj) wbDeptMapNeedAdd[i];

			SourceDeptMapObj o = new SourceDeptMapObj();
			o.setSource_system(wbSource);
			o.setSource_dept_name(glav.getWbDeptName());
			o.setDest_dept_code(deptMap.get(glav.getWbDeptName()));// 如果总账系统中有名字直接匹配的科室则直接填充对应的部门编号

			if (getZzDeptId(wbSource, glav.getWbDeptName()) == null)
			{
				sourceDeptMapList.add(o);
			}
		}

		sourceDeptMapDao.save(sourceDeptMapList);
	}

	// "外部系统科室"与"总账科室"对照关系
	private Map<String, String> wbDeptMap = null;
	private Map<String, GlAccvouchObj> wbDeptMapNeedAddMap = null;
	// "总账科室"与"总账科室类型"对照关系
	private Map<String, String> zzDeptTypeMap = null;
	private Map<String, GlAccvouchObj> zzDeptTypeMapNeedAddMap = null;
	// "总账科室类型+外部会计科目"与"总账会计科目"的对照关系
	private Map<String, String> zzDeptTypeAccSubMap = null;
	private Map<String, GlAccvouchObj> zzDeptTypeAccSubMapNeedAddMap = null;
	// "总账会计科目"与"总账借贷平账会计科目"对照关系
	private Map<String, String> zzAccSubReverseMap = null;
	private Map<String, GlAccvouchObj> zzAccSubReverseMapNeedAddMap = null;

	// 所有异常提示信息
	private Map<String, GlAccvouchObj> warnGlAccvouchMap = null;

	IBaseDAO sourceDeptMapDao = new DefaultBaseDAO(SourceDeptMapObj.class);
	IBaseDAO sourceDeptAccMapDao = new DefaultBaseDAO(SourceDeptAccMapObj.class);
	IBaseDAO departmentDao = new DefaultBaseDAO(DepartmentObj.class);
	IBaseDAO accSubDao = new DefaultBaseDAO(AccountingSubjectObj.class);

	private void initAllMap(String wbSource)
	{
		initWbDeptMap(wbSource);
		wbDeptMapNeedAddMap = new HashMap<String, GlAccvouchObj>();

		initZzDeptTypeMap();
		zzDeptTypeMapNeedAddMap = new HashMap<String, GlAccvouchObj>();

		initZzDeptTypeAccSubMap(wbSource);
		zzDeptTypeAccSubMapNeedAddMap = new HashMap<String, GlAccvouchObj>();

		initZzAccSubReverseMap();
		zzAccSubReverseMapNeedAddMap = new HashMap<String, GlAccvouchObj>();

		warnGlAccvouchMap = new HashMap<String, GlAccvouchObj>();
	}

	private String getZzDeptId(String wbSource, String wbDeptName)
	{
		return wbDeptMap.get(wbDeptName);
	}

	private String getZzDeptType(String zzDeptId)
	{
		return zzDeptTypeMap.get(zzDeptId);
	}

	private String getZzAccSub(String wbSource, String zzDeptType, String wbAccSubName)
	{
		return zzDeptTypeAccSubMap.get(zzDeptType + "-" + wbAccSubName);
	}

	private String getZzAccSubReverse(String ccode)
	{
		return zzAccSubReverseMap.get(ccode);
	}

	private void initZzAccSubReverseMap()
	{
		logger.info("==初始化 总账系统会计科目借贷平账 对照关系==");

		zzAccSubReverseMap = new HashMap<String, String>();
		List list = accSubDao.searchByClause(AccountingSubjectObj.class, null, null, 0, Integer.MAX_VALUE);
		for (int i = 0; i < list.size(); i++)
		{
			AccountingSubjectObj o = (AccountingSubjectObj) list.get(i);
			zzAccSubReverseMap.put(o.getAcc_code(), StringUtil.getNotEmptyStr(o.getOpposite_acc_code()));
		}
	}

	private void initZzDeptTypeAccSubMap(String wbSource)
	{
		logger.info("==初始化 总账系统科室类型+外部系统科目 与 总账系统会计科目 对照关系==");

		zzDeptTypeAccSubMap = new HashMap<String, String>();
		List list = sourceDeptAccMapDao.searchByClause(SourceDeptAccMapObj.class, "source_system='" + wbSource + "'", null, 0, Integer.MAX_VALUE);
		for (int i = 0; i < list.size(); i++)
		{
			SourceDeptAccMapObj o = (SourceDeptAccMapObj) list.get(i);
			zzDeptTypeAccSubMap.put(o.getDept_share_type() + "-" + o.getSource_acc_subject(), StringUtil.getNotEmptyStr(o.getDest_acc_subject()));
		}
	}

	private void initZzDeptTypeMap()
	{
		logger.info("==初始化 总账系统科室 与 科室类型 对照关系==");

		zzDeptTypeMap = new HashMap<String, String>();
		List list = departmentDao.searchByClause(DepartmentObj.class, null, null, 0, Integer.MAX_VALUE);
		for (int i = 0; i < list.size(); i++)
		{
			DepartmentObj o = (DepartmentObj) list.get(i);
			zzDeptTypeMap.put(o.getDepartment_code(), StringUtil.getNotEmptyStr(o.getDepartment_type_code()));
		}
	}

	private void initWbDeptMap(String wbSource)
	{
		logger.info("==初始化 外部系统科室 与 总账系统科室 对照关系==");

		wbDeptMap = new HashMap<String, String>();
		List list = sourceDeptMapDao.searchByClause(SourceDeptMapObj.class, "source_system='" + wbSource + "'", null, 0, Integer.MAX_VALUE);
		for (int i = 0; i < list.size(); i++)
		{
			SourceDeptMapObj o = (SourceDeptMapObj) list.get(i);
			wbDeptMap.put(o.getSource_dept_name(), StringUtil.getNotEmptyStr(o.getDest_dept_code()));
		}
	}

	public String getWbSourceName(String wbSource)
	{
		return StringUtil.getNotEmptyStr(new DictionaryService().getDictValueByDictKey("外部接口字典", wbSource));
	}

	public String getZzAccSubName(String zzAccSubName)
	{
		return StringUtil.getNotEmptyStr(new DictionaryService().getDictValueByDictKey("总账会计科目全集字典", zzAccSubName));
	}
}
