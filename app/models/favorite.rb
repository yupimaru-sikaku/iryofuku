class Favorite < ApplicationRecord
  
  belongs_to :company
  belongs_to :fukushi

  validates_uniqueness_of :fukushi_id, scope: :company_id

end