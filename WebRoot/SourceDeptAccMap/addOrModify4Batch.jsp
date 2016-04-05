<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
<!-- 引入类 -->
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.wuyg.common.util.StringUtil"%>
<%@page import="com.inspur.common.dictionary.util.DictionaryUtil"%>
<%@page import="com.hz.dict.service.DictionaryService"%>
<%@page import="com.hz.dict.service.IDictionaryService"%>
<%@page import="com.chengben.obj.SourceDeptAccMapObj"%>
<%@page import="com.inspur.common.dictionary.pojo.DictItem"%>
<!-- 基本信息 -->
<%
	// 上下文路径 
	String contextPath = request.getContextPath();

	// 对象实例 
	SourceDeptAccMapObj domainInstance = new SourceDeptAccMapObj();
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath();

	// 如果是修改，则获取对象信息 
	Object domainInstanceObj = request.getAttribute("domainInstance");
	if (domainInstanceObj != null)
	{
		domainInstance = (SourceDeptAccMapObj) domainInstanceObj;
	}

	List<SourceDeptAccMapObj> domainInstanceList = new ArrayList<SourceDeptAccMapObj>();
	Object domainInstanceListObj = request.getAttribute("domainInstanceList");
	if (domainInstanceListObj != null)
	{
		domainInstanceList = (List<SourceDeptAccMapObj>) domainInstanceListObj;
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
			$("[name='source_dept_acc_id']").each(function(){
				if($(this).prop("checked")){
				source_acc_subject_checked=true;
				}
			});
			
			if(source_acc_subject_checked==false)
			{
				alert("没有选择外部接口科目");
				return false;
			}
			
			if(!checkNull("source_acc_subject","<%=domainInstance.getPropertyCnName("source_acc_subject")%>")) return false; 
			if(!checkNull("dest_acc_subject","<%=domainInstance.getPropertyCnName("dest_acc_subject")%>")) return false; 
						 
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
			<input type="hidden" id="source_system" name="source_system" value="<%=request.getAttribute("source_system") %>">
			
			<!-- 表格标题 -->
			<table width="700" align="center" class="title_table">
				<tr>
					<td>
						<img src="../images/svg/heavy/green/list.png" width="18" height="18" align="absmiddle">
						&nbsp;&nbsp;批量设置<%=domainInstance.getCnName()%>
					</td>
				</tr>
			</table>

			<!-- 详细信息 -->
			<table width="700" align="center">
				<tr>
					<td valign="top" align="center">
						<h3>
							选择外部接口科目
						</h3>
						<table width="400" class="table table-bordered table-striped" style="margin-top: 0px;" border="0" cellspacing="0" cellpadding="0">
							<thead>
								<tr>
									<th>
										<input type="checkbox" name="checkAllBox" id="checkAllBox" value="checkbox" >
									</th>
									<th>
										<%=domainInstance.getPropertyCnName("dept_share_type") %>
									</th>
									<th>
										<%=domainInstance.getPropertyCnName("source_acc_subject") %>
									</th>
									<th>
										<%=domainInstance.getPropertyCnName("dest_acc_subject") %>
									</th>
								</tr>
							</thead>
							<%
								for (int i = 0; i < domainInstanceList.size(); i++)
								{
									SourceDeptAccMapObj o = domainInstanceList.get(i);
							%>
							<tr>
								<td>
									<input type="checkbox" name="source_dept_acc_id" id="source_dept_acc_id" value="<%=o.getId()%>" >
								</td>
								<td><%=new DictionaryService().getDictValueByDictKey("科室类别字典", o.getDept_share_type())%></td>
								<td><%=o.getSource_acc_subject()%></td>
								<td><%=new DictionaryService().getDictValueByDictKey("会计科目字典", o.getDest_acc_subject(), true)%></td>
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
										设置对应的总账系统会计科目
									</h3>
								</td>
							<tr>
								<td>
									总账会计科目<input type="hidden" name="dest_acc_subject" id="dest_acc_subject" onClick="openDictTable('dest')">
									<input type="text" name="dest_acc_subject_name" id="dest_acc_subject_name" onClick="openDictTable('dest')">
									<!-- 总账会计科目字典信息表 -->
									<table width="100%" id="dest_dict_table" style="display: none; background-color: #ff9900; margin-left: auto; margin-right: auto; padding: 4px;" border="0" align="center" cellpadding="0" cellspacing="0">
										<tr>
											<td align="right">
												<input type="button" name="close_btn" class="button button_close" value="" onClick="closeDictTable()">
												<br>
											</td>
										</tr>
										<tr>
											<td align="center">
												<h3>
													请从下表中选择总账会计科目
												</h3>
												<br>
											</td>
										</tr>
										<tr>
											<td align="center">
												<input type="text" id="dest_dict_search_input" name="dest_dict_search_input" size="20">
												<br>
											</td>
										</tr>
										<tr>
											<td>
												<table id="dest_dict_table_list" width="100%" class="table table-bordered table-striped" align="center">
													<thead>
														<tr>
															<th>
																选择
															</th>
															<th>
																编号
															</th>
															<th>
																名称
															</th>
														</tr>
													</thead>
													<%
														List<DictItem> items = new DictionaryService().getDictItemsByDictName("会计科目字典", true);
														for (int i = 1; i < items.size(); i++)
														{
															DictItem item = items.get(i);
													%>
													<tr>
														<td>
															<input type="radio" name="dest_radiao" value="<%=item.getK()%>" label="<%=item.getV()%>" onClick="confirmSelect('dest',this);">
														</td>
														<td><%=item.getK()%></td>
														<td><%=item.getV()%></td>
													</tr>
													<%
														}
													%>

												</table>
											</td>
										</tr>
									</table>
							<!-- 总账会计科目字典信息表结束 -->
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
	// 确认选择
	function confirmSelect(sourceOrDest,radioChecked)
	{		
		var check_radio = $(radioChecked);
		
		if(check_radio)
		{
			$('#dest_acc_subject').val($(check_radio).val());
			$('#dest_acc_subject_name').val($(check_radio).attr('label'));
		}
		
		closeDictTable(sourceOrDest);
	}
	
	// 打开字典
	function openDictTable(sourceOrDest)
	{	
		closeDictTable();
		$('#'+sourceOrDest+'_dict_table').show();
		$('#'+sourceOrDest+'_dict_search_input').focus();
	}
	
	// 关闭字典
	function closeDictTable()
	{		
		$('#source_dict_table').hide();
		$('#dest_dict_table').hide();
	}
	
	
	// 字典检索
	$('#source_dict_search_input').bind('input propertychange',function(){dictSearch('source');});
	
	$('#dest_dict_search_input').bind('input propertychange',function(){dictSearch('dest');});
	
	function dictSearch(sourceOrDest){
		var search_value = $('#'+sourceOrDest+'_dict_search_input').val().trim();
		if(search_value!=""){
		
			$('#'+sourceOrDest+'_dict_table_list tr').each(function(){
			
				var tr = $(this);
				if($(tr).text().indexOf(search_value)>=0){
					$(tr).show();
				}
				else
				{
					$(tr).hide();
				}
				
			});
		}
		else
		{
			$('#'+sourceOrDest+'_dict_table_list tr').each(function(){
			
				$(this).show();
				
			});
		}
	}
	
	function dictRowClick()
	{
		//$(this).find("input[type='radio']").attr("checked","checked");
	}
	
	$("#checkAllBox").click(function(){
		if($(this).prop("checked")==true)
		{
			$("[name='source_dept_acc_id']").prop("checked",true);//全选
		}
		else
		{
			$("[name='source_dept_acc_id']").prop("checked",false);//取消全选
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
