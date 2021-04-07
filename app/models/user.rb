class User < ApplicationRecord

  with_options presence: true do
    validates :main_company_name
    validates :service_type
    validates :postal_code, numericality: { only_integer: true, message: 'は半角数字（ハイフン無し）で入力して下さい' }
    validates :address_city
    validates :address_street
    validates :address_building
    validates :human_name
    validates :phone_number
    validates :email
    validates :password
  end
  
  # 8桁以上半角英数字混在
  validates :password, format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}/, message: 'は8桁以上の半角数字で入力して下さい' }
  
  # 半角数字のみ
  validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力して下さい' }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  
end
