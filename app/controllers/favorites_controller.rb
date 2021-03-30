class FavoritesController < ApplicationController

  def create
    @sagaseru = Sagaseru.find(params[:sagaseru_id])
    favorite = current_company.favorites.new(sagaseru_id: @sagaseru.id)
    favorite.save
  end

  def destroy
    @sagaseru = Sagaseru.find(params[:sagaseru_id])
    favorite = current_company.favorites.find_by(sagaseru_id: @sagaseru.id)
    favorite.destroy
  end

end