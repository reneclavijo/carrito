# frozen_string_literal: true

class Admin::AdminController <  ApplicationController
    include ApplicationHelper

    before_action :validar_sesion_admin
end