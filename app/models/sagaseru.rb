class Sagaseru < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :classification
  belongs_to_active_hash :disability_type
  belongs_to_active_hash :osaka_city
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :service_type
  belongs_to_active_hash :sex

  with_options presence: true do
    validates :age, numericality: { only_integer: true, message: 'は半角英数字で入力して下さい'}
    validates :classification_id
    validates :disability_type_id
    validates :osaka_city_id
    validates :prefecture_id
    validates :service_type_id
    validates :sex_id
  end

end
