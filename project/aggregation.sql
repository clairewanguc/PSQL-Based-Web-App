-- number of schools group by country 
select count(scolname) from schools group by location_country;

-- order the schools having the max scale in terms of number of students among all schools by their names 
select scolname from schools where scale_students = (select max(scale_students) from schools) order by scolname; 

--output average size in term of number of staff of labs 
select round(avg(size_staff)) from labs;  

-- total number of papers for each gender 
select sum(npaper) from professors group by sex;

-- min number of papers a professor published whose focus is 'b'
 select min(npaper) from professors group by focus having focus = 'b';
 
-- output number of graduating students whose advisor is b for each graduation date, order by the date 
select count(gradname), graddate from students where students.adname = 'b' group by graddate order by graddate;