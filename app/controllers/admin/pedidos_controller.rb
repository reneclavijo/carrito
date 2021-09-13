class Admin::PedidosController < Admin::AdminController
    
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

end