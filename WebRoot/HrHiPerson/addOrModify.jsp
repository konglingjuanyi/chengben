<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.inspur.common.dictionary.util.DictionaryUtil"%> 
<%@page import="com.hz.dict.service.DictionaryService"%> 
<%@page import="com.hz.dict.service.IDictionaryService"%> 
<%@page import="com.hr.obj.HrHiPersonObj"%> 
<!-- 基本信息 -->  
<% 
	// 上下文路径 
	String contextPath = request.getContextPath(); 
	 
	// 对象实例 
	HrHiPersonObj domainInstance = new HrHiPersonObj(); 
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath(); 
 
	// 如果是修改，则获取对象信息 
	Object domainInstanceObj = request.getAttribute("domainInstance"); 
	if (domainInstanceObj != null) 
	{ 
		domainInstance = (HrHiPersonObj) domainInstanceObj; 
	} 
 
	// 是否是修改 
	boolean isModify = domainInstance.getKeyValue() > 0; 
	// 唯一性检查用的字段 
	String keyCol = "null"; 
%> 
<html> 
	<head> 
		<base target="_self" /> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />		<title><%=isModify ? "修改" + domainInstance.getCnName() : "增加" + domainInstance.getCnName()%></title> 
		<link href="../css/global.css" rel="stylesheet" type="text/css"> 
		<link href="../css/table.css" rel="stylesheet" type="text/css"> 
		<script type="text/javascript" src="../js/jquery-2.0.3.min.js"></script> 
		<script type="text/javascript" src="../js/utils.js"></script> 
		<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script> 
		<script> 
		//  新增或修改 
		function addOrModify() 
		{	 
				// 做必要的检查 
		if(!checkNull("cpsn_num","<%=domainInstance.getPropertyCnName("cpsn_num")%>")) return false; 
		if(!checkNull("cpsn_name","<%=domainInstance.getPropertyCnName("cpsn_name")%>")) return false; 
		if(!checkNull("cdept_num","<%=domainInstance.getPropertyCnName("cdept_num")%>")) return false; 
		if(!checkNull("irecordid","<%=domainInstance.getPropertyCnName("irecordid")%>")) return false; 
		if(!checkNull("rpersontype","<%=domainInstance.getPropertyCnName("rpersontype")%>")) return false; 
		if(!checkNull("rsex","<%=domainInstance.getPropertyCnName("rsex")%>")) return false; 
		if(!checkNull("dbirthdate","<%=domainInstance.getPropertyCnName("dbirthdate")%>")) return false; 
		if(!checkNull("rnativeplace","<%=domainInstance.getPropertyCnName("rnativeplace")%>")) return false; 
		if(!checkNull("rnational","<%=domainInstance.getPropertyCnName("rnational")%>")) return false; 
		if(!checkNull("rhealthstatus","<%=domainInstance.getPropertyCnName("rhealthstatus")%>")) return false; 
		if(!checkNull("rmarristatus","<%=domainInstance.getPropertyCnName("rmarristatus")%>")) return false; 
		if(!checkNull("vidno","<%=domainInstance.getPropertyCnName("vidno")%>")) return false; 
		if(!checkNull("mpicture","<%=domainInstance.getPropertyCnName("mpicture")%>")) return false; 
		if(!checkNull("rperresidence","<%=domainInstance.getPropertyCnName("rperresidence")%>")) return false; 
		if(!checkNull("valianame","<%=domainInstance.getPropertyCnName("valianame")%>")) return false; 
		if(!checkNull("djoinworkdate","<%=domainInstance.getPropertyCnName("djoinworkdate")%>")) return false; 
		if(!checkNull("denterdate","<%=domainInstance.getPropertyCnName("denterdate")%>")) return false; 
		if(!checkNull("dregulardate","<%=domainInstance.getPropertyCnName("dregulardate")%>")) return false; 
		if(!checkNull("vssno","<%=domainInstance.getPropertyCnName("vssno")%>")) return false; 
		if(!checkNull("rworkattend","<%=domainInstance.getPropertyCnName("rworkattend")%>")) return false; 
		if(!checkNull("vcardno","<%=domainInstance.getPropertyCnName("vcardno")%>")) return false; 
		if(!checkNull("rtbmrule","<%=domainInstance.getPropertyCnName("rtbmrule")%>")) return false; 
		if(!checkNull("rcheckinflag","<%=domainInstance.getPropertyCnName("rcheckinflag")%>")) return false; 
		if(!checkNull("dlastdate","<%=domainInstance.getPropertyCnName("dlastdate")%>")) return false; 
		if(!checkNull("hrts","<%=domainInstance.getPropertyCnName("hrts")%>")) return false; 
		if(!checkNull("vstatus1","<%=domainInstance.getPropertyCnName("vstatus1")%>")) return false; 
		if(!checkNull("nstatus2","<%=domainInstance.getPropertyCnName("nstatus2")%>")) return false; 
		if(!checkNull("bpsnperson","<%=domainInstance.getPropertyCnName("bpsnperson")%>")) return false; 
		if(!checkNull("cpsnmobilephone","<%=domainInstance.getPropertyCnName("cpsnmobilephone")%>")) return false; 
		if(!checkNull("cpsnfphone","<%=domainInstance.getPropertyCnName("cpsnfphone")%>")) return false; 
		if(!checkNull("cpsnophone","<%=domainInstance.getPropertyCnName("cpsnophone")%>")) return false; 
		if(!checkNull("cpsninphone","<%=domainInstance.getPropertyCnName("cpsninphone")%>")) return false; 
		if(!checkNull("cpsnemail","<%=domainInstance.getPropertyCnName("cpsnemail")%>")) return false; 
		if(!checkNull("cpsnpostaddr","<%=domainInstance.getPropertyCnName("cpsnpostaddr")%>")) return false; 
		if(!checkNull("cpsnpostcode","<%=domainInstance.getPropertyCnName("cpsnpostcode")%>")) return false; 
		if(!checkNull("cpsnfaddr","<%=domainInstance.getPropertyCnName("cpsnfaddr")%>")) return false; 
		if(!checkNull("cpsnqqcode","<%=domainInstance.getPropertyCnName("cpsnqqcode")%>")) return false; 
		if(!checkNull("cpsnurl","<%=domainInstance.getPropertyCnName("cpsnurl")%>")) return false; 
		if(!checkNull("cpsnoseat","<%=domainInstance.getPropertyCnName("cpsnoseat")%>")) return false; 
		if(!checkNull("denterunitdate","<%=domainInstance.getPropertyCnName("denterunitdate")%>")) return false; 
		if(!checkNull("cpsnproperty","<%=domainInstance.getPropertyCnName("cpsnproperty")%>")) return false; 
		if(!checkNull("cpsnbankcode","<%=domainInstance.getPropertyCnName("cpsnbankcode")%>")) return false; 
		if(!checkNull("cpsnaccount","<%=domainInstance.getPropertyCnName("cpsnaccount")%>")) return false; 
		if(!checkNull("pk_hr_hi_person","<%=domainInstance.getPropertyCnName("pk_hr_hi_person")%>")) return false; 
		if(!checkNull("bprobation","<%=domainInstance.getPropertyCnName("bprobation")%>")) return false; 
		if(!checkNull("cdutyclass","<%=domainInstance.getPropertyCnName("cdutyclass")%>")) return false; 
		if(!checkNull("btaketm","<%=domainInstance.getPropertyCnName("btaketm")%>")) return false; 
		if(!checkNull("mpictureqpb","<%=domainInstance.getPropertyCnName("mpictureqpb")%>")) return false; 
		if(!checkNull("ridtype","<%=domainInstance.getPropertyCnName("ridtype")%>")) return false; 
		if(!checkNull("rcountry","<%=domainInstance.getPropertyCnName("rcountry")%>")) return false; 
		if(!checkNull("dleavedate","<%=domainInstance.getPropertyCnName("dleavedate")%>")) return false; 
		if(!checkNull("rfigure","<%=domainInstance.getPropertyCnName("rfigure")%>")) return false; 
		if(!checkNull("rworkstatus","<%=domainInstance.getPropertyCnName("rworkstatus")%>")) return false; 
		if(!checkNull("employmentform","<%=domainInstance.getPropertyCnName("employmentform")%>")) return false; 
		if(!checkNull("rpersonparameters","<%=domainInstance.getPropertyCnName("rpersonparameters")%>")) return false; 
		if(!checkNull("bdutylock","<%=domainInstance.getPropertyCnName("bdutylock")%>")) return false; 
		if(!checkNull("bpsnshop","<%=domainInstance.getPropertyCnName("bpsnshop")%>")) return false; 
		if(!checkNull("cardstate","<%=domainInstance.getPropertyCnName("cardstate")%>")) return false; 
		if(!checkNull("firsthtbegindate","<%=domainInstance.getPropertyCnName("firsthtbegindate")%>")) return false; 
		if(!checkNull("lasthtenddate","<%=domainInstance.getPropertyCnName("lasthtenddate")%>")) return false; 
		if(!checkNull("cpsn_nameen","<%=domainInstance.getPropertyCnName("cpsn_nameen")%>")) return false; 
		if(!checkNull("sysage","<%=domainInstance.getPropertyCnName("sysage")%>")) return false; 
		if(!checkNull("syscompage","<%=domainInstance.getPropertyCnName("syscompage")%>")) return false; 
		if(!checkNull("sysworkage","<%=domainInstance.getPropertyCnName("sysworkage")%>")) return false; 
		if(!checkNull("cregion","<%=domainInstance.getPropertyCnName("cregion")%>")) return false; 
		if(!checkNull("natruetype","<%=domainInstance.getPropertyCnName("natruetype")%>")) return false; 
		if(!checkNull("cshifttype","<%=domainInstance.getPropertyCnName("cshifttype")%>")) return false; 
		if(!checkNull("cdefaultbc","<%=domainInstance.getPropertyCnName("cdefaultbc")%>")) return false; 
		if(!checkNull("denterdutyclassdate","<%=domainInstance.getPropertyCnName("denterdutyclassdate")%>")) return false; 
		if(!checkNull("cresttype","<%=domainInstance.getPropertyCnName("cresttype")%>")) return false; 
		if(!checkNull("jobnumber","<%=domainInstance.getPropertyCnName("jobnumber")%>")) return false; 
		if(!checkNull("persondepart","<%=domainInstance.getPropertyCnName("persondepart")%>")) return false; 
		if(!checkNull("cardeffectivebegintime","<%=domainInstance.getPropertyCnName("cardeffectivebegintime")%>")) return false; 
		if(!checkNull("cardeffectiveendtime","<%=domainInstance.getPropertyCnName("cardeffectiveendtime")%>")) return false; 
		if(!checkNull("keyperson","<%=domainInstance.getPropertyCnName("keyperson")%>")) return false; 
		if(!checkNull("cleavereson","<%=domainInstance.getPropertyCnName("cleavereson")%>")) return false; 
		if(!checkNull("remploystate","<%=domainInstance.getPropertyCnName("remploystate")%>")) return false; 
		if(!checkNull("cdutylocker","<%=domainInstance.getPropertyCnName("cdutylocker")%>")) return false; 
		if(!checkNull("cdutylockernum","<%=domainInstance.getPropertyCnName("cdutylockernum")%>")) return false; 
		if(!checkNull("cjobcode","<%=domainInstance.getPropertyCnName("cjobcode")%>")) return false; 
		if(!checkNull("cjobrankcode","<%=domainInstance.getPropertyCnName("cjobrankcode")%>")) return false; 
		if(!checkNull("cjobgradecode","<%=domainInstance.getPropertyCnName("cjobgradecode")%>")) return false; 
		if(!checkNull("cpsnnowaddress","<%=domainInstance.getPropertyCnName("cpsnnowaddress")%>")) return false; 
		if(!checkNull("curgentpsnname","<%=domainInstance.getPropertyCnName("curgentpsnname")%>")) return false; 
		if(!checkNull("curgentpsnphone","<%=domainInstance.getPropertyCnName("curgentpsnphone")%>")) return false; 
		if(!checkNull("blongidcard","<%=domainInstance.getPropertyCnName("blongidcard")%>")) return false; 
		if(!checkNull("cleavetype","<%=domainInstance.getPropertyCnName("cleavetype")%>")) return false; 
		if(!checkNull("cdutycode","<%=domainInstance.getPropertyCnName("cdutycode")%>")) return false; 
		if(!checkNull("cfax","<%=domainInstance.getPropertyCnName("cfax")%>")) return false; 
		if(!checkNull("ctitle","<%=domainInstance.getPropertyCnName("ctitle")%>")) return false; 
		if(!checkNull("creportto","<%=domainInstance.getPropertyCnName("creportto")%>")) return false; 
		if(!checkNull("cstartworktime","<%=domainInstance.getPropertyCnName("cstartworktime")%>")) return false; 
		if(!checkNull("cendworktime","<%=domainInstance.getPropertyCnName("cendworktime")%>")) return false; 
		if(!checkNull("cloginsubids","<%=domainInstance.getPropertyCnName("cloginsubids")%>")) return false; 
		if(!checkNull("cpersonbarcode","<%=domainInstance.getPropertyCnName("cpersonbarcode")%>")) return false; 
		if(!checkNull("bmobilecard","<%=domainInstance.getPropertyCnName("bmobilecard")%>")) return false; 
		if(!checkNull("cmobilesites","<%=domainInstance.getPropertyCnName("cmobilesites")%>")) return false; 
		if(!checkNull("voldcard","<%=domainInstance.getPropertyCnName("voldcard")%>")) return false; 
		if(!checkNull("maxleadnum","<%=domainInstance.getPropertyCnName("maxleadnum")%>")) return false; 
		if(!checkNull("maxpaccountnum","<%=domainInstance.getPropertyCnName("maxpaccountnum")%>")) return false; 
		if(!checkNull("maxaccountnum","<%=domainInstance.getPropertyCnName("maxaccountnum")%>")) return false; 
		if(!checkNull("maxopportunitynum","<%=domainInstance.getPropertyCnName("maxopportunitynum")%>")) return false; 
		if(!checkNull("leadrcyreg","<%=domainInstance.getPropertyCnName("leadrcyreg")%>")) return false; 
		if(!checkNull("paccountrcyreg","<%=domainInstance.getPropertyCnName("paccountrcyreg")%>")) return false; 
		if(!checkNull("opportunityrcyreg","<%=domainInstance.getPropertyCnName("opportunityrcyreg")%>")) return false; 
					 
			// 修改 
			if("true"=="<%=isModify%>") 
			{ 
				submit(); 
			} 
			// 新增 
			else 
			{ 
					// 新增时检查唯一性 
					$.post( 
					encodeURI("Servlet?method=checkId4this&isFromUrl=true&<%=keyCol%>="+$("#<%=keyCol%>").val()),  
					{Action:"post"},  
					function (data, textStatus){ 
						this; 
						if(data=="true")  
						{ 
							alert("该<%=domainInstance.getPropertyCnName(keyCol)%>已录入系统");  
							return false; 
						} 
						else 
						{ 
							submit(); 
						} 
					}); 
				}; 
		} 
		 
		// 提交保存或修改 
		function submit() 
		{ 
					$("#addOrModifyForm").submit(); 
		} 
		</script> 
	</head> 
	<body> 
		<form name="addOrModifyForm" id="addOrModifyForm" action="<%=contextPath%>/<%=basePath%>/Servlet?method=addOrModify4this" method="post"> 
			<!-- 表格标题 --> 
			<table width="700" align="center" class="title_table"> 
				<tr> 
					<td> 
						<img src="../images/svg/heavy/green/user.png" width="18" height="18" align="absmiddle"> 
						&nbsp;&nbsp;<%=isModify ? "修改" : "增加"%><%=domainInstance.getCnName()%> 
					</td> 
				</tr> 
			</table> 
 
			<!-- 详细信息 --> 
			<table width="700" align="center" class="detail_table detail_table-bordered detail_table-striped"> 
				<input type="hidden" id="<%=domainInstance.findKeyColumnName()%>" name="<%=domainInstance.findKeyColumnName()%>" value="<%=domainInstance.getKeyValue()%>"> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpsn_name") %>: 
					</td> 
					<td> 
						<input name="cpsn_name" type="text" id="cpsn_name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpsn_name(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdept_num") %>: 
					</td> 
					<td> 
						<input name="cdept_num" type="text" id="cdept_num" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdept_num(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("irecordid") %>: 
					</td> 
					<td> 
						<input name="irecordid" type="text" id="irecordid" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIrecordid(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("rpersontype") %>: 
					</td> 
					<td> 
						<input name="rpersontype" type="text" id="rpersontype" value="<%=StringUtil.getNotEmptyStr(domainInstance.getRpersontype(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("rsex") %>: 
					</td> 
					<td> 
						<input name="rsex" type="text" id="rsex" value="<%=StringUtil.getNotEmptyStr(domainInstance.getRsex(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("dbirthdate") %>: 
					</td> 
					<td> 
						<input name="dbirthdate" type="text" id="dbirthdate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDbirthdate(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("rnativeplace") %>: 
					</td> 
					<td> 
						<input name="rnativeplace" type="text" id="rnativeplace" value="<%=StringUtil.getNotEmptyStr(domainInstance.getRnativeplace(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("rnational") %>: 
					</td> 
					<td> 
						<input name="rnational" type="text" id="rnational" value="<%=StringUtil.getNotEmptyStr(domainInstance.getRnational(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("rhealthstatus") %>: 
					</td> 
					<td> 
						<input name="rhealthstatus" type="text" id="rhealthstatus" value="<%=StringUtil.getNotEmptyStr(domainInstance.getRhealthstatus(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("rmarristatus") %>: 
					</td> 
					<td> 
						<input name="rmarristatus" type="text" id="rmarristatus" value="<%=StringUtil.getNotEmptyStr(domainInstance.getRmarristatus(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("vidno") %>: 
					</td> 
					<td> 
						<input name="vidno" type="text" id="vidno" value="<%=StringUtil.getNotEmptyStr(domainInstance.getVidno(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("mpicture") %>: 
					</td> 
					<td> 
						<input name="mpicture" type="text" id="mpicture" value="<%=StringUtil.getNotEmptyStr(domainInstance.getMpicture(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("rperresidence") %>: 
					</td> 
					<td> 
						<input name="rperresidence" type="text" id="rperresidence" value="<%=StringUtil.getNotEmptyStr(domainInstance.getRperresidence(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("valianame") %>: 
					</td> 
					<td> 
						<input name="valianame" type="text" id="valianame" value="<%=StringUtil.getNotEmptyStr(domainInstance.getValianame(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("djoinworkdate") %>: 
					</td> 
					<td> 
						<input name="djoinworkdate" type="text" id="djoinworkdate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDjoinworkdate(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("denterdate") %>: 
					</td> 
					<td> 
						<input name="denterdate" type="text" id="denterdate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDenterdate(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("dregulardate") %>: 
					</td> 
					<td> 
						<input name="dregulardate" type="text" id="dregulardate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDregulardate(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("vssno") %>: 
					</td> 
					<td> 
						<input name="vssno" type="text" id="vssno" value="<%=StringUtil.getNotEmptyStr(domainInstance.getVssno(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("rworkattend") %>: 
					</td> 
					<td> 
						<input name="rworkattend" type="text" id="rworkattend" value="<%=StringUtil.getNotEmptyStr(domainInstance.getRworkattend(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("vcardno") %>: 
					</td> 
					<td> 
						<input name="vcardno" type="text" id="vcardno" value="<%=StringUtil.getNotEmptyStr(domainInstance.getVcardno(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("rtbmrule") %>: 
					</td> 
					<td> 
						<input name="rtbmrule" type="text" id="rtbmrule" value="<%=StringUtil.getNotEmptyStr(domainInstance.getRtbmrule(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("rcheckinflag") %>: 
					</td> 
					<td> 
						<input name="rcheckinflag" type="text" id="rcheckinflag" value="<%=StringUtil.getNotEmptyStr(domainInstance.getRcheckinflag(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("dlastdate") %>: 
					</td> 
					<td> 
						<input name="dlastdate" type="text" id="dlastdate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDlastdate(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("hrts") %>: 
					</td> 
					<td> 
						<input name="hrts" type="text" id="hrts" value="<%=StringUtil.getNotEmptyStr(domainInstance.getHrts(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("vstatus1") %>: 
					</td> 
					<td> 
						<input name="vstatus1" type="text" id="vstatus1" value="<%=StringUtil.getNotEmptyStr(domainInstance.getVstatus1(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("nstatus2") %>: 
					</td> 
					<td> 
						<input name="nstatus2" type="text" id="nstatus2" value="<%=StringUtil.getNotEmptyStr(domainInstance.getNstatus2(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bpsnperson") %>: 
					</td> 
					<td> 
						<input name="bpsnperson" type="text" id="bpsnperson" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBpsnperson(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpsnmobilephone") %>: 
					</td> 
					<td> 
						<input name="cpsnmobilephone" type="text" id="cpsnmobilephone" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpsnmobilephone(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpsnfphone") %>: 
					</td> 
					<td> 
						<input name="cpsnfphone" type="text" id="cpsnfphone" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpsnfphone(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpsnophone") %>: 
					</td> 
					<td> 
						<input name="cpsnophone" type="text" id="cpsnophone" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpsnophone(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpsninphone") %>: 
					</td> 
					<td> 
						<input name="cpsninphone" type="text" id="cpsninphone" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpsninphone(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpsnemail") %>: 
					</td> 
					<td> 
						<input name="cpsnemail" type="text" id="cpsnemail" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpsnemail(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpsnpostaddr") %>: 
					</td> 
					<td> 
						<input name="cpsnpostaddr" type="text" id="cpsnpostaddr" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpsnpostaddr(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpsnpostcode") %>: 
					</td> 
					<td> 
						<input name="cpsnpostcode" type="text" id="cpsnpostcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpsnpostcode(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpsnfaddr") %>: 
					</td> 
					<td> 
						<input name="cpsnfaddr" type="text" id="cpsnfaddr" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpsnfaddr(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpsnqqcode") %>: 
					</td> 
					<td> 
						<input name="cpsnqqcode" type="text" id="cpsnqqcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpsnqqcode(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpsnurl") %>: 
					</td> 
					<td> 
						<input name="cpsnurl" type="text" id="cpsnurl" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpsnurl(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpsnoseat") %>: 
					</td> 
					<td> 
						<input name="cpsnoseat" type="text" id="cpsnoseat" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpsnoseat(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("denterunitdate") %>: 
					</td> 
					<td> 
						<input name="denterunitdate" type="text" id="denterunitdate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDenterunitdate(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpsnproperty") %>: 
					</td> 
					<td> 
						<input name="cpsnproperty" type="text" id="cpsnproperty" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpsnproperty(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpsnbankcode") %>: 
					</td> 
					<td> 
						<input name="cpsnbankcode" type="text" id="cpsnbankcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpsnbankcode(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpsnaccount") %>: 
					</td> 
					<td> 
						<input name="cpsnaccount" type="text" id="cpsnaccount" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpsnaccount(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("pk_hr_hi_person") %>: 
					</td> 
					<td> 
						<input name="pk_hr_hi_person" type="text" id="pk_hr_hi_person" value="<%=StringUtil.getNotEmptyStr(domainInstance.getPk_hr_hi_person(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bprobation") %>: 
					</td> 
					<td> 
						<input name="bprobation" type="text" id="bprobation" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBprobation(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdutyclass") %>: 
					</td> 
					<td> 
						<input name="cdutyclass" type="text" id="cdutyclass" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdutyclass(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("btaketm") %>: 
					</td> 
					<td> 
						<input name="btaketm" type="text" id="btaketm" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBtaketm(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("mpictureqpb") %>: 
					</td> 
					<td> 
						<input name="mpictureqpb" type="text" id="mpictureqpb" value="<%=StringUtil.getNotEmptyStr(domainInstance.getMpictureqpb(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ridtype") %>: 
					</td> 
					<td> 
						<input name="ridtype" type="text" id="ridtype" value="<%=StringUtil.getNotEmptyStr(domainInstance.getRidtype(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("rcountry") %>: 
					</td> 
					<td> 
						<input name="rcountry" type="text" id="rcountry" value="<%=StringUtil.getNotEmptyStr(domainInstance.getRcountry(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("dleavedate") %>: 
					</td> 
					<td> 
						<input name="dleavedate" type="text" id="dleavedate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDleavedate(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("rfigure") %>: 
					</td> 
					<td> 
						<input name="rfigure" type="text" id="rfigure" value="<%=StringUtil.getNotEmptyStr(domainInstance.getRfigure(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("rworkstatus") %>: 
					</td> 
					<td> 
						<input name="rworkstatus" type="text" id="rworkstatus" value="<%=StringUtil.getNotEmptyStr(domainInstance.getRworkstatus(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("employmentform") %>: 
					</td> 
					<td> 
						<input name="employmentform" type="text" id="employmentform" value="<%=StringUtil.getNotEmptyStr(domainInstance.getEmploymentform(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("rpersonparameters") %>: 
					</td> 
					<td> 
						<input name="rpersonparameters" type="text" id="rpersonparameters" value="<%=StringUtil.getNotEmptyStr(domainInstance.getRpersonparameters(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bdutylock") %>: 
					</td> 
					<td> 
						<input name="bdutylock" type="text" id="bdutylock" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBdutylock(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bpsnshop") %>: 
					</td> 
					<td> 
						<input name="bpsnshop" type="text" id="bpsnshop" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBpsnshop(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cardstate") %>: 
					</td> 
					<td> 
						<input name="cardstate" type="text" id="cardstate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCardstate(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("firsthtbegindate") %>: 
					</td> 
					<td> 
						<input name="firsthtbegindate" type="text" id="firsthtbegindate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getFirsthtbegindate(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("lasthtenddate") %>: 
					</td> 
					<td> 
						<input name="lasthtenddate" type="text" id="lasthtenddate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getLasthtenddate(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpsn_nameen") %>: 
					</td> 
					<td> 
						<input name="cpsn_nameen" type="text" id="cpsn_nameen" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpsn_nameen(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("sysage") %>: 
					</td> 
					<td> 
						<input name="sysage" type="text" id="sysage" value="<%=StringUtil.getNotEmptyStr(domainInstance.getSysage(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("syscompage") %>: 
					</td> 
					<td> 
						<input name="syscompage" type="text" id="syscompage" value="<%=StringUtil.getNotEmptyStr(domainInstance.getSyscompage(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("sysworkage") %>: 
					</td> 
					<td> 
						<input name="sysworkage" type="text" id="sysworkage" value="<%=StringUtil.getNotEmptyStr(domainInstance.getSysworkage(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cregion") %>: 
					</td> 
					<td> 
						<input name="cregion" type="text" id="cregion" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCregion(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("natruetype") %>: 
					</td> 
					<td> 
						<input name="natruetype" type="text" id="natruetype" value="<%=StringUtil.getNotEmptyStr(domainInstance.getNatruetype(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cshifttype") %>: 
					</td> 
					<td> 
						<input name="cshifttype" type="text" id="cshifttype" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCshifttype(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdefaultbc") %>: 
					</td> 
					<td> 
						<input name="cdefaultbc" type="text" id="cdefaultbc" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdefaultbc(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("denterdutyclassdate") %>: 
					</td> 
					<td> 
						<input name="denterdutyclassdate" type="text" id="denterdutyclassdate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDenterdutyclassdate(),"")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cresttype") %>: 
					</td> 
					<td> 
						<input name="cresttype" type="text" id="cresttype" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCresttype(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("jobnumber") %>: 
					</td> 
					<td> 
						<input name="jobnumber" type="text" id="jobnumber" value="<%=StringUtil.getNotEmptyStr(domainInstance.getJobnumber(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("persondepart") %>: 
					</td> 
					<td> 
						<input name="persondepart" type="text" id="persondepart" value="<%=StringUtil.getNotEmptyStr(domainInstance.getPersondepart(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cardeffectivebegintime") %>: 
					</td> 
					<td> 
						<input name="cardeffectivebegintime" type="text" id="cardeffectivebegintime" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCardeffectivebegintime(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cardeffectiveendtime") %>: 
					</td> 
					<td> 
						<input name="cardeffectiveendtime" type="text" id="cardeffectiveendtime" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCardeffectiveendtime(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("keyperson") %>: 
					</td> 
					<td> 
						<input name="keyperson" type="text" id="keyperson" value="<%=StringUtil.getNotEmptyStr(domainInstance.getKeyperson(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cleavereson") %>: 
					</td> 
					<td> 
						<input name="cleavereson" type="text" id="cleavereson" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCleavereson(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("remploystate") %>: 
					</td> 
					<td> 
						<input name="remploystate" type="text" id="remploystate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getRemploystate(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdutylocker") %>: 
					</td> 
					<td> 
						<input name="cdutylocker" type="text" id="cdutylocker" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdutylocker(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdutylockernum") %>: 
					</td> 
					<td> 
						<input name="cdutylockernum" type="text" id="cdutylockernum" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdutylockernum(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cjobcode") %>: 
					</td> 
					<td> 
						<input name="cjobcode" type="text" id="cjobcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCjobcode(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cjobrankcode") %>: 
					</td> 
					<td> 
						<input name="cjobrankcode" type="text" id="cjobrankcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCjobrankcode(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cjobgradecode") %>: 
					</td> 
					<td> 
						<input name="cjobgradecode" type="text" id="cjobgradecode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCjobgradecode(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpsnnowaddress") %>: 
					</td> 
					<td> 
						<input name="cpsnnowaddress" type="text" id="cpsnnowaddress" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpsnnowaddress(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("curgentpsnname") %>: 
					</td> 
					<td> 
						<input name="curgentpsnname" type="text" id="curgentpsnname" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCurgentpsnname(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("curgentpsnphone") %>: 
					</td> 
					<td> 
						<input name="curgentpsnphone" type="text" id="curgentpsnphone" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCurgentpsnphone(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("blongidcard") %>: 
					</td> 
					<td> 
						<input name="blongidcard" type="text" id="blongidcard" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBlongidcard(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cleavetype") %>: 
					</td> 
					<td> 
						<input name="cleavetype" type="text" id="cleavetype" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCleavetype(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdutycode") %>: 
					</td> 
					<td> 
						<input name="cdutycode" type="text" id="cdutycode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCdutycode(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cfax") %>: 
					</td> 
					<td> 
						<input name="cfax" type="text" id="cfax" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCfax(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ctitle") %>: 
					</td> 
					<td> 
						<input name="ctitle" type="text" id="ctitle" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCtitle(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("creportto") %>: 
					</td> 
					<td> 
						<input name="creportto" type="text" id="creportto" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCreportto(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cstartworktime") %>: 
					</td> 
					<td> 
						<input name="cstartworktime" type="text" id="cstartworktime" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCstartworktime(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cendworktime") %>: 
					</td> 
					<td> 
						<input name="cendworktime" type="text" id="cendworktime" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCendworktime(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cloginsubids") %>: 
					</td> 
					<td> 
						<input name="cloginsubids" type="text" id="cloginsubids" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCloginsubids(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cpersonbarcode") %>: 
					</td> 
					<td> 
						<input name="cpersonbarcode" type="text" id="cpersonbarcode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCpersonbarcode(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("bmobilecard") %>: 
					</td> 
					<td> 
						<input name="bmobilecard" type="text" id="bmobilecard" value="<%=StringUtil.getNotEmptyStr(domainInstance.getBmobilecard(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cmobilesites") %>: 
					</td> 
					<td> 
						<input name="cmobilesites" type="text" id="cmobilesites" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCmobilesites(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("voldcard") %>: 
					</td> 
					<td> 
						<input name="voldcard" type="text" id="voldcard" value="<%=StringUtil.getNotEmptyStr(domainInstance.getVoldcard(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("maxleadnum") %>: 
					</td> 
					<td> 
						<input name="maxleadnum" type="text" id="maxleadnum" value="<%=StringUtil.getNotEmptyStr(domainInstance.getMaxleadnum(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("maxpaccountnum") %>: 
					</td> 
					<td> 
						<input name="maxpaccountnum" type="text" id="maxpaccountnum" value="<%=StringUtil.getNotEmptyStr(domainInstance.getMaxpaccountnum(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("maxaccountnum") %>: 
					</td> 
					<td> 
						<input name="maxaccountnum" type="text" id="maxaccountnum" value="<%=StringUtil.getNotEmptyStr(domainInstance.getMaxaccountnum(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("maxopportunitynum") %>: 
					</td> 
					<td> 
						<input name="maxopportunitynum" type="text" id="maxopportunitynum" value="<%=StringUtil.getNotEmptyStr(domainInstance.getMaxopportunitynum(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("leadrcyreg") %>: 
					</td> 
					<td> 
						<input name="leadrcyreg" type="text" id="leadrcyreg" value="<%=StringUtil.getNotEmptyStr(domainInstance.getLeadrcyreg(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("paccountrcyreg") %>: 
					</td> 
					<td> 
						<input name="paccountrcyreg" type="text" id="paccountrcyreg" value="<%=StringUtil.getNotEmptyStr(domainInstance.getPaccountrcyreg(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("opportunityrcyreg") %>: 
					</td> 
					<td> 
						<input name="opportunityrcyreg" type="text" id="opportunityrcyreg" value="<%=StringUtil.getNotEmptyStr(domainInstance.getOpportunityrcyreg(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
			</table> 
			 
			<!-- 工具栏 --> 
			<jsp:include page="../ToolBar/addOrModify_toolbar.jsp" /> 
		</form> 
	</body> 
</html> 
