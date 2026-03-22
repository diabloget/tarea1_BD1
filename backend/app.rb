require 'sinatra'
require_relative 'db'

set :public_folder, File.join(__dir__, 'public')
set :port, 3000
set :bind, '0.0.0.0'

# Muestra todos los empleados
get '/empleados' do
  content_type 'text/html'
  db = conectar_db
  filas = db.execute("EXEC dbo.sp_listar_empleados").map { |f| f }
  db.close
  filas.map { |f| "<tr><td>#{f['id']}</td><td>#{f['Nombre']}</td><td>#{f['Salario']}</td></tr>" }.join
end

# Inserta un empleado
post '/empleados' do
  content_type 'text/html'
  db = conectar_db
  nombre  = params[:nombre].to_s.strip.gsub("'", "''")
  salario = params[:salario].to_s.strip
  db.execute("EXEC dbo.sp_insertar_empleado '#{nombre}', #{salario}")
  db.close
  headers 'HX-Trigger' => 'empleadoInsertado'
  '<p>Insertado correctamente.</p>'
end

get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end
