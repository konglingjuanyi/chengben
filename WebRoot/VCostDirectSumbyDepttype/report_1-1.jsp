<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.inspur.common.dictionary.util.DictionaryUtil"%> 
<%@page import="com.hz.dict.service.DictionaryService"%> 
<%@page import="com.chengben.obj.VCostDirectSumbyDepttypeObj"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.inspur.common.dictionary.pojo.DictItem"%> 
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	VCostDirectSumbyDepttypeObj domainInstance = (VCostDirectSumbyDepttypeObj) request.getAttribute("domainInstance"); 
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
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />		<title><%=domainInstance.getCnName() %>列表</title> 
		<link href="../css/global.css" rel="stylesheet" type="text/css"> 
		<link href="../css/table.css" rel="stylesheet" type="text/css"> 
		<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script> 
		<script type="text/javascript" src="../js/utils.js"></script> 
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script> 
	</head> 
	<body> 
		<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/<%=basePath%>/Servlet?method=report"> 
			 
			<!-- 查询条件 --> 
			<table class="search_table" align="center" width="98%"> 
				<tr> 
					<td align="left"> 
						月份
						<%=DictionaryUtil.getSelectHtml(date_month_list, "date_month", "", domainInstance.getDate_month(), "notEmpty")%> 
						&nbsp;
						<input name="searchButton" type="submit" class="button button_search" value="查询"> 
					</td>
				</tr> 
			</table> 
 
			<!-- 查询结果 --> 
			<% 
				List<VCostDirectSumbyDepttypeObj> dataList = new ArrayList(); 
 
				Object dataListObj = request.getAttribute("dataList"); 
				if (dataListObj != null) 
				{ 
					dataList = (List<VCostDirectSumbyDepttypeObj>) dataListObj;
				} 
				if (dataListObj == null) 
				{ 
					out.print("没有符合条件的数据，请重新设置条件再查询。"); 
				} 
			%> 
			<div id="printDiv">
			<table class="table report_table table-bordered table-striped" align="center" width="98%"> 
				<thead> 
					<tr>
						<th colspan="9" style="text-align:center">各科室直接成本表<br/><font color="#ff9900"><%=domainInstance.getDate_month() %></font>
						</th>
					</tr>
					<tr>
						<th><%=domainInstance.getPropertyCnName("department_name") %></th> 
						<th><%=domainInstance.getPropertyCnName("renyuan_jingfei") %></th> 
						<th><%=domainInstance.getPropertyCnName("weisheng_cailiao") %></th> 
						<th><%=domainInstance.getPropertyCnName("yaopin") %></th> 
						<th><%=domainInstance.getPropertyCnName("guding_zichan_zhejiu") %></th> 
						<th><%=domainInstance.getPropertyCnName("wuxing_zichan_tanxiao") %></th> 
						<th><%=domainInstance.getPropertyCnName("tiqu_yiliao_fengxian_jijin") %></th> 
						<th><%=domainInstance.getPropertyCnName("qita_feiyong") %></th> 
						<th><%=domainInstance.getPropertyCnName("heji") %></th> 
					</tr> 
				</thead> 
				<% 
					for (int i = 0; i < dataList.size(); i++) 
						{ 
							VCostDirectSumbyDepttypeObj o = (VCostDirectSumbyDepttypeObj) dataList.get(i); 
				%> 
				<tr <%=o.getDepartment_name().contains("合计")|o.getDepartment_name().contains("小计")?"style='color:blue'":""%>>
					<td style="word-break:keep-all"><%=StringUtil.getNotEmptyStr(o.getDepartment_name())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getRenyuan_jingfei())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getWeisheng_cailiao())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getYaopin())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getGuding_zichan_zhejiu())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getWuxing_zichan_tanxiao())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getTiqu_yiliao_fengxian_jijin())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getQita_feiyong())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getHeji())%></td> 
				</tr> 
				<% 
					} 
				%> 
			</table> 
			</div>
 
			<!-- 翻页操作栏 --> 
			<jsp:include page="../VCostFinal/report_toolbar.jsp"> 
				<jsp:param name="basePath" value="VCostFinal"/> 
			</jsp:include> 
  
		</form>  
 
	</body> 
</html> 
