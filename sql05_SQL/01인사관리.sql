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
from departments; --릴레이션에는 순서가 X 셀렉트절에서 선택해서 순서 생김


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
from employees; --널값을 포함하는 산술식은 널로 평가!

select last_name, 12*salary*NVL(commission_pct, 1)
from employees; --commission_pct값중에 null인 값은 전부 1로 바꿈!

select last_name as name, commission_pct comm
from employees; -- 열머리글 대소문자 구분없이 alias 출력

select last_name "Name", salary*12 "Annual Salary"
from employees; -- 열머리글 ""속에서 대소문자 구분하며 alias 출력

select last_name as 이름, commission_pct 보너스
from employees;

select last_name||job_id as "Employees"
from employees; --연결연산자 || 사용 예

select last_name ||' is a '||job_id as "Employee Details"
from employees;

select department_id
from employees;

select distinct department_id
from employees;

select distinct department_id,job_id
from employees;

-------------과제--------------------------------------------------------------
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

------------------------------------------------------------과제끝

select employee_id, last_name, job_id, department_id
from employees
where department_id = 90;

select last_name, job_id, department_id
from employees
where last_name = 'Whalen'; --whalen으로 하면 안나온다~~~데이터는 대소문자 구분!!!

select last_name
from employees
where hire_date = '05/10/10'; -- hire_date = '17-FEB-' 출력시 안나온다~~~형식을 맞춰줘야함!!!!! YY/MM/DD 이런 식으로!

select last_name, salary
FROM employees
WHERE salary <= 3000;

select last_name, hire_date
from employees
where hire_date < '05/01/01';

select last_name, salary
FROM employees
WHERE salary BETWEEN 2500 AND 3500; --BETWEEN 3500 AND 2500 으로 쓰면 오류는 안 뜨지만.....쓰레기값!!!

select ascii('A'), ascii('a')
from dual; --A가 a보다 아스키코드 값이 작다!

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
WHERE hire_date LIKE '05%'; --05년 이후 입사한 직원들 조회 YY/MM/DD형식주의

SELECT last_name
FROM employees
WHERE last_name LIKE '_o%'; --_는 문자1개, 이름 두번째 글자에 o가 있는 직원 출력

select employee_id, last_name, job_id
FROM employees
where job_id LIKE '%SA_%'; --'%SA_%'는 SA가 들어간걸 출력함

select employee_id, last_name, job_id
FROM employees
where job_id LIKE '%SA\_%' escape '\'; -- \이후 문자 하나를 문자로 인식시켜줌

select employee_id, last_name, job_id
FROM employees
where job_id LIKE '%SA3_%' escape '3'; --'%SA\_%' escape '\'랑 '%SA3_%' escape '3' 같다.....\대신에 다른걸 써도 똑같음

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
    
    
--과제-------------------------------------------------------------
select *
from employees;

--1. 급여가 12,000를 넘는 사원의 이름과 급여를 표시하는 질의를 실행하시오.
select last_name, salary
from employees
where salary >= 12000;

--2. 사원 번호가 176인 사원의 이름과 부서 번호를 표시하는 질의를 실행하시오.
select last_name, department_id
from employees
where employee_id = 176; --employee IN (176); 도 가능!

--3. 급여가 5,000에서 12,000 사이에 포함되지 않는 모든 사원의 이름과 급여를 표시하도록 질의를 실행하시오.
select last_name, salary
from employees
where salary NOT between 5000 and 12000;

--6. 급여가 5,000와 12,000 사이이고 부서 번호가 20 또는 50인 사원의 이름과 급여를 나열하도록 질의를 작성하시오. 열 레이블은 Employee와 Monthly Salary로 각각 지정하시오.
select last_name as "Employee", salary as "Monthly Salary"
from employees
where salary between 5000 and 12000 
    and department_id in (20, 50);
    
--7. 2014년에 입사한 모든 사원의 이름과 입사일을 표시하시오.
select last_name, hire_date
from employees
--where hire_date between '04/01/01' and '04/12/31'; --14년 없어서 04년으로 해봄
--where hire_date >= '04/01/01'  and hire_date <'05/01/01'; --6번에서 salary는 이런식으로 쓰니까 오류났는데 날짜는 가능하네???
where hire_date LIKE '05%'; --good!

--8. 관리자가 없는 모든 사원의 이름과 업무를 표시하시오.
select last_name, job_id
from employees
where manager_id is null;

