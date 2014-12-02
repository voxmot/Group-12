# Lists all resources used by at least one student
SELECT resource_name 
  FROM usage_record NATURAL JOIN resource
  GROUP BY resource_name;

# Lists all resources used more than once
SELECT resource_name 
  FROM usage_record NATURAL JOIN resource
  GROUP BY resource_name
  HAVING COUNT(resource_name) > 1;

# List of last names of students who used desks
SELECT last_name
  FROM student NATURAL JOIN usage_record
  WHERE resource_id = (SELECT resource_id
                         FROM resource
                         WHERE resource_name = 'Desk')
  GROUP BY last_name;  

# Lists the resources the student with the last name Carr has used
SELECT resource_name 
  FROM resource NATURAL JOIN usage_record
  WHERE student_id = (SELECT student_id 
                        FROM student 
                        WHERE last_name = 'Carr')
  GROUP BY resource_name;
  
# Lists only usage record entries between the days specified  
SELECT * 
  FROM usage_record 
  WHERE usage_date >'2014-12-10' 
    AND usage_date < '2014-12-11';
  
# Lists the last names of students who used chairs on December 1st  
SELECT last_name 
  FROM student NATURAL JOIN usage_record 
  WHERE usage_date >'2014-12-1'
    AND usage_date < '2014-12-2' 
    AND (SELECT resource_id
          FROM resource
          WHERE resource_name = 'Chair');
