<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.inspur.common.dictionary.util.DictionaryUtil"%> 
<%@page import="com.hz.dict.service.DictionaryService"%> 
<%@page import="com.chengben.obj.VSourceDeptMapInfoObj"%> 
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	VSourceDeptMapInfoObj domainInstance = (VSourceDeptMapInfoObj) request.getAttribute("domainInstance"); 
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
					<td align="left"><%=domainInstance.getPropertyCnName("source_system") %> 
						<%=DictionaryUtil.getSelectHtml(new DictionaryService().getDictItemsByDictName("外部接口字典", false), "source_system", "", StringUtil.getNotEmptyStr(domainInstance.getSource_system(), ""), "notEmpty")%>  
						&nbsp;
						<input name="searchButton" type="button" class="button button_search" value="查询" onClick="toPage(1)">
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
						<th><%=domainInstance.getPropertyCnName("relation_name") %></th> 
						<th><%=domainInstance.getPropertyCnName("source_system") %></th> 
						<th><%=domainInstance.getPropertyCnName("relation_total_num") %></th> 
						<th><%=domainInstance.getPropertyCnName("relation_ok_num") %></th> 
						<th><%=domainInstance.getPropertyCnName("relation_not_ok_num") %></th> 
						<th>操作</th> 
					</tr> 
				</thead> 
				<% 
					for (int i = 0; i < list.size(); i++) 
						{ 
							VSourceDeptMapInfoObj o = (VSourceDeptMapInfoObj) list.get(i); 
				%> 
				<tr> 
					<td><%=StringUtil.getNotEmptyStr(o.getRelation_name())%></td> 
					<td><%=new DictionaryService().getDictValueByDictKey("外部接口字典",StringUtil.getNotEmptyStr(o.getSource_system()))%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getRelation_total_num())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getRelation_ok_num())%></td> 
					<td>
					<%if(o.getRelation_not_ok_num()>0){ %>
					<a href="#" onclick="winOpen('<%=request.getContextPath()%>/SourceDeptMap/Servlet?method=list4this&list4notOk=true&source_system=<%=o.getSource_system() %>')"><%=StringUtil.getNotEmptyStr(o.getRelation_not_ok_num())%></a>
					<%} else { %>
					0
					<%}%>
					</td>
					<td align="left" style="cursor: pointer"> 
					<a href="#" onclick="winOpen('<%=request.getContextPath()%>/SourceDeptMap/Servlet?method=list4this&source_system=<%=o.getSource_system() %>')">维护</a>
					</td> 
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
