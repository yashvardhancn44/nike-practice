```

Q1: second highest salary

Select Max(sal)
FROM emp
WHERE
salary NOT IN
(Select Max(sal) from Emp);

or

Select Max(sal)
FROM emp
WHERE
salary < (Select Max(sal) from Emp);



Q2. highest paid employee in each dept
USING GROUP BY

SELECT
deptid,Max(salary)
FROM
EMP e
GROUPBY deptid;


Q3:  display alternate records

CONCEPT:-> PSEUDO Columns - rownum
- cannot use asterisk with it
- it doesn't have any space so need to use ALIAS
+ USING SUBQUERY

SELECT *
FROM (SELECT a,b,c, rownum rn
FROM emp
ORDER BY rn)
WHERE MOD(RN,2)!=0;


q4: dispay duplicates of a column (GROUP BY AND HAVING)
HAVING IS THE FILTER ON GROUPS

SELECT name, COUNT(name)
FROM emp
GROUP BY name
HAVING COUNT(*)>1;

if further asked to be ordered as per duplicate names
SELECT name, COUNT(name)
FROM emp
GROUP BY name
ORDER BY COUNT(*) ASC/DESC;


Q5 pattern

s1:first letter m

select ename
from emp
where emp like 'n%';

s2: ends with m

select ename
from emp
where emp like '%n';

s3: n in any position

select ename
from emp
where enam like '%n%;

s4: no n in any position

select ename
from emp
where ename NOT LIKE '%n%';



Q6: pattern searching

s1: string with length 4 characters

select ename
from emp
where ename like '____';


s2: names of employee with second letter as l and fourth as m
select ename
from emp
where ename like '_L_M%';

s3: names and hire dates for people joined in month dec
we are not using date function here

select hiredate, ename
from emp
where hiredate like '%DEC%';


s4: names of employee containning exactly 2 'L'

select ename
from emp
where ename like '%L%L%' AND NOT LIKE '%L%L%L%;


s5: starts with j and ends with s --> easy


Q7: Display Nth row in SQL

t1: using rownum  (row num doesn't work with >=??)

select * from emp
where rownum <=4
minus
select * from emp
where rownum <=3;



t2:

```
