CREATE TABLE student(
id INT PRIMARY KEY NOT NULL,
name VARCHAR(30) NOT NULL,
serial SMALLINT NOT NULL,
number INT NOT NULL,
UNIQUE(serial,number)
);

CREATE TABLE subject(
id INT PRIMARY KEY NOT NULL,
name VARCHAR(30) NOT NULL
);

CREATE TABLE progress(
id INT PRIMARY KEY NOT NULL,
id_student INT NOT NULL,
id_subject INT NOT NULL,
mark SMALLINT NOT NULL CHECK(mark > 1 AND mark < 6),
FOREIGN KEY(id_student) REFERENCES student(id) ON DELETE CASCADE,
FOREIGN KEY(id_subject) REFERENCES subject(id)
);

--Добавление дисциплин
INSERT INTO subject(id, name) VALUES(1, 'Математика');
INSERT INTO subject(id, name) VALUES(2, 'Английский');
INSERT INTO subject(id, name) VALUES(3, 'Физика');
INSERT INTO subject(id, name) VALUES(4, 'Информатика');
INSERT INTO subject(id, name) VALUES(5, 'Литература');

--Добавление учеников
INSERT INTO student(id, name, serial, number) VALUES(1, 'Николай', 3219, 324348);
INSERT INTO student(id, name, serial, number) VALUES(2, 'Даниил', 3214, 827342);
INSERT INTO student(id, name, serial, number) VALUES(3, 'Евгений', 3219, 238470);

--Добавление успеваемости
INSERT INTO progress(id, id_student, id_subject, mark) VALUES(1, 1, 2, 4);
INSERT INTO progress(id, id_student, id_subject, mark) VALUES(2, 1, 3, 3);
INSERT INTO progress(id, id_student, id_subject, mark) VALUES(3, 2, 1, 5);
INSERT INTO progress(id, id_student, id_subject, mark) VALUES(4, 3, 3, 5);
INSERT INTO progress(id, id_student, id_subject, mark) VALUES(5, 2, 4, 4);
INSERT INTO progress(id, id_student, id_subject, mark) VALUES(6, 3, 5, 4);
INSERT INTO progress(id, id_student, id_subject, mark) VALUES(7, 2, 5, 4);
INSERT INTO progress(id, id_student, id_subject, mark) VALUES(8, 2, 5, 3);
INSERT INTO progress(id, id_student, id_subject, mark) VALUES(9, 1, 1, 4);

--Вывести список студентов, сдавших определенный предмет, на оценку выше 3;
SELECT student.name, subject.name FROM student, progress, subject WHERE(student.id = progress.id_student AND progress.id_subject = 1 AND progress.mark > 3);
SELECT student.name, subject.name FROM student INNER JOIN progress ON progress.id_student=student.id INNER JOIN subject ON progress.id_subject=subject.ID WHERE progress.mark>3 AND progress.id_subject = 5;


--Посчитать средний бал по определенному предмету;
SELECT AVG(mark) FROM progress WHERE (id_subject = 1);

--Посчитать средний балл по определенному студенту;
SELECT AVG(mark) FROM progress WHERE (id_student = 1);

--Найти три предмета, которые сдали наибольшее количество студентов;
SELECT name, COUNT(*) AS kol_vo
FROM progress INNER JOIN subject ON progress.id_subject=subject.id
GROUP BY subject.name
ORDER BY kol_vo DESC
LIMIT 3;
