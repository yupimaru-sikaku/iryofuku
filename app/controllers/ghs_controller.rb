class GhsController < ApplicationController

  def new
    @gh = Gh.new
  end

  def create
    @gh = Gh.new(gh_params)
    if @gh.valid?
      @gh.save
      redirect_to root_path, flash: {success: "登録が完了しました"}
    else
      render :new
    end
  end


  private
  def gh_params
    params.require(:gh).permit(
      :main_company_name,
      :sub_company_name,
      :postal_code,
      :address,
      :phone_number,
      :fax_number,
      :email,
      :price_main,
      :price_sub1,
      :price_sub_cost1,
      :price_sub2,
      :price_sub_cost2,
      :price_sub3,
      :price_sub_cost3,
      :price_sub4,
      :price_sub_cost4,
      :price_sub5,
      :price_sub_cost5,
      :construction_year,
      :construction_month,
      :human_name,
      :human_phone_number,
      :human_email,
      :hp_url,
      :capacity,
      :availability,
      :station,
      :from_station,
      :gender,
      :residential_style,
      :staff_weekdaytime,
      :barrier_free,
      disability: [],
      valid_disability: [],
      staff_holidaytime: [],
    ).merge(
      company_id: current_company.id
    )
  end
end
