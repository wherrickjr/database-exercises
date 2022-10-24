SELECT * FROM albums;
/* a. How many rows are in the albums table?

31

b. How many unique artist names are in the albums table?

23

c. What is the primary key for the albums table?
id

d. What is the oldest release date for any album in the albums table? What is the most recent release date?
1967
 */
SELECT DISTINCT artist FROM albums;
SELECT COUNT(DISTINCT artist) FROM albums; -- counts number of distinct values
SELECT release_date FROM albums
	ORDER BY release_date;

SELECT * FROM albums;

/*
 The name of all albums by Pink Floyd
 
 The Dark Side of the Moon
 The Wall

b. The year Sgt. Pepper's Lonely Hearts Club Band was released

c. The genre for the album Nevermind

d. Which albums were released in the 1990s

e. Which albums had less than 20 million certified sales

f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?

because it only searches for things that are exactly as it is written. */

SELECT name FROM albums WHERE artist = 'Pink Floyd'; -- find all albums by Pink Floyd
SELECT release_date FROM albums WHERE name = 'Sgt. Pepper\'s Lonely Hearts Club Band'; -- find release date
SELECT genre FROM albums WHERE name = 'Nevermind'; -- query for Nevermind
SELECT * FROM albums WHERE release_date BETWEEN 1990 AND 1999; -- find songs released in the 90s
select * from albums where sales < 20;
select * from albums where genre = 'Rock';
