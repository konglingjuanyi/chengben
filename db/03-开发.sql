select 
* 
from 
v_cost_share_rule r 
left join cost_direct cd
on r.department_code=cd.department_code


select 
* 
from 
v_cost_share_rule r 

select * from cost_direct

select * from departmen

--更新科室类别
update cost_direct 
set 
department_code=(select t1.department_code from department t1 where t1.department_name=cost_direct.department_name),
department_type_code=(select t1.department_type_code from department t1 where t1.department_name=cost_direct.department_name)

drop view v_cost_direct

CREATE view [dbo].[v_cost_direct] as 
select 
t1.id,
t1.date_month,
t2.department_code,
t2.department_name,
t2.department_type_code,
t1.renyuan_jingfei,
t1.weisheng_cailiao,
t1.yaopin,
t1.guding_zichan_zhejiu,
t1.wuxing_zichan_tanxiao,
t1.tiqu_yiliao_fengxian_jijin,
t1.qita_feiyong,
t1.heji
from 
cost_direct t1
left join
department t2
on t1.department_code=t2.department_code
GO

select * from v_cost_direct

drop view v_cost_direct_sum

create view v_cost_direct_sum as
select 
date_month,
department_type_code,
	sum(isnull(renyuan_jingfei,0)) renyuan_jingfei,
	sum(isnull(weisheng_cailiao,0)) weisheng_cailiao,
	sum(isnull(yaopin,0)) yaopin,
	sum(isnull(guding_zichan_zhejiu,0)) guding_zichan_zhejiu,
	sum(isnull(wuxing_zichan_tanxiao,0)) wuxing_zichan_tanxiao,
	sum(isnull(tiqu_yiliao_fengxian_jijin,0)) tiqu_yiliao_fengxian_jijin,
	sum(isnull(qita_feiyong,0)) qita_feiyong,
	sum(isnull(renyuan_jingfei,0)+isnull(weisheng_cailiao,0)+isnull(yaopin,0)+isnull(guding_zichan_zhejiu,0)+isnull(wuxing_zichan_tanxiao,0)+isnull(tiqu_yiliao_fengxian_jijin,0)+isnull(qita_feiyong,0)) heji
from cost_direct 
group by 
date_month,
department_type_code

select * from v_cost_direct_sum

drop view v_cost_level1

create view v_cost_level1 as
select 
date_month,
id,
department_type,
department_code,
department_name,
share_rate_level_1,
renyuan_jingfei,renyuan_jingfei_l1,(renyuan_jingfei+renyuan_jingfei_l1) renyuan_jingfei_l1_sum,
weisheng_cailiao,weisheng_cailiao_l1,(weisheng_cailiao+weisheng_cailiao_l1) weisheng_cailiao_l1_sum,
yaopin,yaopin_l1,(yaopin+yaopin_l1) yaopin_l1_sum,
guding_zichan_zhejiu,guding_zichan_zhejiu_l1,(guding_zichan_zhejiu+guding_zichan_zhejiu_l1) guding_zichan_zhejiu_l1_sum,
wuxing_zichan_tanxiao,wuxing_zichan_tanxiao_l1,(wuxing_zichan_tanxiao+wuxing_zichan_tanxiao_l1) wuxing_zichan_tanxiao_l1_sum,
tiqu_yiliao_fengxian_jijin,tiqu_yiliao_fengxian_jijin_l1,(tiqu_yiliao_fengxian_jijin+tiqu_yiliao_fengxian_jijin_l1) tiqu_yiliao_fengxian_jijin_l1_sum,
qita_feiyong,qita_feiyong_l1,(qita_feiyong+qita_feiyong_l1) qita_feiyong_l1_sum,
heji,heji_l1,(heji+heji_l1) heji_l1_sum
from
(
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
isnull(cd.renyuan_jingfei,0)+isnull(cd.weisheng_cailiao,0)+isnull(cd.yaopin,0)+isnull(cd.guding_zichan_zhejiu,0)+isnull(cd.wuxing_zichan_tanxiao,0)+isnull(cd.tiqu_yiliao_fengxian_jijin,0)+isnull(cd.qita_feiyong,0) heji,
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
on r.department_code=cd.department_code and r.date_month=cd.date_month
left join
v_cost_direct_sum cd_sum
on r.date_month=cd_sum.date_month and cd_sum.department_type_code='04'--管理类
) level1

select * from v_cost_level1

drop view v_cost_level1_sum

