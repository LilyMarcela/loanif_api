class CreateLenderProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :lender_profiles do |t|

      t.timestamps
    end
  end
end
