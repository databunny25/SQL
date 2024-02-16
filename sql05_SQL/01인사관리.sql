DESC departments;

SELECT *
FROM employees;

select *
from departments;

select department_id, location_id
from departments;

select location_id, department_id
from departments;

select department_id, department_id
from departments; --�����̼ǿ��� ������ X ����Ʈ������ �����ؼ� ���� ����


select last_name, hire_date, salary
from employees;

select last_name, salary, salary + 300
from employees;

select last_name, salary, 12*salary+100
from employees;

select last_name, salary, 12*(salary+100)
from employees;

select last_name, job_id, salary, commission_pct
from employees;

select last_name, 12*salary*commission_pct
from employees; --�ΰ��� �����ϴ� ������� �η� ��!

select last_name, 12*salary*NVL(commission_pct, 1)
from employees; --commission_pct���߿� null�� ���� ���� 1�� �ٲ�!

select last_name as name, commission_pct comm
from employees; -- ���Ӹ��� ��ҹ��� ���о��� alias ���

select last_name "Name", salary*12 "Annual Salary"
from employees; -- ���Ӹ��� ""�ӿ��� ��ҹ��� �����ϸ� alias ���

select last_name as �̸�, commission_pct ���ʽ�
from employees;

select last_name||job_id as "Employees"
from employees; --���Ῥ���� || ��� ��

select last_name ||' is a '||job_id as "Employee Details"
from employees;

select department_id
from employees;

select distinct department_id
from employees;

select distinct department_id,job_id
from employees;

-------------����--------------------------------------------------------------
--1
desc departments;

select *
from departments;

--2
desc employees;

select *
from employees;

select employee_id, last_name, job_id, hire_date as STARTDATE
from employees;

--3 
select distinct job_id
from employees;

--4
select employee_id "Emp #", last_name "Employee", job_id "Job", hire_date "Hire Date"
from employees;

--5
select job_id ||' , '|| last_name as "Employee and Title"
from employees;

------------------------------------------------------------������

select employee_id, last_name, job_id, department_id
from employees
where department_id = 90;

select last_name, job_id, department_id
from employees
where last_name = 'Whalen'; --whalen���� �ϸ� �ȳ��´�~~~�����ʹ� ��ҹ��� ����!!!

select last_name
from employees
where hire_date = '05/10/10'; -- hire_date = '17-FEB-' ��½� �ȳ��´�~~~������ ���������!!!!! YY/MM/DD �̷� ������!

select last_name, salary
FROM employees
WHERE salary <= 3000;

select last_name, hire_date
from employees
where hire_date < '05/01/01';

select last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500; --BETWEEN 3500 AND 2500 ���� ���� ������ �� ������.....�����Ⱚ!!!

select ascii('A'), ascii('a')
from dual; --A�� a���� �ƽ�Ű�ڵ� ���� �۴�!

SELECT employee_id, last_name, salary, manager_id
FROM employees
WHERE manager_id IN (100,101,201);

SELECT first_name
FROM employees
WHERE first_name LIKE 'S%';

SELECT last_name
FROM employees
WHERE last_name LIKE '%s';

SELECT last_name, hire_date
FROM employees
WHERE hire_date LIKE '05%'; --05�� ���� �Ի��� ������ ��ȸ YY/MM/DD��������

SELECT last_name
FROM employees
WHERE last_name LIKE '_o%'; --_�� ����1��, �̸� �ι�° ���ڿ� o�� �ִ� ���� ���

select employee_id, last_name, job_id
FROM employees
where job_id LIKE '%SA_%'; --'%SA_%'�� SA�� ���� �����

select employee_id, last_name, job_id
FROM employees
where job_id LIKE '%SA\_%' escape '\'; -- \���� ���� �ϳ��� ���ڷ� �νĽ�����

select employee_id, last_name, job_id
FROM employees
where job_id LIKE '%SA3_%' escape '3'; --'%SA\_%' escape '\'�� '%SA3_%' escape '3' ����.....\��ſ� �ٸ��� �ᵵ �Ȱ���

select employee_id, last_name, job_id
FROM employees
where job_id LIKE '%\_%' escape '\';

select employee_id, last_name, job_id
FROM employees
where job_id LIKE '%_M%';

