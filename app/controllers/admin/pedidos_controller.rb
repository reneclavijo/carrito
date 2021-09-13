class Admin::PedidosController < Admin::AdminController
    
    include Admin::PedidosHelper

    before_action :asignar_pedido, only: [:mostrar, :editar, :actualizar]

    # GET
    def listar
        saludar
        @pedidos = Pedido.select(:id, :codigo, :total, :created_at).order(created_at: :desc)
    end

    # GET
    def mostrar
        #TODO mostrar un pedido con todos los productos
    end

    # GET
    def crear
        #TODO mostra el formulario para crear un pedido con productos
    end

    # GET
    def editar
        #TODO editar la info de un pedido EXCEPTO el código
        # @datos_pedido = @pedido.datos_envio
        @datos_pedido = PedidosFormulario.new
        @datos_pedido.id            = @pedido.id
        @datos_pedido.nombre        = @pedido.datos_envio.nombre
        @datos_pedido.correo        = @pedido.datos_envio.correo
        @datos_pedido.telefono      = @pedido.datos_envio.telefono
        @datos_pedido.direccion     = @pedido.datos_envio.direccion
        @datos_pedido.destino_id    = @pedido.destino.id
    end

    # POST
    def guardar
    end

    # PUT/PATCH
    def actualizar
    end

    # DELETE
    def eliminar
        #TODO analizar si vamos a elimnar el pedido o vamos a cambiar de estado
    end

    private 
    def params_pedidos
    end

    def asignar_pedido
        
        @pedido = Pedido.find(params[:id])

    rescue ActiveRecord::RecordNotFound

        flash[:errors] = "Pedido #{params[:id]} no encontrado"
        redirect_to action: :listar
    end

end