create view v_cost_level1_sum as
select 
date_month,department_type,
sum(isnull(renyuan_jingfei_l1_sum,0))renyuan_jingfei_l1_sum,
sum(isnull(weisheng_cailiao_l1_sum,0))weisheng_cailiao_l1_sum,
sum(isnull(yaopin_l1_sum,0))yaopin_l1_sum,
sum(isnull(guding_zichan_zhejiu_l1_sum,0))guding_zichan_zhejiu_l1_sum,
sum(isnull(wuxing_zichan_tanxiao_l1_sum,0))wuxing_zichan_tanxiao_l1_sum,
sum(isnull(tiqu_yiliao_fengxian_jijin_l1_sum,0))tiqu_yiliao_fengxian_jijin_l1_sum,
sum(isnull(qita_feiyong_l1_sum,0))qita_feiyong_l1_sum,
sum(isnull(heji_l1_sum,0))heji_l1_sum 
from v_cost_level1 
group by date_month,department_type


select * from v_cost_level1_sum 

drop view v_cost_level2

create view v_cost_level2 as
select 
date_month,
id,
department_type,
department_code,
department_name,
share_rate_level_2,
renyuan_jingfei_l1_sum,renyuan_jingfei_l2,(renyuan_jingfei_l1_sum+renyuan_jingfei_l2) renyuan_jingfei_l2_sum,
weisheng_cailiao_l1_sum,weisheng_cailiao_l2,(weisheng_cailiao_l1_sum+weisheng_cailiao_l2) weisheng_cailiao_l2_sum,
yaopin_l1_sum,yaopin_l2,(yaopin_l1_sum+yaopin_l2) yaopin_l2_sum,
guding_zichan_zhejiu_l1_sum,guding_zichan_zhejiu_l2,(guding_zichan_zhejiu_l1_sum+guding_zichan_zhejiu_l2) guding_zichan_zhejiu_l2_sum,
wuxing_zichan_tanxiao_l1_sum,wuxing_zichan_tanxiao_l2,(wuxing_zichan_tanxiao_l1_sum+wuxing_zichan_tanxiao_l2) wuxing_zichan_tanxiao_l2_sum,
tiqu_yiliao_fengxian_jijin_l1_sum,tiqu_yiliao_fengxian_jijin_l2,(tiqu_yiliao_fengxian_jijin_l1_sum+tiqu_yiliao_fengxian_jijin_l2) tiqu_yiliao_fengxian_jijin_l2_sum,
qita_feiyong_l1_sum,qita_feiyong_l2,(qita_feiyong_l1_sum+qita_feiyong_l2) qita_feiyong_l2_sum,
heji_l1_sum,heji_l2,(heji_l1_sum+heji_l2) heji_l2_sum
from
(
select 
l1.date_month,
r.id,
r.department_type,
r.department_code,
r.department_name,
l1.renyuan_jingfei_l1_sum,
l1.weisheng_cailiao_l1_sum,
l1.yaopin_l1_sum,
l1.guding_zichan_zhejiu_l1_sum,
l1.wuxing_zichan_tanxiao_l1_sum,
l1.tiqu_yiliao_fengxian_jijin_l1_sum,
l1.qita_feiyong_l1_sum,
l1.heji_l1_sum,
r.share_rate_level_2,
r.share_rate_level_2*l1_sum.renyuan_jingfei_l1_sum/100	renyuan_jingfei_l2,
r.share_rate_level_2*l1_sum.weisheng_cailiao_l1_sum/100	weisheng_cailiao_l2,
r.share_rate_level_2*l1_sum.yaopin_l1_sum/100	yaopin_l2,
r.share_rate_level_2*l1_sum.guding_zichan_zhejiu_l1_sum/100	guding_zichan_zhejiu_l2,
r.share_rate_level_2*l1_sum.wuxing_zichan_tanxiao_l1_sum/100	wuxing_zichan_tanxiao_l2,
r.share_rate_level_2*l1_sum.tiqu_yiliao_fengxian_jijin_l1_sum/100	tiqu_yiliao_fengxian_jijin_l2,
r.share_rate_level_2*l1_sum.qita_feiyong_l1_sum/100	qita_feiyong_l2,
r.share_rate_level_2*l1_sum.heji_l1_sum/100	heji_l2 
from 
cost_share_rule r
left join
v_cost_level1 l1
on r.department_code=l1.department_code and r.date_month=l1.date_month
left join
v_cost_level1_sum l1_sum
on r.date_month=l1_sum.date_month and l1_sum.department_type='03'--辅助类
) level2

select * from v_cost_level2 

drop view v_cost_level2_sum

