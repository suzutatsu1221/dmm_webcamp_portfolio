class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?



def after_sign_in_path(resource)
	root_path
end

def after_sign_out_path(resource)
	root_path
end

   protected

   def configure_permitted_parameters
   	added_attrs = [ :last_name, :first_name, :sex, :old, :password, :password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
   end
end
