use university_database_schema;

-- The average grade that is given by each professor
SELECT professors_name AS 'Professor', AVG(grade) AS 'Average Grade'
FROM professors
JOIN grades 
ON grade_professor_id = professors_id
GROUP BY professors_name;

-- The top grades for each student
SELECT MAX(grade) AS 'Top Grade' , student_name
FROM grades
JOIN students
ON student_id = grades_id
GROUP BY grade_student_id;

-- Group students by the courses that they are enrolled in
-- Class 1 (or first hour of Class)
SELECT student_name AS 'Student Name', c1.course_name AS 'Class 1'
FROM students
RIGHT JOIN courses c1
ON c1.course_id = student_course1_id
LEFT JOIN courses c2
ON c2.course_id = student_course2_id
GROUP BY student_id;
-- Class 2 (or second hour of class)
SELECT student_name AS 'Student Name', c2.course_name AS 'Class 2'
FROM students
RIGHT JOIN courses c1
ON c1.course_id = student_course1_id
RIGHT JOIN courses c2
ON c2.course_id = student_course2_id
GROUP BY student_id;

-- Create a summary report of courses and their average grades,
-- sorted by the most challenging course (course with the lowest average grade)
-- to the easiest course
SELECT course_name AS 'Course', AVG(grade) AS 'Average Grade'
FROM professors
JOIN grades 
ON grade_professor_id = professors_id
JOIN courses
ON course_id = grade_course_id
GROUP BY course_name
ORDER BY AVG(grade) ASC;

-- Finding which student and professor have the most courses in common
-- On my example database 487 students have the same professor twice and no more.
SELECT student_name AS 'Student', p1.professors_id AS 'First Hour Professor', p2.professors_id AS 'Second Hour Professor'
FROM students
JOIN professors p1
ON p1.professors_id = student_professor1_id
JOIN professors p2
ON p2.professors_id = student_professor2_id
WHERE(p1.professors_id = p2.professors_id);

SELECT COUNT(*)
FROM students
JOIN professors p1
ON p1.professors_id = student_professor1_id
JOIN professors p2
ON p2.professors_id = student_professor2_id
WHERE(p1.professors_id = p2.professors_id);