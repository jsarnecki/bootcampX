SELECT teachers.name, students.name, assignments.name, 
  (SELECT assistance_requests.completed_at) 
  - (SELECT assistance_requests.started_at) AS duration
  FROM assistance_requests
  JOIN teachers ON teacher_id = teachers.id
  JOIN students ON student_id = students.id
  JOIN assignments ON assignment_id = assignments.id
  ORDER BY duration;