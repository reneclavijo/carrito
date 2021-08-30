class Producto < ApplicationRecord
  # todo: para clientes con rut \d{1,2}\.\d{3}\.\d{3}[-][0-9kK]{1}

  belongs_to :categoria
  has_many_attached :imagenes

  has_many :carros_productos
  has_many :carros, through: :carros_productos

  validates(:nombre, presence: true)
  validates(:nombre, uniqueness: true)
  
  validates(:precio, presence: true)
  validates(:precio, numericality: { greater_than_or_equal_to: 0 })

  validates(:descripcion,     presence: true)

  validates(:cantidad,  presence: true)
  validates(:cantidad, numericality: { greater_than_or_equal_to: 0 })

  validates(:categoria_id,    presence: true)
  
  validate(:max_imagenes)

  private

  def max_imagenes

    if self.imagenes.count > 4
      self.errors.add(:imagenes, "No puedes cargar más de 4 fotos")
      #self.errors[:imagenes] = "No puedes cargar más de 4 fotos"
    end

  end

end