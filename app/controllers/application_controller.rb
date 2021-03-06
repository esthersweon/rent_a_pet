class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  # NO COMMENTS! IS CHECK_OWNER BEING USED ANYWHERE?
  # before_action :check_owner, except: [:show]
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :roles, :about_me, :address, :city, :state, :zip ])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :about_me, :address, :city, :state, :zip ])
  end

  def check_owner
    if current_user != @user
      redirect_to root_path
    end
  end

end
