SELECT name, year FROM movies WHERE year=1902 AND rank>5;

SELECT name, year FROM movies WHERE year=1992;

SELECT count(*) FROM movies WHERE year=1982;

SELECT * FROM actors WHERE last_name like '%stack%';

SELECT first_name, COUNT(*) c FROM actors GROUP BY first_name ORDER BY c;

SELECT first_name, COUNT(*) c FROM actors GROUP BY first_name ORDER BY c DESC LIMIT 10;

SELECT last_name, COUNT(*) c FROM actors GROUP BY last_name ORDER BY c DESC LIMIT 10;

SELECT first_name, last_name, COUNT(*) c FROM actors GROUP BY first_name, last_name ORDER BY c DESC LIMIT 10;

SELECT first_name, last_name, COUNT(*) role_count FROM actors INNER JOIN roles ON actors.id = roles.actor_id INNER JOIN movies ON roles.movie_id = movies.id GROUP BY first_name, last_name ORDER BY role_count DESC LIMIT 100;