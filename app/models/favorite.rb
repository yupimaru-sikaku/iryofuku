class Favorite < ApplicationRecord
  
  belongs_to :iryo
  belongs_to :company

  validates_uniqueness_of :iryo_id, scope: :company_id

end