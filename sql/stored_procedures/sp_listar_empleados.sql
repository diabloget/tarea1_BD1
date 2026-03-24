USE mi_db;
GO

-- StoreProcedure para listar empleados ordenados alfabéticamente
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
