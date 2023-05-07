-- Active: 1683249378715@@127.0.0.1@3306

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    role TEXT NOT NULL,
    created_at TEXT DEFAULT (DATETIME('now', '-3 hours')) NOT NULL
);

INSERT INTO users (id, name, email, password, role)
VALUES
  -- tipo NORMAL e senha = fulano123
	('u001', 'Fulano', 'fulano@email.com', '$2a$12$qPQj5Lm1dQK2auALLTC0dOWedtr/Th.aSFf3.pdK5jCmYelFrYadC', 'NORMAL'),

  -- tipo NORMAL e senha = beltrana00
	('u002', 'Beltrana', 'beltrana@email.com', '$2a$12$403HVkfVSUbDioyciv9IC.oBlgMqudbnQL8ubebJIXScNs8E3jYe2', 'NORMAL'),

  -- tipo ADMIN e senha = astrodev99
	('u003', 'Astrodev', 'astrodev@email.com', '$2a$12$lHyD.hKs3JDGu2nIbBrxYujrnfIX5RW5oq/B41HCKf7TSaq9RgqJ.', 'ADMIN'),
    
    -- tipo ADMIN e senha = lidia123
	('u004', 'Lidia', 'lidiay@email.com', '$2a$12$2eTrWiDLEt3ACyRuodvPveI9HmKDNnaa5UqfymrSNWddxFg8kKPjO', 'ADMIN');

SELECT * FROM  users;

DROP TABLE users;

CREATE TABLE posts (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    creator_id TEXT NOT NULL,
    content TEXT NOT NULL,
    likes INTEGER DEFAULT (0) NOT NULL,
    dislikes INTEGER DEFAULT (0) NOT NULL,
    created_at TEXT DEFAULT (DATETIME('now', '-3 hours')) NOT NULL,
    updated_at TEXT DEFAULT (DATETIME('now', '-3 hours')) NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES users (id) ON UPDATE CASCADE ON DELETE CASCADE        
);

INSERT INTO posts (id, creator_id, content)
VALUES
    ("p001", "u001", "Bora Happy Hour!"),
    ("p002", "u004", "Hey hey, vamos finalizar o projeto Labook!"),
    ("p003", "u004", "Que tristeza meu tornozelo quebrado! T_T"),
    ("p004", "u003", "Curso da Labenu é o melhor!");

SELECT * FROM posts;
  
DROP TABLE posts;

CREATE TABLE
    likes_dislikes (
        user_id TEXT NOT NULL,
        post_id TEXT NOT NULL,
        like INTEGER NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users (id) ON UPDATE CASCADE ON DELETE CASCADE,
        FOREIGN KEY (post_id) REFERENCES posts (id) ON UPDATE CASCADE ON DELETE CASCADE
    );

INSERT INTO
    likes_dislikes (user_id, post_id, like)
VALUES 
  ("u002", "p001", 1), 
  ("u003", "p001", 1), 
  ("u004", "p001", 0),
  ("u001", "p002", 1), 
  ("u002", "p002", 1),
  ("u003", "p002", 1),
  ("u001", "p003", 1),
  ("u002", "p003", 1),
  ("u003", "p003", 0),
  ("u001", "p004", 1),
  ("u002", "p004", 1),
  ("u004", "p004", 1);

SELECT * FROM likes_dislikes;

DROP TABLE likes_dislikes;

UPDATE posts SET likes = 2 WHERE id = "p001";

UPDATE posts SET dislikes = 1 WHERE id = "p001";

UPDATE posts SET likes = 3 WHERE id = "p002";

UPDATE posts SET likes = 2 WHERE id = "p003";

UPDATE posts SET dislikes = 1 WHERE id = "p003";

UPDATE posts SET likes = 3 WHERE id = "p004";

UPDATE posts SET likes = 1 WHERE id = "24737d89-7ac7-4e60-9523-b2d5a7bd1281";
