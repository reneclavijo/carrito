class PedidosController < ApplicationController

    # GET
    def crear
        @datos_envio = DatosEnvio.new
        @destinos = Destino.select(:id, :nombre).order(nombre: :asc)
    end

    # POST
    def guardar
        
        puts params.require(:datos_envio).permit(:nombre, :correo, :direccion, :telefono)
        puts params.require(:datos_envio).permit(:destino_id)
    end

end