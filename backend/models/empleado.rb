require_relative '../config/database'

class Empleado
  # Retorna todos los empleados como array de hashes.
  def self.todos
    Database.query do |db|
      db.execute("EXEC dbo.sp_listar_empleados").map { |fila| fila }
    end
  end

  # Inserta un empleado y retorna el registro creado.
  def self.crear(nombre:, salario:)
    # Escapa comillas simples para evitar SQL Injection
    nombre_escapado  = nombre.to_s.strip.gsub("'", "''")
    salario_limpio   = salario.to_f

    Database.query do |db|
      db.execute(
        "EXEC dbo.sp_insertar_empleado @Nombre = N'#{nombre_escapado}', @Salario = #{salario_limpio}"
      ).first
    end
  end
end
