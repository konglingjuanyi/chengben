<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.chengben.obj.VCostFinalObj"%> 
<% 
	// 当前上下文路径  
	String contextPath = request.getContextPath();  
  
	// 该功能对象实例  
	VCostFinalObj domainInstance = (VCostFinalObj) request.getAttribute("domainInstance");  
	// 该功能路径  
	String basePath = domainInstance.getBasePath();  
%> 
<html> 
	<head> 
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
		<title><%=domainInstance.getCnName()%>详情</title> 
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
					<img src="../images/svg/heavy/green/stats.png" width="18" height="18" align="absmiddle"> 
					&nbsp;&nbsp;<%=domainInstance.getCnName()%>信息 
				</td> 
			</tr> 
		</table> 
		<!-- 详细信息 --> 
		<table width="600" align="center" class="detail_table detail_table-bordered detail_table-striped"> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("date_month") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getDate_month())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("department_type") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getDepartment_type())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("department_code") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getDepartment_code())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("department_name") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getDepartment_name())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("renyuan_jingfei") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getRenyuan_jingfei())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("renyuan_jingfei_share") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getRenyuan_jingfei_share())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("renyuan_jingfei_sum") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getRenyuan_jingfei_sum())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("weisheng_cailiao") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getWeisheng_cailiao())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("weisheng_cailiao_share") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getWeisheng_cailiao_share())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("weisheng_cailiao_sum") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getWeisheng_cailiao_sum())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("yaopin") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getYaopin())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("yaopin_share") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getYaopin_share())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("yaopin_sum") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getYaopin_sum())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("guding_zichan_zhejiu") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getGuding_zichan_zhejiu())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("guding_zichan_zhejiu_share") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getGuding_zichan_zhejiu_share())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("guding_zichan_zhejiu_sum") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getGuding_zichan_zhejiu_sum())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("wuxing_zichan_tanxiao") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getWuxing_zichan_tanxiao())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("wuxing_zichan_tanxiao_share") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getWuxing_zichan_tanxiao_share())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("wuxing_zichan_tanxiao_sum") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getWuxing_zichan_tanxiao_sum())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("tiqu_yiliao_fengxian_jijin") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getTiqu_yiliao_fengxian_jijin())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("tiqu_yiliao_fengxian_jijin_share") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getTiqu_yiliao_fengxian_jijin_share())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("tiqu_yiliao_fengxian_jijin_sum") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getTiqu_yiliao_fengxian_jijin_sum())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("qita_feiyong") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getQita_feiyong())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("qita_feiyong_share") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getQita_feiyong_share())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("qita_feiyong_sum") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getQita_feiyong_sum())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("heji") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getHeji())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("heji_share") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getHeji_share())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("heji_sum") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getHeji_sum())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("direct_total") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getDirect_total())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("share_total") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getShare_total())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("total") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getTotal())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("renyuan_jingfei_rate") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getRenyuan_jingfei_rate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("weisheng_cailiao_rate") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getWeisheng_cailiao_rate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("yaopin_rate") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getYaopin_rate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("guding_zichan_zhejiu_rate") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getGuding_zichan_zhejiu_rate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("wuxing_zichan_tanxiao_rate") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getWuxing_zichan_tanxiao_rate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("tiqu_yiliao_fengxian_jijin_rate") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getTiqu_yiliao_fengxian_jijin_rate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("qita_feiyong_rate") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getQita_feiyong_rate())%></td> 
			</tr> 
			<tr> 
				<td> 
					<%=domainInstance.getPropertyCnName("heji_rate") %>: 
				</td> 
				<td><%=StringUtil.getNotEmptyStr(domainInstance.getHeji_rate())%></td> 
			</tr> 
		</table> 
		 
		<!-- 工具栏 --> 
		<jsp:include page="../ToolBar/detail_toolbar.jsp"/> 
	</body> 
</html> 
