<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.inspur.common.dictionary.util.DictionaryUtil"%> 
<%@page import="com.hz.dict.service.DictionaryService"%> 
<%@page import="com.hz.dict.service.IDictionaryService"%> 
<%@page import="com.cost.obj.EfCostChargeitemObj"%> 
<!-- 基本信息 -->  
<% 
	// 上下文路径 
	String contextPath = request.getContextPath(); 
	 
	// 对象实例 
	EfCostChargeitemObj domainInstance = new EfCostChargeitemObj(); 
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath(); 
 
	// 如果是修改，则获取对象信息 
	Object domainInstanceObj = request.getAttribute("domainInstance"); 
	if (domainInstanceObj != null) 
	{ 
		domainInstance = (EfCostChargeitemObj) domainInstanceObj; 
	} 
 
	// 是否是修改 
	boolean isModify = domainInstance.getKeyValue() > 0; 
	// 唯一性检查用的字段 
	String keyCol = "cchargeitemcode"; 
%> 
<html> 
	<head> 
		<base target="_self" /> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />		<title><%=isModify ? "修改" + domainInstance.getCnName() : "增加" + domainInstance.getCnName()%></title> 
		<link href="../css/global.css" rel="stylesheet" type="text/css"> 
		<link href="../css/table.css" rel="stylesheet" type="text/css"> 
		<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script> 
		<script type="text/javascript" src="../js/utils.js"></script> 
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script> 
		<script> 
		//  新增或修改 
		function addOrModify() 
		{	 
				// 做必要的检查 
		if(!checkNull("id","<%=domainInstance.getPropertyCnName("id")%>")) return false; 
		if(!checkNull("cchargeitemcode","<%=domainInstance.getPropertyCnName("cchargeitemcode")%>")) return false; 
		if(!checkNull("cchargeitemname","<%=domainInstance.getPropertyCnName("cchargeitemname")%>")) return false; 
		if(!checkNull("cchargekindcode","<%=domainInstance.getPropertyCnName("cchargekindcode")%>")) return false; 
					 
			// 修改 
			if("true"=="<%=isModify%>") 
			{ 
				submit(); 
			} 
			// 新增 
			else 
			{ 
					// 新增时检查唯一性 
					$.post( 
					encodeURI("Servlet?method=checkId4this&isFromUrl=true&id=0&<%=keyCol%>="+$("#<%=keyCol%>").val()),  
					{Action:"post"},  
					function (data, textStatus){ 
						this; 
						if(data=="true")  
						{ 
							alert("该<%=domainInstance.getPropertyCnName(keyCol)%>已录入系统");  
							return false; 
						} 
						else 
						{ 
							submit(); 
						} 
					}); 
				}; 
		} 
		 
		// 提交保存或修改 
		function submit() 
		{ 
					$("#addOrModifyForm").submit(); 
		} 
		</script> 
	</head> 
	<body> 
		<form name="addOrModifyForm" id="addOrModifyForm" action="<%=contextPath%>/<%=basePath%>/Servlet?method=addOrModify4this" method="post"> 
			<!-- 表格标题 --> 
			<table width="700" align="center" class="title_table"> 
				<tr> 
					<td> 
						<img src="../images/svg/heavy/green/list.png" width="18" height="18" align="absmiddle"> 
						&nbsp;&nbsp;<%=isModify ? "修改" : "增加"%><%=domainInstance.getCnName()%> 
					</td> 
				</tr> 
			</table> 
 
			<!-- 详细信息 --> 
			<table width="700" align="center" class="detail_table detail_table-bordered detail_table-striped"> 
				<input type="hidden" id="<%=domainInstance.findKeyColumnName()%>" name="<%=domainInstance.findKeyColumnName()%>" value="<%=domainInstance.getKeyValue()%>"> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cchargeitemcode") %>: 
					</td> 
					<td> 
						<input name="cchargeitemcode" type="text" id="cchargeitemcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCchargeitemcode(),"")%>" size="20"  <%=isModify?"readOnly":""%>> 
						<font color="red">*</font> 
						<font color="red"><%=isModify?"(不可修改)":"(不能重复)"%></font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cchargeitemname") %>: 
					</td> 
					<td> 
						<input name="cchargeitemname" type="text" id="cchargeitemname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCchargeitemname(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cchargekindcode") %>: 
					</td> 
					<td> 
						<%=DictionaryUtil.getSelectHtml(new DictionaryService().getDictItemsByDictName("收费类别字典", false), "cchargekindcode", "", StringUtil.getNotEmptyStr(domainInstance.getCchargekindcode(), ""), "notEmpty")%> 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("coutitemcode") %>: 
					</td> 
					<td> 
						<input name="coutitemcode" type="text" id="coutitemcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCoutitemcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cinitemcode") %>: 
					</td> 
					<td> 
						<input name="cinitemcode" type="text" id="cinitemcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCinitemcode(),"")%>" size="20"  > 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cstop") %>: 
					</td> 
					<td> 
						<%=DictionaryUtil.getSelectHtml(new DictionaryService().getDictItemsByDictName("是否字典", false), "cstop", "", StringUtil.getNotEmptyStr(domainInstance.getCstop(), "0"), "notEmpty")%> 
					</td> 
				</tr> 
			</table> 
			 
			<!-- 工具栏 --> 
			<jsp:include page="../ToolBar/addOrModify_toolbar.jsp" /> 
		</form> 
	</body> 
</html> 
