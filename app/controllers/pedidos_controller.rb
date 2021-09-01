class PedidosController < ApplicationController
    
    before_action :validar_carro

    # GET
    def crear
        @datos_envio = DatosEnvio.new
        @destinos = Destino.select(:id, :nombre).order(nombre: :asc)
    end

    # POST
    def guardar
        # primero guardar datos_envio
        # recuperar los datos necesarios para crear un pedido
        # guardar el pedido
        # relacionar los productos del carrito con los del pedido nuevo
        # eliminar el carrito cuando todo termine

        @datos_envio = DatosEnvio.new(params_datos_envio)
        if @datos_envio.save
            @pedido = Pedido.new(
                codigo: SecureRandom.hex(4).upcase,
                total: @carro.total,
                destino_id: params_destino[:destino_id],
                estados_pedido: EstadosPedido.find_by(estado: 'solicitado'),
                datos_envio: @datos_envio
            )
            if @pedido.save
                redirect_to action: :crear
            else
                @destinos = Destino.select(:id, :nombre).order(nombre: :asc)
                render :crear
            end
        else
            @destinos = Destino.select(:id, :nombre).order(nombre: :asc)
            render :crear            
        end
    end

    private 
    def params_datos_envio
        params.require(:datos_envio).permit(:nombre, :correo, :direccion, :telefono)
    end

    def params_destino
        params.require(:datos_envio).permit(:destino_id)
    end

end