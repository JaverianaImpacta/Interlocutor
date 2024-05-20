DROP DATABASE JAVERIANA_IMPACTA;
CREATE DATABASE JAVERIANA_IMPACTA;

USE JAVERIANA_IMPACTA;

CREATE TABLE GENERO(
                       ID INT AUTO_INCREMENT PRIMARY KEY,
                       SIGLA VARCHAR(2) UNIQUE NOT NULL,
                       DESCRIPCION VARCHAR(20) UNIQUE NOT NULL
);


CREATE TABLE PAIS(
                     ID INT AUTO_INCREMENT PRIMARY KEY,
                     NOMBRE VARCHAR(255) NOT NULL,
                     NOMBRE_INTERNACIONAL VARCHAR(255) NOT NULL,
                     ISO2 VARCHAR(6) UNIQUE NOT NULL,
                     ISO3 VARCHAR(6) UNIQUE NOT NULL,
                     CODIGO_TELEFONICO INT UNIQUE NOT NULL
);

CREATE TABLE DEPARTAMENTO_POLITICO(
                                      ID INT AUTO_INCREMENT PRIMARY KEY,
                                      NOMBRE VARCHAR(255) UNIQUE NOT NULL,
                                      PAIS VARCHAR(2) NOT NULL,
                                      ISO2 VARCHAR(6) UNIQUE NOT NULL,
                                      FOREIGN KEY (PAIS) REFERENCES PAIS(ISO2)
);

CREATE TABLE MUNICIPIO(
                          ID INT AUTO_INCREMENT PRIMARY KEY,
                          CODIGO_POSTAL INT UNIQUE NOT NULL,
                          NOMBRE VARCHAR(255) NOT NULL,
                          DEPARTAMENTO VARCHAR(6) NOT NULL,
                          FOREIGN KEY (DEPARTAMENTO) REFERENCES DEPARTAMENTO_POLITICO(ISO2)
);

CREATE TABLE CIUDAD(
                       ID INT AUTO_INCREMENT PRIMARY KEY,
                       CODIGO INT UNIQUE NOT NULL,
                       NOMBRE VARCHAR(255) NOT NULL,
                       MUNICIPIO INT NOT NULL,
                       FOREIGN KEY (MUNICIPIO) REFERENCES MUNICIPIO(CODIGO_POSTAL)
);

CREATE TABLE LOCALIDAD(
                          ID INT AUTO_INCREMENT PRIMARY KEY,
                          CODIGO INT UNIQUE NOT NULL,
                          DESCRIPCION VARCHAR(255) NOT NULL,
                          CIUDAD INT NOT NULL,
                          FOREIGN KEY (CIUDAD) REFERENCES CIUDAD(CODIGO)
);

CREATE TABLE BARRIO(
                       ID INT AUTO_INCREMENT PRIMARY KEY,
                       CODIGO INT UNIQUE NOT NULL,
                       NOMBRE VARCHAR(255) NOT NULL,
                       LOCALIDAD INT NOT NULL,
                       FOREIGN KEY (LOCALIDAD) REFERENCES LOCALIDAD(CODIGO)
);

