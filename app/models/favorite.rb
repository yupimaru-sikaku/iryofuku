class Favorite < ApplicationRecord
  
  belongs_to :company
  belongs_to :sagaseru

  validates_uniqueness_of :sagaseru_id, scope: :company_id

end