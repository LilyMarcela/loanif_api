class Api::V1::LendersController < ApplicationController
  before_action :authenticate_lender!

  def index
    render json: { message: "Hello Lender"}
  end
end
