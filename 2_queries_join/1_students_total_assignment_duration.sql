SELECT sum(assignment_submissions.duration) AS total_duration
  FROM assignment_submissions
  JOIN students ON students.id = student_id
  JOIN cohorts ON cohorts.end_date = students.end_date
  WHERE cohorts.name = 'FEB12';