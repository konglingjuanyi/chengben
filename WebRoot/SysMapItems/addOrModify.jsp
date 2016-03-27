<!DOCTYPE html> 
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%> 
<!-- 引入类 -->  
<%@page import="java.util.List"%> 
<%@page import="java.util.ArrayList"%> 
<%@page import="com.wuyg.common.util.StringUtil"%> 
<%@page import="com.inspur.common.dictionary.util.DictionaryUtil"%> 
<%@page import="com.hz.dict.service.DictionaryService"%> 
<%@page import="com.hz.dict.service.IDictionaryService"%> 
<%@page import="com.wuyg.system.obj.SysMapItemsObj"%>
<%@page import="com.wuyg.system.obj.SysMapInfoObj"%>
<%@page import="com.inspur.common.dictionary.pojo.DictItem"%> 
<!-- 基本信息 -->  
<% 
	// 上下文路径 
	String contextPath = request.getContextPath(); 
	 
	// 对象实例 
	SysMapItemsObj domainInstance = new SysMapItemsObj(); 
	// 该功能基本路径 
	String basePath = domainInstance.getBasePath(); 
 
	// 如果是修改，则获取对象信息 
	Object domainInstanceObj = request.getAttribute("domainInstance"); 
	if (domainInstanceObj != null) 
	{ 
		domainInstance = (SysMapItemsObj) domainInstanceObj; 
	} 
 
	// 是否是修改 
	boolean isModify = domainInstance.getKeyValue() > 0; 
	// 唯一性检查用的字段 
	String keyCol = "null"; 
	
	// 则获取对象信息 
	SysMapInfoObj sysMapInfo=new SysMapInfoObj();
	Object sysMapInfoObj = request.getAttribute("sysMapInfo"); 
	if (sysMapInfoObj != null) 
	{ 
		sysMapInfo = (SysMapInfoObj) sysMapInfoObj; 
	} 
	
	// 外部系统名称
	String otherSysName=new DictionaryService().getDictValueByDictKey("外部接口字典",sysMapInfo.getSource_system() );
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
		if(!checkNull("id","<%=domainInstance.getPropertyCnName("id")%>")) return false; 
		if(!checkNull("map_id","<%=domainInstance.getPropertyCnName("map_id")%>")) return false; 
		if(!checkNull("source_id","<%=domainInstance.getPropertyCnName("source_id")%>")) return false; 
		if(!checkNull("source_name","<%=domainInstance.getPropertyCnName("source_name")%>")) return false; 
		if(!checkNull("dest_id","<%=domainInstance.getPropertyCnName("dest_id")%>")) return false; 
		if(!checkNull("dest_name","<%=domainInstance.getPropertyCnName("dest_name")%>")) return false; 
					 
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
						<img src="../images/svg/heavy/green/map_item.png" width="18" height="18" align="absmiddle"> 
						&nbsp;&nbsp;<%=isModify ? "修改" : "增加"%><%=domainInstance.getCnName()%> 
					</td> 
				</tr> 
			</table> 
 
			<!-- 详细信息 --> 
			<table width="700" align="center" class="detail_table detail_table-bordered detail_table-striped"> 
				<input type="hidden" id="<%=domainInstance.findKeyColumnName()%>" name="<%=domainInstance.findKeyColumnName()%>" value="<%=domainInstance.getKeyValue()%>"> 
				<tr> 
					<td> 
						<%=domainInstance.getPropertyCnName("map_id") %>: 
					</td> 
					<td> 
					<!-- 
						<%=DictionaryUtil.getSelectHtml(new DictionaryService().getDictItemsByDictName("映射关系字典", false), "map_id", "", StringUtil.getNotEmptyStr(domainInstance.getMap_id(), ""), "notEmpty")%> 
						<font color="red">*</font> 
					 -->
						<input type="hidden" id="map_id" name="map_id" value="<%=sysMapInfo.getId() %>">
						<b><%=sysMapInfo.getName() %></b>
					</td> 
					<td></td>
					<td></td>
				</tr> 
				<tr> 
					<td style="color:#3daeb6"> 
						<%=otherSysName+"<br>"+sysMapInfo.getSource_name()+"编号" %>: 
					</td> 
					<td> 
						<input name="source_id" type="text" id="source_id" value="<%=StringUtil.getNotEmptyStr(domainInstance.getSource_id(),"")%>" size="20"  <% if(!StringUtil.isEmpty(sysMapInfo.getSource_dict_name())){%>onClick="openDictTable('source')" readOnly<%} %>> 
						<font color="red">*</font> 
					</td> 
					<td style="color:#ff9900"> 
						<%="总账系统<br>"+sysMapInfo.getDest_name()+"编号" %>: 
					</td> 
					<td> 
						<input name="dest_id" type="text" id="dest_id" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDest_id(),"")%>" size="20" <% if(!StringUtil.isEmpty(sysMapInfo.getDest_dict_name())){%>onClick="openDictTable('dest')" readOnly<%} %>> 
						<font color="red">*</font> 
					</td>
					
				</tr> 
				<tr> 
					<td style="color:#3daeb6"> 
						<%=otherSysName+"<br>"+sysMapInfo.getSource_name()+"名称" %>: 
					</td> 
					<td> 
						<input name="source_name" type="text" id="source_name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getSource_name(),"")%>" size="20"  <% if(!StringUtil.isEmpty(sysMapInfo.getSource_dict_name())){%>onClick="openDictTable('source')" readOnly<%} %>> 
						<font color="red">*</font> 
					</td> 
					<td style="color:#ff9900"> 
						<%="总账系统<br>"+sysMapInfo.getDest_name()+"名称" %>: 
					</td> 
					<td> 
						<input name="dest_name" type="text" id="dest_name" value="<%=StringUtil.getNotEmptyStr(domainInstance.getDest_name(),"")%>" size="20" <% if(!StringUtil.isEmpty(sysMapInfo.getDest_dict_name())){%>onClick="openDictTable('dest')" readOnly<%} %>> 
						<font color="red">*</font> 
					</td> 
				</tr> 
			</table> 
			
						 
			<!-- 工具栏 --> 
			<jsp:include page="../ToolBar/addOrModify_toolbar.jsp" /> 
			
