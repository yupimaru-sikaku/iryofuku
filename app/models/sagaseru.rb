class Sagaseru < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :classification_id
  belongs_to_active_hash :disability_type_id
  belongs_to_active_hash :osaka_city_id
  belongs_to_active_hash :prefecture_id
  belongs_to_active_hash :service_type_id
  belongs_to_active_hash :sex_id

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
