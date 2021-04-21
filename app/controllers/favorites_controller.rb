class FavoritesController < ApplicationController

  before_action :checked_auth, only: [:index]

  def create
    @fukushi = Fukushi.find(params[:fukushi_id])
    favorite = current_company.favorites.new(fukushi_id: @fukushi.id)
    favorite.save

    # slackへ通知を送る
    notifier = Slack::Notifier.new(ENV['WEBHOOK_URL'])
    notifier.ping "#{current_company.company_name}が利用希望者、id番号：#{@fukushi.id}をお気に入りに追加しました。"

  end

  def destroy
    @fukushi = Fukushi.find(params[:fukushi_id])
    favorite = current_company.favorites.find_by(fukushi_id: @fukushi.id)
    favorite.destroy
  end

  def index
    favorites = current_company.favorites.pluck(:fukushi_id)
    @fukushi_favorite_lists = Fukushi.find(favorites)
  end

  private
  def checked_auth
    if company_signed_in?
    else
      redirect_to new_company_registration_path, flash: {success: "会員登録が必要です"}
    end
  end

end