CREATE TABLE TIPO_DOCUMENTO (
                                ID INT AUTO_INCREMENT PRIMARY KEY,
                                TIPO VARCHAR(2) UNIQUE NOT NULL,
                                DESCRIPCION VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE EPS(
                    ID INT AUTO_INCREMENT PRIMARY KEY,
                    NOMBRE VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE FACULTAD(
                         ID INT AUTO_INCREMENT PRIMARY KEY,
                         CODIGO INT UNIQUE NOT NULL,
                         NOMBRE VARCHAR(255) UNIQUE NOT NULL,
                         FECHA_FUNDACION DATE NOT NULL
);


CREATE TABLE PROGRAMA(
                         ID INT AUTO_INCREMENT PRIMARY KEY,
                         CODIGO INT UNIQUE NOT NULL,
                         NOMBRE VARCHAR(255) UNIQUE NOT NULL,
                         FECHA_FUNDACION DATE NOT NULL,
                         CANTIDAD_CREDITOS INT NOT NULL,
                         FACULTAD INT NOT NULL,
                         FOREIGN KEY (FACULTAD) REFERENCES FACULTAD(CODIGO)
);


CREATE TABLE DEPARTAMENTO(
                             ID INT AUTO_INCREMENT PRIMARY KEY,
                             CODIGO INT UNIQUE NOT NULL,
                             NOMBRE VARCHAR(255) UNIQUE NOT NULL,
                             FACULTAD INT,
                             PROGRAMA INT,
                             FOREIGN KEY (FACULTAD) REFERENCES FACULTAD(CODIGO),
                             FOREIGN KEY (PROGRAMA) REFERENCES PROGRAMA(CODIGO)
);

CREATE TABLE ASIGNATURA(
                           ID INT AUTO_INCREMENT PRIMARY KEY,
                           CODIGO INT UNIQUE NOT NULL,
                           NOMBRE VARCHAR(255) UNIQUE NOT NULL,
                           CREDITOS INT NOT NULL,
                           DEPARTAMENTO INT NOT NULL,
                           FOREIGN KEY (DEPARTAMENTO) REFERENCES DEPARTAMENTO(CODIGO)
);

CREATE TABLE CLASE(
                      ID INT AUTO_INCREMENT PRIMARY KEY,
                      CODIGO INT UNIQUE NOT NULL,
                      ASIGNATURA INT NOT NULL,
                      HORARIO VARCHAR(255),
                      FOREIGN KEY (ASIGNATURA) REFERENCES ASIGNATURA(CODIGO)
);

CREATE TABLE SEMESTRE(
                         ID INT AUTO_INCREMENT PRIMARY KEY,
                         AÑO INT NOT NULL,
                         PERIODO INT NOT NULL,
                         FECHA_INICIO DATE NOT NULL,
                         FECHA_FINAL DATE NOT NULL,
                         CODIGO VARCHAR(30) UNIQUE
);

CREATE TABLE PERSONA (
                         ID INT AUTO_INCREMENT PRIMARY KEY,
                         TIPO_DOCUMENTO VARCHAR(2),
                         CEDULA INT UNIQUE NOT NULL,
                         PRIMER_NOMBRE VARCHAR(50) NOT NULL,
                         SEGUNDO_NOMBRE VARCHAR(50),
                         PRIMER_APELLIDO VARCHAR(50) NOT NULL,
                         SEGUNDO_APELLIDO VARCHAR(50),
                         CORREO_ELECTRONICO VARCHAR(255) UNIQUE NOT NULL,
                         FECHA_NACIMIENTO DATE NOT NULL,
                         SEXO VARCHAR(2),
                         EPS VARCHAR(50) NOT NULL,
                         DIRECCION VARCHAR(255) NOT NULL,
                         NUMERO_CELULAR LONG NOT NULL,
                         FOREIGN KEY (TIPO_DOCUMENTO) REFERENCES TIPO_DOCUMENTO(TIPO),
                         FOREIGN KEY (SEXO) REFERENCES GENERO(SIGLA),
                         FOREIGN KEY (EPS) REFERENCES EPS(NOMBRE)
);

CREATE TABLE DIRECTIVO(
                          ID INT AUTO_INCREMENT PRIMARY KEY,
                          ID_INSTITUCIONAL INT UNIQUE NOT NULL,
                          CEDULA INT UNIQUE NOT NULL,
                          CORREO_INSTITUCIONAL VARCHAR(255) UNIQUE NOT NULL,
                          FOREIGN KEY (CEDULA) REFERENCES PERSONA(CEDULA)
);

CREATE TABLE ESTUDIANTE (
                            ID INT AUTO_INCREMENT PRIMARY KEY,
                            ID_INSTITUCIONAL INT UNIQUE NOT NULL,
                            CEDULA INT UNIQUE,
                            CORREO_INSTITUCIONAL VARCHAR(255) UNIQUE NOT NULL,
                            SEMESTRE INT,
                            ARL BOOLEAN,
                            SENTIDO_MI_PRACTICA BOOLEAN,
                            FOREIGN KEY (CEDULA) REFERENCES PERSONA(CEDULA)
);

CREATE TABLE MATRICULA(
                          ID INT AUTO_INCREMENT PRIMARY KEY,
                          ESTUDIANTE INT NOT NULL,
                          PROGRAMA INT NOT NULL,
                          SEMESTRE VARCHAR(30) NOT NULL,
                          FOREIGN KEY (ESTUDIANTE) REFERENCES ESTUDIANTE(CEDULA),
                          FOREIGN KEY (PROGRAMA) REFERENCES PROGRAMA(CODIGO),
                          FOREIGN KEY (SEMESTRE) REFERENCES SEMESTRE(CODIGO)
);

CREATE TABLE PROFESOR(
                         ID INT AUTO_INCREMENT PRIMARY KEY,
                         ID_INSTITUCIONAL INT UNIQUE NOT NULL,
                         CEDULA INT UNIQUE NOT NULL,
                         CORREO_INSTITUCIONAL VARCHAR(255) UNIQUE NOT NULL,
                         FOREIGN KEY (CEDULA) REFERENCES PERSONA(CEDULA)
);

CREATE TABLE ROL(
                    ID INT AUTO_INCREMENT PRIMARY KEY,
                    DESCRIPCION VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE ROLXPERSONA(
                            ID INT AUTO_INCREMENT PRIMARY KEY,
                            ROL VARCHAR(100) NOT NULL,
                            CEDULA INT NOT NULL,
                            FOREIGN KEY (ROL) REFERENCES ROL(DESCRIPCION),
                            FOREIGN KEY (CEDULA) REFERENCES PERSONA(CEDULA)
);

CREATE TABLE POBLACION_OBJETIVO(
                                   ID INT AUTO_INCREMENT PRIMARY KEY,
                                   DESCRIPCION VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE ACTIVIDAD_ECONOMICA(
                                    ID INT AUTO_INCREMENT PRIMARY KEY,
                                    CODIGO VARCHAR(30) UNIQUE NOT NULL,
                                    DESCRIPCION VARCHAR(255) NOT NULL
);

CREATE TABLE ENTIDAD(
                        ID INT AUTO_INCREMENT PRIMARY KEY,
                        DOCUMENTO VARCHAR(2) CHECK (DOCUMENTO='NI'),
                        NIT INT UNIQUE NOT NULL,
                        RAZON_SOCIAL VARCHAR(255) NOT NULL,
                        CONVENIO INT UNIQUE NOT NULL,
                        CEDULA_REP INT NOT NULL,
                        ACTIVIDAD_ECONOMICA VARCHAR(10) NOT NULL,
                        TELEFONO LONG NOT NULL,
                        CORREO VARCHAR(255) UNIQUE NOT NULL,
                        APROBACION BOOLEAN NOT NULL DEFAULT FALSE,
                        FOREIGN KEY (DOCUMENTO) REFERENCES TIPO_DOCUMENTO(TIPO),
                        FOREIGN KEY (CEDULA_REP) REFERENCES PERSONA(CEDULA),
                        FOREIGN KEY (ACTIVIDAD_ECONOMICA) REFERENCES ACTIVIDAD_ECONOMICA(CODIGO)

);

CREATE TABLE INTERLOCUTOR(
                             ID INT AUTO_INCREMENT PRIMARY KEY,
                             CEDULA INT NOT NULL,
                             CARGO VARCHAR(255) NOT NULL,
                             FOREIGN KEY (CEDULA) REFERENCES PERSONA(CEDULA)
);

CREATE TABLE TEMATICA_CENTRAL(
                                 ID INT AUTO_INCREMENT PRIMARY KEY,
                                 DESCRIPCION VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE PROYECTO(
                         ID INT AUTO_INCREMENT PRIMARY KEY,
                         CODIGO INT UNIQUE,
                         NOMBRE VARCHAR(255) NOT NULL,
                         DESCRIPCION VARCHAR(255) NOT NULL,
                         OBJETIVO VARCHAR(255) NOT NULL,
                         ENTIDAD INT NOT NULL,
                         LIDER INT NOT NULL,
                         UBICACION INT NOT NULL,
                         TEMATICA VARCHAR(255) NOT NULL,
                         APROBACION BOOLEAN,
                         ACTIVO BOOLEAN,
                         FOREIGN KEY (UBICACION) REFERENCES BARRIO(CODIGO),
                         FOREIGN KEY (OBJETIVO) REFERENCES POBLACION_OBJETIVO(DESCRIPCION),
                         FOREIGN KEY (ENTIDAD) REFERENCES ENTIDAD(NIT),
                         FOREIGN KEY (LIDER) REFERENCES INTERLOCUTOR(CEDULA),
                         FOREIGN KEY (TEMATICA) REFERENCES TEMATICA_CENTRAL(DESCRIPCION)
);

CREATE TABLE RECURSO(
                        ID INT AUTO_INCREMENT PRIMARY KEY,
                        DESCRIPCION VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE ASIGNACION_RECURSO(
                                   ID INT AUTO_INCREMENT PRIMARY KEY,
                                   PROYECTO INT NOT NULL,
                                   RECURSO VARCHAR(255) NOT NULL,
                                   CANTIDAD INT NOT NULL,
                                   FOREIGN KEY (PROYECTO) REFERENCES PROYECTO(CODIGO),
                                   FOREIGN KEY (RECURSO) REFERENCES RECURSO(DESCRIPCION)
);

CREATE TABLE TIPO_PROYECTO(
                              ID INT AUTO_INCREMENT PRIMARY KEY,
                              DESCRIPCION VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE PROYECTOXTIPO_PROYECTO(
                                       ID INT AUTO_INCREMENT PRIMARY KEY,
                                       PROYECTO INT NOT NULL,
                                       TIPO VARCHAR(255) NOT NULL,
                                       FOREIGN KEY (PROYECTO) REFERENCES PROYECTO(CODIGO),
                                       FOREIGN KEY (TIPO) REFERENCES TIPO_PROYECTO(DESCRIPCION)
);

CREATE TABLE TIPO_VINCULACION(
                                 ID INT AUTO_INCREMENT PRIMARY KEY,
                                 CODIGO INT UNIQUE,
                                 ASIGNATURA INT,
                                 DESCRIPCION VARCHAR(255) NOT NULL,
                                 FOREIGN KEY (ASIGNATURA) REFERENCES ASIGNATURA(CODIGO)
);

CREATE TABLE VINCULACION(
                            ID INT AUTO_INCREMENT PRIMARY KEY,
                            CODIGO INT UNIQUE,
                            ESTUDIANTE INT NOT NULL,
                            PROYECTO INT NOT NULL,
                            SEMESTRE VARCHAR(30) NOT NULL,
                            TIPO_VINCULACION INT NOT NULL,
                            CERTIFICADO BOOLEAN,
                            FOREIGN KEY (ESTUDIANTE) REFERENCES ESTUDIANTE(CEDULA),
                            FOREIGN KEY (PROYECTO) REFERENCES PROYECTO(CODIGO),
                            FOREIGN KEY (TIPO_VINCULACION) REFERENCES TIPO_VINCULACION(CODIGO),
                            FOREIGN KEY (SEMESTRE) REFERENCES SEMESTRE(CODIGO)
);

CREATE TABLE PERMISO(
                        ID INT AUTO_INCREMENT PRIMARY KEY,
                        CODIGO INT UNIQUE,
                        DESCRIPCION VARCHAR(255) NOT NULL
);

CREATE TABLE CREDENCIAL(
                           ID INT AUTO_INCREMENT PRIMARY KEY,
                           CODIGO INT UNIQUE,
                           PERMISO INT NOT NULL,
                           ROL VARCHAR(255) NOT NULL,
                           FOREIGN KEY (PERMISO) REFERENCES PERMISO(CODIGO),
                           FOREIGN KEY (ROL) REFERENCES ROL(DESCRIPCION)
);

CREATE TABLE ACTIVIDAD(
                          ID INT AUTO_INCREMENT PRIMARY KEY,
                          DESCRIPCION VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE ACTIVIDADXVINCULACION(
                                      ID INT AUTO_INCREMENT PRIMARY KEY,
                                      ACTIVIDAD VARCHAR(255) NOT NULL,
                                      VINCULACION INT NOT NULL,
                                      FOREIGN KEY (ACTIVIDAD) REFERENCES ACTIVIDAD(DESCRIPCION),
                                      FOREIGN KEY (VINCULACION) REFERENCES VINCULACION(CODIGO)
);

CREATE TABLE DECANATURA(
                           ID INT AUTO_INCREMENT PRIMARY KEY,
                           FACULTAD INT NOT NULL,
                           DECANO INT NOT NULL,
                           FECHA_INICIO DATE NOT NULL,
                           FECHA_FINAL DATE,
                           FOREIGN KEY (FACULTAD) REFERENCES FACULTAD(CODIGO),
                           FOREIGN KEY (DECANO) REFERENCES DIRECTIVO(CEDULA)
);

CREATE TABLE DIRECCION_PROGRAMA(
                                   ID INT AUTO_INCREMENT PRIMARY KEY,
                                   PROGRAMA INT NOT NULL,
                                   DIRECTOR INT NOT NULL,
                                   FECHA_INICIO DATE NOT NULL,
                                   FECHA_FINAL DATE,
                                   FOREIGN KEY (PROGRAMA) REFERENCES PROGRAMA(CODIGO),
                                   FOREIGN KEY (DIRECTOR) REFERENCES DIRECTIVO(CEDULA)
);

CREATE TABLE DIRECCION_DEPARTAMENTO(
                                       ID INT AUTO_INCREMENT PRIMARY KEY,
                                       DEPARTAMENTO INT NOT NULL,
                                       DIRECTOR INT NOT NULL,
                                       FECHA_INICIO DATE NOT NULL,
                                       FECHA_FINAL DATE,
                                       FOREIGN KEY (DEPARTAMENTO) REFERENCES DEPARTAMENTO(CODIGO),
                                       FOREIGN KEY (DIRECTOR) REFERENCES DIRECTIVO(CEDULA)
);

CREATE TABLE INSCRIPCION(
                            ID INT AUTO_INCREMENT PRIMARY KEY,
                            ACTIVA BOOLEAN,
                            ESTUDIANTE INT NOT NULL,
                            CLASE INT NOT NULL,
                            FOREIGN KEY (ESTUDIANTE) REFERENCES ESTUDIANTE(CEDULA),
                            FOREIGN KEY (CLASE) REFERENCES CLASE(CODIGO)
);

CREATE TABLE CALENDARIO(
                           ID INT AUTO_INCREMENT PRIMARY KEY,
                           TITULO VARCHAR(255) NOT NULL,
                           DESCRIPCION VARCHAR(255) NOT NULL,
                           FECHA DATE NOT NULL,
                           HORA_INICIO TIME NOT NULL,
                           HORA_FINAL TIME NOT NULL
);

CREATE TABLE PUBLICACION(
                            ID INT AUTO_INCREMENT PRIMARY KEY,
                            IMAGEN VARCHAR(255) NOT NULL,
                            TITULO VARCHAR(255) NOT NULL,
                            SUBTITULO VARCHAR(255),
                            DESCRIPCION VARCHAR(255) NOT NULL,
                            CATEGORIA VARCHAR(30) NOT NULL,
                            DURACION INT NOT NULL,
                            URL VARCHAR(255)
);