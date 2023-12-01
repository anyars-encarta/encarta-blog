class ApplicationController < ActionController::Base
  # before_action :set_current_user

  # attr_reader :current_user

  # private

  # def set_current_user
  #   @current_user = User.first
  # end

  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
