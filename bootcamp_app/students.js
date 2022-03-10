const { Pool } = require('pg');

const pool = new Pool({
  users: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.connect();

const cohortMonth = process.argv[2];
const limit = process.argv[3]
const values = [`%${cohortMonth}%`, limit];
const queryString = `
SELECT students.id, students.name, cohorts.name AS cohort
FROM students
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
LIMIT $2;
`;

pool.query(queryString, values)
.then(res => {
  res.rows.forEach((user) => {
    console.log(`${user.name} has an id of ${user.id}, and was in cohort ${user.cohort}`);
  });
})
.catch(err => console.error('query error', err.stack));
