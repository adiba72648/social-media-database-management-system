-- Social Media Database Management System

CREATE DATABASE social_media_db;
USE social_media_db;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    join_date DATE
);

CREATE TABLE Posts (
    post_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    content VARCHAR(255) NOT NULL,
    post_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Likes (
    like_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    post_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (post_id) REFERENCES Posts(post_id)
);

CREATE TABLE Comments (
    comment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    post_id INT,
    comment_text VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (post_id) REFERENCES Posts(post_id)
);

INSERT INTO Users (username, email, join_date) VALUES
('Adiba', 'adiba@example.com', '2026-10-01'),
('Sara', 'sara@example.com', '2026-10-02'),
('Aisha', 'aisha@example.com', '2026-10-03');

INSERT INTO Posts (user_id, content, post_date) VALUES
(1, 'Welcome to my social media!', '2026-10-10'),
(2, 'Learning database management.', '2026-10-11'),
(3, 'Hello everyone!', '2026-10-12');

INSERT INTO Likes (user_id, post_id) VALUES
(2, 1), (3, 1), (1, 2);

INSERT INTO Comments (user_id, post_id, comment_text) VALUES
(2, 1, 'Nice post!'),
(3, 1, 'Welcome!'),
(1, 2, 'Great learning!');

-- Display users
SELECT * FROM Users;

-- Display posts with usernames
SELECT Users.username, Posts.content, Posts.post_date
FROM Posts
JOIN Users ON Posts.user_id = Users.user_id;

-- Display likes
SELECT * FROM Likes;

-- Display comments
SELECT Users.username, Comments.comment_text
FROM Comments
JOIN Users ON Comments.user_id = Users.user_id;
