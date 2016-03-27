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
<%@page import="com.wuyg.common.util.TimeUtil"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.inspur.common.dictionary.pojo.DictItem"%>
<%@page import="com.chengben.obj.CostDirectObj"%>
<!-- 基本信息 -->
<%
	// 上下文路径 
	String contextPath = request.getContextPath();

	// 对象实例 
	GlAccvouchObj domainInstance = new GlAccvouchObj();
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath();
	
		// 月份，今年+去年
	Calendar cal=Calendar.getInstance();
	int year = cal.get(cal.YEAR);
	
	List<DictItem> date_month_list = new ArrayList<DictItem>();
	for(int y=year-1;y<=year;y++)
	{
		for(int i=1; i<=12; i++)
		{
			DictItem item = new DictItem();
			item.setK(y+"-"+(i<10?"0":"")+i);
			item.setV(item.getK());
			date_month_list.add(item);
		}
	}
	
	String date_month = TimeUtil.nowTime2str("yyyy-MM");
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
	<script> 
		function preview() 
		{	 
			// 做必要的检查 
			if(!checkNull("date_month","<%=domainInstance.getPropertyCnName("date_month")%>")) return false; 
			if(!checkNull("file_upload","要导入的文件")) return false; 
			
			$("#uploadForm").submit();
		} 
	</script>
	<body>
		<form name="uploadForm" id="uploadForm" action="<%=contextPath%>/ExcelParser/Servlet?method=uploadFile&date_month=<%=date_month %>" enctype="multipart/form-data" method="post">

			<!-- 表格标题 -->
			<table width="700" align="center" class="title_table">
				<tr>
					<td>
						<img src="../images/excel.png" width="18" height="18" align="absmiddle">
						&nbsp;&nbsp;直接成本表导入
					</td>
				</tr>
			</table>

			<!-- 详细信息 -->
			<table width="700" align="center" class="detail_table detail_table-bordered detail_table-striped">
				<tr>
					<td>
						月份:
					</td>
					<td>
					<%=DictionaryUtil.getSelectHtml(date_month_list, "date_month", "", date_month , "notEmpty")%> 
					<font color="red">*</font>
					<input type="hidden" id="basedbobj_class" name="basedbobj_class" value="<%=CostDirectObj.class.getCanonicalName() %>">
					</td>
				</tr>
				<tr>
					<td style="width: 200px; text-align: right">
						请选择要导入的Excel数据文件:
						<br>
						(支持Office2007及以下版本)
					</td>
					<td>
						<input id="file_upload" name="file_upload" type="file" size="40" />
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" class="button button_add" value="预览" onClick="preview()"/>
					</td>
				</tr>
			</table>
		</form>
		
		<form id="downloadForm" action="<%=contextPath%>/CostDirect/Servlet?method=downloadTemplete" method="post">
			<table align="center">
			<tr><td>
			<a href="#" onclick="$('#downloadForm').submit()">下载直接成本表导入模板</a>
			</td></tr>
			</table>
		</form>
		
		<script type="text/javascript">
		$("#date_month").change(function(){
			$("#uploadForm").attr("action","<%=contextPath%>/ExcelParser/Servlet?method=uploadFile&date_month="+$(this).val());
		});
		</script>
	</body>
</html>
