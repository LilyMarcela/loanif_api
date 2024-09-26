class Api::V1::ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :update]


  def show
    rennder json: @profile
  end

  def create
    profilable = current_user.has_role?('borrower') ? BorrowerProfile.create : LenderProfile.create
    @profile = current_user.profiles.build(profile_params.merge(profilable: profilable))

    if @profile.save
      render json: @profile, status: :created
    else
      render json: @profile.errors, status: unprocessable_entity
    end

  end

  def update
    if @profile.update(profile_params)
      render json: @profile
    else
      render json: @profile.errors, status: unprocessable_entity
    end
  end

  private

  def set_profile
    @profile = current_user.profiles.find(param[:id])
  end

  def profile_params
    params.require(:profile).permit(:loan_purpose, financial_status)
  end
end
