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
<%@page import="com.chengben.obj.VCostFinalSumbyCosttypeObj"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.inspur.common.dictionary.pojo.DictItem"%>
<!-- 基本信息 -->
<%
	// 当前上下文路径 
	String contextPath = request.getContextPath();

	// 该功能对象实例 
	VCostFinalObj domainInstance = (VCostFinalObj) request.getAttribute("domainInstance");
	// 该功能路径 
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
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title><%=domainInstance.getCnName()%>列表</title>
		<link href="../css/global.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script>
		<script type="text/javascript" src="../js/utils.js"></script>
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="../js/css-1.7.0.min.js"></script>
	</head>
	<body>
		<form name="pageForm" id="pageForm" method="post" action="<%=request.getContextPath()%>/<%=basePath%>/Servlet?method=report&reportId=1-3">

			<!-- 查询条件 -->
			<table class="search_table" align="center" width="98%">
				<tr>
					<td>
					月份
					<%=DictionaryUtil.getSelectHtml(date_month_list, "date_month", "", StringUtil.getNotEmptyStr(request.getAttribute("date_month"), ""), "notEmpty")%> 
					&nbsp;
					<input name="searchButton" type="submit" class="button button_search" value="查询">
					</td>
				</tr>
			</table>

			<!-- 查询结果 -->
			<%
				VCostFinalSumbyCosttypeObj sum = (VCostFinalSumbyCosttypeObj)request.getAttribute("vCostFinalSumbyCosttypeObj");
				
				PaginationObj pagination = null;
				List list = new ArrayList();

				Object paginationObj = request.getAttribute("domainPagination");
				if (paginationObj != null)
				{
					pagination = (PaginationObj) paginationObj;
					list = (List) pagination.getDataList();
				}
				if (paginationObj == null||sum.getRenyuan_jingfei_sum() == null)
				{
					out.print("没有符合条件的数据，请重新设置条件再查询。");
				} else
				{
			%>
			<div id="printDiv">
			<!-- 
			<table class="title_table" align="center" width="98%">
			<tr><td style="text-align:center">医院临床服务类科室全成本构成分析表<br/><%=domainInstance.getDate_month() %></td></tr>
			</table>
			-->
			<table class="table report_table table-bordered table-striped" align="center" width="98%">
			<thead>
				<tr>
					<th colspan="<%=list.size()*2+3 %>" style="text-align:center">医院临床服务类科室全成本构成分析表<br/><font color="#ff9900"><%=domainInstance.getDate_month() %></font>
					</th>
				</tr>
              <tr>
                <th>项目</th>
                <%
				for (int i = 0; i < list.size(); i++)
				{
						VCostFinalObj o = (VCostFinalObj) list.get(i);
				%>
                <th colspan="2"><%=StringUtil.getNotEmptyStr(o.getDepartment_name()) %></th>
                <%} %>
                <th colspan="2">各临床服务类科室合计</th>
              </tr>
              <tr>
                <th>&nbsp;</th>
                 <%
				for (int i = 0; i < list.size(); i++)
				{
				%>
                <th>金额</th>
                <th>%</th>
                <%} %>
                <th>金额</th>
                <th>%</th>
              </tr>
			 </thead>
              <tr>
                <td style="word-break:keep-all">人员经费</td>
                <%
				for (int i = 0; i < list.size(); i++)
				{
						VCostFinalObj o = (VCostFinalObj) list.get(i);
				%>
                <td><%=StringUtil.formatDouble(o.getRenyuan_jingfei_sum(),2) %></td>
                <td><%=StringUtil.formatDouble(o.getRenyuan_jingfei_sum_rate(),2) %></td>
                <%} %>
                <td><%=StringUtil.formatDouble(sum.getRenyuan_jingfei_sum(),2) %></td>
                <td><%=StringUtil.formatDouble(sum.getRenyuan_jingfei_sum_rate(),2) %></td>
              </tr>
              <tr>
                <td style="word-break:keep-all">卫生材料费</td>
                <%
				for (int i = 0; i < list.size(); i++)
				{
						VCostFinalObj o = (VCostFinalObj) list.get(i);
				%>
                <td><%=StringUtil.formatDouble(o.getWeisheng_cailiao_sum(),2) %></td>
                <td><%=StringUtil.formatDouble(o.getWeisheng_cailiao_sum_rate(),2) %></td>
                <%} %>
                <td><%=StringUtil.formatDouble(sum.getWeisheng_cailiao_sum(),2) %></td>
                <td><%=StringUtil.formatDouble(sum.getWeisheng_cailiao_sum_rate(),2) %></td>
              </tr>
              <tr>
                <td style="word-break:keep-all">药品费</td>
                <%
				for (int i = 0; i < list.size(); i++)
				{
						VCostFinalObj o = (VCostFinalObj) list.get(i);
				%>
                <td><%=StringUtil.formatDouble(o.getYaopin_sum(),2) %></td>
                <td><%=StringUtil.formatDouble(o.getYaopin_sum_rate(),2) %></td>
                <%} %>
                <td><%=StringUtil.formatDouble(sum.getYaopin_sum(),2) %></td>
                <td><%=StringUtil.formatDouble(sum.getYaopin_sum_rate(),2) %></td>
              </tr>
              <tr>
                <td style="word-break:keep-all">固定资产折旧费</td>
                <%
				for (int i = 0; i < list.size(); i++)
				{
						VCostFinalObj o = (VCostFinalObj) list.get(i);
				%>
                <td><%=StringUtil.formatDouble(o.getGuding_zichan_zhejiu_sum(),2) %></td>
                <td><%=StringUtil.formatDouble(o.getGuding_zichan_zhejiu_sum_rate(),2) %></td>
                <%} %>
                <td><%=StringUtil.formatDouble(sum.getGuding_zichan_zhejiu_sum(),2) %></td>
                <td><%=StringUtil.formatDouble(sum.getGuding_zichan_zhejiu_sum_rate(),2) %></td>
              </tr>
              <tr>
                <td style="word-break:keep-all">无形资产摊销</td>
                <%
				for (int i = 0; i < list.size(); i++)
				{
						VCostFinalObj o = (VCostFinalObj) list.get(i);
				%>
                <td><%=StringUtil.formatDouble(o.getWuxing_zichan_tanxiao_sum(),2) %></td>
                <td><%=StringUtil.formatDouble(o.getWuxing_zichan_tanxiao_sum_rate(),2) %></td>
                <%} %>
                <td><%=StringUtil.formatDouble(sum.getWuxing_zichan_tanxiao_sum(),2)%></td>
                <td><%=StringUtil.formatDouble(sum.getWuxing_zichan_tanxiao_sum_rate(),2) %></td>
              </tr>
              <tr>
                <td style="word-break:keep-all">提取医疗风险基金</td>
                <%
				for (int i = 0; i < list.size(); i++)
				{
						VCostFinalObj o = (VCostFinalObj) list.get(i);
				%>
                <td><%=StringUtil.formatDouble(o.getTiqu_yiliao_fengxian_jijin_sum(),2) %></td>
                <td><%=StringUtil.formatDouble(o.getTiqu_yiliao_fengxian_jijin_sum_rate(),2) %></td>
                <%} %>
                <td><%=StringUtil.formatDouble(sum.getTiqu_yiliao_fengxian_jijin_sum(),2) %></td>
                <td><%=StringUtil.formatDouble(sum.getTiqu_yiliao_fengxian_jijin_sum_rate(),2) %></td>
              </tr>
              <tr>
                <td style="word-break:keep-all">其他费用</td>
                <%
				for (int i = 0; i < list.size(); i++)
				{
						VCostFinalObj o = (VCostFinalObj) list.get(i);
				%>
                <td><%=StringUtil.formatDouble(o.getQita_feiyong_sum(),2) %></td>
                <td><%=StringUtil.formatDouble(o.getQita_feiyong_sum_rate(),2) %></td>
                <%} %>
                <td><%=StringUtil.formatDouble(sum.getQita_feiyong_sum(),2) %></td>
                <td><%=StringUtil.formatDouble(sum.getQita_feiyong_sum_rate(),2) %></td>
              </tr>
              <tr style="color:blue">
                <td style="word-break:keep-all">科室全成本合计</td>
                <%
				for (int i = 0; i < list.size(); i++)
				{
						VCostFinalObj o = (VCostFinalObj) list.get(i);
				%>
                <td><%=StringUtil.formatDouble(o.getTotal(),2) %></td>
                <td><%=StringUtil.formatDouble(o.getTotal_rate(),2) %></td>
                <%} %>
                <td><%=StringUtil.formatDouble(sum.getTotal(),2) %></td>
                <td><%=StringUtil.formatDouble(sum.getTotal_rate(),2) %></td>
              </tr>
              <tr>
                <td style="word-break:keep-all">科室收入</td>
                <%
				for (int i = 0; i < list.size(); i++)
				{
						VCostFinalObj o = (VCostFinalObj) list.get(i);
				%>
                <td><%=StringUtil.formatDouble(o.getIncome(),2) %></td>
                <td>&nbsp;</td>
                <%} %>
                <td><%=StringUtil.formatDouble(sum.getIncome_sum(),2) %></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td style="word-break:keep-all">收入-成本</td>
                <%
				for (int i = 0; i < list.size(); i++)
				{
						VCostFinalObj o = (VCostFinalObj) list.get(i);
				%>
                <td><%=StringUtil.formatDouble(o.getIncome()-o.getTotal(),2) %></td>
                <td>&nbsp;</td>
                <%} %>
                <td><%=StringUtil.formatDouble(sum.getIncome_sum()-sum.getTotal(),2) %></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td style="word-break:keep-all">床日成本</td>
                <%
				for (int i = 0; i < list.size(); i++)
				{
						VCostFinalObj o = (VCostFinalObj) list.get(i);
				%>
                <td><%=StringUtil.formatDouble(o.getCost_per_bed(),2) %></td>
                <td>&nbsp;</td>
                <%} %>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td style="word-break:keep-all">诊次成本</td>
                <%
				for (int i = 0; i < list.size(); i++)
				{
						VCostFinalObj o = (VCostFinalObj) list.get(i);
				%>
                <td><%=StringUtil.formatDouble(o.getCost_per_treat(),2) %></td>
                <td>&nbsp;</td>
                <%} %>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table>
            </div>
            
			<!-- 工具栏 -->
			<!-- 工具栏 -->
			<jsp:include page="report_toolbar.jsp">
			<jsp:param name="basePath" value="<%=basePath %>"/>
			</jsp:include>
			<%
				}
			%>
		</form>

	</body>
</html>
