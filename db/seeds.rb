if EstadosProducto.count.zero?
    EstadosProducto.create([
        { estado: 'activo' },
        { estado: 'inactivo' }
    ])
end

if TiposPago.count.zero?
    TiposPago.create([
        {pago: 'efectivo'},
        {pago: 'tarjeta'}
    ])
end

if EstadosPedido.count.zero?
    EstadosPedido.create([
        {estado: 'solicitado'},
        {estado: 'enviado'},
        {estado: 'entregado'}
    ])
end

if Region.count.zero?
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
