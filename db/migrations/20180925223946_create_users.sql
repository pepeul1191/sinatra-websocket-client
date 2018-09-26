-- migrate:up

CREATE TABLE users(
	id	VARCHAR(24) NOT NULL,
  user VARCHAR(20) NOT NULL,
  password VARCHAR(30) NOT NULL,
  email VARCHAR(30) NOT NULL
)

-- migrate:down

DROP TABLE IF EXISTS users;
