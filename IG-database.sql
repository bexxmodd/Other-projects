-- Let's clone (portion) of the INSTAGRAM DATABASE --
-- First, create table USERS --
CREATE DATABASE instagram;
USE instagram;
CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
    );
DESC USERS;

-- Second, create table for Photos --
CREATE TABLE photos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(500) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
    );
DESC photos;

-- Third, create table for comments --
CREATE TABLE comments (
	id INT PRIMARY KEY AUTO_INCREMENT,
    comment_text VARCHAR(255) NOT NULL,
    users_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_ad TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(users_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
    );
DESC photos;
SHOW TABLES;

-- Fourth, create table for Likes --
CREATE TABLE likes (
	user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY (user_id, photo_id)
    );
DESC likes;

-- Fifth, create table for follower/followees --
CREATE TABLE follows (
	follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
    );

-- Sixth, create table for general tags --
CREATE TABLE tags (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Seventh, create table for photo tags --
CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);

