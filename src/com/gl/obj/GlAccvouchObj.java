package com.gl.obj;

import java.math.BigDecimal;
import java.sql.Timestamp;
import com.wuyg.common.dao.BaseDbObj;
import com.wuyg.common.util.TimeUtil;

import java.util.LinkedHashMap;
import com.alibaba.fastjson.JSON;

public class GlAccvouchObj extends BaseDbObj
{
	// private Long i_id;
	private String iperiod;
	private String csign;
	private Long isignseq;
	private Long ino_id;
	private Long inid;
	private Timestamp dbill_date;
	private Long idoc;
	private String cbill;
	private String ccheck;
	private String cbook;
	private Integer ibook;
	private String ccashier;
	private String iflag;
	private String ctext1;
	private String ctext2;
	private String cdigest;
	private String ccode;
	private String cexch_name;
	private BigDecimal md;
	private BigDecimal mc;
	private Double md_f;
	private Double mc_f;
	private Double nfrat;
	private Double nd_s;
	private Double nc_s;
	private String csettle;
	private String cn_id;
	private Timestamp dt_date;
	private String cdept_id;
	private String cperson_id;
	private String ccus_id;
	private String csup_id;
	private String citem_id;
	private String citem_class;
	private String cname;
	private String ccode_equal;
	private String iflagbank;
	private String iflagperson;
	private Boolean bdelete;
	private String coutaccset;
	private Long ioutyear;
	private String coutsysname;
	private String coutsysver;
	private Timestamp doutbilldate;
	private String ioutperiod;
	private String coutsign;
	private String coutno_id;
	private Timestamp doutdate;
	private String coutbillsign;
	private String coutid;
	private Boolean bvouchedit;
	private Boolean bvouchaddordele;
	private Boolean bvouchmoneyhold;
	private Boolean bvalueedit;
	private Boolean bcodeedit;
	private String ccodecontrol;
	private Boolean bpcsedit;
	private Boolean bdeptedit;
	private Boolean bitemedit;
	private Boolean bcussupinput;
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
	private Timestamp dreceive;
	private String cwldzflag;
	private Timestamp dwldztime;
	private Boolean bflagout;
	private Long ibg_overflag;
	private String cbg_auditor;
	private Timestamp dbg_audittime;
	private String cbg_auditopinion;
	private Boolean bwh_bgflag;
//	private Long ssxznum;
	private String cerrreason;
	private String bg_auditremark;
	private String cbudgetbuffer;
	private Long ibg_controlresult;
	private String ncvouchid;
	private Timestamp daudit_date;
	private String rowguid;
	private String cbankreconno;
	private String cnotetypecode;
	private String cnoteno;

	private String wbSource; // 外部来源
	private String debitORcredit; // 借方还是贷方：debit,credit
	private String wbDeptName;// 外部科室名
	private String wbAccSubName; // 外部会计科目名

	// private String zzDepartmentCode; // 对应总账科室编码
	private String zzDeptType; // 对应总账科室类型
	// private String zzAccountingSubjectCode; // 对应总账会计科目编码
	private String zzAccSubReverse;// 对应总账平账会计科目编码

	private boolean needWbDeptMap;// 科室需对照
	private boolean needZzDeptTyepMap;// 科室类型需对照
	private boolean needZzDeptTypeAccSubMap;// 会计科目需对照
	private boolean needZzAccSubReverseMap; // 借贷科目需对照

	@Override
	public String findKeyColumnName()
	{
		return "inid";
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
		return "gl_accvouch";
	}

	@Override
	public String findDefaultOrderBy()
	{
		return super.findDefaultOrderBy();
	}

	@Override
	public String getBasePath()
	{
		return "GlAccvouch";
	}

	@Override
	public String getCnName()
	{
		return "凭证";
	}

