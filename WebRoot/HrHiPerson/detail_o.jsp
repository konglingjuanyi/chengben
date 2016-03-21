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
	</head> 
	<body> 
		<!-- 表格标题 --> 
		<table width="600" align="center" class="title_table"> 
			<tr> 
				<td> 
					<img src="../images/svg/heavy/green/user.png" width="18" height="18" align="absmiddle"> 
					&nbsp;&nbsp;<%=domainInstance.getCnName()%>信息 
				</td> 
			</tr> 
		</table> 
		<!-- 详细信息 --> 
		<table width="600" align="center" class="detail_table detail_table-bordered detail_table-striped"> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpsn_num") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpsn_num())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpsn_name") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpsn_name())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdept_num") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdept_num())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("irecordid") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getIrecordid())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("rpersontype") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getRpersontype())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("rsex") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getRsex())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dbirthdate") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getDbirthdate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("rnativeplace") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getRnativeplace())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("rnational") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getRnational())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("rhealthstatus") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getRhealthstatus())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("rmarristatus") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getRmarristatus())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("vidno") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getVidno())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("mpicture") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr("")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("rperresidence") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getRperresidence())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("valianame") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getValianame())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("djoinworkdate") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getDjoinworkdate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("denterdate") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getDenterdate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dregulardate") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getDregulardate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("vssno") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getVssno())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("rworkattend") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getRworkattend())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("vcardno") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getVcardno())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("rtbmrule") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getRtbmrule())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("rcheckinflag") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getRcheckinflag())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dlastdate") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getDlastdate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("hrts") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr("")%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("vstatus1") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getVstatus1())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("nstatus2") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getNstatus2())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bpsnperson") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getBpsnperson())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpsnmobilephone") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpsnmobilephone())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpsnfphone") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpsnfphone())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpsnophone") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpsnophone())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpsninphone") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpsninphone())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpsnemail") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpsnemail())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpsnpostaddr") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpsnpostaddr())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpsnpostcode") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpsnpostcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpsnfaddr") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpsnfaddr())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpsnqqcode") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpsnqqcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpsnurl") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpsnurl())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpsnoseat") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpsnoseat())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("denterunitdate") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getDenterunitdate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpsnproperty") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpsnproperty())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpsnbankcode") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpsnbankcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpsnaccount") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpsnaccount())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("pk_hr_hi_person") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getPk_hr_hi_person())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bprobation") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getBprobation())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdutyclass") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdutyclass())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("btaketm") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getBtaketm())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("mpictureqpb") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getMpictureqpb())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ridtype") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getRidtype())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("rcountry") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getRcountry())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("dleavedate") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getDleavedate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("rfigure") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getRfigure())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("rworkstatus") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getRworkstatus())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("employmentform") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getEmploymentform())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("rpersonparameters") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getRpersonparameters())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bdutylock") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getBdutylock())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bpsnshop") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getBpsnshop())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cardstate") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCardstate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("firsthtbegindate") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getFirsthtbegindate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("lasthtenddate") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getLasthtenddate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpsn_nameen") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpsn_nameen())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("sysage") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getSysage())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("syscompage") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getSyscompage())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("sysworkage") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getSysworkage())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cregion") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCregion())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("natruetype") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getNatruetype())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cshifttype") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCshifttype())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdefaultbc") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdefaultbc())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("denterdutyclassdate") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getDenterdutyclassdate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cresttype") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCresttype())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("jobnumber") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getJobnumber())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("persondepart") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getPersondepart())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cardeffectivebegintime") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCardeffectivebegintime())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cardeffectiveendtime") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCardeffectiveendtime())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("keyperson") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getKeyperson())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cleavereson") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCleavereson())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("remploystate") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getRemploystate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdutylocker") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdutylocker())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdutylockernum") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdutylockernum())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cjobcode") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCjobcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cjobrankcode") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCjobrankcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cjobgradecode") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCjobgradecode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpsnnowaddress") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpsnnowaddress())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("curgentpsnname") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCurgentpsnname())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("curgentpsnphone") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCurgentpsnphone())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("blongidcard") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getBlongidcard())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cleavetype") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCleavetype())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cdutycode") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCdutycode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cfax") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCfax())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("ctitle") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCtitle())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("creportto") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCreportto())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cstartworktime") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCstartworktime())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cendworktime") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCendworktime())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cloginsubids") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCloginsubids())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cpersonbarcode") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCpersonbarcode())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("bmobilecard") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getBmobilecard())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("cmobilesites") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getCmobilesites())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("voldcard") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getVoldcard())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("maxleadnum") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getMaxleadnum())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("maxpaccountnum") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getMaxpaccountnum())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("maxaccountnum") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getMaxaccountnum())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("maxopportunitynum") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getMaxopportunitynum())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("leadrcyreg") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getLeadrcyreg())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("paccountrcyreg") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getPaccountrcyreg())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("opportunityrcyreg") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getOpportunityrcyreg())%></td> 
			</tr> 
		</table> 
		 
		<!-- 工具栏 --> 
		<jsp:include page="../ToolBar/detail_toolbar.jsp"/> 
	</body> 
</html> 
