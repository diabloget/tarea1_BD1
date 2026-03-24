USE mi_db;
GO

CREATE OR ALTER PROCEDURE dbo.sp_insertar_empleado
  @Nombre  VARCHAR(128),
  @Salario MONEY
AS
BEGIN
  SET NOCOUNT ON;

  INSERT INTO dbo.Empleado (Nombre, Salario)
  VALUES (@Nombre, @Salario);

  -- Retorna el registro recién creado para confirmación en el API
  SELECT
    id,
    Nombre,
    Salario
  FROM dbo.Empleado
  WHERE id = SCOPE_IDENTITY();
END;
GO
