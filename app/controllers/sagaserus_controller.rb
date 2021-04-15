class SagaserusController < ApplicationController

  before_action :checked_auth, only: [:index]


  def contact
  end

  def new
    @sagaseru = Sagaseru.new
  end

  def create
    @sagaseru = Sagaseru.new(sagaseru_params)

    if @sagaseru.valid?
      @sagaseru.save

      # slackへ通知を送る
      notifier = Slack::Notifier.new(ENV['WEBHOOK_URL'])
      notifier.ping "user:が作成されました。"

      redirect_to root_path, flash: {success: "登録が完了しました"}
    else
      render :new
    end

  end

  def index
    @search_params = sagaseru_search_params
    @sagaserus_search = Sagaseru.search(@search_params).order(updated_at: :desc)
  end

  private
  def sagaseru_params
    params.require(:sagaseru).permit(
      :age,
      :classification_id,
      :disability_type_id,
      :osaka_city_id,
      :prefecture_id,
      :service_type_id,
      :sex_id
    )
  end

  def sagaseru_search_params
    params.fetch(:search, {}).permit(
      :prefecture_id,
      :osaka_city_id,
      :service_type_id,
      :disability_type_id,
      :sex_id,
      :age_from,
      :age_to,
    )
  end

  def checked_auth
    if company_signed_in?
    else
      redirect_to new_company_registration_path, flash: {success: "会員登録が必要です"}
    end
  end
  
end
