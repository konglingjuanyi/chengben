<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.hz.dict.service.DictionaryService"%> 
<%@page import="com.cost.obj.EfCostCostitemObj"%> 
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
					<%=domainInstance.getPropertyCnName("id") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getId())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccostitemcode") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcostitemcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccostitemname") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCcostitemname())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cparentcode") %>: 
				</td> 
				<td><%=new DictionaryService().getDictValueByDictKey("成本项目字典",domainInstance.getCparentcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("csource") %>: 
				</td> 
				<td><%=new DictionaryService().getDictValueByDictKey("来源字典",domainInstance.getCsource())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("csubject") %>: 
				</td> 
				<td><%=new DictionaryService().getDictValueByDictKey("会计科目字典",domainInstance.getCsubject())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdirect") %>: 
				</td> 
				<td><%=new DictionaryService().getDictValueByDictKey("是否字典",domainInstance.getCdirect())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cchange") %>: 
				</td> 
				<td><%=new DictionaryService().getDictValueByDictKey("是否字典",domainInstance.getCchange())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccontrol") %>: 
				</td> 
				<td><%=new DictionaryService().getDictValueByDictKey("是否字典",domainInstance.getCcontrol())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ctm") %>: 
				</td> 
				<td><%=new DictionaryService().getDictValueByDictKey("医疗/药品字典",domainInstance.getCtm())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ccostkindcode") %>: 
				</td> 
				<td><%=new DictionaryService().getDictValueByDictKey("成本分类字典",domainInstance.getCcostkindcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cshareparamcode") %>: 
				</td> 
				<td><%=new DictionaryService().getDictValueByDictKey("分摊参数字典",domainInstance.getCshareparamcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cend") %>: 
				</td> 
				<td><%=new DictionaryService().getDictValueByDictKey("是否字典",domainInstance.getCend())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cstop") %>: 
				</td> 
				<td><%=new DictionaryService().getDictValueByDictKey("是否字典",domainInstance.getCstop())%></td> 
			</tr> 
		</table> 
		 
		<!-- 工具栏 --> 
		<jsp:include page="../ToolBar/detail_toolbar.jsp"/> 
	</body> 
</html> 
