class ApplicationController < ActionController::Base
  before_action :configre_permited_parameters, if: :devise_controller?
  before_action :basic_auth
  private

  def configre_permited_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname, :sexuality, :birth]
    )
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
