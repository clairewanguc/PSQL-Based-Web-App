 -- create a safe view of professors' information without showing their personal information such as birthdate 
create materialized view professors_by_focus as select profname as professor_name, email, focus from professors order by focus;
 
 -- create a temp view to prepare for a recursive view listed below 
create temp view prof_grad as select gradname, adname from students where adname in (select gradname from students) or adname in (select profname from professors);

-- a recursive view to show "academic tree" which is similar to a family tree but shows professor and student relationships. a > b means a was b's advisor 
create recursive view academic_tree (prof_student) as select distinct adname as prof_student from prof_grad union all select (adname || ' > ' || gradname) as prof_student from prof_grad p inner join academic_tree t on t.prof_student = p.gradname;