	public LinkedHashMap<String, String> getProperties()
	{
		LinkedHashMap<String, String> pros = new LinkedHashMap<String, String>();

		// pros.put("i_id", "自动编号");
		pros.put("iperiod", "会计期间");
		pros.put("csign", "凭证类别字");
		// pros.put("isignseq", "isignseq");
		pros.put("ino_id", "凭证编号");
		pros.put("inid", "行号");
		pros.put("dbill_date", "制单日期");
		pros.put("idoc", "附单据数");
		pros.put("cbill", "制单人");
		// pros.put("ccheck", "ccheck");
		// pros.put("cbook", "cbook");
		// pros.put("ibook", "记账标志");
		// pros.put("ccashier", "ccashier");
		// pros.put("iflag", "iflag");
		// pros.put("ctext1", "ctext1");
		// pros.put("ctext2", "ctext2");
		pros.put("cdigest", "摘要");
		pros.put("ccode", "凭证科目编码");
		// pros.put("cexch_name", "cexch_name");
		pros.put("md", "借方金额");
		pros.put("mc", "贷方金额");
		pros.put("md_f", "外币借方金额");
		pros.put("mc_f", "外币贷方金额");
		pros.put("nfrat", "汇率");
		pros.put("nd_s", "数量借方");
		pros.put("nc_s", "数量贷方");
		// pros.put("csettle", "csettle");
		// pros.put("cn_id", "cn_id");
		// pros.put("dt_date", "dt_date");
		pros.put("cdept_id", "凭证部门编码");
		// pros.put("cperson_id", "cperson_id");
		// pros.put("ccus_id", "ccus_id");
		// pros.put("csup_id", "csup_id");
		// pros.put("citem_id", "citem_id");
		// pros.put("citem_class", "citem_class");
		// pros.put("cname", "cname");
		// pros.put("ccode_equal", "ccode_equal");
		// pros.put("iflagbank", "iflagbank");
		// pros.put("iflagperson", "iflagperson");
		// pros.put("bdelete", "bdelete");
		// pros.put("coutaccset", "coutaccset");
		// pros.put("ioutyear", "ioutyear");
		// pros.put("coutsysname", "coutsysname");
		// pros.put("coutsysver", "coutsysver");
		// pros.put("doutbilldate", "doutbilldate");
		// pros.put("ioutperiod", "ioutperiod");
		// pros.put("coutsign", "coutsign");
		// pros.put("coutno_id", "coutno_id");
		// pros.put("doutdate", "doutdate");
		// pros.put("coutbillsign", "coutbillsign");
		// pros.put("coutid", "coutid");
		// pros.put("bvouchedit", "bvouchedit");
		// pros.put("bvouchaddordele", "bvouchaddordele");
		// pros.put("bvouchmoneyhold", "bvouchmoneyhold");
		// pros.put("bvalueedit", "bvalueedit");
		// pros.put("bcodeedit", "bcodeedit");
		// pros.put("ccodecontrol", "ccodecontrol");
		// pros.put("bpcsedit", "bpcsedit");
		// pros.put("bdeptedit", "bdeptedit");
		// pros.put("bitemedit", "bitemedit");
		// pros.put("bcussupinput", "bcussupinput");
		// pros.put("cdefine1", "cdefine1");
		// pros.put("cdefine2", "cdefine2");
		// pros.put("cdefine3", "cdefine3");
		// pros.put("cdefine4", "cdefine4");
		// pros.put("cdefine5", "cdefine5");
		// pros.put("cdefine6", "cdefine6");
		// pros.put("cdefine7", "cdefine7");
		// pros.put("cdefine8", "cdefine8");
		// pros.put("cdefine9", "cdefine9");
		// pros.put("cdefine10", "cdefine10");
		// pros.put("cdefine11", "cdefine11");
		// pros.put("cdefine12", "cdefine12");
		// pros.put("cdefine13", "cdefine13");
		// pros.put("cdefine14", "cdefine14");
		// pros.put("cdefine15", "cdefine15");
		// pros.put("cdefine16", "cdefine16");
		// pros.put("dreceive", "dreceive");
		// pros.put("cwldzflag", "cwldzflag");
		// pros.put("dwldztime", "dwldztime");
		// pros.put("bflagout", "bflagout");
		// pros.put("ibg_overflag", "ibg_overflag");
		// pros.put("cbg_auditor", "cbg_auditor");
		// pros.put("dbg_audittime", "dbg_audittime");
		// pros.put("cbg_auditopinion", "cbg_auditopinion");
		// pros.put("bwh_bgflag", "bwh_bgflag");
		// pros.put("ssxznum", "ssxznum");
		// pros.put("cerrreason", "cerrreason");
		// pros.put("bg_auditremark", "bg_auditremark");
		// pros.put("cbudgetbuffer", "cbudgetbuffer");
		// pros.put("ibg_controlresult", "ibg_controlresult");
		// pros.put("ncvouchid", "ncvouchid");
		// pros.put("daudit_date", "daudit_date");
		pros.put("rowguid", "行标识");
		// pros.put("cbankreconno", "cbankreconno");
		// pros.put("cnotetypecode", "cnotetypecode");
		// pros.put("cnoteno", "cnoteno");
		pros.put("wbDeptName", "外部科室名");
		pros.put("wbAccSubName", "外部科目");

		return pros;
	}

