-- migrate:up

INSERT INTO users (user, password, email) VALUES (
  'pepe', 'kiki123', 'jvaldivia@softweb.pe'
);
INSERT INTO users (user, password, email) VALUES (
  'yacky', 'koki123', 'yramirez@softweb.pe'
);

-- migrate:down
