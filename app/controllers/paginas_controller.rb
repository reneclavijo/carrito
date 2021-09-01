class PaginasController < ApplicationController

    before_action :validar_carro
    
    def inicio
        @todos_los_productos = Producto.select(:id, :nombre, :precio).order(nombre: :asc)
    end

    def carro
        
    end

    def formulario_pedido
        @destinos = Destino.select(:id, :nombre).order(nombre: :asc)
    end
    
end