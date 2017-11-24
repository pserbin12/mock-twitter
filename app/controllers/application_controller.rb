class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

protected

 def configure_permitted_parameters
     keys = [:username, :name, :email, :password, :password_confirmation, :city, :state, :bio, :avatar]
     devise_parameter_sanitizer.permit(:sign_up, keys: keys)
     devise_parameter_sanitizer.permit(:account_update, keys: keys)
   end
 end
