USE mi_db;
GO

-- StoreProcedure para insertar un empleado y validar que no exista
CREATE OR ALTER PROCEDURE dbo.sp_insertar_empleado
  @Nombre  VARCHAR(128),
  @Salario MONEY
AS
BEGIN
  SET NOCOUNT ON;
  BEGIN TRY
    -- Validar duplicado
    IF EXISTS (SELECT 1 FROM dbo.Empleado AS e WHERE e.Nombre = @Nombre)
    BEGIN
      RAISERROR('El nombre de empleado ya existe.', 16, 1);
      RETURN -1;
    END

    INSERT INTO dbo.Empleado (Nombre, Salario)
    VALUES (@Nombre, @Salario);

    SELECT e.id, e.Nombre, e.Salario
    FROM dbo.Empleado AS e
    WHERE e.id = SCOPE_IDENTITY();
  END TRY
  BEGIN CATCH
    DECLARE @msg NVARCHAR(500) = ERROR_MESSAGE();
    RAISERROR(@msg, 16, 1);
    RETURN -1;
  END CATCH
END;



GO
