<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.hz.dict.service.DictionaryService"%> 
<%@page import="com.chengben.obj.VCostDirectSumbyDepttypeObj"%> 
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
					<%=domainInstance.getPropertyCnName("date_month") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getDate_month())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("department_type_code") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getDepartment_type_code())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("department_code") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getDepartment_code())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("department_name") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getDepartment_name())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("renyuan_jingfei") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getRenyuan_jingfei())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("weisheng_cailiao") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getWeisheng_cailiao())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("yaopin") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getYaopin())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("guding_zichan_zhejiu") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getGuding_zichan_zhejiu())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("wuxing_zichan_tanxiao") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getWuxing_zichan_tanxiao())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("tiqu_yiliao_fengxian_jijin") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getTiqu_yiliao_fengxian_jijin())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("qita_feiyong") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getQita_feiyong())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("heji") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getHeji())%></td> 
			</tr> 
		</table> 
		 
		<!-- 工具栏 --> 
		<jsp:include page="../ToolBar/detail_toolbar.jsp"/> 
	</body> 
</html> 
