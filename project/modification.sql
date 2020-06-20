-- insert uchicago to schools 
insert into schools(scolname,location_country, location_state,location_city) values ('university of chicago', 'USA','IL','Chicago'); 

--insert the name of university of washington to schools 
insert into schools(scolname) values ('university of washington'); 

-- insert one graduated student who have turned into a professor into the professor table 
 insert into professors (profname,email,focus,pilab) select gradname, 'new_email', 'new_focus', 'new_lab' from students where now() - graddate > interval '1 day' limit 1;   

--insert school names of collaborators if the school name is not already in schools 
insert into schools (scolname) select collaborators.scolname from collaborators where collaborators.scolname not in (select schools.scolname from schools);

--delete the records that miss location_country information from schools
delete from schools where schools.location_country is null;

--delete students' names who have turned into a professor 
delete from students using professors where professors.profname = students.gradname;

--set professors' sex into default if it's null 
update professors set sex = DEFAULT where sex is null;

-- update size_students and size_staff in the lab called "name"
update labs set size_student = 5, size_staff = 10 where labname = 'name';