package com.u8.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;
public class DepartmentObj extends BaseDbObj
{
private String cdepcode;
private Boolean bdepend;
private String cdepname;
private String idepgrade;
private String cdepperson;
private String cdepprop;
private String cdepphone;
private String cdepaddress;
private String cdepmemo;
private Double icreline;
private String ccregrade;
private Long icredate;
private String coffergrade;
private Double iofferrate;
//private String pubufts;
private Boolean bshop;
private String cdepguid;
private Timestamp ddepbegindate;
private Timestamp ddependdate;
private String vauthorizedoc;
private String vauthorizeunit;
private String cdepfax;
private String cdeppostcode;
private String cdepemail;
private String cdeptype;
private Long binheritdutybasic;
private Long binheritworkcalendar;
private String cdutycode;
private String crestcode;
private Boolean bim;
private String cdepnameen;
private Boolean bretail;
private String cdepfullname;
private Long ideporder;
private String cdepleader;
private Timestamp dmodifydate;
@Override
public String findKeyColumnName()
{
	return "cdepcode";
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
	return "department";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "Department";
}
@Override
public String getCnName()
{
	return "部门";
}
public LinkedHashMap<String, String> getProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("cdepcode", "cdepcode");
		pros.put("bdepend", "bdepend");
		pros.put("cdepname", "cdepname");
		pros.put("idepgrade", "idepgrade");
		pros.put("cdepperson", "cdepperson");
		pros.put("cdepprop", "cdepprop");
		pros.put("cdepphone", "cdepphone");
		pros.put("cdepaddress", "cdepaddress");
		pros.put("cdepmemo", "cdepmemo");
		pros.put("icreline", "icreline");
		pros.put("ccregrade", "ccregrade");
		pros.put("icredate", "icredate");
		pros.put("coffergrade", "coffergrade");
		pros.put("iofferrate", "iofferrate");
		pros.put("pubufts", "pubufts");
		pros.put("bshop", "bshop");
		pros.put("cdepguid", "cdepguid");
		pros.put("ddepbegindate", "ddepbegindate");
		pros.put("ddependdate", "ddependdate");
		pros.put("vauthorizedoc", "vauthorizedoc");
		pros.put("vauthorizeunit", "vauthorizeunit");
		pros.put("cdepfax", "cdepfax");
		pros.put("cdeppostcode", "cdeppostcode");
		pros.put("cdepemail", "cdepemail");
		pros.put("cdeptype", "cdeptype");
		pros.put("binheritdutybasic", "binheritdutybasic");
		pros.put("binheritworkcalendar", "binheritworkcalendar");
		pros.put("cdutycode", "cdutycode");
		pros.put("crestcode", "crestcode");
		pros.put("bim", "bim");
		pros.put("cdepnameen", "cdepnameen");
		pros.put("bretail", "bretail");
		pros.put("cdepfullname", "cdepfullname");
		pros.put("ideporder", "ideporder");
		pros.put("cdepleader", "cdepleader");
		pros.put("dmodifydate", "dmodifydate");
		return pros;
}
public String getCdepcode()
{
	return cdepcode;
}
public void setCdepcode(String cdepcode)
{
	this.cdepcode = cdepcode;
}
public Boolean getBdepend()
{
	return bdepend;
}
public void setBdepend(Boolean bdepend)
{
	this.bdepend = bdepend;
}
public String getCdepname()
{
	return cdepname;
}
public void setCdepname(String cdepname)
{
	this.cdepname = cdepname;
}
public String getIdepgrade()
{
	return idepgrade;
}
public void setIdepgrade(String idepgrade)
{
	this.idepgrade = idepgrade;
}
public String getCdepperson()
{
	return cdepperson;
}
public void setCdepperson(String cdepperson)
{
	this.cdepperson = cdepperson;
}
public String getCdepprop()
{
	return cdepprop;
}
public void setCdepprop(String cdepprop)
{
	this.cdepprop = cdepprop;
}
public String getCdepphone()
{
	return cdepphone;
}
public void setCdepphone(String cdepphone)
{
	this.cdepphone = cdepphone;
}
public String getCdepaddress()
{
	return cdepaddress;
}
public void setCdepaddress(String cdepaddress)
{
	this.cdepaddress = cdepaddress;
}
public String getCdepmemo()
{
	return cdepmemo;
}
public void setCdepmemo(String cdepmemo)
{
	this.cdepmemo = cdepmemo;
}
public Double getIcreline()
{
	return icreline;
}
public void setIcreline(Double icreline)
{
	this.icreline = icreline;
}
public String getCcregrade()
{
	return ccregrade;
}
public void setCcregrade(String ccregrade)
{
	this.ccregrade = ccregrade;
}
public Long getIcredate()
{
	return icredate;
}
public void setIcredate(Long icredate)
{
	this.icredate = icredate;
}
public String getCoffergrade()
{
	return coffergrade;
}
public void setCoffergrade(String coffergrade)
{
	this.coffergrade = coffergrade;
}
public Double getIofferrate()
{
	return iofferrate;
}
public void setIofferrate(Double iofferrate)
{
	this.iofferrate = iofferrate;
}
//public String getPubufts()
//{
//	return pubufts;
//}
//public void setPubufts(String pubufts)
//{
//	this.pubufts = pubufts;
//}
public Boolean getBshop()
{
	return bshop;
}
public void setBshop(Boolean bshop)
{
	this.bshop = bshop;
}
public String getCdepguid()
{
	return cdepguid;
}
public void setCdepguid(String cdepguid)
{
	this.cdepguid = cdepguid;
}
public Timestamp getDdepbegindate()
{
	return ddepbegindate;
}
public void setDdepbegindate(Timestamp ddepbegindate)
{
	this.ddepbegindate = ddepbegindate;
}
public Timestamp getDdependdate()
{
	return ddependdate;
}
public void setDdependdate(Timestamp ddependdate)
{
	this.ddependdate = ddependdate;
}
public String getVauthorizedoc()
{
	return vauthorizedoc;
}
public void setVauthorizedoc(String vauthorizedoc)
{
	this.vauthorizedoc = vauthorizedoc;
}
public String getVauthorizeunit()
{
	return vauthorizeunit;
}
public void setVauthorizeunit(String vauthorizeunit)
{
	this.vauthorizeunit = vauthorizeunit;
}
public String getCdepfax()
{
	return cdepfax;
}
public void setCdepfax(String cdepfax)
{
	this.cdepfax = cdepfax;
}
public String getCdeppostcode()
{
	return cdeppostcode;
}
public void setCdeppostcode(String cdeppostcode)
{
	this.cdeppostcode = cdeppostcode;
}
public String getCdepemail()
{
	return cdepemail;
}
public void setCdepemail(String cdepemail)
{
	this.cdepemail = cdepemail;
}
public String getCdeptype()
{
	return cdeptype;
}
public void setCdeptype(String cdeptype)
{
	this.cdeptype = cdeptype;
}
public Long getBinheritdutybasic()
{
	return binheritdutybasic;
}
public void setBinheritdutybasic(Long binheritdutybasic)
{
	this.binheritdutybasic = binheritdutybasic;
}
public Long getBinheritworkcalendar()
{
	return binheritworkcalendar;
}
public void setBinheritworkcalendar(Long binheritworkcalendar)
{
	this.binheritworkcalendar = binheritworkcalendar;
}
public String getCdutycode()
{
	return cdutycode;
}
public void setCdutycode(String cdutycode)
{
	this.cdutycode = cdutycode;
}
public String getCrestcode()
{
	return crestcode;
}
public void setCrestcode(String crestcode)
{
	this.crestcode = crestcode;
}
public Boolean getBim()
{
	return bim;
}
public void setBim(Boolean bim)
{
	this.bim = bim;
}
public String getCdepnameen()
{
	return cdepnameen;
}
public void setCdepnameen(String cdepnameen)
{
	this.cdepnameen = cdepnameen;
}
public Boolean getBretail()
{
	return bretail;
}
public void setBretail(Boolean bretail)
{
	this.bretail = bretail;
}
public String getCdepfullname()
{
	return cdepfullname;
}
public void setCdepfullname(String cdepfullname)
{
	this.cdepfullname = cdepfullname;
}
public Long getIdeporder()
{
	return ideporder;
}
public void setIdeporder(Long ideporder)
{
	this.ideporder = ideporder;
}
public String getCdepleader()
{
	return cdepleader;
}
public void setCdepleader(String cdepleader)
{
	this.cdepleader = cdepleader;
}
public Timestamp getDmodifydate()
{
	return dmodifydate;
}
public void setDmodifydate(Timestamp dmodifydate)
{
	this.dmodifydate = dmodifydate;
}
@Override
public String toString()
{
	return JSON.toJSONString(this);
}
}

