-- <��Ÿ ��ü> ==========================================================================

-- < INDEX >----------------------------------------------------------------------------
-- �� �Ⱦ�


-- < SEQUENCE >-----------------------------------------------------------------------
--����Ŭ�� ���� 
--�Խ��� �ѹ��� �ο��Ҷ� ���

--������ �����
create sequence dept_deptid_seq
                increment by 10
                start with 120
                maxvalue 9999
                nocache
                nocycle;
                
--������ ���...�ַ� nextval���� ��
insert into departments(department_id, department_name, location_id)
values (dept_deptid_seq.NEXTVAL, 'Support', 2500); --4�� �����غ�

select *
from departments; --department_id Į���� 120, 130, 140, 150 �� �ԷµǾ���!

--�������� �������� ���
ROLLBACK;

select *
from departments; --�Ʊ� ������ 120, 130, 140, 150 ����

insert into departments(department_id, department_name, location_id)
values (dept_deptid_seq.NEXTVAL, 'Support', 2500); --�ٽ� 4�� �����غ�

select *
from departments; --�ѹ� �� �ٽ� 4���ϴ� department_id �� 160, 170, 180 �� �Էµ�!!  ���� �����!!!!!


--���� ������ �� ��ȸ
select dept_deptid_seq.CURRVAL
from dual; --���� �������� ������ ����� Ȯ�� (CURRVAL�� ���� ������ �� ������)




--<SYNONYM>------------------------------------------------------------------------

create synonym d_sum
for dept_sum_vu;

select *
from d_sum;

select *
from dept_sum_vu; --���� ���Ǿ�� ���� ���̺� ��ȸ��� ����!

drop synonym d_sum; --����