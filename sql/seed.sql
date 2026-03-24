-- Datos iniciales de prueba.
-- Ejecutar DESPUÉS de schema.sql y los stored procedures.

USE mi_db;
GO

INSERT INTO dbo.Empleado (Nombre, Salario)
VALUES
  ('David Robles',   300000),
  ('Franco Quiroz',  1800000),
  ('Priscila Delgado', 5000000), 
  ('Beatriz Barquero', 520000),
  ('Carlos Chinchilla', 380000), 
  ('Daniela Duarte', 610000),
  ('Esteban Estrada', 425000), 
  ('Fabiola Fonseca', 490000),
  ('Gabriel Gamboa', 555000), 
  ('Hellen Herrera', 310000),
  ('Ignacio Ibarra', 475000), 
  ('Jimena Jiménez', 630000),
  ('Kevin Kopper', 395000), 
  ('Laura Lizano', 515000),
  ('Mauricio Mora', 440000), 
  ('Natalia Navarro', 580000),
  ('Oscar Oviedo', 410000);
GO
