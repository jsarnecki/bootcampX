SELECT students.name, avg(assignment_submissions.duration) AS avg_complete_time, avg(assignments.duration) as avg_assignment_duration
  FROM students
  JOIN assignment_submissions ON students.id = student_id
  JOIN assignments ON assignment_id = assignments.id
  WHERE students.end_date IS NULL
  GROUP BY students.name
  ORDER BY avg_complete_time ASC;