class AgregarEstadoAProducto < ActiveRecord::Migration[6.1]
  def change
    add_reference :productos, :estados_producto, foreign_key: true, null: true
  end
end