--10. 이름의 세번째 문자가 a인 모든 사원의 이름을 표시하시오.
select last_name, first_name
from employees
where last_name LIKE '__a%';

--11. 이름에 a와 e가 있는 모든 사원의 이름을 표시하시오.
select last_name
from employees
where last_name LIKE '%a%' and last_name LIKE '%e%'; --잘 보기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

--12. 업무가 영업 사원(SA_REP) 또는 사무원(ST_CLERK)이면서 급여가 2,500, 3,500, 7,000이 아닌 모든 사원의 이름, 업무 및 급여를 표시하시오.
select last_name, job_id, salary
from employees
where job_id IN ('SA_REP', 'ST_CLERK') --목록에 문자형or날짜형 이면 반드시 ''붙임!!!
    AND salary NOT IN (2500, 3500, 7000);
    
--13. 커미션 비율(commission_pct)이 20%인 모든 사원의 이름, 급여 및 커미션을 표시하도록 명령문을 작성하여 실행하시오.
select last_name, salary, commission_pct
from employees
where commission_pct = 0.2; /* commission_pct = .2; 로 써도 된다!*/


-------------------------------------------------------------------------------------------------과제 끝

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
order by 3; -- 3번째 칼럼 annsal기준으로 정렬!

select last_name, department_id, salary
from employees
order by department_id, salary desc;

select employee_id, salary
from employees
order by hire_date;


--<치환변수>--반복해서 특정 칼럼의 값을 조회할때 "칼럼명 = &메세지" 이렇게 입력해서 특정 칼럼의 조건을 바꿔가며 반복해서 조회하며 유용하게 사용!!! "&메세지"는 한번쓰고 버려지는 변수이다~
select employee_id, last_name, salary, department_id
from employees
where employee_id = &employee_num; -- &다음에는 뭐든지 쓸수있다(알림창에 뜨는 메세지임)

select employee_id, last_name, job_id, &column_name
from employees
where &condition
order by &order_column;

select employee_id, last_name, job_id, &&column_name --&&컬럼명 으로 쓰면 변수에 내가 입력한 값을 영구적으로 저장!
from employees
order by &column_name;

select employee_id, salary
from employees
order by &column_name; --아까 입력한 변수를 쓰고 있어서 알림창이 안뜸!

UNDEFINE column_name; --저장했던 변수의 값 삭제!! 이제 바로 위 구문 다시 실행하면 알림창 뜨는걸 확인할수있다!!!


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

--함수

desc dual;

select *
from dual;

select sysdate
from employees; --모든 행마다 sysdate 전부 뜨네~

select sysdate
from dual; --dual테이블은 x값 row하나뿐이니까 값이 하나만 뜨니까 좋네~

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

select last_name, SUBSTR(last_name, -3, 2) --뒤에서부터 3번째 자리에서 2개를 잘라내겠다
from employees
where department_id=90;

select employee_id, 
    CONCAT(first_name, last_name) NAME,
    job_id, LENGTH(last_name),
    INSTR(last_name, 'a') "Contains 'a'?" --이거 alias당....
FROM employees
WHERE SUBSTR(job_id, 4) = 'REP';

select LTRIM('yyedaymy', 'yea') 
FROM dual; --왼쪽에 처음 만나는 y나 e나 a를 잘라내겠다 (결과:daymy) 여러개있으면 계속 자름...3개중에 아닌 문자 나올때까지

select RTRIM('yyedaymy', 'yea') 
FROM dual; /*오른쪽에 처음 만나는 y나 e나 a를 잘라내겠다*/

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


--과제 sql03_1---------------------------------------------------------------------------

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
---------------------------------------------------------------과제끝---------------

select sysdate
from dual;

select last_name, (SYSDATE-hire_date)/7 as weeks
from employees
where department_id = 90;

select employee_id, hire_date, 
    MONTHS_BETWEEN(SYSDATE, hire_date) TENURE,
    ADD_MONTHS(hire_date, 6) REVIEW,
    NEXT_DAY(hire_date, '금'),
    LAST_DAY(hire_date)
from employees;

select ROUND(SYSDATE, 'YEAR'), --년도 기준, 7월 1일 0시 기준으로 반올림 24/01/01 if)오늘이 3월이라면...결과 23/01/01
    ROUND(SYSDATE, 'MONTH'), --월 기준, 16일 자정 기준으로 반올림, 23/12/01
    ROUND(SYSDATE, 'DAY'), --일주일의 가운데 기준(수요일 낮 12시), "현재 23/12/08 금요일 오후 3:32"이니까....다음주 일요일인 23/12/10
    ROUND(SYSDATE, 'DD') --하루의 가운데 기준 23/12/09
