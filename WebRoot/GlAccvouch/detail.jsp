<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.hz.dict.service.DictionaryService"%> 
<%@page import="com.gl.obj.GlAccvouchObj"%> 
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
					<img src="../images/svg/heavy/green/list.png" width="18" height="18" align="absmiddle"> 
					&nbsp;&nbsp;<%=domainInstance.getCnName()%>信息 
				</td> 
			</tr> 
		</table> 
		<!-- 详细信息 --> 
		<table width="600" align="center" class="detail_table detail_table-bordered detail_table-striped"> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("i_id") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getI_id())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("iperiod") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getIperiod())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("csign") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCsign())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ino_id") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getIno_id())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("inid") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getInid())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dbill_date") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getDbill_date())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("idoc") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getIdoc())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cbill") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCbill())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccode") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("md") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getMd())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("mc") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getMc())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("md_f") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getMd_f())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("mc_f") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getMc_f())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("nfrat") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getNfrat())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("nd_s") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getNd_s())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("nc_s") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getNc_s())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdept_id") %>: 
				</td> 
				<td><%=new DictionaryService().getDictValueByDictKey("核算科室字典",domainInstance.getCdept_id())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("rowguid") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getRowguid())%></td> 
			</tr> 
		</table> 
		 
		<!-- 工具栏 --> 
		<jsp:include page="../ToolBar/detail_toolbar.jsp"/> 
	</body> 
</html> 
