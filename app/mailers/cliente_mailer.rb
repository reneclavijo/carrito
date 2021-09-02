class ClienteMailer < ApplicationMailer

    # Vista de correo
    def enviar_hola_mundo
        mail(
            to: 'rrodriguez@edutecno.com',
            subject: 'Saludos'
        )
    end

end
