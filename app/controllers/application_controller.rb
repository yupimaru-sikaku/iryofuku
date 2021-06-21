class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  # 新規登録
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      # 病院・利用者側
      :main_company_name,
      :sub_company_name,
      :service_type_other,
      :postal_code,
      :address_city,
      :address_street,
      :address_building,
      :human_name,
      :phone_number,
      :email,
      
      # 事業所側
      :company_name,
      :name,
      
      service_type: [],
      ])
      
      # 編集
      devise_parameter_sanitizer.permit(:account_update, keys: [
        # 病院・利用者側
      :main_company_name,
      :sub_company_name,
      :service_type_other,
      :postal_code,
      :address_city,
      :address_street,
      :address_building,
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