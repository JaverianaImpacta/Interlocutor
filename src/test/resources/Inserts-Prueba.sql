USE JAVERIANA_IMPACTA;

-- Insertando datos en la tabla GENERO
INSERT INTO GENERO (SIGLA, DESCRIPCION) VALUES
                                            ('M', 'Masculino'),
                                            ('F', 'Femenino'),
                                            ('O', 'Otro');

-- Insertando datos en la tabla PAIS
INSERT INTO PAIS (NOMBRE, NOMBRE_INTERNACIONAL, ISO2, ISO3, CODIGO_TELEFONICO) VALUES
                                                                                   ('Colombia', 'Colombia', 'CO', 'COL', 57),
                                                                                   ('Estados Unidos','United States of America', 'US', 'USA', 1),
                                                                                   ('España', 'Spain' ,'ES', 'ESP', 34);

-- Insertando datos en la tabla DEPARTAMENTO_POLITICO
INSERT INTO DEPARTAMENTO_POLITICO (NOMBRE, PAIS, ISO2) VALUES
                                                           ('Antioquia', 'CO', 'ANT'),
                                                           ('New York', 'US', 'NY'),
                                                           ('Madrid', 'ES', 'MD');

-- Insertando datos en la tabla MUNICIPIO
INSERT INTO MUNICIPIO (CODIGO_POSTAL, NOMBRE, DEPARTAMENTO) VALUES
                                                                (5001, 'Medellín', 'ANT'),
                                                                (36061, 'New York City', 'NY'),
                                                                (28079, 'Madrid', 'MD');

-- Insertando datos en la tabla CIUDAD
INSERT INTO CIUDAD (CODIGO, NOMBRE, MUNICIPIO) VALUES
                                                   (1, 'Medellín', 5001),
                                                   (2, 'New York City', 36061),
                                                   (3, 'Madrid', 28079);

-- Insertando datos en la tabla LOCALIDAD
INSERT INTO LOCALIDAD (CODIGO, DESCRIPCION, CIUDAD) VALUES
                                                        (1, 'Poblado', 1),
                                                        (2, 'Harlem', 2),
                                                        (3, 'Salamanca', 3);

-- Insertando datos en la tabla BARRIO
INSERT INTO BARRIO (CODIGO, NOMBRE, LOCALIDAD) VALUES
                                                   (101, 'El Tesoro', 1),
                                                   (102, 'Central Park', 2),
                                                   (103, 'Sol', 3);

-- Insertando datos en la tabla TIPO_DOCUMENTO
INSERT INTO TIPO_DOCUMENTO (TIPO, DESCRIPCION) VALUES
                                                   ('CC', 'Cédula de Ciudadanía'),
                                                   ('CE', 'Cédula de Extranjería'),
                                                   ('TI', 'Tarjeta de Identidad'),
                                                   ('NI', 'Numero de Identificación Tributaria');

-- Insertando datos en la tabla EPS
INSERT INTO EPS (NOMBRE) VALUES
                             ('Sura'),
                             ('Sanitas'),
                             ('SaludTotal');

-- Insertando datos en la tabla FACULTAD
INSERT INTO FACULTAD (CODIGO, NOMBRE, FECHA_FUNDACION) VALUES
                                                           (101, 'Facultad de Ingeniería', '1990-05-20'),
                                                           (102, 'Facultad de Medicina', '1980-10-15'),
                                                           (103, 'Facultad de Derecho', '1975-03-30');

-- Insertando datos en la tabla PROGRAMA
INSERT INTO PROGRAMA (CODIGO, NOMBRE, FECHA_FUNDACION, CANTIDAD_CREDITOS, FACULTAD) VALUES
                                                                                        (201, 'Ingeniería de Sistemas', '1990-05-20', 160, 101),
                                                                                        (202, 'Medicina General', '1980-10-15', 240, 102),
                                                                                        (203, 'Derecho Penal', '1975-03-30', 150, 103);

-- Insertando datos en la tabla DEPARTAMENTO
INSERT INTO DEPARTAMENTO (CODIGO, NOMBRE, FACULTAD, PROGRAMA) VALUES
                                                                  (301, 'Ciencias de la Computación', 101, 201),
                                                                  (302, 'Anatomía', 102, 202),
                                                                  (303, 'Derecho Penal y Procesal', 103, 203);

-- Insertando datos en la tabla ASIGNATURA
INSERT INTO ASIGNATURA (CODIGO, NOMBRE, CREDITOS, DEPARTAMENTO) VALUES
                                                                    (401, 'Algoritmos', 4, 301),
                                                                    (402, 'Anatomía Humana', 5, 302),
                                                                    (403, 'Derecho Penal Especial', 3, 303);

