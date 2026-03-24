USE mi_db;
GO

CREATE OR ALTER PROCEDURE dbo.sp_listar_empleados
AS
BEGIN
  SET NOCOUNT ON;

  SELECT
    id,
    Nombre,
    Salario
  FROM dbo.Empleado
  ORDER BY Nombre ASC;
END;
GO
