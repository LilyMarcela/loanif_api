class BorrowerProfile < ApplicationRecord
  has_one :profile, as: :profilable, dependent: :destroy
end
