class CompaniesController < ApplicationController

  before_action :checked_auth, only: [:show, :index_all]

  def show
    company = Company.find(params[:id])
  end

  def index_all
      @ghs = Gh.where(company_id: current_company.id)
  end

  private
  def checked_auth
    if company_signed_in?
    else
      redirect_to new_company_registration_path, flash: {success: "会員登録が必要です"}
    end
  end
end
