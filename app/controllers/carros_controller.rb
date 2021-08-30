class CarrosController < ApplicationController
    before_action :validar_carro

    # POST
    def agregar_producto
        @carro.productos << Producto.find(params[:id_producto])
        # actualizar_total  
        redirect_to root_path
    end

    private 
    # def actualizar_total
    #     @carro.total = @carro.productos.map(&:precio).sum
    #     @carro.save
    # end

end