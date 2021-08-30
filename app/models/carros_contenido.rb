class CarrosContenido < ApplicationRecord
  
  before_save :actualizar_total

  belongs_to :carro
  belongs_to :producto

  private
    
  def actualizar_total
      self.carro.total = self.carro.productos.map{ |producto| producto.precio }.sum
  end
end
