class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %w[gender])
    devise_parameter_sanitizer.permit(:account_update, keys: [:gender, :name, { avatar: [:data] }])
  end
end
