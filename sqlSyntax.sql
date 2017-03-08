SELECT name, year FROM movies WHERE year=1902 AND rank>5;

SELECT name, year FROM movies WHERE year=1992;

SELECT count(*) FROM movies WHERE year=1982;

SELECT * FROM actors WHERE last_name like '%stack%';

SELECT first_name, COUNT(*) c FROM actors GROUP BY first_name ORDER BY c;

SELECT first_name, COUNT(*) c FROM actors GROUP BY first_name ORDER BY c DESC LIMIT 10;

SELECT last_name, COUNT(*) c FROM actors GROUP BY last_name ORDER BY c DESC LIMIT 10;

SELECT first_name, last_name, COUNT(*) c FROM actors GROUP BY first_name, last_name ORDER BY c DESC LIMIT 10;

SELECT first_name, last_name, COUNT(*) role_count FROM actors INNER JOIN roles ON actors.id = roles.actor_id INNER JOIN movies ON roles.movie_id = movies.id GROUP BY first_name, last_name ORDER BY role_count DESC LIMIT 100;

SELECT movies_genres.genre, COUNT(movies_genres.genre) c FROM movies INNER JOIN movies_genres ON movies.id = movies_genres.movie_id GROUP BY movies_genres.genre ORDER BY c;

SELECT first_name, last_name FROM actors INNER JOIN roles ON actors.id = roles.actor_id INNER JOIN movies ON roles.movie_id = movies.id WHERE movies.name = "Braveheart" AND movies.year = 1995 ORDER BY actors.last_name;

-- Film-Noir
SELECT first_name, last_name, movies.name, movies.year FROM directors INNER JOIN movies_directors ON directors.id = movies_directors.director_id INNER JOIN movies ON movies_directors.movie_id = movies.id INNER JOIN movies_genres ON movies.id = movies_genres.movie_id WHERE movies_genres.genre = "Film-Noir" AND movies.year % 4 = 0 ORDER BY movies.name;

SELECT first_name, last_name, movies.name FROM actors INNER JOIN roles ON actors.id = roles.actor_id INNER JOIN movies ON movies.id = roles.movie_id INNER JOIN movies_genres ON movies.id = movies_genres.movie_id WHERE movies_genres.genre = "Drama" AND first_name != "Kevin" AND last_name != "Bacon" AND roles.movie_id IN 
        (SELECT movie_id FROM roles WHERE actor_id IN 
            (SELECT id FROM actors WHERE first_name = "Kevin" AND last_name = "Bacon"));

SELECT first_name, last_name, actors.id FROM actors INNER JOIN roles ON actors.id = roles.actor_id INNER JOIN movies ON movies.id = roles.movie_id WHERE movies.year < 1900 AND actors.id IN  
    (SELECT actors.id FROM actors INNER JOIN roles ON actors.id = roles.actor_id INNER JOIN movies ON movies.id = roles.movie_id WHERE movies.year > 2000) 
    GROUP BY first_name, last_name, actors.id;

SELECT first_name, last_name, movies.name, movies.year, COUNT(DISTINCT roles.role) nOfRoles FROM actors INNER JOIN roles ON actors.id = roles.actor_id INNER JOIN movies ON movies.id = roles.movie_id WHERE movies.year > 1990 GROUP BY first_name, last_name, movies.name HAVING nOfRoles >= 5;

SELECT movies.year, COUNT (*) nOfMovies FROM actors INNER JOIN roles ON actors.id = roles.actor_id INNER JOIN movies ON movies.id = roles.movie_id WHERE actors.gender = 'F' AND movies.id NOT IN  
    (SELECT movies.id FROM actors INNER JOIN roles ON actors.id = roles.actor_id INNER JOIN movies ON movies.id = roles.movie_id WHERE actors.gender = 'M') 
    GROUP BY movies.year;