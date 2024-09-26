# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_and_belongs_to_many :roles
  has_many :profiles, dependent: :destroy


  def has_role(role_name)
    role.exists?(name: role_name)
  end
end