-- Insertando datos en la tabla CLASE
INSERT INTO CLASE (CODIGO, ASIGNATURA, HORARIO) VALUES
                                                    (501, 401, 'Lunes 8:00 - 10:00'),
                                                    (502, 402, 'Miércoles 10:00 - 12:00'),
                                                    (503, 403, 'Viernes 14:00 - 16:00');

-- Insertando datos en la tabla SEMESTRE
INSERT INTO SEMESTRE (AÑO, PERIODO, FECHA_INICIO, FECHA_FINAL, CODIGO) VALUES
                                                                           (2023, 1, '2023-01-15', '2023-06-15', '2023-1'),
                                                                           (2023, 2, '2023-07-15', '2023-12-15', '2023-2'),
                                                                           (2024, 1, '2024-01-15', '2024-06-15', '2024-1');

-- Insertando datos en la tabla PERSONA
INSERT INTO PERSONA (TIPO_DOCUMENTO, CEDULA, PRIMER_NOMBRE, PRIMER_APELLIDO, CORREO_ELECTRONICO, FECHA_NACIMIENTO, SEXO, EPS, DIRECCION, NUMERO_CELULAR) VALUES
                                                                                                                                                             ('CC', 1111111, 'Pedro', 'Ramírez', 'pedro.ramirez@example.com', '1992-03-15', 'M', 'Sura', 'Calle 789', 11111111),
                                                                                                                                                             ('CC', 2222222, 'Ana', 'García', 'ana.garcia@example.com', '1985-08-25', 'F', 'Sanitas', 'Carrera 012', 22222222),
                                                                                                                                                             ('CC', 3333333, 'David', 'Rodríguez', 'david.rodriguez@example.com', '1990-12-10', 'M', 'SaludTotal', 'Avenida 345', 33333333),
                                                                                                                                                             ('CC', 4444444, 'Laura', 'Martínez', 'laura.martinez@example.com', '1988-05-20', 'F', 'Sura', 'Calle 678', 44444444),
                                                                                                                                                             ('CC', 5555555, 'Carlos', 'Hernández', 'carlos.hernandez@example.com', '1993-11-30', 'M', 'Sanitas', 'Carrera 901', 55555555),
                                                                                                                                                             ('CC', 6666666, 'María', 'Gómez', 'maria.gomez@example.com', '1986-04-12', 'F', 'SaludTotal', 'Avenida 234', 66666666),
                                                                                                                                                             ('CC', 7777777, 'José', 'López', 'jose.lopez@example.com', '1991-10-05', 'M', 'Sura', 'Calle 567', 77777777),
                                                                                                                                                             ('CC', 8888888, 'Sofía', 'Pérez', 'sofia.perez@example.com', '1987-07-22', 'F', 'Sanitas', 'Carrera 890', 88888888),
                                                                                                                                                             ('CC', 9999999, 'Andrés', 'Martín', 'andres.martin@example.com', '1989-02-18', 'M', 'SaludTotal', 'Avenida 123', 99999999),
                                                                                                                                                             ('CC', 1234567, 'Juan', 'Pérez', 'juan.perez@example.com', '1995-06-20', 'M', 'Sura', 'Carrera 456', 12345678),
                                                                                                                                                             ('CC', 9876543, 'María', 'López', 'maria.lopez@example.com', '1994-09-12', 'F', 'Sanitas', 'Avenida 678', 98765432),
                                                                                                                                                             ('CC', 4567891, 'Carlos', 'Gómez', 'carlos.gomez@example.com', '1996-12-03', 'M', 'SaludTotal', 'Calle 901', 45678901);

-- Insertando datos en la tabla PROFESOR
INSERT INTO PROFESOR (ID_INSTITUCIONAL, CEDULA, CORREO_INSTITUCIONAL) VALUES
                                                                          (3004, 1111111, 'pedro.ramirez@universidad.edu'),
                                                                          (3005, 2222222, 'ana.garcia@universidad.edu'),
                                                                          (3006, 3333333, 'david.rodriguez@universidad.edu'),
                                                                          (3007, 4444444, 'laura.martinez@universidad.edu');

-- Insertando datos en la tabla DIRECTIVO
INSERT INTO DIRECTIVO (ID_INSTITUCIONAL, CEDULA, CORREO_INSTITUCIONAL) VALUES
                                                                           (1001, 5555555, 'carlos.hernandez@universidad.edu'),
                                                                           (1002, 6666666, 'maria.gomez@universidad.edu'),
                                                                           (1003, 7777777, 'jose.lopez@universidad.edu');

