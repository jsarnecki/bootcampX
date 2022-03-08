SELECT sum(assignment_submissions.duration) AS duration_count
  FROM students JOIN assignment_submissions ON student_id = students.id
  WHERE students.name = 'Ibrahim Schimmel';