select employee_id, last_name, job_id
FROM employees
where job_id LIKE '%\_M%' escape '\';

select *
from employees
where commission_pct is null;

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 10000 AND job_id LIKE '%MAN%';

SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary >= 10000 OR job_id LIKE '%MAN%';

SELECT last_name, job_id
FROM employees
WHERE job_id
      NOT IN ('IT_PROG', 'ST_CLERK', 'SA_REP');
      
SELECT last_name, job_id, salary
FROM employees
where job_id = 'SA_REP'
    OR job_id = 'AD_PRES'
    AND salary > 15000;
    
SELECT last_name, job_id, salary
FROM employees
where (job_id = 'SA_REP'
    OR job_id = 'AD_PRES')
    AND salary > 15000;
    
    
--����-------------------------------------------------------------
select *
from employees;

--1. �޿��� 12,000�� �Ѵ� ����� �̸��� �޿��� ǥ���ϴ� ���Ǹ� �����Ͻÿ�.
select last_name, salary
from employees
where salary >= 12000;

--2. ��� ��ȣ�� 176�� ����� �̸��� �μ� ��ȣ�� ǥ���ϴ� ���Ǹ� �����Ͻÿ�.
select last_name, department_id
from employees
where employee_id = 176; --employee IN (176); �� ����!

--3. �޿��� 5,000���� 12,000 ���̿� ���Ե��� �ʴ� ��� ����� �̸��� �޿��� ǥ���ϵ��� ���Ǹ� �����Ͻÿ�.
select last_name, salary
from employees
where salary NOT between 5000 and 12000;

--6. �޿��� 5,000�� 12,000 �����̰� �μ� ��ȣ�� 20 �Ǵ� 50�� ����� �̸��� �޿��� �����ϵ��� ���Ǹ� �ۼ��Ͻÿ�. �� ���̺��� Employee�� Monthly Salary�� ���� �����Ͻÿ�.
select last_name as "Employee", salary as "Monthly Salary"
from employees
where salary between 5000 and 12000 
    and department_id in (20, 50);
    
--7. 2014�⿡ �Ի��� ��� ����� �̸��� �Ի����� ǥ���Ͻÿ�.
select last_name, hire_date
from employees
--where hire_date between '04/01/01' and '04/12/31'; --14�� ��� 04������ �غ�
--where hire_date >= '04/01/01'  and hire_date <'05/01/01'; --6������ salary�� �̷������� ���ϱ� �������µ� ��¥�� �����ϳ�???
where hire_date LIKE '05%'; --good!

--8. �����ڰ� ���� ��� ����� �̸��� ������ ǥ���Ͻÿ�.
select last_name, job_id
from employees
where manager_id is null;

--10. �̸��� ����° ���ڰ� a�� ��� ����� �̸��� ǥ���Ͻÿ�.
select last_name, first_name
from employees
where last_name LIKE '__a%';

--11. �̸��� a�� e�� �ִ� ��� ����� �̸��� ǥ���Ͻÿ�.
select last_name
from employees
where last_name LIKE '%a%' and last_name LIKE '%e%'; --�� ����!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

--12. ������ ���� ���(SA_REP) �Ǵ� �繫��(ST_CLERK)�̸鼭 �޿��� 2,500, 3,500, 7,000�� �ƴ� ��� ����� �̸�, ���� �� �޿��� ǥ���Ͻÿ�.
select last_name, job_id, salary
from employees
where job_id IN ('SA_REP', 'ST_CLERK') --��Ͽ� ������or��¥�� �̸� �ݵ�� ''����!!!
    AND salary NOT IN (2500, 3500, 7000);
    
--13. Ŀ�̼� ����(commission_pct)�� 20%�� ��� ����� �̸�, �޿� �� Ŀ�̼��� ǥ���ϵ��� ��ɹ��� �ۼ��Ͽ� �����Ͻÿ�.
select last_name, salary, commission_pct
from employees
where commission_pct = 0.2; /* commission_pct = .2; �� �ᵵ �ȴ�!*/


-------------------------------------------------------------------------------------------------���� ��

select last_name, job_id, department_id, hire_date
from employees
order by hire_date;

select last_name, job_id, department_id, hire_date
from employees
order by hire_date desc;

