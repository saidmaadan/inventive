class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:fullname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:description])

    # devise_parameter_sanitizer.for(:sign_up) << :fullname
    #   devise_parameter_sanitizer.for(:account_update) << :fullname << :email << :password << :description
    end
  end


  

# devise_parameter_sanitizer.for(:account_update) << :fullname << :description
# devise_parameter_sanitizer.for(:sign_up) << :fullname
# devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname])