from dual;


--변환함수------------------------------------------------------------------------

select *
from employees
where employee_id = '101'; --암시적 변환....알아서 101을 숫자로 변환해서 검색해줬네...

ALTER SESSION SET
NLS_DATE_LANGUAGE = AMERICAN; --미국식으로 날짜표시 변경해서 알파벳으로 한번 봐보자~

select employee_id, to_char(hire_date, 'MM/YY') Month_Hired --원래 시스템은 YY/MM/DD
from employees;

select last_name,
    TO_CHAR(hire_date, 'fmDD MONTH YYYY') as hiredate  --1)Month로 넣으면 September 이렇게 나온다~ 2)fm없이 DD이렇게 쓰면 공백 제거없이 03 이렇게 나옴!
    from employees;
    
select last_name,
    TO_CHAR(hire_date, 'fmDdspth "of" Month YYYY fmHH:MI:SS AM') --fm공백제거 sp문자로표시한수 th서수
from employees;

select to_char(salary, '$99,999.00') salary
from employees;

select TO_NUMBER('$3,400', '$99,999')
from dual;

select TO_DATE('2010년, 02월', 'YYYY"년", MM"월"')
from dual;

select last_name, hire_date
from employees
where hire_date >
    TO_DATE('2005년 07월 01일', 'YYYY"년" MM"월" DD"일"');

select last_name, hire_date
from employees
where hire_date >
    TO_DATE('05/07/01', 'fxYY-MM-DD'); --앞에 fx 없으면 위랑 같은 결과 나온다...-자기가 알아서 인식해줌! 근데 fx붙으면 정확하게 똑같은 것만 인식!
    
select last_name, salary,
    NVL(commission_pct, 0),
    (salary*12) + (salary*12*NVL(commission_pct, 0)) AN_SAL
from employees;

select last_name, salary, NVL(commission_pct, '보너스 없음') --데이터 타입이 달라서 못 바꿈...오류! 이건 반드시 두 칼럼의 테이터 타입이 같아야 함
from employees;

select last_name, salary, NVL(TO_CHAR(commission_pct), '보너스 없음') --문자타입으로 바꿔주니까 오류없이 실행!
from employees;

select last_name, salary, commission_pct,
    NVL2(commission_pct, 'SAL+COMM', 'SAL') income --뒤에 두개의 칼럼은 반드시 같은 타입이어야 한다! (첫번째 칼럼은 달라도 상관없다)
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

--DECODE 함수
select last_name, job_id, salary,
        DECODE(job_id, 'IT_PROG',  1.10*salary,
                       'ST_CLERK', 1.15*salary,
                       'SA_REP',   1.20*salary,
                                    salary)
        REVISED_SALARY
FROM employees;



--과제 sql03_2---------------------------------------------------------------------------
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


--과제 sql04---------------------------------------------------------------------
--1 변환함수
select INITCAP(last_name)||' earns '||TO_CHAR(salary, '$99,999.00')||' monthly but wants '||TO_CHAR(salary*3, '$99,999.00')
from employees;

--2 날짜함수
select last_name, hire_date, TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6), '월'), 'YYYY.MM.DD DAY') REVIEW
from employees;

--3 월요일을 시작으로 요일 기준으로 결과 정렬...!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
select last_name, hire_date, TO_CHAR(hire_date, 'DAY') DAY
from employees
order by TO_CHAR(hire_date-1, 'd');

--4 커미션을 받지 않는 사원일 경우 "No Commission"을 표시
select last_name, NVL(TO_CHAR(commission_pct), 'No Commission') as COMM
from employees;

--5
select job_id "업무",
       DECODE(job_id, 'AD_PRES',  'A',
                      'ST_MAN',   'B',
                      'IT_PROG',  'C',
                      'SA_REP',   'D',
                      'ST_CLERK', 'E',
                                  '0')
       AS "등급"
from employees;


-------------------------------------------------------------과제끝---------------------


--그룹 함수

select AVG(salary), MAX(salary), MIN(salary), SUM(salary)
from employees
where job_id like '%REP%';

--SUM, AVG는 숫자 외에 문자형, 날짜형 불가능!!! MAX, MIN은 sort해서 문자형, 날짜형도 가능!!!
select MIN(hire_date), MAX(hire_date)
from employees;

