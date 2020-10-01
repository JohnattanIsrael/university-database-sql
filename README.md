>Build a SQL database for a university that manages students, courses, professors, and grades.

--Build a database with the following tables: Students, Courses, Professors, Grades
--Foreign key relationships between the tables
--Create a script that populates all of the database tables with sample data
--SQL query scripts for:
--The average grade that is given by each professor
--The top grades for each student
--Group students by the courses that they are enrolled in
--Create a summary report of courses and their average grades, sorted by the most challenging --course (course with the lowest average grade) to the easiest course
--Finding which student and professor have the most courses in common

<The Example DataBase for Students and Grades was created by generating 2000+ commands using javascript random() and String Interpolation >

SQL example query generated with javascript

INSERT INTO students(student_name, student_course1_id, student_course2_id,\
student_professor1_id, student_professor2_id)\
VALUES (\
'Student24',\
(SELECT course_id FROM courses WHERE course_id = 4),\
(SELECT course_id FROM courses WHERE course_id = 2),\
(SELECT professors_id FROM professors WHERE professors_id = 4),\
(SELECT professors_id FROM professors WHERE professors_id = 2)\
);\
INSERT INTO grades(grade, grade_student_id, grade_course_id, grade_professor_id)\
VALUES(\
2,\
(SELECT student_id FROM students WHERE student_id = 24),\
(SELECT course_id FROM courses WHERE course_id = 4),\
(SELECT professors_id FROM professors WHERE professors_id = 4)\
);\
INSERT INTO grades(grade, grade_student_id, grade_course_id, grade_professor_id)\
VALUES(\
5,\
(SELECT student_id FROM students WHERE student_id = 24),\
(SELECT course_id FROM courses WHERE course_id = 2),\
(SELECT professors_id FROM professors WHERE professors_id = 2)\
);\
UPDATE students\
SET student_grades_id = (SELECT grades_id FROM grades WHERE grades_id = 24 )\
WHERE student_id = 24;\