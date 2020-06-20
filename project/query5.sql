--a query shows professors' collaborated projects as well as the contributors and their labs  
select distinct profname as professors, pilab as labs, projname as collaborated_project from professors inner join profcolb on profname in (select colba from profcolb) or profname in (select colbb from profcolb);

--select big scale schools based on the number of students and if they have colaborations with other schools. This was modified from a previous query which only consider the number of students
select scolname as big_schools from schools inner join scolcolb on schools.scolname = scolcolb.scola group by scolname having schools.scale_students >999;

-- select labs that has collaborations with others lab and has more than 10 students 
select labname as big_labs from labs natural join labcolb group by labname having size_student > 10; 

-- output departments in b country group by department name and its location 
select deptname, s.location_country from departments inner join schools s using (scolname) group by deptname, s.location_country having s.location_country = 'b';

-- list all labs including labs that are primary leading lab in a collaboration 
select labname into temp table all_labs from labs full outer join labcolb on labcolb.prim = labs.labname;

 --find out total number of professors who are also advisors 
 select count(profname) from professors a inner join prof_grad b on a.profname = b. adname; 
 
 -- output number of professors (including their collaborators) whose focus is 'b'
 select sum(case a.focus when 'b' then 1 else 0 end) + sum(case c.focus when 'b' then 1 else 0 end) as num from professors_by_focus a inner join profcolb x on x.colba = a.professor_name inner join collaborators c on x.colbb = c.profname; 
 
 --select professors who are in the family tree
  select professor_name from professors_by_focus p inner join academic_tree a on p.professor_name = a.prof_student;