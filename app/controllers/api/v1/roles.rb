class Api::V1::RolesController < ApplicationController
  before_action :authenticate_user!
  

  def assign_role
    user = User.find(params[:user_id])
    role = Role.find_by(name: params[:role_name])

    if user.roles << role
      render json: { message: "Role #{ role.name} assigned to #{user.email}"}
    else
      render json: { error: "Failed to assign role"}, status: unprocessable_entity
    end
  end
end