select employee_id, last_name, salary*12 annsal
from employees
order by annsal;

select employee_id, last_name, salary*12 annsal
from employees
order by 3; -- 3��° Į�� annsal�������� ����!

select last_name, department_id, salary
from employees
order by department_id, salary desc;

select employee_id, salary
from employees
order by hire_date;


--<ġȯ����>--�ݺ��ؼ� Ư�� Į���� ���� ��ȸ�Ҷ� "Į���� = &�޼���" �̷��� �Է��ؼ� Ư�� Į���� ������ �ٲ㰡�� �ݺ��ؼ� ��ȸ�ϸ� �����ϰ� ���!!! "&�޼���"�� �ѹ����� �������� �����̴�~
select employee_id, last_name, salary, department_id
from employees
where employee_id = &employee_num; -- &�������� ������ �����ִ�(�˸�â�� �ߴ� �޼�����)

select employee_id, last_name, job_id, &column_name
from employees
where &condition
order by &order_column;

select employee_id, last_name, job_id, &&column_name --&&�÷��� ���� ���� ������ ���� �Է��� ���� ���������� ����!
from employees
order by &column_name;

select employee_id, salary
from employees
order by &column_name; --�Ʊ� �Է��� ������ ���� �־ �˸�â�� �ȶ�!

UNDEFINE column_name; --�����ߴ� ������ �� ����!! ���� �ٷ� �� ���� �ٽ� �����ϸ� �˸�â �ߴ°� Ȯ���Ҽ��ִ�!!!


--UNION--------------------------------------------------------------------------

select*
from job_history;

select employee_id
from employees
union
select employee_id
from job_history;

select employee_id
from employees
union ALL
select employee_id
from job_history;

select employee_id, job_id, department_id
from employees
union ALL
select employee_id, job_id, department_id
from job_history
order by employee_id;

select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history;

select employee_id, job_id
from job_history
intersect
select employee_id, job_id
from employees;

select employee_id, job_id
from employees
minus
select employee_id, job_id
from job_history;

select employee_id, job_id
from job_history
minus
select employee_id, job_id
from employees;

--�Լ�

desc dual;

select *
from dual;

select sysdate
from employees; --��� �ึ�� sysdate ���� �߳�~

select sysdate
from dual; --dual���̺��� x�� row�ϳ����̴ϱ� ���� �ϳ��� �ߴϱ� ����~

select 'The job id for ' ||UPPER(last_name)||' is '||LOWER(job_id) AS "EMPLOYEE DETAILS"
from employees;

select employee_id, last_name, department_id
from employees
where lower(last_name) = 'higgins';

select last_name, SUBSTR(last_name, 4)
from employees
where department_id=90;

select last_name, SUBSTR(last_name, 2, 2)
from employees
where department_id=90;

select last_name, SUBSTR(last_name, -3, 2) --�ڿ������� 3��° �ڸ����� 2���� �߶󳻰ڴ�
from employees
where department_id=90;

select employee_id, 
    CONCAT(first_name, last_name) NAME,
    job_id, LENGTH(last_name),
    INSTR(last_name, 'a') "Contains 'a'?" --�̰� alias��....
FROM employees
WHERE SUBSTR(job_id, 4) = 'REP';

select LTRIM('yyedaymy', 'yea') 
FROM dual; --���ʿ� ó�� ������ y�� e�� a�� �߶󳻰ڴ� (���:daymy) ������������ ��� �ڸ�...3���߿� �ƴ� ���� ���ö�����

select RTRIM('yyedaymy', 'yea') 
FROM dual; /*�����ʿ� ó�� ������ y�� e�� a�� �߶󳻰ڴ�*/

select round(345.678) as round1,
    round(345.678, 0) as round2,
    round(345.678, 1) as round3,
    round(345.678, -1) as round4
from dual;

select trunc(345.678) as trunc1,
    trunc(345.678, 0) as trunc2,
    trunc(345.678, 1) as trunc3,
    trunc(345.678, -1) as trunc4
from dual;

select last_name, salary, MOD(salary, 5000)
FROM employees;


--���� sql03_1---------------------------------------------------------------------------

--1
select sysdate "Date"
from dual;

