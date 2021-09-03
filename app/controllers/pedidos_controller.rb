class PedidosController < ApplicationController
    include PedidosHelper

    layout 'paginas'
    
    before_action :validar_carro

    # GET
    def crear
        # @datos_envio = DatosEnvio.new
        @datos_formulario = DatosEnvioFormulario.new
        consultar_destinos  # 🚧
    end

    # GET
    def pagar

    end

    # POST
    def guardar

        @datos_formulario = DatosEnvioFormulario.new(params_datos_formulario)

        # @datos_envio = DatosEnvio.new(params_datos_envio)
        
        if @datos_formulario.valid? 
            
            # @datos_envio.save
            @pedido = Pedido.new(
                codigo: SecureRandom.hex(4).upcase,
                total: @carro.total,
                destino_id: params_destino[:destino_id],
                estados_pedido: EstadosPedido.find_by(estado: 'solicitado'),
                datos_envio: @datos_envio
            )
            if @pedido.save
                
                @carro.carros_contenidos.each do |contenido|
                    DetallesPedido.create(
                        pedido: @pedido,
                        producto: contenido.producto,
                        cantidad: contenido.cantidad
                    )
                end
                
                
                enviar_correo       # 📬                    
                eliminar_carrito    # 🛒
                render :pagar       # 💰

            else
                consultar_destinos  # 🚧
                render :crear
            end
        else
            # @datos_envio.valid?
            # @datos_envio.errors.add(:destino_id, "Seleccione un destino")
            # @datos_envio.destino_id = params_destino[:destino_id]
            # @datos_envio = DatosEnvioFormulario.new
            # @datos_envio.nombre = "prueba"
            # @datos_envio.destino_id = 5
            
            consultar_destinos  # 🚧
            render :crear 
        end
    end

    private
    def params_datos_formulario
        params.require(:pedidos_helper_datos_envio_formulario).permit(:nombre, :correo, :direccion, :telefono, :destino_id)
    end

    def params_datos_envio
        params.require(:pedidos_helper_datos_envio_formulario).permit(:nombre, :correo, :direccion, :telefono)
    end

    def params_destino
        params.require(:pedidos_helper_datos_envio_formulario).permit(:destino_id)
    end

    def enviar_correo
        ClienteMailer.with(
            datos_envio_correo: @datos_envio, 
            pedido_correo: @pedido)
            .enviar_correo_pedido.deliver_later
    end

    def eliminar_carrito
        session[:carro_id] = nil
        @carro.destroy
    end

    def consultar_destinos
        @destinos = Destino.select(:id, :nombre).order(nombre: :asc)
    end

end