-- Insertando datos en la tabla ESTUDIANTE
INSERT INTO ESTUDIANTE (ID_INSTITUCIONAL, CEDULA, CORREO_INSTITUCIONAL, SEMESTRE, ARL, SENTIDO_MI_PRACTICA) VALUES
                                                                                                           (2001, 1234567, 'juan.perez@universidad.edu', 2024, 1,1),
                                                                                                           (2002, 9876543, 'maria.lopez@universidad.edu', 2023, 0,1),
                                                                                                           (2003, 4567891, 'carlos.gomez@universidad.edu', 2024, 1,1);

-- Insertando datos en la tabla MATRICULA
INSERT INTO MATRICULA (ESTUDIANTE, PROGRAMA, SEMESTRE) VALUES
                                                           (1234567, 201, '2023-1'),
                                                           (9876543, 202, '2023-2'),
                                                           (4567891, 203, '2024-1');

-- Insertando datos en la tabla ROL
INSERT INTO ROL (DESCRIPCION) VALUES
                                  ('Profesor'),
                                  ('Administrativo'),
                                  ('Decano'),
                                  ('Estudiante');

-- Insertando datos en la tabla ROLXPERSONA
INSERT INTO ROLXPERSONA (ROL, CEDULA) VALUES
                                          ('Estudiante', 1234567),
                                          ('Profesor', 1111111),
                                          ('Administrativo', 5555555),
                                          ('Decano', 7777777);

-- Insertando datos en la tabla POBLACION_OBJETIVO
INSERT INTO POBLACION_OBJETIVO (DESCRIPCION) VALUES
                                                 ('Niños en situación de riesgo'),
                                                 ('Personas mayores en situación de abandono'),
                                                 ('Mujeres cabeza de familia');


-- Insertando datos en la tabla ACTIVIDAD_ECONOMICA
INSERT INTO ACTIVIDAD_ECONOMICA (CODIGO, DESCRIPCION) VALUES
                                                          ('0111', 'Cultivo de arroz'),
                                                          ('0210', 'Pesca de langosta'),
                                                          ('0510', 'Extracción de carbón');

-- Insertando datos en la tabla ENTIDAD
INSERT INTO ENTIDAD (DOCUMENTO, NIT, RAZON_SOCIAL, CONVENIO, CEDULA_REP, ACTIVIDAD_ECONOMICA, TELEFONO, CORREO) VALUES
                                                                                                                    ('NI', 452454, 'Entidad 1', 1001, 8888888, '0510', 31153847, 'entidad1@example.com'),
                                                                                                                    ('NI', 857458, 'Entidad 2', 1002, 9999999, '0210', 32047513, 'entidad2@example.com'),
                                                                                                                    ('NI', 454121, 'Entidad 3', 1003, 4567891, '0510', 5895478, 'entidad3@example.com');

-- Insertando datos en la tabla INTERLOCUTOR
INSERT INTO INTERLOCUTOR (CEDULA, CARGO) VALUES
                                             (8888888, 'Gerente'),
                                             (9999999, 'Director Financiero'),
                                             (4567891, 'Jefe de Producción');

-- Insertando datos en la tabla TEMATICA_CENTRAL
INSERT INTO TEMATICA_CENTRAL (DESCRIPCION) VALUES
                                               ('Educación'),
                                               ('Salud'),
                                               ('Medio ambiente');

-- Insertando datos en la tabla PROYECTO
INSERT INTO PROYECTO (CODIGO, NOMBRE, DESCRIPCION, OBJETIVO, ENTIDAD, LIDER, UBICACION, TEMATICA, APROBACION, ACTIVO) VALUES
                                                                                                                          (10001, 'Proyecto 1', 'Descripción del Proyecto 1', 'Niños en situación de riesgo', 452454, 8888888, 101, 'Educación', TRUE, TRUE),
                                                                                                                          (10002, 'Proyecto 2', 'Descripción del Proyecto 2', 'Personas mayores en situación de abandono', 857458, 9999999, 102, 'Salud', FALSE, TRUE),
                                                                                                                          (10003, 'Proyecto 3', 'Descripción del Proyecto 3', 'Mujeres cabeza de familia', 454121, 4567891, 103, 'Medio ambiente', TRUE, FALSE);

-- Insertando datos en la tabla RECURSO
INSERT INTO RECURSO (DESCRIPCION) VALUES
                                      ('Equipos de cómputo'),
                                      ('Material quirúrgico'),
                                      ('Vehículos de transporte');

