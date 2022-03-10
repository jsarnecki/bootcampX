const { Pool } = require('pg');

const pool = new Pool({
  users: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.connect(console.log('Connected'));

// const limit = process.argv[3]
const cohortMonth = process.argv[2];
const values = [cohortMonth];
const queryString = `
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort, COUNT(assistance_requests) AS total_assistances
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = $1
GROUP BY teachers.name, cohorts.name
ORDER BY teacher;
`;

pool.query(queryString, values)
.then(res => {
  res.rows.forEach((user) => {
    console.log(`${user.cohort}: ${user.teacher}`);
  });
})
.catch(err => console.error('query error', err.stack));
