class Api::V1::BorrowersController < ApplicationController
  before_action :authenticate_borrower!

  def index
    render json: { message: "Hello Borrower"}
  end

end
