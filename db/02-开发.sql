select * from dict_department;

select * from cost_share_rule;


select 
d.id department_id,
d.department_code,
d.department_type,
d.department_name,
c.id share_rule_id,
c.share_level,
c.share_rate
from 
dict_department d 
left join cost_share_rule c
on d.department_code=c.share_department_id

--drop view v_cost_share_rule

select * from v_cost_share_rule order by share_level,department_name


create view v_cost_share_rule
as
--һ����̯
select 
d.id department_id,
d.department_code,
d.department_type,
d.department_name,
c.id share_rule_id,
isnull(c.share_level,'һ����̯') share_level, 
isnull(c.share_rate,0) share_rate
from 
(
	select * from
	dict_department 
	where 
	department_type in('������','ҽ����','�ٴ���')
) d 
left join 
(
	select * from
	cost_share_rule
	where
	share_level='һ����̯'
) c
on d.department_code=c.share_department_id
union
--������̯
select 
d.id department_id,
d.department_code,
d.department_type,
d.department_name,
c.id share_rule_id,
isnull(c.share_level,'������̯') share_level, 
isnull(c.share_rate,0) share_rate
from 
(
	select * from
	dict_department 
	where 
	department_type in('ҽ����','�ٴ���')
) d 
left join 
(
	select * from
	cost_share_rule
	where
	share_level='������̯'
) c
on d.department_code=c.share_department_id
union
--������̯
select 
d.id department_id,
d.department_code,
d.department_type,
d.department_name,
c.id share_rule_id,
isnull(c.share_level,'������̯') share_level, 
isnull(c.share_rate,0) share_rate
from 
(
	select * from
	dict_department 
	where 
	department_type in('�ٴ���')
) d 
left join 
(
	select * from
	cost_share_rule
	where
	share_level='������̯'
) c
on d.department_code=c.share_department_id
