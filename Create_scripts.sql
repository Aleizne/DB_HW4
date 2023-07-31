CREATE TABLE IF NOT EXISTS Genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(80) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Artist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(80) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Artist_Genre (
    artist_id INTEGER REFERENCES Artist(id),
    genres_id INTEGER REFERENCES Genre(id), 
    CONSTRAINT artist_genre_pk PRIMARY KEY (artist_id, genres_id)
);

CREATE TABLE IF NOT EXISTS Album (
    id SERIAL PRIMARY KEY,
    name VARCHAR(80) UNIQUE NOT NULL,
    release_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Artist_Album (
    artist_id INTEGER REFERENCES Artist(id),
    album_id INTEGER REFERENCES Album(id), 
    CONSTRAINT artist_album_pk PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS Track (
    id SERIAL PRIMARY KEY,
    name VARCHAR(80) UNIQUE NOT NULL,
    Duration TIME NOT NULL,
    album_id INTEGER NOT NULL REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS Collection (
    id SERIAL PRIMARY KEY,
    name VARCHAR(80) UNIQUE NOT NULL,
    release_date DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS Collection_Track (
    collection_id INTEGER REFERENCES Collection(id),
    track_id INTEGER REFERENCES Track(id),
    CONSTRAINT collection_track_pk PRIMARY KEY (collection_id, track_id)
);