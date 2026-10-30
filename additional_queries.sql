-- Exercise 3.26
SELECT DISTINCT course_id, student_id
FROM Enrollments
GROUP BY course_id, student_id
HAVING COUNT(*) >= 3
ORDER BY course_id;
-- Exercise 3.27
SELECT student_id
FROM (
    SELECT student_id, course_id
    FROM Enrollments
    GROUP BY student_id, course_id
    HAVING COUNT(*) >= 2
) AS repeated_courses
GROUP BY student_id
HAVING COUNT(DISTINCT course_id) >= 3;
-- Exercise 3.28
SELECT t.teacher_id, t.name
FROM Teachers t
JOIN TeacherCourses tc ON t.teacher_id = tc.teacher_id
JOIN Courses c ON tc.course_id = c.course_id AND t.department_id = c.department_id
GROUP BY t.teacher_id, t.name, t.department_id
HAVING COUNT(DISTINCT c.course_id) = (
    SELECT COUNT(*) 
    FROM Courses 
    WHERE department_id = t.department_id
)
ORDER BY t.name;
-- Exercise 3.31
SELECT ID, name
FROM instructor
WHERE ID NOT IN (
    SELECT t.ID
    FROM teaches t
    JOIN takes tk ON t.course_id = tk.course_id 
                 AND t.sec_id = tk.sec_id 
                 AND t.semester = tk.semester 
                 AND t.year = tk.year
    WHERE tk.grade = 'A'
);
-- Exercise 3.32

-- Exercise 3.33
SELECT DISTINCT c.course_id, c.title
FROM course c
JOIN section s ON c.course_id = s.course_id
JOIN time_slot ts ON s.time_slot_id = ts.time_slot_id
WHERE c.dept_name = 'Comp. Sci.'
  AND ts.end_hr >= 12;
-- Exercise 3.34
SELECT course_id, sec_id, year, semester, COUNT(ID) AS num
FROM takes
GROUP BY course_id, sec_id, year, semester;
-- Exercise 3.35




