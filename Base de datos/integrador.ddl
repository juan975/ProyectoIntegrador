-- Generated by Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   at:        2024-06-25 20:01:21 COT
--   site:      SQL Server 2008
--   type:      SQL Server 2008



CREATE TABLE armas 
    (
     codigo_arma INTEGER NOT NULL , 
     tipo_arma VARCHAR (50) NOT NULL , 
     arma VARCHAR (50) NOT NULL 
    )
GO

ALTER TABLE armas ADD CONSTRAINT armas_pk PRIMARY KEY CLUSTERED (codigo_arma)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE "Armas/Detenciones" 
    (
     armas_codigo_arma INTEGER NOT NULL , 
     detenciones_codigo_det INTEGER NOT NULL 
    )
GO

ALTER TABLE "Armas/Detenciones" ADD CONSTRAINT "Armas/Detenciones_PK" PRIMARY KEY CLUSTERED (armas_codigo_arma, detenciones_codigo_det)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE canton 
    (
     codigo_canton INTEGER NOT NULL , 
     nombre_canton VARCHAR (25) , 
     Provincias_codigo_provincia INTEGER NOT NULL 
    )
GO

ALTER TABLE canton ADD CONSTRAINT canton_pk PRIMARY KEY CLUSTERED (codigo_canton)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE detenciones 
    (
     codigo_det INTEGER NOT NULL , 
     presunta_flagrancia CHAR (2) , 
     codigo_iccs VARCHAR (15) , 
     tipo VARCHAR (15) , 
     presunta_subinfraccion VARCHAR (50) NOT NULL , 
     tipo_lugar VARCHAR (50) , 
     condicion VARCHAR (25) , 
     presunta_modalidad VARCHAR (50) , 
     presunta_infraccion VARCHAR (100) , 
     movilizacion VARCHAR (25) , 
     fecha_detencion_aprehension DATE NOT NULL , 
     hora_detencion_aprehension DATE , 
     lugar VARCHAR (50) , 
     parroquias_codigo_parroquia INTEGER NOT NULL , 
     vigilancias_codigo_vig INTEGER NOT NULL , 
     personas_id_persona INTEGER NOT NULL 
    )
GO

ALTER TABLE detenciones ADD CONSTRAINT detenciones_pk PRIMARY KEY CLUSTERED (codigo_det)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE parroquias 
    (
     codigo_parroquia INTEGER NOT NULL , 
     nombre_parroquia VARCHAR (25) , 
     Canton_codigo_canton INTEGER NOT NULL 
    )
GO

ALTER TABLE parroquias ADD CONSTRAINT parroquias_pk PRIMARY KEY CLUSTERED (codigo_parroquia)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE personas 
    (
     id_persona INTEGER NOT NULL , 
     nacionalidad VARCHAR (50) NOT NULL , 
     autoidentificacion_etnica VARCHAR (25) , 
     estatus_migratorio VARCHAR (15) , 
     numero_detenciones INTEGER NOT NULL , 
     estado_civil VARCHAR (15) , 
     nivel_de_instruccion VARCHAR (25) , 
     genero VARCHAR (15) , 
     edad INTEGER NOT NULL , 
     sexo VARCHAR NOT NULL 
    )
GO

ALTER TABLE personas ADD CONSTRAINT personas_pk PRIMARY KEY CLUSTERED (id_persona)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE provincias 
    (
     codigo_provincia INTEGER NOT NULL , 
     nombre_provincia VARCHAR (25) 
    )
GO

ALTER TABLE provincias ADD CONSTRAINT provincias_pk PRIMARY KEY CLUSTERED (codigo_provincia)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE vigilancias 
    (
     codigo_vig INTEGER NOT NULL , 
     nombre_zona VARCHAR (50) NOT NULL , 
     codigo_subcircuito VARCHAR (11) , 
     codigo_circuito VARCHAR (8) , 
     codigo_distrito VARCHAR (5) , 
     nombre_subcircuito VARCHAR (50) , 
     nombre_circuito VARCHAR (50) , 
     nombre_distrito VARCHAR (50) , 
     nombre_subzona VARCHAR (50) NOT NULL 
    )
GO

ALTER TABLE vigilancias ADD CONSTRAINT vigilancias_pk PRIMARY KEY CLUSTERED (codigo_vig)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE "Armas/Detenciones" 
    ADD CONSTRAINT "Armas/Detenciones_Armas_FK" FOREIGN KEY 
    ( 
     armas_codigo_arma
    ) 
    REFERENCES armas 
    ( 
     codigo_arma 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE "Armas/Detenciones" 
    ADD CONSTRAINT "Armas/Detenciones_Detenciones_FK" FOREIGN KEY 
    ( 
     detenciones_codigo_det
    ) 
    REFERENCES detenciones 
    ( 
     codigo_det 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE canton 
    ADD CONSTRAINT canton_provincias_fk FOREIGN KEY 
    ( 
     Provincias_codigo_provincia
    ) 
    REFERENCES provincias 
    ( 
     codigo_provincia 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE detenciones 
    ADD CONSTRAINT detenciones_parroquias_fk FOREIGN KEY 
    ( 
     parroquias_codigo_parroquia
    ) 
    REFERENCES parroquias 
    ( 
     codigo_parroquia 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE detenciones 
    ADD CONSTRAINT detenciones_personas_fk FOREIGN KEY 
    ( 
     personas_id_persona
    ) 
    REFERENCES personas 
    ( 
     id_persona 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE detenciones 
    ADD CONSTRAINT detenciones_vigilancias_fk FOREIGN KEY 
    ( 
     vigilancias_codigo_vig
    ) 
    REFERENCES vigilancias 
    ( 
     codigo_vig 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE parroquias 
    ADD CONSTRAINT parroquias_canton_fk FOREIGN KEY 
    ( 
     Canton_codigo_canton
    ) 
    REFERENCES canton 
    ( 
     codigo_canton 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             0
-- ALTER TABLE                             15
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
