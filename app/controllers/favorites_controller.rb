class FavoritesController < ApplicationController

  before_action :checked_auth, only: [:index]

  def create
    @sagaseru = Sagaseru.find(params[:sagaseru_id])
    favorite = current_company.favorites.new(sagaseru_id: @sagaseru.id)
    favorite.save

    # slackへ通知を送る
    notifier = Slack::Notifier.new(ENV['WEBHOOK_URL'])
    notifier.ping "#{current_company.company_name}が利用希望者、id番号：#{@sagaseru.id}をお気に入りに追加しました。"

  end

  def destroy
    @sagaseru = Sagaseru.find(params[:sagaseru_id])
    favorite = current_company.favorites.find_by(sagaseru_id: @sagaseru.id)
    favorite.destroy
  end

  def index
    favorites = current_company.favorites.pluck(:sagaseru_id)
    @sagaseru_favorite_lists = Sagaseru.find(favorites)
  end

  private
  def checked_auth
    if company_signed_in?
    else
      redirect_to new_company_registration_path, flash: {success: "会員登録が必要です"}
    end
  end

end