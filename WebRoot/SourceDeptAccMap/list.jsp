<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.inspur.common.dictionary.util.DictionaryUtil"%> 
<%@page import="com.hz.dict.service.DictionaryService"%> 
<%@page import="com.chengben.obj.SourceDeptAccMapObj"%> 
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	SourceDeptAccMapObj domainInstance = (SourceDeptAccMapObj) request.getAttribute("domainInstance"); 
	// 该功能路径 
	String basePath = domainInstance.getBasePath(); 
	// 只呈现待完善的对照关系
	boolean list4notOk = "true".equalsIgnoreCase(request.getAttribute("list4notOk")+"");
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
			
			<table class="title_table" align="center" width="98%"> 
				<tr>
					<td><%=new DictionaryService().getDictValueByDictKey("外部接口字典",domainInstance.getSource_system()) %>-会计科目对照关系</td>
				</tr>
			</table>
			<!-- 查询条件 --> 
			<table class="search_table" align="center" width="98%"> 
				<tr> 
					<td align="left"> 
						<input type="hidden" id="source_system" name="source_system" value="<%=domainInstance.getSource_system() %>">   
						<%=domainInstance.getPropertyCnName("dept_share_type") %> 
						<%=DictionaryUtil.getSelectHtml(new DictionaryService().getDictItemsByDictName("科室类别字典", false), "dept_share_type", "", StringUtil.getNotEmptyStr(domainInstance.getDept_share_type(), ""), "notEmpty")%> 
						&nbsp;  
						<%=domainInstance.getPropertyCnName("source_acc_subject") %> 
						<input name="source_acc_subject" type="text" id="source_acc_subject" value="<%=StringUtil.getNotEmptyStr(domainInstance.getSource_acc_subject())%>" size="20" > 
						&nbsp;  
						<input name="list4notOk" type="checkbox" value="true" <%=list4notOk?"checked":"" %>>只查还未对照的
						&nbsp;  
						<input name="searchButton" type="button" class="button button_search" value="查询" onClick="toPage(1)"> 
					</td> 
					<td align="right"> 
						<input name="addButton" type="button" class="button button_add" value="增加" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=preModify4this&source_system=<%=domainInstance.getSource_system() %>')"> 
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
						<th><%=domainInstance.getPropertyCnName("source_system") %></th> 
						<th><%=domainInstance.getPropertyCnName("dept_share_type") %></th> 
						<th><%=domainInstance.getPropertyCnName("source_acc_subject") %></th> 
						<th><%=domainInstance.getPropertyCnName("dest_acc_subject") %></th> 
						<th>操作</th> 
					</tr> 
				</thead> 
				<% 
					for (int i = 0; i < list.size(); i++) 
						{ 
							SourceDeptAccMapObj o = (SourceDeptAccMapObj) list.get(i); 
				%> 
				<tr> 
					<td> 
						<a href="#" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=detail4this&<%=o.findKeyColumnName()%>=<%=o.getKeyValue()%>')"> <%=StringUtil.getNotEmptyStr(o.getKeyValue())%> </a> 
					</td> 
					<td><%=new DictionaryService().getDictValueByDictKey("外部接口字典",o.getSource_system())%></td>  
					<td><%=new DictionaryService().getDictValueByDictKey("科室类别字典",o.getDept_share_type())%></td>  
					<td><%=StringUtil.getNotEmptyStr(o.getSource_acc_subject())%></td> 
					<td>
					<%if(o.getDest_acc_subject()!=null){ %>
					<%=new DictionaryService().getDictValueByDictKey("会计科目字典",o.getDest_acc_subject())%>(<%=o.getDest_acc_subject() %>)
					<%}%>
					</td>  
					<td align="left" style="cursor: pointer"> 
						<input type="button" class="button button_modify" title="修改" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=preModify4this&<%=o.findKeyColumnName()%>=<%=o.getKeyValue()%>')" /> 
						&nbsp; 
						<input type="button" class="button button_delete" title="删除" 
							onClick="javascript: 
								$('#pageForm').attr('action','<%=contextPath%>/<%=basePath%>/Servlet?method=delete4this&<%=o.findKeyColumnName()%>_4del=<%=o.getKeyValue()%>&list4notOk=<%=list4notOk %>'); 
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
