class CarrosController < ApplicationController
    before_action :validar_carro

    # POST
    def agregar_producto
        @carro.productos << Producto.find(params[:id_producto])
        redirect_to root_path
    end

end