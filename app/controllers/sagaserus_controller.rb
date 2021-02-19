class SagaserusController < ApplicationController

  def contact
  end

  def new
    @sagaseru = Sagaseru.new
  end

  def create
    @sagaseru = Sagaseru.new(sagaseru_params)

    if @sagaseru.valid?
      @sagaseru.save
      redirect_to root_path
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
  
end