--MAX, MIN은 sort해서 문자형, 날짜형도 가능!!!
select MIN(last_name), MAX(last_name)
from employees;

--회사의 사원수 구하기
select COUNT(*)
from employees;

--회사의 부서가 몇 개?
select COUNT(*)
FROm departments;

select COUNT(*)
from employees
where department_id = 50;

--부서아이디 80인 사원중 커미션 받는 사원(널 제외)
select COUNT(commission_pct)
from employees
where department_id = 80;

--DISTINCT 키워드
select COUNT(DISTINCT department_id)
from employees;
select COUNT(department_id)
from employees;

select department_id
from employees;
select DISTINCT department_id
from employees;

--두 열의 값 비교 : AVG는 널 값을 무시하므로...NVL사용해서 0으로 반환해서 '나누는 수'를 제대로 지정해줘야 한다!!!
select AVG(NVL(commission_pct, 0)), AVG(commission_pct)
from employees;


--GROUP BY 절

--select 절에 있는 열 중에서 그룹함수에 포함되지 않는 열은 반드시 GROUP BY 절에 있어야 한다!!!
select department_id, AVG(salary)
from employees
GROUP BY department_id;

--GROUP BY 절에 있는 열은 반드시 select절에 있어야 하는건 아니다~
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


--HAVING 절

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


--그룹 함수는 두 번까지만 중첩 가능!
select department_id, MAX(AVG(salary)) --이렇게 쓰면 오류남!
from employees
GROUP BY department_id;
--그룹 함수 중첩시에는 select절에는 어떠한 일반 칼럼도 올 수 없다!!!!!!!!!!!!!!!!!!!!!
select MAX(AVG(salary))
from employees
GROUP BY department_id;


--무결성(객체 무결성, 참조 무결성, 도메인 무결성) ___db쪽 제한을 최소화해주는 것이 좋다(프로그램 쪽에 제한을 두는것이 better)


--과제---------------------------------------------------------------------------
다음 세 문장의 유효성을 판별하여 True 또는 False로 답하시오.
--1. 그룹 함수는 여러 행에 적용되어 그룹 당 하나의 결과를 출력한다. T

--2. 그룹 함수는 계산에 널을 포함한다. F

--3. WHERE 절은 그룹 계산에 행(row)을 포함시키기 전에 행을 제한한다. T

--4. 모든 사원의 급여 최고액, 최저액, 총액 및 평균액을 표시하시오. 열 레이블을 각각 Maximum, Minimum, Sum 및 Average로 지정하고 결과를 정수로 반올림하도록 작성하시오.
select ROUND(MAX(salary)) "Maximum", ROUND(MIN(salary)) "Minimum", ROUND(SUM(salary)) "Sum", ROUND(AVG(salary)) "Average"
from employees;

--5. 위의 질의를 수정하여 각 업무 유형(job_id)별로 급여 최고액, 최저액, 총액 및 평균액을 표시하시오. 
select job_id, ROUND(MAX(salary)) "Maximum", ROUND(MIN(salary)) "Minimum", ROUND(SUM(salary)) "Sum", ROUND(AVG(salary)) "Average"
from employees
GROUP By job_id;

--6. 업무별 사원 수를 표시하는 질의를 작성하시오.
select job_id, count(*) --or) COUNT(employee_id) PK나 FK아닌경우 대비?
from employees
GROUP BY job_id;

--7. 관리자 수를 확인하시오. 열 레이블은 Number of Managers로 지정하시오. (힌트: MANAGER_ID 열을 사용)
select SUM(NVL(manager_id, 1, 0)) as "Number of Managers"
from employees; --다시...이러면 중복값 못 걸러냄

select manager_id
from employees;

select COUNT(DISTINCT manager_id) "Number of Managers"
from employees; 


--8. 최고 급여와 최저 급여의 차액을 표시하는 질의를 작성하고 열 레이블을 DIFFERENCE로 지정하시오.
select MAX(salary)-MIN(salary) as difference
from employees;


--9. 관리자 번호 및 해당 관리자에 속한 사원의 최저 급여를 표시하시오. 관리자를 알 수 없는 사원 및 최저 급여가 6,000 미만인 그룹은 제외시키고 결과를 급여에 대한 내림차순으로 정렬하시오.
select manager_id, min(salary)
from employees
where manager_id is not null
group by manager_id
having  MIN(salary)>=6000
order by 2 desc;


-- JOIN -------------------------------------------------------------------------

