<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<%@page import="com.wuyg.common.licence.LicenceUtil"%>
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
<link href="css/global.css" rel="stylesheet" type="text/css">
<title>系统信息</title>
</head>
<body>
<table width="600" align="center" class="title_table"> 
			<tr> 
				<td> 
					<img src="images/svg/light/green/16/comment.png" align="absmiddle"> 
					系统信息 
				</td> 
			</tr> 
		</table> 
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" class="detail_table detail_table-bordered detail_table-striped">
  <tr>
    <td>开发语言:</td>
    <td>java+html+jquery+css3 </td>
  </tr>
  <tr>
    <td>数据库版本:</td>
    <td>SqlServer2008 </td>
  </tr>
  <tr>
    <td>适用系统:</td>
    <td>用友U8系统</td>
  </tr>
  <tr>
    <td>开发厂商:</td>
    <td><%=LicenceUtil.getLicencedMachine().getSupplier() %></td>
  </tr>
   <tr>
    <td>当前版本:</td>
    <td><%=LicenceUtil.getLicencedMachine().getSystemVersion() %></td>
  </tr>
  <tr>
    <td>系统简介:</td>
    <td>该系统适用于蓬莱中医医院，主要用来进行医院科室成本分摊。
    <br> <br>1、设置U8系统数据库账套信息并同步“总账科室”和“总账会计科目”信息，科室同步之后需要设置“科室类型”（临床、医技、辅助、管理），科目同步之后需要设置“对方科目”（生成凭证时使用）。
    <br> <br>2、设置外部接口，每个外部接口需要分别设置其“科室与总账科室”的对照关系，以及“各费用项目与总账会计科目”的对照关系。
    <br> <br>3、外部接口设置完成后，可以将相应的收入或成本导入到总账中生成凭证。
    <br> <br>4、总账系统根据导入的凭证生成“各科室直接成本表”。
    <br> <br>5、将总账系统生成的“各科室直接成本表”导入该系统。
    <br> <br>6、设置本月的“各科室成本分摊规则”，也可以直接复制之前月份已经设置的成本分摊规则，需注意各级分摊比例的合计必须为100%。
    <br> <br>7、查询“临床服务类科室全成本报表”、“临床服务类科室全成本构成分析表”可以得到所需的报表。
    </td>
  </tr>
</table>
</body>
</html>

