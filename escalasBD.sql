CREATE DATABASE IF NOT EXISTS escalasBD;

USE escalasBD;

CREATE TABLE IF NOT EXISTS scales (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    scale_name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS degree (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    degree_name VARCHAR(50) UNIQUE NOT NULL,
    degree_position INT(2) NOT NULL,
    degree_number INT(1) NOT NULL,
    natural_note BOOLEAN NOT NULL,
    sharp_note BOOLEAN NOT NULL,
    flat_note BOOLEAN NOT NULL,
    major BOOLEAN NOT NULL,
    minor BOOLEAN NOT NULL,
    diminished BOOLEAN NOT NULL,
    augmented BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS scale_degree (
    id_scale INT UNSIGNED,
    INDEX (id_scale),
    FOREIGN KEY (id_scale)
		REFERENCES scales(id)
		ON DELETE CASCADE ON UPDATE CASCADE,
    id_degree INT UNSIGNED,
    INDEX (id_degree),
    FOREIGN KEY (id_degree)
		REFERENCES degree(id)
		ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (id_scale, id_degree)
);

-- LISTA GRADOS

INSERT INTO degree (degree_name, degree_position, degree_number, natural_note, sharp_note, flat_note, major, minor, augmented, diminished)
VALUES ("i-major", 1, 1, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE),
("i-minor", 1, 1, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE),
("i-augmented", 1, 1, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE),
("i-diminished", 1, 1, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, TRUE),
("#i-major", 2, 1, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE),
("#i-minor", 2, 1, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE),
("#i-augmented", 2, 1, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE),
("#i-diminished", 2, 1, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE),
("bii-major", 2, 2, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE),
("bii-minor", 2, 2, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE),
("bii-augmented", 2, 2, FALSE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE),
("bii-diminished", 2, 2, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE),
("ii-major", 3, 2, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE),
("ii-minor", 3, 2, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE),
("ii-augmented", 3, 2, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE),
("ii-diminished", 3, 2, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, TRUE),
("#ii-major", 4, 2, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE),
("#ii-minor", 4, 2, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE),
("#ii-augmented", 4, 2, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE),
("#ii-diminished", 4, 2, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE),
("biii-major", 4, 3, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE),
("biii-minor", 4, 3, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE),
("biii-augmented", 4, 3, FALSE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE),
("biii-diminished", 4, 3, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE),
("iii-major", 5, 3, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE),
("iii-minor", 5, 3, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE),
("iii-augmented", 5, 3, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE),
("iii-diminished", 5, 3, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, TRUE),
("#iii-major", 6, 3, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE),
("#iii-minor", 6, 3, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE),
("#iii-augmented", 6, 3, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE),
("#iii-diminished", 6, 3, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE),
("biv-major", 5, 4, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE),
("biv-minor", 5, 4, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE),
("biv-augmented", 5, 4, FALSE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE),
("biv-diminished", 5, 4, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE),
("iv-major", 6, 4, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE),
("iv-minor", 6, 4, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE),
("iv-augmented", 6, 4, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE),
("iv-diminished", 6, 4, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, TRUE),
("#iv-major", 7, 4, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE),
("#iv-minor", 7, 4, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE),
("#iv-augmented", 7, 4, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE),
("#iv-diminished", 7, 4, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE),
("bv-major", 7, 5, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE),
("bv-minor", 7, 5, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE),
("bv-augmented", 7, 5, FALSE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE),
("bv-diminished", 7, 5, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE),
("v-major", 8, 5, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE),
("v-minor", 8, 5, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE),
("v-augmented", 8, 5, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE),
("v-diminished", 8, 5, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, TRUE),
("#v-major", 9, 5, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE),
("#v-minor", 9, 5, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE),
("#v-augmented", 9, 5, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE),
("#v-diminished", 9, 5, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE),
("bvi-major", 9, 6, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE),
("bvi-minor", 9, 6, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE),
("bvi-augmented", 9, 6, FALSE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE),
("bvi-diminished", 9, 6, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE),
("vi-major", 10, 6, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE),
("vi-minor", 10, 6, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE),
("vi-augmented", 10, 6, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE),
("vi-diminished", 10, 6, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, TRUE),
("#vi-major", 11, 6, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE, FALSE),
("#vi-minor", 11, 6, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE),
("#vi-augmented", 11, 6, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE),
("#vi-diminished", 11, 6, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE),
("bvii-major", 11, 7, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE),
("bvii-minor", 11, 7, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, FALSE),
("bvii-augmented", 11, 7, FALSE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE),
("bvii-diminished", 11, 7, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE),
("vii-major", 12, 7, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE),
("vii-minor", 12, 7, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, FALSE),
("vii-augmented", 12, 7, TRUE, FALSE, FALSE, TRUE, FALSE, TRUE, FALSE),
("vii-diminished", 12, 7, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE, TRUE);

-- GUARDAR ESCALAS

INSERT INTO scales (scale_name)
VALUES ("locrian-mode");

-- RELACIONAR ESCALAS CON GRADOS

INSERT INTO scale_degree ()
VALUES ((SELECT id FROM scales WHERE scale_name LIKE "minor-scale"), (SELECT id FROM degree WHERE degree_name LIKE "bvii-major"));

-- BUSCAR ESCALAS QUE CONTIENEN GRADO

SELECT S.scale_name
FROM degree D, scale_degree SD, scales S
WHERE D.id = SD.id_degree
	AND S.id = SD.id_scale
    AND D.degree_name LIKE "bii-major";

-- BUSCAR GRADOS EN UNA ESCALA

SELECT D.degree_name, degree_position
FROM degree D, scale_degree SD, scales S
WHERE D.id = SD.id_degree
	AND S.id = SD.id_scale
    AND S.scale_name LIKE "lydian-mode";