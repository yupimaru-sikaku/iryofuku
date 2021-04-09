class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :ghs
  has_many :favorites, dependent: :destroy

  with_options presence: true do
    validates :company_name
    validates :postal_code
    validates :address_city
    validates :address_street
    validates :name
    validates :phone_number
    validates :email
    validates :password
  end

  # postal_code
  # 半角数字のみ
  validates :postal_code, numericality: { only_integer: true, message: 'は半角数字（ハイフン無し）で入力して下さい' }

  # phone_numner
  # 半角数字のみ
  validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力して下さい' }

  # email
  # 一意性
  validates :email, uniqueness: { message: 'アドレスは既に使用されています' }

  # password
  # 8桁以上半角英数字混在
  validates :password, format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}/, message: 'は8桁以上の半角数字で入力して下さい' }



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
end
