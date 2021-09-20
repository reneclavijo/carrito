EstadosProducto.create([
    { estado: 'activo' },
    { estado: 'inactivo' }
])

TiposPago.create([
    {pago: 'efectivo'},
    {pago: 'tarjeta'}
])

EstadosPedido.create([
    {estado: 'solicitado'},
    {estado: 'enviado'},
    {estado: 'entregado'}
])

Region.create([
    { nombre: 'Primera Region' },
    { nombre: 'Segunda Region' },
    { nombre: 'Tercera Region' },
    { nombre: 'Cuarta Region' },
    { nombre: 'Quinta Region' },
    { nombre: 'Sexta Region' },
    { nombre: 'Septima Region' },
    { nombre: 'Octava Region' },
    { nombre: 'Novena Region' },
    { nombre: 'Décima Region' },
    { nombre: 'Décima Primera Region' },
    { nombre: 'Décima Segunda Region' },
    { nombre: 'Décima Tercera Region' },
    { nombre: 'Décima Cuarta Region' },
    { nombre: 'Décima Quinta Region' },
    { nombre: 'Décima Sexta Region' },
    { nombre: 'Sin región' }
])

# Destino.create(
#     { nombre: 'Sin destino', region: Region.find_by(nombre: 'Sin región') }
# )

Administrador.create([
    {nombre: 'rene', correo: 'rrodriguez@edutecno.com', password: Rails.application.credentials.admin[:password_admin1] },
    {nombre: 'admin', correo: 'admin@edutecno.com', password: Rails.application.credentials.admin[:password_admin2] }
])