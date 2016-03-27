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
			<!-- 查询条件 --> 
			
			<!-- 查询结果 --> 
			<% 
				PaginationObj pagination = null; 
				List list = new ArrayList(); 
 
				Object paginationObj = request.getAttribute("domainPagination"); 
				if (paginationObj != null) 
				{ 
					pagination = (PaginationObj) paginationObj; 
					list = (List) pagination.getDataList(); 
				} 
				if (paginationObj == null) 
				{ 
					out.print("没有符合条件的数据，请重新设置条件再查询。"); 
				} else 
				{ 
			%> 
			<table class="table table-bordered table-striped" align="center" width="98%"> 
				<thead> 
					<tr> 
						<th><%=domainInstance.getPropertyCnName("id") %></th> 
						<th><%=domainInstance.getPropertyCnName("ccostitemcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("ccostitemname") %></th> 
						<th><%=domainInstance.getPropertyCnName("cparentcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("csource") %></th> 
						<th><%=domainInstance.getPropertyCnName("csubject") %></th> 
						<th><%=domainInstance.getPropertyCnName("cdirect") %></th> 
						<th><%=domainInstance.getPropertyCnName("cchange") %></th> 
						<th><%=domainInstance.getPropertyCnName("ccontrol") %></th> 
						<th><%=domainInstance.getPropertyCnName("ctm") %></th> 
						<th><%=domainInstance.getPropertyCnName("ccostkindcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("cshareparamcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("cend") %></th> 
						<th><%=domainInstance.getPropertyCnName("cstop") %></th> 
						<th>操作</th> 
					</tr> 
				</thead> 
				<% 
					for (int i = 0; i < list.size(); i++) 
						{ 
							EfCostCostitemObj o = (EfCostCostitemObj) list.get(i); 
				%> 
				<tr> 
					<td> 
						<a href="#" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=detail4this&<%=o.findKeyColumnName()%>=<%=o.getKeyValue()%>')"> <%=StringUtil.getNotEmptyStr(o.getKeyValue())%> </a> 
					</td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCcostitemcode())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCcostitemname())%></td> 
					<td><%=new DictionaryService().getDictValueByDictKey("成本项目字典",o.getCparentcode())%></td>  
					<td><%=new DictionaryService().getDictValueByDictKey("来源字典",o.getCsource())%></td>  
					<td><%=new DictionaryService().getDictValueByDictKey("会计科目字典",o.getCsubject())%></td>  
					<td><%=new DictionaryService().getDictValueByDictKey("是否字典",o.getCdirect())%></td>  
					<td><%=new DictionaryService().getDictValueByDictKey("是否字典",o.getCchange())%></td>  
					<td><%=new DictionaryService().getDictValueByDictKey("是否字典",o.getCcontrol())%></td>  
					<td><%=new DictionaryService().getDictValueByDictKey("医疗/药品字典",o.getCtm())%></td>  
					<td><%=new DictionaryService().getDictValueByDictKey("成本分类字典",o.getCcostkindcode())%></td>  
					<td><%=new DictionaryService().getDictValueByDictKey("分摊参数字典",o.getCshareparamcode())%></td>  
					<td><%=new DictionaryService().getDictValueByDictKey("是否字典",o.getCend())%></td>  
					<td><%=new DictionaryService().getDictValueByDictKey("是否字典",o.getCstop())%></td>  
					<td align="left" style="cursor: pointer"> 
						<input type="button" class="button button_modify" title="修改" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=preModify4this&<%=o.findKeyColumnName()%>=<%=o.getKeyValue()%>')" /> 
						&nbsp; 
						<input type="button" class="button button_delete" title="删除" 
							onClick="javascript: 
								$('#pageForm').attr('action','<%=contextPath%>/<%=basePath%>/Servlet?method=delete4this&<%=o.findKeyColumnName()%>_4del=<%=o.getKeyValue()%>'); 
								$('#pageForm').submit(); 
								" /> 
					</td> 
				</tr> 
				<% 
					} 
				%> 
			</table> 
 
			<!-- 翻页操作栏 --> 
			<jsp:include page="../ToolBar/pagination_toolbar.jsp"> 
				<jsp:param name="basePath" value="<%=basePath%>"/> 
			</jsp:include> 
 
			<% 
				} 
			%> 
