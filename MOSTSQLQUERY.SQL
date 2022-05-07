--Query 1 : List the employee whose employee number is 100.
    SELECT * FROM EMPLOYEES
    WHERE EMPLOYEE_ID=100;
    
--Query 2 : List the Employee whose salary is between 50 K to 1 Lac.
    SELECT * FROM EMPLOYEES
    WHERE SALARY BETWEEN 50000 AND 100000;
    
    SELECT * FROM EMPLOYEES
    WHERE SALARY >= 50000 AND SALARY <=100000;
    
--Query 3 : List the Employees whose name starts with ‘Ami’.
    SELECT * FROM EMPLOYEES
    WHERE FIRST_NAME LIKE 'Ami%';
 
--Query 4 : List the Employees whose name starts with A and surname starts with S.
    SELECT * FROM EMPLOYEES
    WHERE FIRST_NAME LIKE 'A%' AND LAST_NAME LIKE 'S%';  
    
--Query 5 : List the Employees whos surname contains kar word.
    SELECT * FROM EMPLOYEES
    WHERE FIRST_NAME LIKE '%kar%';
    
--Query 6: List the Employees whose name starts with P,B,R characters.
    SELECT * FROM EMPLOYEES
    WHERE FIRST_NAME LIKE '[PBR]%';
    
--Query 7: List the Employees whose name not starts with P,B,R characters.
    SELECT * FROM EMPLOYEES
    WHERE FIRST_NAME LIKE '[!PBR]%';
    
    SELECT * FROM EMPLOYEES
    WHERE FIRST_NAME NOT LIKE '[!PBR]%';
    
--Query 8 : What is query to fetch first record from Employee table?
    SELECT * FROM EMPLOYEES
    WHERE ROWNUM=1;
    
--Query 9: What is query to fetch last record from Employees table?
    SELECT * FROM 
    (SELECT ROWNUM AS RN,E.* FROM EMPLOYEES E ORDER BY EMPLOYEE_ID)
    WHERE RN=1;
    
    SELECT * FROM EMPLOYEES
    WHERE ROWID IN(SELECT MAX(ROWID) FROM EMPLOYEES);

--Query 10 : How to find 2nd highest salary of Employees using Self join?
 select distinct salary from EmpLoyeeS e1
 where 2 = (select count(distinct salary)
 from Employee e2 
 where  e1.salary <= e2.salary);
 
--Query 11 : What is query to display odd rows from the Employees table?
    SELECT * FROM
    (SELECT ROWNUM AS RN,E.* FROM EMPLOYEES E)
    WHERE MOD(RN,2)=1;
    
--Query 11 : What is query to display even rows from the Employees table?
    SELECT * FROM
    (SELECT ROWNUM AS RN,E.* FROM EMPLOYEES E)
    WHERE MOD(RN,2)=0; 
    
--Query 12 : Find Query to get information of Employee where Employee is not assigned to the department
    SELECT * FROM EMPLOYEES
    WHERE DEPARTMENT_ID NOT IN
    (SELECT DEPARTMENT_ID FROM EMPLOYEES);
    
--Query 13 : How to Show the Max salary and min salary together from Employees table?
    SELECT MAX(SALARY) FROM EMPLOYEES
    UNION
    SELECT MIN(SALARY) FROM EMPLOYEES;
    
--Query 14 : How to get distinct records from the Employees table without using distinct keyword.
    SELECT UNIQUE FIRST_NAME,LAST_NAME,EMAIL,SALARY 
    FROM EMPLOYEES;    
    
    SELECT FIRST_NAME,LAST_NAME,SALARY
    FROM EMPLOYEES
    UNION
    SELECT FIRST_NAME,LAST_NAME,SALARY
    FROM EMPLOYEES;
    
    SELECT FIRST_NAME,LAST_NAME,SALARY
    FROM EMPLOYEES
    INTERSECT
    SELECT FIRST_NAME,LAST_NAME,SALARY
    FROM EMPLOYEES;
    
    SELECT FIRST_NAME,LAST_NAME,SALARY
    FROM EMPLOYEES
    GROUP BY FIRST_NAME,LAST_NAME,SALARY;
    

--Query 15 :How to fetch all the records from Employee whose joining year is  2018?
    SELECT * FROM EMPLOYEES
    WHERE TO_CHAR(HIRE_DATE,'YYYY')='2018';
    
--Query 16 : How to display following using query?
    SELECT LPAD('*',ROWNUM,'*')
    FROM EMPLOYEES
    WHERE ROWNUM<4;
    
    
--Query 17: What is SQL Query to find maximum salary of each department?
    SELECT DEPARTMENT_ID,MAX(sALARY)
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID;
    
--Query 18:How Do you find all Employees with its managers?(Consider there is manager id also in Employee table)
    SELECT E.FIRST_NAME,E.LAST_NAME
    FROM EMPLOYEES E
    JOIN EMPLOYEES EE
    ON E.EMPLOYEE_ID=EE.MANAGER_ID;

--Query 19 : Display 3 to 7 records from Employee table.
    SELECT * FROM EMPLOYEES
    WHERE EMPLOYEE_ID BETWEEN 103 AND 107;
    
--Query 20 :How to fetch common records from two different tables Employees and Employees1 which has not any joining condition.
    SELECT * FROM EMPLOYEES
    INTERSECT
    SELECT * FROM EMPLOYEES1;
    
--Query 21 : Write a query to validate Email of Employee.
    SELECT Email FROM EmployeeS
    where NOT REGEXP_LIKE(Email, '[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}', 'i');    
    
--Query 22 : How to remove duplicate rows from Employees table.

--DISPLAY DUPLICATES RECORDS
    SELECT * FROM EMPLOYEES
    WHERE ROWID NOT IN
     (SELECT MAX(ROWID)FROM EMPLOYEES
    GROUP BY EMPLOYEE_ID);
    
 --REMOVE / DELETE DUPLICATES RECORDS   
    DELETE FROM DATADB
    WHERE ROWID NOT IN
    (SELECT MAX(ROWID)FROM EMPLOYEES
    GROUP BY EMPLOYEE_ID);
    
  
    
    


    
    
    
    
