class UsersController < ApplicationController

  def show
    favorites = current_user.favorites.pluck(:gh_id)
    @gh_favorite_lists = Gh.find(favorites)
  end

  def index
    @users = User.all
    @rooms = Room.all
  end

  def admin_request
  end
end
