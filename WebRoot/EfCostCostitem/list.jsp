<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.inspur.common.dictionary.util.DictionaryUtil"%> 
<%@page import="com.hz.dict.service.DictionaryService"%> 
<%@page import="com.cost.obj.EfCostCostitemObj"%> 
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	EfCostCostitemObj domainInstance = (EfCostCostitemObj) request.getAttribute("domainInstance"); 
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
						<%=domainInstance.getPropertyCnName("ccostitemcode") %> 
						<input name="ccostitemcode" type="text" id="ccostitemcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcostitemcode())%>" size="20" > 
						&nbsp;  
						<%=domainInstance.getPropertyCnName("ccostitemname") %> 
						<input name="ccostitemname" type="text" id="ccostitemname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcostitemname())%>" size="20" > 
						&nbsp;  
						<input name="searchButton" type="button" class="button button_search" value="查询" onClick="toPage1(1)"> 
					</td> 
					<td align="right"> 
						<input name="addButton" type="button" class="button button_add" value="增加" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=preModify4this')"> 
											<input name="uploadButton" type="button" class="button button_upload" value="导入" onClick="openBigModalDialog('<%=contextPath%>/ExcelParser/uploadFile.jsp?basedbobj_class=<%=domainInstance.getClass().getCanonicalName()%>')">
					</td> 
				</tr> 
			</table> 
 
			<!-- 查询结果 --> 
 			<div id="data_list_div">
			<jsp:include page="listData.jsp"> 
				<jsp:param name="basePath" value="<%=basePath%>"/> 
			</jsp:include> 
			</div>
 
		</form>  
 		
 		
 		
 		<script>
 		function toPage1(pageNo)
 		{
 			$.post("Servlet?method=list4this&justListData=true",  
					$('#pageForm').serialize(),  
					function (data, textStatus){
						$('#data_list_div').html(data);
				}); 
 		}
 		
 		$('#ccostitemcode').bind('input propertychange',function(){
 				$('#pageNo').val(1);
 		 		$.post("Servlet?method=list4this&justListData=true",  
					$('#pageForm').serialize(),  
					function (data, textStatus){
						$('#data_list_div').html(data);
				}); 
 		}
 		);
 		</script>
	</body> 
</html> 
