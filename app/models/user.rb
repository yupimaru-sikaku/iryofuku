class User < ApplicationRecord

  with_options presence: true do
    validates :main_company_name
    validates :service_type
    validates :postal_code, numericality: { only_integer: true, message: 'は半角数字で入力して下さい' }
    validates :address
    validates :human_name
    validates :phone_number
    validates :email
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
end
