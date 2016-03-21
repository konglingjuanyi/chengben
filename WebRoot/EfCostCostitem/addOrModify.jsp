<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.inspur.common.dictionary.util.DictionaryUtil"%> 
<%@page import="com.hz.dict.service.DictionaryService"%> 
<%@page import="com.hz.dict.service.IDictionaryService"%> 
<%@page import="com.cost.obj.EfCostCostitemObj"%> 
<!-- 基本信息 -->  
<% 
	// 上下文路径 
	String contextPath = request.getContextPath(); 
	 
	// 对象实例 
	EfCostCostitemObj domainInstance = new EfCostCostitemObj(); 
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath(); 
 
	// 如果是修改，则获取对象信息 
	Object domainInstanceObj = request.getAttribute("domainInstance"); 
	if (domainInstanceObj != null) 
	{ 
		domainInstance = (EfCostCostitemObj) domainInstanceObj; 
	} 
 
	// 是否是修改 
	boolean isModify = domainInstance.getKeyValue() > 0; 
	// 唯一性检查用的字段 
	String keyCol = "ccostitemcode"; 
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
		if(!checkNull("ccostitemcode","<%=domainInstance.getPropertyCnName("ccostitemcode")%>")) return false; 
		if(!checkNull("ccostitemname","<%=domainInstance.getPropertyCnName("ccostitemname")%>")) return false; 
		if(!checkNull("csource","<%=domainInstance.getPropertyCnName("csource")%>")) return false; 
		if(!checkNull("csubject","<%=domainInstance.getPropertyCnName("csubject")%>")) return false; 
		if(!checkNull("cdirect","<%=domainInstance.getPropertyCnName("cdirect")%>")) return false; 
		if(!checkNull("cchange","<%=domainInstance.getPropertyCnName("cchange")%>")) return false; 
		if(!checkNull("ccontrol","<%=domainInstance.getPropertyCnName("ccontrol")%>")) return false; 
		if(!checkNull("ccostkindcode","<%=domainInstance.getPropertyCnName("ccostkindcode")%>")) return false; 
		if(!checkNull("cend","<%=domainInstance.getPropertyCnName("cend")%>")) return false; 
		if(!checkNull("cstop","<%=domainInstance.getPropertyCnName("cstop")%>")) return false; 
					 
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
						<%=domainInstance.getPropertyCnName("ccostitemcode") %>: 
					</td> 
					<td> 
						<input name="ccostitemcode" type="text" id="ccostitemcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcostitemcode(),"")%>" size="20"  <%=isModify?"readOnly":""%>> 
						<font color="red">*</font> 
						<font color="red"><%=isModify?"(不可修改)":"(不能重复)"%></font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ccostitemname") %>: 
					</td> 
					<td> 
						<input name="ccostitemname" type="text" id="ccostitemname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcostitemname(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cparentcode") %>: 
					</td> 
					<td> 
						<%=DictionaryUtil.getSelectHtml(new DictionaryService().getDictItemsByDictName("成本项目字典", false), "cparentcode", "", StringUtil.getNotEmptyStr(domainInstance.getCparentcode(), ""), "notEmpty")%> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("csource") %>: 
					</td> 
					<td> 
						<%=DictionaryUtil.getSelectHtml(new DictionaryService().getDictItemsByDictName("来源字典", false), "csource", "", StringUtil.getNotEmptyStr(domainInstance.getCsource(), ""), "notEmpty")%> 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("csubject") %>: 
					</td> 
					<td> 
						<%=DictionaryUtil.getSelectHtml(new DictionaryService().getDictItemsByDictName("会计科目字典", false), "csubject", "", StringUtil.getNotEmptyStr(domainInstance.getCsubject(), ""), "notEmpty")%> 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdirect") %>: 
					</td> 
					<td> 
						<%=DictionaryUtil.getSelectHtml(new DictionaryService().getDictItemsByDictName("是否字典", false), "cdirect", "", StringUtil.getNotEmptyStr(domainInstance.getCdirect(), ""), "notEmpty")%> 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cchange") %>: 
					</td> 
					<td> 
						<%=DictionaryUtil.getSelectHtml(new DictionaryService().getDictItemsByDictName("是否字典", false), "cchange", "", StringUtil.getNotEmptyStr(domainInstance.getCchange(), ""), "notEmpty")%> 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ccontrol") %>: 
					</td> 
					<td> 
						<%=DictionaryUtil.getSelectHtml(new DictionaryService().getDictItemsByDictName("是否字典", false), "ccontrol", "", StringUtil.getNotEmptyStr(domainInstance.getCcontrol(), ""), "notEmpty")%> 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ctm") %>: 
					</td> 
					<td> 
						<%=DictionaryUtil.getSelectHtml(new DictionaryService().getDictItemsByDictName("医疗/药品字典", false), "ctm", "", StringUtil.getNotEmptyStr(domainInstance.getCtm(), ""), "notEmpty")%> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ccostkindcode") %>: 
					</td> 
					<td> 
						<%=DictionaryUtil.getSelectHtml(new DictionaryService().getDictItemsByDictName("成本分类字典", false), "ccostkindcode", "", StringUtil.getNotEmptyStr(domainInstance.getCcostkindcode(), ""), "notEmpty")%> 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cshareparamcode") %>: 
					</td> 
					<td> 
						<%=DictionaryUtil.getSelectHtml(new DictionaryService().getDictItemsByDictName("分摊参数字典", false), "cshareparamcode", "", StringUtil.getNotEmptyStr(domainInstance.getCshareparamcode(), ""), "notEmpty")%> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cend") %>: 
					</td> 
					<td> 
						<%=DictionaryUtil.getSelectHtml(new DictionaryService().getDictItemsByDictName("是否字典", false), "cend", "", StringUtil.getNotEmptyStr(domainInstance.getCend(), ""), "notEmpty")%> 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cstop") %>: 
					</td> 
					<td> 
						<%=DictionaryUtil.getSelectHtml(new DictionaryService().getDictItemsByDictName("是否字典", false), "cstop", "", StringUtil.getNotEmptyStr(domainInstance.getCstop(), "0"), "notEmpty")%> 
						<font color="red">*</font> 
					</td> 
				</tr> 
			</table> 
			 
			<!-- 工具栏 --> 
			<jsp:include page="../ToolBar/addOrModify_toolbar.jsp" /> 
		</form> 
	</body> 
</html> 
