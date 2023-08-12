USE amistades_bd;

/*crea 6 usuarios nuevos*/
INSERT INTO usuarios(nombre, apellido, correo_electronico, created_at)
VALUES("Jessica", "Armoa", "jessica@gmail.com", NOW());
INSERT INTO usuarios(nombre, apellido, correo_electronico, created_at)
VALUES("Danilo", "Baez", "dani@gmail.com", NOW());
INSERT INTO usuarios(nombre, apellido, correo_electronico, created_at)
VALUES("Orlando", "Martinez", "orlando@gmail.com", NOW());
INSERT INTO usuarios(nombre, apellido, correo_electronico, created_at)
VALUES("Marcos", "Quiñonez", "marcos@gmail.com", NOW());
INSERT INTO usuarios(nombre, apellido, correo_electronico, created_at)
VALUES("Angela", "Rodriguez", "angela@gmail.com", NOW());
INSERT INTO usuarios(nombre, apellido, correo_electronico, created_at)
VALUES("Jessica", "Ruiz", "rjessica@gmail.com", NOW());

/*haz que el usuario 1 sea amigo del usuario 2, 4 y 6*/
INSERT INTO amistades(usuario_id, amigo_id, created_at) VALUES(2,1,NOW());
INSERT INTO amistades(usuario_id, amigo_id, created_at) VALUES(4,1,NOW());
INSERT INTO amistades(usuario_id, amigo_id, created_at) VALUES(6,1,NOW());

/*haz que el usuario 2 sea amigo del usuario 1, 3 y 5*/
INSERT INTO amistades(usuario_id, amigo_id, created_at) VALUES(1,2,NOW());
INSERT INTO amistades(usuario_id, amigo_id, created_at) VALUES(3,2,NOW());
INSERT INTO amistades(usuario_id, amigo_id, created_at) VALUES(5,2,NOW());

/*haz que el usuario 3 sea amigo del usuario 2 y 5*/
INSERT INTO amistades(usuario_id, amigo_id, created_at) VALUES(2,3,NOW());
INSERT INTO amistades(usuario_id, amigo_id, created_at) VALUES(5,3,NOW());

/*haz que el usuario 4 sea amigo del usuario 3*/
INSERT INTO amistades(usuario_id, amigo_id, created_at) VALUES(3,4,NOW());

/*haz que el usuario 5 sea amigo del usuario 1 y 6*/
INSERT INTO amistades(usuario_id, amigo_id, created_at) VALUES(1,5,NOW());
INSERT INTO amistades(usuario_id, amigo_id, created_at) VALUES(6,5,NOW());

/*haz que el usuario 6 sea amigo del usuario 2 y 3*/
INSERT INTO amistades(usuario_id, amigo_id, created_at) VALUES(2,6,NOW());
INSERT INTO amistades(usuario_id, amigo_id, created_at) VALUES(3,6,NOW());

/*muestra las relaciones creadas como se muestra en la imagen de arriba*/
SELECT usuarios.nombre, usuarios.apellido, amigos.nombre as nombre_amigo, amigos.apellido as apellido_amigo 
FROM usuarios JOIN amistades ON usuarios.id = amistades.usuario_id
LEFT JOIN usuarios AS amigos ON amigos.id = amistades.amigo_id;

/*Consulta NINJA: Devuelve todos los usuarios que son amigos del primer usuario, asegúrate de que sus nombres se muestren en los resultados.*/
SELECT usuarios.id, usuarios.nombre, usuarios.apellido, amigos.id as id_amigo, amigos.nombre as nombre_amigo, amigos.apellido as apellido_amigo 
FROM usuarios JOIN amistades ON usuarios.id = amistades.usuario_id
LEFT JOIN usuarios AS amigos ON amigos.id = amistades.amigo_id
WHERE usuarios.id = 1;

/*Consulta NINJA: Devuelve el recuento de todas las amistades*/
SELECT u.id, u.nombre, COUNT(a.amigo_id) AS cantidad_amigos
FROM usuarios u
LEFT JOIN amistades a ON u.id = a.usuario_id
GROUP BY u.id, u.nombre;
#Prueba de consistencia de datos
SELECT * FROM usuarios u LEFT JOIN amistades a ON u.id = a.usuario_id;

/*Consulta NINJA: averigua quién tiene más amigos y devuelve la cuenta de sus amigos*/
SELECT u.id, u.nombre, COUNT(a.amigo_id) AS cantidad_amigos
FROM usuarios u
LEFT JOIN amistades a ON u.id = a.usuario_id
GROUP BY u.id, u.nombre
ORDER BY cantidad_amigos DESC LIMIT 1;

/*Consulta NINJA: Devuelve los amigos del tercer usuario en orden alfabético*/
SELECT u.id, u.nombre, u.apellido, a.amigo_id, amigos.nombre as nombre_amigo, amigos.apellido as apellido_amigo
FROM usuarios u 
JOIN amistades a ON u.id = a.usuario_id
LEFT JOIN usuarios amigos ON amigos.id = a.amigo_id
WHERE u.id=3
ORDER BY amigos.nombre;