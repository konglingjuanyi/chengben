<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.inspur.common.dictionary.util.DictionaryUtil"%> 
<%@page import="com.hz.dict.service.DictionaryService"%> 
<%@page import="com.gl.obj.GlAccvouchObj"%>
<%@page import="com.wuyg.common.util.TimeUtil"%>
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	GlAccvouchObj domainInstance = (GlAccvouchObj) request.getAttribute("domainInstance"); 
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
		<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/<%=basePath%>/Servlet?method=zzlist"> 
			 
			<!-- 查询条件 --> 
			<table class="search_table" align="center" width="98%"> 
				<tr> 
					<td align="left"> 
						<%=domainInstance.getPropertyCnName("iperiod") %> 
						<input name="iperiod" type="text" id="iperiod" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIperiod())%>" size="5" > 
						&nbsp;
						<%=domainInstance.getPropertyCnName("csign") %> 
						<input name="csign" type="text" id="csign" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCsign())%>" size="5" > 
						&nbsp;
						<%=domainInstance.getPropertyCnName("ino_id") %> 
						<input name="ino_id" type="text" id="ino_id" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIno_id())%>" size="5" > 
						&nbsp;  
						<%=domainInstance.getPropertyCnName("ccode") %> 
						<input name="ccode" type="text" id="ccode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcode())%>" size="20" > 
						&nbsp;  
						<%=domainInstance.getPropertyCnName("cdept_id") %> 
						<%=DictionaryUtil.getSelectHtml(new DictionaryService().getDictItemsByDictName("医院科室字典", false), "cdept_id", "", StringUtil.getNotEmptyStr(domainInstance.getCdept_id(), ""), "notEmpty")%> 
						&nbsp;  
						<input name="searchButton" type="button" class="button button_search" value="查询" onClick="toPage(1)"> 
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
						
						<th><%=domainInstance.getPropertyCnName("iperiod") %></th> 
						<th><%=domainInstance.getPropertyCnName("csign") %></th> 
						<th><%=domainInstance.getPropertyCnName("ino_id") %></th> 
						<th><%=domainInstance.getPropertyCnName("inid") %></th> 
						<th><%=domainInstance.getPropertyCnName("dbill_date") %></th> 
						<th><%=domainInstance.getPropertyCnName("idoc") %></th> 
						<th><%=domainInstance.getPropertyCnName("cbill") %></th> 
						<th><%=domainInstance.getPropertyCnName("cdept_id") %></th> 
						<th><%=domainInstance.getPropertyCnName("ccode") %></th> 
						<th><%=domainInstance.getPropertyCnName("md") %></th> 
						<th><%=domainInstance.getPropertyCnName("mc") %></th> 
						<!-- 
						<th><%=domainInstance.getPropertyCnName("md_f") %></th> 
						<th><%=domainInstance.getPropertyCnName("mc_f") %></th> 
						<th><%=domainInstance.getPropertyCnName("nfrat") %></th> 
						<th><%=domainInstance.getPropertyCnName("nd_s") %></th> 
						<th><%=domainInstance.getPropertyCnName("nc_s") %></th> 
						 -->
						
						<th><%=domainInstance.getPropertyCnName("cdigest") %></th> 
						
					</tr> 
				</thead> 
				<% 
					for (int i = 0; i < list.size(); i++) 
						{ 
							GlAccvouchObj o = (GlAccvouchObj) list.get(i); 
				%> 
				<tr> 
					<td><%=StringUtil.getNotEmptyStr(o.getIperiod())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCsign())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getIno_id())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getInid())%></td> 
					<td><%=TimeUtil.date2str(o.getDbill_date(),"yyyy-MM-dd")%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getIdoc())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCbill())%></td> 
					<td><%=new DictionaryService().getDictValueByDictKey("医院科室字典",o.getCdept_id(),true)%></td>
					<td><%=new DictionaryService().getDictValueByDictKey("会计科目字典",o.getCcode(),true)%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getMd())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getMc())%></td> 
					<!-- 
					<td><%=StringUtil.getNotEmptyStr(o.getMd_f())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getMc_f())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getNfrat())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getNd_s())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getNc_s())%></td> 
					-->
					<td><%=StringUtil.getNotEmptyStr(o.getCdigest())%></td> 
					
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
