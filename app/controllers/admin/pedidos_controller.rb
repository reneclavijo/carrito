class Admin::PedidosController < Admin::AdminController
    
    include Admin::PedidosHelper

    before_action :asignar_pedido, only: [:mostrar, :editar, :actualizar]

    # GET
    def listar
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
        @destinos = Destino.select(:id, :nombre).order(nombre: :asc)
    end

    # POST
    def guardar
    end

    # PUT/PATCH
    def actualizar
        @datos_pedido = PedidosFormulario.new(params_pedidos)
        if @datos_pedido.valid?
            # continue
        else
            @destinos = Destino.select(:id, :nombre).order(nombre: :asc)
            render :editar
        end
    end

    # DELETE
    def eliminar
        #TODO analizar si vamos a elimnar el pedido o vamos a cambiar de estado
    end

    private 
    def params_pedidos
        params.require(:admin_pedidos_helper_pedidos_formulario).permit(:nombre, :correo, :telefono, :direccion, :destino_id)
    end

    def asignar_pedido
        
        @pedido = Pedido.find(params[:id])

    rescue ActiveRecord::RecordNotFound

        flash[:errors] = "Pedido #{params[:id]} no encontrado"
        redirect_to action: :listar
    end

end