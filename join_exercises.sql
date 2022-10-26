USE join_example_db;

SELECT * FROM roles;
-- id, name
SELECT * FROM users;
-- id, name, email, role_id

SELECT roles.name, COUNT(roles.id) -- this shows the amount of users in each role
FROM users
JOIN roles
ON users.role_id = roles.id
GROUP BY roles.name;
