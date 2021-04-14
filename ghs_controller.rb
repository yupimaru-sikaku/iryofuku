class GhsController < ApplicationController
  before_action :search_gh, only: [:index, :search]

  def index
  end

  def new
    @gh = Gh.new
  end

  def create
    @gh = Gh.new(gh_params)
    if @gh.valid?
      @gh.save
      redirect_to admin_request_users_path
    else
      render :new
    end
  end

  def edit
    @gh = Gh.find(params[:id])
  end

  def update
    @gh = Gh.find(params[:id])

    @gh.valid?
    if @gh.update(gh_params)
      redirect_to gh_path(@gh.id)
    else
      render :edit
    end
  end

  def destroy
    @gh = Gh.find(params[:id])
    if @gh.user_id == current_user.id
      @gh.destroy
      redirect_to root_path
    end
  end

  def search
    @results = @p.result.where(flag: 1)
  end

  def show
    @gh = Gh.find(params[:id])
    @user = User.find(@gh.user_id)

    if user_signed_in?
      @currentUserEntry = RoomUser.where(user_id: current_user.id)
      @userEntry = RoomUser.where(user_id: @user.id)

      unless @user.id == current_user.id
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
        if @isRoom
        else
          @room = Room.new
          @entry = RoomUser.new
        end
      end
    end
  end

  private

  def search_gh
    @p = Gh.ransack(params[:q])
  end

  def gh_params
    params.require(:gh).permit(
      :address,
      :name,
      :station,
      :price,
      :house_rent,
      :food_expenses,
      :daily_necessities_costs,
      :utility_costs,
      :capacity,
      :availability,
      :phone_number,
      :fax_number,
      :email,
      :description,
      :construction_year,
      :construction_month,
      :prefecture_id,
      :osaka_city_id,
      :gender_id,
      :residential_style_id,
      :barrier_free_id,
      :use_holiday_id,
      :gh_service_id,
      :staff_time_id,
      :from_station_id,
      images: []
    ).merge(user_id: current_user.id)
  end
end
