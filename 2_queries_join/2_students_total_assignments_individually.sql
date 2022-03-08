SELECT students.name as student, count(assignment_submissions.*) as total_submission
  FROM students
  JOIN assignment_submissions ON students.id = student_id
  WHERE students.end_date IS NULL
  GROUP BY students.name
  HAVING count(assignment_submissions.*) < 100;