create view v_cost_level2_sum as
select 
date_month,department_type,
sum(isnull(renyuan_jingfei_l2_sum,0))renyuan_jingfei_l2_sum,
sum(isnull(weisheng_cailiao_l2_sum,0))weisheng_cailiao_l2_sum,
sum(isnull(yaopin_l2_sum,0))yaopin_l2_sum,
sum(isnull(guding_zichan_zhejiu_l2_sum,0))guding_zichan_zhejiu_l2_sum,
sum(isnull(wuxing_zichan_tanxiao_l2_sum,0))wuxing_zichan_tanxiao_l2_sum,
sum(isnull(tiqu_yiliao_fengxian_jijin_l2_sum,0))tiqu_yiliao_fengxian_jijin_l2_sum,
sum(isnull(qita_feiyong_l2_sum,0))qita_feiyong_l2_sum,
sum(isnull(heji_l2_sum,0))heji_l2_sum 
from v_cost_level2 
group by date_month,department_type

select * from v_cost_level2_sum

drop view v_cost_level3

create view v_cost_level3 as
select 
date_month,
id,
department_type,
department_code,
department_name,
share_rate_level_3,
renyuan_jingfei_l2_sum,renyuan_jingfei_l3,(renyuan_jingfei_l2_sum+renyuan_jingfei_l3) renyuan_jingfei_l3_sum,
weisheng_cailiao_l2_sum,weisheng_cailiao_l3,(weisheng_cailiao_l2_sum+weisheng_cailiao_l3) weisheng_cailiao_l3_sum,
yaopin_l2_sum,yaopin_l3,(yaopin_l2_sum+yaopin_l3) yaopin_l3_sum,
guding_zichan_zhejiu_l2_sum,guding_zichan_zhejiu_l3,(guding_zichan_zhejiu_l2_sum+guding_zichan_zhejiu_l3) guding_zichan_zhejiu_l3_sum,
wuxing_zichan_tanxiao_l2_sum,wuxing_zichan_tanxiao_l3,(wuxing_zichan_tanxiao_l2_sum+wuxing_zichan_tanxiao_l3) wuxing_zichan_tanxiao_l3_sum,
tiqu_yiliao_fengxian_jijin_l2_sum,tiqu_yiliao_fengxian_jijin_l3,(tiqu_yiliao_fengxian_jijin_l2_sum+tiqu_yiliao_fengxian_jijin_l3) tiqu_yiliao_fengxian_jijin_l3_sum,
qita_feiyong_l2_sum,qita_feiyong_l3,(qita_feiyong_l2_sum+qita_feiyong_l3) qita_feiyong_l3_sum,
heji_l2_sum,heji_l3,(heji_l2_sum+heji_l3) heji_l3_sum
from
(
select 
l1.date_month,
r.id,
r.department_type,
r.department_code,
r.department_name,
l1.renyuan_jingfei_l2_sum,
l1.weisheng_cailiao_l2_sum,
l1.yaopin_l2_sum,
l1.guding_zichan_zhejiu_l2_sum,
l1.wuxing_zichan_tanxiao_l2_sum,
l1.tiqu_yiliao_fengxian_jijin_l2_sum,
l1.qita_feiyong_l2_sum,
l1.heji_l2_sum,
r.share_rate_level_3,
r.share_rate_level_3*l2_sum.renyuan_jingfei_l2_sum/100	renyuan_jingfei_l3,
r.share_rate_level_3*l2_sum.weisheng_cailiao_l2_sum/100	weisheng_cailiao_l3,
r.share_rate_level_3*l2_sum.yaopin_l2_sum/100	yaopin_l3,
r.share_rate_level_3*l2_sum.guding_zichan_zhejiu_l2_sum/100	guding_zichan_zhejiu_l3,
r.share_rate_level_3*l2_sum.wuxing_zichan_tanxiao_l2_sum/100	wuxing_zichan_tanxiao_l3,
r.share_rate_level_3*l2_sum.tiqu_yiliao_fengxian_jijin_l2_sum/100	tiqu_yiliao_fengxian_jijin_l3,
r.share_rate_level_3*l2_sum.qita_feiyong_l2_sum/100	qita_feiyong_l3,
r.share_rate_level_3*l2_sum.heji_l2_sum/100	heji_l3 
from 
cost_share_rule r
left join
v_cost_level2 l1
on r.department_code=l1.department_code and r.date_month=l1.date_month
left join
v_cost_level2_sum l2_sum
on r.date_month=l2_sum.date_month and l2_sum.department_type='02'--医技类
) level3


select * from v_cost_level3

drop view v_cost_final

