INSERT INTO artist(name) 
VALUES
('Evgeniy Sorokin'),
('Matvey Sorokin'),
('Ilya Sorokin'),
('Vladimir Voronov'),
('Free Mars Jazz Band'),
('Do#Dj Band'),
('Frank Singature'),
('ND')
;

INSERT INTO album(name, release_date) 
VALUES
('Birds Simphony', '2018-07-11' ),
('Python motives','2022-08-30'),
('SQL romances', '2023-07-27'),
('Sounds of Java', '2018-01-01'),
('Close Red Planet', '2085-01-03'),
('Jazz Homeland', '1969-05-15'),
('Swing Simple!', '1954-08-02'),
('Good Retro Music', '2000-01-01')
;

INSERT INTO genre (name) 
VALUES
('Nature Ambience' ),
('Binary Folk Reggie'),
('Interstar Melodic Metal'),
('Jazz'),
('Swing'),
('Modern Retro Cover')
;

INSERT INTO Collection(name, release_date) 
VALUES
('Beauty of Forest', '1033-07-11' ),
('The Way you Code','2018-09-30'),
('D&B is not about Drums', '2023-07-29'),
('Galactic Voyage', '2017-05-01'),
('Voice of Solar', '2087-01-03'),
('Do#Dj fest 2001', '2001-06-01'),
('Classic Voices', '1954-08-02'),
('Our Modern Retro', '2000-01-01')
;

INSERT INTO track(name, duration, album_id) 
VALUES
('Python Way', '2:56', 2),
('DB labirint', '1:28', 3),
('Check my SQL Spagetti', '9:29', 3),
('На безымянной высоте (cover)', '2:56', 8),
('Jazz 1', '1:38', 6),
('Jazz 2', '3:21', 6),
('Bird 1', '9:59', 1),
('Forest 1', '9:29', 1),
('Lake 1', '9:29', 1),
('Mars is near', '2:35', 5),
('Small Yellow Star', '1:13', 5),
('Galactic Rebel Ship', '1:32', 5),
('Swing with easy', '2:56', 7),
('Call of the Mercury', '1:28', 5),
('Rhombus is not the end', '0:35', 4),
('Fly to the moon', '2:31', 5),
('Wind of updating', '2:56', 2),
('Head like the Universe', '1:32', 3),
('Cyber Grass trough a window', '2:23', 5)
;

INSERT INTO Artist_Album(artist_id, album_id) 
VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8)
;

INSERT INTO Artist_genre(artist_id, genres_id) 
VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(5, 1),
(5, 2),
(6, 4),
(7, 5),
(8, 6)
;

INSERT INTO Collection_Track(collection_id, track_id) 
VALUES
(2, 1),
(3, 2),
(3, 3),
(8, 4),
(6, 5),
(6, 6),
(1, 7),
(1, 8),
(4, 10),
(5, 11),
(5, 12),
(7, 13),
(5, 14),
(2, 15),
(5, 16),
(3, 17)
;