--2
select employee_id, last_name, salary, TRUNC(salary*1.15) as "New Salary"
from employees;

--3
select employee_id, last_name, salary, TRUNC(salary*1.15) as "New Salary", salary*1.15-salary as "Increase"
from employees;

--4
select UPPER(last_name) "name", length(last_name) "name_length"
from employees
where UPPER(SUBSTR(last_name, 1, 1)) IN ( 'J', 'A', 'M')
order by 1;
---------------------------------------------------------------������---------------

select sysdate
from dual;

select last_name, (SYSDATE-hire_date)/7 as weeks
from employees
where department_id = 90;

select employee_id, hire_date, 
    MONTHS_BETWEEN(SYSDATE, hire_date) TENURE,
    ADD_MONTHS(hire_date, 6) REVIEW,
    NEXT_DAY(hire_date, '��'),
    LAST_DAY(hire_date)
from employees;

select ROUND(SYSDATE, 'YEAR'), --�⵵ ����, 7�� 1�� 0�� �������� �ݿø� 24/01/01 if)������ 3���̶��...��� 23/01/01
    ROUND(SYSDATE, 'MONTH'), --�� ����, 16�� ���� �������� �ݿø�, 23/12/01
    ROUND(SYSDATE, 'DAY'), --�������� ��� ����(������ �� 12��), "���� 23/12/08 �ݿ��� ���� 3:32"�̴ϱ�....������ �Ͽ����� 23/12/10
    ROUND(SYSDATE, 'DD') --�Ϸ��� ��� ���� 23/12/09
from dual;


--��ȯ�Լ�------------------------------------------------------------------------

select *
from employees
where employee_id = '101'; --�Ͻ��� ��ȯ....�˾Ƽ� 101�� ���ڷ� ��ȯ�ؼ� �˻������...

ALTER SESSION SET
NLS_DATE_LANGUAGE = AMERICAN; --�̱������� ��¥ǥ�� �����ؼ� ���ĺ����� �ѹ� ������~

select employee_id, to_char(hire_date, 'MM/YY') Month_Hired --���� �ý����� YY/MM/DD
from employees;

select last_name,
    TO_CHAR(hire_date, 'fmDD MONTH YYYY') as hiredate  --1)Month�� ������ September �̷��� ���´�~ 2)fm���� DD�̷��� ���� ���� ���ž��� 03 �̷��� ����!
    from employees;
    
select last_name,
    TO_CHAR(hire_date, 'fmDdspth "of" Month YYYY fmHH:MI:SS AM') --fm�������� sp���ڷ�ǥ���Ѽ� th����
from employees;

select to_char(salary, '$99,999.00') salary
from employees;

select TO_NUMBER('$3,400', '$99,999')
from dual;

select TO_DATE('2010��, 02��', 'YYYY"��", MM"��"')
from dual;

select last_name, hire_date
from employees
where hire_date >
    TO_DATE('2005�� 07�� 01��', 'YYYY"��" MM"��" DD"��"');

select last_name, hire_date
from employees
where hire_date >
    TO_DATE('05/07/01', 'fxYY-MM-DD'); --�տ� fx ������ ���� ���� ��� ���´�...-�ڱⰡ �˾Ƽ� �ν�����! �ٵ� fx������ ��Ȯ�ϰ� �Ȱ��� �͸� �ν�!
    
select last_name, salary,
    NVL(commission_pct, 0),
    (salary*12) + (salary*12*NVL(commission_pct, 0)) AN_SAL
from employees;

select last_name, salary, NVL(commission_pct, '���ʽ� ����') --������ Ÿ���� �޶� �� �ٲ�...����! �̰� �ݵ�� �� Į���� ������ Ÿ���� ���ƾ� ��
from employees;

select last_name, salary, NVL(TO_CHAR(commission_pct), '���ʽ� ����') --����Ÿ������ �ٲ��ִϱ� �������� ����!
from employees;

select last_name, salary, commission_pct,
    NVL2(commission_pct, 'SAL+COMM', 'SAL') income --�ڿ� �ΰ��� Į���� �ݵ�� ���� Ÿ���̾�� �Ѵ�! (ù��° Į���� �޶� �������)
from employees;

