<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<!-- 引入类 -->
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.wuyg.common.util.StringUtil"%>
<%@page import="com.inspur.common.dictionary.util.DictionaryUtil"%>
<%@page import="com.hz.dict.service.DictionaryService"%>
<%@page import="com.hz.dict.service.IDictionaryService"%>
<%@page import="com.inspur.common.dictionary.pojo.DictItem"%>
<%@page import="com.chengben.obj.AccountingSubjectObj"%>
<!-- 基本信息 -->
<%
	// 上下文路径 
	String contextPath = request.getContextPath();

	// 对象实例 
	AccountingSubjectObj domainInstance = new AccountingSubjectObj();
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath();

	// 如果是修改，则获取对象信息 
	Object domainInstanceObj = request.getAttribute("domainInstance");
	if (domainInstanceObj != null)
	{
		domainInstance = (AccountingSubjectObj) domainInstanceObj;
	}

	List<AccountingSubjectObj> domainInstanceList = new ArrayList<AccountingSubjectObj>();
	Object domainInstanceListObj = request.getAttribute("domainInstanceList");
	if (domainInstanceListObj != null)
	{
		domainInstanceList = (List<AccountingSubjectObj>) domainInstanceListObj;
	}
%>
<html>
	<head>
		<base target="_self" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no" />
		<title><%="批量设置" + domainInstance.getCnName()%></title>
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
			var source_acc_subject_checked=false;
			$("[name='acc_id']").each(function(){
				if($(this).prop("checked")){
				source_acc_subject_checked=true;
				}
			});
			
			if(source_acc_subject_checked==false)
			{
				alert("没有选择需设置的科目");
				return false;
			}
			
			if(!checkNull("opposite_acc_code","<%=domainInstance.getPropertyCnName("opposite_acc_code")%>")) return false; 
						 
			submit() 
		} 
		 
		// 提交保存或修改 
		function submit() 
		{ 
			$("#addOrModifyForm").submit(); 
		} 
		</script>
	</head>
	<body>
		<form name="addOrModifyForm" id="addOrModifyForm" action="<%=contextPath%>/<%=basePath%>/Servlet?method=addOrModify4Batch" method="post">
			
			<!-- 表格标题 -->
			<table width="700" align="center" class="title_table">
				<tr>
					<td>
						<img src="../images/svg/heavy/green/list.png" width="18" height="18" align="absmiddle">
						&nbsp;&nbsp;批量设置<%=domainInstance.getCnName()%>类型
					</td>
				</tr>
			</table>

			<!-- 详细信息 -->
			<table width="700" align="center">
				<tr>
					<td valign="top" align="center">
						<h3>
							选择需设置的科目
						</h3>
						<table width="400" class="table table-bordered table-striped" style="margin-top: 0px;" border="0" cellspacing="0" cellpadding="0">
							<thead>
								<tr>
									<th>
										<input type="checkbox" name="checkAllBox" id="checkAllBox" value="checkbox">
									</th>
									<th>
										<%=domainInstance.getPropertyCnName("acc_code")%>
									</th>
									<th>
										<%=domainInstance.getPropertyCnName("acc_name")%>
									</th>
									<th>
										<%=domainInstance.getPropertyCnName("debit_or_credit")%>
									</th>
								</tr>
							</thead>
							<%
								for (int i = 0; i < domainInstanceList.size(); i++)
								{
									AccountingSubjectObj o = domainInstanceList.get(i);
							%>
							<tr>
								<td>
									<input type="checkbox" name="acc_id" id="acc_id" value="<%=o.getId()%>">
								</td>
								<td><%=o.getAcc_code()%></td>
								<td><%=o.getAcc_name()%></td>
								<td><%=o.getDebit_or_credit()%></td>
							</tr>
							<%
								}
							%>
						</table>
					</td>
					<td width="300" valign="top" align="center">
						<table>
							<tr>
								<td>
									<h3>
										设置对方会计科目
									</h3>
								</td>
							<tr>
								<td>
									会计科目<%=DictionaryUtil.getSelectHtml(new DictionaryService().getDictItemsByDictName("会计科目字典", false), "opposite_acc_code", "", StringUtil.getNotEmptyStr(domainInstance.getOpposite_acc_code(), ""), "notEmpty")%>
									<font color="red">*</font>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

			<!-- 工具栏 -->
			<jsp:include page="../ToolBar/addOrModify_toolbar.jsp" />
		</form>


		<script>
		
		$("#checkAllBox").click(function(){
		if($(this).prop("checked")==true)
		{
			$("[name='acc_id']").prop("checked",true);//全选
		}
		else
		{
			$("[name='acc_id']").prop("checked",false);//取消全选
		}
	});
	
	// 绑定关闭事件
			$(window).unload(function(){
			  	// 父窗口刷新
				var parent = window.dialogArguments; 
				parent.execScript("freshCurrentPage()","javascript"); 
			});
	//$("#source_id").click();
	</script>
	</body>
</html>
