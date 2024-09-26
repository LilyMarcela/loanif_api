module Api
  module V1
    class BaseController < ApplicationController
      before_action :authenticate_user!

      def authenticate_borrower!
          render json: { error: 'Unauthorized'}, status: unauthorized unless current_user&.has_role?('borrower')
      end

      def authenticate_lender!
        render json: { error: 'Unauthorized'}, status: unauthorized unless current_user&.has_role?('lender')
      end
    end
  end
end