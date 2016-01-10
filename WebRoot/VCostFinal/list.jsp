<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.inspur.common.dictionary.util.DictionaryUtil"%> 
<%@page import="com.hz.dict.service.DictionaryService"%> 
<%@page import="com.chengben.obj.VCostFinalObj"%> 
<!-- 基本信息 --> 
<% 
	// 当前上下文路径 
	String contextPath = request.getContextPath(); 
 
	// 该功能对象实例 
	VCostFinalObj domainInstance = (VCostFinalObj) request.getAttribute("domainInstance"); 
	// 该功能路径 
	String basePath = domainInstance.getBasePath(); 
%> 
<html> 
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<title><%=domainInstance.getCnName() %>列表</title> 
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
						<%=domainInstance.getPropertyCnName("date_month") %> 
						<input name="date_month" type="text" id="date_month" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDate_month())%>" size="20" > 
						&nbsp;  
						<%=domainInstance.getPropertyCnName("department_type") %> 
						<input name="department_type" type="text" id="department_type" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDepartment_type())%>" size="20" > 
						&nbsp;  
						<%=domainInstance.getPropertyCnName("department_name") %> 
						<input name="department_name" type="text" id="department_name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDepartment_name())%>" size="20" > 
						&nbsp;  
						<input name="searchButton" type="button" class="button button_search" value="查询" onClick="toPage(1)"> 
					</td> 
					<td align="right"></td> 
				</tr> 
			</table> 
 
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
						<th><%=domainInstance.getPropertyCnName("date_month") %></th> 
						<th><%=domainInstance.getPropertyCnName("department_type") %></th> 
						<th><%=domainInstance.getPropertyCnName("department_code") %></th> 
						<th><%=domainInstance.getPropertyCnName("department_name") %></th> 
						<th><%=domainInstance.getPropertyCnName("renyuan_jingfei") %></th> 
						<th><%=domainInstance.getPropertyCnName("renyuan_jingfei_share") %></th> 
						<th><%=domainInstance.getPropertyCnName("renyuan_jingfei_sum") %></th> 
						<th><%=domainInstance.getPropertyCnName("weisheng_cailiao") %></th> 
						<th><%=domainInstance.getPropertyCnName("weisheng_cailiao_share") %></th> 
						<th><%=domainInstance.getPropertyCnName("weisheng_cailiao_sum") %></th> 
						<th><%=domainInstance.getPropertyCnName("yaopin") %></th> 
						<th><%=domainInstance.getPropertyCnName("yaopin_share") %></th> 
						<th><%=domainInstance.getPropertyCnName("yaopin_sum") %></th> 
						<th><%=domainInstance.getPropertyCnName("guding_zichan_zhejiu") %></th> 
						<th><%=domainInstance.getPropertyCnName("guding_zichan_zhejiu_share") %></th> 
						<th><%=domainInstance.getPropertyCnName("guding_zichan_zhejiu_sum") %></th> 
						<th><%=domainInstance.getPropertyCnName("wuxing_zichan_tanxiao") %></th> 
						<th><%=domainInstance.getPropertyCnName("wuxing_zichan_tanxiao_share") %></th> 
						<th><%=domainInstance.getPropertyCnName("wuxing_zichan_tanxiao_sum") %></th> 
						<th><%=domainInstance.getPropertyCnName("tiqu_yiliao_fengxian_jijin") %></th> 
						<th><%=domainInstance.getPropertyCnName("tiqu_yiliao_fengxian_jijin_share") %></th> 
						<th><%=domainInstance.getPropertyCnName("tiqu_yiliao_fengxian_jijin_sum") %></th> 
						<th><%=domainInstance.getPropertyCnName("qita_feiyong") %></th> 
						<th><%=domainInstance.getPropertyCnName("qita_feiyong_share") %></th> 
						<th><%=domainInstance.getPropertyCnName("qita_feiyong_sum") %></th> 
						<th><%=domainInstance.getPropertyCnName("heji") %></th> 
						<th><%=domainInstance.getPropertyCnName("heji_share") %></th> 
						<th><%=domainInstance.getPropertyCnName("heji_sum") %></th> 
						<th><%=domainInstance.getPropertyCnName("direct_total") %></th> 
						<th><%=domainInstance.getPropertyCnName("share_total") %></th> 
						<th><%=domainInstance.getPropertyCnName("total") %></th> 
						<th><%=domainInstance.getPropertyCnName("renyuan_jingfei_rate") %></th> 
						<th><%=domainInstance.getPropertyCnName("weisheng_cailiao_rate") %></th> 
						<th><%=domainInstance.getPropertyCnName("yaopin_rate") %></th> 
						<th><%=domainInstance.getPropertyCnName("guding_zichan_zhejiu_rate") %></th> 
						<th><%=domainInstance.getPropertyCnName("wuxing_zichan_tanxiao_rate") %></th> 
						<th><%=domainInstance.getPropertyCnName("tiqu_yiliao_fengxian_jijin_rate") %></th> 
						<th><%=domainInstance.getPropertyCnName("qita_feiyong_rate") %></th> 
						<th><%=domainInstance.getPropertyCnName("heji_rate") %></th> 
					</tr> 
				</thead> 
				<% 
					for (int i = 0; i < list.size(); i++) 
						{ 
							VCostFinalObj o = (VCostFinalObj) list.get(i); 
				%> 
				<tr> 
					<td><%=StringUtil.getNotEmptyStr(o.getDate_month())%> 
					<td><%=StringUtil.getNotEmptyStr(o.getDepartment_type())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getDepartment_code())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getDepartment_name())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getRenyuan_jingfei())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getRenyuan_jingfei_share())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getRenyuan_jingfei_sum())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getWeisheng_cailiao())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getWeisheng_cailiao_share())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getWeisheng_cailiao_sum())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getYaopin())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getYaopin_share())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getYaopin_sum())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getGuding_zichan_zhejiu())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getGuding_zichan_zhejiu_share())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getGuding_zichan_zhejiu_sum())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getWuxing_zichan_tanxiao())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getWuxing_zichan_tanxiao_share())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getWuxing_zichan_tanxiao_sum())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getTiqu_yiliao_fengxian_jijin())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getTiqu_yiliao_fengxian_jijin_share())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getTiqu_yiliao_fengxian_jijin_sum())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getQita_feiyong())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getQita_feiyong_share())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getQita_feiyong_sum())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getHeji())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getHeji_share())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getHeji_sum())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getDirect_total())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getShare_total())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getTotal())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getRenyuan_jingfei_rate())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getWeisheng_cailiao_rate())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getYaopin_rate())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getGuding_zichan_zhejiu_rate())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getWuxing_zichan_tanxiao_rate())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getTiqu_yiliao_fengxian_jijin_rate())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getQita_feiyong_rate())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getHeji_rate())%></td> 
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
		</form>  
 
	</body> 
</html> 