	public String getWbSource()
	{
		return wbSource;
	}

	public void setWbSource(String wbSource)
	{
		this.wbSource = wbSource;
	}

	// public Long getI_id()
	// {
	// return i_id;
	// }
	// public void setI_id(Long i_id)
	// {
	// this.i_id = i_id;
	// }
	public String getIperiod()
	{
		return iperiod;
	}

	public void setIperiod(String iperiod)
	{
		this.iperiod = iperiod;
	}

	public String getCsign()
	{
		return csign;
	}

	public void setCsign(String csign)
	{
		this.csign = csign;
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

	public Timestamp getDbill_date()
	{
		return dbill_date;
	}

	public void setDbill_date(Timestamp dbill_date)
	{
		this.dbill_date = dbill_date;
		this.iperiod = TimeUtil.date2str(dbill_date, "M");
	}

	public Long getIdoc()
	{
		return idoc;
	}

	public void setIdoc(Long idoc)
	{
		this.idoc = idoc;
	}

	public String getCbill()
	{
		return cbill;
	}

	public void setCbill(String cbill)
	{
		this.cbill = cbill;
	}

	public String getCcheck()
	{
		return ccheck;
	}

	public void setCcheck(String ccheck)
	{
		this.ccheck = ccheck;
	}

	public String getCbook()
	{
		return cbook;
	}

	public void setCbook(String cbook)
	{
		this.cbook = cbook;
	}

	public Integer getIbook()
	{
		return ibook;
	}

	public void setIbook(Integer ibook)
	{
		this.ibook = ibook;
	}

	public String getCcashier()
	{
		return ccashier;
	}

	public void setCcashier(String ccashier)
	{
		this.ccashier = ccashier;
	}

	public String getIflag()
	{
		return iflag;
	}

	public void setIflag(String iflag)
	{
		this.iflag = iflag;
	}

	public String getCtext1()
	{
		return ctext1;
	}

	public void setCtext1(String ctext1)
	{
		this.ctext1 = ctext1;
	}

	public String getCtext2()
	{
		return ctext2;
	}

	public void setCtext2(String ctext2)
	{
		this.ctext2 = ctext2;
	}

	public String getCdigest()
	{
		return cdigest;
	}

	public void setCdigest(String cdigest)
	{
		this.cdigest = cdigest;
	}

	public String getCcode()
	{
		return ccode;
	}

	public void setCcode(String ccode)
	{
		this.ccode = ccode;
	}

	public String getCexch_name()
	{
		return cexch_name;
	}

	public void setCexch_name(String cexch_name)
	{
		this.cexch_name = cexch_name;
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

	public Double getNfrat()
	{
		return nfrat;
	}

	public void setNfrat(Double nfrat)
	{
		this.nfrat = nfrat;
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

	public String getCsettle()
	{
		return csettle;
	}

	public void setCsettle(String csettle)
	{
		this.csettle = csettle;
	}

	public String getCn_id()
	{
		return cn_id;
	}

	public void setCn_id(String cn_id)
	{
		this.cn_id = cn_id;
	}

	public Timestamp getDt_date()
	{
		return dt_date;
	}

	public void setDt_date(Timestamp dt_date)
	{
		this.dt_date = dt_date;
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

	public String getCitem_id()
	{
		return citem_id;
	}

	public void setCitem_id(String citem_id)
	{
		this.citem_id = citem_id;
	}

	public String getCitem_class()
	{
		return citem_class;
	}

	public void setCitem_class(String citem_class)
	{
		this.citem_class = citem_class;
	}

	public String getCname()
	{
		return cname;
	}

	public void setCname(String cname)
	{
		this.cname = cname;
	}

	public String getCcode_equal()
	{
		return ccode_equal;
	}

	public void setCcode_equal(String ccode_equal)
	{
		this.ccode_equal = ccode_equal;
	}

	public String getIflagbank()
	{
		return iflagbank;
	}

	public void setIflagbank(String iflagbank)
	{
		this.iflagbank = iflagbank;
	}

	public String getIflagperson()
	{
		return iflagperson;
	}

	public void setIflagperson(String iflagperson)
	{
		this.iflagperson = iflagperson;
	}

	public Boolean getBdelete()
	{
		return bdelete;
	}

	public void setBdelete(Boolean bdelete)
	{
		this.bdelete = bdelete;
	}

	public String getCoutaccset()
	{
		return coutaccset;
	}

	public void setCoutaccset(String coutaccset)
	{
		this.coutaccset = coutaccset;
	}

	public Long getIoutyear()
	{
		return ioutyear;
	}

	public void setIoutyear(Long ioutyear)
	{
		this.ioutyear = ioutyear;
	}

	public String getCoutsysname()
	{
		return coutsysname;
	}

	public void setCoutsysname(String coutsysname)
	{
		this.coutsysname = coutsysname;
	}

	public String getCoutsysver()
	{
		return coutsysver;
	}

	public void setCoutsysver(String coutsysver)
	{
		this.coutsysver = coutsysver;
	}

	public Timestamp getDoutbilldate()
	{
		return doutbilldate;
	}

	public void setDoutbilldate(Timestamp doutbilldate)
	{
		this.doutbilldate = doutbilldate;
	}

	public String getIoutperiod()
	{
		return ioutperiod;
	}

	public void setIoutperiod(String ioutperiod)
	{
		this.ioutperiod = ioutperiod;
	}

	public String getCoutsign()
	{
		return coutsign;
	}

	public void setCoutsign(String coutsign)
	{
		this.coutsign = coutsign;
	}

	public String getCoutno_id()
	{
		return coutno_id;
	}

	public void setCoutno_id(String coutno_id)
	{
		this.coutno_id = coutno_id;
	}

	public Timestamp getDoutdate()
	{
		return doutdate;
	}

	public void setDoutdate(Timestamp doutdate)
	{
		this.doutdate = doutdate;
	}

	public String getCoutbillsign()
	{
		return coutbillsign;
	}

	public void setCoutbillsign(String coutbillsign)
	{
		this.coutbillsign = coutbillsign;
	}

	public String getCoutid()
	{
		return coutid;
	}

	public void setCoutid(String coutid)
	{
		this.coutid = coutid;
	}

	public Boolean getBvouchedit()
	{
		return bvouchedit;
	}

	public void setBvouchedit(Boolean bvouchedit)
	{
		this.bvouchedit = bvouchedit;
	}

	public Boolean getBvouchaddordele()
	{
		return bvouchaddordele;
	}

	public void setBvouchaddordele(Boolean bvouchaddordele)
	{
		this.bvouchaddordele = bvouchaddordele;
	}

	public Boolean getBvouchmoneyhold()
	{
		return bvouchmoneyhold;
	}

	public void setBvouchmoneyhold(Boolean bvouchmoneyhold)
	{
		this.bvouchmoneyhold = bvouchmoneyhold;
	}

	public Boolean getBvalueedit()
	{
		return bvalueedit;
	}

	public void setBvalueedit(Boolean bvalueedit)
	{
		this.bvalueedit = bvalueedit;
	}

	public Boolean getBcodeedit()
	{
		return bcodeedit;
	}

	public void setBcodeedit(Boolean bcodeedit)
	{
		this.bcodeedit = bcodeedit;
	}

	public String getCcodecontrol()
	{
		return ccodecontrol;
	}

	public void setCcodecontrol(String ccodecontrol)
	{
		this.ccodecontrol = ccodecontrol;
	}

	public Boolean getBpcsedit()
	{
		return bpcsedit;
	}

	public void setBpcsedit(Boolean bpcsedit)
	{
		this.bpcsedit = bpcsedit;
	}

	public Boolean getBdeptedit()
	{
		return bdeptedit;
	}

	public void setBdeptedit(Boolean bdeptedit)
	{
		this.bdeptedit = bdeptedit;
	}

	public Boolean getBitemedit()
	{
		return bitemedit;
	}

	public void setBitemedit(Boolean bitemedit)
	{
		this.bitemedit = bitemedit;
	}

	public Boolean getBcussupinput()
	{
		return bcussupinput;
	}

	public void setBcussupinput(Boolean bcussupinput)
	{
		this.bcussupinput = bcussupinput;
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

	public Timestamp getDreceive()
	{
		return dreceive;
	}

	public void setDreceive(Timestamp dreceive)
	{
		this.dreceive = dreceive;
	}

	public String getCwldzflag()
	{
		return cwldzflag;
	}

	public void setCwldzflag(String cwldzflag)
	{
		this.cwldzflag = cwldzflag;
	}

	public Timestamp getDwldztime()
	{
		return dwldztime;
	}

	public void setDwldztime(Timestamp dwldztime)
	{
		this.dwldztime = dwldztime;
	}

	public Boolean getBflagout()
	{
		return bflagout;
	}

	public void setBflagout(Boolean bflagout)
	{
		this.bflagout = bflagout;
	}

	public Long getIbg_overflag()
	{
		return ibg_overflag;
	}

	public void setIbg_overflag(Long ibg_overflag)
	{
		this.ibg_overflag = ibg_overflag;
	}

	public String getCbg_auditor()
	{
		return cbg_auditor;
	}

	public void setCbg_auditor(String cbg_auditor)
	{
		this.cbg_auditor = cbg_auditor;
	}

	public Timestamp getDbg_audittime()
	{
		return dbg_audittime;
	}

	public void setDbg_audittime(Timestamp dbg_audittime)
	{
		this.dbg_audittime = dbg_audittime;
	}

	public String getCbg_auditopinion()
	{
		return cbg_auditopinion;
	}

	public void setCbg_auditopinion(String cbg_auditopinion)
	{
		this.cbg_auditopinion = cbg_auditopinion;
	}

	public Boolean getBwh_bgflag()
	{
		return bwh_bgflag;
	}

	public void setBwh_bgflag(Boolean bwh_bgflag)
	{
		this.bwh_bgflag = bwh_bgflag;
	}
//
//	public Long getSsxznum()
//	{
//		return ssxznum;
//	}
//
//	public void setSsxznum(Long ssxznum)
//	{
//		this.ssxznum = ssxznum;
//	}

	public String getCerrreason()
	{
		return cerrreason;
	}

	public void setCerrreason(String cerrreason)
	{
		this.cerrreason = cerrreason;
	}

	public String getBg_auditremark()
	{
		return bg_auditremark;
	}

	public void setBg_auditremark(String bg_auditremark)
	{
		this.bg_auditremark = bg_auditremark;
	}

	public String getCbudgetbuffer()
	{
		return cbudgetbuffer;
	}

	public void setCbudgetbuffer(String cbudgetbuffer)
	{
		this.cbudgetbuffer = cbudgetbuffer;
	}

	public Long getIbg_controlresult()
	{
		return ibg_controlresult;
	}

	public void setIbg_controlresult(Long ibg_controlresult)
	{
		this.ibg_controlresult = ibg_controlresult;
	}

	public String getNcvouchid()
	{
		return ncvouchid;
	}

	public void setNcvouchid(String ncvouchid)
	{
		this.ncvouchid = ncvouchid;
	}

	public Timestamp getDaudit_date()
	{
		return daudit_date;
	}

	public void setDaudit_date(Timestamp daudit_date)
	{
		this.daudit_date = daudit_date;
	}

	public String getRowguid()
	{
		return rowguid;
	}

	public void setRowguid(String rowguid)
	{
		this.rowguid = rowguid;
	}

	public String getCbankreconno()
	{
		return cbankreconno;
	}

	public void setCbankreconno(String cbankreconno)
	{
		this.cbankreconno = cbankreconno;
	}

	public String getCnotetypecode()
	{
		return cnotetypecode;
	}

	public void setCnotetypecode(String cnotetypecode)
	{
		this.cnotetypecode = cnotetypecode;
	}

	public String getCnoteno()
	{
		return cnoteno;
	}

	public void setCnoteno(String cnoteno)
	{
		this.cnoteno = cnoteno;
	}

	public String getWbDeptName()
	{
		return wbDeptName;
	}

	public void setWbDeptName(String wbDeptName)
	{
		this.wbDeptName = wbDeptName;
	}

	public String getWbAccSubName()
	{
		return wbAccSubName;
	}

	public void setWbAccSubName(String wbAccSubName)
	{
		this.wbAccSubName = wbAccSubName;
	}

	public String getZzDeptType()
	{
		return zzDeptType;
	}

	public void setZzDeptType(String zzDeptType)
	{
		this.zzDeptType = zzDeptType;
	}

	public String getZzAccSubReverse()
	{
		return zzAccSubReverse;
	}

	public void setZzAccSubReverse(String zzAccSubReverse)
	{
		this.zzAccSubReverse = zzAccSubReverse;
	}

	public boolean isNeedWbDeptMap()
	{
		return needWbDeptMap;
	}

	public void setNeedWbDeptMap(boolean needWbDeptMap)
	{
		this.needWbDeptMap = needWbDeptMap;
	}

	public boolean isNeedZzDeptTyepMap()
	{
		return needZzDeptTyepMap;
	}

	public void setNeedZzDeptTyepMap(boolean needZzDeptTyepMap)
	{
		this.needZzDeptTyepMap = needZzDeptTyepMap;
	}

	public boolean isNeedZzDeptTypeAccSubMap()
	{
		return needZzDeptTypeAccSubMap;
	}

	public void setNeedZzDeptTypeAccSubMap(boolean needZzDeptTypeAccSubMap)
	{
		this.needZzDeptTypeAccSubMap = needZzDeptTypeAccSubMap;
	}

	public boolean isNeedZzAccSubReverseMap()
	{
		return needZzAccSubReverseMap;
	}

	public void setNeedZzAccSubReverseMap(boolean needZzAccSubReverseMap)
	{
		this.needZzAccSubReverseMap = needZzAccSubReverseMap;
	}

	@Override
	public String toString()
	{
		return JSON.toJSONString(this);
	}

	public String getDebitORcredit()
	{
		return debitORcredit;
	}

	public void setDebitORcredit(String debitORcredit)
	{
		this.debitORcredit = debitORcredit;
	}
	
	public boolean isDebit()
	{
		// 借方，成本
		return "debit".equalsIgnoreCase(debitORcredit);
	}
	
	public boolean isCredit()
	{
		// 贷方，收入
		return "credit".equalsIgnoreCase(debitORcredit);
	}
}
