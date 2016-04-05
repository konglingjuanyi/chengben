<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<%@page import="com.hz.auth.obj.AuthUser"%>
<%@page import="com.hz.util.SystemConstant"%>
<%@page import="com.wuyg.common.util.RequestUtil"%>
<%@page import="com.wuyg.common.util.StringUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>我的账号</title>
		<link href="../css/global.css" rel="stylesheet" type="text/css" />
	</head>

	<script src="../js/jquery-2.0.3.min.js"></script>
	<script src="../js/utils.js"></script>
	<%
		AuthUser userInfo = (AuthUser) request.getAttribute(SystemConstant.AUTH_USER_INFO);

		String tableWidth = "500";
		boolean is4m = RequestUtil.is4m(request);
		if (is4m)
			tableWidth = "96%";
	%>
	<body>

		<!-- 表格标题 -->
		<table width="500" align="center" class="title_table">
			<tr>
				<td>
					<img src="../images/svg/heavy/green/user.png" width="18" height="18" align="absmiddle"/>
					&nbsp;&nbsp;我的信息
				</td>
			</tr>
		</table>
		<!-- 详细信息 -->
		<table width="500" align="center" class="detail_table detail_table-bordered detail_table-striped">
			<tr>
				<td>
					账号:
				</td>
				<td><%=StringUtil.getNotEmptyStr(userInfo.getAccount())%></td>
			</tr>
			<tr>
				<td>
					姓名:
				</td>
				<td><%=StringUtil.getNotEmptyStr(userInfo.getName())%></td>
			</tr>
			<tr>
				<td>
					联系电话:
				</td>
				<td><%=StringUtil.getNotEmptyStr(userInfo.getTelephone())%></td>
			</tr>
			<tr>
				<td>
					所属部门:
				</td>
				<td><%=StringUtil.getNotEmptyStr(userInfo.getDepartmentName())%></td>
			</tr>
		</table>
	</body>
</html>
