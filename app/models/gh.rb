class Gh < ApplicationRecord
  
  belongs_to :company
  has_many_attached :images
  
  with_options presence: true do
    validates :main_company_name
    validates :sub_company_name
    validates :postal_code
    validates :address
    validates :phone_number
    validates :price_main
    validates :designated_year
    validates :designated_month
    validates :human_name
    validates :human_phone_number
    validates :human_email
    validates :capacity
    validates :availability
    validates :station
    validates :from_station
    validates :gender
  end

  # postal_code
  # 半角数字のみ
  validates :postal_code, numericality: { only_integer: true, message: 'は半角数字（ハイフン無し）で入力して下さい' }
  
  # phone_numner
  # 半角数字のみ
  validates :phone_number, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力して下さい' }
  
  # fax_number
  # 半角数字のみ
  # validates :fax_number, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力して下さい' }
  
  # price_main
  # 半角数字のみ
  validates :price_main, numericality: { only_integer: true, message: 'は半角数字（ハイフン無し）で入力して下さい' }
  
  # designated_yearとdesignated_month
  # 半角数字のみ
  with_options numericality: { only_integer: true, message: 'は半角数字（ハイフン無し）で入力して下さい' } do
    validates :designated_year
    validates :designated_month
  end
  
  # human_phone_number
  # 半角数字のみ
  validates :human_phone_number, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力して下さい' }
  
  # capacity
  # 半角数字のみ
  validates :capacity, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力して下さい' }
  
  # availability
  # 半角数字のみ
  validates :availability, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力して下さい' }

  



  # imageが添付されているかどうか
  def was_attached?
    image.attached?
  end
  
  # ghをテーブルにsaveする前に築年数を計算
  before_save do
    today = Time.zone.now
    # 現在の月 ＞ 築年 で築年数を計算
    if self.construction_year.nil?
      self.building_age = ""
    elsif self.construction_month.to_i > today.strftime("%m").to_i
      self.building_age = today.strftime("%Y").to_i - self.construction_year - 1.to_i
    else
      self.building_age = today.strftime("%Y").to_i - self.construction_year
    end
  end

  # 事業所の電話番号phone_numberを結合する
  # attr_accessor :phone_number_first, :phone_number_second, :phone_number_third

  # with_options format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力して下さい' } do
  #   validates :phone_number_first, presence: true
  # end
  
  # before_save do
  #   self.phone_number = phone_number_first + phone_number_second + phone_number_third 
  # end

  # 事業所のFAX番号fax_numberを結合する
  # attr_accessor :fax_number_first, :fax_number_second, :fax_number_third

  # before_save do
  #   self.fax_number = fax_number_first + fax_number_second + fax_number_third 
  # end


end
