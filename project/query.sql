--select big scale schools based on the number of students 
select scolname as big_schools from schools where scale_students >999; 

--select students who are graduating today. the code was written on may 1st so today = may 1st 
select gradname as graduating_today from students where graddate = now() :: Date;

--calculate professors' age based on birthday and order them in desc 
 select age('2020-05-01',birthdate) as age from collaborators order by age desc;
 
 --output full address of schools based on 3 columns: country, state, city 
 select location_country || ',' || location_state || ',' || location_city as full_address from schools; 
 
 --find out total number of papers each professors have 
 select profname, sum(npaper) from professors group by profname;
 
 --output professors and their collaborators who share the same focus 
 select collaborators.focus, professors.profname, collaborators.profname from collaborators left join professors on collaborators.focus = professors.focus;