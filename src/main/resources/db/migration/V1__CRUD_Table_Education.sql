DROP TABLE IF EXISTS faculties;
DROP TABLE IF EXISTS higher_educationals;

CREATE TABLE IF NOT EXISTS higher_educationals
(
    id SERIAL NOT NULL CONSTRAINT higher_educational_key PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR NOT NULL ,
    rating INTEGER NOT NULL ,
    foreign_branch BOOLEAN NOT NULL,
    type VARCHAR(50) NOT NULL,
    total_teachers INTEGER,
    date_foundation DATE NOT NULL

);

CREATE TABLE IF NOT EXISTS faculties
(
    id SERIAL NOT NULL CONSTRAINT faculty_key PRIMARY KEY,
    name VARCHAR(250) NOT NULL,
    direction VARCHAR(100) NOT NULL,
    dean_name VARCHAR(250),
    year_foundation INTEGER NOT NULL,
    budget REAL,
    number_subjects_taught INTEGER NOT NULL ,
    higher_educational_id BIGINT NOT NULL,
    CONSTRAINT fk_higher_educationals_faculties_id FOREIGN KEY (higher_educational_id) REFERENCES higher_educationals (id)
);

INSERT INTO higher_educationals (name, address, rating, foreign_branch, type, total_teachers, date_foundation)
VALUES('POLITEH', 'Pushkinckay 10', 1, true, 'Institute', 10, '2020-10-31' ),
      ('HIRE', 'Nauchnaiy 20', 2, true, 'Institute', 8, '2020-10-21' );

INSERT INTO faculties (name, direction, dean_name, year_foundation, budget, number_subjects_taught, higher_educational_id)
VALUES ('Artificial intelligence', 'Program', 'Ivanov', 2020, '1253658.12', 20,
                (SELECT id FROM higher_educationals WHERE name = 'POLITEH')),
       ('Ingeneria', 'mathematics', 'Petrov', 2015, '2568585', 10,
                (SELECT id FROM higher_educationals WHERE name = 'POLITEH')),
       ('Economics', 'busines', 'Vasechkin', 2010, '5479612.40', 15,
                (SELECT id FROM higher_educationals WHERE name = 'HIRE'));

UPDATE faculties SET budget = '7856.12' WHERE id = 1;

SELECT a.name as NAME,
       b.name as FACULTIES,
       b.budget as BUBGET
FROM higher_educationals a
LEFT JOIN faculties b
       on a.id = b.higher_educational_id
WHERE b.budget > 300000
ORDER BY a.name ASC;



