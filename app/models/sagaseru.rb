class Sagaseru < ApplicationRecord

  has_many :favorites, dependent: :destroy

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

  scope :search, -> (search_params) do
    return if search_params.blank?

    prefecture_id_is(search_params[:prefecture_id])
    .osaka_city_id_is(search_params[:osaka_city_id])
    .service_type_id_is(search_params[:service_type_id])
    .disability_type_id_is(search_params[:disability_type_id])
    .sex_id_is(search_params[:sex_id])
    .age_from(search_params[:age_from])
    .age_to(search_params[:age_to])
    
  end

  scope :prefecture_id_is, -> (prefecture_id) { where(prefecture_id: prefecture_id) if prefecture_id.present? }
  scope :osaka_city_id_is, -> (osaka_city_id) { where(osaka_city_id: osaka_city_id) if osaka_city_id.present? }
  scope :service_type_id_is, -> (service_type_id) { where(service_type_id: service_type_id) if service_type_id.present? }
  scope :disability_type_id_is, -> (disability_type_id) { where(disability_type_id: disability_type_id) if disability_type_id.present? }
  scope :sex_id_is, -> (sex_id) { where(sex_id: sex_id) if sex_id.present? }
  scope :age_from, -> (from) { where('? <= age', from) if from.present? }
  scope :age_to, -> (to) { where('age <= ?', to) if to.present? }


end
