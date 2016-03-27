select 
cd.date_month,
r.id,
r.department_type,
r.department_code,
r.department_name,
cd.renyuan_jingfei,
cd.weisheng_cailiao,
cd.yaopin,
cd.guding_zichan_zhejiu,
cd.wuxing_zichan_tanxiao,
cd.tiqu_yiliao_fengxian_jijin,
cd.qita_feiyong,
cd.heji,
r.share_rate_level_1,
r.share_rate_level_1*cd_sum.renyuan_jingfei/100	renyuan_jingfei_l1,
r.share_rate_level_1*cd_sum.weisheng_cailiao/100	weisheng_cailiao_l1,
r.share_rate_level_1*cd_sum.yaopin/100	yaopin_l1,
r.share_rate_level_1*cd_sum.guding_zichan_zhejiu/100	guding_zichan_zhejiu_l1,
r.share_rate_level_1*cd_sum.wuxing_zichan_tanxiao/100	wuxing_zichan_tanxiao_l1,
r.share_rate_level_1*cd_sum.tiqu_yiliao_fengxian_jijin/100	tiqu_yiliao_fengxian_jijin_l1,
r.share_rate_level_1*cd_sum.qita_feiyong/100	qita_feiyong_l1,
r.share_rate_level_1*cd_sum.heji/100	heji_l1 
from 
cost_share_rule r
left join
cost_direct cd
on r.department_code=cd.department_code
left join
v_cost_direct_sum cd_sum
on cd_sum.department_type='π‹¿Ì¿‡'