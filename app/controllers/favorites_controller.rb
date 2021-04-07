class FavoritesController < ApplicationController

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

end