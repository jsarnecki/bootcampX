SELECT students.name, AVG(assignment_submissions.duration) as avg_time
  FROM assignment_submissions
  JOIN students ON students.id = student_id
  WHERE students.end_date IS NULL
  GROUP BY students.name
  ORDER BY avg_time DESC;