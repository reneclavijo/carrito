module PedidosHelper
    class DatosEnvioFormulario
        include ActiveModel::Model

        attr_accessor :nombre
        attr_accessor :correo
        attr_accessor :direccion
        attr_accessor :telefono
        attr_accessor :destino_id

        validates(:nombre, presence: true)
        validates(:direccion, presence: true)
        validates(:correo, presence: true)
        validates(:telefono, presence: true)
        validates(:destino_id, presence: true)
    end
end