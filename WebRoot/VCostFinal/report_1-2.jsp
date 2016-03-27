<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<!-- 引入类 -->
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.wuyg.common.util.StringUtil"%>
<%@page import="com.wuyg.common.obj.PaginationObj"%>
<%@page import="com.inspur.common.dictionary.util.DictionaryUtil"%>
<%@page import="com.hz.dict.service.DictionaryService"%>
<%@page import="com.chengben.obj.VCostFinalObj"%>
<%@page import="com.chengben.obj.VCostFinalSumbyCosttypeObj"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.inspur.common.dictionary.pojo.DictItem"%>
<!-- 基本信息 -->
<%
	// 当前上下文路径 
	String contextPath = request.getContextPath();

	// 该功能对象实例 
	VCostFinalObj domainInstance = (VCostFinalObj) request.getAttribute("domainInstance");
	// 该功能路径 
	String basePath = domainInstance.getBasePath();
	
	// 月份，今年+去年
	Calendar cal=Calendar.getInstance();
	int year = cal.get(cal.YEAR);
	
	List<DictItem> date_month_list = new ArrayList<DictItem>();
	for(int y=year-1;y<=year;y++)
	{
		for(int i=1; i<=12; i++)
		{
			DictItem item = new DictItem();
			item.setK(y+"-"+(i<10?"0":"")+i);
			item.setV(item.getK());
			date_month_list.add(item);
		}
	}
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title><%=domainInstance.getCnName()%>列表</title>
		<link href="../css/global.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script>
		<script type="text/javascript" src="../js/utils.js"></script>
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="../js/css-1.7.0.min.js"></script>
	</head>
	<body>
		<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/<%=basePath%>/Servlet?method=report&reportId=1-2">

			<!-- 查询条件 -->
			<table class="search_table" align="center" width="98%">
				<tr>
					<td>
					月份：
					<%=DictionaryUtil.getSelectHtml(date_month_list, "date_month", "", StringUtil.getNotEmptyStr(request.getAttribute("date_month"), ""), "notEmpty")%> 
					</td>
				</tr>
			</table>

			<!-- 查询结果 -->
			<%
				PaginationObj pagination = null;
				List list = new ArrayList();

				Object paginationObj = request.getAttribute("domainPagination");
				if (paginationObj != null)
				{
					pagination = (PaginationObj) paginationObj;
					list = (List) pagination.getDataList();
				}
				if (paginationObj == null)
				{
					out.print("没有符合条件的数据，请重新设置条件再查询。");
				} else
				{
			%>
			<div id="printDiv">
			<!-- 
			<table class="title_table" align="center" width="98%">
			<tr><td style="text-align:center">医院临床服务类科室全成本报表<br/><%=domainInstance.getDate_month() %></td></tr>
			</table>
			 -->
			<table class="table report_table table-bordered table-striped" align="center" width="98%">
				<thead>
					<tr>
						<th colspan="25" style="text-align:center">医院临床服务类科室全成本报表<br/><%=domainInstance.getDate_month() %>
						</th>
					</tr>
					<tr>
						<th>
							科室
						</th>
						<th colspan="3">
							人员经费
						</th>
						<th colspan="3">
							卫生材料费
						</th>
						<th colspan="3">
							药品费
						</th>
						<th colspan="3">
							固定资产折旧费
						</th>
						<th colspan="3">
							无形资产摊销
						</th>
						<th colspan="3">
							提取医疗风险基金
						</th>
						<th colspan="3">
							其他费用
						</th>
						<th colspan="3">
							合计
						</th>
					</tr>
					<tr>
						<th>
							&nbsp;
						</th>
						<th>
							直接成本
						</th>
						<th>
							间接成本
						</th>
						<th>
							全成本
						</th>
						<th>
							直接成本
						</th>
						<th>
							间接成本
						</th>
						<th>
							全成本
						</th>
						<th>
							直接成本
						</th>
						<th>
							间接成本
						</th>
						<th>
							全成本
						</th>
						<th>
							直接成本
						</th>
						<th>
							间接成本
						</th>
						<th>
							全成本
						</th>
						<th>
							直接成本
						</th>
						<th>
							间接成本
						</th>
						<th>
							全成本
						</th>
						<th>
							直接成本
						</th>
						<th>
							间接成本
						</th>
						<th>
							全成本
						</th>
						<th>
							直接成本
						</th>
						<th>
							间接成本
						</th>
						<th>
							全成本
						</th>
						<th>
							直接成本
						</th>
						<th>
							间接成本
						</th>
						<th>
							全成本
						</th>
					</tr>
				</thead>
				<%
					for (int i = 0; i < list.size(); i++)
						{
							VCostFinalObj o = (VCostFinalObj) list.get(i);
				%>
				<tr>
					<td style="word-break:keep-all"><%=StringUtil.getNotEmptyStr(o.getDepartment_name())%></td>
					<td><%=StringUtil.formatDouble(o.getRenyuan_jingfei(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getRenyuan_jingfei_share(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getRenyuan_jingfei_sum(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getWeisheng_cailiao(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getWeisheng_cailiao_share(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getWeisheng_cailiao_sum(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getYaopin(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getYaopin_share(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getYaopin_sum(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getGuding_zichan_zhejiu(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getGuding_zichan_zhejiu_share(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getGuding_zichan_zhejiu_sum(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getWuxing_zichan_tanxiao(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getWuxing_zichan_tanxiao_share(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getWuxing_zichan_tanxiao_sum(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getTiqu_yiliao_fengxian_jijin(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getTiqu_yiliao_fengxian_jijin_share(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getTiqu_yiliao_fengxian_jijin_sum(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getQita_feiyong(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getQita_feiyong_share(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getQita_feiyong_sum(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getDirect_total(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getShare_total(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getTotal(),2)%></td>
				</tr>
				<%
					}
					
					VCostFinalSumbyCosttypeObj o = (VCostFinalSumbyCosttypeObj)request.getAttribute("vCostFinalSumbyCosttypeObj");
				%>
				<tr style="color:blue">
					<td style="word-break:keep-all">临床类合计:</td>
					<td><%=StringUtil.formatDouble(o.getRenyuan_jingfei(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getRenyuan_jingfei_share(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getRenyuan_jingfei_sum(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getWeisheng_cailiao(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getWeisheng_cailiao_share(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getWeisheng_cailiao_sum(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getYaopin(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getYaopin_share(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getYaopin_sum(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getGuding_zichan_zhejiu(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getGuding_zichan_zhejiu_share(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getGuding_zichan_zhejiu_sum(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getWuxing_zichan_tanxiao(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getWuxing_zichan_tanxiao_share(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getWuxing_zichan_tanxiao_sum(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getTiqu_yiliao_fengxian_jijin(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getTiqu_yiliao_fengxian_jijin_share(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getTiqu_yiliao_fengxian_jijin_sum(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getQita_feiyong(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getQita_feiyong_share(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getQita_feiyong_sum(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getDirect_total(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getShare_total(),2)%></td>
					<td><%=StringUtil.formatDouble(o.getTotal(),2)%></td>
				</tr>
			</table>
			</div>

			<!-- 工具栏 -->
			<jsp:include page="report_toolbar.jsp">
			<jsp:param name="basePath" value="<%=basePath %>"/>
			</jsp:include>
			
			<%
				}
			%>
			<script>
			// 重新查询
			$("#date_month").change(function(){
				$("#pageForm").submit();
			});
			</script>			
		</form>
	</body>
</html>
