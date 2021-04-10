class FavoritesController < ApplicationController
  def create
    @gh = Gh.find(params[:gh_id])
    favorite = current_user.favorites.new(gh_id: @gh.id)
    favorite.save
  end

  def destroy
    @gh = Gh.find(params[:gh_id])
    favorite = current_user.favorites.find_by(gh_id: @gh.id)
    favorite.destroy
  end

  def index
    favorites = current_user.favorites.pluck(:gh_id)
    @gh_favorite_lists = Gh.find(favorites)
  end
end
