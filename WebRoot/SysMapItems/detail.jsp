<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.system.obj.SysMapItemsObj"%>
<%@page import="com.hz.dict.service.DictionaryService"%> 
<% 
	// 当前上下文路径  
	String contextPath = request.getContextPath();  
  
	// 该功能对象实例  
	SysMapItemsObj domainInstance = (SysMapItemsObj) request.getAttribute("domainInstance");  
	// 该功能路径  
	String basePath = domainInstance.getBasePath();  
%> 
<html> 
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />		<title><%=domainInstance.getCnName()%>详情</title> 
		<link href="../css/global.css" rel="stylesheet" type="text/css" /> 
		<link href="../css/table.css" rel="stylesheet" type="text/css" /> 
		<script src="../js/jquery-2.0.3.min.js"></script> 
		<script src="../js/utils.js"></script> 
	</head> 
	<body> 
		<!-- 表格标题 --> 
		<table width="600" align="center" class="title_table"> 
			<tr> 
				<td> 
					<img src="../images/svg/heavy/green/map_item.png" width="18" height="18" align="absmiddle"> 
					&nbsp;&nbsp;<%=domainInstance.getCnName()%>信息 
				</td> 
			</tr> 
		</table> 
		<!-- 详细信息 --> 
		<table width="600" align="center" class="detail_table detail_table-bordered detail_table-striped"> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("id") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getId())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("map_id") %>: 
				</td> 
				<td><%=new DictionaryService().getDictValueByDictKey("映射关系字典",StringUtil.getNotEmptyStr(domainInstance.getMap_id()))%></td> 
				<td></td><td></td>
			</tr> 
			<tr> 
				<td style="color:#3daeb6"> 
					<%=domainInstance.getPropertyCnName("source_id") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getSource_id())%></td> 
				<td style="color:#ff9900"> 
					<%=domainInstance.getPropertyCnName("dest_id") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getDest_id())%></td> 
			</tr> 
			<tr> 
				<td style="color:#3daeb6"> 
					<%=domainInstance.getPropertyCnName("source_name") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getSource_name())%></td> 
				<td style="color:#ff9900"> 
					<%=domainInstance.getPropertyCnName("dest_name") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getDest_name())%></td> 
			</tr> 
		</table> 
		 
		<!-- 工具栏 --> 
		<jsp:include page="../ToolBar/detail_toolbar.jsp"/> 
	</body> 
</html> 
