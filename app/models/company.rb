class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :ghs
  has_many :favorites, dependent: :destroy

  with_options presence: true do
    validates :company_name
    validates :postal_code, numericality: { only_integer: true, message: 'は半角数字で入力して下さい' }
    validates :address
    validates :name
    validates :phone_number
    validates :email
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
