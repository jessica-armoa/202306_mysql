USE dojos_y_ninjas;

/*-------------------crea 3 dojos nuevos-------------------*/
INSERT INTO dojos(nombre, created_at) VALUES("ONLINE", NOW());
INSERT INTO dojos(nombre, created_at) VALUES("San Francisco", NOW());
INSERT INTO dojos(nombre, created_at) VALUES("Chile", NOW());

/*-------elimina los 3 dojos que acabas de crear----------*/
SET SQL_SAFE_UPDATES = 0;
DELETE FROM dojos;

/*-------------------crea 3 dojos nuevos-------------------*/
INSERT INTO dojos(nombre, created_at) VALUES("ONLINE", NOW());
INSERT INTO dojos(nombre, created_at) VALUES("San Francisco", NOW());
INSERT INTO dojos(nombre, created_at) VALUES("Chile", NOW());

/*------crea 3 ninjas que pertenezcan al primer dojo-------*/
INSERT INTO ninjas(first_name, last_name, age, created_at, dojo_id)
VALUES("Jessica", "Armoa", 22, NOW(), 4);
INSERT INTO ninjas(first_name, last_name, age, created_at, dojo_id)
VALUES("Sofia", "Aguilar", 27, NOW(), 4);
INSERT INTO ninjas(first_name, last_name, age, created_at, dojo_id)
VALUES("Jose", "Largo", 19, NOW(), 4);

/*------crea 3 ninjas que pertenezcan al segundo dojo------*/
INSERT INTO ninjas(first_name, last_name, age, created_at, dojo_id)
VALUES("Angelica", "Roman", 30, NOW(), 5);
INSERT INTO ninjas(first_name, last_name, age, created_at, dojo_id)
VALUES("Roberto", "Morinigo", 27, NOW(), 5);
INSERT INTO ninjas(first_name, last_name, age, created_at, dojo_id)
VALUES("Jorge", "Insfran", 20, NOW(), 5);

/*------crea 3 ninjas que pertenezcan al tercer dojo------*/
INSERT INTO ninjas(first_name, last_name, age, created_at, dojo_id)
VALUES("Rocio", "Marecos", 20, NOW(), 6);
INSERT INTO ninjas(first_name, last_name, age, created_at, dojo_id)
VALUES("Lurdes", "Gomez", 27, NOW(), 6);
INSERT INTO ninjas(first_name, last_name, age, created_at, dojo_id)
VALUES("Marcos", "Rodriguez", 25, NOW(), 6);

/*--------recupera todos los ninjas del primer dojo--------*/
SELECT * FROM ninjas WHERE dojo_id=4;

/*--------recupera todos los ninjas del ultimo dojo--------*/
SELECT * FROM ninjas 
WHERE dojo_id = (SELECT id FROM dojos ORDER BY id DESC LIMIT 1);

/*-----------recupera el dojo del ultimo ninja-----------*/
SELECT * FROM dojos 
WHERE id = (SELECT dojo_id FROM ninjas ORDER BY id DESC LIMIT 1);

