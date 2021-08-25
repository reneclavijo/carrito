# Carrito de compras

## Enunciado

Desarrollar una aplicación web que permita vender físicos a través de internet.

### Pasos para la compra

El usuario **cliente** es el que puede comprar nuestros productos por la aplicación. Para realizar una compra se debe seguir el siguiente proceso:

1. Lista de productos para seleccionar
2. Agregar a un carrito de compras
3. Ver el carrito de compras
4. Modificar la cantidad de productos en el carrito
5. Ingresar los datos para el envío
6. Mostrar un resumen y comenzar con el pago (revisar procesos bancario)
7. Enviar un correo al cliente con la boleta de la compra
8. Enviar una notificación/correo al dueño del negocio con la compra
9. Regresar al cliente a la vista de productos

#### Tomar en cuenta los siguientes recomendaciones para tener un flujo de ventas más tranquilo:

1. No es necesario que el cliente se registre para comprar
2. Al finalizar la venta, se puede generar un pedido con un código único para revisar su estado después
3. Los productos deben tener una imagen para saber qué estamos comprando
4. Descontar productos del "inventario" después de comprar
5. Que NO se pueda agregar productos que no tengan stock
6. Tomar en cuenta que no se pueden vender productos que no tenemos en stock
7. Buscar referencias de UI de market place (tienda online)

### Requerimientos del administrador

El administrador del negocio debería poder realizar las siguientes acciones:

1. Gestionar productos
2. Ver la lista de ventas
3. Gestionar los pedidos
4. Iniciar sesión
5. Ver los productos en un dashboard

## Actividades

- [x] Diseñar una primera versión de la base de datos con productos
  
- [x] Crear proyecto en rails
  
  ```bash
  # crear una aplicación en rails con postgresql configurado
  rails new carrito -d postgresql
  ```
  
- [x] Configurar rails para utilizar postgresql
  
  ```bash
  # abrir el archivo de credenciales de rails
  EDITOR="code --wait" rails credentials:edit
  ```
  
  ```yml
  # PostgreSQL. Versions 9.3 and up are supported.
  #
  # Install the pg driver:
  #   gem install pg
  # On macOS with Homebrew:
  #   gem install pg -- --with-pg-config=/usr/local/bin/pg_config
  # On macOS with MacPorts:
  #   gem install pg -- --with-pg-config=/opt/local/lib/postgresql84/bin/pg_config
  # On Windows:
  #   gem install pg
  #       Choose the win32 build.
  #       Install PostgreSQL and put its /bin directory on your path.
  #
  # Configure Using Gemfile
  # gem 'pg'
  #
  default: &default
    adapter: postgresql
    username: <%= Rails.application.credentials.db[:nombre_usuario] %>
    password: <%= Rails.application.credentials.db[:password] %>
    host: 127.0.0.1
    port: 5432
    # For details on connection pooling, see Rails configuration guide
    # https://guides.rubyonrails.org/configuring.html#database-pooling
    pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  
  development:
    <<: *default
    database: carrito_development
  
    # The specified database role being used to connect to postgres.
    # To create additional roles in postgres see `$ createuser --help`.
    # When left blank, postgres will use the default role. This is
    # the same name as the operating system user running Rails.
    #username: carrito
  
    # The password associated with the postgres role (username).
    #password:
  
    # Connect on a TCP socket. Omitted by default since the client uses a
    # domain socket that doesn't need configuration. Windows does not have
    # domain sockets, so uncomment these lines.
    #host: localhost
  
    # The TCP port the server listens on. Defaults to 5432.
    # If your server runs on a different port number, change accordingly.
    #port: 5432
  
    # Schema search path. The server defaults to $user,public
    #schema_search_path: myapp,sharedapp,public
  
    # Minimum log levels, in increasing order:
    #   debug5, debug4, debug3, debug2, debug1,
    #   log, notice, warning, error, fatal, and panic
    # Defaults to warning.
    #min_messages: notice
  
  # Warning: The database defined as "test" will be erased and
  # re-generated from your development database when you run "rake".
  # Do not set this db to the same as development or production.
  test:
    <<: *default
    database: carrito_test
  
  # As with config/credentials.yml, you never want to store sensitive information,
  # like your database password, in your source code. If your source code is
  # ever seen by anyone, they now have access to your database.
  #
  # Instead, provide the password or a full connection URL as an environment
  # variable when you boot the app. For example:
  #
  #   DATABASE_URL="postgres://myuser:mypass@localhost/somedatabase"
  #
  # If the connection URL is provided in the special DATABASE_URL environment
  # variable, Rails will automatically merge its configuration values on top of
  # the values provided in this file. Alternatively, you can specify a connection
  # URL environment variable explicitly:
  #
  #   production:
  #     url: <%= ENV['MY_APP_DATABASE_URL'] %>
  #
  # Read https://guides.rubyonrails.org/configuring.html#configuring-a-database
  # for a full overview on how database connection configuration can be specified.
  #
  production:
    <<: *default
    database: carrito_production
    username: carrito
    password: <%= ENV['CARRITO_DATABASE_PASSWORD'] %>
  
  ```
  
  ```bash
  rails db:create
  ```
  
- [x] Crear el modelo del Producto
  
  ```bash
  # crear el modelo de categoria
  rails g model Categoria categoria:string
  # crear el modelo producto
  rails g model Producto nombre:string precio:float descripcion:string cantidad:integer
  categoria:references
  # migrar cambios a la base de datos
  rails db:migrate
  ```
  
- [ ] Configurar ActiveStorage para permitir cargar 1 o muchas fotos al producto
  

[ ] Diseñar la siguiente versión de la base de datos que agregue el carrito de compras
[ ] Comenzar con el primer diseño del carrito

[ ] Compra
[ ] Pedido

[ ] Dashboard
[ ] Administrador