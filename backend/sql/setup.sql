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
CREATE PROCEDURE dbo.sp_listar_empleados AS
BEGIN
  SELECT id, Nombre, Salario FROM dbo.Empleado ORDER BY Nombre ASC;
END
GO
CREATE PROCEDURE dbo.sp_insertar_empleado
  @Nombre  VARCHAR(128),
  @Salario MONEY
AS
BEGIN
  INSERT INTO dbo.Empleado (Nombre, Salario) VALUES (@Nombre, @Salario);
END
GO
INSERT INTO dbo.Empleado (Nombre, Salario) VALUES ('David Robles', 350000), ('Franco Quiroz', 280000);
GO
