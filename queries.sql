use dbUCF ; 

# Resources used by at least one student
SELECT resource_name 
  FROM usage_record NATURAL JOIN resource
  GROUP BY resource_name;


# Resources used more than once
SELECT resource_name 
  FROM usage_record NATURAL JOIN resource
  GROUP BY resource_name
  HAVING COUNT(resource_name) > 1;




# Last names of students who used desks
SELECT last_name
  FROM student NATURAL JOIN usage_record
  WHERE resource_id = (SELECT resource_id
                         FROM resource
                         WHERE resource_name = 'Desk' 
                        GROUP BY resource_name)
  GROUP BY last_name;  



# Resources a student with last name 'Carr' has used
SELECT resource_name 
  FROM resource NATURAL JOIN usage_record
  WHERE student_id=(SELECT student_id 
                        FROM student 
                        WHERE last_name = 'Carr'
                        GROUP BY last_name)
  GROUP BY resource_name;
  


# Usage Records entries created between the days specified  
SELECT * 
  FROM usage_record 
  WHERE usage_date >'2014-12-10' 
    AND usage_date < '2014-12-11';
  


/*
# Lists the last names of students who used chairs on December 1st  

SELECT last_name 
  FROM student NATURAL JOIN usage_record 
  WHERE usage_date >'2014-12-1'
    AND usage_date < '2014-12-2' 
    AND resource_id IN(SELECT resource_id
          FROM resource
          WHERE resource_name = 'Chair');
*/





# Last names of students who used chairs on December 1st  
SELECT * FROM Resource NATURAL JOIN 
       (SELECT *  FROM student NATURAL JOIN usage_record    
        WHERE usage_date >'2014-12-1' AND usage_date < '2014-12-2'  ) as OnDate 
WHERE Resource.resource_name='Chairs' ;



# First Names of Students who have used the most resources with number of times used
SELECT first_name, withRecord.occurrances 
  FROM Student NATURAL JOIN (select student_id, count(student_id) AS occurrances 
                                FROM usage_record 
                                GROUP BY student_id 
                                ORDER BY occurrances DESC ) AS withRecord 
  LIMIT 5;


# First Names of students who have used the resources between the dates 2014-12-10 and 2014-12-11
SELECT first_name, withRecord.occurrances 
  FROM Student NATURAL JOIN (select student_id, count(student_id) AS occurrances 
                                FROM usage_record 
                                WHERE usage_date >'2014-12-10' AND usage_date < '2014-12-11'
                                GROUP BY student_id 
                                ORDER BY occurrances DESC ) AS withRecord 
  LIMIT 5;


