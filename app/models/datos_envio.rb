class DatosEnvio < ApplicationRecord

    validates(:nombre, presence: true)
    validates(:direccion, presence: true)
    validates(:correo, presence: true)
    validates(:telefono, presence: true)
    
end
