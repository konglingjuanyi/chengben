<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.inspur.common.dictionary.util.DictionaryUtil"%> 
<%@page import="com.hz.dict.service.DictionaryService"%> 
<%@page import="com.hz.dict.service.IDictionaryService"%> 
<%@page import="com.chengben.obj.VCostFinalObj"%> 
<!-- 基本信息 -->  
<% 
	// 上下文路径 
	String contextPath = request.getContextPath(); 
	 
	// 对象实例 
	VCostFinalObj domainInstance = new VCostFinalObj(); 
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath(); 
 
	// 如果是修改，则获取对象信息 
	Object domainInstanceObj = request.getAttribute("domainInstance"); 
	if (domainInstanceObj != null) 
	{ 
		domainInstance = (VCostFinalObj) domainInstanceObj; 
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
		<title><%=isModify ? "修改" + domainInstance.getCnName() : "增加" + domainInstance.getCnName()%></title> 
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
		if(!checkNull("department_type","<%=domainInstance.getPropertyCnName("department_type")%>")) return false; 
		if(!checkNull("department_code","<%=domainInstance.getPropertyCnName("department_code")%>")) return false; 
		if(!checkNull("department_name","<%=domainInstance.getPropertyCnName("department_name")%>")) return false; 
		if(!checkNull("renyuan_jingfei","<%=domainInstance.getPropertyCnName("renyuan_jingfei")%>")) return false; 
		if(!checkNull("renyuan_jingfei_share","<%=domainInstance.getPropertyCnName("renyuan_jingfei_share")%>")) return false; 
		if(!checkNull("renyuan_jingfei_sum","<%=domainInstance.getPropertyCnName("renyuan_jingfei_sum")%>")) return false; 
		if(!checkNull("weisheng_cailiao","<%=domainInstance.getPropertyCnName("weisheng_cailiao")%>")) return false; 
		if(!checkNull("weisheng_cailiao_share","<%=domainInstance.getPropertyCnName("weisheng_cailiao_share")%>")) return false; 
		if(!checkNull("weisheng_cailiao_sum","<%=domainInstance.getPropertyCnName("weisheng_cailiao_sum")%>")) return false; 
		if(!checkNull("yaopin","<%=domainInstance.getPropertyCnName("yaopin")%>")) return false; 
		if(!checkNull("yaopin_share","<%=domainInstance.getPropertyCnName("yaopin_share")%>")) return false; 
		if(!checkNull("yaopin_sum","<%=domainInstance.getPropertyCnName("yaopin_sum")%>")) return false; 
		if(!checkNull("guding_zichan_zhejiu","<%=domainInstance.getPropertyCnName("guding_zichan_zhejiu")%>")) return false; 
		if(!checkNull("guding_zichan_zhejiu_share","<%=domainInstance.getPropertyCnName("guding_zichan_zhejiu_share")%>")) return false; 
		if(!checkNull("guding_zichan_zhejiu_sum","<%=domainInstance.getPropertyCnName("guding_zichan_zhejiu_sum")%>")) return false; 
		if(!checkNull("wuxing_zichan_tanxiao","<%=domainInstance.getPropertyCnName("wuxing_zichan_tanxiao")%>")) return false; 
		if(!checkNull("wuxing_zichan_tanxiao_share","<%=domainInstance.getPropertyCnName("wuxing_zichan_tanxiao_share")%>")) return false; 
		if(!checkNull("wuxing_zichan_tanxiao_sum","<%=domainInstance.getPropertyCnName("wuxing_zichan_tanxiao_sum")%>")) return false; 
		if(!checkNull("tiqu_yiliao_fengxian_jijin","<%=domainInstance.getPropertyCnName("tiqu_yiliao_fengxian_jijin")%>")) return false; 
		if(!checkNull("tiqu_yiliao_fengxian_jijin_share","<%=domainInstance.getPropertyCnName("tiqu_yiliao_fengxian_jijin_share")%>")) return false; 
		if(!checkNull("tiqu_yiliao_fengxian_jijin_sum","<%=domainInstance.getPropertyCnName("tiqu_yiliao_fengxian_jijin_sum")%>")) return false; 
		if(!checkNull("qita_feiyong","<%=domainInstance.getPropertyCnName("qita_feiyong")%>")) return false; 
		if(!checkNull("qita_feiyong_share","<%=domainInstance.getPropertyCnName("qita_feiyong_share")%>")) return false; 
		if(!checkNull("qita_feiyong_sum","<%=domainInstance.getPropertyCnName("qita_feiyong_sum")%>")) return false; 
		if(!checkNull("heji","<%=domainInstance.getPropertyCnName("heji")%>")) return false; 
		if(!checkNull("heji_share","<%=domainInstance.getPropertyCnName("heji_share")%>")) return false; 
		if(!checkNull("heji_sum","<%=domainInstance.getPropertyCnName("heji_sum")%>")) return false; 
		if(!checkNull("direct_total","<%=domainInstance.getPropertyCnName("direct_total")%>")) return false; 
		if(!checkNull("share_total","<%=domainInstance.getPropertyCnName("share_total")%>")) return false; 
		if(!checkNull("total","<%=domainInstance.getPropertyCnName("total")%>")) return false; 
		if(!checkNull("renyuan_jingfei_rate","<%=domainInstance.getPropertyCnName("renyuan_jingfei_rate")%>")) return false; 
		if(!checkNull("weisheng_cailiao_rate","<%=domainInstance.getPropertyCnName("weisheng_cailiao_rate")%>")) return false; 
		if(!checkNull("yaopin_rate","<%=domainInstance.getPropertyCnName("yaopin_rate")%>")) return false; 
		if(!checkNull("guding_zichan_zhejiu_rate","<%=domainInstance.getPropertyCnName("guding_zichan_zhejiu_rate")%>")) return false; 
		if(!checkNull("wuxing_zichan_tanxiao_rate","<%=domainInstance.getPropertyCnName("wuxing_zichan_tanxiao_rate")%>")) return false; 
		if(!checkNull("tiqu_yiliao_fengxian_jijin_rate","<%=domainInstance.getPropertyCnName("tiqu_yiliao_fengxian_jijin_rate")%>")) return false; 
		if(!checkNull("qita_feiyong_rate","<%=domainInstance.getPropertyCnName("qita_feiyong_rate")%>")) return false; 
		if(!checkNull("heji_rate","<%=domainInstance.getPropertyCnName("heji_rate")%>")) return false; 
					 
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
						<img src="../images/svg/heavy/green/stats.png" width="18" height="18" align="absmiddle"> 
						&nbsp;&nbsp;<%=isModify ? "修改" : "增加"%><%=domainInstance.getCnName()%> 
					</td> 
				</tr> 
			</table> 
 
			<!-- 详细信息 --> 
			<table width="700" align="center" class="detail_table detail_table-bordered detail_table-striped"> 
				<input type="hidden" id="<%=domainInstance.findKeyColumnName()%>" name="<%=domainInstance.findKeyColumnName()%>" value="<%=domainInstance.getKeyValue()%>"> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("department_type") %>: 
					</td> 
					<td> 
						<input name="department_type" type="text" id="department_type" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDepartment_type(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("renyuan_jingfei_share") %>: 
					</td> 
					<td> 
						<input name="renyuan_jingfei_share" type="text" id="renyuan_jingfei_share" value="<%=StringUtil.getNotEmptyStr(domainInstance.getRenyuan_jingfei_share(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("renyuan_jingfei_sum") %>: 
					</td> 
					<td> 
						<input name="renyuan_jingfei_sum" type="text" id="renyuan_jingfei_sum" value="<%=StringUtil.getNotEmptyStr(domainInstance.getRenyuan_jingfei_sum(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("weisheng_cailiao_share") %>: 
					</td> 
					<td> 
						<input name="weisheng_cailiao_share" type="text" id="weisheng_cailiao_share" value="<%=StringUtil.getNotEmptyStr(domainInstance.getWeisheng_cailiao_share(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("weisheng_cailiao_sum") %>: 
					</td> 
					<td> 
						<input name="weisheng_cailiao_sum" type="text" id="weisheng_cailiao_sum" value="<%=StringUtil.getNotEmptyStr(domainInstance.getWeisheng_cailiao_sum(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("yaopin_share") %>: 
					</td> 
					<td> 
						<input name="yaopin_share" type="text" id="yaopin_share" value="<%=StringUtil.getNotEmptyStr(domainInstance.getYaopin_share(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("yaopin_sum") %>: 
					</td> 
					<td> 
						<input name="yaopin_sum" type="text" id="yaopin_sum" value="<%=StringUtil.getNotEmptyStr(domainInstance.getYaopin_sum(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("guding_zichan_zhejiu_share") %>: 
					</td> 
					<td> 
						<input name="guding_zichan_zhejiu_share" type="text" id="guding_zichan_zhejiu_share" value="<%=StringUtil.getNotEmptyStr(domainInstance.getGuding_zichan_zhejiu_share(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("guding_zichan_zhejiu_sum") %>: 
					</td> 
					<td> 
						<input name="guding_zichan_zhejiu_sum" type="text" id="guding_zichan_zhejiu_sum" value="<%=StringUtil.getNotEmptyStr(domainInstance.getGuding_zichan_zhejiu_sum(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("wuxing_zichan_tanxiao_share") %>: 
					</td> 
					<td> 
						<input name="wuxing_zichan_tanxiao_share" type="text" id="wuxing_zichan_tanxiao_share" value="<%=StringUtil.getNotEmptyStr(domainInstance.getWuxing_zichan_tanxiao_share(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("wuxing_zichan_tanxiao_sum") %>: 
					</td> 
					<td> 
						<input name="wuxing_zichan_tanxiao_sum" type="text" id="wuxing_zichan_tanxiao_sum" value="<%=StringUtil.getNotEmptyStr(domainInstance.getWuxing_zichan_tanxiao_sum(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("tiqu_yiliao_fengxian_jijin_share") %>: 
					</td> 
					<td> 
						<input name="tiqu_yiliao_fengxian_jijin_share" type="text" id="tiqu_yiliao_fengxian_jijin_share" value="<%=StringUtil.getNotEmptyStr(domainInstance.getTiqu_yiliao_fengxian_jijin_share(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("tiqu_yiliao_fengxian_jijin_sum") %>: 
					</td> 
					<td> 
						<input name="tiqu_yiliao_fengxian_jijin_sum" type="text" id="tiqu_yiliao_fengxian_jijin_sum" value="<%=StringUtil.getNotEmptyStr(domainInstance.getTiqu_yiliao_fengxian_jijin_sum(),"")%>" size="20"  > 
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
						<%=domainInstance.getPropertyCnName("qita_feiyong_share") %>: 
					</td> 
					<td> 
						<input name="qita_feiyong_share" type="text" id="qita_feiyong_share" value="<%=StringUtil.getNotEmptyStr(domainInstance.getQita_feiyong_share(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("qita_feiyong_sum") %>: 
					</td> 
					<td> 
						<input name="qita_feiyong_sum" type="text" id="qita_feiyong_sum" value="<%=StringUtil.getNotEmptyStr(domainInstance.getQita_feiyong_sum(),"")%>" size="20"  > 
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
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("heji_share") %>: 
					</td> 
					<td> 
						<input name="heji_share" type="text" id="heji_share" value="<%=StringUtil.getNotEmptyStr(domainInstance.getHeji_share(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("heji_sum") %>: 
					</td> 
					<td> 
						<input name="heji_sum" type="text" id="heji_sum" value="<%=StringUtil.getNotEmptyStr(domainInstance.getHeji_sum(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("direct_total") %>: 
					</td> 
					<td> 
						<input name="direct_total" type="text" id="direct_total" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDirect_total(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("share_total") %>: 
					</td> 
					<td> 
						<input name="share_total" type="text" id="share_total" value="<%=StringUtil.getNotEmptyStr(domainInstance.getShare_total(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("total") %>: 
					</td> 
					<td> 
						<input name="total" type="text" id="total" value="<%=StringUtil.getNotEmptyStr(domainInstance.getTotal(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("renyuan_jingfei_rate") %>: 
					</td> 
					<td> 
						<input name="renyuan_jingfei_rate" type="text" id="renyuan_jingfei_rate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getRenyuan_jingfei_rate(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("weisheng_cailiao_rate") %>: 
					</td> 
					<td> 
						<input name="weisheng_cailiao_rate" type="text" id="weisheng_cailiao_rate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getWeisheng_cailiao_rate(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("yaopin_rate") %>: 
					</td> 
					<td> 
						<input name="yaopin_rate" type="text" id="yaopin_rate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getYaopin_rate(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("guding_zichan_zhejiu_rate") %>: 
					</td> 
					<td> 
						<input name="guding_zichan_zhejiu_rate" type="text" id="guding_zichan_zhejiu_rate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getGuding_zichan_zhejiu_rate(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("wuxing_zichan_tanxiao_rate") %>: 
					</td> 
					<td> 
						<input name="wuxing_zichan_tanxiao_rate" type="text" id="wuxing_zichan_tanxiao_rate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getWuxing_zichan_tanxiao_rate(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("tiqu_yiliao_fengxian_jijin_rate") %>: 
					</td> 
					<td> 
						<input name="tiqu_yiliao_fengxian_jijin_rate" type="text" id="tiqu_yiliao_fengxian_jijin_rate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getTiqu_yiliao_fengxian_jijin_rate(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("qita_feiyong_rate") %>: 
					</td> 
					<td> 
						<input name="qita_feiyong_rate" type="text" id="qita_feiyong_rate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getQita_feiyong_rate(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("heji_rate") %>: 
					</td> 
					<td> 
						<input name="heji_rate" type="text" id="heji_rate" value="<%=StringUtil.getNotEmptyStr(domainInstance.getHeji_rate(),"")%>" size="20"  > 
						<font color="red">*</font> 
					</td> 
				</tr> 
			</table> 
			 
			<!-- 工具栏 --> 
			<jsp:include page="../ToolBar/addOrModify_toolbar.jsp" /> 
		</form> 
	</body> 
</html> 