select first_name, LENGTH(first_name) "expr1",
    last_name, LENGTH(last_name) "expr2",
    NULLIF(LENGTH(first_name), LENGTH(last_name)) result
from employees;

select last_name, job_id, salary,
        case job_id WHEN 'IT_PROG' THEN 1.10*salary
                    WHEN 'ST_CLERK' THEN 1.10*salary
                    WHEN 'SA_REP' THEN 1.10*salary
                    else salary
        end "REVISED_SALARY"
from employees;

--CASE ~ WHEN ~ THEN
select last_name, salary,
    case when salary<5000 then 'Low'
        when salary<10000 then 'Medium'
        when salary<20000 then 'good'
                          else 'Excellent'
        end qualified_salary
from employees;

--DECODE �Լ�
select last_name, job_id, salary,
        DECODE(job_id, 'IT_PROG',  1.10*salary,
                       'ST_CLERK', 1.15*salary,
                       'SA_REP',   1.20*salary,
                                    salary)
        REVISED_SALARY
FROM employees;



--���� sql03_2---------------------------------------------------------------------------
--5
select last_name, ROUND(MONTHS_BETWEEN(sysdate, hire_date)) MONTHS_WORKED
from employees;

--6
select last_name, LPAD(salary, 15, '$') SALARY
from employees;

--7
select last_name, ROUND((sysdate-hire_date)/7) TENURE
from employees
where department_id = '90';


--���� sql04---------------------------------------------------------------------
--1 ��ȯ�Լ�
select INITCAP(last_name)||' earns '||TO_CHAR(salary, '$99,999.00')||' monthly but wants '||TO_CHAR(salary*3, '$99,999.00')
from employees;

--2 ��¥�Լ�
select last_name, hire_date, TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6), '��'), 'YYYY.MM.DD DAY') REVIEW
from employees;

--3 �������� �������� ���� �������� ��� ����...!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
select last_name, hire_date, TO_CHAR(hire_date, 'DAY') DAY
from employees
order by TO_CHAR(hire_date-1, 'd');

--4 Ŀ�̼��� ���� �ʴ� ����� ��� "No Commission"�� ǥ��
select last_name, NVL(TO_CHAR(commission_pct), 'No Commission') as COMM
from employees;

--5
select job_id "����",
       DECODE(job_id, 'AD_PRES',  'A',
                      'ST_MAN',   'B',
                      'IT_PROG',  'C',
                      'SA_REP',   'D',
                      'ST_CLERK', 'E',
                                  '0')
       AS "���"
from employees;


-------------------------------------------------------------������---------------------


--�׷� �Լ�

select AVG(salary), MAX(salary), MIN(salary), SUM(salary)
from employees
where job_id like '%REP%';

--SUM, AVG�� ���� �ܿ� ������, ��¥�� �Ұ���!!! MAX, MIN�� sort�ؼ� ������, ��¥���� ����!!!
select MIN(hire_date), MAX(hire_date)
from employees;

--MAX, MIN�� sort�ؼ� ������, ��¥���� ����!!!
select MIN(last_name), MAX(last_name)
from employees;

--ȸ���� ����� ���ϱ�
select COUNT(*)
from employees;

--ȸ���� �μ��� �� ��?
select COUNT(*)
FROm departments;

select COUNT(*)
from employees
where department_id = 50;

--�μ����̵� 80�� ����� Ŀ�̼� �޴� ���(�� ����)
select COUNT(commission_pct)
from employees
where department_id = 80;

--DISTINCT Ű����
select COUNT(DISTINCT department_id)
from employees;
select COUNT(department_id)
from employees;

select department_id
from employees;
select DISTINCT department_id
from employees;

--�� ���� �� �� : AVG�� �� ���� �����ϹǷ�...NVL����ؼ� 0���� ��ȯ�ؼ� '������ ��'�� ����� ��������� �Ѵ�!!!
select AVG(NVL(commission_pct, 0)), AVG(commission_pct)
from employees;


--GROUP BY ��

--select ���� �ִ� �� �߿��� �׷��Լ��� ���Ե��� �ʴ� ���� �ݵ�� GROUP BY ���� �־�� �Ѵ�!!!
select department_id, AVG(salary)
from employees
GROUP BY department_id;

