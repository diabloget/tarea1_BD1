require 'tiny_tds'

def conectar_db
  TinyTds::Client.new(
    host:     ENV.fetch('DB_HOST', 'localhost'),
    port:     1433,
    username: 'sa',
    password: ENV.fetch('DB_PASSWORD', 'Bd1tarea!'),
    database: 'mi_db'
  )
end
