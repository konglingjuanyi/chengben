<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 --> 
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.wuyg.common.obj.PaginationObj"%> 
<%@page import="com.inspur.common.dictionary.util.DictionaryUtil"%> 
<%@page import="com.hz.dict.service.DictionaryService"%> 
<%@page import="com.hr.obj.HrHiPersonObj"%> 
<!-- 基本信息 --> 
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
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />		<title><%=domainInstance.getCnName() %>列表</title> 
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
						<input name="searchButton" type="button" class="button button_search" value="查询" onClick="toPage(1)"> 
					</td> 
					<td align="right"> 
						<input name="addButton" type="button" class="button button_add" value="增加" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=preModify4this')"> 
					</td> 
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
						<th><%=domainInstance.getPropertyCnName("cpsn_num") %></th> 
						<th><%=domainInstance.getPropertyCnName("cpsn_name") %></th> 
						<th><%=domainInstance.getPropertyCnName("cdept_num") %></th> 
						<th><%=domainInstance.getPropertyCnName("irecordid") %></th> 
						<th><%=domainInstance.getPropertyCnName("rpersontype") %></th> 
						<th><%=domainInstance.getPropertyCnName("rsex") %></th> 
						<th><%=domainInstance.getPropertyCnName("dbirthdate") %></th> 
						<th><%=domainInstance.getPropertyCnName("rnativeplace") %></th> 
						<th><%=domainInstance.getPropertyCnName("rnational") %></th> 
						<th><%=domainInstance.getPropertyCnName("rhealthstatus") %></th> 
						<th><%=domainInstance.getPropertyCnName("rmarristatus") %></th> 
						<th><%=domainInstance.getPropertyCnName("vidno") %></th> 
						<th><%=domainInstance.getPropertyCnName("mpicture") %></th> 
						<th><%=domainInstance.getPropertyCnName("rperresidence") %></th> 
						<th><%=domainInstance.getPropertyCnName("valianame") %></th> 
						<th><%=domainInstance.getPropertyCnName("djoinworkdate") %></th> 
						<th><%=domainInstance.getPropertyCnName("denterdate") %></th> 
						<th><%=domainInstance.getPropertyCnName("dregulardate") %></th> 
						<th><%=domainInstance.getPropertyCnName("vssno") %></th> 
						<th><%=domainInstance.getPropertyCnName("rworkattend") %></th> 
						<th><%=domainInstance.getPropertyCnName("vcardno") %></th> 
						<th><%=domainInstance.getPropertyCnName("rtbmrule") %></th> 
						<th><%=domainInstance.getPropertyCnName("rcheckinflag") %></th> 
						<th><%=domainInstance.getPropertyCnName("dlastdate") %></th> 
						<th><%=domainInstance.getPropertyCnName("hrts") %></th> 
						<th><%=domainInstance.getPropertyCnName("vstatus1") %></th> 
						<th><%=domainInstance.getPropertyCnName("nstatus2") %></th> 
						<th><%=domainInstance.getPropertyCnName("bpsnperson") %></th> 
						<th><%=domainInstance.getPropertyCnName("cpsnmobilephone") %></th> 
						<th><%=domainInstance.getPropertyCnName("cpsnfphone") %></th> 
						<th><%=domainInstance.getPropertyCnName("cpsnophone") %></th> 
						<th><%=domainInstance.getPropertyCnName("cpsninphone") %></th> 
						<th><%=domainInstance.getPropertyCnName("cpsnemail") %></th> 
						<th><%=domainInstance.getPropertyCnName("cpsnpostaddr") %></th> 
						<th><%=domainInstance.getPropertyCnName("cpsnpostcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("cpsnfaddr") %></th> 
						<th><%=domainInstance.getPropertyCnName("cpsnqqcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("cpsnurl") %></th> 
						<th><%=domainInstance.getPropertyCnName("cpsnoseat") %></th> 
						<th><%=domainInstance.getPropertyCnName("denterunitdate") %></th> 
						<th><%=domainInstance.getPropertyCnName("cpsnproperty") %></th> 
						<th><%=domainInstance.getPropertyCnName("cpsnbankcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("cpsnaccount") %></th> 
						<th><%=domainInstance.getPropertyCnName("pk_hr_hi_person") %></th> 
						<th><%=domainInstance.getPropertyCnName("bprobation") %></th> 
						<th><%=domainInstance.getPropertyCnName("cdutyclass") %></th> 
						<th><%=domainInstance.getPropertyCnName("btaketm") %></th> 
						<th><%=domainInstance.getPropertyCnName("mpictureqpb") %></th> 
						<th><%=domainInstance.getPropertyCnName("ridtype") %></th> 
						<th><%=domainInstance.getPropertyCnName("rcountry") %></th> 
						<th><%=domainInstance.getPropertyCnName("dleavedate") %></th> 
						<th><%=domainInstance.getPropertyCnName("rfigure") %></th> 
						<th><%=domainInstance.getPropertyCnName("rworkstatus") %></th> 
						<th><%=domainInstance.getPropertyCnName("employmentform") %></th> 
						<th><%=domainInstance.getPropertyCnName("rpersonparameters") %></th> 
						<th><%=domainInstance.getPropertyCnName("bdutylock") %></th> 
						<th><%=domainInstance.getPropertyCnName("bpsnshop") %></th> 
						<th><%=domainInstance.getPropertyCnName("cardstate") %></th> 
						<th><%=domainInstance.getPropertyCnName("firsthtbegindate") %></th> 
						<th><%=domainInstance.getPropertyCnName("lasthtenddate") %></th> 
						<th><%=domainInstance.getPropertyCnName("cpsn_nameen") %></th> 
						<th><%=domainInstance.getPropertyCnName("sysage") %></th> 
						<th><%=domainInstance.getPropertyCnName("syscompage") %></th> 
						<th><%=domainInstance.getPropertyCnName("sysworkage") %></th> 
						<th><%=domainInstance.getPropertyCnName("cregion") %></th> 
						<th><%=domainInstance.getPropertyCnName("natruetype") %></th> 
						<th><%=domainInstance.getPropertyCnName("cshifttype") %></th> 
						<th><%=domainInstance.getPropertyCnName("cdefaultbc") %></th> 
						<th><%=domainInstance.getPropertyCnName("denterdutyclassdate") %></th> 
						<th><%=domainInstance.getPropertyCnName("cresttype") %></th> 
						<th><%=domainInstance.getPropertyCnName("jobnumber") %></th> 
						<th><%=domainInstance.getPropertyCnName("persondepart") %></th> 
						<th><%=domainInstance.getPropertyCnName("cardeffectivebegintime") %></th> 
						<th><%=domainInstance.getPropertyCnName("cardeffectiveendtime") %></th> 
						<th><%=domainInstance.getPropertyCnName("keyperson") %></th> 
						<th><%=domainInstance.getPropertyCnName("cleavereson") %></th> 
						<th><%=domainInstance.getPropertyCnName("remploystate") %></th> 
						<th><%=domainInstance.getPropertyCnName("cdutylocker") %></th> 
						<th><%=domainInstance.getPropertyCnName("cdutylockernum") %></th> 
						<th><%=domainInstance.getPropertyCnName("cjobcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("cjobrankcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("cjobgradecode") %></th> 
						<th><%=domainInstance.getPropertyCnName("cpsnnowaddress") %></th> 
						<th><%=domainInstance.getPropertyCnName("curgentpsnname") %></th> 
						<th><%=domainInstance.getPropertyCnName("curgentpsnphone") %></th> 
						<th><%=domainInstance.getPropertyCnName("blongidcard") %></th> 
						<th><%=domainInstance.getPropertyCnName("cleavetype") %></th> 
						<th><%=domainInstance.getPropertyCnName("cdutycode") %></th> 
						<th><%=domainInstance.getPropertyCnName("cfax") %></th> 
						<th><%=domainInstance.getPropertyCnName("ctitle") %></th> 
						<th><%=domainInstance.getPropertyCnName("creportto") %></th> 
						<th><%=domainInstance.getPropertyCnName("cstartworktime") %></th> 
						<th><%=domainInstance.getPropertyCnName("cendworktime") %></th> 
						<th><%=domainInstance.getPropertyCnName("cloginsubids") %></th> 
						<th><%=domainInstance.getPropertyCnName("cpersonbarcode") %></th> 
						<th><%=domainInstance.getPropertyCnName("bmobilecard") %></th> 
						<th><%=domainInstance.getPropertyCnName("cmobilesites") %></th> 
						<th><%=domainInstance.getPropertyCnName("voldcard") %></th> 
						<th><%=domainInstance.getPropertyCnName("maxleadnum") %></th> 
						<th><%=domainInstance.getPropertyCnName("maxpaccountnum") %></th> 
						<th><%=domainInstance.getPropertyCnName("maxaccountnum") %></th> 
						<th><%=domainInstance.getPropertyCnName("maxopportunitynum") %></th> 
						<th><%=domainInstance.getPropertyCnName("leadrcyreg") %></th> 
						<th><%=domainInstance.getPropertyCnName("paccountrcyreg") %></th> 
						<th><%=domainInstance.getPropertyCnName("opportunityrcyreg") %></th> 
						<th>操作</th> 
					</tr> 
				</thead> 
				<% 
					for (int i = 0; i < list.size(); i++) 
						{ 
							HrHiPersonObj o = (HrHiPersonObj) list.get(i); 
				%> 
				<tr> 
					<td> 
						<a href="#" onClick="openBigModalDialog('<%=contextPath%>/<%=basePath%>/Servlet?method=detail4this&<%=o.findKeyColumnName()%>=<%=o.getCpsn_num()%>')"> <%=StringUtil.getNotEmptyStr(o.getCpsn_num())%> </a> 
					</td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCpsn_name())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdept_num())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getIrecordid())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getRpersontype())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getRsex())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getDbirthdate())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getRnativeplace())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getRnational())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getRhealthstatus())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getRmarristatus())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getVidno())%></td> 
					<td><%=StringUtil.getNotEmptyStr("")%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getRperresidence())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getValianame())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getDjoinworkdate())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getDenterdate())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getDregulardate())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getVssno())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getRworkattend())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getVcardno())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getRtbmrule())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getRcheckinflag())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getDlastdate())%></td> 
					<td><%=StringUtil.getNotEmptyStr("")%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getVstatus1())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getNstatus2())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getBpsnperson())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCpsnmobilephone())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCpsnfphone())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCpsnophone())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCpsninphone())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCpsnemail())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCpsnpostaddr())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCpsnpostcode())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCpsnfaddr())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCpsnqqcode())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCpsnurl())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCpsnoseat())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getDenterunitdate())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCpsnproperty())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCpsnbankcode())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCpsnaccount())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getPk_hr_hi_person())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getBprobation())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdutyclass())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getBtaketm())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getMpictureqpb())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getRidtype())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getRcountry())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getDleavedate())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getRfigure())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getRworkstatus())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getEmploymentform())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getRpersonparameters())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getBdutylock())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getBpsnshop())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCardstate())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getFirsthtbegindate())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getLasthtenddate())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCpsn_nameen())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getSysage())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getSyscompage())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getSysworkage())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCregion())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getNatruetype())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCshifttype())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdefaultbc())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getDenterdutyclassdate())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCresttype())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getJobnumber())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getPersondepart())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCardeffectivebegintime())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCardeffectiveendtime())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getKeyperson())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCleavereson())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getRemploystate())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdutylocker())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdutylockernum())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCjobcode())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCjobrankcode())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCjobgradecode())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCpsnnowaddress())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCurgentpsnname())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCurgentpsnphone())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getBlongidcard())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCleavetype())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCdutycode())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCfax())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCtitle())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCreportto())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCstartworktime())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCendworktime())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCloginsubids())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCpersonbarcode())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getBmobilecard())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getCmobilesites())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getVoldcard())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getMaxleadnum())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getMaxpaccountnum())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getMaxaccountnum())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getMaxopportunitynum())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getLeadrcyreg())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getPaccountrcyreg())%></td> 
					<td><%=StringUtil.getNotEmptyStr(o.getOpportunityrcyreg())%></td> 
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
		</form>  
 
	</body> 
</html> 