--GROUP BY ���� �ִ� ���� �ݵ�� select���� �־�� �ϴ°� �ƴϴ�~
select AVG(salary)
from employees
GROUP BY department_id;

select department_id, job_id, sum(salary), COUNT(salary)
from employees
GROUP BY department_id, job_id
ORDER BY job_id;

select department_id, job_id, SUM(salary), COUNT(salary)
from employees
where department_id > 40
GROUP BY department_id, job_id
ORDER BY department_id;


--HAVING ��

select department_id, MAX(salary)
from employees
GROUP BY department_id
HAVING MAX(salary)>10000;

select job_id, SUM(salary) PAYROLL
from employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary) > 13000
ORDER BY PAYROLL; --or 2


--�׷� �Լ��� �� �������� ��ø ����!
select department_id, MAX(AVG(salary)) --�̷��� ���� ������!
from employees
GROUP BY department_id;
--�׷� �Լ� ��ø�ÿ��� select������ ��� �Ϲ� Į���� �� �� ����!!!!!!!!!!!!!!!!!!!!!
select MAX(AVG(salary))
from employees
GROUP BY department_id;


--���Ἲ(��ü ���Ἲ, ���� ���Ἲ, ������ ���Ἲ) ___db�� ������ �ּ�ȭ���ִ� ���� ����(���α׷� �ʿ� ������ �δ°��� better)


--����---------------------------------------------------------------------------
���� �� ������ ��ȿ���� �Ǻ��Ͽ� True �Ǵ� False�� ���Ͻÿ�.
--1. �׷� �Լ��� ���� �࿡ ����Ǿ� �׷� �� �ϳ��� ����� ����Ѵ�. T

--2. �׷� �Լ��� ��꿡 ���� �����Ѵ�. F

--3. WHERE ���� �׷� ��꿡 ��(row)�� ���Խ�Ű�� ���� ���� �����Ѵ�. T

--4. ��� ����� �޿� �ְ��, ������, �Ѿ� �� ��վ��� ǥ���Ͻÿ�. �� ���̺��� ���� Maximum, Minimum, Sum �� Average�� �����ϰ� ����� ������ �ݿø��ϵ��� �ۼ��Ͻÿ�.
select ROUND(MAX(salary)) "Maximum", ROUND(MIN(salary)) "Minimum", ROUND(SUM(salary)) "Sum", ROUND(AVG(salary)) "Average"
from employees;

--5. ���� ���Ǹ� �����Ͽ� �� ���� ����(job_id)���� �޿� �ְ��, ������, �Ѿ� �� ��վ��� ǥ���Ͻÿ�. 
select job_id, ROUND(MAX(salary)) "Maximum", ROUND(MIN(salary)) "Minimum", ROUND(SUM(salary)) "Sum", ROUND(AVG(salary)) "Average"
from employees
GROUP By job_id;

--6. ������ ��� ���� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�.
select job_id, count(*) --or) COUNT(employee_id) PK�� FK�ƴѰ�� ���?
from employees
GROUP BY job_id;

--7. ������ ���� Ȯ���Ͻÿ�. �� ���̺��� Number of Managers�� �����Ͻÿ�. (��Ʈ: MANAGER_ID ���� ���)
select SUM(NVL(manager_id, 1, 0)) as "Number of Managers"
from employees; --�ٽ�...�̷��� �ߺ��� �� �ɷ���

select manager_id
from employees;

select COUNT(DISTINCT manager_id) "Number of Managers"
from employees; 


--8. �ְ� �޿��� ���� �޿��� ������ ǥ���ϴ� ���Ǹ� �ۼ��ϰ� �� ���̺��� DIFFERENCE�� �����Ͻÿ�.
select MAX(salary)-MIN(salary) as difference
from employees;


--9. ������ ��ȣ �� �ش� �����ڿ� ���� ����� ���� �޿��� ǥ���Ͻÿ�. �����ڸ� �� �� ���� ��� �� ���� �޿��� 6,000 �̸��� �׷��� ���ܽ�Ű�� ����� �޿��� ���� ������������ �����Ͻÿ�.
select manager_id, min(salary)
from employees
where manager_id is not null
group by manager_id
having  MIN(salary)>=6000
order by 2 desc;


-- JOIN -------------------------------------------------------------------------