-- Insertando datos en la tabla ASIGNACION_RECURSO
INSERT INTO ASIGNACION_RECURSO (PROYECTO, RECURSO, CANTIDAD) VALUES
                                                                 (10001, 'Equipos de cómputo', 10),
                                                                 (10002, 'Material quirúrgico', 100),
                                                                 (10003, 'Vehículos de transporte', 5);

-- Insertando datos en la tabla TIPO_PROYECTO
INSERT INTO TIPO_PROYECTO (DESCRIPCION) VALUES
                                            ('Investigación'),
                                            ('Desarrollo'),
                                            ('Social');

-- Insertando datos en la tabla PROYECTOXTIPO_PROYECTO
INSERT INTO PROYECTOXTIPO_PROYECTO (PROYECTO, TIPO) VALUES
                                                        (10001, 'Investigación'),
                                                        (10002, 'Desarrollo'),
                                                        (10003, 'Social');

-- Insertando datos en la tabla TIPO_VINCULACION
INSERT INTO TIPO_VINCULACION (CODIGO, ASIGNATURA, DESCRIPCION) VALUES
                                                                   (1, 401, 'Práctica'),
                                                                   (2, 402, 'Investigación'),
                                                                   (3, 403, 'Extensión');

-- Insertando datos en la tabla VINCULACION
INSERT INTO VINCULACION (CODIGO, ESTUDIANTE, PROYECTO, SEMESTRE, TIPO_VINCULACION, CERTIFICADO) VALUES
                                                                                                    (20001, 1234567, 10001, '2023-1', 1, TRUE),
                                                                                                    (20002, 9876543, 10002, '2023-2', 2, FALSE),
                                                                                                    (20003, 4567891, 10003, '2024-1', 3, TRUE);

-- Insertando datos en la tabla PERMISO
INSERT INTO PERMISO (CODIGO, DESCRIPCION) VALUES
                                              (1, 'Acceso a bases de datos'),
                                              (2, 'Permiso de administrador'),
                                              (3, 'Permiso de edición');

-- Insertando datos en la tabla CREDENCIAL
INSERT INTO CREDENCIAL (CODIGO, PERMISO, ROL) VALUES
                                                  (1001, 1, 'Administrativo'),
                                                  (1002, 2, 'Decano'),
                                                  (1003, 3, 'Profesor'),
                                                  (1004, 3, 'Estudiante');

-- Insertando datos en la tabla ACTIVIDAD
INSERT INTO ACTIVIDAD (DESCRIPCION) VALUES
                                        ('Charla informativa'),
                                        ('Taller de sensibilización'),
                                        ('Jornada de limpieza');

-- Insertando datos en la tabla ACTIVIDADXVINCULACION
INSERT INTO ACTIVIDADXVINCULACION (ACTIVIDAD, VINCULACION) VALUES
                                                               ('Charla informativa', 20001),
                                                               ('Taller de sensibilización', 20002),
                                                               ('Jornada de limpieza', 20003);

-- Insertando datos en la tabla DECANATURA
INSERT INTO DECANATURA (FACULTAD, DECANO, FECHA_INICIO, FECHA_FINAL) VALUES
                                                                         (101, 5555555, '2020-01-01', NULL),
                                                                         (102, 5555555, '2018-01-01', NULL),
                                                                         (103, 5555555, '2016-01-01', NULL);

-- Insertando datos en la tabla DIRECCION_PROGRAMA
INSERT INTO DIRECCION_PROGRAMA (PROGRAMA, DIRECTOR, FECHA_INICIO, FECHA_FINAL) VALUES
                                                                                   (201, 5555555, '2019-01-01', NULL),
                                                                                   (202, 5555555, '2017-01-01', NULL),
                                                                                   (203, 5555555, '2015-01-01', NULL);

-- Insertando datos en la tabla DIRECCION_DEPARTAMENTO
INSERT INTO DIRECCION_DEPARTAMENTO (DEPARTAMENTO, DIRECTOR, FECHA_INICIO, FECHA_FINAL) VALUES
                                                                                           (301, 5555555, '2018-01-01', NULL),
                                                                                           (302, 5555555, '2016-01-01', NULL),
                                                                                           (303, 5555555, '2014-01-01', NULL);

-- Insertando datos en la tabla INSCRIPCION
INSERT INTO INSCRIPCION (ACTIVA, ESTUDIANTE, CLASE) VALUES
                                                        (TRUE, 1234567, 501),
                                                        (TRUE, 9876543, 502),
                                                        (TRUE, 4567891, 503);
