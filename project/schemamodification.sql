-- add email info to students 
alter table students add column email varchar;     

--change joint departnames into the combinations of two schools' names
alter table joindept alter column joinname type varchar using concat(joina, '+', joinb);

--drop location_city column from schools.
alter table schools drop column if exists location_city;

