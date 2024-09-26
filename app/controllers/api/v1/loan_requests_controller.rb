class Api::V1::LoanRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_borrower!, except: [:index. :show]
  before_action :set_loan_request, only: [:show, :update]

  def index
    @loan_requests = LoanRequest.all
    render json: @loan_requests
  end

  def show
    render json: @loan_request
  end

  def create
    @loan_requests = current_user.loan_requests.build(loan_requests_params)

    if @loan_requests.save
      render json: @loan_requests, status: :created
    else
      render josn: @loan_requests.errors, status: :unprocessable_entity
    end
  end

  def update

  end

  private

  def set_loan_request
    @loan_request = LoanRequest.find(params[:id])
  end

  def loan_requests_params
    params.require(:loan_requests).permit(:amount, :repayment_period, :interest_rate, :status, :loan_purpose)
  end
end
