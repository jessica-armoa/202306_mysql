USE usuarios_bd;

INSERT INTO usuarios(nombre, apellido, correo_electronico, created_at, updated_at) 
VALUES("Jessica", "Armoa", "jessy@gmail.com", NOW(), NOW());

INSERT INTO usuarios(nombre, apellido, correo_electronico, created_at, updated_at) 
VALUES("Angelica", "Armoa", "angii@gmail.com", NOW(), NOW());

INSERT INTO usuarios(nombre, apellido, correo_electronico, created_at, updated_at) 
VALUES("Danilo", "Baez", "dani@gmail.com", NOW(), NOW());

# recupera todos los usuarios
SELECT * FROM usuarios;

# recupera el primer usuario que usa su dirección de correo electrónico
SELECT * FROM usuarios 
WHERE correo_electronico LIKE "%" 
LIMIT 1;

# recupera el último usuario que usa su id
SELECT * FROM usuarios
ORDER BY id DESC
LIMIT 1;

# cambia el usuario con id=3 para que su apellido sea Panqueques
UPDATE usuarios 
SET apellido="Panqueques", updated_at=NOW() 
WHERE id=3;

# elimina el usuario con id=2 de la base de datos
DELETE FROM usuarios 
WHERE id=2;

# obtén todos los usuarios, ordenados por su nombre
SELECT * FROM usuarios 
ORDER BY nombre;

# obtén todos los usuarios, ordenados por su nombre en orden descendente
SELECT * FROM usuarios 
ORDER BY nombre DESC;