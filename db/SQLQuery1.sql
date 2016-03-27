select * from dict_department_bak

select * from dict_department

select * from ef_cost_dept

select * from ef_cost_sharekind

drop view dict_department

create view dict_department as
(
select 
t1.cdeptcode id,
t1.cdeptcode department_code,
t1.cdeptname department_name,
t2.csharekindcode department_type_code,
t2.csharekindname department_type,
(0-cdeptcode) department_type_sort
from
ef_cost_dept t1, ef_cost_sharekind t2
where
t1.cEnd=1
and t1.cShareKindCode=t2.cShareKindCode
)


delete from cost_direct

select * from cost_direct

update cost_direct set department_code=
(select t2.department_code from dict_department t2 where cost_direct.department_name=t2.department_name)
,department_type_code=
(select t2.department_type_code from dict_department t2 where cost_direct.department_name=t2.department_name)
,department_type_name=
(select t2.department_type from dict_department t2 where cost_direct.department_name=t2.department_name)



update cost_direct set department_type=
(select t2.department_type from dict_department t2 where cost_direct.department_name=t2.department_name)

create view v_cost_direct as 
select 
t1.id,
t1.date_month,
t2.department_code,
t2.department_name,
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
dict_department t2
on t1.department_name=t2.department_name

select * from v_cost_direct


select * from uf_db..GL_accvouch

select * from v_cost_direct_sum

select * from v_cost_level1

select * from v_cost_level2

select * from v_cost_share_rule