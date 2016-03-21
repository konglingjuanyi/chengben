<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.hr.obj.HrHiPersonObj"%> 
<% 
	// 当前上下文路径  
	String contextPath = request.getContextPath();  
  
	// 该功能对象实例  
	HrHiPersonObj domainInstance = (HrHiPersonObj) request.getAttribute("domainInstance");  
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
	    <style type="text/css">
<!--
.big_black_bold_font {
font-size: 18px;
font-weight:bold;
color:#000000;
padding:6px;
}

.middle_black_bold_font {
font-size: 14px;
font-weight:bold;
color:#000000;
padding:6px;
}
.little_black_bold_font {
font-size: 12px;
font-weight:bold;
color:#000000;
padding:6px;
}

.little_black_font {
font-size: 12px;
color:#000000;
padding:6px;
}

.split_table {
  margin-top: 8px;
  max-width: 100%;
  /*background-color: #ffffff;*/
  border: 0;
}

.split_table td {
  padding: 8px;
  vertical-align: left;
  text-align: left;
  font-size: 14px;
  font-weight: bold;
  color: #3daeb6;
  border-bottom: 1px solid #3daeb6;
}

.list_table
{
	margin:8px;
	background-color:#FFFFFF;
}

.list_table td
{
	padding:6px;
	text-align: left;
	font-size:12px;
	background:#FFFFFF;
}

-->

        </style>
</head> 
	<body> 
		<!-- 表格标题 --> 
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="title_table"> 
			<!--<tr> 
				<td> 
					<img src="../images/svg/heavy/green/user.png" width="18" height="18" align="absmiddle"> 
					&nbsp;&nbsp;<%=domainInstance.getCnName()%> 
				</td> 
			</tr> -->
			<tr bgcolor="#f9f9f9"> 
				<td>
				<div class="big_black_bold_font">张世杰</div>
				<div class="middle_black_bold_font">秘书/总裁办公室</div>
				</td> 
			  <td width="200" align="right" valign="bottom"><div class="middle_black_bold_font" align="right">手机：13906411551</div></td> 
			</tr> 
	</table> 
		<!-- 详细信息 --> 
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:8px" > 
			<tr> 
				<td valign="top">
				
				<div class="little_black_bold_font">男&nbsp;&nbsp;34岁(1982年9月24日)&nbsp;&nbsp;本科&nbsp;&nbsp;已婚&nbsp;&nbsp;中共党员</div>
				<div class="little_black_font">身份证：371323198209247654</div>
				<div class="little_black_font">手机：13906411661&nbsp;&nbsp;|&nbsp;&nbsp;内线：8888&nbsp;&nbsp;|&nbsp;&nbsp;E-mail：zhang@163.com</div>
				<div class="little_black_font">现居住地：济南市高新区46号&nbsp;&nbsp;|&nbsp;&nbsp;籍贯：山东省临沂市沂水县</div>
				<div class="little_black_font">合同到期日期：2018-1-1&nbsp;&nbsp;|&nbsp;&nbsp;合同初签日期：2015-1-1</div>
				</td> 
				<td align="center" class="big_black_font"><img src="../images/mayun.jpg" width="100" height="100"></td> 
			</tr> 
	</table> 
		 
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="split_table">
          <!--<tr> 
				<td> 
					<img src="../images/svg/heavy/green/user.png" width="18" height="18" align="absmiddle"> 
					&nbsp;&nbsp;<%=domainInstance.getCnName()%> 
				</td> 
			</tr> -->
          <tr bgcolor="#f9f9f9">
            <td><div class="">工作经历</div>
                </td>
          </tr>
        </table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="list_table" >
          <tr>
            <td width="200">2015.1.1 至今 </td>
            <td>浪潮集团</td>
            <td>1年3个月</td>
          </tr>
          <tr>
            <td>2010.7.1~2015.1.1</td>
            <td>大明通技术有限公司</td>
            <td>4年6个月</td>
          </tr>
        </table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="split_table">
          <!--<tr> 
				<td> 
					<img src="../images/svg/heavy/green/user.png" width="18" height="18" align="absmiddle"> 
					&nbsp;&nbsp;<%=domainInstance.getCnName()%> 
				</td> 
			</tr> -->
          <tr bgcolor="#f9f9f9">
            <td><div class="">教育经历</div></td>
          </tr>
        </table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="list_table" >
          <tr>
            <td width="200">2006.9.1~2010.7.1</td>
            <td>山东大学</td>
            <td>计算机科学与技术</td>
            <td>本科</td>
          </tr>
          <tr>
            <td>2003.9.1~2006.7.1</td>
            <td>沂水一中</td>
            <td>&nbsp;</td>
            <td>高中</td>
          </tr>
        </table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="split_table">
          <!--<tr> 
				<td> 
					<img src="../images/svg/heavy/green/user.png" width="18" height="18" align="absmiddle"> 
					&nbsp;&nbsp;<%=domainInstance.getCnName()%> 
				</td> 
			</tr> -->
          <tr bgcolor="#f9f9f9">
            <td><div class="">培训经历</div></td>
          </tr>
        </table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="list_table" >
          <tr>
            <td width="200">2006.9.1~2010.7.1</td>
            <td>新东方英语培训学校/济南</td>
            <td>商务英语培训</td>
            <td>商务英语证书</td>
          </tr>
          <tr>
            <td>2003.9.1~2006.7.1</td>
            <td>泰捷培训学校/北京</td>
            <td>JAVA开发培训</td>
            <td>JAVA开发三级证书</td>
          </tr>
        </table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="split_table">
          <!--<tr> 
				<td> 
					<img src="../images/svg/heavy/green/user.png" width="18" height="18" align="absmiddle"> 
					&nbsp;&nbsp;<%=domainInstance.getCnName()%> 
				</td> 
			</tr> -->
          <tr bgcolor="#f9f9f9">
            <td><div class="">语言能力</div></td>
          </tr>
        </table>
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="list_table" >
          <tr>
            <td width="200">英语</td>
            <td>CET4级&nbsp;&nbsp;|&nbsp;&nbsp;读写能力良好&nbsp;&nbsp;|&nbsp;&nbsp;听说能力良好</td>
          </tr>
        </table>
		<!-- 工具栏 --> 
		<jsp:include page="../ToolBar/detail_toolbar.jsp"/> 
	</body> 
</html> 
