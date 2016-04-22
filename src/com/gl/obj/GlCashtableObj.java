package com.gl.obj;
import java.math.BigDecimal;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import java.util.Arrays;
import java.util.List;
import com.alibaba.fastjson.JSON;
public class GlCashtableObj extends BaseDbObj
{
//private Long i_id;
private String iperiod;
private Long isignseq;
private Long ino_id;
private Long inid;
private String ccashitem;
private BigDecimal md;
private BigDecimal mc;
private String ccode;
private Double md_f;
private Double mc_f;
private Double nd_s;
private Double nc_s;
private String cdept_id;
private String cperson_id;
private String ccus_id;
private String csup_id;
private String citem_class;
private String citem_id;
private String cdefine1;
private String cdefine2;
private String cdefine3;
private Timestamp cdefine4;
private Long cdefine5;
private Timestamp cdefine6;
private Double cdefine7;
private String cdefine8;
private String cdefine9;
private String cdefine10;
private String cdefine11;
private String cdefine12;
private String cdefine13;
private String cdefine14;
private Long cdefine15;
private Double cdefine16;
private Timestamp dbill_date;
private String csign;
private Long iyear;
private Long iyperiod;
private String rowguid;
@Override
public String findKeyColumnName()
{
	return "cdefine5";
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
	return "gl_cashtable";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "GlCashtable";
}
@Override
public String getCnName()
{
	return "总账现金流量数据表";
}
@Override
public List<String> getUniqueIndexProperties()
{
	return Arrays.asList(new String[]
	{ "cdefine5" });
}
public LinkedHashMap<String, String> getProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("i_id", "i_id");
		pros.put("iperiod", "iperiod");
		pros.put("isignseq", "isignseq");
		pros.put("ino_id", "ino_id");
		pros.put("inid", "inid");
		pros.put("ccashitem", "ccashitem");
		pros.put("md", "md");
		pros.put("mc", "mc");
		pros.put("ccode", "ccode");
		pros.put("md_f", "md_f");
		pros.put("mc_f", "mc_f");
		pros.put("nd_s", "nd_s");
		pros.put("nc_s", "nc_s");
		pros.put("cdept_id", "cdept_id");
		pros.put("cperson_id", "cperson_id");
		pros.put("ccus_id", "ccus_id");
		pros.put("csup_id", "csup_id");
		pros.put("citem_class", "citem_class");
		pros.put("citem_id", "citem_id");
		pros.put("cdefine1", "cdefine1");
		pros.put("cdefine2", "cdefine2");
		pros.put("cdefine3", "cdefine3");
		pros.put("cdefine4", "cdefine4");
		pros.put("cdefine5", "cdefine5");
		pros.put("cdefine6", "cdefine6");
		pros.put("cdefine7", "cdefine7");
		pros.put("cdefine8", "cdefine8");
		pros.put("cdefine9", "cdefine9");
		pros.put("cdefine10", "cdefine10");
		pros.put("cdefine11", "cdefine11");
		pros.put("cdefine12", "cdefine12");
		pros.put("cdefine13", "cdefine13");
		pros.put("cdefine14", "cdefine14");
		pros.put("cdefine15", "cdefine15");
		pros.put("cdefine16", "cdefine16");
		pros.put("dbill_date", "dbill_date");
		pros.put("csign", "csign");
		pros.put("iyear", "iyear");
		pros.put("iyperiod", "iyperiod");
		pros.put("rowguid", "rowguid");
		return pros;
}
//public Long getI_id()
//{
//	return i_id;
//}
//public void setI_id(Long i_id)
//{
//	this.i_id = i_id;
//}
public String getIperiod()
{
	return iperiod;
}
public void setIperiod(String iperiod)
{
	this.iperiod = iperiod;
}
public Long getIsignseq()
{
	return isignseq;
}
public void setIsignseq(Long isignseq)
{
	this.isignseq = isignseq;
}
public Long getIno_id()
{
	return ino_id;
}
public void setIno_id(Long ino_id)
{
	this.ino_id = ino_id;
}
public Long getInid()
{
	return inid;
}
public void setInid(Long inid)
{
	this.inid = inid;
}
public String getCcashitem()
{
	return ccashitem;
}
public void setCcashitem(String ccashitem)
{
	this.ccashitem = ccashitem;
}

