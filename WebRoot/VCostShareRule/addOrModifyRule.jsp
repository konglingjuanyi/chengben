<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<!-- 引入类 -->
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.wuyg.common.util.StringUtil"%>
<%@page import="com.inspur.common.dictionary.util.DictionaryUtil"%>
<%@page import="com.hz.dict.service.DictionaryService"%>
<%@page import="com.hz.dict.service.IDictionaryService"%>
<%@page import="com.chengben.obj.VCostShareRuleObj"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.inspur.common.dictionary.pojo.DictItem"%>
<!-- 基本信息 -->
<%
	// 上下文路径 
	String contextPath = request.getContextPath();

	// 对象实例 
	VCostShareRuleObj domainInstance = new VCostShareRuleObj();
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath();

	// 如果是修改，则获取对象信息 
	List<VCostShareRuleObj> ruleList = new ArrayList<VCostShareRuleObj>();
	Object ruleListObj = request.getAttribute("ruleList");
	if (ruleListObj != null)
	{
		ruleList = (List<VCostShareRuleObj>) ruleListObj;
	}

	// 是否是修改 
	boolean isModify = ruleList.size() > 0;
	
	// 所有类别
	String[] departmetTypes = new String[]{"辅助类","医技类","临床类"};
	
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
		<base target="_self" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title><%=isModify ? "修改" + domainInstance.getCnName() : "增加" + domainInstance.getCnName()%></title>
		<link href="../css/global.css" rel="stylesheet" type="text/css">
		<link href="../css/table.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script>
		<script type="text/javascript" src="../js/utils.js"></script>
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="../js/css-1.7.0.min.js"></script>
		<script> 
		//  新增或修改 
		function addOrModify() 
		{	 
			// 做必要的检查
			<%
			for(int i=1; i<=3; i++)
			{
			%> 			

				if(Number($("#level<%=i%>_total").text())!=100)
				{
					alert("<%=i%>级分摊合计不等于100%，不能保存。");
					return false;
				} 

				
			<%}%>
					
			$("#addOrModifyForm").submit(); 
		} 
		</script>
	</head>
	<body>
		<form name="addOrModifyForm" id="addOrModifyForm" action="<%=contextPath%>/<%=basePath%>/Servlet?method=addOrModify4this" method="post">
			<!-- 表格标题 -->
			<table width="800" align="center" class="title_table">
				<tr>
					<td>
						<img src="../images/svg/heavy/green/list.png" width="18" height="18" align="absmiddle">
						&nbsp;&nbsp;<%=isModify ? "修改" : "增加"%><%=domainInstance.getCnName()%>
					</td>
				</tr>
			</table>
			<!-- 查询条件 -->
			<table class="search_table" align="center" width="800">
				<tr>
					<td>
					月份：
					<%=DictionaryUtil.getSelectHtml(date_month_list, "date_month", "", StringUtil.getNotEmptyStr(request.getAttribute("date_month"), ""), "notEmpty")%> 
					</td>
				</tr>
			</table>
			<!-- 详细信息 -->
			<table class="table table-bordered" align="center" width="800">
				<thead>
					<tr>
						<th><%=domainInstance.getPropertyCnName("department_type")%></th>
						<th><%=domainInstance.getPropertyCnName("department_code")%></th>
						<th><%=domainInstance.getPropertyCnName("department_name")%></th>
						<th><%=domainInstance.getPropertyCnName("share_rate_level_1")%></th>
						<th><%=domainInstance.getPropertyCnName("share_rate_level_2")%></th>
						<th><%=domainInstance.getPropertyCnName("share_rate_level_3")%></th>
						<th><%=domainInstance.getPropertyCnName("income")%></th>
						<th><%=domainInstance.getPropertyCnName("cost_per_bed")%></th>
						<th><%=domainInstance.getPropertyCnName("cost_per_treat")%></th>
					</tr>
				</thead>
				<%
					double level1SubTotal = 0, level2SubTotal = 0, level3SubTotal = 0;
					double level1Total = 0, level2Total = 0, level3Total = 0;

					for (int i = 0; i < ruleList.size(); i++)
					{
						VCostShareRuleObj o = (VCostShareRuleObj) ruleList.get(i);

						level1SubTotal += o.getShare_rate_level_1();
						level2SubTotal += o.getShare_rate_level_2();
						level3SubTotal += o.getShare_rate_level_3();

						level1Total += o.getShare_rate_level_1();
						level2Total += o.getShare_rate_level_2();
						level3Total += o.getShare_rate_level_3();

						// 是否最后一行
						boolean last = (i == ruleList.size() - 1);

						// 部门类型改变
						VCostShareRuleObj nextO = null;
						if (!last)
						{
							nextO = ruleList.get(i + 1);
						}
						boolean change = last || (nextO != null && !nextO.getDepartment_type().equals(o.getDepartment_type()));
				%>
				<tr>
					<td><%=StringUtil.getNotEmptyStr(o.getDepartment_type())%><input type="hidden" name="department_type" value="<%=o.getDepartment_type()%>">
					</td>
					<td><%=StringUtil.getNotEmptyStr(o.getDepartment_code())%><input type="hidden" name="department_code" value="<%=o.getDepartment_code()%>">
					</td>
					<td><%=StringUtil.getNotEmptyStr(o.getDepartment_name())%><input type="hidden" name="department_name" value="<%=o.getDepartment_name()%>">
					</td>
					<td style="text-align: right">
						<input class="<%=o.getDepartment_type() + "_level1"%>" name="share_rate_level1" type="text" size="6" style="text-align: right; padding: 6px 0px" value="<%=StringUtil.getNotEmptyStr(o.getShare_rate_level_1())%>" />
					</td>
					<td style="text-align: right">
						<input class="<%=o.getDepartment_type() + "_level2"%>" name="share_rate_level2" type="<%=o.isLevel2()?"text":"hidden"%>" size="6" style="text-align: right; padding: 6px 0px" value="<%=StringUtil.getNotEmptyStr(o.getShare_rate_level_2())%>">
					</td>
					<td style="text-align: right">
						<input class="<%=o.getDepartment_type() + "_level3"%>" name="share_rate_level3" type="<%=o.isLevel3()?"text":"hidden"%>" size="6" style="text-align: right; padding: 6px 0px" value="<%=StringUtil.getNotEmptyStr(o.getShare_rate_level_3())%>">
					</td>
					<td style="text-align: right">
						<input name="income" type="<%=o.isLevel3()?"text":"hidden"%>" size="6" style="text-align: right; padding: 6px 0px" value="<%=StringUtil.getNotEmptyStr(o.getIncome())%>">
					</td>
					<td style="text-align: right">
						<input name="cost_per_bed" type="<%=o.isLevel3()?"text":"hidden"%>" size="6" style="text-align: right; padding: 6px 0px" value="<%=StringUtil.getNotEmptyStr(o.getCost_per_bed())%>">
					</td>
					<td style="text-align: right">
						<input name="cost_per_treat" type="<%=o.isLevel3()?"text":"hidden"%>" size="6" style="text-align: right; padding: 6px 0px" value="<%=StringUtil.getNotEmptyStr(o.getCost_per_treat())%>">
					</td>
				</tr>
				<%
					if (change)
						{
				%>
				<tr style="color: blue; text-align: right">
					<td colspan="3"><%=o.getDepartment_type()%>小计:
					</td>
					<td id="<%=o.getDepartment_type() + "_level1_subtotal"%>"><%=level1SubTotal%></td>
					<td id="<%=o.getDepartment_type() + "_level2_subtotal"%>">
						<%
							if (o.isLevel2())
									{
						%><%=level2SubTotal%>
						<%
							}
						%>
					</td>
					<td id="<%=o.getDepartment_type() + "_level3_subtotal"%>">
						<%
							if (o.isLevel3())
									{
						%><%=level3SubTotal%>
						<%
							}
						%>
					</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<%
					level1SubTotal = 0;
							level2SubTotal = 0;
							level3SubTotal = 0;
						}
				%>
				<%
					}
				%>
				<tr style="color: green; text-align: right">
					<td colspan="3">
						合计:
					</td>
					<td id="level1_total"><%=level1Total%></td>
					<td id="level2_total"><%=level2Total%></td>
					<td id="level3_total"><%=level3Total%></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>

			<!-- 工具栏 -->
			<table align="center" width="100%" class="toolbar_table">
				<tr>
					<td>
					<input name="saveButton" type="button" class="button button_save" value="保存" title="保存" onClick="addOrModify()">
					</td>
				</tr>
			</table>

		</form>
		<script type="text/javascript">
		var sum = 0;
		<%
			for(int n=1; n<=3 ; n++)
			{
				for(int i=0; i<departmetTypes.length ; i++)
				{
					String departmentType = departmetTypes[i];
		%>
			// 一级分摊小计合计
			$(".<%=departmentType%>_level<%=n%>").change(function(){
					$(".<%=departmentType%>_level<%=n%>").each(function(){
						sum = Number(sum) + Number($(this).val());
						});
					//更新小计
					$("#<%=departmentType%>_level<%=n%>_subtotal").text(sum);
					sum = 0;
					
					//更新合计
					<%
						for(int j=0; j<departmetTypes.length ; j++)
						{
							departmentType = departmetTypes[j];
					%>
					sum +=  Number($("#<%=departmentType%>_level<%=n%>_subtotal").text());
					<%}%>
					if(sum>100)
					{
						alert("<%=n%>级分摊合计超过100了")
						$("#level<%=n%>_total").css("color","red");
					}
					else
					{
						$("#level<%=n%>_total").css("color","green");
					}
					$("#level<%=n%>_total").text(sum);
					sum = 0;
			});
			
		<%
			}
		}
		%>
		
		
		// 绑定enter事件
			$('body').keydown(function(){
			   if(event.keyCode == 13)
			   {
				 event.keyCode = 9;
			   }
			});
			
		// 保存成功提示
		if("true"=="<%=request.getAttribute("needRefresh")%>")
		{
			alert("保存成功");
		}
		
		// 重新查询
		$("#date_month").change(function(){
			$("#addOrModifyForm").attr("action","<%=contextPath%>/<%=basePath%>/Servlet?method=preModify4this");
			$("#addOrModifyForm").submit();
		});
		</script>
	</body>
</html>
