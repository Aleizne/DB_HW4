-- 1 Количество исполнителей в каждом жанре.
-- 

SELECT g.name, COUNT(artist_id) FROM genre g 
LEFT JOIN artist_genre ag ON ag.genres_id = g.id
GROUP BY g.name;

-- 2 Количество треков, вошедших в альбомы 2019–2020 годов. --

SELECT a.name, COUNT(t.id) FROM track t 
LEFT JOIN album a ON t.album_id = a.id 
WHERE a.release_date >= '2018-01-01' AND a.release_date < '2021-01-01'
GROUP BY a.name;

-- 3 Средняя продолжительность треков по каждому альбому.--

SELECT a.name, AVG(t.duration) FROM track t 
LEFT JOIN album a ON t.album_id = a.id 
GROUP BY a.name;

-- 4 Все исполнители, которые не выпустили альбомы в 2020 году.--

SELECT DISTINCT ar.name FROM artist ar 
LEFT JOIN artist_album aa ON aa.artist_id = ar.id
LEFT JOIN album al ON aa.album_id = al.id
WHERE al.release_date < '2020-01-01' OR al.release_date >= '2021-01-01'
GROUP BY ar.name
;

--.5 Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами). --

SELECT co.name, ar.name FROM collection co 
JOIN collection_track ct ON ct.collection_id = co.id
JOIN track t ON ct.track_id = t.id
JOIN album a ON t.album_id = a.id
JOIN artist_album aa ON aa.album_id = a.id
JOIN artist ar ON aa.artist_id = ar.id
WHERE ar.id = 3
GROUP BY co.name, ar.name
;

-- 6. Вот тут очень смутно понимаю как работает эта магия. Даже проставил себе AS для наглядности--

SELECT al.name FROM album AS al
JOIN artist_album AS aa ON al.id = aa.album_id
JOIN (SELECT artist_id, COUNT(genres_id) AS genre_count FROM artist_genre AS ag
GROUP BY artist_id
HAVING COUNT(genres_id) > 1) AS ag ON ag.artist_id = aa.artist_id
;

-- 7. Наименования треков, которые не входят в сборники.--

SELECT t.name from Track AS t
LEFT JOIN collection_track AS ct ON ct.track_id = t.id
WHERE ct.track_id is NULL 
GROUP BY t.name
;

-- 8. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.--

SELECT ar.name, t.duration, t.name FROM artist AS ar
JOIN Artist_Album AS aa ON aa.artist_id = ar.id
JOIN Track AS t ON aa.album_id = t.album_id 
WHERE t.duration = (SELECT MIN(duration) FROM track)
ORDER BY ar.name
;

-- 9. Названия альбомов, содержащих наименьшее количество треков. ОМГ... Я не уверен что я понимаю ЧТО и КАК написал ниже(--

SELECT al.name FROM album AS al
JOIN (
  SELECT album_id 
  FROM track 
  GROUP BY album_id 
  HAVING count(id) = (
    SELECT min(tracks_count) 
    FROM (
      SELECT album_id, count(id) AS tracks_count 
      FROM track 
      GROUP BY album_id
      ) AS track_count
    )
  ) AS min_tr ON min_tr.album_id = al.id
  ;