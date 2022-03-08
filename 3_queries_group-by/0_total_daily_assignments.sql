SELECT day, count(assignments) as num_of_assignments
  FROM assignments 
  GROUP BY day
  HAVING count(assignments) > 9
  ORDER BY day;