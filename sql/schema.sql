-- Define la base de datos y la tabla principal.
-- Ejecutar PRIMERO antes que los stored procedures.

CREATE DATABASE mi_db;
GO

USE mi_db;
GO

CREATE TABLE dbo.Empleado (
  id      INT IDENTITY(1,1) PRIMARY KEY,
  Nombre  VARCHAR(128) NOT NULL,
  Salario MONEY        NOT NULL
);
GO
