package com.wuyg.common.util;

import java.util.Iterator;
import java.util.LinkedHashMap;

import com.cost.obj.EfCostDeptObj;
import com.wuyg.common.dao.BaseDbObj;

public class ExcelParserUtil
{
	/**
	 * 根据BaseDbObj对象获取excel解析所需的配置信息
	 * 
	 * @param baseDbObj
	 * @return
	 */
	public static String getExcelParserXmlConfigByBaseDbObj(BaseDbObj baseDbObj)
	{
		StringBuffer xml = new StringBuffer();

		xml.append("<ExcelParser name=\"" + baseDbObj.getCnName() + "\">\n");
		xml.append("	<!-- 对应的javabean -->\n");
		xml.append("	<javaBean>"+baseDbObj.getClass().getCanonicalName()+"</javaBean>\n");
		xml.append("	<!-- 需解析的sheet名，默认为空，即解第1个sheet -->\n");
		xml.append("	<sheetName/>\n");
		xml.append("	<!-- 表头位于第几行，默认第1行 -->\n");
		xml.append("	<headRowNum>1</headRowNum>\n");
		xml.append("	<!-- 数据从第几行开始，默认第2行 -->\n");
		xml.append("	<dataStartRowNum>2</dataStartRowNum>\n");
		xml.append("	<!-- 解析开始前执行的动作，默认为空 -->\n");
		xml.append("	<beforeParser/>\n");
		xml.append("	<!-- 解析结束后执行的动作，默认为空 -->\n");
		xml.append("	<afterParser/>\n");
		xml.append("	<!-- 是否使用excel的列名进行映射取值，默认为否 -->\n");
		xml.append("	<parseByExcelColumnName>false</parseByExcelColumnName>\n");
		xml.append("	<ExcelColumnList>\n");

		LinkedHashMap<String, String> columnsMap = baseDbObj.getProperties();
		Iterator<String> columnEnNames = columnsMap.keySet().iterator();
		while (columnEnNames.hasNext())
		{
			String columnEnName = (String) columnEnNames.next();
			String columnCnName = columnsMap.get(columnEnName);

			xml.append("		<ExcelColumn excelColumnName=\"" + columnCnName + "\" javaBeanProperty=\"" + columnEnName + "\"/>\n");
		}

		xml.append("	</ExcelColumnList>\n");
		xml.append("</ExcelParser>\n");

		return xml.toString();
	}
	
	public static void main(String[] args)
	{
		System.out.println(getExcelParserXmlConfigByBaseDbObj(new EfCostDeptObj()));
	}
}
