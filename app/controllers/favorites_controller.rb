class FavoritesController < ApplicationController

  before_action :checked_auth, only: [:index]

  def create
    # favoriteテーブルにcreate
    @iryo = Iryo.find(params[:iryo_id])
    favorite = Favorite.new(iryo_id: @iryo.id, company_id: current_company.id, is_contracted: "商談中")
    favorite.save

    # idに対応するIryoのis_contractedを"商談中"に変更
    @iryo.update_attributes(is_contracted: "商談中")
    
    # slackへ通知を送る
    # notifier = Slack::Notifier.new(ENV['WEBHOOK_URL'])
    # notifier.ping "#{current_company.company_name}が利用希望者、id番号：#{@iryo.id}をお気に入りに追加しました。"
    
  end
  
  def destroy
    # favoriteテーブルにdelete
    @iryo = Iryo.find(params[:iryo_id])
    favorite = current_company.favorites.find_by(iryo_id: @iryo.id)
    favorite.destroy
    
    # idに対応するIryoのis_contractedを"未"に変更
    @iryo.update_attributes(is_contracted: "未")

  end

  def index
    favorites = current_company.favorites.pluck(:iryo_id)
    @iryo_favorite_lists = Iryo.find(favorites)

    @iryo_favorites_lists_uncontracted = @iryo_favorite_lists.select do |i|
      i.is_contracted != "成約済"
    end

    @iryo_favorites_lists_contracted = @iryo_favorite_lists.select do |i|
      i.is_contracted == "成約済"
    end

  end

  private
  def checked_auth
    if company_signed_in?
    else
      redirect_to new_company_registration_path, flash: {success: "会員登録が必要です"}
    end
  end

end