require_relative '../models/empleado'

# Metodo auxiliar para formatear moneda en el servidor
helpers do
  def format_salario(valor)
    valor.to_f.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  end
end

# GET /api/empleados
# Retorna las filas de la tabla como fragmento HTML
get '/api/empleados' do
  empleados = Empleado.todos
  if empleados.empty?
    return '<tr class="empty-row"><td colspan="3">sin registros</td></tr>'
  end

  empleados.map do |e|
    "<tr>
      <td>#{e['id']}</td>
      <td>#{e['Nombre']}</td>
      <td class='salario'>₡ #{format_salario(e['Salario'])}</td>
    </tr>"
  end.join
end

# POST /api/empleados 
# Crea el empleado y notifica al cliente para refrescar la lista
# empleado/backend/controllers/empleados_controller.rb
post '/api/empleados' do
  nombre  = params['nombre'].to_s.strip
  salario_texto = params['salario'].to_s.strip

  # 1. Verificar campos vacíos (corrigiendo el typo)
  if nombre.empty? || salario_texto.empty?
    return '<span class="error">campos requeridos</span>'
  end

  # 2. Validación de negocio: salario positivo
  salario_valor = salario_texto.to_f
  if salario_valor <= 0
    return '<span class="error">el salario debe ser mayor a 0</span>'
  end

  # Si pasa las validaciones, se procede con la inserción
  Empleado.crear(nombre: nombre, salario: salario_valor)
  
  headers 'HX-Trigger' => 'listaActualizada'
  '<span class="ok">Empleado insertado satisfactoriamente</span>'
end