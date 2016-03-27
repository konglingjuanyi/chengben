package com.chengben.obj;

import java.io.File;
import java.util.Map;

import com.wuyg.excelparser.beforeparser.IBeforeParser;
import com.wuyg.excelparser.obj.ExcelColumnObj;
import com.wuyg.excelparser.obj.ExcelParserConfigObj;

public class CostDirectObjBeforeExcelParser implements IBeforeParser
{

	public boolean doBeforeParse(File excelFile, ExcelParserConfigObj config, Map map)
	{
		ExcelColumnObj date_month_column=new ExcelColumnObj();
		date_month_column.setJavaBeanProperty("date_month");
		date_month_column.setExcelColumnName(" ");
		date_month_column.setIsUnique(true);
		
		config.getUniqueColumns().add(date_month_column);
		
		return true;
	}

}