create view v_cost_final as
select 
*,
round(renyuan_jingfei_sum/total*100,2)	renyuan_jingfei_sum_rate	,
round(weisheng_cailiao_sum/total*100,2)	weisheng_cailiao_sum_rate	,
round(yaopin_sum/total*100,2)	yaopin_rate	,
round(guding_zichan_zhejiu_sum/total*100,2)	guding_zichan_zhejiu_sum_rate	,
round(wuxing_zichan_tanxiao_sum/total*100,2)	wuxing_zichan_tanxiao_sum_rate	,
round(tiqu_yiliao_fengxian_jijin_sum/total*100,2)	tiqu_yiliao_fengxian_jijin_sum_rate	,
round(qita_feiyong_sum/total*100,2)	qita_feiyong_sum_rate	,
round(heji_sum/total*100,2)	heji_sum_rate,
round(total/total*100,2) total_rate
from(
select 
*,
(renyuan_jingfei+weisheng_cailiao+yaopin+guding_zichan_zhejiu+wuxing_zichan_tanxiao+tiqu_yiliao_fengxian_jijin+qita_feiyong) direct_total,
(renyuan_jingfei_share+weisheng_cailiao_share+yaopin_share+guding_zichan_zhejiu_share+wuxing_zichan_tanxiao_share+tiqu_yiliao_fengxian_jijin_share+qita_feiyong_share) share_total,
(renyuan_jingfei_sum+weisheng_cailiao_sum+yaopin_sum+guding_zichan_zhejiu_sum+wuxing_zichan_tanxiao_sum+tiqu_yiliao_fengxian_jijin_sum+qita_feiyong_sum) total
from
(
select 
c.date_month,
c.department_type_code department_type,
c.department_code,
c.department_name,
c.renyuan_jingfei,(l3.renyuan_jingfei_l3_sum-c.renyuan_jingfei) renyuan_jingfei_share,l3.renyuan_jingfei_l3_sum renyuan_jingfei_sum,
c.weisheng_cailiao,(weisheng_cailiao_l3_sum-c.weisheng_cailiao) weisheng_cailiao_share,l3.weisheng_cailiao_l3_sum weisheng_cailiao_sum,
c.yaopin,(yaopin_l3_sum-c.yaopin) yaopin_share,l3.yaopin_l3_sum yaopin_sum,
c.guding_zichan_zhejiu,(guding_zichan_zhejiu_l3_sum-c.guding_zichan_zhejiu) guding_zichan_zhejiu_share,l3.guding_zichan_zhejiu_l3_sum guding_zichan_zhejiu_sum,
c.wuxing_zichan_tanxiao,(wuxing_zichan_tanxiao_l3_sum-c.wuxing_zichan_tanxiao) wuxing_zichan_tanxiao_share,l3.wuxing_zichan_tanxiao_l3_sum wuxing_zichan_tanxiao_sum,
c.tiqu_yiliao_fengxian_jijin,(tiqu_yiliao_fengxian_jijin_l3_sum-c.tiqu_yiliao_fengxian_jijin) tiqu_yiliao_fengxian_jijin_share,l3.tiqu_yiliao_fengxian_jijin_l3_sum tiqu_yiliao_fengxian_jijin_sum,
c.qita_feiyong,(qita_feiyong_l3_sum-c.qita_feiyong) qita_feiyong_share,l3.qita_feiyong_l3_sum qita_feiyong_sum,
c.heji,(heji_l3_sum-c.heji) heji_share,l3.heji_l3_sum heji_sum,
r.income,
r.cost_per_bed,
r.cost_per_treat
from cost_direct c
left join
cost_share_rule r
on c.date_month=r.date_month and c.department_code=r.department_code
left join
v_cost_level3 l3
on c.date_month=l3.date_month and c.department_code=l3.department_code
where c.department_type_code='01'--临床类
) linchuang
) t

select * from v_cost_final

drop view v_cost_final_sumby_costtype

