class Gh < ApplicationRecord

  belongs_to :company

  # with_options presence: true do
  #   validates :main_company_name
  #   validates :sub_company_name
  #   validates :postal_code
  #   validates :address
  #   validates :phone_number
  #   validates :email
  #   validates :price_main
  #   validates :construction_year
  #   validates :construction_month
  #   validates :human_name
  #   validates :human_phone_number
  #   validates :human_email
  #   validates :capacity
  #   validates :availability
  #   validates :station
  #   validates :from_station
  #   validates :gender
  # end

end
