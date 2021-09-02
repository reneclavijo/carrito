class ClienteMailer < ApplicationMailer

    # Vista de correo
    def enviar_hola_mundo
        mail(
            to: 'rrodriguez@edutecno.com',
            subject: 'Saludos'
        )
    end

    def enviar_correo_pedido
        @datos_envio_correo = params[:datos_envio_correo]
        @pedido_correo      = params[:pedido_correo]
        
        mail(
            to: @datos_envio_correo.correo,
            subject: "Confirmación pedido"
        )
    end

end
