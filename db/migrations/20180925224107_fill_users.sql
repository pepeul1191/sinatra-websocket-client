-- migrate:up

INSERT INTO users (id, user, password, email) VALUES (
  '5bab083b2c247ef0da917fb9', 'pepe', 'kiki123', 'jvaldivia@softweb.pe'
);
INSERT INTO users (id, user, password, email) VALUES (
  '5bab083b2c247ef0da917fba','yacky', 'koki123', 'yramirez@softweb.pe'
);
INSERT INTO users (id, user, password, email) VALUES (
  '5bab083b2c247ef0da917fbb','david', 'kiki123', 'disla@coa.pe'
);
INSERT INTO users (id, user, password, email) VALUES (
  '5bab083b2c247ef0da917fbc','julia', 'koki123', 'jzelaya@coa.pe'
);

-- migrate:down

DELETE FROM users;