alter view v_cost_final_sumby_costtype as 
select 
*,
round(renyuan_jingfei_sum/total*100,2)	renyuan_jingfei_sum_rate	,
round(weisheng_cailiao_sum/total*100,2)	weisheng_cailiao_sum_rate	,
round(yaopin_sum/total*100,2)	yaopin_sum_rate	,
round(guding_zichan_zhejiu_sum/total*100,2)	guding_zichan_zhejiu_sum_rate	,
round(wuxing_zichan_tanxiao_sum/total*100,2)	wuxing_zichan_tanxiao_sum_rate	,
round(tiqu_yiliao_fengxian_jijin_sum/total*100,2)	tiqu_yiliao_fengxian_jijin_sum_rate	,
round(qita_feiyong_sum/total*100,2)	qita_feiyong_sum_rate,
round(total/total*100,2) total_rate
from
(
select 
date_month,
department_type,
sum(	renyuan_jingfei	)	renyuan_jingfei	,
sum(	weisheng_cailiao	)	weisheng_cailiao	,
sum(	yaopin	)	yaopin	,
sum(	guding_zichan_zhejiu	)	guding_zichan_zhejiu	,
sum(	wuxing_zichan_tanxiao	)	wuxing_zichan_tanxiao	,
sum(	tiqu_yiliao_fengxian_jijin	)	tiqu_yiliao_fengxian_jijin	,
sum(	qita_feiyong	)	qita_feiyong	,
sum(	renyuan_jingfei_share	)	renyuan_jingfei_share,
sum(	weisheng_cailiao_share	)	weisheng_cailiao_share,
sum(	yaopin_share	)	yaopin_share,
sum(	guding_zichan_zhejiu_share	)	guding_zichan_zhejiu_share,
sum(	wuxing_zichan_tanxiao_share	)	wuxing_zichan_tanxiao_share,
sum(	tiqu_yiliao_fengxian_jijin_share	)	tiqu_yiliao_fengxian_jijin_share,
sum(	qita_feiyong_share	)	qita_feiyong_share,
sum(	renyuan_jingfei_sum	)	renyuan_jingfei_sum,
sum(	weisheng_cailiao_sum	)	weisheng_cailiao_sum,
sum(	yaopin_sum	)	yaopin_sum,
sum(	guding_zichan_zhejiu_sum	)	guding_zichan_zhejiu_sum,
sum(	wuxing_zichan_tanxiao_sum	)	wuxing_zichan_tanxiao_sum,
sum(	tiqu_yiliao_fengxian_jijin_sum	)	tiqu_yiliao_fengxian_jijin_sum,
sum(	qita_feiyong_sum	)	qita_feiyong_sum,
sum(	direct_total	)	direct_total,
sum(	share_total	)	share_total,
sum(	total	)	total,
SUM(income) income_sum
from v_cost_final 
group by date_month,department_type
) s


select * from v_cost_final_sumby_costtype

create view v_department_income as
select 
d.id,
d.department_code,
d.department_type,
d.department_name,
i.date_month,
ISNULL(i.shouru,0) shouru,
ISNULL(i.chuang_ri_chengben,0) chuang_ri_chengben,
ISNULL(i.zhen_ci_chengben,0) zhen_ci_chengben
from 
dict_department d
left join
department_income i
on d.department_code=i.department_code


select * from v_department_income

create view v_direct_cost as
select 
date_month,
case 
	when (grouping(department_name)=1 and grouping(department_type_name)=1) then '合计'
	when (grouping(department_name)=1) then department_type_name+'小计' 
	else department_name 
end department_name,
SUM(isnull(renyuan_jingfei,0)) renyuan_jingfei,
SUM(isnull(weisheng_cailiao,0)) weisheng_cailiao,
SUM(isnull(yaopin,0)) yaopin,
SUM(isnull(guding_zichan_zhejiu,0)) guding_zichan_zhejiu,
SUM(isnull(wuxing_zichan_tanxiao,0)) wuxing_zichan_tanxiao,
SUM(isnull(tiqu_yiliao_fengxian_jijin,0)) tiqu_yiliao_fengxian_jijin,
SUM(isnull(qita_feiyong,0)) qita_feiyong,
SUM(isnull(heji,0)) heji
from cost_direct
group by date_month,department_type_name,department_name
with rollup
having grouping(date_month)=1 or grouping(department_type_name)=0 or grouping(department_name)=0

drop view v_source_dept_acc_map_info

create view v_source_dept_acc_map_info as 
select *,relation_total_num-relation_ok_num relation_not_ok_num
from
(
select
t2.ccode source_system,
t2.cname+'-会计科目对照关系' relation_name,
t2.cname source_system_name,
sum(case when t1.source_acc_subject is null then 0 else 1 end) relation_total_num,
sum(case when t1.dest_acc_subject is null then 0 else 1 end) relation_ok_num
from 
EF_Cost_WbSource t2
left join
source_dept_acc_map t1
on t1.source_system=t2.cCode
group by t2.cCode,t2.cName
) t

drop view v_source_dept_map_info

create view v_source_dept_map_info as 
select *,relation_total_num-relation_ok_num relation_not_ok_num
from
(
select
t2.ccode source_system,
t2.cname+'-科室对照关系' relation_name,
t2.cname source_system_name,
sum(case when t1.source_dept_name is null then 0 else 1 end) relation_total_num,
sum(case when t1.dest_dept_code is null then 0 else 1 end) relation_ok_num
from 
EF_Cost_WbSource t2
left join
source_dept_map t1
on t1.source_system=t2.cCode
group by t2.cCode,t2.cName
) t