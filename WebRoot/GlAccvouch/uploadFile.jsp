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
<!-- 基本信息 -->
<%
	// 上下文路径 
	String contextPath = request.getContextPath();

	// 对象实例 
	GlAccvouchObj domainInstance = new GlAccvouchObj();
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath();

	// 哪个外部接口
	String wbSource = request.getParameter("wbSource");
	String wbSourceName = new DictionaryService().getDictValueByDictKey("外部接口字典", wbSource);
	
	// 借方 or 贷方
	String debitORcredit = request.getParameter("debitORcredit");
%>
<html>
	<head>
		<base target="_self" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />
		<title>生成凭证</title>
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
			if(!checkNull("dbill_date","<%=domainInstance.getPropertyCnName("dbill_date")%>")) return false; 
			if(!checkNull("cbill","<%=domainInstance.getPropertyCnName("cbill")%>")) return false; 
			if(!checkNull("idoc","<%=domainInstance.getPropertyCnName("idoc")%>")) return false; 
			if(!isNumber($('#idoc').val())) {alert("<%=domainInstance.getPropertyCnName("idoc")%>"+"必须是数字"); return false;}
			if(!checkNull("file_upload","要导入的文件")) return false; 
			
			if(!confirm("本次导入将生成的是'<%=wbSourceName%>'的凭证，您确定要将文件'"+$("#file_upload").val()+"'生成此类凭证吗?")) return false;
			
			$("#uploadForm").submit();
		} 
	</script>
	<body>
		<form name="uploadForm" id="uploadForm" action="<%=contextPath%>/<%=basePath%>/Servlet?method=uploadFile" enctype="multipart/form-data" method="post">

			<!-- 表格标题 -->
			<table width="700" align="center" class="title_table">
				<tr>
					<td>
						<img src="../images/excel.png" width="18" height="18" align="absmiddle">
						&nbsp;&nbsp;<%=wbSourceName%>
						- 凭证导入
					</td>
				</tr>
			</table>

			<!-- 详细信息 -->
			<table width="700" align="center" class="detail_table detail_table-bordered detail_table-striped">
				<input type="hidden" id="wbSource" name="wbSource" value="<%=wbSource%>">
				<input type="hidden" id="debitORcredit" name="debitORcredit" value="<%=debitORcredit%>">
				<input type="hidden" id="pageCount" name="pageCount" value="<%=Integer.MAX_VALUE%>">
				<tr>
					<td>
						凭证生成时间:
					</td>
					<td>
						<input name="dbill_date" type="text" id="dbill_date" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDbill_date(), TimeUtil.nowTime2str( "yyyy-MM-dd"))%>"
							onfocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" />
					<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td>
						制单人:
					</td>
					<td>
						<input type="text" id="cbill" name="cbill" value="财务操作员">
						<font color="red">*</font>
					</td>
				</tr>
				<tr>
					<td>
						附件数:
					</td>
					<td>
						<input type="text" id="idoc" name="idoc" value="1">
						<font color="red">*</font> 
					</td>
				</tr>
				<tr>
					<td>
						摘要:
					</td>
					<td>
						<input type="text" id="cdigest" name="cdigest" value="<%=wbSourceName%>导入凭证">
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
		
		<form id="downloadForm" action="<%=contextPath%>/<%=basePath%>/Servlet?method=downloadTemplete" method="post">
			<table align="center">
			<tr><td>
			<a href="#" onclick="$('#downloadForm').submit()">下载凭证导入模板</a>
			</td></tr>
			</table>
		</form>
	</body>
</html>
