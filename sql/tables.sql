CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE movies (
  movie_id SERIAL PRIMARY KEY,
  title TEXT NOT NULL UNIQUE
);

CREATE TABLE ratings (
  user_id  INT NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
  movie_id INT NOT NULL REFERENCES movies(movie_id) ON DELETE CASCADE,
  rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
  rated_at TIMESTAMP DEFAULT NOW(),
  PRIMARY KEY (user_id, movie_id)
);
