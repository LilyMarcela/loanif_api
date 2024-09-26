class CreateBorrowerProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :borrower_profiles do |t|

      t.timestamps
    end
  end
end
