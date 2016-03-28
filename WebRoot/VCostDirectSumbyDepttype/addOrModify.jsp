<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.inspur.common.dictionary.util.DictionaryUtil"%> 
<%@page import="com.hz.dict.service.DictionaryService"%> 
<%@page import="com.hz.dict.service.IDictionaryService"%> 
<%@page import="com.chengben.obj.VCostDirectSumbyDepttypeObj"%> 
<!-- 基本信息 -->  
<% 
	// 上下文路径 
	String contextPath = request.getContextPath(); 
	 
	// 对象实例 
	VCostDirectSumbyDepttypeObj domainInstance = new VCostDirectSumbyDepttypeObj(); 
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath(); 
 
	// 如果是修改，则获取对象信息 
	Object domainInstanceObj = request.getAttribute("domainInstance"); 
	if (domainInstanceObj != null) 
	{ 
		domainInstance = (VCostDirectSumbyDepttypeObj) domainInstanceObj; 
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
		if(!checkNull("date_month","<%=domainInstance.getPropertyCnName("date_month")%>")) return false; 
		if(!checkNull("department_type_code","<%=domainInstance.getPropertyCnName("department_type_code")%>")) return false; 
		if(!checkNull("department_code","<%=domainInstance.getPropertyCnName("department_code")%>")) return false; 
		if(!checkNull("department_name","<%=domainInstance.getPropertyCnName("department_name")%>")) return false; 
		if(!checkNull("renyuan_jingfei","<%=domainInstance.getPropertyCnName("renyuan_jingfei")%>")) return false; 
		if(!checkNull("weisheng_cailiao","<%=domainInstance.getPropertyCnName("weisheng_cailiao")%>")) return false; 
		if(!checkNull("yaopin","<%=domainInstance.getPropertyCnName("yaopin")%>")) return false; 
		if(!checkNull("guding_zichan_zhejiu","<%=domainInstance.getPropertyCnName("guding_zichan_zhejiu")%>")) return false; 
		if(!checkNull("wuxing_zichan_tanxiao","<%=domainInstance.getPropertyCnName("wuxing_zichan_tanxiao")%>")) return false; 
		if(!checkNull("tiqu_yiliao_fengxian_jijin","<%=domainInstance.getPropertyCnName("tiqu_yiliao_fengxian_jijin")%>")) return false; 
		if(!checkNull("qita_feiyong","<%=domainInstance.getPropertyCnName("qita_feiyong")%>")) return false; 
		if(!checkNull("heji","<%=domainInstance.getPropertyCnName("heji")%>")) return false; 
					 
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
						<%=domainInstance.getPropertyCnName("department_type_code") %>: 
					</td> 
					<td> 
						<input name="department_type_code" type="text" id="department_type_code" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDepartment_type_code(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("department_code") %>: 
					</td> 
					<td> 
						<input name="department_code" type="text" id="department_code" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDepartment_code(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("department_name") %>: 
					</td> 
					<td> 
						<input name="department_name" type="text" id="department_name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDepartment_name(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("renyuan_jingfei") %>: 
					</td> 
					<td> 
						<input name="renyuan_jingfei" type="text" id="renyuan_jingfei" value="<%=StringUtil.getNotEmptyStr(domainInstance.getRenyuan_jingfei(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("weisheng_cailiao") %>: 
					</td> 
					<td> 
						<input name="weisheng_cailiao" type="text" id="weisheng_cailiao" value="<%=StringUtil.getNotEmptyStr(domainInstance.getWeisheng_cailiao(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("yaopin") %>: 
					</td> 
					<td> 
						<input name="yaopin" type="text" id="yaopin" value="<%=StringUtil.getNotEmptyStr(domainInstance.getYaopin(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("guding_zichan_zhejiu") %>: 
					</td> 
					<td> 
						<input name="guding_zichan_zhejiu" type="text" id="guding_zichan_zhejiu" value="<%=StringUtil.getNotEmptyStr(domainInstance.getGuding_zichan_zhejiu(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("wuxing_zichan_tanxiao") %>: 
					</td> 
					<td> 
						<input name="wuxing_zichan_tanxiao" type="text" id="wuxing_zichan_tanxiao" value="<%=StringUtil.getNotEmptyStr(domainInstance.getWuxing_zichan_tanxiao(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("tiqu_yiliao_fengxian_jijin") %>: 
					</td> 
					<td> 
						<input name="tiqu_yiliao_fengxian_jijin" type="text" id="tiqu_yiliao_fengxian_jijin" value="<%=StringUtil.getNotEmptyStr(domainInstance.getTiqu_yiliao_fengxian_jijin(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("qita_feiyong") %>: 
					</td> 
					<td> 
						<input name="qita_feiyong" type="text" id="qita_feiyong" value="<%=StringUtil.getNotEmptyStr(domainInstance.getQita_feiyong(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("heji") %>: 
					</td> 
					<td> 
						<input name="heji" type="text" id="heji" value="<%=StringUtil.getNotEmptyStr(domainInstance.getHeji(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
			</table> 
			 
			<!-- 工具栏 --> 
			<jsp:include page="../ToolBar/addOrModify_toolbar.jsp" /> 
		</form> 
	</body> 
</html> 
