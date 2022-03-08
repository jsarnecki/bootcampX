SELECT (
  SELECT count(assignments)
  FROM assignments
) - count(assignment_submissions) AS total_submissions
  FROM assignment_submissions
  JOIN students ON students.id = student_id
  WHERE students.name = 'Ibrahim Schimmel';