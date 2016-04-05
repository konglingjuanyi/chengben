package com.u8.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;
public class CodeObj extends BaseDbObj
{
private Long i_id;
private String cclass;
private String cclass_engl;
private String cclassany;
private String cclassany_engl;
private String ccode;
private String ccode_name;
private String ccode_engl;
private String igrade;
private Boolean bproperty;
private String cbook_type;
private String cbook_type_engl;
private String chelp;
private String cexch_name;
private String cmeasure;
private Boolean bperson;
private Boolean bcus;
private Boolean bsup;
private Boolean bdept;
private Boolean bitem;
private String cass_item;
private Boolean br;
private Boolean be;
private String cgather;
private Boolean bend;
private Boolean bexchange;
private Boolean bcash;
private Boolean bbank;
private Boolean bused;
private Boolean bd_c;
private Timestamp dbegin;
private Timestamp dend;
private String itrans;
private Boolean bclose;
private String cother;
private Long iotherused;
private Boolean bcdefine1;
private Boolean bcdefine2;
private Boolean bcdefine3;
private Boolean bcdefine4;
private Boolean bcdefine5;
private Boolean bcdefine6;
private Boolean bcdefine7;
private Boolean bcdefine8;
private Boolean bcdefine9;
private Boolean bcdefine10;
private Long iviewitem;
private Boolean bgcjs;
private Boolean bcashitem;
//private String pubufts;
private Boolean bcdefine11;
private Boolean bcdefine12;
private Boolean bcdefine13;
private Boolean bcdefine14;
private Boolean bcdefine15;
private Boolean bcdefine16;
private Boolean breport;
private String cuserdefinetype;
private Long iyear;
@Override
public String findKeyColumnName()
{
	return "i_id";
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
	return "code";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "Code";
}
@Override
public String getCnName()
{
	return "会计科目";
}
public LinkedHashMap<String, String> getProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("i_id", "i_id");
		pros.put("cclass", "cclass");
		pros.put("cclass_engl", "cclass_engl");
		pros.put("cclassany", "cclassany");
		pros.put("cclassany_engl", "cclassany_engl");
		pros.put("ccode", "ccode");
		pros.put("ccode_name", "ccode_name");
		pros.put("ccode_engl", "ccode_engl");
		pros.put("igrade", "igrade");
		pros.put("bproperty", "bproperty");
		pros.put("cbook_type", "cbook_type");
		pros.put("cbook_type_engl", "cbook_type_engl");
		pros.put("chelp", "chelp");
		pros.put("cexch_name", "cexch_name");
		pros.put("cmeasure", "cmeasure");
		pros.put("bperson", "bperson");
		pros.put("bcus", "bcus");
		pros.put("bsup", "bsup");
		pros.put("bdept", "bdept");
		pros.put("bitem", "bitem");
		pros.put("cass_item", "cass_item");
		pros.put("br", "br");
		pros.put("be", "be");
		pros.put("cgather", "cgather");
		pros.put("bend", "bend");
		pros.put("bexchange", "bexchange");
		pros.put("bcash", "bcash");
		pros.put("bbank", "bbank");
		pros.put("bused", "bused");
		pros.put("bd_c", "bd_c");
		pros.put("dbegin", "dbegin");
		pros.put("dend", "dend");
		pros.put("itrans", "itrans");
		pros.put("bclose", "bclose");
		pros.put("cother", "cother");
		pros.put("iotherused", "iotherused");
		pros.put("bcdefine1", "bcdefine1");
		pros.put("bcdefine2", "bcdefine2");
		pros.put("bcdefine3", "bcdefine3");
		pros.put("bcdefine4", "bcdefine4");
		pros.put("bcdefine5", "bcdefine5");
		pros.put("bcdefine6", "bcdefine6");
		pros.put("bcdefine7", "bcdefine7");
		pros.put("bcdefine8", "bcdefine8");
		pros.put("bcdefine9", "bcdefine9");
		pros.put("bcdefine10", "bcdefine10");
		pros.put("iviewitem", "iviewitem");
		pros.put("bgcjs", "bgcjs");
		pros.put("bcashitem", "bcashitem");
		pros.put("pubufts", "pubufts");
		pros.put("bcdefine11", "bcdefine11");
		pros.put("bcdefine12", "bcdefine12");
		pros.put("bcdefine13", "bcdefine13");
		pros.put("bcdefine14", "bcdefine14");
		pros.put("bcdefine15", "bcdefine15");
		pros.put("bcdefine16", "bcdefine16");
		pros.put("breport", "breport");
		pros.put("cuserdefinetype", "cuserdefinetype");
		pros.put("iyear", "iyear");
		return pros;
}
public Long getI_id()
{
	return i_id;
}
public void setI_id(Long i_id)
{
	this.i_id = i_id;
}
public String getCclass()
{
	return cclass;
}
public void setCclass(String cclass)
{
	this.cclass = cclass;
}
public String getCclass_engl()
{
	return cclass_engl;
}
public void setCclass_engl(String cclass_engl)
{
	this.cclass_engl = cclass_engl;
}
public String getCclassany()
{
	return cclassany;
}
public void setCclassany(String cclassany)
{
	this.cclassany = cclassany;
}
public String getCclassany_engl()
{
	return cclassany_engl;
}
public void setCclassany_engl(String cclassany_engl)
{
	this.cclassany_engl = cclassany_engl;
}
public String getCcode()
{
	return ccode;
}
public void setCcode(String ccode)
{
	this.ccode = ccode;
}
public String getCcode_name()
{
	return ccode_name;
}
public void setCcode_name(String ccode_name)
{
	this.ccode_name = ccode_name;
}
public String getCcode_engl()
{
	return ccode_engl;
}
public void setCcode_engl(String ccode_engl)
{
	this.ccode_engl = ccode_engl;
}
public String getIgrade()
{
	return igrade;
}
public void setIgrade(String igrade)
{
	this.igrade = igrade;
}
public Boolean getBproperty()
{
	return bproperty;
}
public void setBproperty(Boolean bproperty)
{
	this.bproperty = bproperty;
}
public String getCbook_type()
{
	return cbook_type;
}
public void setCbook_type(String cbook_type)
{
	this.cbook_type = cbook_type;
}
public String getCbook_type_engl()
{
	return cbook_type_engl;
}
public void setCbook_type_engl(String cbook_type_engl)
{
	this.cbook_type_engl = cbook_type_engl;
}
public String getChelp()
{
	return chelp;
}
public void setChelp(String chelp)
{
	this.chelp = chelp;
}
public String getCexch_name()
{
	return cexch_name;
}
public void setCexch_name(String cexch_name)
{
	this.cexch_name = cexch_name;
}
public String getCmeasure()
{
	return cmeasure;
}
public void setCmeasure(String cmeasure)
{
	this.cmeasure = cmeasure;
}
public Boolean getBperson()
{
	return bperson;
}
public void setBperson(Boolean bperson)
{
	this.bperson = bperson;
}
public Boolean getBcus()
{
	return bcus;
}
public void setBcus(Boolean bcus)
{
	this.bcus = bcus;
}
public Boolean getBsup()
{
	return bsup;
}
public void setBsup(Boolean bsup)
{
	this.bsup = bsup;
}
public Boolean getBdept()
{
	return bdept;
}
public void setBdept(Boolean bdept)
{
	this.bdept = bdept;
}
public Boolean getBitem()
{
	return bitem;
}
public void setBitem(Boolean bitem)
{
	this.bitem = bitem;
}
public String getCass_item()
{
	return cass_item;
}
public void setCass_item(String cass_item)
{
	this.cass_item = cass_item;
}
public Boolean getBr()
{
	return br;
}
public void setBr(Boolean br)
{
	this.br = br;
}
public Boolean getBe()
{
	return be;
}
public void setBe(Boolean be)
{
	this.be = be;
}
public String getCgather()
{
	return cgather;
}
public void setCgather(String cgather)
{
	this.cgather = cgather;
}
public Boolean getBend()
{
	return bend;
}
public void setBend(Boolean bend)
{
	this.bend = bend;
}
public Boolean getBexchange()
{
	return bexchange;
}
public void setBexchange(Boolean bexchange)
{
	this.bexchange = bexchange;
}
public Boolean getBcash()
{
	return bcash;
}
public void setBcash(Boolean bcash)
{
	this.bcash = bcash;
}
public Boolean getBbank()
{
	return bbank;
}
public void setBbank(Boolean bbank)
{
	this.bbank = bbank;
}
public Boolean getBused()
{
	return bused;
}
public void setBused(Boolean bused)
{
	this.bused = bused;
}
public Boolean getBd_c()
{
	return bd_c;
}
public void setBd_c(Boolean bd_c)
{
	this.bd_c = bd_c;
}
public Timestamp getDbegin()
{
	return dbegin;
}
public void setDbegin(Timestamp dbegin)
{
	this.dbegin = dbegin;
}
public Timestamp getDend()
{
	return dend;
}
public void setDend(Timestamp dend)
{
	this.dend = dend;
}
public String getItrans()
{
	return itrans;
}
public void setItrans(String itrans)
{
	this.itrans = itrans;
}
public Boolean getBclose()
{
	return bclose;
}
public void setBclose(Boolean bclose)
{
	this.bclose = bclose;
}
public String getCother()
{
	return cother;
}
public void setCother(String cother)
{
	this.cother = cother;
}
public Long getIotherused()
{
	return iotherused;
}
public void setIotherused(Long iotherused)
{
	this.iotherused = iotherused;
}
public Boolean getBcdefine1()
{
	return bcdefine1;
}
public void setBcdefine1(Boolean bcdefine1)
{
	this.bcdefine1 = bcdefine1;
}
public Boolean getBcdefine2()
{
	return bcdefine2;
}
public void setBcdefine2(Boolean bcdefine2)
{
	this.bcdefine2 = bcdefine2;
}
public Boolean getBcdefine3()
{
	return bcdefine3;
}
public void setBcdefine3(Boolean bcdefine3)
{
	this.bcdefine3 = bcdefine3;
}
public Boolean getBcdefine4()
{
	return bcdefine4;
}
public void setBcdefine4(Boolean bcdefine4)
{
	this.bcdefine4 = bcdefine4;
}
public Boolean getBcdefine5()
{
	return bcdefine5;
}
public void setBcdefine5(Boolean bcdefine5)
{
	this.bcdefine5 = bcdefine5;
}
public Boolean getBcdefine6()
{
	return bcdefine6;
}
public void setBcdefine6(Boolean bcdefine6)
{
	this.bcdefine6 = bcdefine6;
}
public Boolean getBcdefine7()
{
	return bcdefine7;
}
public void setBcdefine7(Boolean bcdefine7)
{
	this.bcdefine7 = bcdefine7;
}
public Boolean getBcdefine8()
{
	return bcdefine8;
}
public void setBcdefine8(Boolean bcdefine8)
{
	this.bcdefine8 = bcdefine8;
}
public Boolean getBcdefine9()
{
	return bcdefine9;
}
public void setBcdefine9(Boolean bcdefine9)
{
	this.bcdefine9 = bcdefine9;
}
public Boolean getBcdefine10()
{
	return bcdefine10;
}
public void setBcdefine10(Boolean bcdefine10)
{
	this.bcdefine10 = bcdefine10;
}
public Long getIviewitem()
{
	return iviewitem;
}
public void setIviewitem(Long iviewitem)
{
	this.iviewitem = iviewitem;
}
public Boolean getBgcjs()
{
	return bgcjs;
}
public void setBgcjs(Boolean bgcjs)
{
	this.bgcjs = bgcjs;
}
public Boolean getBcashitem()
{
	return bcashitem;
}
public void setBcashitem(Boolean bcashitem)
{
	this.bcashitem = bcashitem;
}
//public String getPubufts()
//{
//	return pubufts;
//}
//public void setPubufts(String pubufts)
//{
//	this.pubufts = pubufts;
//}
public Boolean getBcdefine11()
{
	return bcdefine11;
}
public void setBcdefine11(Boolean bcdefine11)
{
	this.bcdefine11 = bcdefine11;
}
public Boolean getBcdefine12()
{
	return bcdefine12;
}
public void setBcdefine12(Boolean bcdefine12)
{
	this.bcdefine12 = bcdefine12;
}
public Boolean getBcdefine13()
{
	return bcdefine13;
}
public void setBcdefine13(Boolean bcdefine13)
{
	this.bcdefine13 = bcdefine13;
}
public Boolean getBcdefine14()
{
	return bcdefine14;
}
public void setBcdefine14(Boolean bcdefine14)
{
	this.bcdefine14 = bcdefine14;
}
public Boolean getBcdefine15()
{
	return bcdefine15;
}
public void setBcdefine15(Boolean bcdefine15)
{
	this.bcdefine15 = bcdefine15;
}
public Boolean getBcdefine16()
{
	return bcdefine16;
}
public void setBcdefine16(Boolean bcdefine16)
{
	this.bcdefine16 = bcdefine16;
}
public Boolean getBreport()
{
	return breport;
}
public void setBreport(Boolean breport)
{
	this.breport = breport;
}
public String getCuserdefinetype()
{
	return cuserdefinetype;
}
public void setCuserdefinetype(String cuserdefinetype)
{
	this.cuserdefinetype = cuserdefinetype;
}
public Long getIyear()
{
	return iyear;
}
public void setIyear(Long iyear)
{
	this.iyear = iyear;
}
@Override
public String toString()
{
	return JSON.toJSONString(this);
}
}

