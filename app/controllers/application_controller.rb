class ApplicationController < ActionController::Base
  before_action :configre_permited_parameters, if: :devise_controller?

  private

  def configre_permited_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname, :sexuality, :birth]
    )
  end
end
