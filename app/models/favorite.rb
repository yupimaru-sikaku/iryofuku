class Favorite < ApplicationRecord
  
  belongs_to :fukushi
  belongs_to :company

  validates_uniqueness_of :fukushi_id, scope: :company_id

end