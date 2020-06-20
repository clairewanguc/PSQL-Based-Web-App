-- select schools are both primary school and secondary school in a joint department relationship 
 select schools.scolname from schools inner join joindept on schools.scolname = joindept.joina and schools.scolname in (select joinb from joindept); 
 
-- output total number of papers for collaborating professors 
select professors.profname as a, professors.npaper + collaborators.npaper as total, collaborators.profname as b from professors inner join profcolb on profcolb.colba = professors.profname inner join collaborators on collaborators.profname = profcolb.colbb;

-- output information about professors in 'b' department and their advising gradstudents' information 
select * from students right outer join professors on students.adname in (select profname from professors where professors.profdept = 'b');

-- output professors' information and information about the labs that they lead 
select * from professors left join labs on labs.labname = professors.pilab;

--out professors' names, emails, the school name that they are in, the department they are in and the department name that their labs are in 
select profname, professors.email, departments.scolname, profdept, labdept from professors inner join departments on departments.deptname = professors.profdept inner join labs on professors.pilab = labs.labname;

-- select professors and their collaborators whose focuses are the same as 'b'
select professors.profname, collaborators.profname from professors inner join collaborators on professors.focus = collaborators.focus inner join profcolb on profcolb.colba = professors.profname;