public BigDecimal getMd()
{
	return md;
}
public void setMd(BigDecimal md)
{
	this.md = md;
}
public BigDecimal getMc()
{
	return mc;
}
public void setMc(BigDecimal mc)
{
	this.mc = mc;
}
public String getCcode()
{
	return ccode;
}
public void setCcode(String ccode)
{
	this.ccode = ccode;
}
public Double getMd_f()
{
	return md_f;
}
public void setMd_f(Double md_f)
{
	this.md_f = md_f;
}
public Double getMc_f()
{
	return mc_f;
}
public void setMc_f(Double mc_f)
{
	this.mc_f = mc_f;
}
public Double getNd_s()
{
	return nd_s;
}
public void setNd_s(Double nd_s)
{
	this.nd_s = nd_s;
}
public Double getNc_s()
{
	return nc_s;
}
public void setNc_s(Double nc_s)
{
	this.nc_s = nc_s;
}
public String getCdept_id()
{
	return cdept_id;
}
public void setCdept_id(String cdept_id)
{
	this.cdept_id = cdept_id;
}
public String getCperson_id()
{
	return cperson_id;
}
public void setCperson_id(String cperson_id)
{
	this.cperson_id = cperson_id;
}
public String getCcus_id()
{
	return ccus_id;
}
public void setCcus_id(String ccus_id)
{
	this.ccus_id = ccus_id;
}
public String getCsup_id()
{
	return csup_id;
}
public void setCsup_id(String csup_id)
{
	this.csup_id = csup_id;
}
public String getCitem_class()
{
	return citem_class;
}
public void setCitem_class(String citem_class)
{
	this.citem_class = citem_class;
}
public String getCitem_id()
{
	return citem_id;
}
public void setCitem_id(String citem_id)
{
	this.citem_id = citem_id;
}
public String getCdefine1()
{
	return cdefine1;
}
public void setCdefine1(String cdefine1)
{
	this.cdefine1 = cdefine1;
}
public String getCdefine2()
{
	return cdefine2;
}
public void setCdefine2(String cdefine2)
{
	this.cdefine2 = cdefine2;
}
public String getCdefine3()
{
	return cdefine3;
}
public void setCdefine3(String cdefine3)
{
	this.cdefine3 = cdefine3;
}
public Timestamp getCdefine4()
{
	return cdefine4;
}
public void setCdefine4(Timestamp cdefine4)
{
	this.cdefine4 = cdefine4;
}
public Long getCdefine5()
{
	return cdefine5;
}
public void setCdefine5(Long cdefine5)
{
	this.cdefine5 = cdefine5;
}
public Timestamp getCdefine6()
{
	return cdefine6;
}
public void setCdefine6(Timestamp cdefine6)
{
	this.cdefine6 = cdefine6;
}
public Double getCdefine7()
{
	return cdefine7;
}
public void setCdefine7(Double cdefine7)
{
	this.cdefine7 = cdefine7;
}
public String getCdefine8()
{
	return cdefine8;
}
public void setCdefine8(String cdefine8)
{
	this.cdefine8 = cdefine8;
}
public String getCdefine9()
{
	return cdefine9;
}
public void setCdefine9(String cdefine9)
{
	this.cdefine9 = cdefine9;
}
public String getCdefine10()
{
	return cdefine10;
}
public void setCdefine10(String cdefine10)
{
	this.cdefine10 = cdefine10;
}
public String getCdefine11()
{
	return cdefine11;
}
public void setCdefine11(String cdefine11)
{
	this.cdefine11 = cdefine11;
}
public String getCdefine12()
{
	return cdefine12;
}
public void setCdefine12(String cdefine12)
{
	this.cdefine12 = cdefine12;
}
public String getCdefine13()
{
	return cdefine13;
}
public void setCdefine13(String cdefine13)
{
	this.cdefine13 = cdefine13;
}
public String getCdefine14()
{
	return cdefine14;
}
public void setCdefine14(String cdefine14)
{
	this.cdefine14 = cdefine14;
}
public Long getCdefine15()
{
	return cdefine15;
}
public void setCdefine15(Long cdefine15)
{
	this.cdefine15 = cdefine15;
}
public Double getCdefine16()
{
	return cdefine16;
}
public void setCdefine16(Double cdefine16)
{
	this.cdefine16 = cdefine16;
}
public Timestamp getDbill_date()
{
	return dbill_date;
}
public void setDbill_date(Timestamp dbill_date)
{
	this.dbill_date = dbill_date;
}
public String getCsign()
{
	return csign;
}
public void setCsign(String csign)
{
	this.csign = csign;
}
public Long getIyear()
{
	return iyear;
}
public void setIyear(Long iyear)
{
	this.iyear = iyear;
}
public Long getIyperiod()
{
	return iyperiod;
}
public void setIyperiod(Long iyperiod)
{
	this.iyperiod = iyperiod;
}
public String getRowguid()
{
	return rowguid;
}
public void setRowguid(String rowguid)
{
	this.rowguid = rowguid;
}
@Override
public String toString()
{
	return JSON.toJSONString(this);
}
}

