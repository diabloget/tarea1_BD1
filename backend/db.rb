require 'tiny_tds'
def conectar_db
  TinyTds::Client.new(
    host:     ENV.fetch('DB_HOST', 'localhost'),
    username: 'sa',
    password: ENV.fetch('DB_PASSWORD', 'Password_Pro_2026!'),
    database: 'mi_db'
  )
end
