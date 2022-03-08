SELECT cohorts.name as cohort_name, count(students.*) as student_count
  FROM cohorts
  JOIN students ON students.start_date = cohorts.start_date
  GROUP BY cohorts.name
  HAVING count(students) >= 18
  ORDER BY student_count;