<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<!-- 引入类 -->
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.wuyg.common.util.StringUtil"%>
<%@page import="com.inspur.common.dictionary.util.DictionaryUtil"%>
<%@page import="com.hz.dict.service.DictionaryService"%>
<%@page import="com.hz.dict.service.IDictionaryService"%>
<%@page import="com.wuyg.common.dao.BaseDbObj"%>
<%@page import="com.gl.obj.GlAccvouchObj"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.chengben.obj.DepartmentObj"%>
<!-- 基本信息 -->
<%
	// 上下文路径 
	String contextPath = request.getContextPath();

	// 对象实例 
	GlAccvouchObj domainInstance = new GlAccvouchObj();
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath();

	
	Object tempObj = request.getAttribute("departmentListNeedAdd");
	List<DepartmentObj> departmentListNeedAdd = new ArrayList<DepartmentObj>();
	if(tempObj!=null)
	{
		departmentListNeedAdd = (List<DepartmentObj>)tempObj;
	}
	
	
%>
<html>
	<head>
		<base target="_self" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />
		<title><%=domainInstance.getCnName()%></title>
		<link href="../css/global.css" rel="stylesheet" type="text/css">
		<link href="../css/table.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script>
		<script type="text/javascript" src="../js/utils.js"></script>
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
	</head>
	<body>
	<!-- 表格标题 -->
			<table width="700" align="center" class="title_table">
				<tr>
					<td>
						<img src="../images/excel.png" width="18" height="18" align="absmiddle">
						&nbsp;&nbsp;直接成本表导入，发现有以下科室未录入系统，请补充完善后再重新导入
					</td>
				</tr>
			</table>
			
		<!-- 表格标题 --> 
		
		<table width="700" align="center" class="alert_table"> 
		<%for(int i=0;i<departmentListNeedAdd.size();i++){ %>
			<tr> 
				<td> 
					<img src="../images/svg/light/orange/32/alert.png" width="18" height="18" align="absmiddle"> 
					&nbsp;&nbsp;<%=departmentListNeedAdd.get(i).getDepartment_name() %>
				</td> 
			</tr> 
		<%} %>
		</table> 
		
		
		


	</body>
</html>
