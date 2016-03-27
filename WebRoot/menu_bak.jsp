<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<%@page import="com.hz.auth.obj.AuthUser"%>
<%@page import="com.hz.util.SystemConstant"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.wuyg.common.util.TimeUtil"%>
<%@page import="com.wuyg.common.util.StringUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>系统菜单</title>
	</head>
	<link href="css/global.css" rel="stylesheet" type="text/css" />
	<script src="js/jquery-2.0.3.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/css-1.7.0.min.js"></script>
	<script>
function openInMainFrame(td,url)
{	
	$(".menu_selected").attr("class","menu_not_selected");
	$(td).attr("class","menu_selected");
	parent.mainFrame.location = url;
}

function toggleMenuGroup(td,menuGroupId)
{
	$("#menu_group_" + menuGroupId).toggle();
	if($(td).attr("class")=="menu_header_not_expand")
	{
		$(td).attr("class","menu_header_expand");
	}
	else
	{
		$(td).attr("class","menu_header_not_expand");
	}
}
</script>
	<%
		String contextPath = request.getContextPath();

		// 用户信息
		AuthUser user = (AuthUser) request.getSession().getAttribute(SystemConstant.AUTH_USER_INFO);

		boolean isAdmin = SystemConstant.ROLE_ADMIN.equals(user.getRoleLevel());
	%>
	<body class="menu_bg">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td class="menu_header_expand"
					onclick="toggleMenuGroup(this,'01')">
					成本分摊管理
				</td>
			</tr>
			<tr>
				<td>

					<table id="menu_group_01" width="100%" cellpadding="0"
						cellspacing="0" border="0">
						<tr>
							<td class="menu_selected"
								onclick="openInMainFrame(this,'<%=request.getContextPath()%>/VCostShareRule/Servlet?method=preModify4this&date_month=<%=TimeUtil.nowTime2str("yyyy-MM") %>')">
								<img src="images/svg/heavy/green/list.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;成本分摊规则管理
							</td>
						</tr>
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'<%=request.getContextPath()%>/VCostFinal/Servlet?method=report&reportId=1-2&date_month=<%=TimeUtil.nowTime2str("yyyy-MM") %>')">
								<img src="images/svg/heavy/green/stats.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;临床科室全成本报表
							</td>
						</tr>
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'<%=request.getContextPath()%>/VCostFinal/Servlet?method=report&reportId=1-3&date_month=<%=TimeUtil.nowTime2str("yyyy-MM") %>')">
								<img src="images/svg/heavy/green/pie_chart.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;临床科室全成本构成分析表
							</td>
						</tr>
					</table>

				</td>
			</tr>
			
			<tr>
				<td class="menu_header_expand"
					onclick="toggleMenuGroup(this,'02')">
					人员管理
				</td>
			</tr>
			<tr>
				<td>

					<table id="menu_group_02" width="100%" cellpadding="0"
						cellspacing="0" border="0">
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'<%=request.getContextPath()%>/HrHiPerson/Servlet?method=list4this')">
								<img src="images/svg/heavy/green/user.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;人员查询
							</td>
						</tr>
					</table>

				</td>
			</tr>
			
			<tr>
				<td class="menu_header_expand"
					onclick="toggleMenuGroup(this,'03')">
					基础档案管理
				</td>
			</tr>
			<tr>
				<td>

					<table id="menu_group_03" width="100%" cellpadding="0"
						cellspacing="0" border="0">
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'<%=request.getContextPath()%>/EfCostSharelevel/Servlet?method=list4this')">
								<img src="images/svg/heavy/green/list.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;成本分摊级别
							</td>
						</tr>
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'<%=request.getContextPath()%>/EfCostSharekind/Servlet?method=list4this')">
								<img src="images/svg/heavy/green/list.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;成本分摊类别
							</td>
						</tr>
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'<%=request.getContextPath()%>/EfCostDeptkind/Servlet?method=list4this')">
								<img src="images/svg/heavy/green/list.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;科室类别
							</td>
						</tr>
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'<%=request.getContextPath()%>/EfCostDept/Servlet?method=list4this')">
								<img src="images/svg/heavy/green/list.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;核算科室
							</td>
						</tr>
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'<%=request.getContextPath()%>/EfCostChargekind/Servlet?method=list4this')">
								<img src="images/svg/heavy/green/list.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;收费类别
							</td>
						</tr>
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'<%=request.getContextPath()%>/EfCostChargeitem/Servlet?method=list4this')">
								<img src="images/svg/heavy/green/list.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;收费项目
							</td>
						</tr>
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'<%=request.getContextPath()%>/EfCostCostkind/Servlet?method=list4this')">
								<img src="images/svg/heavy/green/list.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;成本分类
							</td>
						</tr>
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'<%=request.getContextPath()%>/EfCostCostitem/Servlet?method=list4this')">
								<img src="images/svg/heavy/green/list.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;成本项目
							</td>
						</tr>
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'<%=request.getContextPath()%>/EfCostServiceitem/Servlet?method=list4this')">
								<img src="images/svg/heavy/green/list.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;服务项目
							</td>
						</tr>
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'<%=request.getContextPath()%>/EfCostWorkitem/Servlet?method=list4this')">
								<img src="images/svg/heavy/green/list.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;工作项目
							</td>
						</tr>
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'<%=request.getContextPath()%>/EfCostShareparam/Servlet?method=list4this')">
								<img src="images/svg/heavy/green/list.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;分摊参数
							</td>
						</tr>
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'<%=request.getContextPath()%>/EfCostSharefun/Servlet?method=list4this')">
								<img src="images/svg/heavy/green/list.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;分摊方法
							</td>
						</tr>
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'<%=request.getContextPath()%>/EfCostWbsource/Servlet?method=list4this')">
								<img src="images/svg/heavy/green/list.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;外部接口
							</td>
						</tr>
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'<%=request.getContextPath()%>/SysMapInfo/Servlet?method=list4this')">
								<img src="images/svg/heavy/green/list.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;对照关系管理
							</td>
						</tr>
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'<%=request.getContextPath()%>/SourceDeptAccMap/Servlet?method=list4this')">
								<img src="images/excel.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;外部接口科室科目对照
							</td>
						</tr>
					</table>

				</td>
			</tr>
			
			<tr>
				<td class="menu_header_expand"
					onclick="toggleMenuGroup(this,'04')">
					系统管理
				</td>
			</tr>
			<tr>
				<td>

					<table id="menu_group_04" width="100%" cellpadding="0"
						cellspacing="0" border="0">
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'<%=request.getContextPath()%>/ExcelParser/uploadFile.jsp')">
								<img src="images/excel.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;Excel导入
							</td>
						</tr>
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'<%=request.getContextPath()%>/GlAccvouch/uploadFile.jsp?wbSource=002&debitORcredit=credit')">
								<img src="images/excel.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;门诊收入转凭证
							</td>
						</tr>
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'<%=request.getContextPath()%>/GlAccvouch/uploadFile.jsp?wbSource=003&debitORcredit=credit')">
								<img src="images/excel.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;住院收入转凭证
							</td>
						</tr>
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'<%=request.getContextPath()%>/GlAccvouch/Servlet?method=zzlist')">
								<img src="images/svg/heavy/green/list.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;总账凭证查询
							</td>
						</tr>
					</table>

				</td>
			</tr>
			
			<%
				if (isAdmin)
				{
			%>
			<tr>
				<td class="menu_header_not_expand"
					onclick="toggleMenuGroup(this,'02')">
					个人管理
				</td>
			</tr>
			<tr>
				<td>
					<table id="menu_group_02" width="100%" cellpadding="0"
						cellspacing="0" border="0" class="hidden">
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'Auth/Servlet?method=userDetail&account=<%=user.getAccount()%>')">
								<img src="images/svg/heavy/green/user.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;我的账号
							</td>
						</tr>
						<tr>
							<td class="menu_not_selected"
								onclick="openInMainFrame(this,'Auth/modifyPassword.jsp')">
								<img src="images/svg/heavy/green/locked.png" width="18"
									height="18" align="middle" />
								&nbsp;&nbsp;修改密码
							</td>
						</tr>
						<%
							}
						%>
						<%
							if (isAdmin)
							{
						%>
						<!-- 
  <tr>
    <td height="36"class="menu_header">系统管理</td>
  </tr>
  <tr>
    <td class="menu_not_selected" onclick="openInMainFrame(this,'Auth/Servlet?method=userList')"><img src="images/4917/18.png" width="18" height="18" align="middle" />&nbsp;&nbsp;管理账号</td>
   </tr>
  <tr>
    <td class="menu_not_selected" onclick="openInMainFrame(this,'System/Servlet?method=preDbAddOrModify')"><img src="images/4917/18.png" width="18" height="18" align="middle" />&nbsp;&nbsp;管理账套</td>
  </tr>
   -->
						<%
							}
						%>
					</table>
				</td>
			</tr>
		</table>
	</body>