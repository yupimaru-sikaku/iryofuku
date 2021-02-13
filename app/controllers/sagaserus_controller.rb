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
  
end
