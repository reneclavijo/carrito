class SesionesController < ApplicationController

    # POST
    def iniciar_sesion
        # lógica de inciar sesión
        @usuario_actual = Administrador.find_by(correo: sesion_params[:correo])

        if @usuario_actual  # si el usuario es diferente de nil / osea si existe?
            if @usuario_actual.authenticate(sesion_params[:password])
                # cuando las credenciales estén bien
                session[:usuario_id] = @usuario_actual.id
                redirect_to admin_pedidos_path
            else
                # cuando la contraseña está mal
                flash[:error_sesion] = "Correo/Contraseña inválidos"
                redirect_to root_path
            end
        else
            # cuando no existe el usuario en la BD
            flash[:error_sesion] = "Usuario no registrado"
            redirect_to root_path
        end
    end

    # DELETE
    def cerrar_sesion
        session[:usuario_id] = nil
        redirect_to root_path
    end

    private
    
    def sesion_params
        params.permit(:correo, :password)
    end
end