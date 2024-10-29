DROP DATABASE IF EXISTS movies_store;

CREATE DATABASE movies_store;

USE movies_store;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- data for users table 

INSERT INTO Users (username, password) VALUES 
('user1', 'pass1'), 
('user2', 'pass2'),
('user3', 'pass3');

CREATE TABLE Directors (
    director_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

-- data for directors table

INSERT INTO Directors (first_name, last_name) VALUES 
('Christopher', 'Nolan'), 
('Quentin', 'Tarantino'),
('Greta', 'Gerwig');

CREATE TABLE Genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL UNIQUE
);

-- data for genres table

INSERT INTO Genres (genre_name) VALUES ('Action'), ('Comedy'), ('Drama'), ('Horror');

CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    release_date DATE,
    genre_id INT,
    director_id INT,
    average_rating DECIMAL(2, 1),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id),
    FOREIGN KEY (director_id) REFERENCES Directors(director_id)
);

-- data for movies table

INSERT INTO Movies (title, release_date, genre_id, director_id, average_rating) VALUES
('Inception', '2010-07-16', 1, 1, 8.8),
('Pulp Fiction', '1994-10-14', 2, 2, 8.9),
('Little Women', '2019-12-25', 3, 3, 8.2);

CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    user_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 10),
    review_text TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- data for reviews table

INSERT INTO Reviews (movie_id, user_id, rating, review_text) VALUES
(1, 1, 9, 'Amazing movie with a complex plot.'),
(2, 2, 8, 'Classic Tarantino style, loved it!'),
(3, 1, 8, 'A beautiful adaptation of the novel.');
