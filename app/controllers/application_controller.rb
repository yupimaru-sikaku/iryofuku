class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      # 病院・利用者側
      :main_company_name,
      :sub_company_name,
      :postal_code,
      :address,
      :human_name,
      :phone_number,
      :email,
      
      # 事業所側
      :company_name,
      :name,
      
      service_type: [],
    ])
  end
end
