<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage=""%>
			<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td align="left">
						<img src="../images/pagination_icons_save.png" title="导出数据" class="image_button" align="absmiddle" onClick="exportData('','<%=request.getContextPath()%>/<%=request.getParameter("basePath")%>/Servlet?method=export4this')" />
						<img src="../images/pagination_icons_print.png"  title="打印当前页"  class="image_button" align="absmiddle" onclick="printme();" />
					</td>
				</tr>
			</table>

			
			
			<!-- 导出excel使用 -->
			<input type="hidden" name="table_html" id="table_html" value="">
			<script>
			$("#table_html").val($("#printDiv").html());
			</script>
			
			<script type="text/javascript" src="../js/jquery.PrintArea.js"></script>