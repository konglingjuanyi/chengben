package com.chengben.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import com.alibaba.fastjson.JSON;
public class AccountingSubjectObj extends BaseDbObj
{
private Long id;
private String acc_code;
private String acc_name;
private String debit_or_credit;
private String opposite_acc_code;
@Override
public String findKeyColumnName()
{
	return "id";
}
@Override
public String findParentKeyColumnName()
{
	// TODO Auto-generated method stub
	return null;
}
@Override
public String findTableName()
{
	return "accounting_subject";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "AccountingSubject";
}
@Override
public String getCnName()
{
	return "会计科目";
}
public LinkedHashMap<String, String> getProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("id", "ID");
		pros.put("acc_code", "会计科目编号");
		pros.put("acc_name", "会计科目名称");
		pros.put("debit_or_credit", "科目性质");
		pros.put("opposite_acc_code", "对方会计科目");
		return pros;
}
@Override
public List<String> getUniqueIndexProperties()
{
	List<String> l = new ArrayList<String>();
	l.add("acc_code");
	return l;
}
public Long getId()
{
	return id;
}
public void setId(Long id)
{
	this.id = id;
}
public String getAcc_code()
{
	return acc_code;
}
public void setAcc_code(String acc_code)
{
	this.acc_code = acc_code;
}
public String getAcc_name()
{
	return acc_name;
}
public void setAcc_name(String acc_name)
{
	this.acc_name = acc_name;
}
public String getDebit_or_credit()
{
	return debit_or_credit;
}
public void setDebit_or_credit(String debit_or_credit)
{
	this.debit_or_credit = debit_or_credit;
}
public String getOpposite_acc_code()
{
	return opposite_acc_code;
}
public void setOpposite_acc_code(String opposite_acc_code)
{
	this.opposite_acc_code = opposite_acc_code;
}
@Override
public String toString()
{
	return JSON.toJSONString(this);
}
}

