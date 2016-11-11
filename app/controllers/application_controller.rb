class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include PublicActivity::StoreController

  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    "http://www.delab.cl"
  end
end

module Spree
  module PermittedAttributes

    # bunch of code

    @@user_attributes = %i(
    	  email
      	nombre
      	rut
      	facturacion
      	telefono
        direccion
      	roles_mask
      	password
      	password_confirmation
        rutf
        rsocialf
        girof
        direccionf
        institucion
    )
    # bunch of code

  end
end