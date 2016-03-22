<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.inspur.common.dictionary.util.DictionaryUtil"%> 
<%@page import="com.hz.dict.service.DictionaryService"%> 
<%@page import="com.wuyg.system.obj.SysMapItemsObj"%>
<%@page import="com.wuyg.system.obj.SysMapInfoObj"%> 
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	SysMapItemsObj domainInstance = (SysMapItemsObj) request.getAttribute("domainInstance"); 
	// 该功能路径 
	String basePath = domainInstance.getBasePath(); 
	
	
	// 则获取对象信息 
	SysMapInfoObj sysMapInfo=new SysMapInfoObj();
	Object sysMapInfoObj = request.getAttribute("sysMapInfo"); 
	if (sysMapInfoObj != null) 
	{ 
		sysMapInfo = (SysMapInfoObj) sysMapInfoObj; 
	}
	
	// 外部系统名称
	String otherSysName=new DictionaryService().getDictValueByDictKey("外部接口字典",sysMapInfo.getOther_system() );
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
		<!-- 表格标题 --> 
		<table width="98%" align="center" class="title_table"> 
			<tr> 
				<td> 
					<img src="../images/svg/heavy/green/map_item.png" width="18" height="18" align="absmiddle"> 
					&nbsp;&nbsp;<%= new DictionaryService().getDictValueByDictKey("映射关系字典",domainInstance.getMap_id()+"" )%>
				</td> 
			</tr> 
		</table> 
			<!-- 查询条件 --> 
			<table class="search_table" align="center" width="98%"> 
				<tr> 
					<td align="left"> 
						<input type="hidden" id="map_id" name="map_id" value="<%=domainInstance.getMap_id() %>">
						<!--
						<%=domainInstance.getPropertyCnName("map_id") %> 
						<%=DictionaryUtil.getSelectHtml(new DictionaryService().getDictItemsByDictName("映射关系字典", false), "map_id", "", StringUtil.getNotEmptyStr(domainInstance.getMap_id(), ""), "notEmpty")%> 
						-->
						
						&nbsp;  
						<!-- <%=domainInstance.getPropertyCnName("source_name") %>  -->
						<%="成本系统-"+sysMapInfo.getSource_name() %>
						<input name="source_name" type="text" id="source_name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getSource_name())%>" size="20" > 
						&nbsp;  
						<!-- <%=domainInstance.getPropertyCnName("dest_name") %> -->
						<%=otherSysName+"-"+sysMapInfo.getDest_name() %>
						<input name="dest_name" type="text" id="dest_name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDest_name())%>" size="20" > 
						&nbsp;  
						<input name="searchButton" type="button" class="button button_search" value="查询" onClick="toPage(1)"> 
					</td> 
					<td align="right"> 
						<input name="addButton" type="button" class="button button_add" value="增加" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=preModify4this&map_id=<%=domainInstance.getMap_id()%>')"> 
						<input name="uploadButton" type="button" class="button button_upload" value="导入" onClick="openBigModalDialog('<%=contextPath%>/ExcelParser/uploadFile.jsp?basedbobj_class=<%=domainInstance.getClass().getCanonicalName()%>')">
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
						<th><%=domainInstance.getPropertyCnName("id") %></th> 
						<!-- <th><%=domainInstance.getPropertyCnName("map_id") %></th>  -->
						<th style="color:#66cccc"><%="成本系统<br>"+sysMapInfo.getSource_name()+"编号" %></th> 
						<th style="color:#66cccc"><%="成本系统<br>"+sysMapInfo.getSource_name()+"名称" %></th> 
						<th style="color:#ff9900"><%=otherSysName+"<br>"+sysMapInfo.getDest_name()+"编号" %></th> 
						<th style="color:#ff9900"><%=otherSysName+"<br>"+sysMapInfo.getDest_name()+"名称" %></th> 
						<th>操作</th> 
					</tr> 
				</thead> 
				<% 
					for (int i = 0; i < list.size(); i++) 
						{ 
							SysMapItemsObj o = (SysMapItemsObj) list.get(i); 
				%> 
				<tr> 
					<td> 
						<a href="#" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=detail4this&<%=o.findKeyColumnName()%>=<%=o.getKeyValue()%>')"> <%=StringUtil.getNotEmptyStr(o.getKeyValue())%> </a> 
					</td> 
					<!-- <td><%=StringUtil.getNotEmptyStr(o.getMap_id())%></td>  -->
					<td><%=StringUtil.getNotEmptyStr(o.getSource_id())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getSource_name())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getDest_id())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getDest_name())%></td> 
					<td align="left" style="cursor: pointer"> 
						<input type="button" class="button button_modify" title="修改" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=preModify4this&<%=o.findKeyColumnName()%>=<%=o.getKeyValue()%>')" /> 
						&nbsp; 
						<input type="button" class="button button_delete" title="删除" 
							onClick="javascript: 
								$('#pageForm').attr('action','<%=contextPath%>/<%=basePath%>/Servlet?method=delete4this&<%=o.findKeyColumnName()%>_4del=<%=o.getKeyValue()%>'); 
								$('#pageForm').submit(); 
								" /> 
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