<!-- 成本系统字典信息表 -->
<table width="600" id="source_dict_table" style="display:none; background-color:#66cccc; width:600px; margin-left: auto; margin-right: auto; padding:4px;" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="right"><input type="button" name="close_btn" class="button button_close"  value="" onclick="closeDictTable()"></td>
  </tr>
  <tr>
    <td align="center"><h3>请从下表中选择成本系统中的名字</h3></td>
  </tr>
  <tr>
    <td align="center"><input type="text" id="source_dict_search_input" name="source_dict_search_input" size="20"></td>
  </tr>
  <tr>
    <td>
	<table id="source_dict_table_list" width="100%" class="table table-bordered table-striped" align="center">
				<thead> 
					<tr> 
						<th>选择</th>
						<th>编号</th> 
						<th>名称</th> 
					</tr> 
				</thead> 
			<%
				List<DictItem> items = new DictionaryService().getDictItemsByDictName(sysMapInfo.getSource_dict_name(), true);
				for(int i=1;i<items.size();i++)
				{
					DictItem item=items.get(i);
			%>
			<tr>
				<td><input type="radio" name="source_radiao" value="<%=item.getK() %>" label="<%=item.getV() %>" onclick="confirmSelect('source',this);"></td>
				<td><%=item.getK() %></td>
				<td><%=item.getV() %></td>
			</tr>
			<%
				}
			%>
	
			</table>
	</td>
  </tr>
</table>

<%if(!StringUtil.isEmpty(sysMapInfo.getDest_dict_name())){ %>
<!-- 外部系统字典信息表 -->
<table width="600" id="dest_dict_table" style="display:none; background-color:#ff9900; width:600px; margin-left: auto; margin-right: auto; padding:4px;" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="right"><input type="button" name="close_btn" class="button button_close"  value="" onclick="closeDictTable()"></td>
  </tr>
  <tr>
    <td align="center"><h3>请从下表中选择外部系统中的名字</h3></td>
  </tr>
  <tr>
    <td align="center"><input type="text" id="dest_dict_search_input" name="dest_dict_search_input" size="20"></td>
  </tr>
  <tr>
    <td>
	<table id="dest_dict_table_list" width="100%" class="table table-bordered table-striped" align="center">
				<thead> 
					<tr> 
						<th>选择</th>
						<th>编号</th> 
						<th>名称</th> 
					</tr> 
				</thead> 
			<%
				items = new DictionaryService().getDictItemsByDictName(sysMapInfo.getDest_dict_name(), true);
				for(int i=1;i<items.size();i++)
				{
					DictItem item=items.get(i);
			%>
			<tr>
				<td><input type="radio" name="dest_radiao" value="<%=item.getK() %>" label="<%=item.getV() %>" onclick="confirmSelect('dest',this);"></td>
				<td><%=item.getK() %></td>
				<td><%=item.getV() %></td>
			</tr>
			<%
				}
			%>
	
			</table>
	</td>
  </tr>
</table>
<%} %>

		</form> 
		
	<script>
	// 确认选择
	function confirmSelect(sourceOrDest,radioChecked)
	{		
		var check_radio = $(radioChecked);
		
		if(check_radio)
		{
			$('#'+sourceOrDest+'_id').val($(check_radio).val());
			$('#'+sourceOrDest+'_name').val($(check_radio).attr('label'));
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
	
	//$("#source_id").click();
	</script>
	</body> 
</html> 
