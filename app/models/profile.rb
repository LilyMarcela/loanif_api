class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :profilable, polymorphic: true
end
