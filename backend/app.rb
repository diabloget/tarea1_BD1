require 'sinatra'
require 'json'

# Configuración del servidor
set :port, 3000
set :bind, '0.0.0.0'

# Sinatra sirve el frontend como archivos estáticos.
set :public_folder, File.join(__dir__, '..', 'frontend')
get '/' do
  send_file File.join(settings.public_folder, 'index.html')
end

# Registrar controladores
require_relative 'controllers/empleados_controller'
