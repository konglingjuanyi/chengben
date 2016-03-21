package com.hr.obj;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;
public class HrHiPersonObj extends BaseDbObj
{
private String cpsn_num;
private String cpsn_name;
private String cdept_num;
private Long irecordid;
private String rpersontype;
private String rsex;
private String dbirthdate;
private String rnativeplace;
private String rnational;
private String rhealthstatus;
private String rmarristatus;
private String vidno;
//private null mpicture;
private String rperresidence;
private String valianame;
private String djoinworkdate;
private String denterdate;
private String dregulardate;
private String vssno;
private String rworkattend;
private String vcardno;
private String rtbmrule;
private String rcheckinflag;
private String dlastdate;
//private null hrts;
private String vstatus1;
private Long nstatus2;
private Boolean bpsnperson;
private String cpsnmobilephone;
private String cpsnfphone;
private String cpsnophone;
private String cpsninphone;
private String cpsnemail;
private String cpsnpostaddr;
private String cpsnpostcode;
private String cpsnfaddr;
private String cpsnqqcode;
private String cpsnurl;
private String cpsnoseat;
private String denterunitdate;
private String cpsnproperty;
private String cpsnbankcode;
private String cpsnaccount;
private String pk_hr_hi_person;
private Boolean bprobation;
private String cdutyclass;
private Boolean btaketm;
private String mpictureqpb;
private String ridtype;
private String rcountry;
private String dleavedate;
private String rfigure;
private String rworkstatus;
private String employmentform;
private String rpersonparameters;
private Boolean bdutylock;
private Boolean bpsnshop;
private String cardstate;
private String firsthtbegindate;
private String lasthtenddate;
private String cpsn_nameen;
private Double sysage;
private Double syscompage;
private Double sysworkage;
private String cregion;
private String natruetype;
private String cshifttype;
private String cdefaultbc;
private Timestamp denterdutyclassdate;
private String cresttype;
private String jobnumber;
private String persondepart;
private String cardeffectivebegintime;
private String cardeffectiveendtime;
private Boolean keyperson;
private String cleavereson;
private String remploystate;
private String cdutylocker;
private String cdutylockernum;
private String cjobcode;
private String cjobrankcode;
private String cjobgradecode;
private String cpsnnowaddress;
private String curgentpsnname;
private String curgentpsnphone;
private Boolean blongidcard;
private String cleavetype;
private String cdutycode;
private String cfax;
private String ctitle;
private String creportto;
private String cstartworktime;
private String cendworktime;
private String cloginsubids;
private String cpersonbarcode;
private Boolean bmobilecard;
private String cmobilesites;
private String voldcard;
private Long maxleadnum;
private Long maxpaccountnum;
private Long maxaccountnum;
private Long maxopportunitynum;
private String leadrcyreg;
private String paccountrcyreg;
private String opportunityrcyreg;
@Override
public String findKeyColumnName()
{
	return "cpsn_num";
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
	return "UFDATA_888_2010..hr_hi_person";
}
@Override 
public String findDefaultOrderBy()
{
	return super.findDefaultOrderBy();
}
@Override
public String getBasePath()
{
	return "HrHiPerson";
}
@Override
public String getCnName()
{
	return "员工信息";
}
public LinkedHashMap<String, String> getProperties()
{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		pros.put("cpsn_num", "人员编码");
		pros.put("cpsn_name", "姓名");
		pros.put("cdept_num", "部门");
		pros.put("irecordid", "显示序号");
		pros.put("rpersontype", "人员类别");
		pros.put("rsex", "性别");
		pros.put("dbirthdate", "出生日期");
		pros.put("rnativeplace", "籍贯");
		pros.put("rnational", "民族");
		pros.put("rhealthstatus", "健康状况");
		pros.put("rmarristatus", "婚姻状况");
		pros.put("vidno", "证件号码");
		pros.put("mpicture", "照片");
		pros.put("rperresidence", "户籍");
		pros.put("valianame", "曾用名");
		pros.put("djoinworkdate", "参加工作时间");
		pros.put("denterdate", "进入本行业时间");
		pros.put("dregulardate", "转正时间");
		pros.put("vssno", "社会保障号");
		pros.put("rworkattend", "考勤方式");
		pros.put("vcardno", "考勤卡号");
		pros.put("rtbmrule", "考勤规则");
		pros.put("rcheckinflag", "审核标志 ");
		pros.put("dlastdate", "最后修改时间");
		pros.put("hrts", "时间戳");
		pros.put("vstatus1", "与工资同步状态标志");
		pros.put("nstatus2", "status2");
		pros.put("bpsnperson", "是否业务员");
		pros.put("cpsnmobilephone", "手机");
		pros.put("cpsnfphone", "家庭电话");
		pros.put("cpsnophone", "办公电话");
		pros.put("cpsninphone", "内线电话");
		pros.put("cpsnemail", "Email");
		pros.put("cpsnpostaddr", "通讯地址");
		pros.put("cpsnpostcode", "邮政编码");
		pros.put("cpsnfaddr", "家庭住址");
		pros.put("cpsnqqcode", "QQ");
		pros.put("cpsnurl", "个人网址");
		pros.put("cpsnoseat", "工位");
		pros.put("denterunitdate", "到职日期");
		pros.put("cpsnproperty", "人员属性");
		pros.put("cpsnbankcode", "银行");
		pros.put("cpsnaccount", "账号");
		pros.put("pk_hr_hi_person", "主键 ");
		pros.put("bprobation", "是否是试用人员");
		pros.put("cdutyclass", "班组");
		pros.put("btaketm", "是否考勤");
		pros.put("mpictureqpb", "照片类型");
		pros.put("ridtype", "证件类型 ");
		pros.put("rcountry", "国家 ");
		pros.put("dleavedate", "离职日期");
		pros.put("rfigure", "与工资同步状态标志 ");
		pros.put("rworkstatus", "从业状况");
		pros.put("employmentform", "用工形式");
		pros.put("rpersonparameters", "考勤制度");
		pros.put("bdutylock", "是否排班锁定");
		pros.put("bpsnshop", "是否营业员");
		pros.put("cardstate", "发卡状态");
		pros.put("firsthtbegindate", "合同初签日期");
		pros.put("lasthtenddate", "合同到期日期");
		pros.put("cpsn_nameen", "英文名");
		pros.put("sysage", "年龄");
		pros.put("syscompage", "司龄");
		pros.put("sysworkage", "工龄");
		pros.put("cregion", "福利地区");
		pros.put("natruetype", "户口性质");
//		pros.put("cshifttype", "cshifttype");
//		pros.put("cdefaultbc", "cdefaultbc");
//		pros.put("denterdutyclassdate", "denterdutyclassdate");
//		pros.put("cresttype", "cresttype");
//		pros.put("jobnumber", "jobnumber");
//		pros.put("persondepart", "persondepart");
//		pros.put("cardeffectivebegintime", "cardeffectivebegintime");
//		pros.put("cardeffectiveendtime", "cardeffectiveendtime");
//		pros.put("keyperson", "keyperson");
//		pros.put("cleavereson", "cleavereson");
//		pros.put("remploystate", "remploystate");
//		pros.put("cdutylocker", "cdutylocker");
//		pros.put("cdutylockernum", "cdutylockernum");
//		pros.put("cjobcode", "cjobcode");
//		pros.put("cjobrankcode", "cjobrankcode");
//		pros.put("cjobgradecode", "cjobgradecode");
//		pros.put("cpsnnowaddress", "cpsnnowaddress");
//		pros.put("curgentpsnname", "curgentpsnname");
//		pros.put("curgentpsnphone", "curgentpsnphone");
//		pros.put("blongidcard", "blongidcard");
//		pros.put("cleavetype", "cleavetype");
//		pros.put("cdutycode", "cdutycode");
//		pros.put("cfax", "cfax");
//		pros.put("ctitle", "ctitle");
//		pros.put("creportto", "creportto");
//		pros.put("cstartworktime", "cstartworktime");
//		pros.put("cendworktime", "cendworktime");
//		pros.put("cloginsubids", "cloginsubids");
//		pros.put("cpersonbarcode", "cpersonbarcode");
//		pros.put("bmobilecard", "bmobilecard");
//		pros.put("cmobilesites", "cmobilesites");
//		pros.put("voldcard", "voldcard");
//		pros.put("maxleadnum", "maxleadnum");
//		pros.put("maxpaccountnum", "maxpaccountnum");
//		pros.put("maxaccountnum", "maxaccountnum");
//		pros.put("maxopportunitynum", "maxopportunitynum");
//		pros.put("leadrcyreg", "leadrcyreg");
//		pros.put("paccountrcyreg", "paccountrcyreg");
//		pros.put("opportunityrcyreg", "opportunityrcyreg");
		return pros;
}
public String getCpsn_num()
{
	return cpsn_num;
}
public void setCpsn_num(String cpsn_num)
{
	this.cpsn_num = cpsn_num;
}
public String getCpsn_name()
{
	return cpsn_name;
}
public void setCpsn_name(String cpsn_name)
{
	this.cpsn_name = cpsn_name;
}
public String getCdept_num()
{
	return cdept_num;
}
public void setCdept_num(String cdept_num)
{
	this.cdept_num = cdept_num;
}
public Long getIrecordid()
{
	return irecordid;
}
public void setIrecordid(Long irecordid)
{
	this.irecordid = irecordid;
}
public String getRpersontype()
{
	return rpersontype;
}
public void setRpersontype(String rpersontype)
{
	this.rpersontype = rpersontype;
}
public String getRsex()
{
	return rsex;
}
public void setRsex(String rsex)
{
	this.rsex = rsex;
}
public String getDbirthdate()
{
	return dbirthdate;
}
public void setDbirthdate(String dbirthdate)
{
	this.dbirthdate = dbirthdate;
}
public String getRnativeplace()
{
	return rnativeplace;
}
public void setRnativeplace(String rnativeplace)
{
	this.rnativeplace = rnativeplace;
}
public String getRnational()
{
	return rnational;
}
public void setRnational(String rnational)
{
	this.rnational = rnational;
}
public String getRhealthstatus()
{
	return rhealthstatus;
}
public void setRhealthstatus(String rhealthstatus)
{
	this.rhealthstatus = rhealthstatus;
}
public String getRmarristatus()
{
	return rmarristatus;
}
public void setRmarristatus(String rmarristatus)
{
	this.rmarristatus = rmarristatus;
}
public String getVidno()
{
	return vidno;
}
public void setVidno(String vidno)
{
	this.vidno = vidno;
}
//public null getMpicture()
//{
//	return mpicture;
//}
//public void setMpicture(null mpicture)
//{
//	this.mpicture = mpicture;
//}
public String getRperresidence()
{
	return rperresidence;
}
public void setRperresidence(String rperresidence)
{
	this.rperresidence = rperresidence;
}
public String getValianame()
{
	return valianame;
}
public void setValianame(String valianame)
{
	this.valianame = valianame;
}
public String getDjoinworkdate()
{
	return djoinworkdate;
}
public void setDjoinworkdate(String djoinworkdate)
{
	this.djoinworkdate = djoinworkdate;
}
public String getDenterdate()
{
	return denterdate;
}
public void setDenterdate(String denterdate)
{
	this.denterdate = denterdate;
}
public String getDregulardate()
{
	return dregulardate;
}
public void setDregulardate(String dregulardate)
{
	this.dregulardate = dregulardate;
}
public String getVssno()
{
	return vssno;
}
public void setVssno(String vssno)
{
	this.vssno = vssno;
}
public String getRworkattend()
{
	return rworkattend;
}
public void setRworkattend(String rworkattend)
{
	this.rworkattend = rworkattend;
}
public String getVcardno()
{
	return vcardno;
}
public void setVcardno(String vcardno)
{
	this.vcardno = vcardno;
}
public String getRtbmrule()
{
	return rtbmrule;
}
public void setRtbmrule(String rtbmrule)
{
	this.rtbmrule = rtbmrule;
}
public String getRcheckinflag()
{
	return rcheckinflag;
}
public void setRcheckinflag(String rcheckinflag)
{
	this.rcheckinflag = rcheckinflag;
}
public String getDlastdate()
{
	return dlastdate;
}
public void setDlastdate(String dlastdate)
{
	this.dlastdate = dlastdate;
}
//public null getHrts()
//{
//	return hrts;
//}
//public void setHrts(null hrts)
//{
//	this.hrts = hrts;
//}
public String getVstatus1()
{
	return vstatus1;
}
public void setVstatus1(String vstatus1)
{
	this.vstatus1 = vstatus1;
}
public Long getNstatus2()
{
	return nstatus2;
}
public void setNstatus2(Long nstatus2)
{
	this.nstatus2 = nstatus2;
}
public Boolean getBpsnperson()
{
	return bpsnperson;
}
public void setBpsnperson(Boolean bpsnperson)
{
	this.bpsnperson = bpsnperson;
}
public String getCpsnmobilephone()
{
	return cpsnmobilephone;
}
public void setCpsnmobilephone(String cpsnmobilephone)
{
	this.cpsnmobilephone = cpsnmobilephone;
}
public String getCpsnfphone()
{
	return cpsnfphone;
}
public void setCpsnfphone(String cpsnfphone)
{
	this.cpsnfphone = cpsnfphone;
}
public String getCpsnophone()
{
	return cpsnophone;
}
public void setCpsnophone(String cpsnophone)
{
	this.cpsnophone = cpsnophone;
}
public String getCpsninphone()
{
	return cpsninphone;
}
public void setCpsninphone(String cpsninphone)
{
	this.cpsninphone = cpsninphone;
}
public String getCpsnemail()
{
	return cpsnemail;
}
public void setCpsnemail(String cpsnemail)
{
	this.cpsnemail = cpsnemail;
}
public String getCpsnpostaddr()
{
	return cpsnpostaddr;
}
public void setCpsnpostaddr(String cpsnpostaddr)
{
	this.cpsnpostaddr = cpsnpostaddr;
}
public String getCpsnpostcode()
{
	return cpsnpostcode;
}
public void setCpsnpostcode(String cpsnpostcode)
{
	this.cpsnpostcode = cpsnpostcode;
}
public String getCpsnfaddr()
{
	return cpsnfaddr;
}
public void setCpsnfaddr(String cpsnfaddr)
{
	this.cpsnfaddr = cpsnfaddr;
}
public String getCpsnqqcode()
{
	return cpsnqqcode;
}
public void setCpsnqqcode(String cpsnqqcode)
{
	this.cpsnqqcode = cpsnqqcode;
}
public String getCpsnurl()
{
	return cpsnurl;
}
public void setCpsnurl(String cpsnurl)
{
	this.cpsnurl = cpsnurl;
}
public String getCpsnoseat()
{
	return cpsnoseat;
}
public void setCpsnoseat(String cpsnoseat)
{
	this.cpsnoseat = cpsnoseat;
}
public String getDenterunitdate()
{
	return denterunitdate;
}
public void setDenterunitdate(String denterunitdate)
{
	this.denterunitdate = denterunitdate;
}
public String getCpsnproperty()
{
	return cpsnproperty;
}
public void setCpsnproperty(String cpsnproperty)
{
	this.cpsnproperty = cpsnproperty;
}
public String getCpsnbankcode()
{
	return cpsnbankcode;
}
public void setCpsnbankcode(String cpsnbankcode)
{
	this.cpsnbankcode = cpsnbankcode;
}
public String getCpsnaccount()
{
	return cpsnaccount;
}
public void setCpsnaccount(String cpsnaccount)
{
	this.cpsnaccount = cpsnaccount;
}
public String getPk_hr_hi_person()
{
	return pk_hr_hi_person;
}
public void setPk_hr_hi_person(String pk_hr_hi_person)
{
	this.pk_hr_hi_person = pk_hr_hi_person;
}
public Boolean getBprobation()
{
	return bprobation;
}
public void setBprobation(Boolean bprobation)
{
	this.bprobation = bprobation;
}
public String getCdutyclass()
{
	return cdutyclass;
}
public void setCdutyclass(String cdutyclass)
{
	this.cdutyclass = cdutyclass;
}
public Boolean getBtaketm()
{
	return btaketm;
}
public void setBtaketm(Boolean btaketm)
{
	this.btaketm = btaketm;
}
public String getMpictureqpb()
{
	return mpictureqpb;
}
public void setMpictureqpb(String mpictureqpb)
{
	this.mpictureqpb = mpictureqpb;
}
public String getRidtype()
{
	return ridtype;
}
public void setRidtype(String ridtype)
{
	this.ridtype = ridtype;
}
public String getRcountry()
{
	return rcountry;
}
public void setRcountry(String rcountry)
{
	this.rcountry = rcountry;
}
public String getDleavedate()
{
	return dleavedate;
}
public void setDleavedate(String dleavedate)
{
	this.dleavedate = dleavedate;
}
public String getRfigure()
{
	return rfigure;
}
public void setRfigure(String rfigure)
{
	this.rfigure = rfigure;
}
public String getRworkstatus()
{
	return rworkstatus;
}
public void setRworkstatus(String rworkstatus)
{
	this.rworkstatus = rworkstatus;
}
public String getEmploymentform()
{
	return employmentform;
}
public void setEmploymentform(String employmentform)
{
	this.employmentform = employmentform;
}
public String getRpersonparameters()
{
	return rpersonparameters;
}
public void setRpersonparameters(String rpersonparameters)
{
	this.rpersonparameters = rpersonparameters;
}
public Boolean getBdutylock()
{
	return bdutylock;
}
public void setBdutylock(Boolean bdutylock)
{
	this.bdutylock = bdutylock;
}
public Boolean getBpsnshop()
{
	return bpsnshop;
}
public void setBpsnshop(Boolean bpsnshop)
{
	this.bpsnshop = bpsnshop;
}
public String getCardstate()
{
	return cardstate;
}
public void setCardstate(String cardstate)
{
	this.cardstate = cardstate;
}
public String getFirsthtbegindate()
{
	return firsthtbegindate;
}
public void setFirsthtbegindate(String firsthtbegindate)
{
	this.firsthtbegindate = firsthtbegindate;
}
public String getLasthtenddate()
{
	return lasthtenddate;
}
public void setLasthtenddate(String lasthtenddate)
{
	this.lasthtenddate = lasthtenddate;
}
public String getCpsn_nameen()
{
	return cpsn_nameen;
}
public void setCpsn_nameen(String cpsn_nameen)
{
	this.cpsn_nameen = cpsn_nameen;
}
public Double getSysage()
{
	return sysage;
}
public void setSysage(Double sysage)
{
	this.sysage = sysage;
}
public Double getSyscompage()
{
	return syscompage;
}
public void setSyscompage(Double syscompage)
{
	this.syscompage = syscompage;
}
public Double getSysworkage()
{
	return sysworkage;
}
public void setSysworkage(Double sysworkage)
{
	this.sysworkage = sysworkage;
}
public String getCregion()
{
	return cregion;
}
public void setCregion(String cregion)
{
	this.cregion = cregion;
}
public String getNatruetype()
{
	return natruetype;
}
public void setNatruetype(String natruetype)
{
	this.natruetype = natruetype;
}
public String getCshifttype()
{
	return cshifttype;
}
public void setCshifttype(String cshifttype)
{
	this.cshifttype = cshifttype;
}
public String getCdefaultbc()
{
	return cdefaultbc;
}
public void setCdefaultbc(String cdefaultbc)
{
	this.cdefaultbc = cdefaultbc;
}
public Timestamp getDenterdutyclassdate()
{
	return denterdutyclassdate;
}
public void setDenterdutyclassdate(Timestamp denterdutyclassdate)
{
	this.denterdutyclassdate = denterdutyclassdate;
}
public String getCresttype()
{
	return cresttype;
}
public void setCresttype(String cresttype)
{
	this.cresttype = cresttype;
}
public String getJobnumber()
{
	return jobnumber;
}
public void setJobnumber(String jobnumber)
{
	this.jobnumber = jobnumber;
}
public String getPersondepart()
{
	return persondepart;
}
public void setPersondepart(String persondepart)
{
	this.persondepart = persondepart;
}
public String getCardeffectivebegintime()
{
	return cardeffectivebegintime;
}
public void setCardeffectivebegintime(String cardeffectivebegintime)
{
	this.cardeffectivebegintime = cardeffectivebegintime;
}
public String getCardeffectiveendtime()
{
	return cardeffectiveendtime;
}
public void setCardeffectiveendtime(String cardeffectiveendtime)
{
	this.cardeffectiveendtime = cardeffectiveendtime;
}
public Boolean getKeyperson()
{
	return keyperson;
}
public void setKeyperson(Boolean keyperson)
{
	this.keyperson = keyperson;
}
public String getCleavereson()
{
	return cleavereson;
}
public void setCleavereson(String cleavereson)
{
	this.cleavereson = cleavereson;
}
public String getRemploystate()
{
	return remploystate;
}
public void setRemploystate(String remploystate)
{
	this.remploystate = remploystate;
}
public String getCdutylocker()
{
	return cdutylocker;
}
public void setCdutylocker(String cdutylocker)
{
	this.cdutylocker = cdutylocker;
}
public String getCdutylockernum()
{
	return cdutylockernum;
}
public void setCdutylockernum(String cdutylockernum)
{
	this.cdutylockernum = cdutylockernum;
}
public String getCjobcode()
{
	return cjobcode;
}
public void setCjobcode(String cjobcode)
{
	this.cjobcode = cjobcode;
}
public String getCjobrankcode()
{
	return cjobrankcode;
}
public void setCjobrankcode(String cjobrankcode)
{
	this.cjobrankcode = cjobrankcode;
}
public String getCjobgradecode()
{
	return cjobgradecode;
}
public void setCjobgradecode(String cjobgradecode)
{
	this.cjobgradecode = cjobgradecode;
}
public String getCpsnnowaddress()
{
	return cpsnnowaddress;
}
public void setCpsnnowaddress(String cpsnnowaddress)
{
	this.cpsnnowaddress = cpsnnowaddress;
}
public String getCurgentpsnname()
{
	return curgentpsnname;
}
public void setCurgentpsnname(String curgentpsnname)
{
	this.curgentpsnname = curgentpsnname;
}
public String getCurgentpsnphone()
{
	return curgentpsnphone;
}
public void setCurgentpsnphone(String curgentpsnphone)
{
	this.curgentpsnphone = curgentpsnphone;
}
public Boolean getBlongidcard()
{
	return blongidcard;
}
public void setBlongidcard(Boolean blongidcard)
{
	this.blongidcard = blongidcard;
}
public String getCleavetype()
{
	return cleavetype;
}
public void setCleavetype(String cleavetype)
{
	this.cleavetype = cleavetype;
}
public String getCdutycode()
{
	return cdutycode;
}
public void setCdutycode(String cdutycode)
{
	this.cdutycode = cdutycode;
}
public String getCfax()
{
	return cfax;
}
public void setCfax(String cfax)
{
	this.cfax = cfax;
}
public String getCtitle()
{
	return ctitle;
}
public void setCtitle(String ctitle)
{
	this.ctitle = ctitle;
}
public String getCreportto()
{
	return creportto;
}
public void setCreportto(String creportto)
{
	this.creportto = creportto;
}
public String getCstartworktime()
{
	return cstartworktime;
}
public void setCstartworktime(String cstartworktime)
{
	this.cstartworktime = cstartworktime;
}
public String getCendworktime()
{
	return cendworktime;
}
public void setCendworktime(String cendworktime)
{
	this.cendworktime = cendworktime;
}
public String getCloginsubids()
{
	return cloginsubids;
}
public void setCloginsubids(String cloginsubids)
{
	this.cloginsubids = cloginsubids;
}
public String getCpersonbarcode()
{
	return cpersonbarcode;
}
public void setCpersonbarcode(String cpersonbarcode)
{
	this.cpersonbarcode = cpersonbarcode;
}
public Boolean getBmobilecard()
{
	return bmobilecard;
}
public void setBmobilecard(Boolean bmobilecard)
{
	this.bmobilecard = bmobilecard;
}
public String getCmobilesites()
{
	return cmobilesites;
}
public void setCmobilesites(String cmobilesites)
{
	this.cmobilesites = cmobilesites;
}
public String getVoldcard()
{
	return voldcard;
}
public void setVoldcard(String voldcard)
{
	this.voldcard = voldcard;
}
public Long getMaxleadnum()
{
	return maxleadnum;
}
public void setMaxleadnum(Long maxleadnum)
{
	this.maxleadnum = maxleadnum;
}
public Long getMaxpaccountnum()
{
	return maxpaccountnum;
}
public void setMaxpaccountnum(Long maxpaccountnum)
{
	this.maxpaccountnum = maxpaccountnum;
}
public Long getMaxaccountnum()
{
	return maxaccountnum;
}
public void setMaxaccountnum(Long maxaccountnum)
{
	this.maxaccountnum = maxaccountnum;
}
public Long getMaxopportunitynum()
{
	return maxopportunitynum;
}
public void setMaxopportunitynum(Long maxopportunitynum)
{
	this.maxopportunitynum = maxopportunitynum;
}
public String getLeadrcyreg()
{
	return leadrcyreg;
}
public void setLeadrcyreg(String leadrcyreg)
{
	this.leadrcyreg = leadrcyreg;
}
public String getPaccountrcyreg()
{
	return paccountrcyreg;
}
public void setPaccountrcyreg(String paccountrcyreg)
{
	this.paccountrcyreg = paccountrcyreg;
}
public String getOpportunityrcyreg()
{
	return opportunityrcyreg;
}
public void setOpportunityrcyreg(String opportunityrcyreg)
{
	this.opportunityrcyreg = opportunityrcyreg;
}
@Override
public String toString()
{
	return JSON.toJSONString(this);
}
}

