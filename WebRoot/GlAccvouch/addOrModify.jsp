<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.inspur.common.dictionary.util.DictionaryUtil"%> 
<%@page import="com.hz.dict.service.DictionaryService"%> 
<%@page import="com.hz.dict.service.IDictionaryService"%> 
<%@page import="com.gl.obj.GlAccvouchObj"%> 
<!-- 基本信息 -->  
<% 
	// 上下文路径 
	String contextPath = request.getContextPath(); 
	 
	// 对象实例 
	GlAccvouchObj domainInstance = new GlAccvouchObj(); 
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath(); 
 
	// 如果是修改，则获取对象信息 
	Object domainInstanceObj = request.getAttribute("domainInstance"); 
	if (domainInstanceObj != null) 
	{ 
		domainInstance = (GlAccvouchObj) domainInstanceObj; 
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
		if(!checkNull("i_id","<%=domainInstance.getPropertyCnName("i_id")%>")) return false; 
		if(!checkNull("iperiod","<%=domainInstance.getPropertyCnName("iperiod")%>")) return false; 
		if(!checkNull("csign","<%=domainInstance.getPropertyCnName("csign")%>")) return false; 
		if(!checkNull("ino_id","<%=domainInstance.getPropertyCnName("ino_id")%>")) return false; 
		if(!checkNull("inid","<%=domainInstance.getPropertyCnName("inid")%>")) return false; 
		if(!checkNull("dbill_date","<%=domainInstance.getPropertyCnName("dbill_date")%>")) return false; 
		if(!checkNull("idoc","<%=domainInstance.getPropertyCnName("idoc")%>")) return false; 
		if(!checkNull("cbill","<%=domainInstance.getPropertyCnName("cbill")%>")) return false; 
		if(!checkNull("ccode","<%=domainInstance.getPropertyCnName("ccode")%>")) return false; 
		if(!checkNull("md","<%=domainInstance.getPropertyCnName("md")%>")) return false; 
		if(!checkNull("mc","<%=domainInstance.getPropertyCnName("mc")%>")) return false; 
		if(!checkNull("md_f","<%=domainInstance.getPropertyCnName("md_f")%>")) return false; 
		if(!checkNull("mc_f","<%=domainInstance.getPropertyCnName("mc_f")%>")) return false; 
		if(!checkNull("nfrat","<%=domainInstance.getPropertyCnName("nfrat")%>")) return false; 
		if(!checkNull("nd_s","<%=domainInstance.getPropertyCnName("nd_s")%>")) return false; 
		if(!checkNull("nc_s","<%=domainInstance.getPropertyCnName("nc_s")%>")) return false; 
		if(!checkNull("cdept_id","<%=domainInstance.getPropertyCnName("cdept_id")%>")) return false; 
		if(!checkNull("rowguid","<%=domainInstance.getPropertyCnName("rowguid")%>")) return false; 
					 
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
					encodeURI("Servlet?method=checkId4this&isFromUrl=true&id=0&<%=keyCol%>="+$("#<%=keyCol%>").val()),  
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
						<img src="../images/svg/heavy/green/list.png" width="18" height="18" align="absmiddle"> 
						&nbsp;&nbsp;<%=isModify ? "修改" : "增加"%><%=domainInstance.getCnName()%> 
					</td> 
				</tr> 
			</table> 
 
			<!-- 详细信息 --> 
			<table width="700" align="center" class="detail_table detail_table-bordered detail_table-striped"> 
				<input type="hidden" id="<%=domainInstance.findKeyColumnName()%>" name="<%=domainInstance.findKeyColumnName()%>" value="<%=domainInstance.getKeyValue()%>"> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("iperiod") %>: 
					</td> 
					<td> 
						<input name="iperiod" type="text" id="iperiod" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIperiod(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("csign") %>: 
					</td> 
					<td> 
						<input name="csign" type="text" id="csign" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCsign(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ino_id") %>: 
					</td> 
					<td> 
						<input name="ino_id" type="text" id="ino_id" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIno_id(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("inid") %>: 
					</td> 
					<td> 
						<input name="inid" type="text" id="inid" value="<%=StringUtil.getNotEmptyStr(domainInstance.getInid(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("dbill_date") %>: 
					</td> 
					<td> 
						<input name="dbill_date" type="text" id="dbill_date" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDbill_date(),"")%>" size="20" onFocus="WdatePicker({isShowClear:false,readOnly:false,highLineWeekDay:true,dateFmt:'yyyy-MM-dd'})" > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("idoc") %>: 
					</td> 
					<td> 
						<input name="idoc" type="text" id="idoc" value="<%=StringUtil.getNotEmptyStr(domainInstance.getIdoc(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cbill") %>: 
					</td> 
					<td> 
						<input name="cbill" type="text" id="cbill" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCbill(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("ccode") %>: 
					</td> 
					<td> 
						<input name="ccode" type="text" id="ccode" value="<%=StringUtil.getNotEmptyStr(domainInstance.getCcode(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("md") %>: 
					</td> 
					<td> 
						<input name="md" type="text" id="md" value="<%=StringUtil.getNotEmptyStr(domainInstance.getMd(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("mc") %>: 
					</td> 
					<td> 
						<input name="mc" type="text" id="mc" value="<%=StringUtil.getNotEmptyStr(domainInstance.getMc(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("md_f") %>: 
					</td> 
					<td> 
						<input name="md_f" type="text" id="md_f" value="<%=StringUtil.getNotEmptyStr(domainInstance.getMd_f(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("mc_f") %>: 
					</td> 
					<td> 
						<input name="mc_f" type="text" id="mc_f" value="<%=StringUtil.getNotEmptyStr(domainInstance.getMc_f(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("nfrat") %>: 
					</td> 
					<td> 
						<input name="nfrat" type="text" id="nfrat" value="<%=StringUtil.getNotEmptyStr(domainInstance.getNfrat(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("nd_s") %>: 
					</td> 
					<td> 
						<input name="nd_s" type="text" id="nd_s" value="<%=StringUtil.getNotEmptyStr(domainInstance.getNd_s(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("nc_s") %>: 
					</td> 
					<td> 
						<input name="nc_s" type="text" id="nc_s" value="<%=StringUtil.getNotEmptyStr(domainInstance.getNc_s(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("cdept_id") %>: 
					</td> 
					<td> 
						<%=DictionaryUtil.getSelectHtml(new DictionaryService().getDictItemsByDictName("核算科室字典", false), "cdept_id", "", StringUtil.getNotEmptyStr(domainInstance.getCdept_id(), ""), "notEmpty")%> 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("rowguid") %>: 
					</td> 
					<td> 
						<input name="rowguid" type="text" id="rowguid" value="<%=StringUtil.getNotEmptyStr(domainInstance.getRowguid(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
			</table> 
			 
			<!-- 工具栏 --> 
			<jsp:include page="../ToolBar/addOrModify_toolbar.jsp" /> 
		</form> 
	</body> 
</html> 
