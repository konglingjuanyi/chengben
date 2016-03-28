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
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	VCostDirectSumbyDepttypeObj domainInstance = (VCostDirectSumbyDepttypeObj) request.getAttribute("domainInstance"); 
	// 该功能路径 
	String basePath = domainInstance.getBasePath(); 
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
		<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/<%=basePath%>/Servlet?method=list4this"> 
			 
			<!-- 查询条件 --> 
			<table class="search_table" align="center" width="98%"> 
				<tr> 
					<td align="left"> 
						<%=domainInstance.getPropertyCnName("date_month") %> 
						<input name="date_month" type="text" id="date_month" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDate_month())%>" size="20" > 
						&nbsp;  
						<input name="searchButton" type="button" class="button button_search" value="查询" onClick="toPage(1)"> 
					</td> 
					<td align="right"> 
						<input name="addButton" type="button" class="button button_add" value="增加" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=preModify4this')"> 
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
			<table class="table table-bordered table-striped" align="center" width="98%"> 
				<thead> 
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
					for (int i = 0; i < list.size(); i++) 
						{ 
							VCostDirectSumbyDepttypeObj o = (VCostDirectSumbyDepttypeObj) list.get(i); 
				%> 
				<tr>
					<td><%=StringUtil.getNotEmptyStr(o.getDepartment_name())%></td> 
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
 
			<!-- 翻页操作栏 --> 
			<jsp:include page="../ToolBar/pagination_toolbar.jsp"> 
				<jsp:param name="basePath" value="<%=basePath%>"/> 
			</jsp:include> 
 
			<% 
				} 
			%> 
		</form>  
 
	</body> 
</html> 
