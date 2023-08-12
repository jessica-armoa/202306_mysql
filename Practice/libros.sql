USE libros_bd;

/*************************** USUARIOS ******************************/
INSERT INTO usuarios(nombre, created_at) VALUES("Jane Austen", NOW());
INSERT INTO usuarios(nombre, created_at) VALUES("Emily Dickinson", NOW());
INSERT INTO usuarios(nombre, created_at) VALUES("Fyodor Dostoevsky", NOW());
INSERT INTO usuarios(nombre, created_at) VALUES("William Shakespeare", NOW());
INSERT INTO usuarios(nombre, created_at) VALUES("Lau Tzu", NOW());
SELECT * FROM usuarios;

/**************************** LIBROS *******************************/
INSERT INTO libros(titulo, num_paginas, created_at) VALUES("C Sharp", 256, NOW());
INSERT INTO libros(titulo, num_paginas, created_at) VALUES("Java", 502, NOW());
INSERT INTO libros(titulo, num_paginas, created_at) VALUES("Python", 412, NOW());
INSERT INTO libros(titulo, num_paginas, created_at) VALUES("PHP", 845, NOW());
INSERT INTO libros(titulo, num_paginas, created_at) VALUES("Ruby", 239, NOW());
SELECT * FROM libros;

/*cambia el nombre del libro de C Sharp a C#*/
UPDATE libros SET titulo="C#", updated_at=NOW() WHERE titulo="C Sharp";
SELECT * FROM libros;

/*cambia el nombre del cuarto usuario a Bill*/
UPDATE usuarios SET nombre="Bill", updated_at=NOW() WHERE id=4;
SELECT * FROM usuarios;

/*haz que el primer usuario marque como favorito los 2 primeros libros*/
INSERT INTO favoritos(usuario_id, libro_id) VALUES(1, 1);
INSERT INTO favoritos(usuario_id, libro_id) VALUES(1, 2);

SELECT f.usuario_id, u.nombre, f.libro_id, l.titulo, l.num_paginas
FROM usuarios u JOIN favoritos f ON u.id = f.usuario_id
JOIN libros l ON f.libro_id = l.id;

/* haz que el segundo usuario marque como favorito los primeros 3 libros*/
INSERT INTO favoritos(usuario_id, libro_id) VALUES(2, 1);
INSERT INTO favoritos(usuario_id, libro_id) VALUES(2, 2);
INSERT INTO favoritos(usuario_id, libro_id) VALUES(2, 3);

/*haz que el tercer usuario marque como favorito los 4 primeros libros*/
INSERT INTO favoritos(usuario_id, libro_id) VALUES(3, 1);
INSERT INTO favoritos(usuario_id, libro_id) VALUES(3, 2);
INSERT INTO favoritos(usuario_id, libro_id) VALUES(3, 3);
INSERT INTO favoritos(usuario_id, libro_id) VALUES(3, 4);

/*Haz que el cuarto usuario marque como favorito todos los libros*/
INSERT INTO favoritos (usuario_id, libro_id)
SELECT 4, id FROM libros;

/*recupera todos los usuarios que marcaron como favorito el tercer libro*/
SELECT * FROM usuarios u JOIN favoritos f ON u.id=f.usuario_id WHERE f.libro_id=3;

/*elimina el primer usuario de los favoritos del tercer libro*/
SET SQL_SAFE_UPDATES = 0;
/*DELETE FROM favoritos WHERE usuario_id = (SELECT usuario_id FROM favoritos WHERE libro_id=3 ORDER BY usuario_id LIMIT 1);*/
DELETE FROM favoritos WHERE usuario_id = (SELECT id FROM usuarios LIMIT 1) AND libro_id=3;

SELECT * FROM favoritos;

/*Haz que el quinto usuario marque como favorito el segundo libro*/
INSERT INTO favoritos(usuario_id, libro_id) VALUES(5, 2);

/*Encuentra todos los libros que el tercer usuario marcó como favoritos*/
SELECT * FROM libros l JOIN favoritos f ON l.id=f.libro_id WHERE f.usuario_id=3;

/*encuentra todos los usuarios que marcaron como favorito el quinto libro*/
SELECT * FROM usuarios u JOIN favoritos f ON u.id=f.usuario_id WHERE f.libro_id=5;
