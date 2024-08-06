SELECT * FROM HR_1;
SELECT * FROM HR_2;

--- Total Employees

select count(distinct(employeeid)) as Total_employees 
from hr_2;


--- Employees by gender

select gender,count(distinct(EmployeeNumber)) as Employee_count 
from hr_1 
group by gender;


--- Attrition count

select count(attrition) as Attrition_count 
from hr_1
where Attrition='yes';


--- Attrition rate

select format(avg(a.Attrition_yes)*100,2) as Attrition_rate
from
(select attrition,
       case
       when attrition='yes' 
       then 1 
       else 0
       end as attrition_yes
from hr_1) as a;



--- Gender wise attrition rate

select a.gender,format(avg(a.attrition_yes)*100,2) as Attrition_rate
 from 
(select gender,attrition,
case 
when Attrition='yes' 
then 1 
else 0 
end as attrition_yes from hr_1) as a
group by gender;



--- Department wise attrition rate

select a.Department,format(avg(a.attrition_yes)*100,2) as Attrition_Rate
from  
( select department,attrition,
case when attrition='Yes'
then 1
else 0
end as attrition_yes from hr_1 ) as a
group by a.department;



--- Average Hourly rate of Male Research Scientist

select jobrole,format(avg(hourlyrate),2) as Hourly_Rate,gender
from hr_1 
where jobrole='research scientist' and gender='male';
 
 
 
 --- Attrition rate Vs Monthly income status
 
 select a.department,
 format(avg(attrition_yes)*100,2) as attrition_rate,
 format(avg(monthlyincome),2) as AVG_monthlyincome 
 from
 (select department,attrition,employeenumber,
 case 
 when attrition='yes'
 then 1
 else 0 
 end as attrition_yes from hr_1)as a
 join
 hr_2 as b on a.employeenumber=b.employeeid
 group by a.department;
 
 
 
 --- Average working years for each Department
 
 select department,format(avg(totalworkingyears),0) as Avg_workingyears
 from 
 hr_1 join hr_2  on hr_1.employeenumber=hr_2.employeeid 
 group by department;
 
 
 
 --- Job Role Vs Work life balance
 
 select jobrole,avg(worklifebalance) as Avg_worklifebalance
 from
 hr_1  join hr_2 on hr_1.EmployeeNumber=hr_2.employeeid
 group by jobrole;
 
 
 
 --- Average salary of each job role 
 
 select jobrole,format(avg(monthlyincome),2) as Avg_monthlyincome 
 from
 hr_1 join hr_2 on hr_1.EmployeeNumber=hr_2.EmployeeID
 group by jobrole;
 
 
 
 --- Attrition count by Marital status
 
 select Maritalstatus,count(attrition) as Attrition_count 
 from hr_1 where attrition='yes'
 group by MaritalStatus;
 
 
 --- Average job satisfaction by department
 
 select department,format(avg(jobsatisfaction),2) as Job_satisfaction 
 from hr_1
 group by department;
 
 --- Performance rating by Department
 
 select Department,format(avg(performancerating),1) as Avg_performancerating
 from hr_1 join hr_2 on hr_1.EmployeeNumber=hr_2.EmployeeID
 group by department;
 

 
 
 
 
 
 
 
 

