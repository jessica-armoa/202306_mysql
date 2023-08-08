USE libros_bd;

INSERT INTO libros(titulo, num_paginas, created_at, updated_at) 
VALUES("La selva", 52, NOW(), NOW());

SELECT titulo, num_paginas 
FROM libros 
WHERE titulo LIKE "La%";

UPDATE libros
SET num_paginas=55, updated_at=NOW() 
WHERE id=1;

DELETE FROM libros
WHERE id=1