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
<!-- 基本信息 -->
<%
	// 上下文路径 
	String contextPath = request.getContextPath();

	// 对象实例 
	GlAccvouchObj domainInstance = new GlAccvouchObj();
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath();

	// 哪个外部接口
	String wbSource = StringUtil.getNotEmptyStr(request.getAttribute("wbSource"));
	String wbSourceName = new DictionaryService().getDictValueByDictKey("外部接口字典", wbSource);
	
	Object tempObj = request.getAttribute("warnGlAccvouchMap");
	Map<String,GlAccvouchObj> warnGlAccvouchMap = new HashMap<String,GlAccvouchObj>();
	if(tempObj!=null)
	{
		warnGlAccvouchMap = (HashMap<String,GlAccvouchObj>)tempObj;
	}
	
	Object[] warnGlAccvouchs = warnGlAccvouchMap.keySet().toArray();
	
	tempObj = request.getAttribute("wbDeptMapNeedAddMap");
	Map<String,GlAccvouchObj> wbDeptMapNeedAddMap = new HashMap<String,GlAccvouchObj>();
	if(tempObj!=null)
	{
		wbDeptMapNeedAddMap = (HashMap<String,GlAccvouchObj>)tempObj;
	}
	
	tempObj = request.getAttribute("zzDeptTypeMapNeedAddMap");
	Map<String,GlAccvouchObj> zzDeptTypeMapNeedAddMap = new HashMap<String,GlAccvouchObj>();
	if(tempObj!=null)
	{
		zzDeptTypeMapNeedAddMap = (HashMap<String,GlAccvouchObj>)tempObj;
	}
	
	tempObj = request.getAttribute("zzDeptTypeAccSubMapNeedAddMap");
	Map<String,GlAccvouchObj> zzDeptTypeAccSubMapNeedAddMap = new HashMap<String,GlAccvouchObj>();
	if(tempObj!=null)
	{
		zzDeptTypeAccSubMapNeedAddMap = (HashMap<String,GlAccvouchObj>)tempObj;
	}
	
	tempObj = request.getAttribute("zzAccSubReverseMapNeedAddMap");
	Map<String,GlAccvouchObj> zzAccSubReverseMapNeedAddMap = new HashMap<String,GlAccvouchObj>();
	if(tempObj!=null)
	{
		zzAccSubReverseMapNeedAddMap = (HashMap<String,GlAccvouchObj>)tempObj;
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
						&nbsp;&nbsp;<%=wbSourceName%>
						- 凭证导入，发现有以下对照关系需要补充，请补充完善后再重新导入
					</td>
				</tr>
			</table>
			
		<!-- 表格标题 --> 
		<%if(wbDeptMapNeedAddMap.size()>0){ %>
		<table width="700" align="center" class="alert_table"> 
			<tr> 
				<td> 
					<img src="../images/svg/light/orange/32/alert.png" width="18" height="18" align="absmiddle"> 
					&nbsp;&nbsp;<span style="font-size:24px;font-weight:bold"><%=wbDeptMapNeedAddMap.size() %></span>个"外部科室"没有对照到"总账科室"，请<a href="#" onclick=winOpen("<%=contextPath%>/SourceDeptMap/Servlet?method=list4this&list4notOk=true&source_system=<%=wbSource %>")>点击这里</a>补充
				</td> 
			</tr> 
		</table> 
		<%} %>
		
		<%if(zzDeptTypeMapNeedAddMap.size()>0){ %>
		<table width="700" align="center" class="alert_table"> 
			<tr> 
				<td> 
					<img src="../images/svg/light/orange/32/alert.png" width="18" height="18" align="absmiddle"> 
					&nbsp;&nbsp;<span style="font-size:24px;font-weight:bold"><%=zzDeptTypeMapNeedAddMap.size() %></span>个外部科室对应的总账科室"未设置科室类别"，请<a href="#" onclick=winOpen("<%=contextPath%>/Department/Servlet?method=list4this&list4notOk=true&source_system=<%=wbSource %>")>点击这里</a>补充
				</td> 
			</tr> 
		</table> 
		<%} %>
		
		<%if(zzDeptTypeAccSubMapNeedAddMap.size()>0){ %>
		<table width="700" align="center" class="alert_table"> 
			<tr> 
				<td> 
					<img src="../images/svg/light/orange/32/alert.png" width="18" height="18" align="absmiddle"> 
					&nbsp;&nbsp;<span style="font-size:24px;font-weight:bold"><%=zzDeptTypeAccSubMapNeedAddMap.size() %></span>个"外部科目"没有对照到"总账会计科目"，请<a href="#" onclick=winOpen("<%=contextPath%>/SourceDeptAccMap/Servlet?method=list4this&list4notOk=true&source_system=<%=wbSource %>")>点击这里</a>补充
				</td> 
			</tr> 
		</table> 
		<%} %>
		
		<%if(zzAccSubReverseMapNeedAddMap.size()>0){ %>
		<table width="700" align="center" class="alert_table"> 
			<tr> 
				<td> 
					<img src="../images/svg/light/orange/32/alert.png" width="18" height="18" align="absmiddle"> 
					&nbsp;&nbsp;<span style="font-size:24px;font-weight:bold"><%=zzAccSubReverseMapNeedAddMap.size() %></span>个"总账会计科目"未设置"对方会计科目"，请<a href="#" onclick=winOpen("<%=contextPath%>/AccountingSubject/Servlet?method=list4this&list4notOk=true&source_system=<%=wbSource %>")>点击这里</a>补充
				</td> 
			</tr> 
		</table> 
		<%} %>


	</body>
</html>
