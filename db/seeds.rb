# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


TiposPago.find_or_create([
    {pago: 'efectivo'},
    {pago: 'tarjeta'},
])


if EstadosPedido.count == 0
    EstadosPedido.create([
        {estado: 'solicitado'},
        {estado: 'enviado'},
        {estado: 'entregado'}
    ])
end

if Region.count == 0
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
        { nombre: 'Décima Sexta Region' }
    ])
end